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

const getIgnoredModIDs = memoize(()=>{
  const ignoredMods = globs(parseGitignore(loadText('dev/.devonly.ignore')), {dot: true, onlyFiles: false})
  .filter(f=>f.match(/^mods\/.+\.jar/))
  .map(f => resolve(f))

  /** @type {import('./minecraftinstance').RootObject} */
  const mcinstance = loadJson('minecraftinstance.json')
  return mcinstance.installedAddons
    .filter(addon => ignoredMods.includes(resolve(`mods/${addon?.installedFile?.FileNameOnDisk}`)))
    .concat(mcinstance.installedAddons.filter(addon => !addon.installedFile.isAvailable))
    .map(addon => addon.addonID)
})

/**
 * Load minecraftinstance.json file from disk,
 * filter devonly mods and return typed
 */
export const loadMCInstanceFiltered = memoize(((/** @type {string} */ filePath) => {
  /** @type {import('./minecraftinstance').RootObject} */
  const mcinstance = loadJson(filePath)

  const ignoredSet = new Set(getIgnoredModIDs())
  mcinstance.installedAddons = mcinstance.installedAddons.filter(a => !ignoredSet.has(a.addonID))
  
  return mcinstance
}))

function filterManifest(manifestObj) {
  manifestObj.files = manifestObj.files.filter(f => !getIgnoredModIDs().includes(f.projectID))

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
    author: 'krutoy242',
    overrides: 'overrides',
    files: loadMCInstanceFiltered(mcinstancePath).installedAddons.map(a=>({
      projectID: a.addonID,
      fileID: a.installedFile?.id,
      required: !a.installedFile?.FileNameOnDisk.endsWith('.disabled'),
    })).sort((a,b)=>a.projectID-b.projectID)
  })

  saveObjAsJson(result, `manifest${manifestPostfix}.json`)

  return result
}

// @ts-ignore
if(import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href) init()