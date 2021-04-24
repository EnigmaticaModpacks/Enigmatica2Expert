const fs = require('fs')
const path = require('path')
const glob = require('glob')

/*

  Split one huge file into many

*/
function parse() {

  // Saving files functions
  function saveParsed(filename, txt) {
    var filePath = path.resolve(__dirname, 'betterquesting/' + filename + '.json')
    fs.mkdirSync(path.dirname(filePath), { recursive: true })
    fs.writeFileSync(filePath, txt)
  }
  function saveJSON(filename, obj) { return saveParsed(filename, JSON.stringify(obj, null, 2)) }

  // Remove current splitted qiests
  fs.rmdirSync(path.resolve(__dirname, 'betterquesting'), { recursive: true })
  
  // Open lang file to make quests
  const questLang = Object.fromEntries(
    fs.readFileSync('resources/betterquesting/lang/en_us.lang','utf8')
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
      const narmalName = findRealQuestname(name).replace(/[/\\?%*:|"<>]/g, '-')
      let idName = narmalName
      let k = 0
      while (uniqNames.has(idName)) idName = narmalName + ' #' + k++
      uniqNames.add(idName)
      return idName
    }
  }

  // Open big file
  const bq_raw = JSON.parse(fs.readFileSync('config/betterquesting/DefaultQuests.json','utf8'))
  const questMap = new Map()
  Object.entries(bq_raw['questDatabase:9']).forEach(([i,q])=>{
    questMap.set(q['questID:3'], {_index:i,_pos:null,_data:q})
  })
  

  // Main
  const mainMap = bq_raw['questSettings:10']['betterquesting:10']
  saveJSON('_props', {['format:8']: bq_raw['format:8'], ['questSettings:10']:{['betterquesting:10']: mainMap}})

  // Chapters
  const chapNameGen = unicNameGenerator()
  for (const [index, ch] of Object.entries(bq_raw['questLines:9'])) {
    const qName = ch['properties:10']['betterquesting:10']['name:8']
    const folder = 'Chapters/'+chapNameGen(qName)+'/'
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
  }
}
// parse()

/*

  Join files into one

*/
function unparse() {
  function json_here(filePath) { return JSON.parse(
    fs.readFileSync(path.resolve(__dirname, filePath),'utf8')
  )}
  function json_abs(filePath) { return JSON.parse(
    fs.readFileSync(filePath,'utf8')
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

  const chapters = glob.sync(path.resolve(__dirname, 'betterquesting/Chapters/*'))
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

  fs.writeFileSync(
    'config/betterquesting/DefaultQuests.json',
    JSON.stringify(book, null, 2)
  )
}
// unparse()