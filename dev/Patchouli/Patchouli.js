/**
 * @file Patchouli_js
 *    Automatic Patchouli pages generator.
 *    Handy for ingame patchnoter
 *  Usage:
 *    1. Install dependencies (see require section below)
 *    2. Add "Patchouli_js()" comment blocks in .zs files
 *    3. Run from terminal:
 *        node patchouli.js
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

/// ///////////////////////////////////////
// NodeJS dependencies
import { mkdir, readdirSync, renameSync, rmSync } from 'fs'
import { relative as _relative, resolve } from 'path'
import { URL, fileURLToPath } from 'url'

import glob from 'glob'
import numeral from 'numeral'
import over from 'over'
import { snakeCase } from 'snake-case'

/// ///////////////////////////////////////
// Local dependencies
import * as evtTechSolarCalc from '../lib/EvtTechSolarCalc.js'
import {
  config,
  defaultHelper,
  loadText,
  matchBetween,
  saveObjAsJson,
} from '../lib/utils.js'

import { init as initAdditionalPages } from './additional_pages.js'

process.env.NODE_PATH += ':/dev/lib'

// -----------------------------
// Constants

const bookPath = './patchouli_books/e2e_e/en_us/'

const defaultFileContent = {
  '*': {
    name: 'Undefined category/entry',
    icon: 'minecraft:book',
  },

  'world': {
    name       : 'World',
    icon       : 'biomesoplenty:earth',
    description:
      'Tweaks and changes about $(l)basic rules/$, world $(l)gereneration/$ and $(l)mining/$:',
  },

  'energy': {
    icon       : 'nuclearcraft:upgrade:1',
    description: 'Things related to $(l)Energy/$ =>',
  },
  'items': {
    icon       : 'thaumcraft:elemental_pick',
    description: 'All about $(l)Items/$, $(l)Tools/$ and $(l)Armor/$ =>',
  },
  'liquids': {
    icon       : 'minecraft:water_bucket',
    description: 'Things you can do with $(l)Liquids/$ =>',
  },
  'mobs': {
    icon       : 'draconicevolution:mob_soul{EntityName:"minecraft:zombie"}',
    description: 'Stories about poor $(l)creatures/$ =>',
  },

  'bug_fixes': {
    priority: true,
  },

  'misc_changes': {
    priority: true,
  },

  'recipe_changes': {
    priority: true,
  },
}

// ######################################################################
//
// Extract Patchouli_js comment blocks from .zs files
//
// ######################################################################
function readdir(folderPath) {
  try {
    return readdirSync(folderPath)
  }
  catch (error) {
    return []
  }
}

function relative(relPath = './') {
  return fileURLToPath(new URL(relPath, import.meta.url))
}

// ######################################################################
//
// Content-independent helper functions
//
// ######################################################################

// Match all regex from crafttweaker.log
const from_crafttweaker_log = rgx => [
  ...loadText('crafttweaker.log').matchAll(rgx),
]

// Transform ZenScript's item string into Patchouli's item string
function parse_item(str) {
  const match = str.match(
    /^[ \n\r]*<(.*?)>(\.withTag\(([\s\S\n\r]*)\))?[ \n\r]*$/m
  )
  const itemDefinition = match[1]
  let nbtStr = match[3]
  if (nbtStr) {
    nbtStr = nbtStr.replace(/(\b)as \w+(\b)/gm, '$1$2')
    const nbtObj = eval(nbtStr)
    return itemDefinition + JSON.stringify(nbtObj)
  }
  return itemDefinition
}

// Transform liquid name into bucket with this liquid
function wrap_bucket(str) {
  return `forge:bucketfilled{FluidName:"${str}",Amount:1000}`
}

// Removes trailing spaces in _each_line_ and replace \n with $(br)
function parse_text(text) {
  return text
    .trim()
    .split('\n')
    .map(s => s.trim())
    .join('$(br)')
    .replace('$(br)$(br)', '$(br2)')
}

// Convert array into object with key: value
//   fnc is optional
/*
Example:
  $i("item", [[1],[2]])
    returns {item0: 1, item1: 2 }

  $i("text", [1,2], m => m*2)
    returns {text0: 2, text1: 4 }
*/
function $i(prefix, array, fnc) {
  return array.reduce(
    (o, m, i) =>
      Object.assign(o, {
        [prefix + i]: fnc ? fnc(m) : m[0],
      }),
    {}
  )
}

// Same as $i() but with prefix "item"
function item$i(array, fnc) {
  return $i('item', array, fnc)
}

// Same as $i() but with prefix "text"
function text$i(array, fnc) {
  return $i('text', array, fnc)
}

