/**
 * @file This file will be evaluated when Patchouli.js generating book
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import { loadText } from '../lib/utils.js'

export function init(Patchouli_js, helpers) {
  // ----------------------------------------------------
  // World
  // ----------------------------------------------------
  Patchouli_js('World/Rules', [
    {
      item : 'minecraft:torch',
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
        icon : 'cyclicmagic:sprout_seed',
        type : 'grid',
      },
      helpers
        .config('config/cyclicmagic.cfg')
        .cyclicmagic.blocks.magicbean.MagicBeanDropList.map(l =>
          l.replace(/\*(\d+)$/, ':$1')
        )
    )
  )

  // ----------------------------------------------------
  // TCon
  // ----------------------------------------------------
  Patchouli_js('Items/Recycling', [
    {
      item : 'tconstruct:shard{Material:"wood"}',
      title: 'Tool recycling',
      _text: `
      $(li)You need 5 tools: §6Hatchet§r, §6Pickaxe§r, §6Shovel§r, §6Chisel§r and §6Sledge Hammer§r.
      $(li)Place tools (§2T§r) and gear you want to disassemble (§3G§r) into crafting table in this order
        §2TTT§r
        §2T§3G§2T§r.`,
    },
    {
      title: 'Tool recycling',
      _text: `
      $(li)If you placed items in right order, you would get Shards of material with highest mining level.
      $(li)You get less shards if gear damaged.
      $(li)If you placed tools in wrong order, you will get same gear back but damaged. Each tool that "not on its place" damage gear to 1.`,
    },
    {
      title: 'Tool recycling',
      _text: `
      $(li)So, cycling tools order you can descrease damage, finding perfect order eventually.
      $(li)Each time you perform recipe, tools damaged on 10
      $(li)You can get shards of material softer than average mining level or tools. For example, you cant get Iron Shards by disassembling with Wooden tools.`,
    },
    {
      title: 'Tool recycling',
      _text: `
      $(li)If you disassembling gear, which every tool part have higher mining level than your tools, you get Stone Shard as result.
      $(li)There is also Paper and Bone shards - when you disassemble buggy tool.`,
    },
  ])

  // ----------------------------------------------------
  // Mob spawn changes
  // ----------------------------------------------------
  Patchouli_js('Mobs/Spawn Changes', [
    {
      item : 'draconicevolution:mob_soul{EntityName:"minecraft:enderman"}',
      title: 'Enderman',
      _text: 'When spawn in $(n)Overworld/$, 10% of times carry $(n)Compressed End Stone/$, or $(n)End Ore/$ with lower probabilities.',
    },
    {
      item : 'draconicevolution:mob_soul{EntityName:"emberroot:dire_wolf"}',
      title: 'Dire Wolf',
      _text: 'Spawns only in the dark.',
    },
    {
      item : 'draconicevolution:mob_soul{EntityName:"quark:stoneling"}',
      title: 'Stoneling',
      _text: 'Spawns $(n)only on Stone blocks/$ and not more than 3.',
    },
    {
      item : 'draconicevolution:mob_soul{EntityName:"rats:rat"}',
      title: 'Rat',
      _text: 'Spawns only on $(n)Garbage Piles/$.',
    },
    {
      item : 'draconicevolution:mob_soul{EntityName:"endreborn:watcher"}',
      title: 'Watcher',
      _text: 'Spawns in Overworld, only on $(n)any Endstone/$.',
    },
    {
      item : 'draconicevolution:mob_soul{EntityName:"endreborn:endguard"}',
      title: 'Purpur Guard',
      _text: 'Spawns anywhere, but only on $(n)Purpur blocks/$ or $(n)Cursed Earth/$.',
    },
  ])

  Patchouli_js('Mobs/Additional Drop', [
    {
      item : 'draconicevolution:mob_soul{EntityName:"emberroot:rootsonespriteboss"}',
      title: 'Guardian of Sprites',
      _text: `Hitting this mob would spawn $(#2af)Supermium Essence/$
        Essence amount depends on damage dealt.`,
    },
  ])

  Patchouli_js('World/Tips', loadText('resources/tips/lang/en_us.lang')
    .split('\n')
    .map(l => l.replace(/^[^=]+=/, ''))
    .reduce((acc, line) => {
      const i = acc.length - 1
      const height = s => s.length
      if (acc[i] && height(acc[i]) + height(line) < 15 * 21)
        acc[i] += `\n${line}`
      else acc.push(line)
      return acc
    }, [])
    .map(lines => ({
      item: 'thaumicaugmentation:research_notes',
      type: 'text',
      text: lines
        .replace(/^(.+)/gm, '$(li)$1')
        .replace(/§e/gm, '§6') // Yellow too bright to read with default Patchouli background texture
        .replace(/\n/gm, ''),
    }))
  )
}
