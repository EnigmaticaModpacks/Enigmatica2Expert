/**
 * @file This script lookup all non-lang strings in BetterQuesting Book
 * and replace them with codes, creating .lang file entries
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

const fs = require('fs')
const {isPathHasChanged, naturalSort} = require('../lib/utils.js')

const validCodes = [
  'en_us',
  'ru_ru',
]

const defaultQuests_path = 'config/betterquesting/DefaultQuests.json'
let hasChanges = false

/** @type {Object<string, string>[]} */
let langFiles

async function init() {
  if(isPathHasChanged(defaultQuests_path) || validCodes.map(getLangPath).some(isPathHasChanged)) {
    console.log(' ❌📖 BQ_lang error: Quests or Langs have changes!')
    return
  }

  langFiles = validCodes.map(getLangFile)

  /** @type {Object} */
  const bq_raw = JSON.parse(fs.readFileSync(defaultQuests_path,'utf8'))

  // Quests
  Object.entries(bq_raw['questDatabase:9']).forEach(([_,q])=>{
    checkAndAdd(q, 'quest'+q['questID:3'], 'name')
    checkAndAdd(q, 'quest'+q['questID:3'], 'desc')
  })

  // Chapters
  Object.entries(bq_raw['questLines:9']).forEach(([_,q])=>{
    checkAndAdd(q, 'chapter'+q['lineID:3'], 'name')
    checkAndAdd(q, 'chapter'+q['lineID:3'], 'desc')
  })

  if(hasChanges) save_DefaultQuests_json(bq_raw)

  // Save lang files
  validCodes.forEach((code, i) => saveLang(code, langFiles[i]))
}

/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////


/**
 * @param {string} langCode
 */
function getLangPath(langCode) {
  return 'resources/betterquesting/lang/' + langCode + '.lang'
}


// Save files
/**
 * @param {Object} jsonObj
 */
function save_DefaultQuests_json(jsonObj) {
  const str = JSON.stringify(jsonObj, null, 2)
    .replace(/^(\s*"[^:]+:6": -?\d+\.\d+)e\+(\d+,?)$/gm, '$1E$2') // Restore e+ values
    .replace(/^(\s*"[^:]+:6": )1(0{7,})(,?)$/gm, (m, p1, p2, p3) => p1 + '1.0E' + p2.length + p3) // Add e+ values for round numbers
    .replace(/^(\s*"[^:]+:(?:6|5)": -?\d+)(,?)$/gm, '$1.0$2') // Add decimal to float values
    .replace(/^\s*"[^:]+:8": ".*'.*",?$/gm, (m) => m.replace('\'', '\\u0027')) // Change characters to codes
  fs.writeFileSync(defaultQuests_path, str)
}

/**
 * @param {string} langCode
 */
function getLangFile(langCode) {
  return Object.fromEntries(
    fs.readFileSync(getLangPath(langCode),'utf8')
    .split('\n')
    .map(l=>[
      l.substring(0, l.indexOf('=')),
      l.substring(l.indexOf('=') + 1)
    ])
  )
}

/**
 * @param {Object} json_obj
 * @param {string} lang_root
 * @param {string} fieldName
 */
function checkAndAdd(json_obj, lang_root, fieldName) {
  const lang_id = lang_root + '.' + fieldName
  const bq_props= json_obj['properties:10']['betterquesting:10']
  const bq_key  = fieldName + ':8'
  const text = bq_props[bq_key]

  if(isLangCode(text)) {
    if(langFiles[0][text] === undefined) undefinedLangCode(text)
    return
  }

  const langCode = 'bq.'+lang_id
  langFiles.forEach(l=>l[langCode] = text)
  if(bq_props[bq_key] !== langCode) hasChanges = true
  bq_props[bq_key] = langCode
}

/**
 * @param {string} text
 */
function isLangCode(text) { return !!text.match(/^(\w+\.)+\w+$/) }

/**
 * @param {string} langCode
 */
function undefinedLangCode(langCode) {
  langFiles.forEach(l=>l[langCode] = '[undefined lang code]')
}


/**
 * @param {string} langCode
 * @param {Object<string, string>} langFile
 */
function saveLang(langCode, langFile) {
  const lFile = Object.entries(langFile)
  
  lFile.sort(([a_key],[b_key])=>{
    const [,a1,a2] = a_key.split('.')
    const [,b1,b2] = b_key.split('.')
    //@ts-ignore
    return naturalSort(a1, b1) || b2 - a2
  })

  fs.writeFileSync(getLangPath(langCode), 
    lFile.map(([k,v]) =>
      `${k}=${v.replace(/\n/g, '%n')}`
    ).join('\n')
  )
}


module.exports.init = init
if(process.argv?.[0]?.split('\\').pop()==='node.exe') init()