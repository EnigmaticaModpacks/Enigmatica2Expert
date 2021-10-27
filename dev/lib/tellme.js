
//@ts-check

const _ = require('lodash')
const { getCSV, config } = require('./utils')

/** @type {Set<string>} */
let isBlocks
/**
 * @param {string} itemID
 */
module.exports.isBlock = (itemID) => (
  isBlocks ??= new Set(getCSV('config/tellme/blocks-csv.csv').map(o=>o['Registry name']))
).has(itemID)

/** @type {Set<string>} */
let existOreDicts
/**
 * @param {string} oreName
 */
const isODExist = module.exports.isODExist = (oreName) => (
  existOreDicts ??= new Set(getCSV('config/tellme/items-csv.csv').map(o=>o['Ore Dict keys'].split(',')).flat())
).has(oreName)

/** @type {Set<string>} */
let existItems
module.exports.isItemExist = (id) => (
  existItems ??= new Set(getCSV('config/tellme/items-csv.csv').map(o=>o['Registry name']))
).has(id.split(':').slice(0,2).join(':'))

/** @type {Set<string>} */
let jeiBlacklist
module.exports.isJEIBlacklisted = (def,meta) => (
  jeiBlacklist ??= new Set(config('config/jei/itemBlacklist.cfg').advanced.itemBlacklist)
).has(def) || jeiBlacklist.has(def+':'+(meta??'0'))


let itemsTree

const initItemsTree = ()=> itemsTree ??= 
  getCSV('config/tellme/items-csv.csv').reduce(
  (result, o) => (
    // @ts-ignore
    (result[o['Registry name']] ??= {})[o['Meta/dmg']] = new Set(o['Ore Dict keys'].split(','))
  , result), {})

/** @type {function(string,string=):Set<string>} */
module.exports.getItemOredictSet = (id,meta='0') => (initItemsTree()[id] ??= {})[meta=='*' ? 0 : meta] ??= new Set()

module.exports.getSubMetas = (definition) => Object.keys(initItemsTree()[definition] ??= {}).map(s=>parseInt(s))


/**
 * @typedef {Object} TMStack Tell Me Item Stack
 * @property {string} mod 'Astral Sorcery'
 * @property {string} id 'minecraft:stone'
 * @property {number} itemId 1234
 * @property {number} damage 2
 * @property {boolean} hasSubtypes true
 * @property {string} display 'Celestial Altar'
 * @property {string[]} ores 'stoneGranite,stoneGranitePolished'
 * @property {string} owner 'astralsorcery'
 * @property {string} commandString '<astralsorcery:blockaltar:2>'
 */

/**
 * 
 * @param {string} ore 
 * @returns {TMStack[]}
 */
const getByOredict = module.exports.getByOredict = (ore) => {
  return getOresByRegex(new RegExp(`^${ore}$`, 'i'))
}

/**
 * 
 * @param {string} oreBase 
 * @returns {{[OreKind: string]: TMStack}}
 */
module.exports.getByOreBase = (oreBase) => {
  return getByOreRgx(new RegExp(`^(\\w+)${oreBase}$`))
}

/**
 * 
 * @param {string} kindKey 
 * @returns {{[OreBase: string]: TMStack}}
 */
const getByOreKind = module.exports.getByOreKind = (kindKey) => {
  return getByOreRgx(new RegExp(`^${kindKey}([A-Z]\\w+)$`))
}


/**
 * @param {string[]} kindKeys 
 * @returns {string[]} oreBases which exist each of keys
 */
module.exports.getOreBases_byKinds = (kindKeys) => {
  let entries = Object.entries(getByOreKind(kindKeys[0]))
  kindKeys.slice(1).forEach(kindKey=> {
    entries = entries.filter(([oreBase])=>isODExist(kindKey+oreBase))
  })
  
  return entries.map(([b])=>b)
}

/**
 * 
 * @param {RegExp} rgx 
 * @returns {{[capturedPart: string]: TMStack}}
 */
function getByOreRgx(rgx) {
  /** @type {Object<string, TMStack[]>} */
  const result = {}
  getOresByRegex(rgx)
  .forEach(tm => {
    const oreKind = tm.ores
      .find(s=>rgx.test(s))
      .replace(rgx, '$1')
    ;(result[oreKind] ??= []).push(tm)
  })

  return _(result).mapValues(o => o.sort(prefferedModSort)[0]).value()
}

/**
 * @param {RegExp} rgx
 */
function getOresByRegex(rgx) {
  return getCSV('config/tellme/items-csv.csv')
  .filter(o=>o['Ore Dict keys'])
  .filter(o=>o['Ore Dict keys'].split(',').some(ore=>rgx.test(ore)))
  .map(tellmeToObj)
}

/**
 * 
 * @param {{[tellmeCSVKey: string]: string}} o 
 * @returns {TMStack}
 */
function tellmeToObj(o) {
  return {
    mod: o['Mod name'],
    owner: o['Registry name'].split(':')[0],
    id: o['Registry name'],
    itemId: parseInt(o['Item ID']),
    damage: parseInt(o['Meta/dmg']),
    hasSubtypes: o['Subtypes']==='true',
    display: o['Display name'],
    ores: o['Ore Dict keys'].split(','),
    commandString: `<${o['Registry name']}${o['Meta/dmg']=='0'?'':':'+o['Meta/dmg']}>`
  }
}

/**
 * 
 * @param {string} ore 
 * @returns {TMStack}
 */
module.exports.getByOredict_first = (ore) => getByOredict(ore).sort(prefferedModSort)[0]

/** @type {Object<string,number>}}*/
const modWeights = `
  minecraft
  thermalfoundation
  immersiveengineering
  ic2
  mekanism
  appliedenergistics2
  actuallyadditions
  tconstruct
  chisel
  biomesoplenty
  nuclearcraft
  draconicevolution
  libvulpes
  astralsorcery
  rftools
  extrautils2
  forestry
  bigreactors
  enderio
  exnihilocreatio
`.trim().split('\n').map(l=>l.trim()).reverse().reduce((map,v,i)=>(map[v]=i, map),{})

/**
 * @param {TMStack} a 
 * @param {TMStack} b
 */
const prefferedModSort = module.exports.prefferedModSort = (a,b) => {
  const va = modWeights[b.owner]??0, vb = modWeights[a.owner]??0
  return va > vb ? 1 : (va < vb ? -1 : 0)
}