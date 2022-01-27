/**
 * @file Splits better `DefaultQuests.json` into different files
 * for easier managment
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

import { mkdirSync, writeFileSync, rmSync } from 'fs'
import { dirname } from 'path'
import glob from 'glob'
import { defaultHelper, isPathHasChanged, loadJson, loadText, naturalSort } from '../lib/utils.js'
import { save_DefaultQuests_json } from './BQ_lang.js'
import { URL, fileURLToPath  } from 'url' // @ts-ignore
function relative(relPath='./') { return fileURLToPath(new URL(relPath, import.meta.url)) }

/**
 * @typedef {import('./EvenBetterQuesting.js').RootObject} RootObject
 */

import yargs from 'yargs'
const argv = yargs(process.argv.slice(2))
  .alias('u', 'unparse').describe('u', 'Merge splitted files into DefaultQuests.json')
  .alias('f', 'forced').describe('f', 'Force rewrite existen changed files')
  .argv

const bq_quests_path = 'config/betterquesting/DefaultQuests.json'

export async function init(h=defaultHelper) {

  await h.begin('Disabling edit mode')
  const bq_raw = beautifyBQRaw(loadJson(bq_quests_path))
  bq_raw["questSettings:10"]["betterquesting:10"]["editmode:1"] = 0
  save_DefaultQuests_json(bq_raw)

  // @ts-ignore
  if(argv['unparse']) {
    await h.begin('Join quests into DefaultQuests.json')
    unparse()
  } else {
    if(!argv['forced']) {
      await h.begin('Checking requirments')
      if(isPathHasChanged('dev/automation/betterquesting')) {
        return h.error(' ❌📖 EvenBetterQuesting error: splitted folder have changes!')
      }
    }

    h.result('.json files created: ' + await parse(bq_raw, h))
  }
}


/**
 * Automate some actions
 *
 * @param {RootObject} bq_raw
 * @return {RootObject} 
 */
function beautifyBQRaw(bq_raw) {
  // Connect all tail quests to one
  const quests = Object.values(bq_raw['questDatabase:9'])
  quests.forEach(completeThisQuest=>{
    const complID = completeThisQuest['questID:3']
    const qName = completeThisQuest['properties:10']['betterquesting:10']['name:8']
    if(findRealQuestname(qName) !== '[Complete This Chapter]') return

    completeThisQuest['preRequisites:11'] = []

    // Quest line completeThisQuest is in
    const questLine = Object.values(bq_raw['questLines:9'])
      .find(questLine => Object.values(questLine['quests:9'])
        .find(entry => entry['id:3'] === complID)
      )
    if (!questLine) return

    // Change size of technical quest
    const completeThisQuestLine = Object.values(questLine['quests:9'])
      .find(ql=>ql['id:3']===complID)
    completeThisQuestLine['sizeX:3'] = 12
    completeThisQuestLine['sizeY:3'] = 12

    const questsInChapter = Object.values(questLine['quests:9'])
      .map(o => quests.find(q => q['questID:3'] === o['id:3']))
    
    // Quest that gives you a trophy
    const thisIsCompleteQuest = questsInChapter
      .find(q => findRealQuestname(q['properties:10']['betterquesting:10']['name:8']) === 'The chapter is complete!')
    thisIsCompleteQuest['preRequisites:11'] = [complID]
    thisIsCompleteQuest['properties:10']['betterquesting:10']['autoclaim:1'] = 1
    
    // Set Reward same as icon
    const trophyReward = Object.values(thisIsCompleteQuest['rewards:9'])
      .find(r => r['rewardID:8'] === 'bq_standard:item')
    trophyReward['rewards:9'] = {"0:10": thisIsCompleteQuest['properties:10']['betterquesting:10']['icon:10']}
    
    // Set Command reward with proper text
    const trophyColorPrefix = trophyReward['rewards:9']['0:10']['tag:10']['TrophyName:8'].substring(0,2)
    const questChapterName = findRealQuestname(questLine['properties:10']['betterquesting:10']['name:8']).replace(/§./g, '')
    Object.values(thisIsCompleteQuest['rewards:9'])
      .find(r => r['rewardID:8'] === 'bq_standard:command')
      ['command:8'] = `/say §lVAR_NAME§r§6 has fully completed the §n${trophyColorPrefix}${questChapterName}§r§6 chapter!§r \`\`\`Congrats!\`\`\``

    // Change size of Trophy quest
    // const thisIsCompleteQuestLine = Object.values(questLine['quests:9'])
    //   .find(ql=>ql['id:3']===thisIsCompleteQuest['questID:3'])
    // thisIsCompleteQuestLine['sizeX:3'] = 36
    // thisIsCompleteQuestLine['sizeY:3'] = 36
      

    // Keep only quests that have no other child quests
    const noChild = questsInChapter.filter(q =>
      !quests.some(q1 => q1['preRequisites:11'].includes(q['questID:3']))
    ).filter(q => q !== thisIsCompleteQuest)

    completeThisQuest['preRequisites:11'] = noChild.map(q=>q['questID:3'])
  })

  return sortObjectKeys(bq_raw)
}

/**
 * Recursively sort object keys
 *
 * @param {any} obj
 * @return {any} 
 */
function sortObjectKeys(obj) {
  if(typeof obj !== 'object' || Array.isArray(obj)) return obj
  return Object.keys(obj).sort(naturalSort).reduce(
    (newObj, k) => {
      newObj[k] = sortObjectKeys(obj[k])
      return newObj
    }
  , {})
}

// @ts-ignore
if(import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href) init()

/**
 * Split one huge file into many
 * @return {Promise<number>} Total created files
 * @param {RootObject} bq_raw
 */
