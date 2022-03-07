/**
 * @file Get mod data from CurseForge or hashed file
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

import { getMod } from 'mc-curseforge-api'
import { loadJson, loadText, saveObjAsJson, saveText } from './utils.js'
import MarkdownIt from 'markdown-it'

import * as cheerio from 'cheerio'
import { URL, fileURLToPath } from 'url'
import { existsSync } from 'fs'
import { execSync } from 'child_process'
function relative(relPath = './') {
  // @ts-ignore
  return fileURLToPath(new URL(relPath, import.meta.url))
}
const md = new MarkdownIt({ html: true })

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
export function fetchMod(modID, timeout = 24) {
  // Create file if not have one
  if (!existsSync(cachePath)) saveObjAsJson({}, cachePath)
  // Return cached if have
  /**
   * @type {ModCached}
   */
  const cached = loadJson(cachePath)[modID]
  if (cached && (Date.now() - cached.__lastUpdated) / (1000 * 60 * 60) < timeout) {
    const result = { ...cached }
    delete result.__lastUpdated
    // @ts-ignore
    return (async () => result)()
  }

  // Get from Web and update cache
  const p = getMod(modID)
  p.then((mod) => {
    const json = loadJson(cachePath)
    json[modID] = { __lastUpdated: Date.now(), ...mod }
    saveObjAsJson(json, cachePath)
  })
  return p
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
      $(this).replaceWith(
        `<strong><span style="font-family: terminal, monaco, monospace;">[${$(this).attr('title')}]</span></strong>`
      )
    })

  $('img[width=50]').attr('width', '25')

  // <strong><span style="font-family: terminal, monaco, monospace;">[Osmium Block]</span></strong>

  $('h1').before('<br/>').after('<br/>')
  $('h2').before('<br/><hr/>').after('<br/>')
  // $('h3').before('<br/>').after('<br/>')
  $('h3').wrap('<span style="text-decoration: underline;">').contents().unwrap()
  // $('sub').contents().unwrap()
  $('sup').remove()

  saveText($.html(), htmlPath)
  // execSync('npx prettier --write ' + htmlPath)
}

export async function init() {
  curseMarkdown('changelogs/LATEST.md')
}

if (
  // @ts-ignore
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()
