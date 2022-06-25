/**
 * @file Create fixed advancement files for Bonsoukou
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import { join } from 'path'
import { fileURLToPath, URL } from 'url'

import fast_glob from 'fast-glob'

import { defaultHelper, loadJson, saveObjAsJson } from '../lib/utils.js'

const { sync: globs } = fast_glob

function relative(relPath = './') {
  // @ts-ignore
  return fileURLToPath(new URL(relPath, import.meta.url))
}

export async function init(h = defaultHelper) {
  await h.begin('Fixing Bansoukou files')
  const filesManaged = injectJsonAdvancementFixes()

  return h.result(`Managed ${filesManaged} files`)
}

function injectJsonAdvancementFixes() {
  const json = loadJson(relative('bansoukou.json'))
  for (const [glob, data] of Object.entries(json)) {
    const filePaths = globs('mods/' + glob, { dot: true })
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

if (
  // @ts-ignore
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()
