/**
 * @file Add tips only into `resources/enigmatica/lang/en_us.lang`
 * And they would be automatically copied to localized files
 * and to `config/tips.cfg`
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import { writeFileSync } from 'fs'
import { parse } from 'path'

import FastGlob from 'fast-glob'
import { getLangNameFromCode } from 'language-name-map'
import memoize from 'memoizee'

import {
  defaultHelper,
  injectInFile,
  loadText,
  saveText,
} from '../lib/utils.js'

const filePathes = FastGlob.sync('resources/tips/lang/*_*.lang')

/**
 * @typedef LangGroups
 * @type {{match:string, id:string, text:string}}
 */

/**
 * @param {string} lang
 */
function getTips(lang) {
  return [
    ...lang.matchAll(/^(?<match>e2ee\.tips\.(?<id>\d+)=(?<text>.*))$/gm),
  ].map((m) => /** @type {LangGroups} */ (m.groups))
}

memoize(() => {})

export async function init(h = defaultHelper) {
  await h.begin('Loading files')
  const rawFiles = filePathes.map(loadText)
  const rawTips = rawFiles.map(getTips)
  const rawLandCodes = filePathes.map((f) => parse(f).name)
  const en_us_index = rawLandCodes.indexOf('en_us')
  const en_us_Tips = rawTips[en_us_index]

  // cfg
  injectInFile(
    'config/tips.cfg',
    '    S:customTips <\n',
    '\n     >',
    en_us_Tips.map((_, i) => `        e2ee.tips.${i}`).join('\n')
  )

  // English
  replaceTips(en_us_index, en_us_Tips)

  // Other languages
  /** @type {LangGroups[]} */
  rawTips.forEach((tips, i) => {
    if (i === en_us_index) return
    const filtered_other = []
    en_us_Tips.forEach((en) =>
      filtered_other.push(tips.find((other) => en.id === other.id) ?? en)
    )
    replaceTips(i, filtered_other)
  })

  /**
   * @param {number} fileIndex
   * @param {LangGroups[]} newGroups
   */
  function replaceTips(fileIndex, newGroups) {
    writeFileSync(
      filePathes[fileIndex],
      newGroups.map(({ text }, i) => `e2ee.tips.${i}=${text}`).join('\n') + '\n'
    )
  }

  // Minecraft To GH Markdown
  rawFiles.forEach((langFileText, i) => {
    const lines = [...langFileText.matchAll(/^e2ee.tips.[^=]+=(.*)$/gm)].map(
      (s) => `- ${mcToMd(s[1])}`
    )

    const langCode = parse(filePathes[i]).name
    const langName =
      getLangNameFromCode(langCode.replace(/_.*/, ''))?.name ?? ''
    saveText(
      `${lines.join('\n')}
`,
      `Enigmatica2Expert-Extended.wiki/${langName}-Tips.md`
    )
  })

  h.result(`Total tips: ${en_us_Tips.length}`)
}

/**
 * @param {string} text
 */
function mcToMd(text) {
  let result = text
  let fresh = ''
  while (true) {
    fresh = result
      .replace(/§[km](.*?)(§r|$)/im, '~~$1~~§r') // Obfuscated
      .replace(/§[0-9a-f](.*?)(§r|$)/im, '**$1**§r') // Colored -> italic
      .replace(/§[ln](.*?)(§r|$)/im, '`$1`§r') // Bold, underlined -> code
      .replace(/§o(.*?)(§r|$)/im, '_$1_§r') // Italic
    if (fresh === result) return result.replace(/§r/g, '')
    result = fresh
  }
}

// @ts-ignore
if (
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()
