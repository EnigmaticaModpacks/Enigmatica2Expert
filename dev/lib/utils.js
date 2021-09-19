/**
 * @file Helper script to prepare several files for fast acces
 * Lunch with NodeJS
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

/*=============================================
=                Variables                    =
=============================================*/
const fs = require('fs')
const path = require('path')
const replace = require('replace-in-file')
const del = require('del')
const csvParseSync = require('csv-parse/lib/sync')
const { execSync } = require('child_process')
const pdf = require('pdf-parse')

/*=============================================
=            Internal Helpers                 =
=============================================*/

/**
 * A function that result would be hashed based on input string
 * @type {Map<function(string): any, Object<string, string>>}
 */
const hashMap = new Map()

/**
 * @template T
 * @param {function(string): T} fn
 * @returns {function(string): T} wrapped function
 */
function createHashedFunction(fn) {
  /**
   * @param {string} fnParam 
   * @returns {*}
   */
  var inner = (fnParam) => {
    /** @type any */
    const result = fn(fnParam)
    const hash = hashMap.get(fn) ?? {}
    hash[fnParam] = result
    hashMap.set(fn, hash)
    return result
  }

  return inner
}

/*=============================================
=                   Helpers                   =
=============================================*/

/**
 * Extract file name without extension
 * @param {string} filePath Full or relative path to file
 * 
 * @example subFileName('C:/main.js') // 'main'
 */
module.exports.subFileName = filePath => path.basename(filePath).split('.').slice(0, -1).join('.')

/**
 * Load file from disk or from hash
 * @returns {string}
 */
const loadText = module.exports.loadText = createHashedFunction(filename => 
  fs.readFileSync(filename, 'utf8')
)

/**
 * Load JSON file from disk or from hash
 * @param {string} filename
 */
module.exports.loadJson = createHashedFunction(filename => JSON.parse(loadText(filename)))

/**
 * Load CSV file from disk or from hash
 * @param {string} filename
 * @return {Object[]}
 */
const getCSV = module.exports.getCSV = createHashedFunction(filename => 
  csvParseSync(fs.readFileSync(filename,'utf8'), {columns: true})
)



const config = module.exports.config = createHashedFunction(cfgPath => {
  const wholePath = 'config/' + cfgPath
  let cfg = loadText(wholePath)
    .replace(/^ *#.*$/gm, '') // Remove comments
    .replace(/^~.*$/gm, '') // config version
    .replace(/^ *(\w+|"[^"]+") *{ *$/gm, '$1:{') // class name
    .replace(/^ *} *$/gm, '},') // end of block
    .replace(/^ *\w:(?:([\w.]+)|"([^"]+)") *= *(.*)$/gm, (match, p1, p2, p3)=>{
      return (isNaN(p3) && !(p3 === 'true' || p3 === 'false')) || p3===''
      ? `"${p1||p2}":"${p3}",`
      : `"${p1||p2}":${p3},`
    }) // simple values  
    .replace(/^ *\w:(?:([\w.]+)|"([^"]+)") *< *[\s\S\n\r]*?> *$/gm, (match, p1, p2)=>{
      const lines = match.split('\n')
      const content = lines.slice(1, lines.length-1)
      return [
        `"${p1||p2}"` + ': [',
        ...content.map(l=>`"${l.trim()}",`),
        '],'
      ].join('\n')
    })// Replace lists


  /**
   * @type {Object}
   */
  let result
  try {
    result = eval(`({${cfg}})`)
  } catch (error) {
    console.log('Parsing config error. File: ', wholePath)
    console.error(error)
    fs.writeFileSync(
      path.resolve(__dirname, '_error_'+cfgPath.split('.').slice(0, -1).join('.')+'.js'),
      'return{'+
      cfg.replace(/\n\n+/gm, '\n')
      +'}'
    )
  }

  return result
})

/**
 * Load CSV file from disk or from hash
 * @param {string} filename
 * @return {Object[]}
 */
module.exports.getPDF = createHashedFunction(async filename => 
  (await pdf(fs.readFileSync(filename))).text
)
/**
 * Save Text but create folder if needed
 * @param {string} txt
 * @param {string} filename
 */
module.exports.saveText = function(txt, filename) {
  fs.mkdirSync(path.dirname(filename), { recursive: true })
  fs.writeFileSync(filename, txt)
}

/** @type {Set<string>} */
let isBlocks
/**
 * @param {string} itemID
 */
module.exports.isBlock = (itemID) => (
  isBlocks ??= new Set(getCSV('config/tellme/blocks-csv.csv').map(o=>o['Registry name']))
).has(itemID)

/** @type {Set<string>} */
let existOreDicts
module.exports.isODExist = (oreName) => (
  existOreDicts ??= new Set(getCSV('config/tellme/items-csv.csv').map(o=>o['Ore Dict keys'].split(',')).flat())
).has(oreName)

/** @type {Set<string>} */
let existItems
module.exports.isItemExist = (id) => (
  existItems ??= new Set(getCSV('config/tellme/items-csv.csv').map(o=>o['Registry name']))
).has(id.split(':').slice(0,2).join(':'))

