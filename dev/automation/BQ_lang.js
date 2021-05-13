/*

This script lookup all non-lang strings in BetterQuesting Book
and replace them with codes, creating .lang file entries

*/


const fs = require('fs')
const {isPathHasChanged, naturalSort} = require('../lib/utils.js')

const validCodes = [
  'en_us',
  'ru_ru',
]

const getLangPath = (langCode) => 'resources/betterquesting/lang/'+langCode+'.lang'

const defaultQuests_path = 'config/betterquesting/DefaultQuests.json'
if(isPathHasChanged(defaultQuests_path) || validCodes.map(getLangPath).some(isPathHasChanged)) {
  console.log(' ❌📖 BQ_lang error: Quests or Langs have changes!')
  process.exit(1)
}

const langFiles = validCodes.map(getLangFile)
const mainLang = langFiles[0]

// Quests
const bq_raw = JSON.parse(fs.readFileSync(defaultQuests_path,'utf8'))
let hasChanges = false
Object.entries(bq_raw['questDatabase:9']).forEach(([_,q])=>{
  checkAndAdd(q, 'quest'+q['questID:3'], 'name')
  checkAndAdd(q, 'quest'+q['questID:3'], 'desc')
})

// Chapters
Object.entries(bq_raw['questLines:9']).forEach(([_,q])=>{
  checkAndAdd(q, 'chapter'+q['lineID:3'], 'name')
  checkAndAdd(q, 'chapter'+q['lineID:3'], 'desc')
})

// Save files
if(hasChanges) fs.writeFileSync(defaultQuests_path, JSON.stringify(bq_raw, null, 2))

// Save lang files
validCodes.forEach((code, i) => saveLang(code, langFiles[i]))

/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////

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

function checkAndAdd(json_obj, lang_root, fieldName) {
  const lang_id = lang_root + '.' + fieldName
  const bq_props= json_obj['properties:10']['betterquesting:10']
  const bq_key  = fieldName + ':8'
  const text = bq_props[bq_key]

  if(isLangCode(text)) {
    if(mainLang[text] === undefined) undefinedLangCode(text)
    return
  }

  const langCode = 'bq.'+lang_id
  langFiles.forEach(l=>l[langCode] = text)
  if(bq_props[bq_key] !== langCode) hasChanges = true
  bq_props[bq_key] = langCode
}

function isLangCode(text) { return !!text.match(/^(\w+\.)+\w+$/) }

function undefinedLangCode(langCode) {
  langFiles.forEach(l=>l[langCode] = '[undefined lang code]')
}

function saveLang(langCode, langFile) {
  const lFile = Object.entries(langFile)
  lFile.sort(([a_key],[b_key])=>{
    const [_a, a1,a2] = a_key.split('.')
    const [_b, b1,b2] = b_key.split('.')
    return naturalSort(a1, b1) || b2 - a2
  })
  fs.writeFileSync(getLangPath(langCode), 
    lFile.map(([k,v]) =>
      `${k}=${v.replace(/\n/g, '%n')}`
    ).join('\n')
  )
}