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
 * @type {Map<function(string): any, Object<string, {mtime: number, result: any}>>} x is filename
 */
const hashMap = new Map()

/**
 * @template T
 * @param {function(string): T} fn
 * @returns {function(string): T} wrapped function
 */
function createHashedFunction(fn) {
  /**
   * @param {string} filename
   * @returns {T}
   */
  const inner = (filename) => {
    const hashFunction = hashMap.get(fn) ?? {}
    const oldResult = hashFunction[filename]
    const mtime = fs.statSync(filename).mtime.getTime()
    if(oldResult && oldResult.mtime === mtime) {
      return oldResult.result
    }

    const result = fn(filename)
    hashFunction[filename] = {result, mtime}
    hashMap.set(fn, hashFunction)
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
const subFileName = module.exports.subFileName = filePath => path.basename(filePath).split('.').slice(0, -1).join('.')

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
const loadJson = module.exports.loadJson = createHashedFunction(filename => JSON.parse(loadText(filename)))

/**
 * Load CSV file from disk or from hash
 * @param {string} filename
 */
module.exports.getCSV = createHashedFunction(/** @return {Object<string, string>[]} */filename => 
  csvParseSync(fs.readFileSync(filename,'utf8'), {columns: true})
)

/**
 * Load CSV file from disk or from hash
 * @param {string} filename
 */
module.exports.getPDF = createHashedFunction(async filename => 
  (await pdf(fs.readFileSync(filename))).text
)



module.exports.config = createHashedFunction(filename => {
  let cfg = loadText(filename)
    .replace(/^ *#.*$/gm, '') // Remove comments
    .replace(/^~.*$/gm, '') // config version
    .replace(/^ *(\w+|"[^"]+") *{ *$/gm, '$1:{') // class name
    .replace(/^ *} *$/gm, '},') // end of block
    .replace(/^ *\w:(?:([\w.]+)|"([^"]+)") *= *(.*)$/gm, (match, p1, p2, p3)=>{
      return (isNaN(p3) && !(p3 === 'true' || p3 === 'false')) || p3===''
      ? `"${p1||p2}":"${p3.replace(/"/g, '\\"')}",`
      : `"${p1||p2}":${ p3.replace(/"/g, '\\"')},`
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
    console.log('Parsing config error. File: ', filename)
    console.error(error)
    fs.writeFileSync(
      path.resolve(__dirname, '_error_'+subFileName(filename)+'.js'),
      'return{'+
      cfg.replace(/\n\n+/gm, '\n')
      +'}'
    )
  }

  return result
})

/**
 * Save Text but create folder if needed
 * @param {string} txt
 * @param {string} filename
 */
const saveText = module.exports.saveText = function(txt, filename) {
  fs.mkdirSync(path.dirname(filename), { recursive: true })
  fs.writeFileSync(filename, txt)
}

/**
 * Save object in file
 * @param {string} obj
 * @param {string} filename
 */
module.exports.saveObjAsJson = function(obj, filename) {
  saveText(JSON.stringify(obj, null, 2), filename)
}

const escapeRegex = module.exports.escapeRegex = function(string) {
  return string.replace(/[/\\^$*+?.()|[\]{}]/g, '\\$&')
}

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
      countMatches: true
    })
  }
  catch (error) {
    console.error('Inject Error occurred:', error)
  }
}


module.exports.write = module.exports.begin = function(...args) {
  process.stdout.write(args.join('\t'))
}

const end = module.exports.end = function(...args) {
  process.stdout.write(args.length ===0 ? ' done' :args.join('\t'))
  console.log()
}

module.exports.done = end

// # ######################################################################
// #
// # Utils
// #
// # ######################################################################

/**
 * @typedef {Object} BlockDrop
 * @property {string} name
 * @property {number} meta
 * @property {number} length
 */

/**
 * @typedef {Object} DropEntry
 * @property {string} stack
 * @property {number} [chance]
 * @property {[left:number, right:number][] | [left:number, right:number]} [luck]
 */

/**
 * Add new drop list
 * If second parameter is null - remove entry
 * @param {string} block_stack
 * @param {DropEntry[]} [dropList]
 * @param {boolean} [isSkipSaving]
 */