async function parse(bq_raw, h=defaultHelper) {
  let totalFilesCreated = 0

  /**
   * Saving files functions
   * @param {string} filename Relative path to json file
   * @param {object} obj Object to save
   */
  function saveJSON(filename, obj) {
    totalFilesCreated++
    const filePath = relative('betterquesting/' + filename + '.json')
    mkdirSync(dirname(filePath), { recursive: true })
    writeFileSync(filePath, JSON.stringify(obj, null, 2))
  }

  // Remove current splitted qiests
  await h.begin('Remove current splitted qiests')
  rmSync(relative('betterquesting'), { recursive: true })

  // Open big file
  await h.begin('Mapping DefaultQuests.json')

  // Extrct all quests
  /** @type {Map<number, {_pos:import('./EvenBetterQuesting.js').QuestLineEntry,_data:import('./EvenBetterQuesting.js').Quest}>} */
  const questMap = new Map()

  const bq_chapterEntries = Object.entries(bq_raw['questDatabase:9'])
  /** @type {Array<number|null>} */
  const questsIDs = []
  bq_chapterEntries.forEach(([i,q])=>{
    const id = q['questID:3']
    questMap.set(id, {_pos:null,_data:q})
    questsIDs[parseInt(i.split(':')[0])] = id
  })

  // Main
  const mainMap = bq_raw['questSettings:10']['betterquesting:10']
  saveJSON('_props', {
    _data: {
      ['format:8']: bq_raw['format:8'],
      ['questSettings:10']: { ['betterquesting:10']: mainMap },
    },
    _IDs: questsIDs,
  })

  // Chapters
  const questChapters_entries =  Object.entries(bq_raw['questLines:9'])
  await h.begin('Creating chapters', questChapters_entries.length)

  const chapNameGen = unicNameGenerator()
  for (const [index, ch] of questChapters_entries) {
    const chapName = ch['properties:10']['betterquesting:10']['name:8']
    const folder = 'Chapters/'+chapNameGen(chapName)+'/'
    const questLines = ch['quests:9']
    delete ch['quests:9']

    const chapIDs = []
    const questNameGen = unicNameGenerator()
    for (const [lineIndex, q] of Object.entries(questLines)) {
      const id = q['id:3']
      delete q['id:3']
      const jsQuest = questMap.get(id)
      jsQuest._pos = q
      chapIDs[parseInt(lineIndex.split(':')[0])] = id
      const qName = questNameGen(jsQuest._data['properties:10']['betterquesting:10']['name:8'])
      saveJSON(folder+qName, jsQuest)
    }

    saveJSON(folder+'_props', {_index:index, _data: ch, _IDs: chapIDs})

    h.step()
  }

  return totalFilesCreated
}


  
// Lang file with quest names
let questLang

/**
 * @param {string} name
 */
function findRealQuestname(name) {
  if(name.match(/^[^.]+\.[^.]+\.[^.]+$/)) return (questLang ??= Object.fromEntries(
    loadText('resources/betterquesting/lang/en_us.lang')
    .split('\n')
    .map(l=>[l.substring(0, l.indexOf('=')), l.substring(l.indexOf('=') + 1)])
  ))[name] ?? name
  return name
}

/**
 * @param {string} name
 */
function createRealQuestFilename(name) {
  return findRealQuestname(name)
    .replace(/[/\\?%*:|"<>]/g, '-') // Remove file system unsupported symbols
    .replace(/§./g, '') // Remove string formattings
}

// Helper naming function
function unicNameGenerator() {
  const uniqNames = new Set()
  return function (/** @type {string} */ name) {
    const narmalName = createRealQuestFilename(name)
    let idName = narmalName
    let k = 0
    while (uniqNames.has(idName)) idName = narmalName + ' _' + k++
    uniqNames.add(idName)
    return idName
  }
}

/*

  Join files into one

*/
function unparse() {
  function json_here(filePath) { return JSON.parse(
    loadText(relative(filePath))
  )}
  function json_abs(filePath) { return JSON.parse(
    loadText(filePath)
  )}

  const book = {
    'format:8':null,
    'questDatabase:9':[],
    'questLines:9':[],
    'questSettings:10':null,
  }


  const main = json_here('betterquesting/_props.json')
  for (const [k,v] of Object.entries(main._data)) {
    book[k] = v
  }

  const chapters = glob.sync(relative('betterquesting/Chapters/*'))
  for (const chapterFolder of chapters) {
    const chapProps = json_abs(chapterFolder + '/_props.json')
    const questLines = []

    for (const questJS of glob.sync(chapterFolder + '/!(_props)*.json').map(json_abs)) {
      const id = questJS._data['questID:3']
      book['questDatabase:9'].push([main._IDs.indexOf(id)+':10', questJS._data])
      questLines.push([chapProps._IDs.indexOf(id)+':10', {['id:3']: id, ...questJS._pos}])
    }

    book['questLines:9'].push([
      chapProps._index,
      {...chapProps._data, 'quests:9':sortEntries(questLines)}
    ])
  }

  // Sort quest list
  sortEntries(book, 'questDatabase:9')
  sortEntries(book, 'questLines:9')

  save_DefaultQuests_json(book)
}

/**
 * Sort ["key","value"] tuples Array by "key", and transform it into object key:value
 * @param {object} obj
 * @param {string} [field]
 */
function sortEntries(obj, field) {
  const toSort = field ? obj[field] : obj
  toSort.sort((a,b)=>parseInt(a[0].split(':')[0]) - parseInt(b[0].split(':')[0]))
  if(field) {
    obj[field] = Object.fromEntries(toSort)
    return
  }
  return Object.fromEntries(toSort)
}