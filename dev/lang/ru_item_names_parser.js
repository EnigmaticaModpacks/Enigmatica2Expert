
const fs = require('fs-extra')
const path = require('path')

/********************************************

  .lang files

********************************************/

const lang_path = 'resources/enigmatica/lang/en_us.lang'
const lang_ru_path = 'resources/enigmatica/lang/ru_ru.lang'
const matcher = /^(tooltips\.lang\.[^=]+)=(.*)$/
const lang = 
fs.readFileSync(lang_path,'utf8')
  .split('\n')
  .map(l=>l.match(matcher)?.[2] ?? '')
  .filter(l=>l!=='')
  .map(l=>l.replace(/%(\S)/gm, '<<$1>>'))
  .map(l=>l.replace(/§(\S)/gm, '{{$1}}'))
  .map(l=>l.replace(/\\(\S)/gm, '(($1))'))
  .join('\n')

// fs.writeFileSync(path.resolve(__dirname, 'ru_ru.lang'), lang)

const ru_ru_lang_arr = fs.readFileSync(path.resolve(__dirname, 'ru_ru.lang'),'utf8')
  .split('\n')
  .map(l=>l.replace(/< ?<(\S ?)> ?>/gm,     '%$1'))
  .map(l=>l.replace(/\{ ?\{(\S ?)\} ?\}/gm, '§$1'))
  .map(l=>l.replace(/\( ?\((\S ?)\) ?\)/gm, '\\$1'))

let k=-1
const translated = fs.readFileSync(lang_path,'utf8')
  .split('\n')
  .map(l=> l.match(matcher)
    ? (k++, l.replace(matcher, '$1='+ru_ru_lang_arr[k].trim()))
    : l
  )
  .join('\n')


/********************************************

  item names

********************************************/

const csvParseSync = require('csv-parse/lib/sync')
const _ = require('lodash')

const csv = csvParseSync(fs.readFileSync(path.resolve(__dirname, 'ru_item_names.csv'),'utf8'), {columns: true})

function isNeedLoc(l) {
  return !l.DISPLAY_NAME.match(/.*[а-яА-Я].*/) &&
          l.DISPLAY_NAME.match(/.*[a-zA-Z].*/)
}

const newlang = 
_.uniqBy(
_.uniqBy(
  csv.filter(isNeedLoc), 
e=>e.DISPLAY_NAME), 
f=>f.UNLOCALIZED)
// const newlang = csv.filter(isNeedLoc)
.filter(o=>!csv.some(p=>p.UNLOCALIZED===o.UNLOCALIZED && !isNeedLoc(p)))
.filter(o=>!o.DISPLAY_NAME.match(/(\w+\.)+\w+/))

const toLang = newlang.map(o=>o.DISPLAY_NAME).join('\n')

fs.writeFileSync(path.resolve(__dirname, 'ru_ru_csv.txt'), toLang)

const newLangready = fs.readFileSync(
  path.resolve(__dirname, 'ru_ru_csv_translated'),'utf8'
)
.split('\n')

const addsNewLang = newlang.map((o,i)=>
  newLangready[i].match(/.*[а-яА-Я].*/)
  ? `${o.UNLOCALIZED}=${newLangready[i]}`
  : ''
)
.filter(o=>o!=='')
.join('\n')

fs.writeFileSync(lang_ru_path, translated + '\n\n\n' + addsNewLang)