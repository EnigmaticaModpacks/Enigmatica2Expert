/**
 * @file Parse default Tweakerconstruct config and special tweakers
 * csv files to make new tweaks
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

const { max, round, abs, sign, sqrt, pow, log } = Math // eslint-disable-line
import { writeFileSync } from 'fs'
import { fileURLToPath, URL } from 'url' // @ts-ignore

import csv from 'csvtojson'
import glob from 'glob'
import { getBorderCharacters, table } from 'table'

import {
  defaultHelper,
  injectInFile,
  loadText,
  saveText,
  subFileName,
} from '../lib/utils.js'

function relative(relPath = './') {
  return fileURLToPath(new URL(relPath, import.meta.url))
}

const paths = {
  default_config: 'dev/default_configs/tweakersconstruct.cfg',
  tweakerconstruct_cfg: 'config/tweakersconstruct.cfg',
  equipData_zs: 'scripts/equipment/equipData.zs',
  oredict_zs: 'scripts/OreDict.zs',
}

/** @type {string} */
let default_tweakers_cfg

/** @type {string} */
let current_tweakers_cfg

/* =============================================
=                  Parse                      =
============================================= */

/**
 * @param {string} s
 */
function isNumber(s) {
  return /^\d+\.?\d*$/.test(s)
}

/**
 * @param {string|number} v
 */
function nice(v) {
  return round(Number(v) * 100) / 100
}

/**
 * @param {number|'d'} v
 */
function d_nice(v) {
  return v == 'd' ? 'd' : nice(v)
}

/**
 * @param {number} v
 */
function veryNice(v) {
  const val = nice(v)
  const left = val | 0
  const right = nice(val - left)
  return (
    String(left).padStart(10) + (right ? '.' + String(right).substr(2, 2) : '')
  )
}

/**
 * @param {number|'d'} defVal Default value from 'default_configs/tweakersconstruct.cfg'
 * @param {string | number} n Tweak string
 * @param {string} _output string to be evaluated to get result
 * @return {number|'d'}
 */
function tweakValue(defVal, n, _output) {
  if (n == null || n === '' || n === 'd' || n === defVal) return 'd'

  // Convert 'n' when its in form of math '*2'
  if (!isNumber(String(n))) n = parseFloat(eval(`${defVal}${n}`))
  else n = Number(n)

  // Calculate output result (usually rounding value or make non-negative)
  /** @type {number} */
  const result = eval(_output)

  // After changes value didnt mutated
  if (result === Number(defVal)) return 'd'

  return result
}

/**
 * @typedef {{
 *   nums: (number | "d")[],
 *   reals: number[],
 *   mat: string,
 *   power: number,
 *   tweaks: string[],
 *   raw: string,
 *   tweaked: boolean,
 * }} TweakedMaterial
 */

/**
 *
 * @param {string} matID
 * @param {TweakObj} tweakObj
 * @param {(number|'d')[]} defaultVals String of number or 'd'
 */
function tweakMaterial(matID, tweakObj, defaultVals) {
  const nums = defaultVals.map((defVal, i) =>
    tweakValue(defVal, tweakObj[matID]?.[i], tweakObj._output?.[i] ?? 'n')
  )

  /**
   * Factical material stats
   * @type {number[]}
   */
  const reals = nums.map((n, i) =>
    typeof n !== 'number' || isNaN(Number(n))
      ? Number(defaultVals[i]) || 0.0
      : n
  )

  const isActuallyTweaked = nums.some(
    (v, i) => v !== 'd' && v != Number(defaultVals[i])
  )

  // Compute total power of material after tweaks
  let power = 0
  reals.forEach((real, i) => {
    let n = real // eslint-disable-line
    power += eval(tweakObj._importancy[i])
  })

  return {
    nums,
    reals,
    mat: matID,
    power,
    tweaks: tweakObj[matID] ?? nums.map(() => ''),
    raw: `        ${matID}:${nums.map(d_nice).join(':')}`,
    tweaked: isActuallyTweaked,
  }
}

const invalid = {
  /** @type {Set<string>} */ material: new Set(),
  /** @type {Set<string>} */ absent: new Set(),
  /** @type {Set<string>} */ fileInject: new Set(),
}

