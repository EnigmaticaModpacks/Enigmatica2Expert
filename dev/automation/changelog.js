
const { execSync } = require('child_process')
const fs = require('fs')
const path = require('path')
const {write, end} = require('../lib/utils.js')
const {getModsIds, formatRow} = require('./modsDiff.js')
const curseforge = require('mc-curseforge-api')

const dot=()=>write('.')

async function init() {
  write('  🧱 Generating changelog. ')

  // Get last tagged version
  const version = execSync('git describe --tags --abbrev=0').toString().trim()

  // Try to bump version
  const splittedVersion = version.split('.')
  const lastVersion = parseInt(splittedVersion.slice(-1)[0]) + 1
  const nextVersion = [...splittedVersion.slice(0, -1), lastVersion].join('.')
  end('version ' + version + ' -> ' + nextVersion + ' ')

  let changelogText = '\n\n# '+nextVersion+'\n\n'

  // Generating mod changings
  const tmpPath = '~tmp_old_mcinstance.json'
  execSync(`git show tags/${version}:minecraftinstance.json > `+tmpPath)
  const modsDiff = getModsIds(tmpPath, 'minecraftinstance.json')
  fs.unlinkSync(tmpPath)
  
  write('  🧱 Ask CurseForge ')
  const [added,removed,updated] = await Promise.all(
    ['added','removed','updated'].map(
      group=>Promise.all(
        modsDiff[group].map(m=>curseforge.getMod(m.addonID))
      )
    )
  )
  const curseResult = {added,removed,updated}
  end()
  write('  🧱 Writing changelog ')

  for (const [group, message] of [
    ['added', '## 🟢 New Mods'],
    ['removed', '## 🔴 Removed Mods'],
    ['updated', '## 🟡 Updated Mods'],
  ]) {
    if(!curseResult[group].length) continue

    const isUpdated = group==='updated'
    const rows = curseResult[group].map(curseAddon => 
      formatRow(modsDiff.map_union[curseAddon.id], curseAddon, isUpdated 
        ? {noIcon:true, noSummary:true, asList:true} 
        : {}
      )
    )
    changelogText += [
      message,
      '',
      ...(isUpdated ? '' : [
        'Icon | Summary | Reason',
        '----:|:--------| ------',
      ]),
      ...rows,
      '\n'
    ].join('\n')
  }

  const logFromLastTag = execSync(`git log ${version}..HEAD`).toString().trim()

  const map = {}
  logFromLastTag.split(/^commit .*$/gm).forEach(commitBlock=>{
    const commitMatch = commitBlock.match(/^Author: .*?\nDate: .*?\n\n(?<message>.*)/ms)
    if(!commitMatch) return
    const commitMessage = commitMatch.groups.message.trim()

    const match = commitMessage.match(/^(?<symbol>[^a-zA-Z ]{1,5}) (?<subject>.+)/sm)
    const s = match?.groups.symbol
    if(!match || !s.trim()) return (map['other'] ??= []).push(commitMessage)

    // Remove leading spaces frow commit message
    const trimmedSubject = match.groups.subject
      .split('\n')
      .map(l=>l.replace(/^ {4}/, ''))
      .filter((l,i)=>l||i!=1)
      .join('\n')

    return (map[s] ??= []).push(trimmedSubject)
  })

  const annotations = [
    ['🧩', 'Configs'],
    ['✏️', 'Recipes'],
    ['📖', 'Quest Book'],
    ['🌍', 'World Generation'],
    ['🔵', 'Mods', `
      🟢 New Mods
      🔴 Removed Mods
      🟡 Mods changes
      ☢️ NuclearCraft
      ⛽ Advanced Generators
      ⬛ Bedrock Ore
      🌠 Astral Sorcery
      🌡️ Thermal Expansion
      🌿 Patchouli
      🎲 Random Things
      🏪 Requious Fracto
      🐀 Rats
      🐉 Ice and Fire
      🐝 Forestry
      👨‍🏭 Mekanism
      💍 Baubles
      📑 Tips
      🔨 Tinker's Construct
      🖥 OpenComputers
      🖽 Little Tiles
      🗃️ Loot tables
      🦯 Thaumcraft
      🛢️ Immersive Engineering
      🛹 Integrated Dynamics
      🟨 Recurrent Complex
      🅱 Block Drops
      🛸 EnderIO
      🔩 RFTools
      🩸 Blood Magic
      🧬 Draconic Evolution
      ▦ ExNihilio
      🌾 Farming For Blockheads
      💼 Actually Additionals
      🧃 Open Blocks
      📭 Storage Drawers
      🔌 Industrial Craft 2
      ⚙️ JAOPCA
      🗂️ Additional Compression
      🏦 Modular Machinery
      🍁 Rustic
      🚄 Vaultopic
      🍇 End Reborn
      👿 Extra Utilities 2
    `.trim().split('\n').map(l=>l.trim().split(' ')).map(([c,...r])=>[c, r.join(' ')])],
    ['🔄', 'Misc Changes', [
      ['🧱', 'Technical'],
      ['🚧', 'Develop'],
      ['🧹', 'Refactoring'],
      ['𝓩𝒮', 'ZenScript'],
    ]],
  ]

  function outputList(categoryKey, desc, level, isForced) {
    if(!map[categoryKey]?.length && !isForced) return

    const tab = ' '.repeat(level*2)
    changelogText += (' '.repeat(Math.max(0,(level-1)*2)) + (level>0?'- ':'') + '#'.repeat(level) + `## ${categoryKey} ${desc}\n`) + '\n'
    for (const subject of map[categoryKey]??[]) {
      subject.split('\n').forEach((l,i)=>{
        changelogText += (tab + `${i==0?'- ':'  > '}${l}`) + '\n'
      })
    }
    map[categoryKey] = undefined
    changelogText += ('') + '\n'
  }

  function outputMd(arr=annotations, level=0) {
    for (const [categoryKey, categoryName, subCategory] of arr) {
      dot()
      const hasSubcategories = (subCategory ?? []).length > 0
      outputList(categoryKey, categoryName, level, hasSubcategories)
      if(hasSubcategories) outputMd(subCategory, level+1)
    }
  }


  // Iterate over defined list
  outputMd()

  // Iterate fields not mentioned in "annotations"
  for (const [key, arr] of Object.entries(map)) {
    if(!arr) continue
    dot()
    arr.forEach(() => {
      outputList(key, '❓❓', 0)
    })  
  }

  changelogText += '\n\n'
  fs.writeFileSync(path.resolve(__dirname, 'tmp CHANGELOG.md'), changelogText)
  end()
}
init()