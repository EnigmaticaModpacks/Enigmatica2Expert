/**
 * @file Create MODS.md
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import _ from 'lodash'
import { getModLoadTimeTuples } from 'mc-benchmark'

import { fetchMods } from '../lib/curseforge.js'
import { loadMCInstanceFiltered } from '../lib/manifest.js'
import { defaultHelper, injectInFile, loadText } from '../lib/utils.js'

/** @typedef {import('../lib/minecraftinstance').InstalledAddon} InstalledAddon */
/** @typedef {import('curseforge-v2').CF2Addon} CF2Addon */

export function getModsIds(json_Path_A, json_Path_B) {
  const A = loadMCInstanceFiltered(json_Path_A).installedAddons
  const B = loadMCInstanceFiltered(json_Path_B).installedAddons

  const map_A = _.keyBy(A, 'addonID')
  const map_B = _.keyBy(B, 'addonID')

  const union = _.uniqBy([...B, ...A], 'addonID')
  const map_union = _.keyBy(union, 'addonID')

  const result = {
    map_A,
    map_B,
    union,
    map_union,
    both   : B.filter(o => map_A[o.addonID]),
    added  : B.filter(o => !map_A[o.addonID]),
    removed: A.filter(o => !map_B[o.addonID]),
    updated: B.filter(
      o =>
        map_A[o.addonID]
        && map_A[o.addonID].installedFile?.id !== o.installedFile?.id
    ),
  }
  return result
}

function getLogo(logo) {
  const url = logo?.thumbnailUrl
  if (!url) return

  // Example of url:
  // https://media.forgecdn.net/avatars/thumbnails/5/796/256/256/635351433944342580.png
  return url.replace(/256\/256/, '30/30')
  // return url
}

const exceptionsList = [
  'Just Enough Items (JEI)',
  'Tinkers Construct',
  'CraftTweaker',
]

/**
 * @param {string} modName
 * @param {string} fileName
 */
function getSquare(modName, fileName) {
  if (exceptionsList.includes(modName)) return '🟪'

  const tuples = getModLoadTimeTuples(loadText('logs/debug.log'))

  const loadTime
    = tuples.find(([m]) => m === modName)?.[1]
    ?? tuples.find(([, , m]) => m === fileName)?.[1]
    ?? tuples.find(([m]) => m.startsWith(modName))?.[1]

  if (!loadTime || isNaN(loadTime)) return '🟫'

  const rate = loadTime / _.sumBy(tuples, '1')

  if (rate < 0.0001) return '🟩'
  if (rate < 0.001) return '🟨'
  if (rate < 0.01) return '🟧'
  if (rate >= 0.01) return '🟥'
}

/**
 * @param {InstalledAddon} mcAddon
 * @param {CF2Addon} curseAddon
 */
export function formatRow(mcAddon, curseAddon, options = {}) {
  const name = curseAddon.name.trim()
  const fileName = mcAddon?.installedFile?.fileNameOnDisk
  const logo = getLogo(curseAddon.logo) ?? ''
  return (
    `${(options.asList ? '- ' : '')
    + (options.noIcon
      ? ''
      : `<img src="${logo}"${' '.repeat(
          Math.max(1, 93 - logo.length)
        )}> | ${getSquare(name, fileName)} `)
    }${' '.repeat(Math.max(0, 38 - name.length))}[**${name}**](${
      curseAddon.links.websiteUrl
    })${' '.repeat(Math.max(1, 75 - curseAddon.links.websiteUrl.length))}`
    + `<sup>${options.isUpdated ? ' 🟡 ' : ''}<sub>${fileName}</sub></sup>${
    options.noSummary ? '' : ` <br> ${curseAddon.summary}`
    } | `
  )
}

function formatTable(rows) {
  return [
    `${rows.length} mods in this section.`,
    '',
    'Icon | Summary',
    '----:|:-------',
    ...rows,
  ].join('\n')
}

export async function init(h = defaultHelper) {
  await h.begin('Get Mods diffs from JSONs')
  const diff = getModsIds(
    '../Enigmatica 2 Expert - E2E (unchanged, updated)/minecraftinstance.json',
    'minecraftinstance.json'
  )

  // Debug cutoff
  // diff.union = diff.union.slice(-30)

  await h.begin('Asking Curseforge API for mods', diff.union.length)

  /** @type {CF2Addon[]} */
  const cursedUnion = await fetchMods(diff.union.map(addon => addon.addonID))
  cursedUnion.sort((a, b) => a.id - b.id)

  // fs.writeFileSync(
  //   'CurseForge_example_return.json',
  //   JSON.stringify(cursedUnion, null, 2)
  // )

  await h.begin('Create markdown')
  const result = {
    BOTH    : cursedUnion.filter(({ id }) => diff.map_A[id] && diff.map_B[id]),
    EXTENDED: cursedUnion.filter(({ id }) => !diff.map_A[id] && diff.map_B[id]),
    REMOVED : cursedUnion.filter(({ id }) => diff.map_A[id] && !diff.map_B[id]),
  }

  for (const [key, rawList] of Object.entries(result)) {
    const rows = rawList.map((curseAddon) => {
      const isUpdated
        = key === 'BOTH' && diff.updated.some(o => o.addonID === curseAddon.id)
      return formatRow(diff.map_union[curseAddon.id], curseAddon, { isUpdated })
    })

    injectInFile(
      'MODS.md',
      `<!-- Automatic generated list ${key} -->\n`,
      '\n<!-- End of list -->',
      formatTable(rows)
    )
  }

  // generateManifest()

  h.result(`Described ${cursedUnion.length} mods`)
}

if (
  import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href
)
  init()