function injectToEquipments(list, varName) {
  const listStr = list
    .filter(
      (l) =>
        ![
          'ma.superium',
          'ma.supremium',
          'spectre',
          'draconic_metal',
          'neutronium',
          'aethium',
          'chaotic_metal',
          'infinity_metal',
        ].includes(l.mat)
    )
    .map((l) => `  ${('"' + l.mat + '"').padEnd(25)}, # ${round(l.power)}`)
    .join('\n')

  const injectResult = injectInFile(
    paths.equipData_zs,
    `val ${varName} as IData = [\n`,
    '\n] as IData;',
    listStr
  )

  if (!injectResult.length) {
    invalid.fileInject.add(`${paths.equipData_zs}: ${varName}`)
  }
}

/**
 * @param {string} tweakGroup
 * @param {TweakObj} tweakObj
 * @param {TweakedMaterial[]} list
 */
function writeStatsTable(tweakGroup, tweakObj, list) {
  const outputTable = [
    ['', 'Total Power', ...tweakObj._names], // Header
    ...list.map((l) => [l.mat, veryNice(l.power), ...l.reals.map(veryNice)]),
  ]

  const csvTable = table(outputTable, {
    border: {
      ...getBorderCharacters('void'),
      bodyJoin: ',',
    },
    columnDefault: {
      paddingLeft: 0,
      paddingRight: 1,
    },
    drawHorizontalLine: () => false,
  })

  saveText(
    csvTable,
    relative(`./stats/${tweakGroup.replace(/\s+Tweaks$/i, 's')}.csv`)
  )
}

/**
 * @typedef {{
 * 		[x: string]: string[];
 * 		_names: string[];
 * 		_output: string[];
 * 		_importancy: string[];
 * }} TweakObj
 */

/**
 * Compare group of parameters like "Armory Stat Tweaks" or "Fletching Stat Tweaks"
 * And save them to variable
 *
 * @param {string} tweakGroup Group like `Armory Stat Tweaks` or `Arrow Shaft Stat Tweaks`
 * @param {TweakObj} tweakObj
 */
function parseStats(tweakGroup, tweakObj) {
  const lookupString = `(S:"?${tweakGroup}"? <[\\n\\r])([\\r\\s\\S]*?)\\n(     >)`

  const rgx = new RegExp(lookupString)
  const cfgListChunk = default_tweakers_cfg.match(rgx)[0]

  /**
   * New recalculated values list
   * @type {TweakedMaterial[]}
   */
  const list = []

  /**
   * Materials that exists in current pack
   * @type {Set<string>}
   */
  const existMats = new Set()

  for (const match of cfgListChunk.matchAll(
    /^ *(?<matID>[^:\n]+):(?<rawValues>[^<\n]+)$/gm
  )) {
    const matID = match.groups.matID

    let defaultVals = match.groups.rawValues
      .split(':')
      .map((n) => (isNaN(Number(n)) ? 'd' : Number(n)))

    existMats.add(matID)

    const tweaked = tweakMaterial(matID, tweakObj, defaultVals)
    list.push(tweaked)
  }

  list.sort((a, b) => a.power - b.power)

  if (tweakGroup === 'Armory Stat Tweaks')
    injectToEquipments(list, 'defaultArmorMats')
  if (tweakGroup === 'Stat Tweaks')
    injectToEquipments(list, 'defaultWeaponMats')

  writeStatsTable(tweakGroup, tweakObj, list)
  replaceInCurrentConfig(list, lookupString)
  addInvalidTweaks(tweakObj, existMats)

  return list.length
}

/**
 * Write back in cfg loaded text
 * @param {TweakedMaterial[]} list
 * @param {string} lookupString
 */
function replaceInCurrentConfig(list, lookupString) {
  current_tweakers_cfg = current_tweakers_cfg.replace(
    new RegExp(lookupString, 'm'),
    `$1${
      list
        .filter((l) => l.tweaked)
        .map((l) => l.raw)
        .join('\n') + '\n'
    }$3`
  )
}

/**
 * Invalid tweaks (exist in tweaks, but absent in actual tweakerconstruct.cfg)
 * @param {TweakObj} tweakObj
 * @param {Set<string>} existMats
 */
function addInvalidTweaks(tweakObj, existMats) {
  Object.keys(tweakObj).forEach((o) => {
    if (o.substr(0, 1) !== '_' && !existMats.has(o)) invalid.material.add(o)
  })
  ;[...existMats.values()].forEach((o) => {
    if (!tweakObj[o]) invalid.absent.add(o)
  })
}

