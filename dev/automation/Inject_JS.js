/*

  Inject_JS

  Lookup for keyword "Inject_js" in all zs files
  to evaluate block and inject its result

*/


const fs = require('fs')
const glob = require('glob')
const _ = require('lodash') // eslint-disable-line no-unused-vars

const {injectInFile, write, end, config, naturalSort, getCSV, getFurnaceRecipes, least_common_multiplier} = require('../lib/utils.js') // eslint-disable-line no-unused-vars

function loadText(filename) {
  return fs.readFileSync(filename, 'utf8')
}

// ----------------------------------

const occurences = []

glob.sync('scripts/**/*.zs').forEach(filePath => {
  const zsfileContent = loadText(filePath)
  for (const match of zsfileContent.matchAll(/\\* *Inject_js(\([\s\S\n\r]*?\))\*\//gm)) {
    const lineNumber = zsfileContent.substring(0, match.index).split('\n').length
    occurences.push({
      filePath: filePath,
      command: match[1].trim(),
      line: lineNumber,
      below: zsfileContent.substring(match.index + match[0].length),
    })
  }
})

write(`  🐲 Found ${occurences.length} Inject_js blocks. Evaluating `)

occurences.forEach(cmd => {
  let injectValue = ''
  if(/^\(\s*\)$/gmi.test(cmd.command)) {
    injectValue = '# Empty Injection' 
  } else {
    try {
      injectValue ||= eval(cmd.command)
    } catch (error) {
      console.log('\nComment block Error.\nFile:', cmd.filePath, '\nLine:', cmd.line, '\nCommand:', cmd.command)
      console.error(error)
      return
    }
  }

  const injectString = Array.isArray(injectValue)
    ? injectValue.join('\n')
    : injectValue
  
  injectInFile(cmd.filePath, cmd.command, '\n/**/', '*/\n'+injectString)
  write('.')
})

end()

// Test section:
console.log(

)