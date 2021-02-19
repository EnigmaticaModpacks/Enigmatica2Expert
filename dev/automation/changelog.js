
const { execSync } = require('child_process')

const version = execSync('git describe --tags --abbrev=0').toString().trim()
console.log('version :>> ', version)

const logFromLastTag = execSync(`git log ${version}..HEAD`).toString().trim()

// Blacklist
const blacklistedSymbols = [
  // '📝'
]

const map = {}
logFromLastTag.split(/^commit .*$/gm).forEach(commitBlock=>{
  const commitMatch = commitBlock.match(/^Author: .*?\nDate: .*?\n\n(?<message>.*)/ms)
  if(!commitMatch) return
  const commitMessage = commitMatch.groups.message.trim()

  const match = commitMessage.match(/^(?<symbol>[^a-zA-Z ]{1,2}) (?<subject>.+)/sm)
  const s = match?.groups.symbol
  if(!match || !s.trim()) return (map['other'] ??= []).push(commitMessage)

  if(blacklistedSymbols.includes(s)) return

  // Remove leading spaces frow commit message
  const trimmedSubject = match.groups.subject
    .split('\n')
    .map(l=>l.replace(/^ {4}/, ''))
    .filter((l,i)=>l||i!=1)
    .join('\n')

  return (map[s] ??= []).push(trimmedSubject)
})


const annotations = [
  ['🟢', 'New Mods'],
  ['🔴', 'Removed Mods'],
  ['🟡', 'Mods changes'],
  ['🧩', 'Configs'],
  ['✏️', 'Recipes'],
  ['📖', 'Quest Book'],
  ['🌍', 'World Generation'],
  ['🔵', 'Mods', [
    ['🔨', 'Tinker\'s Construct'],
    ['🐉', 'Ice and Fire'],
    ['🐀', 'Rats'],
    ['🦯', 'Thaumcraft'],
    ['🌿', 'Patchouli'],
    ['🖽', 'Little Tiles'],
    ['🎲', 'Random Things'],
    ['📑', 'Tips'],
    ['🟨', 'Recurrent Complex'],
    ['🛢️', 'Immersive Engineering'],
    ['🗃️', 'Loot tables'],
    ['🏪', 'Requious Fracto'],
  ]],
  ['🔄', 'Misc Changes'],
  ['🧱', 'Technical'],
  ['🚧', 'Develop'],
]

function outputList(s, desc, level) {
  if(!map[s]?.length) return

  const tab = ' '.repeat(level*2)
  console.log(' '.repeat(Math.max(0,(level-1)*2)) + (level>0?'- ':'') + '#'.repeat(level) + `## ${s} ${desc}\n`)
  for (const subject of map[s]??[]) {
    subject.split('\n').forEach((l,i)=>{
      console.log(tab + `${i==0?'- ':'  > '}${l}`)
    })
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

for (const [key, arr] of Object.entries(map)) {
  if(!arr) continue
  arr.forEach(l => {
    outputList(key, '❓❓', 0)
  })  
}