export async function init(h = defaultHelper) {
  // Format big numbers
  await h.begin('Loading default tweakersconstruct.cfg')
  default_tweakers_cfg = loadText(paths.default_config)

  await h.begin('Loading current tweakersconstruct.cfg')
  current_tweakers_cfg = loadText(paths.tweakerconstruct_cfg)

  const tweaksCSVList = glob.sync(relative('./tweaks/*.csv'))
  await h.begin('Parsing CSVs', tweaksCSVList.length)
  let totalTweaked = 0
  for (const filePath of tweaksCSVList) {
    /**
     * @type {(string)[][]}
     */
    const csvResult = await csv({
      noheader: true,
      output: 'csv',
    }).fromFile(filePath)

    /** @type {*} */
    const materialTweaks = csvResult.reduce(
      (a, v) => ((a[v[0]] = v.slice(1)), a),
      {}
    )

    totalTweaked += parseStats(subFileName(filePath), materialTweaks)

    h.step()
  }

  await h.begin('Saving files')
  writeFileSync(paths.tweakerconstruct_cfg, current_tweakers_cfg)

  Object.entries(invalid).forEach(([key, set]) => {
    if (set.size === 0) return
    h.warn(
      {
        material: `Found ${set.size} invalid materials for tweaks: ${[
          ...set,
        ].join(', ')}`,
        absent: `Found ${set.size} materials without tweaks: ${[...set].join(
          ', '
        )}`,
        fileInject:
          'Unable to inject files: ' + [...set].map((s) => `"${s}"`).join(', '),
      }[key]
    )
  })

  h.result(`Total lines tweaked: ${totalTweaked}`)
}

// @ts-ignore
if (
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()

/*

## Unused TC traits

-----------

- [x] darktraveler  | Surrounding mobs get randomly afflicted with damage.
- [x] hailhydra     | Random explosions plague your enemies. Also, when you are attacked, there is a chance to get Absorption.
- [x] hearts        | The higher your health, the more damage you do.
- [x] heavy_metal   | Increased knockback + Slowness on target.
- [x] illuminati    | While the tool is in your hand, nearby entities (that do not hold a tool with this trait) glow, and you become invisible.
- [x] morganlefay   | Bonus magic damage (ranging from 0.0 to 5.0; Gaussian distributed) is afflicted (it is absolute).
- [x] rudeawakening | Damage pierces armor (mobs only).
- [x] spades        | The lower your health, the more damage you do.
- [x] starfishy     | Press the "set portal" key (default "N") to set a virtual portal on the block you are pointing at. If you are on the brink of death, you have %d enori crystals to spare, and the portal has enough space above, then the crystals are consumed, you are teleported to the virtual portal, and you are spared. (The tool must be in your hand.)
- [x] thundering    | Summon a thunderbolt on impact.
- [x] unnamed       | Bonus damage accrued for each entity of the same type as the target close to it.
- [x] vindictive    | Bonus damage to players, and you gain some health by attacking.
- [x] blindbandit   | A mob called the "Blind Bandit" will sometimes be summoned for a limited time after you attack or are attacked. She will attack hostile mobs, and will also attack those who dare attack her (except you), piercing armor on mobs.
- [x] botanical2    | 
- [x] barrett       | ❌ As health decreases, there is an increasing chance of a critical hit.
- [x] divineshield  | ❌ While this tool is in your hand, you are granted fire resistance. Also, damage is reduced, but at a durability cost.
- [x] dprk          | ❌ When attacking or defending, Supreme Leaders will spawn, exploding on opponents in the same manner as a creeper.
- [x] ghastly       | ❌ If the holder is attacked while sneaking, the attacker is inflicted with Slowness.
- [x] ignoble       | ❌ As one takes damage, one starts to harbor feelings of ignoble jealousy as the offender is killed. When this trait is enabled, those feelings are vented when attacking while sneaking.
- [x] jaded         | ❌ Mobs attacked with this tool have their ability to heal temporarily hindered.
- [x] mystical_fire | ❌ Sets the target on fire, and damages the target with magic for a certain amount of time.
- [x] naphtha       | ❌ Arrows (and bolts) burn the target on impact.
- [x] trash         | ❌ Random stuff is slowly generated when the tool is selected, but the tool is damaged slowly in this way.

❌ - Could not find trait

barrett|divineshield|dprk|ghastly|ignoble|jaded|mystical_fire|naphtha|trash


*/
