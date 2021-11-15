/**
 * @file Control entities for modpack
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

import _ from 'lodash'
import { getCSV, loadText, saveText, defaultHelper } from '../lib/utils.js'
import { isBlock } from '../lib/tellme.js'
import numeral from 'numeral'


import { URL, fileURLToPath  } from 'url' // @ts-ignore
function relative(relPath='./') { return fileURLToPath(new URL(relPath, import.meta.url)) }

/**
 * @param {string|number} v
 */
const nice = v => {return numeral(+v).format('0.0')}



export async function init(h=defaultHelper) {

  //###############################################################################
  // Living Matter
  //###############################################################################
  const livingmatter = getCSV(relative('./data/living_matter.csv'))
  .map(l=>` <
          ${isBlock(l.ID) ? 'B' : 'I'}
          ${l.ID}
          ${l.Value}
  >`)

  const rftoolsConfig = loadText('config/rftools/rftools.cfg')

  let replacedConfig = 
  rftoolsConfig.replace(/^(livingmatter\s*\{\s*)\n([^}]*)(\n\s*\})$/m, 
  (m, p1,p2,p3) => {
    const vanillaLM = p2.split(/\s*S:living./)
    .filter(s=>s.includes('minecraft:'))

    const highestIndex = _.max(vanillaLM.map(s=>+s.match(/^(\d+)[\s\S]*/)[1]))

    return p1+
    vanillaLM
    .map(s=>'\n    S:living.'+s)
    .concat(
      livingmatter
      .map((s,i)=>'\n    S:living.'+(highestIndex+i+1)+s)
      ).join('')
    + p3
  })


  //###############################################################################
  // Spawner
  //###############################################################################

  const mobspawnamounts = getCSV(relative('./data/entities.csv'))
  .map(l=>`    S:"${l.ID}.spawnamount.0" <
          ${isBlock(l.Representation) ? 'B' : 'I'}
          ${l.Representation}
          0
          ${nice(parseFloat(l.Value)/10000)}
      >
      S:"${l.ID}.spawnamount.1" <
          ${isBlock(l['Home Block']) ? 'B' : 'I'}
          ${l['Home Block']}
          0
          ${nice(parseFloat(l.Value)/2000)}
      >
      S:"${l.ID}.spawnamount.2" <
          L
          
          0
          ${nice(Math.sqrt(parseFloat(l.Value)))}
      >`)


  replacedConfig = 
  replacedConfig.replace(/^(mobspawnamounts\s*\{\s*)([^}]*)(\n\s*\})$/m, 
  (m, p1,p2,p3) => {
    const matchesChunks = _.chunk([...p2.matchAll(/^\s*S:(.+)\.spawnamount\.([0-2])"?\s*<([^>]+)>/gm)], 3)
    .filter(chunk => {
      const lines = chunk[0][0].split('\n')
      return lines[0].includes('minecraft:') || !chunk[0][1].includes(':')
    })
    .map(chunk => chunk.map(m=>m[0]).join('\n'))


    return p1+
      matchesChunks
      .concat(mobspawnamounts)
      .join('\n')
    + p3
  })



  saveText(replacedConfig, 'config/rftools/rftools.cfg')

  h.result(`Rewritten ${mobspawnamounts.length} entities and ${livingmatter.length} livingmatter`)
}


// @ts-ignore
if(import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href) init()