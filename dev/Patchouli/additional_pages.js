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
  Patchouli_js('World/Rules', [{
    item:	'minecraft:torch',
    title: 'Important Nerfs',
    _text: `Significant changes from E2E:
      $(li) Vanilla and Stone $(l)Torches/$ light level nerfed. Use modded.
      $(li) FTB chunk claiming $(l)not preventing/$ explosions.`,
  }])


  // ----------------------------------------------------
  // Extract item list from loot data
  // ----------------------------------------------------
  const defaultLoot_json = loadJson('./config/betterquesting/DefaultLoot.json')
  const lootboxes = {}
  const bareLoot = {}
  for (const v1 of Object.values(defaultLoot_json['groups:9'])) {
    const currRarity = {
      weight: v1['weight:3'],
      rewards: []
    }
    lootboxes[v1['name:8']] = currRarity

    const currBareLoot = []
    bareLoot[v1['name:8']] = currBareLoot

    for (const v2 of Object.values(v1['rewards:9'])) {
      const currReward = {
        weight: v2['weight:3'],
        items: {}
      }
      currRarity.rewards.push(currReward)

      for (const v of Object.values(v2['items:9'])) {
        const itemName = v['id:8'] + (v['Damage:2']!=0?(':'+v['Damage:2']):'')
        const itemCount = v['Count:3']
        const itemTag = v['tag:10'] ? renameDeep(v['tag:10'], key => key.split(':').shift()) : undefined
        const tagAsString = itemTag ? JSON.stringify(itemTag) : ''

        const resultString = itemName+'<count_here>'+tagAsString

        currReward.items[resultString] = (currReward.items[resultString] || 0) + itemCount
      }

      for (const [k,v] of Object.entries(currReward.items)) {
        currBareLoot.push([
          k.replace('<count_here>', v>1 ? '#'+v : ''),
          currReward.weight
        ])
      }
    }
  }

  const location = 'Items/Lootboxes'

  Patchouli_js(location, {
    icon:	'bq_standard:loot_chest',
    type:	'spotlight_advanced',
    item4: 'bq_standard:loot_chest',
    item3: 'bq_standard:loot_chest:25',
    item2: 'bq_standard:loot_chest:50',
    item1: 'bq_standard:loot_chest:75',
    item0: 'bq_standard:loot_chest:100',
    uneven: true,
    _text: 'Items that drops from different lootboxes',
  })

  for (const [k,v] of Object.entries(bareLoot)) {
    Patchouli_js(location, helpers.paged({
        icon:	'bq_standard:loot_chest',
        type:	'grid',
        title: k
      }, 42, v
    ))
  }

  // ----------------------------------------------------
  // Cyclic
  // ----------------------------------------------------
  Patchouli_js('Items/Magic Bean', 
    helpers.paged({
      title: 'Magic Bean Drops',
      icon:	'cyclicmagic:sprout_seed',
      type:	'grid'
  },
    helpers.config('config/cyclicmagic.cfg').cyclicmagic.blocks.magicbean.MagicBeanDropList
    .map(l=>l.replace(/\*(\d+)$/, ':$1'))
  ))

  // ----------------------------------------------------
  // TCon
  // ----------------------------------------------------
  Patchouli_js('Items/Recycling', [{
    item:	'requious:tinkers_disassembler',
    title: 'Tool recycling',
    _text: `Tools and Armor can be disassembled in $(l)Disassembler/$.
      $(li)The disassembler will try to deliver the strongest material
      $(li)Both of tools should have most or equal harvest level
      $(li)Output amount based on material cost
      $(li)Also sum more math`,
  }])


  // ----------------------------------------------------
  // Mob spawn changes
  // ----------------------------------------------------
  Patchouli_js('Mobs/Spawn Changes', [
    {
      item: `draconicevolution:mob_soul{EntityName:"minecraft:enderman"}`,
      title: "Enderman",
      _text: `When spawn in $(n)Overworld/$, 10% of times carry $(n)Compressed End Stone/$, or $(n)End Ore/$ with lower probabilities.`
    },
    {
      item: `draconicevolution:mob_soul{EntityName:"emberroot:dire_wolf"}`,
      title: "Dire Wolf",
      _text: `Spawns only in the dark.`
    },
    {
      item: `draconicevolution:mob_soul{EntityName:"quark:stoneling"}`,
      title: "Stoneling",
      _text: `Spawns $(n)only on Stone blocks/$ and not more than 3.`
    },
    {
      item: `draconicevolution:mob_soul{EntityName:"rats:rat"}`,
      title: "Rat",
      _text: `Spawns only on $(n)Garbage Piles/$.`
    },
    {
      item: `draconicevolution:mob_soul{EntityName:"endreborn:watcher"}`,
      title: "Watcher",
      _text: `Spawns in Overworld, only on $(n)any Endstone/$.`
    },
    {
      item: `draconicevolution:mob_soul{EntityName:"endreborn:endguard"}`,
      title: "Purpur Guard",
      _text: `Spawns anywhere, but only on $(n)Purpur blocks/$.`
    },
  ])

  Patchouli_js('Mobs/Additional Drop', [
    {
      item: `draconicevolution:mob_soul{EntityName:"emberroot:rootsonespriteboss"}`,
      title: "Guardian of Sprites",
      _text: `Hitting this mob would spawn $(#2af)Supermium Essence/$
        Essence amount depends on damage dealt.`
    }
  ])
}