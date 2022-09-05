// @ts-check

import _ from 'lodash'

import { config, getCSV, loadText, naturalSort } from './utils.js'

/** @type {Set<string>} */
let isBlocks
/**
 * @param {string} itemID
 */
export function isBlock(itemID) {
  return (isBlocks ??= new Set(
    getCSV('config/tellme/blocks-csv.csv').map(o => o['Registry name'])
  )).has(itemID)
}

/** @type {Set<string>} */
let existOreDicts
/**
 * @param {string} oreName
 */
export const isODExist = oreName =>
  (existOreDicts ??= new Set(
    getCSV('config/tellme/items-csv.csv')
      .map(o => o['Ore Dict keys'].split(','))
      .flat()
  )).has(oreName)

/** @type {Set<string>} */
let existItems
export function isItemExist(id) {
  return (existItems ??= new Set(
    getCSV('config/tellme/items-csv.csv').map(o => o['Registry name'])
  )).has(id.split(':').slice(0, 2).join(':'))
}

/** @type {Set<string>} */
let jeiBlacklist
export function isJEIBlacklisted(def, meta) {
  return (
    (jeiBlacklist ??= new Set(
      config('config/jei/itemBlacklist.cfg').advanced.itemBlacklist
    )).has(def) || jeiBlacklist.has(`${def}:${meta ?? '0'}`)
  )
}

/** @type {Set<string>} */
let purgedSet
/** @param {string} ctCapture */
export function isPurged(ctCapture) {
  return (purgedSet ??= new Set(
    [
      ...loadText('crafttweaker.log').matchAll(
        /^\[INITIALIZATION\]\[CLIENT\]\[INFO\] purged: (.*)$/gm
      ),
    ]
      .map(m => m[1])
      .map(s => s.match(/(<[^>]+?>(.withTag\(.*\))?)/)[1])
      .filter(s => s)
  )).has(ctCapture)
}

let itemsTree

export const getItemsTree = () =>
  (itemsTree ??= getCSV('config/tellme/items-csv.csv').reduce(
    (result, o) => (
      // @ts-expect-error
      ((result[o['Registry name']] ??= {})[o['Meta/dmg']] = new Set(
        o['Ore Dict keys'].split(',')
      )),
      result
    ),
    {}
  ))

/** @type {function(string,string=):Set<string>} */
export function getItemOredictSet(id, meta = '0') {
  return ((getItemsTree()[id] ??= {})[meta === '*' ? 0 : meta] ??= new Set())
}

/**
 * Get all available meta variations
 * @param {string} definition minecraft:stone
 * @returns {number[]}
 */
export function getSubMetas(definition) {
  return Object.keys((getItemsTree()[definition] ??= {})).map(s => Number(s))
}

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
 * @property {string} commandString '\<astralsorcery:blockaltar:2\>'
 * @property {(multiplier: number)=>string} withAmount '\<astralsorcery:blockaltar:2\> * 2'
 */

/**
 *
 * @param {string} ore
 * @returns {TMStack[]}
 */
export const getByOredict = (ore) => {
  return getOresByRegex(new RegExp(`^${ore}$`, 'i'))
}

/**
 *
 * @param {string} oreBase
 * @returns {{[OreKind: string]: TMStack}}
 */
export function getByOreBase(oreBase) {
  return getByOreRgx(new RegExp(`^(\\w+)${oreBase}$`))
}

/**
 *
 * @param {string} kindKey
 * @returns {{[OreBase: string]: TMStack}}
 */
export const getByOreKind = (kindKey) => {
  return getByOreRgx(new RegExp(`^${kindKey}([A-Z]\\w+)$`))
}

/**
 * @param {string[]} kindKeys
 * @returns {string[]} oreBases which exist each of keys
 */
export function getOreBases_byKinds(kindKeys) {
  let entries = Object.entries(getByOreKind(kindKeys[0]))
  kindKeys.slice(1).forEach((kindKey) => {
    entries = entries.filter(([oreBase]) => isODExist(kindKey + oreBase))
  })

  return entries.map(([b]) => b)
}

/**
 *
 * @param {RegExp} rgx
 * @returns {{[capturedPart: string]: TMStack}}
 */
function getByOreRgx(rgx) {
  /** @type {Object<string, TMStack[]>} */
  const result = {}
  getOresByRegex(rgx).forEach((tm) => {
    const oreKinds = tm.ores
      .filter(s => rgx.test(s))
      .map(s => s.replace(rgx, '$1'))
    for (const oreKind of oreKinds)
      (result[oreKind] ??= []).push(tm)
  })

  return _(result)
    .mapValues(o => o.sort(prefferedModSort)[0])
    .value()
}

/**
 * @param {RegExp} rgx
 */
