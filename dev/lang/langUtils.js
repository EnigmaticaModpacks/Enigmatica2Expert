
const fs = require('fs')
const path = require('path')

function serializeCommandChars(array) {
  return array
    .map(l=>l.replace(/%(\S)/gm, '<<$1>>'))
    .map(l=>l.replace(/§(\S)/gm, '{{$1}}'))
    .map(l=>l.replace(/\\(\S)/gm, '(($1))'))
    .join('\n')
}

module.exports.saveForGoogle = function(filename, array) {

  let summ = 0
  let chunkNumber = 0
  let chunks = []

  function saveChunks() {
    fs.writeFileSync(
      path.resolve(__dirname, `unloc/${filename}${chunkNumber}.txt`),
      serializeCommandChars(chunks)
    )
  }
  
  for (const line of array) {
    if(summ>30000) {
      saveChunks()
      summ=0
      chunkNumber++
      chunks = []
    }
    chunks.push(line)
    summ += line.length
  }
  saveChunks()
  
}

module.exports.loadAfterForGoogle = function(filename) {
  return fs.readFileSync(path.resolve(__dirname, `uploc/${filename}.txt`),'utf8')
    .split('\n')
    .map(l=>l.replace(/< ?<(\S ?)> ?>/gm,     '%$1'))
    .map(l=>l.replace(/\{ ?\{(\S ?)\} ?\}/gm, '§$1'))
    .map(l=>l.replace(/\( ?\((\S ?)\) ?\)/gm, '\\$1'))
}