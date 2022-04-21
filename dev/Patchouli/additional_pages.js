/**
 * @file This file will be evaluated when Patchouli.js generating book
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

import { renameDeep, loadJson } from '../lib/utils.js'

export function init(Patchouli_js, helpers) {
  // ----------------------------------------------------
  // World
  // ----------------------------------------------------
  Patchouli_js('World/Rules', [
    {
      item: 'minecraft:torch',
      title: 'Important Nerfs',
      _text: `Significant changes from E2E:
      $(li) Vanilla and Stone $(l)Torches/$ light level nerfed. Use modded.
      $(li) FTB chunk claiming $(l)not preventing/$ explosions.`,
    },
  ])

  // ----------------------------------------------------
  // Cyclic
  // ----------------------------------------------------
  Patchouli_js(
    'Items/Magic Bean',
    helpers.paged(
      {
        title: 'Magic Bean Drops',
        icon: 'cyclicmagic:sprout_seed',
        type: 'grid',
      },
      helpers
        .config('config/cyclicmagic.cfg')
        .cyclicmagic.blocks.magicbean.MagicBeanDropList.map((l) => l.replace(/\*(\d+)$/, ':$1'))
    )
  )

  // ----------------------------------------------------
  // TCon
  // ----------------------------------------------------
  Patchouli_js('Items/Recycling', [
    {
      item: 'requious:tinkers_disassembler',
      title: 'Tool recycling',
      _text: `Tools and Armor can be disassembled in $(l)Disassembler/$.
      $(li)The disassembler will try to deliver the strongest material
      $(li)Both of tools should have most or equal harvest level
      $(li)Output amount based on material cost
      $(li)Also sum more math`,
    },
  ])

  // ----------------------------------------------------
  // Mob spawn changes
  // ----------------------------------------------------
  Patchouli_js('Mobs/Spawn Changes', [
    {
      item: `draconicevolution:mob_soul{EntityName:"minecraft:enderman"}`,
      title: 'Enderman',
      _text: `When spawn in $(n)Overworld/$, 10% of times carry $(n)Compressed End Stone/$, or $(n)End Ore/$ with lower probabilities.`,
    },
    {
      item: `draconicevolution:mob_soul{EntityName:"emberroot:dire_wolf"}`,
      title: 'Dire Wolf',
      _text: `Spawns only in the dark.`,
    },
    {
      item: `draconicevolution:mob_soul{EntityName:"quark:stoneling"}`,
      title: 'Stoneling',
      _text: `Spawns $(n)only on Stone blocks/$ and not more than 3.`,
    },
    {
      item: `draconicevolution:mob_soul{EntityName:"rats:rat"}`,
      title: 'Rat',
      _text: `Spawns only on $(n)Garbage Piles/$.`,
    },
    {
      item: `draconicevolution:mob_soul{EntityName:"endreborn:watcher"}`,
      title: 'Watcher',
      _text: `Spawns in Overworld, only on $(n)any Endstone/$.`,
    },
    {
      item: `draconicevolution:mob_soul{EntityName:"endreborn:endguard"}`,
      title: 'Purpur Guard',
      _text: `Spawns anywhere, but only on $(n)Purpur blocks/$.`,
    },
  ])

  Patchouli_js('Mobs/Additional Drop', [
    {
      item: `draconicevolution:mob_soul{EntityName:"emberroot:rootsonespriteboss"}`,
      title: 'Guardian of Sprites',
      _text: `Hitting this mob would spawn $(#2af)Supermium Essence/$
        Essence amount depends on damage dealt.`,
    },
  ])
}
