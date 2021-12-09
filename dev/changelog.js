/**
 * @file Generates changelogs based on git repo.
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check
/* eslint-disable no-regex-spaces */

/*
██╗███╗   ███╗██████╗  ██████╗ ██████╗ ████████╗███████╗
██║████╗ ████║██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝
██║██╔████╔██║██████╔╝██║   ██║██████╔╝   ██║   ███████╗
██║██║╚██╔╝██║██╔═══╝ ██║   ██║██╔══██╗   ██║   ╚════██║
██║██║ ╚═╝ ██║██║     ╚██████╔╝██║  ██║   ██║   ███████║
╚═╝╚═╝     ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝
*/

import fs_extra from 'fs-extra'
const { unlink, writeFileSync } = fs_extra
import { promisify } from 'util'
import { getModsIds, formatRow } from './automation/modsDiff.js'
import { getMod } from 'mc-curseforge-api'
import { loadText, escapeRegex, loadJson, saveObjAsJson, defaultHelper, saveText } from './lib/utils.js'
import _ from 'lodash'
import replace_in_file from 'replace-in-file'
import { execSync, exec as _exec } from 'child_process'
const exec = promisify(_exec)
import yargs from 'yargs'

const argv = yargs(process.argv.slice(2))
  .alias('n', 'next')
  .describe('n', 'Next version')
  .argv

import { URL, fileURLToPath  } from 'url' // @ts-ignore
function relative(relPath) { return fileURLToPath(new URL(relPath, import.meta.url)) }

/*
██╗   ██╗ █████╗ ██████╗ ██╗ █████╗ ██████╗ ██╗     ███████╗███████╗
██║   ██║██╔══██╗██╔══██╗██║██╔══██╗██╔══██╗██║     ██╔════╝██╔════╝
██║   ██║███████║██████╔╝██║███████║██████╔╝██║     █████╗  ███████╗
╚██╗ ██╔╝██╔══██║██╔══██╗██║██╔══██║██╔══██╗██║     ██╔══╝  ╚════██║
 ╚████╔╝ ██║  ██║██║  ██║██║██║  ██║██████╔╝███████╗███████╗███████║
  ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝╚══════╝
*/
const minecraftinstance_old = 'minecraftinstance_old.json'

/**
 * @typedef {Object} Subcategory
 * @property {string} symbol
 * @property {string[]} aliases
 * @property {boolean} [isBlacklisted]
 * @property {Subcategory[]} [subcategory]
 * */

