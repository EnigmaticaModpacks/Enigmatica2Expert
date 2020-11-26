
const glob = require('glob')
const fs = require('fs')
const path = require('path')
const _ = require('lodash')
const csvParseSync = require('csv-parse/lib/sync')

const {injectInFile} = require('../lib/utils.js')

function loadText(filename, encoding = 'utf8') {
  return fs.readFileSync(filename, encoding)
}


function getCsv(filePath) { // eslint-disable-line no-unused-vars
  return csvParseSync(loadText(filePath), {columns: true})
}

var occurences = []

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


occurences.forEach(cmd => {
  let injectString = ''
  
  try {
    injectString = eval(cmd.command)
  } catch (error) {
    console.log('Comment block Error.\nFile:', cmd.filePath, ' Line:', cmd.line)
    console.error(error)
    return
  }
  
  injectInFile(cmd.filePath, cmd.command, '*/\n'+injectString, '\n/**/')

})