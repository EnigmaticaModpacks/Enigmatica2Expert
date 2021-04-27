const hellItems = [
  ['appliedenergistics2:sky_stone_block',
  'minecraft:quartz_block'],

  ['minecraft:fence',
  'minecraft:nether_brick_fence'],

  [['minecraft:stone',
  'minecraft:dirt',
  'minecraft:grass',
  'minecraft:grass_path',
  'minecraft:farmland'],
  ['minecraft:netherrack',
  'minecraft:quartz_ore',
  'netherendingores:block_nether_netherfish']],

  ['minecraft:brick_block',
  'minecraft:nether_brick'],

  [['chisel:limestone',
  'minecraft:sandstone'],
  'mysticalagriculture:soulstone'],

  ['minecraft:mossy_cobblestone',
  'minecraft:magma'],

  [['minecraft:diamond_ore',
  'minecraft:emerald_ore'],
  'tconstruct:ore'],

  ['minecraft:stonebrick',
  'quark:magma_bricks'],

  ['chisel:bricks',
  'minecraft:red_nether_brick'],

  [['minecraft:redstone_ore',
  'minecraft:coal_ore'],
  'minecraft:quartz_ore'],

  [['additionalcompression:meatfish_compressed',
  'additionalcompression:meatchicken_compressed',
  'additionalcompression:meatbeef_compressed',
  'additionalcompression:meatporkchop_compressed'],
  'thaumcraft:flesh_block'],

  ['thaumcraft:stone_porous',
  ['additionalcompression:dustgunpowder_compressed',
  'forestry:ash_block_1']],

  [['minecraft:melon_block',
  'minecraft:hay_block'],
  'minecraft:nether_wart_block'],

  [['minecraft:gold_ore',
  'minecraft:iron_ore'],
  'netherendingores:ore_nether_modded_1'],

  ['iceandfire:ash',
  'chisel:block_coal_coke'],

  ['minecraft:diamond_block',
  'minecraft:gold_block'],

  ['minecraft:prismarine',
  'minecraft:glowstone'],

  ['minecraft:hardened_clay',
  'tcomplement:scorched_block'],

  ['minecraft:redstone_block',
  'quark:smoker'],

  ['chisel:basalt2',
  'tconstruct:seared'],

  [['minecraft:cobblestone',
  'quark:slate'],
  'quark:biome_cobblestone'],

  ['minecraft:slime',
  'minecraft:bone_block'],

  ['minecraft:emerald_block',
  'tconstruct:metal'],

  [['chisel:marble2',
  'astralsorcery:blockmarble'],
  ['thaumictinkerer:black_quartz_block',
  'botania:quartztypedark']],

  ['biomesoplenty:white_sand',
  'quark:jasper'],

  ['minecraft:mycelium',
  'extrautils2:cursedearth'],

  [['minecraft:gravel',
  'minecraft:clay'],
  'biomesoplenty:ash_block'],

  ['minecraft:sand',
  'minecraft:soul_sand'],

  ['minecraft:planks',
  'tconstruct:firewood'],

  [['minecraft:log',
  'minecraft:log2'],
  'advancedrocketry:charcoallog'],
]


// water => blood
const lines_map = new Map()
for (const [input, output] of hellItems) {
  for (const inp of (Array.isArray(input) ? input : [input])) {
    addEntry(inp, Array.isArray(output) ? output : [output])
  }
}

function addEntry(input, outputs) {
  const s_outputs = outputs.map(s=>`${s}>1`).join(' + ')
  let m = lines_map.get(s_outputs)
  if(m) m.push(input)
  else lines_map.set(s_outputs, [input])
}

const lines = [...lines_map].sort().map(([out, inps])=>inps.map(s=>s+'; ['+out+'],'))

console.log('lines :>> ', lines.sort().flat().join('\n'))