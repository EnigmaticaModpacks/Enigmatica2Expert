/**
 * @file Functions for working with Minecraft's CurseForge manifest.json file
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */
//@ts-check

import { defaultHelper, loadJson, loadText, saveObjAsJson } from './utils.js'
import parseGitignore from 'parse-gitignore'
import memoize from 'memoizee'
import fast_glob from 'fast-glob'
import { resolve } from 'path'
const { sync: globs } = fast_glob



export async function init(h=defaultHelper) {
  
}

const getIgnoredRelativeMods = memoize(
  ()=>globs(parseGitignore(loadText('dev/.devonly.ignore')), {dot: true, onlyFiles: false})
  .filter(f=>f.match(/^mods\/.+\.jar/))
)
const getFileName  = (/** @type {string} */ s) => s.replace(/^.*[\\/]/, '')

export function filterManifest(manifestObj) {
  const ignoredMods = getIgnoredRelativeMods().map(f => resolve(f))

  const ignoredIDs = loadJson('minecraftinstance.json').installedAddons
    .filter(addon => ignoredMods.includes(resolve(`mods/${addon?.installedFile?.FileNameOnDisk}`)))
    .map(addon => addon.addonID)

  manifestObj.files = manifestObj.files.filter(f => !ignoredIDs.includes(f.projectID))

  return manifestObj
}

let forgeVersion

/**
 * 
 * @param {string} version 
 * @param {string} mcinstancePath 
 * @param {string} [manifestPostfix]
 * @returns {{[key:string]: any}}
 */
export function generateManifest(version, mcinstancePath='minecraftinstance.json', manifestPostfix='') {
  const result = filterManifest({
    minecraft: {
      version: '1.12.2',
      modLoaders: [{
          id: forgeVersion ??= `forge-${loadText('logs/debug.log').match(/Forge Mod Loader version ([^\s]+) for Minecraft 1.12.2 loading/)[1]}`,
          primary: true
      }]
    },
    manifestType: 'minecraftModpack',
    manifestVersion: 1,
    name: 'Enigmatica2Expert-Extended',
    version: version,
    author: 'Krutoy242',
    overrides: 'overrides',
    files: loadJson(mcinstancePath).installedAddons.map(a=>({
      projectID: a.addonID,
      fileID: a.installedFile?.id,
      required: true,
    })).sort((a,b)=>a.projectID-b.projectID)
  })

  saveObjAsJson(result, `manifest${manifestPostfix}.json`)

  return result
}

// @ts-ignore
if(import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href) init()