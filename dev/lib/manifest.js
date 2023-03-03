/**
 * @file Functions for working with Minecraft's CurseForge manifest.json file
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */
// @ts-check

import { resolve } from 'path'

import fast_glob from 'fast-glob'
import memoize from 'memoizee'
import parseGitignore from 'parse-gitignore'
import { getBorderCharacters, table } from 'table'

import { fetchMods } from './curseforge.js'
import { loadJson, loadText, saveText } from './utils.js'

export async function init() {
  generateManifest()
}

/** @typedef {import('./minecraftinstance').InstalledAddon} InstalledAddon */

const getIgnoredModIDs = memoize(() => {
  const ignoredFiles = fast_glob.sync(parseGitignore(loadText('dev/.devonly.ignore')), {
    dot      : true,
    onlyFiles: false,
  })
  const ignoredMods = ignoredFiles
    .filter(f => f.match(/^mods\/.+\.jar/))
    .map(f => resolve(f))

  /** @type {import('./minecraftinstance').RootObject} */
  const mcinstance = loadJson('minecraftinstance.json')

  const ignoredByDevonly = mcinstance.installedAddons.filter(addon =>
    ignoredMods.includes(
      resolve(`mods/${addon?.installedFile?.fileNameOnDisk}`)
    )
  )

  const ignoredByUnavaliable = mcinstance.installedAddons.filter(
    // Unavailable like Optifine or Nutrition
    addon => !addon.installedFile?.isAvailable
  )

  return new Set(
    [...ignoredByDevonly, ...ignoredByUnavaliable].map(addon => addon.addonID)
  )
})

/**
 * Load minecraftinstance.json file from disk,
 * filter devonly mods and return typed
 */
export const loadMCInstanceFiltered = memoize(
  (/** @type {string} */ filePath) => {
    /** @type {import('./minecraftinstance').RootObject} */
    const mcinstance = loadJson(filePath)

    mcinstance.installedAddons = mcinstance.installedAddons.filter(
      a => !getIgnoredModIDs().has(a.addonID)
    )

    return mcinstance
  }
)

/**
 * Get InstalledAddon by its file name
 */
export const getAddon = memoize(
  (/** @type {(this: void, value: InstalledAddon, index: number, obj: InstalledAddon[]) => value is InstalledAddon} */ predicate) => {
    /** @type {import('./minecraftinstance').RootObject} */
    const mcinstance = loadMCInstanceFiltered('minecraftinstance.json')

    return mcinstance.installedAddons.find(predicate)
  }
)

/**
 * @param {any[]} modsList
 */
function formatModList(modsList) {
  const columns = Object.keys(modsList[0]).length
  const orderedList = modsList
    .map(m => JSON.stringify(m).replace(/(":)("|\d+)/g, '$1____$2'))
    .join(',\n')
    .split('\n')
    .map(s => `    ${s}`.split('____'))
    .map(r => new Array(columns).fill('').map((s, i) => r[i]))

  return table(orderedList, {
    border            : getBorderCharacters('void'),
    columnDefault     : { paddingLeft: 0, paddingRight: 0 },
    drawHorizontalLine: () => false,
    columns           : new Array(3).fill({ alignment: 'right' }),
  }).replace(/[ \t]+$|\n$/gm, '')
}

let forgeVersion

/**
 *
 * @param {string} version
 * @param {string} mcinstancePath
 * @param {string} [manifestPostfix]
 * @returns {Promise<{[key:string]: any}>}
 */
export async function generateManifest(
  version = loadJson('manifest.json').version,
  mcinstancePath = 'minecraftinstance.json',
  manifestPostfix = ''
) {
  const addonsListUnfiltered
    = loadMCInstanceFiltered(mcinstancePath).installedAddons
  const cfModsList = await fetchMods(addonsListUnfiltered.map(a => a.addonID))

  const modListUnfiltered = addonsListUnfiltered.map((a, i) => ({
    projectID: a.addonID,
    fileID   : a.installedFile?.id,
    required : !a.installedFile?.fileNameOnDisk.endsWith('.jar.disabled'),
    ___name  : cfModsList[i].name,
  }))

  const resultObj = {
    minecraft: {
      version   : '1.12.2',
      modLoaders: [
        {
          id: (forgeVersion ??= `forge-${
            loadText('logs/debug.log').match(
              /Forge Mod Loader version ([^\s]+) for Minecraft 1.12.2 loading/
            )?.[1]
          }`),
          primary: true,
        },
      ],
    },
    manifestType   : 'minecraftModpack',
    manifestVersion: 1,
    name           : 'Enigmatica2Expert-Extended',
    version,
    author         : 'krutoy242',
    overrides      : 'overrides',
    files          : /** @type {any[]} */ ([]),
  }

  const modList = modListUnfiltered
    .filter(m => !getIgnoredModIDs().has(m.projectID))
    .filter(m => m.required)
    .sort((a, b) => a.projectID - b.projectID)

  // Format beautifully
  const resultStr = JSON.stringify(resultObj, null, 2).replace(
    '  "files": []',
    `  "files": [
${formatModList(modList)}
  ]`
  )
  saveText(resultStr, `manifest${manifestPostfix}.json`)

  resultObj.files = modList
  return resultObj
}

if (
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()
