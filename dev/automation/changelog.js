/* eslint-disable no-regex-spaces */
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
const { loadText, escapeRegex } = require('../lib/utils.js')
const { resolve } = require('path')
const _ = require('lodash')

/**
 * @typedef {Object} Subcategory
 * @property {string} symbol
 * @property {string[]} aliases
 * @property {boolean} [isBlacklisted]
 * @property {Subcategory[]} [subcategory]
 * */

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

  // console.log('jsCode :>> ', jsCode)
  // process.exit(0)
  return eval(`([${jsCode}])`)
}


/**
 * @param {string} s
 * @param {string[]} aliases
 */
function trimAliases(s, aliases) {
  const aliasRgx = new RegExp(`^(?:${
    aliases.map(s=>escapeRegex(s).replace(/\s+/, '\\s*')).join('|')
  })(?:\\s*:)?\\s*([\\s\\S]*)$`, 'i')
  return s.replace(aliasRgx, '$1')
}

const GENERATE_MODS_CHANGES = true


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

const init = module.exports.init = async function(h=require('../automate').defaultHelper) {

  await h.begin('Determine version')

  // Get last tagged version
  const version = execSync('git describe --tags --abbrev=0').toString().trim()
  // const version = '0.30'

  // Try to bump version
  const nextVersion = bumpVersion(version)
  await h.begin('Version ' + version + ' -> ' + nextVersion + ' ')

  const changelogLines = [`# ${nextVersion}`,'','']
  
  if(GENERATE_MODS_CHANGES) {
    changelogLines.push(...(await getModChanges(version, h)).split('\n'))
  }
  
  const commitMap = getCommitMap(version)

  const changelogStructure = parseChangelogStructure(
    loadText(resolve(__dirname, 'data/changelog_structure.md'))
  )

  const blacklistedCategories = filterCommitMap(commitMap, changelogStructure)


  // Iterate over defined list
  let categoriesCount = 0
  await h.begin('Annotating changes', Object.keys(commitMap).length)
  changelogLines.push(...stringifySubcatList(changelogStructure))

  /**
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
          .map(s=>`  ${s}`)
        )
      .flat() ?? []
    delete commitMap[subCat.symbol]

    // Add sub entries
    const subList = stringifySubcatList(subCat.subcategory, level+1)
      .map(s=>s.replace(/^((- )?#+)/, '$1#').replace(/(.+)/, '  $1'))
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
  let skipped = 0
  for (const [key, arr] of Object.entries(commitMap)) {
    if(/\w+.*/.test(key)) {skipped++; continue }// Skip commits started with words
    arr.forEach(() => {
      changelogLines.push(...stringifySubcat({symbol: key, aliases:['❓❓']}))
    })  
  }

  // Remove top-level lists
  changelogLines.forEach((l,i)=>changelogLines[i]=changelogLines[i].replace(/^- /, ''))


  await h.begin('Writing in file')
  changelogLines.push('\n\n')
  fs.writeFileSync(path.resolve(__dirname, 'data/~CHANGELOG_LATEST.md'), changelogLines.join('\n'))
  
  h.result(
    `New changelog entries: ${categoriesCount}, `+
    `Skipped: ${skipped}, `+
    `Blacklisted: ${blacklistedCategories}`)
}

if(require.main === module) init()


/**
 * @param {string} subject
 * @param {string[]} aliases
 */
function stringifyCommit(subject, aliases) {
  return subject.split('\n').map((l, i) => 
    `${i == 0 ? '- ' : '  > '}${trimAliases(l, aliases)}`
  )
}

/**
 * Git log -> parse all log entries to get map
 * @param {string} version
 */
function getCommitMap(version) {
  const logFromLastTag = execSync(`git log ${version}..HEAD`).toString().trim()

  /**
   * <KeySymbol, ParsedBodies>
   * @type {Object.<string, string[]>} dict
   */
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
 * @param {string} version
 */
async function getModChanges(version, /** @type {typeof import('../automate').defaultHelper} */ h) {
  // Generating mod changings
  const tmpPath = '~tmp_old_mcinstance.json'
  execSync(`git show tags/${version}:minecraftinstance.json > `+tmpPath)
  const modsDiff = getModsIds(tmpPath, 'minecraftinstance.json')
  fs.unlinkSync(tmpPath)

  let counstGets = 0
  const promises = ['added','removed','updated'].map(
    group=>Promise.all(
      modsDiff[group].map(
        (/** @type {import('./modsDiff.js').InstalledAddon} */ m) =>{
          const p = curseforge.getMod(m.addonID)
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

      const subMatches = [...message.matchAll(new RegExp(
        `^\\*\\*(?<subName>${anySubcatName}):?\\*\\*\\s*`+
        `(?<content>${
          '('
          +'\n[-*]\\s.*' // Any list item
          +'(\n[^-*\\s].*)*'// Any wrapped text
          +')+'
        })`
      ,'gmi'))]

      subMatches.forEach(match=>{
        message = message
          .replace(match[0], '')
        const {subName, content} = match.groups

        const matchedSubcat = flatStructure[symbol].subcategory
          .find(sc => new RegExp(`^${sc.aliases.join('|')}$`,'i').test(subName))
        
        ;(commitMap[matchedSubcat.symbol] ??= []).push(...
          content.trim().split('\n').map(l=>l.replace(/^[-*]\s/,''))
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