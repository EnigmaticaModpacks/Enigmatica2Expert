import { parse } from 'node:path'
import fs_extra from 'fs-extra'
import glob from 'glob'

import { naturalSort } from '../lib/utils.js'

const { copyFileSync, mkdirSync } = fs_extra

// const files = [
//   ...glob.sync('resources/tconstruct/textures/items/*/*_contrast.png'),
//   ...glob.sync('resources/conarm/textures/items/*/*_contrast.png'),
//   // ...glob.sync('resources/conarm/textures/models/armor/*_contrast.png'),
// ]

// files.forEach((f) => {
//   const fPath = f
//     .replace(/\\|\//g, '$')
//     .replace('_contrast', '_mithrillium')
//   console.log(fPath)
//   // copyFileSync(f, `E:/tmp/${fPath}`)
// })

// const newFiles = glob.sync('E:/tmp/*.png')
//   .map(f => f.replace(/\$|\\/g, '/'))
//   .reverse()
//   .map(f => relative('E:/tmp', f))

const newFiles = [
  'conarm/textures/items/boots/broken_core_$$.png',
  'conarm/textures/items/boots/core_$$.png',
  'conarm/textures/items/boots/plate_$$.png',
  'conarm/textures/items/boots/trim_$$.png',
  'conarm/textures/items/chestplate/broken_core_$$.png',
  'conarm/textures/items/chestplate/core_$$.png',
  'conarm/textures/items/chestplate/plate_$$.png',
  'conarm/textures/items/chestplate/trim_$$.png',
  'conarm/textures/items/helmet/broken_core_$$.png',
  'conarm/textures/items/helmet/core_$$.png',
  'conarm/textures/items/helmet/plate_$$.png',
  'conarm/textures/items/helmet/trim_$$.png',
  'conarm/textures/items/leggings/broken_core_$$.png',
  'conarm/textures/items/leggings/core_$$.png',
  'conarm/textures/items/leggings/plate_$$.png',
  '',
  'conarm/textures/items/leggings/trim_$$.png',
  'conarm/textures/items/parts/armor_plate_$$.png',
  'conarm/textures/items/parts/armor_trim_$$.png',
  'conarm/textures/items/parts/boots_core_$$.png',
  'conarm/textures/items/parts/chest_core_$$.png',
  'conarm/textures/items/parts/helmet_core_$$.png',
  'conarm/textures/items/parts/leggings_core_$$.png',
  'conarm/textures/items/parts/polishing_kit_$$.png',
  'tconstruct/textures/items/arrow/head_$$.png',
  'tconstruct/textures/items/battleaxe/backhead_$$.png',
  'tconstruct/textures/items/battleaxe/binding_$$.png',
  'tconstruct/textures/items/battleaxe/broken_fronthead_$$.png',
  'tconstruct/textures/items/battleaxe/broken_head_$$.png',
  'tconstruct/textures/items/battleaxe/fronthead_$$.png',
  'tconstruct/textures/items/battleaxe/handle_$$.png',
  'tconstruct/textures/items/battlesign/broken_head_$$.png',
  'tconstruct/textures/items/battlesign/handle_$$.png',
  'tconstruct/textures/items/battlesign/head_$$.png',
  'tconstruct/textures/items/bolt/head_$$.png',
  'tconstruct/textures/items/broadsword/blade_$$.png',
  'tconstruct/textures/items/broadsword/broken_blade_$$.png',
  'tconstruct/textures/items/broadsword/guard_$$.png',
  'tconstruct/textures/items/broadsword/handle_$$.png',
  'tconstruct/textures/items/cleaver/broken_head_$$.png',
  'tconstruct/textures/items/cleaver/guard_$$.png',
  'tconstruct/textures/items/cleaver/head_$$.png',
  'tconstruct/textures/items/cleaver/shield_$$.png',
  'tconstruct/textures/items/cutlass/blade_$$.png',
  'tconstruct/textures/items/cutlass/broken_blade_$$.png',
  'tconstruct/textures/items/cutlass/guard_$$.png',
  'tconstruct/textures/items/cutlass/handle_$$.png',
  'tconstruct/textures/items/excavator/binding_$$.png',
  'tconstruct/textures/items/excavator/broken_head_$$.png',
  'tconstruct/textures/items/excavator/grip_$$.png',
  'tconstruct/textures/items/excavator/handle_$$.png',
  'tconstruct/textures/items/excavator/head_$$.png',
  'tconstruct/textures/items/frypan/broken_head_$$.png',
  'tconstruct/textures/items/frypan/head_$$.png',
  'tconstruct/textures/items/hammer/back_$$.png',
  'tconstruct/textures/items/hammer/broken_handle_$$.png',
  'tconstruct/textures/items/hammer/front_$$.png',
  'tconstruct/textures/items/hammer/handle_$$.png',
  'tconstruct/textures/items/hammer/head_$$.png',
  'tconstruct/textures/items/hatchet/binding_$$.png',
  'tconstruct/textures/items/hatchet/broken_head_$$.png',
  'tconstruct/textures/items/hatchet/head_$$.png',
  'tconstruct/textures/items/kama/binding_$$.png',
  'tconstruct/textures/items/kama/broken_head_$$.png',
  'tconstruct/textures/items/kama/head_$$.png',
  'tconstruct/textures/items/longbow/grip_$$.png',
  'tconstruct/textures/items/longbow/limb_bottom_2_$$.png',
  'tconstruct/textures/items/longbow/limb_bottom_3_$$.png',
  'tconstruct/textures/items/longbow/limb_bottom_$$.png',
  'tconstruct/textures/items/longbow/limb_top_2_$$.png',
  'tconstruct/textures/items/longbow/limb_top_3_$$.png',
  'tconstruct/textures/items/longbow/limb_top_$$.png',
  'tconstruct/textures/items/longsword/blade_$$.png',
  'tconstruct/textures/items/longsword/broken_blade_$$.png',
  'tconstruct/textures/items/longsword/guard_$$.png',
  'tconstruct/textures/items/lumberaxe/broken_head_$$.png',
  'tconstruct/textures/items/lumberaxe/handle_$$.png',
  'tconstruct/textures/items/lumberaxe/head_$$.png',
  'tconstruct/textures/items/lumberaxe/shield_$$.png',
  'tconstruct/textures/items/mattock/back_$$.png',
  'tconstruct/textures/items/mattock/broken_head_$$.png',
  'tconstruct/textures/items/mattock/handle_$$.png',
  'tconstruct/textures/items/mattock/head_$$.png',
  'tconstruct/textures/items/parts/arrow_head_$$.png',
  'tconstruct/textures/items/parts/binding_$$.png',
  'tconstruct/textures/items/parts/knife_blade_$$.png',
  'tconstruct/textures/items/parts/large_plate_$$.png',
  'tconstruct/textures/items/parts/large_sword_blade_$$.png',
  'tconstruct/textures/items/parts/shard_$$.png',
  'tconstruct/textures/items/parts/sharpening_kit_$$.png',
  'tconstruct/textures/items/parts/sword_blade_$$.png',
  'tconstruct/textures/items/parts/tool_rod_$$.png',
  'tconstruct/textures/items/parts/tough_binding_$$.png',
  'tconstruct/textures/items/parts/tough_tool_rod_$$.png',
  'tconstruct/textures/items/parts/wide_guard_$$.png',
  'tconstruct/textures/items/pickaxe/binding_$$.png',
  'tconstruct/textures/items/pickaxe/broken_head_$$.png',
  'tconstruct/textures/items/pickaxe/handle_$$.png',
  'tconstruct/textures/items/pickaxe/head_$$.png',
  'tconstruct/textures/items/rapier/blade_$$.png',
  'tconstruct/textures/items/rapier/broken_blade_$$.png',
  'tconstruct/textures/items/rapier/guard_$$.png',
  'tconstruct/textures/items/scythe/accessory_$$.png',
  'tconstruct/textures/items/scythe/binding_$$.png',
  'tconstruct/textures/items/scythe/broken_head_$$.png',
  'tconstruct/textures/items/scythe/handle_$$.png',
  'tconstruct/textures/items/scythe/head_$$.png',
  'tconstruct/textures/items/shortbow/limb_bottom_2_$$.png',
  'tconstruct/textures/items/shortbow/limb_bottom_3_$$.png',
  'tconstruct/textures/items/shortbow/limb_bottom_$$.png',
  'tconstruct/textures/items/shortbow/limb_top_2_$$.png',
  'tconstruct/textures/items/shortbow/limb_top_3_$$.png',
  'tconstruct/textures/items/shortbow/limb_top_$$.png',
  'tconstruct/textures/items/shovel/binding_$$.png',
  'tconstruct/textures/items/shovel/broken_head_$$.png',
  'tconstruct/textures/items/shovel/handle_$$.png',
  'tconstruct/textures/items/shovel/head_$$.png',
  'tconstruct/textures/items/shuriken/shuriken2_$$.png',
  'tconstruct/textures/items/shuriken/shuriken3_$$.png',
  'tconstruct/textures/items/shuriken/shuriken4_$$.png',
  'tconstruct/textures/items/shuriken/shuriken_$$.png',
  'conarm/textures/models/armor/armor_core_$$.png',
  'conarm/textures/models/armor/armor_plates_$$.png',
  'conarm/textures/models/armor/armor_trim_$$.png',
  'conarm/textures/models/armor/broken_armor_core_$$.png',
]

const actualFiles = glob
  .sync('E:/tmp/images/*.png')
  .sort(naturalSort)

if (newFiles.length !== actualFiles.length) throw new Error('Cant find file list')

actualFiles.forEach((f, i) => {
  const parsedPath = parse(f)
  const [material] = parsedPath.name.split('_')
  if (!newFiles[i]) return
  const to = `resources/${newFiles[i].replace('$$', material)}`
  mkdirSync(parse(to).dir, { recursive: true })
  copyFileSync(f, to)
  // console.log(to)
})
