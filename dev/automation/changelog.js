/**
 * @file Generates changelogs based on git repo.
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

const { execSync } = require('child_process')
const fs = require('fs')
const path = require('path')
const {getModsIds, formatRow} = require('./modsDiff.js')
const curseforge = require('mc-curseforge-api')

const GENERATE_MODS_CHANGES = true

/**
 * @param {string} str
 */
const escapeRegex = (str) => str.replace(/[/\\^$*+?.()|[\]{}]/g, '\\$&')
const write = (...args) => process.stdout.write(args.join('\t'))
const end = (...args) => process.stdout.write((!args.length?' done' : args.join('\t')) + '\n')
const dot = () => write('.')

/**
 * Guess next version
 * @param {string} version tagged version in form `12.34`
 * @example bumpVersion('0.12') // => '0.13'
 */
const bumpVersion = (version) => {
  const splittedVersion = version.split('.')
  const lastVersion = parseInt(splittedVersion.slice(-1)[0]) + 1
  const nextVersion = [...splittedVersion.slice(0, -1), lastVersion].join('.')
  return nextVersion
}

async function init() {
  write('  🧱 Generating changelog. ')

  // Get last tagged version
  const version = execSync('git describe --tags --abbrev=0').toString().trim()

  // Try to bump version
  const nextVersion = bumpVersion(version)
  end('version ' + version + ' -> ' + nextVersion + ' ')

  let changelogText = '\n\n# '+nextVersion+'\n\n'
  if(GENERATE_MODS_CHANGES) changelogText += await getModChanges(version)

  const logFromLastTag = execSync(`git log ${version}..HEAD`).toString().trim()

  /**
   * @type {Object.<string, string[]>} dict
   */
  const map = {}
  logFromLastTag.split(/^commit .*$/gm).forEach(commitBlock=>{
    const commitMatch = commitBlock.match(/^Author: .*?\nDate: .*?\n\n(?<message>.*)/ms)
    if(!commitMatch) return
    const commitMessage = commitMatch.groups.message.trim()

    const match = commitMessage.match(/^(?<symbol>[^a-zA-Z ]{1,5}) (?<subject>.+)/sm)
    const symbol = match?.groups.symbol
    if(!match || !symbol.trim()) return (map['other'] ??= []).push(commitMessage)

    // Remove leading spaces frow commit message
    const trimmedSubject = match.groups.subject
      .split('\n')
      .map(l=>l.replace(/^ {4}/, ''))
      .filter((l,i)=>l||i!=1)
      .join('\n')

    return (map[symbol] ??= []).push(trimmedSubject)
  })

  /** @typedef {Array<[string, string, Subcategory?]>} Subcategory */
  /** @type {Subcategory} Category with optional {@link Subcategory} */
  const annotations = [
    ['🧩', 'Configs'],
    ['✏️', 'Recipes'],
    ['📖', 'Quest Book'],
    ['🌍', 'World Generation'],
    ['🔵', 'Mods', `
      🟢 New Mods
      🔴 Removed Mods
      🟡 Mods Changes
      ▦ Ex Nihilo
      ☢️ NuclearCraft
      ⚙️ JAOPCA
      ⛽ Advanced Generators
      ⬛ Bedrock Ore
      🌠 Astral Sorcery
      🌡️ Thermal Expansion
      🌱 Mystical Agriculture
      🌳 Twilight Forest
      🌴 BiomesOPlenty
      🌸 Industrial Foregoing
      🌾 Farming For Blockheads
      🌿 Patchouli
      🍁 Rustic
      🍃 Botania
      🍇 End Reborn
      🎲 Random Things
      🏦 Modular Machinery
      🏪 Requious Fracto
      🏴 Dark Utilities
      🐀 Rats
      🐉 Ice and Fire
      🐝 Forestry
      🐮 Animania
      👨‍🏭 Mekanism
      👿 Extra Utilities 2
      💍 Baubles
      💼 Actually Additions
      💽 Applied Energistics
      📑 Tips
      📙 AkashicTome
      📭 Storage Drawers
      🔌 IndustrialCraft 2
      🔠 MainMenu
      🔨 Tinker's Construct
      🔩 RFTools
      🖥 OpenComputers
      🖽 LittleTiles
      🗂️ Additional Compression
      🗃️ Loot Tables
      🦯 Thaumcraft
      🧃 OpenBlocks
      🧙‍♂️ Cyclic
      🧬 Draconic Evolution
      🧻 JEI
      🩸 Blood Magic
      🪐 AdvRocketry
      🚄 Vaultopic
      🛢️ Immersive Engineering
      🛸 EnderIO
      🛹 Integrated Dynamics
      🟨 Recurrent Complex
      🅱 Block Drops
      🥽 LagGoggles
      🖥️ Deep Mob Learning
      🍹 Nutrition
      🙋‍♀️ Quark
      🗳️ Colossal Chest
    `.trim().split('\n').map(l=>l.trim().split(' ')).map(([c,...r])=>[c, r.join(' ')])],
    ['🔄', 'Misc Changes', [
      ['🧱', 'Technical'],
      ['🚧', 'Develop'],
      ['🧹', 'Refactoring'],
      ['𝓩𝒮', 'ZenScript'],
      ['📝', 'TODO'],
      ['🧮', 'craft.zs'],
    ]],
  ]

  /**
   * @param {string} categoryKey Symbol of Changelog category. Example: `🚧`
   * @param {string} desc Description of this category. Example: `Develop`
   * @param {number} level Current tab level
   * @param {boolean} [isForced]
   */
  function outputList(categoryKey, desc, level, isForced) {
    if(!map[categoryKey]?.length && !isForced) return

    const tab = ' '.repeat(level*2)
    changelogText += (' '.repeat(Math.max(0,(level-1)*2)) + (level>0?'- ':'') + '#'.repeat(level) + `## ${categoryKey} ${desc}\n`) + '\n'
    for (const subject of map[categoryKey]??[]) {
      subject.split('\n').forEach((l,i)=>{
        const trimRgx = '^' + escapeRegex(desc).replace(/\s+/, '\\s*') + '\\s*:\\s*'
        const trimmedSubject = l.replace(new RegExp(trimRgx, 'i'), '')
        changelogText += (tab + `${i==0?'- ':'  > '}${trimmedSubject}`) + '\n'
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

/**
 * @param {string} version
 */
async function getModChanges(version) {
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

  let result = ''
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
    result += [
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

  return result
}

module.exports.init = init
if(process.argv?.[0]?.split('\\').pop()==='node.exe') init()