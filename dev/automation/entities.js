/**
 * @file Control entities for modpack
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

const _ = require('lodash')
const path = require('path')
const { getCSV, isBlock, loadText, saveText } = require('../lib/utils.js')
const numeral = require('numeral')

/**
 * @param {string|number} v
 */
const nice = v => {return numeral(+v).format('0.0')}



const init = module.exports.init = async function(h=require('../automate').defaultHelper) {

  //###############################################################################
  // Living Matter
  //###############################################################################
  const livingmatter = getCSV(path.resolve(__dirname, './data/living_matter.csv'))
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

  const mobspawnamounts = getCSV(path.resolve(__dirname, './data/entities.csv'))
  .map(l=>`    S:"${l.ID}.spawnamount.0" <
          ${isBlock(l.Representation) ? 'B' : 'I'}
          ${l.Representation}
          0
          ${nice(l.Value/10000)}
      >
      S:"${l.ID}.spawnamount.1" <
          ${isBlock(l['Home Block']) ? 'B' : 'I'}
          ${l['Home Block']}
          0
          ${nice(l.Value/2000)}
      >
      S:"${l.ID}.spawnamount.2" <
          L
          
          0
          ${nice(Math.sqrt(l.Value))}
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


if(require.main === module) init()