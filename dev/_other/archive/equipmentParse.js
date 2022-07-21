import { readFileSync, writeFileSync } from 'fs'

const jsonText = readFileSync(relative('DefaultQuests.json'))
// var jsonText = fs.readFileSync('./DefaultQuests.json').toString();
let O = JSON.parse(jsonText)
let log = console.log
import {
  listMatter as _listMatter,
  livingmatter as _livingmatter,
  mobspawn,
} from './Entities.js'

let s = `# ######################################################################
#
# This file automatically generated from equipmentParse.js
#
# ######################################################################

import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;

#priority 10

`

// # ######################################################################
// #
// # Utils
// #
// # ######################################################################

function renameKeys(obj, fn) {
  if (typeof fn !== 'function') {
    return obj
  }

  let keys = Object.keys(obj)
  let result = {}

  for (var i = 0; i < keys.length; i++) {
    let key = keys[i]
    if (key == '__') {
      continue
    }

    let val = obj[key]
    let str = fn(key, val)
    if (typeof str === 'string' && str !== '') {
      key = str
    }
    result[key] = val
  }

  // Check if its array rather than object
  let newKeys = Object.keys(result)
  let isArray = newKeys[0] == 0
  if (isArray) {
    for (var i = 1; i < newKeys.length; i++) {
      if (parseInt(newKeys[i]) != parseInt(newKeys[i - 1]) + 1) {
        isArray = false
      }
    }
  }
  return isArray ? Object.values(result) : result
}

function renameDeep(obj, cb) {
  let type = typeof obj

  if (type !== 'object' && type !== 'array') {
    throw new Error('expected an object')
  }

  let res = []
  if (type === 'object') {
    obj = renameKeys(obj, cb)
  }
  if (!Array.isArray(obj)) {
    res = {}
  }

  for (let key in obj) {
    if (key == '__') {
      continue
    }
    if (obj.hasOwnProperty(key)) {
      let val = obj[key]
      if (typeof val === 'object' || typeof val === 'array') {
        res[key] = renameDeep(val, cb)
      } else {
        res[key] = val
      }
    }
  }
  return res
}

// # ######################################################################
// #
// # Parsing DefaultQuests
// #
// # ######################################################################
// log(O);

// for (const key in O) {
//     log(key, O[key]);
// }

let armorObjList = []

let findKey
findKey = function (obj, keyName, keyValue) {
  for (const key in obj) {
    if (key == '__') {
      continue
    }

    let o = obj[key]
    if (typeof o !== 'object') {
      if (typeof o === 'string' && o.includes(keyValue)) {
        // log("----value found! key:",keyName, " val:", o);
        armorObjList.push(obj)
      }
    } else {
      o.__ = obj
      findKey(o, keyName, keyValue)
    }
  }
}
findKey(O, 'command:8', 'gamestage silentadd VAR_NAME')

// log("array length: ", armorObjList.length)

// Find quest object by ID
let questDatabase = O['questDatabase:9']
function findQuest(id) {
  for (const key in questDatabase) {
    if (questDatabase[key]['questID:3'] == id) {
      return questDatabase[key]
    }
  }
}

function idtag(obj) {
  let r = { id: '', tag: null }
  let id = obj['id:8']
  if (id != undefined) {
    r.id = id

    if (obj['tag:10'] != undefined) {
      r.tag = renameDeep(obj['tag:10'], (key) => {
        return key.split(':').shift()
      })
    }
  } else {
    // r.id = "thaumcraft:void_boots"
  }
  return r
}

let listRequiredArmor = []
let m = 0
for (const key in armorObjList) {
  var o = armorObjList[key]
  let quest = o.__.__
  let l = new Object() // Current armor set string list

  // Stage name
  l.name = o['command:8'].split('gamestage silentadd VAR_NAME ').pop()

  // Previous stage
  try {
    let prevID = findQuest(quest['preRequisites:11'][0])
    l.prev = prevID['rewards:9']['1:10']['command:8']
      .split('gamestage silentadd VAR_NAME ')
      .pop()
  } catch {
    l.prev = null
  }

  // Armor parts
  let tasklist = quest['tasks:9']['0:10']['requiredItems:9']
  l.list = []
  for (const tl in tasklist) {
    if (tl == '__') {
      continue
    }
    l.list.push(idtag(tasklist[tl]))
  }

  // Sword and shield
  let rewardList = quest['rewards:9']['0:10']['choices:9']
  l.list.push(idtag(rewardList['0:10']))
  l.list.push(idtag(rewardList['1:10']))

  listRequiredArmor.push(l)
  m++
}
// log("listRequiredArmor length: ", listRequiredArmor.length)

// log(listRequiredArmor)

// Parse to IData

function getTier(o, k = 1) {
  if (o.prev != null) {
    for (const i in listRequiredArmor) {
      if (listRequiredArmor[i].name == o.prev) {
        // This is parent, dig deeper
        return getTier(listRequiredArmor[i], k + 1)
      }
    }
    throw new Error('Parent name here, but no actual field')
  } else {
    // We found root armor set, no parent
    return k
  }
}

