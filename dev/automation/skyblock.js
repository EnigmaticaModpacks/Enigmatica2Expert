/**
 * @file Add changes to config overrides for Skyblock mode
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

const _ = require('lodash')
const {loadText, saveText} = require('../lib/utils.js')
const {relative, resolve} = require('path')


const init = module.exports.init = async function(h=require('../automate').defaultHelper) {

  await h.begin('Replacing skyblock configs')

  const replaces = {
    'config/endreborn.cfg': [
      {from: /(B:(?:"End Islands"|"End Magma, Enropy End Stone"|"End Ruines"|"Essence Ore"|Observatory)=)\w+/g, to:'$1false'},
    ],
    'config/reccomplex.cfg': [
      {from: /(S:structureSpawnChance=)1\.0/g, to:'$10.0'},
    ],
    'config/tconstruct.cfg': [
      {from: /(B:generateSlimeIslands=)\w+/g, to:'$1false'},
    ]
  }

  let totalReplaced = 0
  _(replaces).forEach((repls, filePath)=>{
    let text = loadText(filePath)
    repls.forEach(repl=>text = text.replace(repl.from, repl.to))
    saveText(text,
      resolve('./dev/skyblock_overrides', relative(process.cwd(), filePath))
    )
    totalReplaced++
  })

  h.result(`Replaced in files: ${totalReplaced}`)
}

if(require.main === module) init()