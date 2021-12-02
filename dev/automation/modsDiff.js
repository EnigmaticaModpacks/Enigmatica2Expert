/**
 * @file Create MODS.md
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

import { getMod } from 'mc-curseforge-api'
import { injectInFile, loadJson, defaultHelper } from '../lib/utils.js'
import _ from 'lodash'
import { getModLoadTimeTuples } from './benchmark.js'

export function getModsIds(json_Path_A, json_Path_B) {

  /** @type {InstalledAddon[]} */ 
  const A = loadJson(json_Path_A).installedAddons

  /** @type {InstalledAddon[]} */ 
  const B = loadJson(json_Path_B).installedAddons

  const union = _.uniqBy([...B, ...A], 'addonID')

  /** @type {Object<number, InstalledAddon>} */
  const map_A = {}; A.forEach(e=>map_A[e.addonID] = e)

  /** @type {Object<number, InstalledAddon>} */
  const map_B = {}; B.forEach(e=>map_B[e.addonID] = e)
  
  /** @type {Object<number, InstalledAddon>} */
  const map_union = {}; union.forEach(e=>map_union[e.addonID] = e)

  const result = {
    map_A,
    map_B,
    union,
    map_union,
    both:    B.filter(o => map_A[o.addonID]),
    added:   B.filter(o =>!map_A[o.addonID]),
    removed: A.filter(o =>!map_B[o.addonID]),

    /** @type {InstalledAddon[]} */ 
    updated: null,
  }
  result.updated = B.filter(o => map_A[o.addonID] && map_A[o.addonID].installedFile?.id !== o.installedFile?.id)
  return result
}

function getLogo(logo) {
  const url = logo?.thumbnailUrl
  if(!url) return

  // Example of url:
  // https://media.forgecdn.net/avatars/thumbnails/5/796/256/256/635351433944342580.png
  // return url.replace(/(media\.forgecdn\.net\/avatars\/thumbnails\/\d+\/\d+\/)\d+\/\d+/, '$1'+'64/64')
  return url
}

const exceptionsList = [
  'Just Enough Items (JEI)',
  'Tinkers Construct',
  'CraftTweaker'
]

/**
 * @param {string} modName
 * @param {string} fileName
 */
function getSquare(modName, fileName) {
  if(exceptionsList.includes(modName)) return '🟪'
  
  const loadTime = 
    getModLoadTimeTuples().find(  ([m])=>m===modName)?.[1] ??
    getModLoadTimeTuples().find(([,,m])=>m===fileName)?.[1] ??
    getModLoadTimeTuples().find(  ([m])=>m.startsWith(modName))?.[1]

  if (isNaN(loadTime)) return '🟫'

  const rate = loadTime / _.sumBy(getModLoadTimeTuples(), '1')

  if(rate < 0.0001) return '🟩'
  if(rate < 0.001 ) return '🟨'
  if(rate < 0.01  ) return '🟧'
  if(rate >=0.01  ) return '🟥'
}

/**
 * @param {InstalledAddon} mcAddon
 * @param {Mod} curseAddon
 */
export function formatRow(mcAddon, curseAddon, options={}) {
  const name = curseAddon.name.trim()
  const fileName = mcAddon?.installedFile?.FileNameOnDisk
  const logo = getLogo(curseAddon.logo) ?? ''
  return (options.asList?'- ':'') + 
  (options.noIcon?'':`<img src="${logo}"${' '.repeat(Math.max(1, 93 - logo.length))}width="50"> | ${getSquare(name, fileName)} `)+
  `${' '.repeat(Math.max(0, 38 - name.length))}[**${name}**](${curseAddon.url})${' '.repeat(Math.max(1, 75 - curseAddon.url.length))}`+
  `<sup>${options.isUpdated?' 🟡 ':''}<sub>${fileName}</sub></sup>`+
  (options.noSummary?'':` <br> ${curseAddon.summary}`)+' | '
}


function formatTable(rows) {
  return [
    `${rows.length} mods in this section.`,
    '',
    'Icon | Summary',
    '----:|:-------',
    ...rows
  ].join('\n')
}