function getOresByRegex(rgx) {
  return getCSV('config/tellme/items-csv.csv')
    .filter(o => o['Ore Dict keys']?.split(',').some(ore => rgx.test(ore)))
    .map(tellmeToObj)
}

/**
 *
 * @param {{[tellmeCSVKey: string]: string}} o
 * @returns {TMStack}
 */
function tellmeToObj(o) {
  return {
    mod          : o['Mod name'],
    owner        : o['Registry name'].split(':')[0],
    id           : o['Registry name'],
    itemId       : Number(o['Item ID']),
    damage       : Number(o['Meta/dmg']),
    hasSubtypes  : o.Subtypes === 'true',
    display      : o['Display name'],
    ores         : o['Ore Dict keys'].split(','),
    commandString: `<${o['Registry name']}${
      o['Meta/dmg'] === '0' ? '' : `:${o['Meta/dmg']}`
    }>`,
    withAmount(amount) {
      return this.commandString + (amount > 1 ? ` * ${amount}` : '')
    },
  }
}

/**
 *
 * @param {string} ore
 * @returns {TMStack}
 */
export function getByOredict_first(ore) {
  return getByOredict(ore).sort(prefferedModSort)[0]
}

/** @type {Object<string,number>}} */
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
`
  .trim()
  .split('\n')
  .map(l => l.trim())
  .reverse()
  .reduce((map, v, i) => ((map[v] = i), map), {})

/**
 * @param {TMStack} a
 * @param {TMStack} b
 */
export const prefferedModSort = (a, b) => {
  const va = modWeights[b.owner] ?? 0
  const vb = modWeights[a.owner] ?? 0
  return va > vb ? 1 : va < vb ? -1 : 0
}

/**
 * @typedef {Object} FurnaceRecipe
 * @property {string} output
 * @property {string} out_id
 * @property {string} out_meta
 * @property {string} out_tail
 * @property {string} out_tag
 * @property {string} out_amount
 * @property {string} input
 * @property {string} in_id
 * @property {string} in_meta
 * @property {string} in_tail
 * @property {string} in_tag
 * @property {string} in_amount
 */

function matchFurnaceRecipes(text) {
  if (!text) return undefined
  return /** @type {FurnaceRecipe[]} */ (
    [
      ...text.matchAll(
        /^furnace\.addRecipe\((?<output><(?<out_id>[^>]+?)(?::(?<out_meta>\*|\d+))?>(?<out_tail>(\.withTag\((?<out_tag>\{.*?\})\))?( \* (?<out_amount>\d+))?)?), (?<input><(?<in_id>[^>]+?)(?::(?<in_meta>\*|\d+))?>(?<in_tail>(\.withTag\((?<in_tag>\{.*?\})\))?( \* (?<in_amount>\d+))?)?), .+\)$/gm
      ),
    ]
      .map(m => m.groups)
      .sort((a, b) => naturalSort(a.input, b.input))
  )
}

/**
 * @param {string} from
 * @param {string} to
 */
export function getCrtLogBlock(from, to) {
  const text = loadText('crafttweaker.log')
  const startIndex = text.indexOf(from)
  if (startIndex === -1) return ''

  const sub = text.substring(startIndex + from.length)
  const endIndex = sub.indexOf(to)

  return endIndex === -1 ? sub : sub.substring(0, endIndex)
}

/**
 * @type {FurnaceRecipe[]}
 */
let furnaceRecipesHashed
export function getFurnaceRecipes() {
  if (furnaceRecipesHashed) return furnaceRecipesHashed
  return (furnaceRecipesHashed = matchFurnaceRecipes(
    getCrtLogBlock('\nFurnace Recipes:\n', '\nRecipes:\n')
  ))
}

/**
 * @type {FurnaceRecipe[]}
 */
let furnaceRecipesUnchangedHashed
export function getUnchangedFurnaceRecipes() {
  if (furnaceRecipesUnchangedHashed) return furnaceRecipesUnchangedHashed

  const subSub = getCrtLogBlock(
    '#         Unchanged furnace recipes dump         #',
    '##################################################'
  )
  if (!subSub) return undefined

  return (furnaceRecipesUnchangedHashed = matchFurnaceRecipes(
    subSub
      .split('\n')
      .map(
        s =>
          s.match(
            /\[INITIALIZATION\]\[CLIENT\]\[INFO\] (furnace\.addRecipe\(.+)/
          )?.[1]
      )
      .filter(s => s)
      .join('\n')
  ))
}

/**
 * @param {TMStack} tm
 * @returns {TMStack}
 */
export function smelt(tm) {
  const r = getFurnaceRecipes().find(
    r => r.input.replace(':*', '') === tm.commandString
  )
  if (!r) return undefined

  return tellmeToObj(
    _(getCSV('config/tellme/items-csv.csv'))
      .filter(o => o['Registry name'] == r.out_id)
      .filter(o => o['Meta/dmg'] == (r.out_meta ?? '0'))
      .first()
  )
}

/**
 * @param {string} ore
 * @returns {TMStack}
 */
export function smeltOre(ore) {
  for (const tm of getByOredict(ore)) {
    const smelted = smelt(tm)
    if (smelted) return smelted
  }
}

const baseMultiplier = {
  Amber              : 2,
  Amethyst           : 2,
  Apatite            : 10,
  Aquamarine         : 4,
  CertusQuartz       : 3,
  ChargedCertusQuartz: 2,
  Coal               : 5,
  Diamond            : 2,
  DimensionalShard   : 3,
  Emerald            : 2,
  Glowstone          : 4,
  Lapis              : 10,
  Malachite          : 2,
  Peridot            : 2,
  Quartz             : 3,
  QuartzBlack        : 2,
  quicksilver        : 2,
  Redstone           : 10,
  Ruby               : 2,
  Sapphire           : 2,
  Tanzanite          : 2,
  Topaz              : 2,
}

/**
 * @param {string} oreBase Ore we looking for. Example: 'Copper'
 * @param {number} multiplier
 */
export function countBaseOutput(oreBase, multiplier) {
  const d = baseMultiplier[oreBase]
  if (d) return Math.min(64, d * multiplier)

  return multiplier
}

/**
 * @param {string} ore_base Ore we looking for. Example: 'Copper'
 * @param {string[]} kindKeys Kinds of ores, Example: ['gem', 'dust', 'any']
 * @param {string[]} blacklist Kinds of ores, Example: ['cluster']
 * @returns {TMStack}
 */
export function getSomething(ore_base, kindKeys, blacklist = []) {
  const dict = getByOreBase(ore_base)
  blacklist.forEach(key => delete dict[key])
  for (const kind of kindKeys)
    if (dict[kind]) return dict[kind]

  for (const kind of ['ore', 'ingot', 'dust']) {
    const smelted = smeltOre(kind + ore_base)
    if (smelted) return smelted
  }

  if (kindKeys.includes('any')) return Object.values(dict)[0]
}

/**
 * @typedef {Object} TableRecipe
 * @property {string} shape
 * @property {string} name
 * @property {string} output
 * @property {string} out_id
 * @property {string} out_meta
 * @property {string} out_tail
 * @property {string} out_tag
 * @property {string} out_amount
 * @property {string} input
 */

/**
 *
 * @param {string} text
 */
function matchTableRecipes(text) {
  if (!text) return undefined
  const regex
    = /^recipes\.(?<shape>addShape(d|less))\("(?<name>[^"]+)", (?<output><(?<out_id>[^>]+?)(?::(?<out_meta>\*|\d+))?>(?<out_tail>(\.withTag\((?<out_tag>\{.*?\})\))?( \* (?<out_amount>\d+))?)?), (?<input>\[.*\])\);$/gm
  return /** @type {TableRecipe[]} */ (
    [...text.matchAll(regex)]
      .map(m => m.groups)
      .sort(({ output: a }, { output: b }) => naturalSort(a, b))
  )
}

/**
 * @type {TableRecipe[]}
 */
let tableRecipesCache
export function getTableRecipes() {
  return (tableRecipesCache ??= matchTableRecipes(
    getCrtLogBlock('\nRecipes:\n', '\n[SERVER_STARTED]')
  ))
}

/**
 * @type {TableRecipe[]}
 */
let tableUnchangedRecipes
/**
 * @returns {TableRecipe[]}
 */
export function getUnchangedTableRecipes() {
  if (tableUnchangedRecipes) return tableUnchangedRecipes

  const subSub = getCrtLogBlock(
    '#       Unchanged Crafting Table recipes         #',
    '##################################################'
  )
  if (!subSub) return undefined

  const subRgx = /\[INITIALIZATION\]\[CLIENT\]\[INFO\] (recipes\.addShape.+)/
  return (tableUnchangedRecipes = matchTableRecipes(
    subSub
      .split('\n')
      .map(s => s.match(subRgx)?.[1])
      .filter(s => s)
      .join('\n')
  ))
}

/**
 * @type {TableRecipe[]}
 */
let cachedRemovedRecipes
export function getRemovedRecipes() {
  if (cachedRemovedRecipes) return cachedRemovedRecipes

  const tblSet = new Set(getTableRecipes().map(r => r.name))
  return (cachedRemovedRecipes = getUnchangedTableRecipes().filter(
    r => !tblSet.has(r.name)
  ))
}
