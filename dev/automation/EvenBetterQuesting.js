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

import yargs from 'yargs'
const argv = yargs(process.argv.slice(2))
  .alias('u', 'unparse').describe('u', 'Merge splitted files into DefaultQuests.json')
  .alias('f', 'forced').describe('f', 'Force rewrite existen changed files')
  .argv

const bq_quests_path = 'config/betterquesting/DefaultQuests.json'

export async function init(h=defaultHelper) {

  await h.begin('Disabling edit mode')
  const bq_raw = sortObjectKeys(loadJson(bq_quests_path))
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
 * Recursively sort object keys
 *
 * @param {any} obj
 * @return {{}} 
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
  /** @type {Map<number, object>} */
  const questMap = new Map()

  const bq_chapterEntries = Object.entries(bq_raw['questDatabase:9'])
  /** @type {Array<number|null>} */
  const questsIDs = []
  bq_chapterEntries.forEach(([i,q])=>{
    const id = parseInt(q['questID:3'])
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