const setBlockDrops = module.exports.setBlockDrops = function(block_stack, dropList, isSkipSaving=false) {
  const [source, id, _block_meta] = block_stack.split(':')
  const block_meta = parseInt(_block_meta||'0')
  const block_id = `${source}:${id}`

  let newObj
  
  if(dropList?.length) {
    newObj = {
      name: block_id,
      meta: block_meta,
      length: dropList.length
    }

    dropList.forEach((o,i)=>{
      const [drop_source, drop_id, drop_meta] = o.stack.split(':')
      newObj['name'+i] = `${drop_source}:${drop_id}`
      newObj['meta'+i] = parseInt(drop_meta||'0')
      for (let j=0;j<4;j++) newObj[j+'chance'+i] = o.chance||100.0
      for (let j=0;j<4;j++) newObj[j+  'pair'+i] = `{
  "left": ${o.luck?.[j]?.[0] ?? o.luck?.[0] ?? 1},
  "right": ${o.luck?.[j]?.[1] ?? o.luck?.[1] ?? 1}\n}`
    })
  }

  /** @type {BlockDrop[]} */
  const arr = loadJson('config/BlockDrops/blockdrops.txt')
  const entryIndex = arr.findIndex(o=>o.name===block_id && o.meta===block_meta)

  if(newObj)
    if(entryIndex !== -1) Object.assign(arr[entryIndex], newObj)
    else(arr.push(newObj))
  else
    arr.splice(entryIndex, 1)
  
  if(!isSkipSaving) {
    saveBlockDrops(arr)
  }

  return arr
}


/**
 * 
 * @param {{block_stack:string, dropList:DropEntry[]}[]} [blockDropList]
 */
module.exports.setBlockDropsList = function(blockDropList) {
  let arr
  blockDropList.forEach(o => arr=setBlockDrops(o.block_stack, o.dropList, true))
  return saveBlockDrops(arr)
}

/**
 * @param {BlockDrop[]} arr
 */
function saveBlockDrops(arr) {
  saveText(
    JSON.stringify(arr, null, 2)
      .replace(/^(\s+"\d+chance\d+": \d+)(,?)$/gm, '$1.0$2')
    , 'config/BlockDrops/blockdrops.txt'
  )
  return arr
}

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

/**
 * 
 * @param {string} a
 * @param {string} b
 */
const naturalSort = module.exports.naturalSort = (a,b)=>a.localeCompare(b, undefined, {numeric: true, sensitivity: 'base'})


module.exports.isPathHasChanged = pPath=>{
  try {
    return !!execSync('git diff HEAD '+pPath).toString().trim()
  } catch (error) {
    return true
  }
}

let furnaceRecipesHashed = undefined
module.exports.getFurnaceRecipes = ()=>{
  if(furnaceRecipesHashed) return furnaceRecipesHashed

  const text = loadText('crafttweaker.log')
  const lookup = '\nFurnace Recipes:\n'
  const startIndex = text.indexOf(lookup)
  if(startIndex == -1) return undefined

  const sub = text.substring(startIndex + lookup.length)
  const endIndex = sub.indexOf('\nRecipes:\n')
  
  const subSub = endIndex == -1 ? sub : sub.substring(0, endIndex)

  return furnaceRecipesHashed = [...subSub
    .matchAll(/^furnace\.addRecipe\((?<output><(?<out_id>[^>]+?)(?::(?<out_meta>\*|\d+))?>(?<out_tail>(\.withTag\((?<out_tag>\{.*?\})\))?( \* (?<out_amount>\d+))?)?), (?<input><(?<in_id>[^>]+?)(?::(?<in_meta>\*|\d+))?>(?<in_tail>(\.withTag\((?<in_tag>\{.*?\})\))?( \* (?<in_amount>\d+))?)?), .+\)$/gm)
  ].map(m=>m.groups).sort((a,b)=>naturalSort(a.input,b.input))
}

module.exports.least_common_multiplier = (...arr) => {
  const gcd = (x, y) => (!y ? x : gcd(y, x % y))
  const _lcm = (x, y) => (x * y) / gcd(x, y)
  return [...arr].reduce((a, b) => _lcm(a, b))
}