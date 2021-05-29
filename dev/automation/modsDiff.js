const fs = require('fs')
const curseforge = require('mc-curseforge-api')
const {injectInFile} = require('../lib/utils.js')
const _ = require('lodash')


function getModsIds(json_Path_A, json_Path_B) {
  const A = JSON.parse(fs.readFileSync(json_Path_A, 'utf8')).installedAddons
  const B = JSON.parse(fs.readFileSync(json_Path_B, 'utf8')).installedAddons
  const union = _.uniqBy([...B, ...A], 'addonID')
  const map_A = {}; A.forEach(e=>map_A[e.addonID] = e)
  const map_B = {}; B.forEach(e=>map_B[e.addonID] = e)
  const map_union = {}; union.forEach(e=>map_union[e.addonID] = e)

  const result = {
    map_A,
    map_B,
    union,
    map_union,
    both:    B.filter(o => map_A[o.addonID]),
    added:   B.filter(o =>!map_A[o.addonID]),
    removed: A.filter(o =>!map_B[o.addonID]),
    updated: null,
  }
  result.updated = B.filter(o => map_A[o.addonID] && map_A[o.addonID].installedFile.id !== o.installedFile?.id)
  return result
}

module.exports.formatRow = formatRow
function formatRow(mcAddon, curseAddon, options={}) {
  return (options.asList?'- ':'') + 
  (options.noIcon?'':`<img src="${curseAddon.logo?.thumbnailUrl}" width="50"> | `)+
  `[**${curseAddon.name.trim()}**](${curseAddon.url}) `+
  `<sup>${options.isUpdated?' 🟡 ':''}<sub>${mcAddon?.installedFile?.FileNameOnDisk}</sub></sup>`+
  (options.noSummary?'':` <br> ${curseAddon.summary}`)
}

function formatTable(rows) {
  return [
    'Icon | Summary',
    '----:|:-------',
    ...rows
  ].join('\n')
}

async function init() {
  const diff = getModsIds('../Enigmatica 2 Expert - E2E (unchanged, updated)/minecraftinstance.json', 'minecraftinstance.json')

  console.log(`  💟 Asking Curseforge API for ${diff.union.length} mods ...`)

  const cursedUnion = await Promise.all(diff.union.map(mcAddon=>curseforge.getMod(mcAddon.addonID)))
  
  console.log(`  💟 Curseforge API returns ${cursedUnion.length} mods ...`)
  cursedUnion.sort((a,b) => b.downloads - a.downloads)

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
}

module.exports.getModsIds = getModsIds
module.exports.init = init

if(process.argv?.[0]?.split('\\').pop()==='node.exe') init()

/*

Curseforge Result:

interface RootObject {
  id: number;
  name: string;
  authors: Author[];
  attachments: Attachment[];
  url: string;
  summary: string;
  defaultFileId: number;
  downloads: number;
  latestFiles: LatestFile[];
  key: string;
  featured: boolean;
  popularityScore: number;
  gamePopularityRank: number;
  primaryLanguage: string;
  logo: Attachment;
  updated: string;
  created: string;
  released: string;
  available: boolean;
}

interface LatestFile {
  id: number;
  minecraft_versions: string[];
  file_size: number;
  timestamp: string;
  release_type: number;
  download_url: string;
  mod_dependencies: any[];
  alternate: boolean;
  alternate_id: number;
  available: boolean;
}

interface Attachment {
  id: number;
  projectId: number;
  description: string;
  isDefault: boolean;
  thumbnailUrl: string;
  title: string;
  url: string;
  status: number;
}

interface Author {
  name: string;
  url: string;
  projectId: number;
  id: number;
  projectTitleId?: any;
  projectTitleTitle?: any;
  userId: number;
  twitchId: number;
}

*/