// Takes array and split it in several pages based of type
const pageTypesLength = {
  fluid_interaction : 10,
  grid              : 42,
  grid_text         : 24,
  grid_description  : 24,
  item_list         : 7,
  item_spread       : 7,
  spotlight_advanced: 5,
}
function paged_full(opts, itemsOnPage, arr) {
  itemsOnPage = itemsOnPage || pageTypesLength[opts.type]

  return arr.reduce((o, m, i) => {
    const isArr = Array.isArray(m)
    const j = ~~(i / itemsOnPage)
    o[j] = o[j] || { ...opts }

    o[j][`item${i % itemsOnPage}`] = isArr ? m[0] : m

    if (opts.type == 'item_list')
      o[j][`text${i % itemsOnPage}`] = m[1]

    return o
  }, [])
}

const paged = over([
  [over.object, over.numberOptional, over.array, paged_full],
  function () {
    throw new Error('paged() has wrong parameters')
  }, // No parameters function
])

// ######################################################################
//
// Init
//
// ######################################################################

/**
 * @typedef {Object} PatchouliCommand
 * @property {string} filePath
 * @property {string|Function} command
 * @property {number} [line]
 * @property {string} [below]
 * @property {Object} [overrides]
 */

export async function init(h = defaultHelper) {
  /** @type {PatchouliCommand[]} */
  const patchouliList = []

  // Add Additional pages
  patchouliList.push({
    filePath: 'additional_pages.js',
    command : initAdditionalPages,
  })

  // Generate list of all documentation entries
  const zsFileList = glob.sync('scripts/**/*.zs')
  await h.begin(`Scan ${zsFileList.length} .ZS files`)

  const patchuoliBlocksList = zsFileList
    .map(f => [f, loadText(f)])
    .map(
      /** @return {[string, string, RegExpMatchArray[]]} */
      ([f, s]) => [
        f,
        s,
        [...s.matchAll(/\\* *(Patchouli_js\([\s\S\n\r]*?\))\*\//gm)],
      ]
    )
    .filter(([, , matches]) => matches.length)
  h.done()

  patchuoliBlocksList.forEach(([filePath, zsfileContent, matches]) =>
    matches.forEach(match =>
      patchouliList.push({
        filePath,
        command: match[1],
        line   : zsfileContent.substring(0, match.index).split('\n').length,
        below  : zsfileContent.substring(match.index + match[0].length),
      })
    )
  )

  // Patch pages
  const patchVersions = []
  const patchesPath = relative('patches/')
  readdir(patchesPath).forEach((filePath) => {
    const relPath = resolve(patchesPath, filePath)
    const fileNoExt = filePath.split('.').slice(0, -1).join('.')
    patchVersions.push(fileNoExt)
    patchouliList.push({
      filePath : relPath,
      command  : loadText(relPath),
      overrides: {
        subcategory: fileNoExt,
      },
    })
  })

  const upperVersion = patchVersions.sort((a, b) => b.localeCompare(a))[0]

  await h.begin('Evaluating blocks', patchouliList.length)

  const book = {}
  const stat = {
    totalEntries: 0,
  }

  // Iterate over comment blocks
  patchouliList.forEach((patchouliCommand) => {
    // ######################################################################
    //
    // Content-dependent helper functions
    //
    // ######################################################################

    // Returns array of matching regex
    //  All options are optional
    function match_below(opts) {
      const matchResult = matchBetween(
        patchouliCommand.below,
        opts.begin,
        opts.end,
        opts.regex ?? /[\s\S\n\r]*/gm
      )
      return opts?.regex ? matchResult : matchResult[0][0]
    }

    // Return all matches of regex under Patchouli_js block until empty line
    function match_block_below(regex) {
      return match_below({ regex, end: '\n\n' })
    }

    // Return all matches of regex under Patchouli_js block until end of file
    function match_regex_below(regex) {
      return [...patchouliCommand.below.matchAll(regex)]
    }

    // ######################################################################
    //
    // Main function
    //
    // ######################################################################
    function Patchouli_js_single(entryId, p) {
      // Parse patchouli path
      if (!entryId) entryId = 'Misc Changes'
      const patchouli_path = entryId.split('/')
      if (patchouli_path.length == 1) {
        patchouli_path.unshift(
          'Patches',
          patchouliCommand?.overrides?.subcategory ?? upperVersion
        )
      }
      const isSubcategory = patchouli_path.length >= 3

      // Overwrite data for generated patches
      p = { ...p, ...patchouliCommand.overrides }

      function defVal(obj, field, def) {
        obj[field] = obj[field] || def
        return obj[field]
      }

      const obj_category = defVal(book, patchouli_path[0], {})
      let obj_entry
      let categoryPath
      let entry_name

      if (isSubcategory) {
        entry_name = patchouli_path[2]
        categoryPath = `patchouli:subcategories/${snakeCase(patchouli_path[1])}`
        const obj_subcategory = defVal(
          obj_category,
          `subcategory:${patchouli_path[1]}`,
          {}
        )
        obj_entry = defVal(obj_subcategory, entry_name, {})
      }
      else {
        entry_name = patchouli_path[1]
        categoryPath = patchouli_path[0]
        obj_entry = defVal(obj_category, `entry:${entry_name}`, {})
      }

      // Guess mandatory fields for entry
      defVal(obj_entry, 'name', entry_name)
      defVal(obj_entry, 'category', categoryPath)
      defVal(obj_entry, 'pages', [])
      defVal(obj_entry, 'icon', p.icon || p.item || 'minecraft:book')

      // Copy all fields
      const page = {}
      const entryKeys = ['category', 'subcategory', 'entry', 'icon']
      for (const key in p) {
        if (!entryKeys.includes(key)) {
          if (key[0] === '_')
            page[key.substr(1)] = parse_text(p[key])

          else
            page[key] = p[key]
        }
      }

      // Guess mandatory fields for page
      page.type = page.type || (p.item ? 'spotlight' : 'text')

      // Title is not mandatory but many page types used it
      page.title = page.title || patchouli_path[patchouli_path.length - 1]

      // Add page
      obj_entry.pages.push(page)
      stat.totalEntries++
    }

    const Patchouli_js = over([
      [
        over.stringOptionalWithDefault(''),
        over.array,
        (str, arr) => arr.forEach(o => Patchouli_js_single(str, o)),
      ],
      [over.stringOptionalWithDefault(''), over.object, Patchouli_js_single],
      // [over.object, obj=>Patchouli_js_single('', obj)],
      // [over.array,  arr=>arr.forEach(obj=>Patchouli_js_single('', obj))],
      function () {

      }, // No parameters function
    ])

    try {
      if (typeof patchouliCommand.command === 'string')
        eval(patchouliCommand.command)
      else patchouliCommand.command(Patchouli_js, { paged, config })
    }
    catch (error) {
      console.log(
        `Patchouli_js comment block Error.\nFile: ${
          patchouliCommand.filePath
        }:${patchouliCommand.line ?? 0}`
      )
      console.error(error)
    }
    h.step()
  })
  h.done()

  await writeResult(stat, book, h)
}

// @ts-expect-error
if (
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()

/**
 * Write collected pages into patchouli folders
 * @param {{totalEntries: number}} stat
 * @param {{}} book
 */
async function writeResult(stat, book, h = defaultHelper) {
  let totalFilesCreated = 0

  /**
   *
   * @param {string} _partName
   * @param {string} subfolder
   * @param {object} content
   * @returns
   */
  function saveBookFile(_partName, subfolder, content) {
    const partName = snakeCase(_partName)
    saveObjAsJson(
      {
        __comment:
          'This file generated automatically with Patchouli.js. All changes will be rewritten',
        ...defaultFileContent['*'],
        ...defaultFileContent[partName],
        name: _partName,
        ...content,
      },
      `${bookPath + subfolder + partName}.json`
    )
    totalFilesCreated++
    return partName
  }

  await h.begin(
    `Writing ${stat.totalEntries} entries in files`,
    Object.entries(book).length
  )

  // Iterate through new generated book entries
  for (const [_categoryName, category] of Object.entries(book)) {
    const categoryName = saveBookFile(_categoryName, 'categories/', {})

    for (const [_subcategoryName, subcategory] of Object.entries(category)) {
      const actualName = _subcategoryName.split(':').slice(1).join(':')
      const isCategory = _subcategoryName.startsWith('subcategory:')
      if (isCategory) {
        const subcategoryName = saveBookFile(
          actualName,
          'categories/subcategories/',
          {
            parent: `patchouli:${categoryName}`,
          }
        )

        for (const [_entryName, entry] of Object.entries(subcategory)) {
          saveBookFile(
            _entryName,
            `entries/${categoryName}/${subcategoryName}/`,
            entry
          )
        }
      }
      else {
        saveBookFile(actualName, `entries/${categoryName}/`, subcategory)
      }
    }
    h.step()
  }

  h.result(`Total files created: ${totalFilesCreated}`)
}
/*
function findNewPoint(x, y, angle, distance) {
  var result = {};

  result.x = Math.round(Math.cos(angle * Math.PI) * distance + x);
  result.y = Math.round(Math.sin(angle * Math.PI) * distance + y);

  return result;
}

for (let i = 0; i < 6; i++) {
  console.log('x,y :>> ', JSON.stringify(findNewPoint(50, 16, 0.2*i, 26.0)));
} */
