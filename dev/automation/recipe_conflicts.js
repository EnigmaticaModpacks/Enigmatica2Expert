const fs = require('fs')
const chalk = require('chalk')
const {table} = require('table')
const {write} = require('../lib/utils.js')


const allConflicts = []
function init() {
  write(chalk.rgb(20, 184, 132)('  🡺🢀 Recipe Conflicts. '))
  const crafttweaker_log = fs.readFileSync('crafttweaker.log', 'utf8')
  const conflictingStartText = '[SERVER_STARTED][SERVER][INFO] Conflicting: '
  const conflictingIndex = crafttweaker_log.indexOf(conflictingStartText)
  if(conflictingIndex==-1)
    return noConflicts()
  
  const subLog = crafttweaker_log.substring(conflictingIndex)
  
  for (const [,match] of subLog.matchAll(
    /^\[SERVER_STARTED\]\[SERVER\]\[INFO\] (\[(Shaped|Shapeless)\] .*)$/gmi
  )) {
    handleConflict(match)
  }

  if(!allConflicts.length) return noConflicts()


  const config = {
    columns: [
      { alignment: 'right' },
      { alignment: 'right' },
      { alignment: 'left' },
    ],
  }

  const output = table(allConflicts, config)
  write('\n')
  console.log(output)
}

function noConflicts() {
  write(chalk.rgb(153, 153, 0)`No conflicting recipes found.  `)
}


const _shape = '\\[(?:Shaped|Shapeless)\\] '
const _recName = /\[((?:.(?!\]\())*.)\]/.source
const _itemName = /\(((?:.(?!\) <))*.)\)/.source
const _recipe = _shape + _recName + _itemName +
  ' (<[^>]+> \\* \\d+)'
const rgx_str = 
  /* 1 */_recipe +
  /*   */' conflicts with ' +
  /* 2 */_recipe
const rgx = new RegExp(rgx_str)
// console.log('rgx :>> ', rgx)


const fineConflicts = [
  (r1,r2) => r2.name === 'crafttweaker:boat',
  (r1,r2) => r2.name === 'quark:trapdoor',
  (r1,r2) => r1.item === '<minecraft:slime:0> * 1',
  (r1,r2) => r2.name === 'enderio:compatibility_glass_pane',
  (r1,r2) => r1.name.startsWith('storagedrawers:trim_') && r2.name.startsWith('crafttweaker:trim'),
  (r1,r2) => r1.name.startsWith('storagedrawers:basicdrawers_') && r2.name.match(/^crafttweaker:.*drawer.*/),
]

function handleConflict(match) {
  // console.log('match :>> ', match)
  const [,rec1_name, rec1_item, rec1_out, rec2_name, rec2_item, rec2_out] = match.match(rgx)
  const r1 = {name: rec1_name, item: rec1_out, itemName: rec1_item}
  const r2 = {name: rec2_name, item: rec2_out, itemName: rec2_item}
  if (fineConflicts.some(isFine=>isFine(r1, r2))) return

  allConflicts.push([
    chalk.rgb(160,250,100)(rec1_item) +'\n'+ chalk.rgb(160,250,200)(rec2_item),
    chalk.rgb(100,200,100)(rec1_out)  +'\n'+ chalk.rgb(100,200,200)(rec2_out),
    chalk.rgb( 50,120,20) (rec1_name) +'\n'+ chalk.rgb( 50,120,120)(rec2_name),
  ])
}

module.exports.init = init
if(process.argv?.[0]?.split('\\').pop()==='node.exe') init()