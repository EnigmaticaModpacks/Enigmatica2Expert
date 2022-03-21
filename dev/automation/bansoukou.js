/**
 * @file Create fixed advancement files for Bonsoukou
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

import { loadJson, defaultHelper, saveObjAsJson } from '../lib/utils.js'
import fast_glob from 'fast-glob'
import { join } from 'path'

const { sync: globs } = fast_glob

import { URL, fileURLToPath } from 'url'
function relative(relPath = './') {
  // @ts-ignore
  return fileURLToPath(new URL(relPath, import.meta.url))
}

export async function init(h = defaultHelper) {
  await h.begin('Fixing Bansoukou files')

  const json = loadJson(relative('bansoukou.json'))
  for (const [gl, data] of Object.entries(json)) {
    const filePaths = globs('mods/' + gl, { dot: true })
    for (const [archievePath, advJson] of Object.entries(data)) {
      saveFile(filePaths.pop(), archievePath, advJson)
    }
  }

  return h.result(`Managed ${Object.entries(json).length} files`)
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
