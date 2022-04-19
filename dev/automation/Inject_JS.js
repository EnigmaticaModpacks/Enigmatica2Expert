/**
 * @file Inject_JS
 *
 * @description Lookup for keyword "Inject_js" in all zs files
 * to evaluate block and inject its result
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check
/* eslint-disable no-unused-vars */

import { xml2js, js2xml } from 'xml-js'
import glob from 'glob'
import _ from 'lodash'
import { table, getBorderCharacters } from 'table'
import humanizeString from 'humanize-string'

import {
  injectInFile,
  config,
  naturalSort,
  getCSV,
  loadText,
  saveText,
  getPDF,
  loadJson,
  setBlockDrops,
  defaultHelper,
} from '../lib/utils.js'

import {
  isODExist,
  isItemExist,
  isJEIBlacklisted,
  getItemOredictSet,
  getSubMetas,
  getByOredict,
  getByOreKind,
  getByOredict_first,
  prefferedModSort,
  getFurnaceRecipes,
  getUnchangedFurnaceRecipes,
  smelt,
  smeltOre,
  getSomething,
  countBaseOutput,
  getCrtLogBlock,
  isPurged,
  getOreBases_byKinds,
} from '../lib/tellme.js'

function saveObjAsJson(obj, filename) {
  saveText(JSON.stringify(obj, null, 2), filename)
}

/** @typedef {import("xml-js").Element} XMLElement*/
/** @param {string} xmlString */
function xml_to_js(xmlString) {
  return /** @type {XMLElement} */ (xml2js(xmlString, { compact: false }))
}

const reverseStr = (s) => [...s].reverse().join('')
const reverseNaturalSort = (a, b) => naturalSort(reverseStr(a), reverseStr(b))

const itemize = (id, meta) => id + (meta != 0 ? ':' + meta : '')
const $ = (source, id, meta, count, nbt, modifiers) => {
  return `<${source}:${id}${meta && meta != '0' ? ':' + meta : ''}>${nbt ? '.withTag(' + nbt + ')' : ''}${
    modifiers || ''
  }${parseInt(count) > 1 ? ' * ' + (count | 0) : ''}`
}

const flatTable = (arr) =>
  arr.length <= 0
    ? undefined
    : table(arr, {
        border: getBorderCharacters('void'),
        columnDefault: { paddingLeft: 0, paddingRight: 0 },
        drawHorizontalLine: () => false,
      }).replace(/[ \t]+$|\n$/gm, '')

/**
 * @param {any} injectValue
 */
function formatOutput(injectValue) {
  return !Array.isArray(injectValue)
    ? injectValue
    : injectValue.every(Array.isArray)
    ? flatTable(injectValue)
    : injectValue.join('\n')
}

// ----------------------------------

export async function init(h = defaultHelper) {
  const occurences = []

  await h.begin('Searching Inject_js blocks in .zs files')
  glob.sync('scripts/**/*.zs').forEach((filePath) => {
    const zsfileContent = loadText(filePath)
    for (const match of zsfileContent.matchAll(/\/\*\s*Inject_js((\(|\{)[\s\S\n\r]*?(\)|\}))\*\//gm)) {
      const lineNumber = zsfileContent.substring(0, match.index).split('\n').length
      const [, whole, p1, p2] = match
      occurences.push({
        filePath: filePath,
        capture: whole,
        command: p1 == '{' && p2 == '}' ? '(()=>' + whole.trim() + ')()' : whole.trim(),
        line: lineNumber,
        below: zsfileContent.substring(match.index + match[0].length),
      })
    }
  })

  await h.begin('Evaluating', occurences.length)
  let countBlocks = 0
  let countChanged = 0

  for (const cmd of occurences) {
    let injectValue = ''
    if (/^\(\s*\)$/gim.test(cmd.capture)) {
      injectValue = '# Empty Injection'
    } else {
      try {
        const evalStr = `(async()=>{return ${cmd.command}})()`
        injectValue ||= await eval(evalStr)
      } catch (error) {
        return h.error(
          '\nComment block Error.\nFile: ' + cmd.filePath + ':' + cmd.line,
          '\nCapture:',
          cmd.capture,
          '\n\n',
          error
        )
      }
    }

    const injectString = formatOutput(injectValue)

    if (injectString == null) {
      h.warn(cmd.filePath + ':' + cmd.line + ' Returned empty result!')
    } else {
      const replaceResults = injectInFile(cmd.filePath, cmd.capture, '/**/', '*/\n' + injectString + '\n')
      replaceResults.forEach((o) => (countBlocks += o.numMatches ?? 0))
      replaceResults.forEach((o) => (countChanged += o.numReplacements ?? 0))
    }

    h.step()
  }

  h.result(`Blocks: ${countBlocks}, Changed: ${countChanged}`)
}

if (
  // @ts-ignore
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()

// Test section:
// ;(async () => console.log('\n', formatOutput((() => {})())))()
