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
import MarkdownIt from 'markdown-it'
import { getMod } from 'mc-curseforge-api'

import { loadJson, loadText, saveObjAsJson, saveText } from './utils.js'

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
  if (
    cached &&
    (Date.now() - cached.__lastUpdated) / (1000 * 60 * 60) < timeout
  ) {
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
}

if (
  // @ts-ignore
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()
