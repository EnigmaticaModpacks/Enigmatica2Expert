/*

  Inject_JS

  Lookup for keyword "Inject_js" in all zs files
  to evaluate block and inject its result

*/


const glob = require('glob')
const fs = require('fs')
const csvParseSync = require('csv-parse/lib/sync')

const {injectInFile, write, end, config, naturalSort} = require('../lib/utils.js') // eslint-disable-line no-unused-vars

function loadText(filename, encoding = 'utf8') {
  return fs.readFileSync(filename, encoding)
}

// ----------------------------------
// Functions that can be used in .zs files
// ----------------------------------
const _ = require('lodash') // eslint-disable-line no-unused-vars
function getCsv(filePath) { // eslint-disable-line no-unused-vars
  return csvParseSync(loadText(filePath), {columns: true})
}
// ----------------------------------

const occurences = []

glob.sync('scripts/**/*.zs').forEach(filePath => {
  var zsfileContent = loadText(filePath)
  for (const match of zsfileContent.matchAll(/\\* *Inject_js(\([\s\S\n\r]*?\))\*\//gm)) {
    var lineNumber = zsfileContent.substring(0, match.index).split('\n').length
    occurences.push({
      filePath: filePath,
      command: match[1],
      line: lineNumber,
      below: zsfileContent.substring(match.index + match[0].length),
    })
  }
})

write(`  🐲 Found ${occurences.length} Inject_js blocks. Evaluating `)

occurences.forEach(cmd => {
  let injectString = ''
  
  try {
    injectString = eval(cmd.command)
  } catch (error) {
    console.log('\nComment block Error.\nFile:', cmd.filePath, ' Line:', cmd.line)
    console.error(error)
    return
  }
  
  injectInFile(cmd.filePath, cmd.command, '\n/**/', '*/\n'+injectString)
  write('.')
})

end()

console.log(

)