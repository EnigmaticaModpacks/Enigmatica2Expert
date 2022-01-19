/**
 * @file Get mod data from CurseForge or hashed file
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check


import { getMod } from 'mc-curseforge-api'
import { loadJson, saveObjAsJson } from './utils.js'

import { URL, fileURLToPath  } from 'url' // @ts-ignore
import { existsSync } from 'fs'
function relative(relPath='./') { return fileURLToPath(new URL(relPath, import.meta.url)) }

const cachePath = relative('~cf_cache.json')

/**
 * @typedef {Object} Cached
 * @property {number} __lastUpdated
 *
 * @typedef {Mod & Cached} ModCached
 */

/**
 * Get mod information from CurseForge
 * If file was already fetched last `timeout` hours
 * it would be loaded from cache file
 * @param {number} modID
 * @param {number} [timeout]
 * @returns {Promise<Mod>}
 */
export default function fetchMod(modID, timeout = 24) {
  // Create file if not have one
  if(!existsSync(cachePath)) saveObjAsJson({}, cachePath)
  // Return cached if have
  /**
   * @type {ModCached}
   */
  const cached = loadJson(cachePath)[modID]
  if(cached && (Date.now() - cached.__lastUpdated) / (1000*60*60) < timeout) {
    const result = {...cached}
    delete result.__lastUpdated
    // @ts-ignore
    return (async () => (result))()
  }

  // Get from Web and update cache
  const p = getMod(modID)
  p.then(mod => {
    const json = loadJson(cachePath)
    json[modID] = {__lastUpdated: Date.now(), ...mod}
    saveObjAsJson(json, cachePath)
  })
  return p
}