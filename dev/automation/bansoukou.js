/**
 * @file Create fixed advancement files for Bonsoukou
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import { existsSync, mkdirSync, renameSync, statSync, unlinkSync } from 'node:fs'
import { dirname, join, parse } from 'node:path'
import { URL, fileURLToPath } from 'node:url'

import AdmZip from 'adm-zip'
import fast_glob from 'fast-glob'
import levenshtein from 'fast-levenshtein'
import _ from 'lodash'
import replace_in_file from 'replace-in-file'

import {
  defaultHelper,
  execSyncInherit,
  loadJson,
  saveObjAsJson,
} from '../lib/utils.js'

function relative(relPath = './') {
  return fileURLToPath(new URL(relPath, import.meta.url))
}

export async function init(h = defaultHelper) {
  await h.begin('Fixing Bansoukou files')
  renameFoldersToActualMods()
  injectJsonAdvancementFixes()
  await showDiffs(h)

  return h.result('Done!')
}

function injectJsonAdvancementFixes() {
  const json = loadJson(relative('bansoukou.json'))
  for (const [glob, data] of Object.entries(json)) {
    const filePaths = fast_glob.sync(`mods/${glob}`, { dot: true })
    for (const [archievePath, advJson] of Object.entries(data))
      saveFile(/** @type {string} */ (filePaths.pop()), archievePath, advJson)
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
    dot      : true,
    onlyFiles: false,
    cwd      : 'bansoukou',
    ignore   : fast_glob.sync('*', { dot: true, cwd: 'bansoukou' }),
  })
}

function renameFoldersToActualMods() {
  const bansFolders = getBansFolders()

  const allMods = fast_glob
    .sync('*.jar', { dot: true, cwd: 'mods' })
    .map(mod => mod.replace(/(-patched)?\.jar/, ''))

  bansFolders.forEach((modName) => {
    if (allMods.includes(modName)) return

    const levArr = _(allMods)
      .map(m => ({ lev: levenshtein.get(m, modName), mod: m }))
      .sortBy('0')
      .value()

    if (levArr[1].lev - levArr[0].lev < 5) {
      console.error(`\nBansoukou mod search function cant find mod ${modName}`)
      return
    }

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
  const cachePath = relative('~bansoukou_cached.json')
  /**
   * File path and its change time + size
   * @type {{[file:string]:string}}
   */
  const caches = existsSync(cachePath) ? loadJson(cachePath) : {}

  const bansFolders = getBansFolders()

  await h.begin('Generating Diffs', bansFolders.length)
  const diffStore = 'dev/automation/data/bansoukou_diffs'
  for (const folder of bansFolders) {
    const jarPath = existsSync(`mods/${folder}.disabled`)
      ? `mods/${folder}.disabled`
      : `mods/${folder}.jar`
    if (!existsSync(jarPath)) continue
    const jarStat = getStat(jarPath)
    const isJarCached = caches[jarPath] === jarStat
    caches[jarPath] = jarStat

    /** @type {AdmZip |  undefined} */
    let zip

    // List of files that should be changed by Bansoukou
    const changedFiles = fast_glob.sync('**/*', {
      dot: true,
      cwd: `bansoukou/${folder}`,
    })

    changedFiles.forEach((changedFile) => {
      const unpatchedModPath = join('~bansoukou_unpatched/', folder)
      const unpatchedFilePath = join(unpatchedModPath, changedFile)
      const patchedFilePath = join('bansoukou', folder, changedFile)

      // Skip if both files unchanged
      const fileStat = getStat(patchedFilePath)
      if (isJarCached && caches[patchedFilePath] === fileStat) return

      // Extract unpatched file
      try {
        (zip ??= new AdmZip(jarPath))
          .extractEntryTo(changedFile, unpatchedModPath, true, true)
      }
      catch (error) {
        return
      }

      const { oldF, newF } = decompile(unpatchedFilePath, patchedFilePath)

      const diffOut = `${join(diffStore, folder, changedFile)}.diff`
      mkdirSync(dirname(diffOut), { recursive: true })

      try {
        execSyncInherit(
          'git diff --no-index'
            + ` "${oldF}"`
            + ` "${newF}"`
            + ` > "${diffOut}"`
        )
      }
      catch (error) {}

      // Remove diff technical info
      replace_in_file.sync({
        files: diffOut,
        from : /^diff --git .+\nindex .+\n--- .+\n\+\+\+ .+\n/m,
        to   : '',
      })

      // Remove tempFiles
      if (unpatchedFilePath !== oldF) unlinkSync(oldF)
      if (patchedFilePath !== newF) unlinkSync(newF)

      // Save cache
      caches[patchedFilePath] = fileStat
    })

    h.step()
    await new Promise(resolve => setTimeout(resolve, 1))
  }

  saveObjAsJson(caches, cachePath)
}

/**
 * @param {string} unpatchedFilePath
 * @param {string} patchedFilePath
 * @returns {{oldF: string, newF: string}}
 */
function decompile(unpatchedFilePath, patchedFilePath) {
  if (parse(patchedFilePath).ext !== '.class')
    return { oldF: unpatchedFilePath, newF: patchedFilePath }

  // @ts-expect-error type
  return Object.fromEntries(
    [
      ['oldF', unpatchedFilePath],
      ['newF', patchedFilePath],
    ].map(([key, fPath]) => {
      const actualFile = replaceExt(fPath, '.java')
      execSyncInherit(
        '"C:/Program Files/Java/jdk-13.0.2/bin/java.exe"'
          + ' -jar'
          + ' cfr-0.152.jar'
          + ` "${fPath}"`
          + ` > "${actualFile}"`
      )
      return [key, actualFile]
    })
  )
}

/**
 *
 * @param {string} filePath
 * @returns {string}
 */
function getStat(filePath) {
  const stat = statSync(filePath)
  return `${stat.mtime.toUTCString()} - ${stat.size}`
}

if (
  import.meta.url === (await import('node:url')).pathToFileURL(process.argv[1]).href
)
  init()
