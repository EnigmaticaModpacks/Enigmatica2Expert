/* 
Helper script to prepare several files for fast acces
Lunch with NodeJS
*/

/*=============================================
=                Variables                    =
=============================================*/
const fs = require('fs')
const path = require('path')
const replace = require('replace-in-file')
const del = require('del')
const csvParseSync = require('csv-parse/lib/sync')
const { execSync } = require('child_process')


/*=============================================
=                   Helpers                   =
=============================================*/
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


module.exports.begin = function(...args) {
  process.stdout.write(args.join('\t'))
}

module.exports.write = module.exports.begin

module.exports.end = function(...args) {
  process.stdout.write(args.length ===0 ? ' done' :args.join('\t'))
  console.log()
}

// # ######################################################################
// #
// # Utils
// #
// # ######################################################################

module.exports.globs = function(globs) {
  return del.sync(globs, {dryRun: true, forced: true})
}


function renameKeys(obj, fn) {  
  if (typeof fn !== 'function') {
    return obj
  }

  const keys = Object.keys(obj)
  const result = {}
  

  for (let i = 0; i < keys.length; i++) {
    let key = keys[i]
    if (key == '__'){ continue }

    const val = obj[key]
    const str = fn(key, val)
    if (typeof str === 'string' && str !== '') {
      key = str
    }
    result[key] = val
  }

  // Check if its array rather than object
  const newKeys = Object.keys(result)
  let isArray = (newKeys[0] == 0)
  if (isArray) {for (let i = 1; i < newKeys.length; i++){
      if (parseInt(newKeys[i]) != parseInt(newKeys[i-1])+1) {isArray = false}
  }}
  return (isArray ? Object.values(result) : result)
}

function renameDeep(obj, cb) {
  const type = typeof(obj)

  if (type !== 'object' && type !== 'array') {
    throw new Error('expected an object')
  }

  let res = []
  if (type === 'object') {
    obj = renameKeys(obj, cb)
  }
  if (!Array.isArray(obj)) { res = {} }

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
module.exports.renameDeep = renameDeep


function config(cfgPath) {
  const wholePath = 'config/' + cfgPath
  let cfg = fs.readFileSync(wholePath, 'utf8')
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
}
module.exports.config = config

const naturalSort = (a,b)=>a.localeCompare(b, undefined, {numeric: true, sensitivity: 'base'})
module.exports.naturalSort = naturalSort

module.exports.getCSV = filename=>csvParseSync(fs.readFileSync(filename,'utf8'), {columns: true})

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
    .matchAll(/^furnace\.addRecipe\((?<output><(?<out_id>[^>]+?)(?::(?<out_meta>\*|\d+))?>(?<out_tail>(\.withTag\(\{.*?\}\))?( \* \d+)?)?), (?<input><(?<in_id>[^>]+?)(?::(?<in_meta>\*|\d+))?>(?<in_tail>(\.withTag\(\{.*?\}\))?( \* \d+)?)?), .+\)$/gm)
  ].map(m=>m.groups).sort((a,b)=>naturalSort(a.input,b.input))
}

module.exports.least_common_multiplier = (...arr) => {
  const gcd = (x, y) => (!y ? x : gcd(y, x % y))
  const _lcm = (x, y) => (x * y) / gcd(x, y)
  return [...arr].reduce((a, b) => _lcm(a, b))
}