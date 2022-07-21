import { readFileSync, writeFileSync } from 'fs'
import path from 'path'

function serializeCommandChars(array) {
  return array
    .map((l) => l.replace(/%(\S)/gm, '<<$1>>'))
    .map((l) => l.replace(/§(\S)/gm, '{{$1}}'))
    .map((l) => l.replace(/\\(\S)/gm, '(($1))'))
    .join('\n')
}

export function saveForGoogle(filename, array) {
  let summ = 0
  let chunkNumber = 0
  let chunks = []

  function saveChunks() {
    writeFileSync(
      relative(`unloc/${filename}${chunkNumber}.txt`),
      serializeCommandChars(chunks)
    )
  }

  for (const line of array) {
    if (summ > 30000) {
      saveChunks()
      summ = 0
      chunkNumber++
      chunks = []
    }
    chunks.push(line)
    summ += line.length
  }
  saveChunks()
}

export function loadAfterForGoogle(filename) {
  return readFileSync(relative(`uploc/${filename}.txt`), 'utf8')
    .split('\n')
    .map((l) => l.replace(/< ?<(\S ?)> ?>/gm, '%$1'))
    .map((l) => l.replace(/\{ ?\{(\S ?)\} ?\}/gm, '§$1'))
    .map((l) => l.replace(/\( ?\((\S ?)\) ?\)/gm, '\\$1'))
}
