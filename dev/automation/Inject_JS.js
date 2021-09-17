/*

  Inject_JS

  Lookup for keyword "Inject_js" in all zs files
  to evaluate block and inject its result

*/


const fs = require('fs')
const path = require('path')
const glob = require('glob')
const pdf = require('pdf-parse') // eslint-disable-line no-unused-vars
const _ = require('lodash') // eslint-disable-line no-unused-vars

const {injectInFile, write, end, config, naturalSort, getCSV, getFurnaceRecipes, least_common_multiplier} = require('../lib/utils.js') // eslint-disable-line no-unused-vars

function loadText(filename) {
  return fs.readFileSync(filename, 'utf8')
}

function saveText(txt, filename) { // eslint-disable-line no-unused-vars
  fs.mkdirSync(path.dirname(filename), { recursive: true })
  fs.writeFileSync(filename, txt)
}
function saveObjAsJson(obj, filename) { // eslint-disable-line no-unused-vars
  saveText(JSON.stringify(obj, null, 2), filename)
}

const allItems = getCSV('config/tellme/items-csv.csv')

const reverseStr = (s) => [...s].reverse().join('')
const reverseNaturalSort = (a,b) => naturalSort(reverseStr(a), reverseStr(b)) // eslint-disable-line no-unused-vars
const isODExist   = (oreName) => !!allItems.find(o=>o['Ore Dict keys'].split(',').includes(oreName)) // eslint-disable-line no-unused-vars
const isItemExist =    (item) => { // eslint-disable-line no-unused-vars
  const s = item.split(':')
  const def = s.length > 2 ? s.slice(0,2).join(':') : item
  return !!allItems.find(o=>o['Registry name']===def)
}

const itemize = (id,meta) => id + (meta!=0 ? ':'+meta : '') // eslint-disable-line no-unused-vars
const $ = (source, id, meta, count, nbt, modifiers) => { // eslint-disable-line no-unused-vars
  return `<${source}:${id}${meta?':'+meta:''}>${nbt?'.withTag('+nbt+')':''}${modifiers||''}${parseInt(count)>1?' * '+(count|0):''}`
}

const jei_blacklist = config('jei/itemBlacklist.cfg').advanced.itemBlacklist
const isBlacklisted = (id) => jei_blacklist.includes(id) || jei_blacklist.includes(id+':0') // eslint-disable-line no-unused-vars


// ----------------------------------

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

occurences.forEach(async (cmd) => {
  let injectValue = ''
  if(/^\(\s*\)$/gmi.test(cmd.capture)) {
    injectValue = '# Empty Injection' 
  } else {
    try {
      const evalStr = `(async()=>{return ${cmd.command}})()`
      injectValue ||= await eval(evalStr)
    } catch (error) {
      console.log('\nComment block Error.\nFile:', cmd.filePath, '\nLine:', cmd.line, '\nCapture:', cmd.capture)
      console.error(error)
      return
    }
  }

  const injectString = Array.isArray(injectValue)
    ? injectValue.join('\n')
    : injectValue
  
  injectInFile(cmd.filePath, cmd.capture, '\n/**/', '*/\n'+injectString)
  write('.')
})

end()

// Test section:
;(async()=>console.log(
// (()=>{



// })()
))()