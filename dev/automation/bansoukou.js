/**
 * @file Create fixed advancement files for Bonsoukou
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import { renameSync } from 'fs'
import { join } from 'path'
import { fileURLToPath, URL } from 'url'

import fast_glob from 'fast-glob'
import levenshtein from 'fast-levenshtein'
import _ from 'lodash'

import { defaultHelper, loadJson, saveObjAsJson } from '../lib/utils.js'

function relative(relPath = './') {
  // @ts-ignore
  return fileURLToPath(new URL(relPath, import.meta.url))
}

export async function init(h = defaultHelper) {
  await h.begin('Fixing Bansoukou files')
  renameFoldersToActualMods()
  const filesManaged = injectJsonAdvancementFixes()

  return h.result(`Managed ${filesManaged} files`)
}

function injectJsonAdvancementFixes() {
  const json = loadJson(relative('bansoukou.json'))
  for (const [glob, data] of Object.entries(json)) {
    const filePaths = fast_glob.sync('mods/' + glob, { dot: true })
    for (const [archievePath, advJson] of Object.entries(data)) {
      saveFile(/** @type {string} */ (filePaths.pop()), archievePath, advJson)
    }
  }
  return Object.entries(json).length
}

/**
 * @param {string} jarPath
 * @param {string} archievePath
 * @param {Advancement} advJson
 */
function saveFile(jarPath, archievePath, advJson) {
  saveObjAsJson(advJson, join('bansoukou/', getJarName(jarPath), archievePath))
}

function getJarName(jarPath) {
  return jarPath.match(/^mods\/(.+)\.(jar|disabled)$/)[1]
}

function renameFoldersToActualMods() {
  const bansFolders = fast_glob.sync('*', {
    dot: true,
    onlyFiles: false,
    cwd: 'bansoukou',
    ignore: fast_glob.sync('*', { dot: true, cwd: 'bansoukou' }),
  })

  let allMods = fast_glob
    .sync('*.jar', {
      dot: true,
      cwd: 'mods',
    })
    .map((mod) => mod.replace(/(-patched)?\.jar/, ''))

  bansFolders.forEach((modName, i) => {
    if (allMods.includes(modName)) return

    const oldFolder = bansFolders[i]
    const levArr = _(allMods)
      .map(
        (m) =>
          /** @type {[Number, string]} */ ([levenshtein.get(m, oldFolder), m])
      )
      .sortBy('0')
      .value()

    if (levArr[1][0] - levArr[0][0] < 5)
      throw new Error('Bansoukou mod search function cant find mod')

    const currFolder = levArr[0][1]
    renameSync(join('bansoukou', oldFolder), join('bansoukou', currFolder))
  })
}

if (
  // @ts-ignore
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()
