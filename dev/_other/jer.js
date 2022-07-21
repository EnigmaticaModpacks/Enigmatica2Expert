const fs = require('fs')

const glob = require('glob')
const _ = require('lodash')

const whole = glob
  .sync('dev/_other/JER/dims/*.json')
  .map((fPath) => JSON.parse(fs.readFileSync(fPath)))
  .flat()
  .filter(
    (o) =>
      o.block != 'thaumcraft:loot_urn_uncommon:0' &&
      o.block != 'thaumcraft:loot_urn_common:0'
  )

const dims = [
  [0, 'Overworld'],
  [-1, 'Nether'],
  [1, 'The End'],
  [7, 'Twilight Forest'],
  [-8, 'Ratlantis'],
  [-11325, 'Deep Dark'],
  [-2, 'Space'],
  [100, 'Luna'],
  [101, 'Mercury'],
  [102, 'Venus'],
  [103, 'Mars'],
  [104, 'Jupiter'],
  [105, 'Io'],
  [106, 'Europa'],
  [107, 'Saturn'],
  [108, 'Titan'],
  [109, 'Uranus'],
  [110, 'Neptune'],
  [111, 'Proxima B'],
  [112, 'Terra Nova'],
  [113, 'Novus'],
  [114, 'Stella'],
  [115, 'Philucka'],
  [116, 'Hubble'],
  [117, 'KELT-1b'],
  [118, 'KELT-2ab'],
  [119, 'KELT-3'],
  [120, 'KELT-4ab'],
  [121, 'KELT-6a'],
  [122, 'Kepler 0118'],
  [123, 'Kepler 0119'],
  [144, 'CompactMachines'],
  [2, 'Storage Cell'],
  [-343800852, 'Spectre'],
  [-3, 'Undefined Dim'],
]

function getDim(o) {
  return parseInt(o.dim.match(/Dim (-?\d+): .*/)?.[1] ?? -3)
}

const sorted = _.sortBy(whole, [
  (o) => dims.findIndex((dim) => dim[0] === getDim(o)),
  'block',
])

sorted.forEach((o) => {
  if (!o.dim.match(/Dim (-?\d+): .*/)) console.log('o :>> ', o)
  const dimId = getDim(o)
  if (isNaN(dimId)) console.log('o.dim :>> ', o.dim)
  o.dim = `${dims.find((dim) => dim[0] === dimId)[1]} (${dimId})`
})

fs.writeFileSync(
  'config/jeresources/world-gen.json',
  JSON.stringify(sorted, null, 2)
)