// # ######################################################################
// #
// # Writing parsed Quests
// #
// # ######################################################################

s += 'static armorStaged as IData[string] = \n{\n'
for (const it in listRequiredArmor) {
  var o = listRequiredArmor[it]
  s += `  ${o.name}:{
    prev: ${o.prev == null ? 'null' : '"' + o.prev + '"'}, 
    tier: ${getTier(o)},
    list: [
`
  for (let i = 0; i < 6; i++) {
    var id = o.list[i].id
    let tagObj = o.list[i].tag
    let tag = tagObj
      ? ', tag:' + JSON.stringify(tagObj).replace(/\"([^(\")"]+)\":/g, '$1:')
      : ''
    s += `      {id:\"${id}\"${tag}}${i < 5 ? ',\n' : '\n'}`
  }
  s += '  ]},\n'
}
s = s.slice(0, -2) + '\n' // Remove last comma
s += '} as IData[string];\n\n'

// Now sort and write list of keys
listRequiredArmor.sort((a, b) => getTier(a) - getTier(b))

s += 'static armorSortedKeys as IData = ['
let prevTier = 0
let j = 0
for (const it in listRequiredArmor) {
  var o = listRequiredArmor[it]
  let tier = getTier(o)
  if (tier > prevTier) {
    prevTier = tier
    j = 0
    s += `\n/*Tier ${tier.toString().padEnd(2)}*/ `
  } else {
    j++
  }
  // var oblock = o.name + "\","
  // s += `${j%3==0?"  ":""}"${j%3==2?oblock+"\n":oblock.padEnd(23)+" "}`
  s += `"${o.name}", `
}
s = s.slice(0, -2) + '\n] as IData;\n\n'

// # ######################################################################
// #
// # UU-matter cost tooltips
// #
// # ######################################################################

let listMatter = _listMatter

const regexp = /(\w+:\w+)@*(\d*) = (\d+)/g
const matches = listMatter.matchAll(regexp)

s += `#           mod:id                          meta     UUvalue
static matterTooltips as string[] = [\n`
for (const match of matches) {
  s +=
    ('  "' + match[1] + '",').padEnd(44) +
    ('"' + (match[2] ? match[2] : 0) + '",').padEnd(9) +
    '"' +
    match[3] +
    '",\n'
  // console.log("\""+match[1]+ "\", \"" + ((match[2])?(match[2]):0)+ "\", \"" + match[3] +"\",");
}
s += '] as string[];\n'

// # ######################################################################
// #
// # Finishing
// #
// # ######################################################################

let savePath = relative('_both/scripts/DataTables.zs')
writeFileSync(savePath, s)

// # ######################################################################
// #
// # RFTools entity list
// #
// # ######################################################################

let rftoolsPath = relative('_both/config/rftools/rftools.cfg')
let rftools_cfg = readFileSync(rftoolsPath, 'utf8')

function replaceBetweenKeywords(source, word1, word2, replace) {
  return source.replace(
    new RegExp(`${word1}[\\s\\S]*?${word2}`),
    `${word1}\n${replace}${word2}`
  )
}

const entities = mobspawn
let mobspawnrf = ''
let mobspawnamounts = ''
for (i = 0; i < entities.length; i += 4) {
  var id = entities[i]
  let item = entities[i + 1]
  let block = entities[i + 2]
  let cost = entities[i + 3]
  mobspawnrf += `    I:\"${id}\"=${cost}\n`

  mobspawnamounts += `    S:\"${id}.spawnamount.0\" <
        I
        ${item}
        0
        ${(cost / 10000).toFixed(1)}
     >
    S:\"${id}.spawnamount.1\" <
        B
        ${block}
        0
        ${(cost / 2000).toFixed(1)}
     >
    S:\"${id}.spawnamount.2\" <
        L
        
        0
        ${Math.round(Math.sqrt(cost)).toFixed(1)}
     >
`
}

// Resource cost
rftools_cfg = replaceBetweenKeywords(
  rftools_cfg,
  '# Extended mobspawnamounts {',
  '# Extended mobspawnamounts }',
  mobspawnamounts
)

// RF cost
rftools_cfg = replaceBetweenKeywords(
  rftools_cfg,
  '# Extended mobspawnrf {',
  '# Extended mobspawnrf }',
  mobspawnrf
)

// Living matter
const livingmatter = _livingmatter
let e2eNextIndex = 34
let sliving = ''
for (i = 0; i < livingmatter.length; i += 3) {
  var id = livingmatter[i + 2]
  let type = livingmatter[i + 1]
  let value = livingmatter[i]

  sliving += `    S:living.${e2eNextIndex} <
        ${type}
        ${id}
        ${value}
     >
`
  e2eNextIndex++
}
rftools_cfg = replaceBetweenKeywords(
  rftools_cfg,
  '# Extended livingmatter {',
  '# Extended livingmatter }',
  sliving
)

writeFileSync(rftoolsPath, rftools_cfg)
