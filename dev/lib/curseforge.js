/**
 * @file Get mod data from CurseForge or hashed file
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import { existsSync } from 'fs'
import { fileURLToPath, URL } from 'url'

import * as cheerio from 'cheerio'
import CFV2 from 'curseforge-v2'
import MarkdownIt from 'markdown-it'

import { loadJson, loadText, saveObjAsJson, saveText } from './utils.js'

const { CFV2Client } = CFV2

function relative(relPath = './') {
  // @ts-ignore
  return fileURLToPath(new URL(relPath, import.meta.url))
}
const md = new MarkdownIt({ html: true })

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

/**
 * @param {string} mdFilePath Markdown-style file
 */
export function curseMarkdown(mdFilePath) {
  const htmlText = md.render(loadText(mdFilePath))
  const htmlPath = 'changelogs/~LATEST.html'

  const $ = cheerio.load(htmlText)

  // $('img').not('img[width=50]').css('display', 'inline-block') /* .css('float', 'left') */

  $('img')
    .not('img[width=50]')
    .each(function () {
      // eslint-disable-next-line no-invalid-this
      $(this).replaceWith(
        `<strong><span style="font-family: terminal, monaco, monospace;">[${$(
          // eslint-disable-next-line no-invalid-this
          this
        ).attr('title')}]</span></strong>`
      )
    })

  $('img[width=50]').attr('width', '25')

  $('h1').before('<br/>').after('<br/>')
  $('h2').before('<br/><hr/>').after('<br/>')
  // $('h3').before('<br/>').after('<br/>')
  $('h3').wrap('<span style="text-decoration: underline;">').contents().unwrap()
  // $('sub').contents().unwrap()
  $('sup').remove()

  // <p><a href="https://github.com/Krutoy242/Enigmatica2Expert-Extended/releases">&lt; Full Changelog with better formatting on GitHub &gt;</a></p>

  const pathToReleases =
    'https://github.com/Krutoy242/Enigmatica2Expert-Extended/releases'
  const link = $('<a></a>')
    .attr('href', pathToReleases)
    .append('< Full Changelog with better formatting on GitHub >')
  $('body').prepend($('<p></p>').append(link))

  saveText($.html(), htmlPath)
  // execSync('npx prettier --write ' + htmlPath)
}

export async function init() {
  curseMarkdown('changelogs/LATEST.md')

  // console.log(await fetchMods([32274, 59143, 59751]))
  // console.log((await cf.getMods({ modIds: [32274, 59143, 59751] })).data?.data)
}

if (
  // @ts-ignore
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()
