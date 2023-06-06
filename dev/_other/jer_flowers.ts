import fs_extra from 'fs-extra'

const { readJsonSync, writeJsonSync } = fs_extra

const dataToReplace = {
  'biomesoplenty:double_plant:0': 'minecraft:dye:12',
  'biomesoplenty:double_plant:1': 'biomesoplenty:brown_dye:0',
  'biomesoplenty:flower_0:0'    : 'minecraft:dye:7',
  'biomesoplenty:flower_0:1'    : 'minecraft:dye:6',
  'biomesoplenty:flower_0:2'    : 'biomesoplenty:black_dye:0',
  'biomesoplenty:flower_0:3'    : 'minecraft:dye:6',
  'biomesoplenty:flower_0:4'    : 'minecraft:dye:12',
  'biomesoplenty:flower_0:5'    : 'minecraft:dye:14',
  'biomesoplenty:flower_0:6'    : 'minecraft:dye:9',
  'biomesoplenty:flower_0:7'    : 'minecraft:dye:13',
  'biomesoplenty:flower_0:8'    : 'minecraft:dye:5',
  'biomesoplenty:flower_0:9'    : 'biomesoplenty:white_dye:0',
  'biomesoplenty:flower_0:10'   : 'biomesoplenty:black_dye:0',
  'biomesoplenty:flower_0:11'   : 'minecraft:dye:1',
  'biomesoplenty:flower_0:12'   : 'minecraft:dye:8',
  'biomesoplenty:flower_0:13'   : 'minecraft:dye:9',
  'biomesoplenty:flower_0:14'   : 'biomesoplenty:white_dye:0',
  'biomesoplenty:flower_0:15'   : 'minecraft:dye:14',
  'biomesoplenty:flower_1:0'    : 'minecraft:dye:5',
  'biomesoplenty:flower_1:1'    : 'minecraft:dye:11',
  'biomesoplenty:flower_1:2'    : 'biomesoplenty:blue_dye:0',
  'biomesoplenty:flower_1:3'    : 'minecraft:dye:9',
  'biomesoplenty:flower_1:4'    : 'minecraft:dye:12',
  'biomesoplenty:flower_1:5'    : 'minecraft:dye:1',
  'biomesoplenty:mushroom:0'    : 'biomesoplenty:shroompowder:0',
  'biomesoplenty:mushroom:2'    : 'biomesoplenty:blue_dye:0',
  'biomesoplenty:mushroom:3'    : 'minecraft:dye:10',
  'biomesoplenty:mushroom:4'    : 'biomesoplenty:brown_dye:0',
  'biomesoplenty:plant_1:4'     : 'biomesoplenty:brown_dye:0',
  'biomesoplenty:plant_1:10'    : 'minecraft:dye:1',
}

const worldGen = readJsonSync('config/jeresources/world-gen.json')

const result = worldGen.map((o) => {
  const itemStack = dataToReplace[o.block]
  if (!itemStack) return o

  return Object.assign({
    block    : null,
    distrib  : null,
    silktouch: null,
    dropsList: null,
    dim      : null,
  }, {
    ...o,
    dropsList: [{
      itemStack,
      fortunes: { 0: 1.5, 1: 3, 2: 6, 3: 7.5 },
    }],
  })
})

writeJsonSync('config/jeresources/world-gen.json', result, { spaces: 2 })
