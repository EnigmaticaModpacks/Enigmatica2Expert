const fs = require('fs-extra')
const { saveForGoogle, loadAfterForGoogle } = require('./langUtils.js')

const bq_path = 'config/betterquesting/DefaultQuests.json'
const BQ = JSON.parse(fs.readFileSync(bq_path, 'utf8'))
const en_us_lang = []
const keys = []
const ru_ru_unloc = []


for (const quest of Object.values(BQ['questDatabase:9'])) {
  const id = quest['questID:3']
  const props = quest['properties:10']['betterquesting:10']
  const name = props['name:8'].replace(/\n/gm,'%n')
  const desc = props['desc:8'].replace(/\n/gm,'%n')

  const key = {
    name: `bq.quest${id}.name`,
    desc: `bq.quest${id}.desc`,
  }
  props['name:8'] = key.name
  props['desc:8'] = key.desc
  keys.push(key.name)
  keys.push(key.desc)

  en_us_lang.push(`${key.name}=${name}`)
  en_us_lang.push(`${key.desc}=${desc}`)

  ru_ru_unloc.push(name)
  ru_ru_unloc.push(desc)
}

/*
  Rewrite whole BQ texts
*/
// fs.writeFileSync(bq_path, JSON.stringify(BQ, null, 2))
// return;

/*
  Save automatically generated lang file
*/
fs.writeFileSync(
  'resources/betterquesting/lang/en_us.lang',
  en_us_lang.join('\n')
)

/*
  Save file to manual translation
*/
saveForGoogle('bq', ru_ru_unloc)

/*
  Save russian translated file
*/
const ru_ru_lang = loadAfterForGoogle('bq')
  .map((l,i)=>`${keys[i]}=${l}`)

fs.writeFileSync(
    'resources/betterquesting/lang/ru_ru.lang',
    ru_ru_lang.join('\n')
  )