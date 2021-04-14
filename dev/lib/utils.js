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


/*=============================================
=                   Helpers                   =
=============================================*/
function loadText(filename, encoding = 'utf8') {
  return fs.readFileSync(path.resolve(__dirname, filename), encoding)
}
module.exports.loadText = loadText

module.exports.loadJson = function(filename) {
  return JSON.parse(loadText(filename))
}

function saveText(txt, filename) {
  var filePath = path.resolve(__dirname, filename)
  fs.mkdirSync(path.dirname(filePath), { recursive: true })
  fs.writeFileSync(filePath, txt)
}
module.exports.saveText = saveText

module.exports.saveObjAsJson = function(obj, filename) {
  saveText(JSON.stringify(obj, null, 2), filename)
}

module.exports.readdir = function(folderPath) {
  return fs.readdirSync(path.resolve(__dirname, folderPath))
}

var escapeRegex = function(string) {
  return string.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&')
}
module.exports.escapeRegex = escapeRegex

var matchBetween = function(str, begin, end, regex) {
  var sub = str
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

  var keys = Object.keys(obj)
  var result = {}
  

  for (var i = 0; i < keys.length; i++) {
    var key = keys[i]
    if (key == '__'){ continue }

    var val = obj[key]
    var str = fn(key, val)
    if (typeof str === 'string' && str !== '') {
      key = str
    }
    result[key] = val
  }

  // Check if its array rather than object
  var newKeys = Object.keys(result)
  var isArray = (newKeys[0] == 0)
  if (isArray) {for (var i = 1; i < newKeys.length; i++){
      if (parseInt(newKeys[i]) != parseInt(newKeys[i-1])+1) {isArray = false}
  }}
  return (isArray ? Object.values(result) : result)
}

function renameDeep(obj, cb) {
  var type = typeof(obj)

  if (type !== 'object' && type !== 'array') {
    throw new Error('expected an object')
  }

  var res = []
  if (type === 'object') {
    obj = renameKeys(obj, cb)
  }
  if (!Array.isArray(obj)) { res = {} }

  for (var key in obj) {
    if (key == '__'){ continue }
    if (obj.hasOwnProperty(key)) {
      var val = obj[key]
      if (typeof(val) === 'object' || typeof(val) === 'array') {
        res[key] = renameDeep(val, cb)
      } else {
        res[key] = val
      }
    }
  }
  return res
}
module.exports.renameDeep = renameDeep


function config(cfgPath) {
  var wholePath = 'config/' + cfgPath
  var cfg = fs.readFileSync(wholePath, 'utf8')
  cfg = cfg
    .replace(/^ *#.*$/gm, '') // Remove comments
    .replace(/^~.*$/gm, '') // config version
    .replace(/^ *(\w+|"[^"]+") *{ *$/gm, '$1:{') // class name
    .replace(/^ *} *$/gm, '},') // end of block
    .replace(/^ *\w:(?:([\w.]+)|"([^"]+)") *= *(.*)$/gm, (match, p1, p2, p3)=>{

      return (isNaN(p3) && !(p3 === 'true' || p3 === 'false')) || p3===''
      ? `"${p1||p2}":"${p3}",`
      : `"${p1||p2}":${p3},`
    }) // simple values

  // Replace lists
  cfg = cfg.replace(/^ *\w:(?:([\w.]+)|"([^"]+)") *< *[\s\S\n\r]*?> *$/gm, (match, p1, p2)=>{
    var lines = match.split('\n')
    var content = lines.slice(1, lines.length-1)
    return [
      `"${p1||p2}"` + ': [',
      ...content.map(l=>`"${l.trim()}",`),
      '],'
    ].join('\n')
  })


  var result
  try {
    result = eval(`({${cfg}})`)
  } catch (error) {
    console.log('Parsing config error. File: ', wholePath)
    console.error(error)
    saveText(
      'return{'+
      cfg.replace(/\n\n+/gm, '\n')
      +'}',
      path.resolve(__dirname, '_error_'+cfgPath.split('.').slice(0, -1).join('.')+'.js'))
  }

  return result
}
module.exports.config = config

module.exports.naturalSort = (a,b)=>a.localeCompare(b, undefined, {numeric: true, sensitivity: 'base'})