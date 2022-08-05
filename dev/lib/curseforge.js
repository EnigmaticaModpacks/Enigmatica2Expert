/**
 * @file Get mod data from CurseForge or hashed file
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import { existsSync } from 'fs'
import { fileURLToPath, URL } from 'url'

import CFV2 from 'curseforge-v2'

import { loadJson, loadText, saveObjAsJson } from './utils.js'

const { CFV2Client } = CFV2

function relative(relPath = './') {
  // @ts-ignore
  return fileURLToPath(new URL(relPath, import.meta.url))
}

const cachePath = relative('~cf_cache.json')

const cf = new CFV2Client({
  apiKey: loadText('secrets/~cf_api_key.txt').trim(),
})

/**
 * @typedef {Object} Cached
 * @property {number} [__lastUpdated]
 *
 * @typedef {CFV2.CF2Addon & Cached} ModCached
 */

/**
 * Get mod information from CurseForge
 * If file was already fetched last `timeout` hours
 * it would be loaded from cache file
 * @param {number[]} modIds
 * @param {number} [timeout] hours of restoring from cache
 * @returns {Promise<CFV2.CF2Addon[]>}
 */
export async function fetchMods(modIds, timeout = 96) {
  // Create file if not have one
  if (!existsSync(cachePath)) saveObjAsJson({}, cachePath)

  /** @type {CFV2.CF2Addon[]} */
  const result = []

  /** @type {number[]} */
  const fromCFIds = []

  modIds.forEach((modID) => {
    const cached = cachedMod(modID, timeout)
    if (cached) result.push(cached)
    else fromCFIds.push(modID)
  })

  // return [...result, ...(await loadFromCF(fromCFIds))]
  const cfLoaded = await loadFromCF(fromCFIds)

  // @ts-ignore
  return modIds.map(
    (id) => result.find((a) => a.id === id) ?? cfLoaded.find((a) => a.id === id)
  )
}

/**
 * @param {number} modID
 * @param {number} timeout
 * @returns {CFV2.CF2Addon | undefined}
 */
function cachedMod(modID, timeout) {
  /** @type {ModCached} */
  const cached = loadJson(cachePath)[modID]
  if (!cached) return

  const hoursPass =
    (Date.now() - (cached.__lastUpdated ?? 0)) / (1000 * 60 * 60)
  if (hoursPass > timeout) return

  const result = { ...cached }
  delete result.__lastUpdated
  return result
}

/**
 * @param {number[]} modIds
 * @returns {Promise<CFV2.CF2Addon[]>}
 */
async function loadFromCF(modIds) {
  if (!modIds.length) return []

  // Get from Web and update cache
  const mods = (await cf.getMods({ modIds: modIds })).data?.data

  if (!mods || !mods.length)
    throw new Error('Cant fetch mods for IDs: ' + modIds)

  const json = loadJson(cachePath)
  mods.forEach((mod) => {
    json[mod.id] = { __lastUpdated: Date.now(), ...mod }
  })
  saveObjAsJson(json, cachePath)

  return mods
}

export async function init() {
  // console.log(await fetchMods([32274, 59143, 59751]))
  // console.log((await cf.getMods({ modIds: [32274, 59143, 59751] })).data?.data)
}

if (
  // @ts-ignore
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()
