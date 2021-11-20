/**
 * @file Splits better `DefaultQuests.json` into different files
 * for easier managment
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

import { mkdirSync, writeFileSync, rmdirSync } from 'fs'
import { dirname } from 'path'
import glob from 'glob'
import { defaultHelper, isPathHasChanged, loadJson, loadText, naturalSort } from '../lib/utils.js'
import { save_DefaultQuests_json } from './BQ_lang.js'
import { URL, fileURLToPath  } from 'url' // @ts-ignore
function relative(relPath='./') { return fileURLToPath(new URL(relPath, import.meta.url)) }

const bq_quests_path = 'config/betterquesting/DefaultQuests.json'

export async function init(h=defaultHelper) {

  await h.begin('Disabling edit mode')
  const bq_raw = sortObjectKeys(loadJson(bq_quests_path))
  bq_raw["questSettings:10"]["betterquesting:10"]["editmode:1"] = 0
  save_DefaultQuests_json(bq_raw)

  // @ts-ignore
  if(process.argv.unparse) {
    await h.begin('Join quests into DefaultQuests.json')
    unparse()
  } else {
    await h.begin('Checking requirments')
    if(isPathHasChanged('dev/automation/betterquesting')) {
      return h.error(' ❌📖 EvenBetterQuesting error: splitted folder have changes!')
    }

    h.result('.json files created: ' + await parse(bq_raw, h))
  }
}

// @ts-ignore
if(import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href) init()

/*

  Split one huge file into many

*/
async function parse(bq_raw, h=defaultHelper) {
  let totalFilesCreated = 0

  // Saving files functions
  function saveParsed(filename, txt) {
    var filePath = relative('betterquesting/' + filename + '.json')
    mkdirSync(dirname(filePath), { recursive: true })
    writeFileSync(filePath, txt)
  }

  function saveJSON(filename, obj) {
    totalFilesCreated++
    return saveParsed(filename, JSON.stringify(obj, null, 2))
  }

  // Remove current splitted qiests
  await h.begin('Remove current splitted qiests')
  rmdirSync(relative('betterquesting'), { recursive: true })
  
  // Open lang file to make quests
  const questLang = Object.fromEntries(
    loadText('resources/betterquesting/lang/en_us.lang')
    .split('\n')
    .map(l=>[l.substring(0, l.indexOf('=')), l.substring(l.indexOf('=') + 1)])
  )

  function findRealQuestname(name) {
    if(name.match(/^[^.]+\.[^.]+\.[^.]+$/)) return questLang[name] ?? name
    return name
  }

  // Helper naming function
  function unicNameGenerator() {
    const uniqNames = new Set()
    return function (name) {
      const narmalName = findRealQuestname(name)
        .replace(/[/\\?%*:|"<>]/g, '-') // Remove file system unsupported symbols
        .replace(/§./g, '') // Remove string formattings
      let idName = narmalName
      let k = 0
      while (uniqNames.has(idName)) idName = narmalName + ' _' + k++
      uniqNames.add(idName)
      return idName
    }
  }

  // Open big file
  await h.begin('Mapping DefaultQuests.json')
  const questMap = new Map()
  Object.entries(bq_raw['questDatabase:9']).forEach(([i,q])=>{
    questMap.set(q['questID:3'], {_index:i,_pos:null,_data:q})
  })
  

  // Main
  const mainMap = bq_raw['questSettings:10']['betterquesting:10']
  saveJSON('_props', {['format:8']: bq_raw['format:8'], ['questSettings:10']:{['betterquesting:10']: mainMap}})

  // Chapters
  const questChapters_entries =  Object.entries(bq_raw['questLines:9'])
  await h.begin('Creating chapters', questChapters_entries.length)

  const chapNameGen = unicNameGenerator()
  for (const [index, ch] of questChapters_entries) {
    const chapName = ch['properties:10']['betterquesting:10']['name:8']
    const folder = 'Chapters/'+chapNameGen(chapName)+'/'
    const questLines = ch['quests:9']
    delete ch['quests:9']
    saveJSON(folder+'_props', {_index:index, _data: ch})

    const questNameGen = unicNameGenerator()
    for (const [lineIndex, q] of Object.entries(questLines)) {
      const jsQuest = questMap.get(q['id:3'])
      jsQuest._pos = {_index:lineIndex, _data: q}
      const qName = questNameGen(jsQuest._data['properties:10']['betterquesting:10']['name:8'])
      saveJSON(folder+qName, jsQuest)
    }

    h.step()
  }

  return totalFilesCreated
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
  for (const [k,v] of Object.entries(main)) {
    book[k] = v
  }

  function sortEntries(obj, field) {
    const toSort = field ? obj[field] : obj
    toSort.sort((a,b)=>parseInt(a[0].split(':')[0]) - parseInt(b[0].split(':')[0]))
    if(field) {
      obj[field] = Object.fromEntries(toSort)
      return
    }
    return Object.fromEntries(toSort)
  }

  const chapters = glob.sync(relative('betterquesting/Chapters/*'))
  for (const chapterFolder of chapters) {
    const props = json_abs(chapterFolder + '/_props.json')
    const chapterQuests = []

    for (const questJS of glob.sync(chapterFolder + '/!(_props)*.json').map(json_abs)) {
      book['questDatabase:9'].push([questJS._index, questJS._data])
      chapterQuests.push([questJS._pos._index, questJS._pos._data])
    }

    book['questLines:9'].push([
      props._index,
      {'quests:9':sortEntries(chapterQuests), ...props._data}
    ])
  }

  // Sort quest list
  sortEntries(book, 'questDatabase:9')
  sortEntries(book, 'questLines:9')

  writeFileSync(
    bq_quests_path,
    JSON.stringify(book, null, 2)
  )
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