export async function init(h=defaultHelper) {

  await h.begin('Get Mods diffs from JSONs')
  const diff = getModsIds('../Enigmatica 2 Expert - E2E (unchanged, updated)/minecraftinstance.json', 'minecraftinstance.json')

  // Debug cutoff
  // diff.union = diff.union.slice(-30)

  await h.begin('Asking Curseforge API for mods', diff.union.length)

  const cursedUnion = await Promise.all(diff.union.map(mcAddon=>{
    const p = getMod(mcAddon.addonID)
    p.then(()=>h.step())
    return p
  }))
  
  cursedUnion.sort((a,b) => b.downloads - a.downloads)
  
  // fs.writeFileSync(
  //   'CurseForge_example_return.json',
  //   JSON.stringify(cursedUnion, null, 2)
  // )

  await h.begin('Create markdown')
  let result = {
    BOTH:     cursedUnion.filter(({id}) => diff.map_A[id] && diff.map_B[id]),
    EXTENDED: cursedUnion.filter(({id}) =>!diff.map_A[id] && diff.map_B[id]),
    REMOVED:  cursedUnion.filter(({id}) => diff.map_A[id] &&!diff.map_B[id]),
  }

  for (const [key, rawList] of Object.entries(result)) {
    const rows = rawList.map(curseAddon=>{
      const isUpdated = key==='BOTH' && diff.updated.some(o=>o.addonID===curseAddon.id)
      return formatRow(diff.map_union[curseAddon.id], curseAddon, {isUpdated})
    })

    injectInFile('MODS.md', 
      `<!-- Automatic generated list ${key} -->\n`,
      '\n<!-- End of list -->',
      formatTable(rows)
    )
  }

  h.result(`Described ${cursedUnion.length} mods`)
}


// @ts-ignore
if(import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href) init()

/**
 * @typedef {Object} InstalledAddon
 * @property {number} addonID
 * @property {string} gameInstanceID
 * @property {InstalledFile} installedFile
 * @property {string} dateInstalled
 * @property {string} dateUpdated
 * @property {string} dateLastUpdateAttempted
 * @property {number} status
 * @property {boolean} [preferenceAutoInstallUpdates]
 * @property {boolean} preferenceAlternateFile
 * @property {boolean} preferenceIsIgnored
 * @property {boolean} isModified
 * @property {boolean} isWorkingCopy
 * @property {boolean} isFuzzyMatch
 * @property {any} [preferenceReleaseType]
 * @property {any} [manifestName]
 * @property {any} [installedTargets]
 */

/**
 * @typedef {Object} InstalledFile
 * @property {number} id
 * @property {string} displayName
 * @property {string} fileName
 * @property {string} fileDate
 * @property {number} fileLength
 * @property {number} releaseType
 * @property {number} fileStatus
 * @property {string} downloadUrl
 * @property {boolean} isAlternate
 * @property {number} alternateFileId
 * @property {Dependency[]} dependencies
 * @property {boolean} isAvailable
 * @property {Module[]} modules
 * @property {number} packageFingerprint
 * @property {string[]} gameVersion
 * @property {boolean} hasInstallScript
 * @property {boolean} isCompatibleWithClient
 * @property {number} categorySectionPackageType
 * @property {number} restrictProjectFileAccess
 * @property {number} projectStatus
 * @property {number} projectId
 * @property {string} gameVersionDateReleased
 * @property {number} gameId
 * @property {boolean} isServerPack
 * @property {string} FileNameOnDisk
 * @property {SortableGameVersion[]} [sortableGameVersion]
 * @property {number} [renderCacheId]
 * @property {number} [packageFingerprintId]
 * @property {number} [gameVersionMappingId]
 * @property {number} [gameVersionId]
 */

/**
 * @typedef {Object} SortableGameVersion
 * @property {string} gameVersionPadded
 * @property {string} gameVersion
 * @property {string} gameVersionReleaseDate
 * @property {string} gameVersionName
 */

/**
 * @typedef {Object} Module
 * @property {string} foldername
 * @property {number} fingerprint
 * @property {number} type
 * @property {boolean} invalidFingerprint
 */

/**
 * @typedef {Object} Dependency
 * @property {number} id
 * @property {number} addonId
 * @property {number} type
 * @property {number} fileId
 */