
/**
 * @file Inject_JS
 * 
 * @description Lookup for keyword "Inject_js" in all zs files
 * to evaluate block and inject its result
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check
/* eslint-disable no-unused-vars */

const glob = require('glob')
const _ = require('lodash')

const {
  injectInFile,
  write,
  end,
  config,
  naturalSort,
  getCSV,
  getFurnaceRecipes,
  least_common_multiplier,
  loadText,
  saveText,
  isODExist,
  isItemExist,
  isJEIBlacklisted,
  getPDF,
  loadJson,
  getItemOredictSet,
} = require('../lib/utils.js')

function saveObjAsJson(obj, filename) {
  saveText(JSON.stringify(obj, null, 2), filename)
}

const reverseStr = (s) => [...s].reverse().join('')
const reverseNaturalSort = (a,b) => naturalSort(reverseStr(a), reverseStr(b))

const itemize = (id,meta) => id + (meta!=0 ? ':'+meta : '')
const $ = (source, id, meta, count, nbt, modifiers) => {
  return `<${source}:${id}${meta&&meta!='0'?':'+meta:''}>${nbt?'.withTag('+nbt+')':''}${modifiers||''}${parseInt(count)>1?' * '+(count|0):''}`
}


// ----------------------------------

const init = module.exports.init = async function() {
  const occurences = []

  glob.sync('scripts/**/*.zs').forEach(filePath => {
    const zsfileContent = loadText(filePath)
    for (const match of zsfileContent.matchAll(/\\*\s*Inject_js((\(|\{)[\s\S\n\r]*?(\)|\}))\*\//gm)) {
      const lineNumber = zsfileContent.substring(0, match.index).split('\n').length
      const [, whole, p1, p2] = match
      occurences.push({
        filePath: filePath,
        capture: whole,
        command: (p1=='{' && p2=='}') ? '(()=>' + whole.trim() + ')()' : whole.trim(),
        line: lineNumber,
        below: zsfileContent.substring(match.index + match[0].length),
      })
    }
  })

  write(`  🐲 Found ${occurences.length} Inject_js blocks. Evaluating `)

  for (const cmd of occurences) {
    let injectValue = ''
    if(/^\(\s*\)$/gmi.test(cmd.capture)) {
      injectValue = '# Empty Injection' 
    } else {
      try {
        const evalStr = `(async()=>{return ${cmd.command}})()`
        injectValue ||= await eval(evalStr)
      } catch (error) {
        console.log('\nComment block Error.\nFile: '+cmd.filePath+':'+cmd.line, '\nCapture:', cmd.capture)
        console.error(error)
        return
      }
    }

    const injectString = Array.isArray(injectValue)
      ? injectValue.join('\n')
      : injectValue
    
    injectInFile(cmd.filePath, cmd.capture, '\n/**/', '*/\n'+injectString)
    write('.')
  }

  end()
}

if(require.main === module) init()

// Test section:
;(async()=>console.log(
// (()=>{



// })()
))()