const fs = require('fs')

function getLang(langCode) {
  return Object.fromEntries(
    fs.readFileSync('resources/betterquesting/lang/'+langCode+'.lang','utf8')
    .split('\n')
    .map(l=>[l.substring(0, l.indexOf('=')), l.substring(l.indexOf('=') + 1)])
  )
}

const en_us = getLang('en_us')
const ru_ru = getLang('ru_ru')

const langs = {en_us, ru_ru}

function checkAndAdd(id, obj, key) {
  const name = obj[key]
  if(name.match(/^bq\.[^.]+\.[^.]+$/)) {
    if(en_us[name]) return
    else {
      en_us[name] = 'Unlocalized ' + name
      ru_ru[name] = 'Unlocalized ' + name
    }
  }
  en_us['bq.'+id] = name
  ru_ru['bq.'+id] = name
  obj[key] = 'bq.'+id
}

// Quests
const bq_raw = JSON.parse(fs.readFileSync('config/betterquesting/DefaultQuests.json','utf8'))
Object.entries(bq_raw['questDatabase:9']).forEach(([_,q])=>{
  checkAndAdd('quest'+q['questID:3']+'.name', q['properties:10']['betterquesting:10'], 'name:8')
  checkAndAdd('quest'+q['questID:3']+'.desc', q['properties:10']['betterquesting:10'], 'desc:8')
})

// Chapters
Object.entries(bq_raw['questLines:9']).forEach(([_,q])=>{
  checkAndAdd('chapter'+q['lineID:3']+'.name', q['properties:10']['betterquesting:10'], 'name:8')
  checkAndAdd('chapter'+q['lineID:3']+'.desc', q['properties:10']['betterquesting:10'], 'desc:8')
})

// Save files
fs.writeFileSync('config/betterquesting/DefaultQuests.json', JSON.stringify(bq_raw, null, 2))


function saveLang(langCode) {
  const lFile = Object.entries(langs[langCode])
  lFile.sort((a,b)=>{
    const [_1, a1,a2] = a[0].match(/\w+\.(\w+\d+)\.(\w+)/)
    const [_2, b1,b2] = b[0].match(/\w+\.(\w+\d+)\.(\w+)/)
    return a1.localeCompare(b1, undefined, {numeric: true,sensitivity: 'base'}) || b2 - a2
  })
  fs.writeFileSync('resources/betterquesting/lang/'+langCode+'.lang', 
    lFile.map(([k,v])=>`${k}=${v.replace(/\n/g, '%n')}`).join('\n')
  )
}

saveLang('en_us')
saveLang('ru_ru')