/*
██╗███╗   ██╗██╗████████╗
██║████╗  ██║██║╚══██╔══╝
██║██╔██╗ ██║██║   ██║   
██║██║╚██╗██║██║   ██║   
██║██║ ╚████║██║   ██║   
╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   
*/
export async function init(h=defaultHelper) {

  await h.begin('Determine version')

  // Get last tagged version
  const old_version = execSync('git describe --tags --abbrev=0').toString().trim()

  /** @type {number} */
  let old_versionCode
  try {
    old_versionCode = JSON.parse(
      execSync(`git show tags/${old_version}:dev/version.json`).toString().trim()
    )?.versionCode
  } catch (error) {
    old_versionCode = 100
  }
  

  // Try to bump version
  /** @type {string} */
  const nextVersion = argv['next'] ?? bumpVersion(old_version)
  await h.begin('Version ' + old_version + ' -> ' + nextVersion + ' ')

  // Change version in files
  bumpVersionInFiles(nextVersion, old_versionCode + 1)


  /** @type {string[]} */
  const changelogLines = []

  // Extract old minecraftinstance.json (from latest assigned tag)
  execSync(`git show tags/${old_version}:minecraftinstance.json > ${minecraftinstance_old}`)


  const modChangesTxt = await getModChanges(old_version, nextVersion, h)
  changelogLines.push(...modChangesTxt.split('\n'))
  
  const commitMap = getCommitMap(old_version)

  const changelogStructure = parseChangelogStructure(
    loadText(relative('automation/data/changelog_structure.md'))
  )

  const blacklistedCategories = filterCommitMap(commitMap, changelogStructure)

  /** @type {string[]} */
  const commitLogChanges = []

  // Iterate over defined list
  let categoriesCount = 0
  await h.begin('Annotating changes', Object.keys(commitMap).length)
  commitLogChanges.push(...stringifySubcatList(changelogStructure))

  /**
   * 
   * @param {Subcategory[]} subCatList
   * @returns {string[]}
   */
  function stringifySubcatList(subCatList=[], level=0) {
    const result = subCatList
      .map(arr=>stringifySubcat(arr, level))
      .flat()

    if(result.length) return [...result,'']
    else return []
  }

  /**
   * Add information into resulting file text
   * @param {Subcategory} subCat
   * @returns {string[]} Lines of text
   */
  function stringifySubcat(subCat, level=0) {
    // Add own Entries
    let result = commitMap[subCat.symbol]
      ?.map(subject=>
        stringifyCommit(subject, subCat.aliases)
          .map(s=>`  ${s.replace(/\n/g, '\n  ')}`)
        )
      .flat() ?? []
    delete commitMap[subCat.symbol]

    // Add sub entries
    const subList = stringifySubcatList(subCat.subcategory, level+1)
      .map(s => s
        .replace(/^((- )?#+)/, '$1#') // Add paragraph level
        .replace(/(.+)/g, '  $1') // Lift all content on +1 tab
      )
    result.push(...subList)

    // No content for category
    if(!result.length) return []

    // Lift subcategory up if there only one
    let mergedSingleMessage = ''
    if(level!=0 && _(result).sumBy(s=>/^  - .*$/.test(s) ? 1 : 0) === 1) {
      mergedSingleMessage = result[0].replace(/^  - /, ': ')
      result.splice(0,1)
    }

    // Make item list in one line
    let lastLineIsItem = true
    _(result).forEachRight((line, i)=>{
      lastLineIsItem &&= isItemCaptue(line.replace(/^\s*- /,''))
      if(i!==result.length-1 && lastLineIsItem)
        result[i+1] = result[i+1].replace(/^(\s*)- /,'$1  ')
    })

    result = [
      `- ## ${subCat.symbol} **${subCat.aliases[0]}**${mergedSingleMessage}`,
      ...result,
      '',
    ]

    h.step(subCat.symbol)
    categoriesCount++
    return result
  }

  // Iterate fields not mentioned in "annotations"
  let unknown = 0
  for (const [key, arr] of Object.entries(commitMap)) {
    if(/\w+.*/.test(key)) {
      unknown++
      // continue // Skip commits started with words
    }
    arr.forEach(() => {
      commitLogChanges.push(...stringifySubcat({symbol: key, aliases:['❓❓']}))
    })  
  }

  // Remove top-level lists
  commitLogChanges.forEach((l,i)=>commitLogChanges[i]=commitLogChanges[i].replace(/^- /, ''))


  await h.begin('Writing in file')
  changelogLines.push(...commitLogChanges, '\n\n')
  const fullChLogPath = 'changelogs/CHANGELOG_LATEST.md'
  writeFileSync(fullChLogPath, [`# ${nextVersion}\n\n`, ...changelogLines].join('\n'))

  // Automatically assign icons
  await h.begin('Automatic iconisation')
  const e2eeiconsPath = 'D:/CODING/E2E-E-icons/main.js'
  await runProcess(`node "${e2eeiconsPath}" --silent --treshold=2 --filename="${fullChLogPath}"`,
    () => h.step()
  )
  
  h.result(
    `New changelog entries: ${categoriesCount}, `+
    `Unknown: ${unknown}, `+
    `Blacklisted: ${blacklistedCategories}`)
}

// @ts-ignore
if(import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href) init()

/*
███╗   ███╗ ██████╗ ██████╗ ███████╗
████╗ ████║██╔═══██╗██╔══██╗██╔════╝
██╔████╔██║██║   ██║██║  ██║███████╗
██║╚██╔╝██║██║   ██║██║  ██║╚════██║
██║ ╚═╝ ██║╚██████╔╝██████╔╝███████║
╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝
*/
async function getModChanges(version, nextVersion, h=defaultHelper) {
  const modsDiff = getModsIds(minecraftinstance_old, 'minecraftinstance.json')

  let counstGets = 0
  const promises = ['added','removed','updated'].map(
    group=>Promise.all(
      modsDiff[group].map(
        (/** @type {import('./automation/modsDiff.js').InstalledAddon} */ m) =>{
          const p = getMod(m.addonID)
          p.then(()=>h.step())
          counstGets++
          return p
      })
    )
  )
  
  await h.begin('Asking CurseForge', counstGets)
  const [added,removed,updated] = await Promise.all(promises)
  

  await h.begin('Generating text')
  const curseResult = {added,removed,updated}
  let result = ''
  for (const [group, message] of [
    ['added', '## 🟢 New Mods'],
    ['removed', '## 🔴 Removed Mods'],
    ['updated', '## 🟡 Updated Mods'],
  ]) {
    if(!curseResult[group].length) continue

    const isUpdated = group==='updated'
    const rows = curseResult[group].map(curseAddon => isUpdated 
      ? `- **${curseAddon.name.trim()}**`
      : formatRow(modsDiff.map_union[curseAddon.id], curseAddon, {})
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

  // Generate manifests for later use in changelog generator
  generateManifest(minecraftinstance_old, version, '_old')
  generateManifest('minecraftinstance.json', nextVersion)

  h.begin('Retrieving mod detailed changelogs', 10)
  const nextModsChangelogs = `changelogs/CHANGELOG_MODS_${nextVersion}.md`
  const chgenCommand = 'java -jar ./ChangelogGenerator-2.0.0-pre10.jar -m'+
    ' --old="manifest_old.json"'+
    ' --new="manifest.json"'+
    ' --entries=5'+
    ' --lines=60'+
    ` --output=${nextModsChangelogs}`
  
  await runProcess(chgenCommand, data => {
    const projectID = data.match(/^.*projectID=(\d+)/)?.[1]
    h.begin(`Retrieving changelogs ${curseResult.updated.find(m=>m.id==projectID)?.name ?? '[unknown mod]'}`)
  })

  // Remove file if there is no changes at all
  if(loadText(nextModsChangelogs).split('\n').length <= 4) {
    unlink(nextModsChangelogs)
  } else {
    result += makeModsChangelogBetter(nextModsChangelogs)
  }

  return result
}

/**
 * @param {string} nextModsChangelogs
 */
function makeModsChangelogBetter(nextModsChangelogs) {
  const newChangelogText = loadText(nextModsChangelogs)
  .replace(/(?<prefix>^####.*$)(?<body>([\s\S\n](?!\n##)){1,})/gmi,
  (/** @type {any[]} */ ...args)=>{
    /** @type {{[key:string]:string}} */
    const groups = args.pop()
    return `${groups.prefix}${groups.body.replace(/\n/g, '\n  > ')}`
  })
  .replace(/^## (Added|Removed)[\s\n]+(\*\s[^\n]+\n)+/gmi, '')

  saveText(newChangelogText, nextModsChangelogs)
  
  return `\n## [> Mods updates detailed.](${nextModsChangelogs})\n\n`
}

let forgeVersion
function generateManifest(mcinstancePath, version, manifestPostfix='') {
  /** @type {import('./automation/modsDiff.js').InstalledAddon[]} */
  const installedAddons = loadJson(mcinstancePath).installedAddons

  const manifestTemplate = {
    minecraft: {
      version: '1.12.2',
      modLoaders: [{
          id: forgeVersion ??= `forge-${loadText('logs/debug.log').match(/Forge Mod Loader version ([^\s]+) for Minecraft 1.12.2 loading/)[1]}`,
          primary: true
      }]
    },
    manifestType: 'minecraftModpack',
    manifestVersion: 1,
    name: 'Enigmatica2Expert-Extended',
    version: version,
    author: 'Krutoy242',
    overrides: 'overrides',
    files: installedAddons.map(a=>({
      projectID: a.addonID,
      fileID: a.installedFile?.id,
      required: true,
    })).sort((a,b)=>a.projectID-b.projectID)
  }

  saveObjAsJson(
    manifestTemplate
    ,`manifest${manifestPostfix}.json`
  )
}

/*
██╗   ██╗████████╗██╗██╗     ███████╗
██║   ██║╚══██╔══╝██║██║     ██╔════╝
██║   ██║   ██║   ██║██║     ███████╗
██║   ██║   ██║   ██║██║     ╚════██║
╚██████╔╝   ██║   ██║███████╗███████║
 ╚═════╝    ╚═╝   ╚═╝╚══════╝╚══════╝
*/

/**
 * @param {string} fileText
 * @return {Subcategory[]} Category with optional {@link Subcategory}
 * */
function parseChangelogStructure(fileText) {
  const jsCode = (fileText + '\n\n')
    // Comments
    .replace(/#.*$/gm, '')

    // Wrap as JS array
    .replace(/^([\t ]*)(x )?([^\t\n ]+)[\t ]+((?:[^\t\n ]+[\t ]*)+)$/gm,
      (m,tab,isBlacklisted,symbol,aliases) => `${tab}{symbol:"${symbol}",aliases:"${aliases}",isBlacklisted:${!!isBlacklisted}},`
    )

    // Add subcategories
    .replace(/^(.symbol:.+)\},\n((?:^\s+.symbol.+\n)+?)(\s*\n|.symbol.+$)/gm, '$1,subcategory:[\n$2]},$3')

    // Split aliases
    .replace(/aliases:"([^"]+)"/gm, (m,p)=>`aliases:${JSON.stringify(p.split('|').map(s=>s.trim()))}`)

  return eval(`([${jsCode}])`)
}


/**
 * Remove excess characters from first commit line
 * @param {string} s
 * @param {string[]} aliases
 */
function trimAliases(s, aliases) {
  const aliasesJoined = aliases.map(s=>escapeRegex(s).replace(/\s+/, '\\s*')).join('|')
  const aliasRgx = new RegExp(`^(?:${aliasesJoined})(?:\\s*:)?\\s*([\\s\\S]*)$`, 'i')
  return s.replace(aliasRgx, '$1')
}


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

/**
 * @param {string} message
 */
function splitMessage(message) {
  return message
    .trim()
    .split(/\n(?!(\t|  )\s*>\s+)/)
    .filter(s=>s)
}

/**
 * @param {string} subject
 * @param {string[]} aliases
 */
function stringifyCommit(subject, aliases) {
  return splitMessage(subject).map((l, i) => 
    `${i == 0 ? '- ' : '  > '}${trimAliases(l, aliases)}`
  )
}

/**
 * Git log -> parse all log entries to get map
 * @param {string} version
 */
function getCommitMap(version) {
  const logFromLastTag = execSync(`git log ${version}..HEAD`).toString().trim()

  /** @type {{[keySymbol: string]: string[]}} */
  const commitMap = {}
  logFromLastTag.split(/^commit .*$/gm).forEach(commitBlock => {
    const commitMatch = commitBlock.match(/^Author: .*?\nDate: .*?\n\n(?<message>.*)/ms)
    if (!commitMatch) return
    
    const [symbol, mesaage] = parseCommitMessage(commitMatch.groups.message.trim())
    if(!symbol) return
    
    ;(commitMap[symbol] ??= []).push(mesaage)
  })

  return commitMap
}

/**
 * @param {string} commitMessage
 */
function parseCommitMessage(commitMessage) {
  const match = commitMessage.match(/^(?<symbol>[^a-zA-Z ]+) (?<subject>.+)/sm)
  const symbol = match?.groups.symbol
  if (!match || !symbol.trim()) return ['other', commitMessage]

  // Remove leading spaces frow commit message
  const trimmedSubject = match.groups.subject
    .split('\n')
    .map(l => l.replace(/^ {4}/, ''))
    .filter((l, i) => l || i != 1)
    .join('\n')

  return [symbol, trimmedSubject]
}

/**
 * Filter meaningless same entries
 * Split and merge commits on several ones if has same content
 * 
 * @param {Object<string, string[]>} commitMap
 * @param {Subcategory[]} changelogStructure
 */
function filterCommitMap(commitMap, changelogStructure) {

  /** @type {Object<string, Subcategory>} */
  const flatStructure = {}

  /** @param {Subcategory[]} subCatList */
  function flattenSub(subCatList) {
    for (const subCat of subCatList) {
      flatStructure[subCat.symbol] = subCat
      if(subCat.subcategory) flattenSub(subCat.subcategory)
    }
  }
  flattenSub(changelogStructure)

  let blacklistedCommits = 0
  for (const [symbol, messages] of Object.entries(commitMap)) {

    // Unknown symbol
    const aliases = flatStructure[symbol]?.aliases
    if(!aliases?.length) continue

    // Symbol Blacklisted - remove it
    if(flatStructure[symbol].isBlacklisted) {
      delete commitMap[symbol]
      blacklistedCommits++
      continue
    }

    // Trim Category aliases and remove duplicates
    commitMap[symbol] = _(messages)
      .map(m=>trimAliases(m, aliases))
      .filter(m=>!!m)
      .uniqWith((a,b)=>a==b)
      .value()

    // Split subcategories if one commit have several of them
    commitMap[symbol].forEach((message, i)=>{
      if(!flatStructure[symbol].subcategory?.length) return

      const anySubcatName = flatStructure[symbol].subcategory
        .map(subcat=>subcat.aliases)
        .flat()
        .map(escapeRegex)
        .join('|')

      const subMatchesRgx = new RegExp(
        `^(?:\\*\\*)?(?<subName>${anySubcatName}):?(?:\\*\\*)?:?\\s*`+
        `(?<content>${
          '('
          +'\n[-*]\\s.*' // Any list item
          +'(\n[^-*\\s].*)*'// Any wrapped text
          +'(\n(\t|  )+>\\s.*)*'// Any quoted text
          +')+'
        })`
      ,'gmi')
      const subMatches = [...message.matchAll(subMatchesRgx)]

      subMatches.forEach(match=>{
        message = message.replace(match[0], '')
        const {subName, content} = match.groups

        const matchedSubcat = flatStructure[symbol].subcategory
          .find(sc => new RegExp(`^${sc.aliases.join('|')}$`,'i').test(subName))
        
        ;(commitMap[matchedSubcat.symbol] ??= []).push(...
          splitMessage(content).map(l=>l.replace(/^[-*]\s/,''))
        )
      })

      commitMap[symbol][i] = message
    })

    // Remove empty messages
    commitMap[symbol] = commitMap[symbol].filter(l=>!
      new RegExp(`^((${aliases.join('|')}):?)?\\s*$`)
    .test(l))
  }

  // Sort lists of icons
  _(commitMap).forEach(arr => arr.sort((a,b)=>{
    const getWeight = (s)=>isItemCaptue(s) ? 0 : 1
    return getWeight(b) - getWeight(a)
  }))

  // If commit content only list, lift this list up
  _(commitMap).forEachRight((arr, symbol)=>_(arr).forEachRight((message, i) => {
    if(!flatStructure[symbol]?.aliases) return
    const trimmed = trimAliases(message, flatStructure[symbol]?.aliases)
    const match = trimmed.match(/^([-*]\s+([\s\S](?!\n(\n|  |-|\*)))+.\n?)+$/)
    if(!match) return
    arr.splice(i, 1, ...trimmed.split(/\s*-\s*/).filter(s=>s))
  }))

  return blacklistedCommits
}

function isItemCaptue(s) { return /^\[[^\]]+\](\s\([^)]+\))?$/.test(s) }

/**
 * @param {string} command
 * @param {(chunk: any) => void} onStdOut
 */
function runProcess(command, onStdOut) {
  const promise = exec(command)
  promise.child.stdout.on('data', onStdOut)
  return promise
}

/**
 * @param {string} nextVersion
 * @param {number} nextVersionCode
 */
function bumpVersionInFiles(nextVersion, nextVersionCode) {
  replace_in_file.sync({
    files: 'config/versioner.cfg',
    from: [/(:versionName=).+/, /(:versionCode=).+/],
    to: ['$1'+nextVersion, '$1'+nextVersionCode]
  })
  
  const version_json_path = 'dev/version.json'
  const version_json = loadJson(version_json_path)
  version_json.versionName = nextVersion
  version_json.versionCode = nextVersionCode
  saveObjAsJson(version_json, version_json_path)
}
