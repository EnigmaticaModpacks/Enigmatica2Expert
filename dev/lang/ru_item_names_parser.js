
import { readFileSync, writeFileSync } from 'fs-extra'
import path from 'path'

/********************************************

  .lang files

********************************************/

const lang_path = 'resources/enigmatica/lang/en_us.lang'
const lang_ru_path = 'resources/enigmatica/lang/ru_ru.lang'
const matcher = /^(tooltips\.lang\.[^=]+)=(.*)$/
const lang = 
  readFileSync(lang_path,'utf8')
  .split('\n')
  .map(l=>l.match(matcher)?.[2] ?? '')
  .filter(l=>l!=='')
  .map(l=>l.replace(/%(\S)/gm, '<<$1>>'))
  .map(l=>l.replace(/§(\S)/gm, '{{$1}}'))
  .map(l=>l.replace(/\\(\S)/gm, '(($1))'))
  .join('\n')

// fs.writeFileSync(relative('ru_ru.lang'), lang)

const ru_ru_lang_arr = readFileSync(relative('ru_ru.lang'),'utf8')
  .split('\n')
  .map(l=>l.replace(/< ?<(\S ?)> ?>/gm,     '%$1'))
  .map(l=>l.replace(/\{ ?\{(\S ?)\} ?\}/gm, '§$1'))
  .map(l=>l.replace(/\( ?\((\S ?)\) ?\)/gm, '\\$1'))

let k=-1
const translated = readFileSync(lang_path,'utf8')
  .split('\n')
  .map(l=> l.match(matcher)
    ? (k++, l.replace(matcher, '$1='+ru_ru_lang_arr[k].trim()))
    : l
  )
  .join('\n')


/********************************************

  item names

********************************************/

import csvParseSync from 'csv-parse/lib/sync'
import { uniqBy } from 'lodash'

const csv = csvParseSync(readFileSync(relative('ru_item_names.csv'),'utf8'), {columns: true})

function isNeedLoc(l) {
  return !l.DISPLAY_NAME.match(/.*[а-яА-Я].*/) &&
          l.DISPLAY_NAME.match(/.*[a-zA-Z].*/)
}

const newlang = 
  uniqBy(
  uniqBy(
  csv.filter(isNeedLoc), 
'DISPLAY_NAME'), 
'UNLOCALIZED')
// const newlang = csv.filter(isNeedLoc)
.filter(o=>!csv.some(p=>p.UNLOCALIZED===o.UNLOCALIZED && !isNeedLoc(p)))
.filter(o=>!o.DISPLAY_NAME.match(/(\w+\.)+\w+/))

const toLang = newlang.map(o=>o.DISPLAY_NAME).join('\n')

writeFileSync(relative('ru_ru_csv.txt'), toLang)

const newLangready = readFileSync(
  relative('ru_ru_csv_translated'),'utf8'
)
.split('\n')

const addsNewLang = newlang.map((o,i)=>
  newLangready[i].match(/.*[а-яА-Я].*/)
  ? `${o.UNLOCALIZED}.name=${newLangready[i]}`
  : ''
)
.filter(o=>o!=='')
.join('\n')

writeFileSync(lang_ru_path, translated + '\n\n\n' + addsNewLang)