/** @type {Set<string>} */
let jeiBlacklist
module.exports.isJEIBlacklisted = (def,meta) => (
  jeiBlacklist ??= new Set(config('jei/itemBlacklist.cfg').advanced.itemBlacklist)
).has(def) || jeiBlacklist.has(def+':'+(meta??'0'))


let itemsTree

/** @type {function(string,string=):Set<string>} */
module.exports.getItemOredictSet = (id,meta='0') => ((itemsTree ??= 
  getCSV('config/tellme/items-csv.csv').reduce(
  (result, o) => (
    (result[o['Registry name']] ??= {})[o['Meta/dmg']] = new Set(o['Ore Dict keys'].split(','))
  , result), {})
)[id] ??= {})[meta=='*' ? 0 : meta] ??= new Set()


const escapeRegex = function(string) {
  return string.replace(/[/\\^$*+?.()|[\]{}]/g, '\\$&')
}
module.exports.escapeRegex = escapeRegex

const matchBetween = function(str, begin, end, regex) {
  let sub = str
  if (begin) sub = str.substr(str.indexOf(begin) + begin.length)
  if (end)   sub = sub.substr(0, sub.indexOf(end))
  return [...sub.matchAll(regex)]
}
module.exports.matchBetween = matchBetween


module.exports.transpose = function(a) {
  return Object.keys(a[0]).map(function(c) {
      return a.map(function(r) { return r[c] })
  })
}


module.exports.injectInFile = function(filename, keyStart, keyFinish, text) {
  try {
    return replace.sync({
      files: filename,
      from: new RegExp(escapeRegex(keyStart) + '[\\s\\S\n\r]*?' + escapeRegex(keyFinish), 'm'),
      to: keyStart+text+keyFinish,
    })
  }
  catch (error) {
    console.error('Inject Error occurred:', error)
  }
}


module.exports.write = module.exports.begin = function(...args) {
  process.stdout.write(args.join('\t'))
}

module.exports.end = function(...args) {
  process.stdout.write(args.length ===0 ? ' done' :args.join('\t'))
  console.log()
}

// # ######################################################################
// #
// # Utils
// #
// # ######################################################################

/**
 * @param {string | readonly string[]} globs
 */
module.exports.globs = function(globs) {
  return del.sync(globs, {dryRun: true, force: true})
}

/**
 * Rename Key callback
 * @callback renameKeysCallback
 * @param {string} objKey
 * @param {*} objValue
 * @returns {string}
 */

/**
 * Rename each key in object by callback result
 *
 * @param {{}} obj
 * @param {renameKeysCallback} cb Rename Key callback
 * @return {{}} 
 */
function renameKeys(obj, cb) {  
  if (typeof cb !== 'function') return obj

  const keys = Object.keys(obj)
  const result = {}

  for (let i = 0; i < keys.length; i++) {
    let key = keys[i]
    if (key == '__'){ continue }

    const val = obj[key]
    const str = cb(key, val)
    if (typeof str === 'string' && str !== '') {
      key = str
    }
    result[key] = val
  }

  return result
}

/**
 * Rename all object keys in object
 *
 * @param {*} obj
 * @param {renameKeysCallback} cb
 * @return {*} 
 */
const renameDeep = module.exports.renameDeep = (obj, cb) => {
  const type = typeof(obj)

  if (type !== 'object' && !Array.isArray(obj)) {
    throw new Error('expected an object')
  }

  if (type === 'object') obj = renameKeys(obj, cb)

  /** @type {{}|[]} */
  let res = Array.isArray(obj) ? [] : {}

  for (const key in obj) {
    if (key == '__'){ continue }
    const val = obj[key]
    if (typeof(val) === 'object' || Array.isArray(val)) {
      res[key] = renameDeep(val, cb)
    } else {
      res[key] = val
    }
  }
  return res
}

const naturalSort = (a,b)=>a.localeCompare(b, undefined, {numeric: true, sensitivity: 'base'})
module.exports.naturalSort = naturalSort

module.exports.isPathHasChanged = pPath=>{
  try {
    return !!execSync('git diff HEAD '+pPath).toString().trim()
  } catch (error) {
    return true
  }
}

let furnaceRecipesHashed = undefined
module.exports.getFurnaceRecipes = ()=>{
  return furnaceRecipesHashed ??= [...fs.readFileSync('crafttweaker.log', 'utf8')
    .matchAll(/^furnace\.addRecipe\((?<output><(?<out_id>[^>]+?)(?::(?<out_meta>\*|\d+))?>(?<out_tail>(\.withTag\((?<out_tag>\{.*?\})\))?( \* (?<out_amount>\d+))?)?), (?<input><(?<in_id>[^>]+?)(?::(?<in_meta>\*|\d+))?>(?<in_tail>(\.withTag\((?<in_tag>\{.*?\})\))?( \* (?<in_amount>\d+))?)?), .+\)$/gm)
  ].map(m=>m.groups).sort((a,b)=>naturalSort(a.input,b.input))
}

module.exports.least_common_multiplier = (...arr) => {
  const gcd = (x, y) => (!y ? x : gcd(y, x % y))
  const _lcm = (x, y) => (x * y) / gcd(x, y)
  return [...arr].reduce((a, b) => _lcm(a, b))
}