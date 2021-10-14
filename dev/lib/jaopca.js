
//@ts-check


const _ = require('lodash')
const {
  getByOredict_first,
  prefferedModSort,
  getByOreBase,
} = require('./tellme.js')
const {
  config,
  naturalSort,
} = require('./utils.js')

let list

/**
 * 
 * @returns {import('./tellme.js').TMStack[][]}
 */
function getList() {
  return list ??= _(config('config/JAOPCA.cfg'))
  .map((o,main)=>
    [main,o.extra,o.extra2,o.extra3]
    .map(mat=>
      _(['ingot','gem','dust','ore']).map(prefix=>
        getByOredict_first(prefix + mat?.replace(/_(.)/g, '$1'))
      ).find(o=>!!o)
    )
  )
  .filter(o=>!!o[0])
  .sort((a,b)=>prefferedModSort(a[0], b[0]) || naturalSort(a[0].commandString, b[0].commandString))
  .value()
}

// const sublist = _(list.map(arr =>
//       arr.slice(1).map((o,i)=>new Array(3-i).fill(o)).flat()
//     ).flat())
//   .countBy(a=>a.display+' ')
//   .entries()
//   .sortBy(1)
//   .value()
// console.log('\nsublist :>>\n', formatOutput(sublist))

function oreBaseToJaopcaKey(oreBase) {
  return oreBase.replace(/(.)?([A-Z])/g, (m,p1,p2)=>(p1?p1+'_':'')+p2.toLowerCase())
}

module.exports = {
  
  /**
   * @param {string} oreBase
   * @returns {string?} extra oreBase
   */
  getExtra: (oreBase, extraIndex = 0) => 
      ['extra','extra2','extra3'].map(key =>
        config('config/JAOPCA.cfg')[oreBaseToJaopcaKey(oreBase)]?.[key]
      )[extraIndex],

  /** @param {string} oreBase */
  getExtraTMStack: (oreBase, extraIndex = 0) => 
    getByOreBase(this.getExtra(oreBase, extraIndex))

}


const init = module.exports.init = async function(h=require('../automate').defaultHelper) {
  console.log([
    'Main | Extra 1-2-3',
    '------ | ------',
    '[Furnace] | [Crusher] (AA) [Infernal Furnace] [Sag Mill]',
    ..._(getList())
    .map(arr=>arr.map(l=>`[${l?.commandString}]`))
    .map(items=>`${items[0]} | ${items.slice(1).join(' ')}`)
    .value()
  ].join('\n'))
}

if(require.main === module) init()