
const { execSync } = require('child_process')

const version = execSync('git describe --tags --abbrev=0').toString().trim()
console.log('version :>> ', version)

const logFromLastTag = execSync(`git log ${version}..HEAD --pretty=format:"%s"`).toString().trim()

// Blacklist
const blacklistedSymbols = [
  // '📝'
]

const map = {}
logFromLastTag.split('\n').forEach(l=>{
  const match = l.match(/^(?<symbol>[^a-zA-Z]{1,2}) (?<subject>.+)/)
  if(!match) return (map['other'] ??= []).push(l)

  const s = match.groups.symbol
  if(blacklistedSymbols.includes(s)) return

  return (map[s] ??= []).push(match.groups.subject)
})


const annotations = [
  ['🟡', 'Mods changes'],
  ['🧩', 'Mods configs'],
  ['✏️', 'Recipes'],
  ['🔵', 'Mods', [
    ['🔨', 'Tinker\'s Construct'],
    ['🐀', 'Rats'],
    ['🦯', 'Thaumcraft'],
    ['🌿', 'Patchouli'],
  ]],
  ['🧱', 'Technical'],
]

function outputList(s, desc, level) {
  const tab = ' '.repeat(level*2)
  console.log(' '.repeat(Math.max(0,(level-1)*2)) + (level>0?'- ':'') + '#'.repeat(level) + `## ${s} ${desc}\n`)
  for (const subject of map[s]??[]) {
    console.log(tab + `- ${subject}`)
  }
  map[s] = undefined
  console.log('')
}

function outputMd(arr=annotations, level=0) {
  for (const [s, desc, subcat] of arr) {
    outputList(s, desc, level)
    if(subcat) outputMd(subcat, level+1)
  }
}

outputMd(annotations)

//! TODO: output also other fields, not listed in [annotations]