/**
 * @file Create fixed advancement files for Bonsoukou
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import { mkdirSync, renameSync, unlinkSync } from 'fs'
import { dirname, join, parse } from 'path'
import { fileURLToPath, URL } from 'url'

import AdmZip from 'adm-zip'
import fast_glob from 'fast-glob'
import levenshtein from 'fast-levenshtein'
import _ from 'lodash'

import {
  defaultHelper,
  execSyncInherit,
  loadJson,
  saveObjAsJson,
} from '../lib/utils.js'

function relative(relPath = './') {
  // @ts-ignore
  return fileURLToPath(new URL(relPath, import.meta.url))
}

export async function init(h = defaultHelper) {
  await h.begin('Fixing Bansoukou files')
  renameFoldersToActualMods()
  const filesManaged = injectJsonAdvancementFixes()
  await showDiffs(h)

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
 * @param {Object} advJson
 */
function saveFile(jarPath, archievePath, advJson) {
  saveObjAsJson(advJson, join('bansoukou/', getJarName(jarPath), archievePath))
}

function getJarName(jarPath) {
  return jarPath.match(/^mods\/(.+)\.(jar|disabled)$/)[1]
}

/**
 * Get names of all folders inside ./bansoukou/
 */
function getBansFolders() {
  return fast_glob.sync('*', {
    dot: true,
    onlyFiles: false,
    cwd: 'bansoukou',
    ignore: fast_glob.sync('*', { dot: true, cwd: 'bansoukou' }),
  })
}

function renameFoldersToActualMods() {
  const bansFolders = getBansFolders()

  let allMods = fast_glob
    .sync('*.jar', { dot: true, cwd: 'mods' })
    .map((mod) => mod.replace(/(-patched)?\.jar/, ''))

  bansFolders.forEach((modName, i) => {
    if (allMods.includes(modName)) return

    const levArr = _(allMods)
      .map((m) => ({ lev: levenshtein.get(m, modName), mod: m }))
      .sortBy('0')
      .value()

    if (levArr[1].lev - levArr[0].lev < 5)
      throw new Error('Bansoukou mod search function cant find mod')

    const currFolder = levArr[0].mod
    renameSync(join('bansoukou', modName), join('bansoukou', currFolder))
  })
}

/**
 * Replace extension
 * @param {string} fileName
 * @param {string} newExt
 * @returns string
 */
function replaceExt(fileName, newExt) {
  const { dir, name } = parse(fileName)
  return join(dir, name) + newExt
}

async function showDiffs(/** @type {typeof defaultHelper} */ h) {
  const bansFolders = getBansFolders()

  await h.begin('Generating Diffs', bansFolders.length)
  const diffStore = 'dev/automation/data/bansoukou_diffs'
  for (const folder of bansFolders) {
    const zip = new AdmZip(`mods/${folder}.disabled`)

    const changedFiles = fast_glob.sync('**/*', {
      dot: true,
      cwd: `bansoukou/${folder}`,
    })

    changedFiles.forEach((changedFile) => {
      // Extract unpatched file
      const unpatchedModPath = join('~bansoukou_unpatched/', folder)
      try {
        zip.extractEntryTo(changedFile, unpatchedModPath, true, true)
      } catch (error) {
        return
      }
      const unpatchedFilePath = join(unpatchedModPath, changedFile)
      const patchedFilePath = join('bansoukou', folder, changedFile)

      const { oldF, newF } = decompile(unpatchedFilePath, patchedFilePath)

      const diffOut = join(diffStore, folder, changedFile) + '.diff'
      mkdirSync(dirname(diffOut), { recursive: true })

      try {
        execSyncInherit(
          `git diff --no-index` +
            ` "${oldF}"` +
            ` "${newF}"` +
            ` > "${diffOut}"`
        )
      } catch (error) {}

      // Remove tempFiles
      if (unpatchedFilePath !== oldF) unlinkSync(oldF)
      if (patchedFilePath !== newF) unlinkSync(newF)
    })

    h.step()
    await new Promise((r) => setTimeout(r, 1))
  }
}

/**
 * @param {string} unpatchedFilePath
 * @param {string} patchedFilePath
 * @returns {{oldF: string, newF: string}}
 */
function decompile(unpatchedFilePath, patchedFilePath) {
  if (parse(patchedFilePath).ext !== '.class')
    return { oldF: unpatchedFilePath, newF: patchedFilePath }

  // @ts-ignore
  return Object.fromEntries(
    [
      ['oldF', unpatchedFilePath],
      ['newF', patchedFilePath],
    ].map(([key, fPath]) => {
      const actualFile = replaceExt(fPath, '.java')
      execSyncInherit(
        `"C:/Program Files/Java/jdk-13.0.2/bin/java.exe"` +
          ` -jar` +
          ` cfr-0.152.jar` +
          ` "${fPath}"` +
          ` > "${actualFile}"`
      )
      return [key, actualFile]
    })
  )
}

if (
  // @ts-ignore
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()
