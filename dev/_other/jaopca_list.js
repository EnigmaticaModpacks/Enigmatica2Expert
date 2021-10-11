
const _ = require('lodash')
const {
  config,
  getByOredict_first,
  prefferedModSort,
  naturalSort,
} = require('../lib/utils.js')

const list = _(config('config/JAOPCA.cfg'))
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

// const sublist = _(list.map(arr =>
//       arr.slice(1).map((o,i)=>new Array(3-i).fill(o)).flat()
//     ).flat())
//   .countBy(a=>a.display+' ')
//   .entries()
//   .sortBy(1)
//   .value()
// console.log('\nsublist :>>\n', formatOutput(sublist))

console.log([
  'Main | Extra 1-2-3',
  '------ | ------',
  '[Furnace] | [Crusher] (AA) [Infernal Furnace] [Sag Mill]',
  ..._(list)
  .map(arr=>arr.map(l=>`[${l?.commandString}]`))
  .map(items=>`${items[0]} | ${items.slice(1).join(' ')}`)
  .value()
].join('\n'))