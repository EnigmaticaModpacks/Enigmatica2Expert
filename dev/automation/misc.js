/**
 * @file Misc automation of modpack
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

//@ts-check

import replace_in_file from 'replace-in-file'
import { injectInFile, loadText, setBlockDropsList, defaultHelper, loadJson, saveObjAsJson } from '../lib/utils.js'
import del from 'del'

import yargs from 'yargs'
import _ from 'lodash'
const argv = yargs(process.argv.slice(2))
  .alias('k', 'keep-cache').describe('k', 'Not delete cached files')
  .argv


export async function init(h=defaultHelper, options = argv) {

  await h.begin('Replacing Optifine item IDs')
  const debug_log = loadText('logs/debug.log')
  const lootChestID = debug_log.match(/Registry: (\d+) bq_standard:loot_chest bq_standard.items.ItemLootChest/)?.[1]
  let countReplacedIDs = 0
  if(lootChestID) {
    replace_in_file.sync({
      files: 'resourcepacks/bq_lootchests/assets/minecraft/mcpatcher/cit/loot_chest_*.properties',
      from: /(items=)\d+/gm,
      to: '$1'+lootChestID,
      countMatches: true
    })
    .forEach(r=>countReplacedIDs += r.numReplacements??0)
  }

  //###############################################################################
  //###############################################################################
  //###############################################################################

  /*

    Fake iron automatic recipes

    Inspecting all recipes to automatically change some of them  

    Required command before running
    /ct recipes

  */

  await h.begin('Managing Fake iron recipes')
  const crafttweaker_log = loadText('crafttweaker.log')
  const globMatch = crafttweaker_log.match(/^Recipes:$.*/ms)

  const resultArr = []
  if(globMatch) {
    const recipes = globMatch[0]
    const whitelist = [
      '<extrautils2:opinium>',
      '<extrautils2:opinium:1>',
      '<immersiveengineering:drillhead:1>',
      '<excompressum:auto_compressor>',
      '<integrateddynamics:squeezer>',
      '<ic2:crafting:18>',
      '<extrautils2:spike_iron>',
      '<valkyrielib:modifier_component>',
      '<environmentaltech:lightning_rod>',
      '<environmentaltech:lightning_cont_6>',
      '<environmentaltech:lightning_cont_5>',
      '<environmentaltech:lightning_cont_4>',
      '<environmentaltech:lightning_cont_3>',
      '<environmentaltech:lightning_cont_2>',
      '<environmentaltech:lightning_cont_1>',
      '<extendedcrafting:table_basic>',
      '<rustic:condenser_advanced>',
      '<draconicevolution:crafting_injector>',
      '<cyclicmagic:fluid_drain>',
    ]

    // Add already exist remakes
    const fakeIron_zs = loadText('scripts/category/fakeIron.zs')
    const remakes = fakeIron_zs.match(/^# Start of automatically generated recipes:$.*/ms)[0]
    for (const match of remakes.matchAll(/^remakeShape.{1,4}\("[^"]+", (?<output><[^>]+>).*$/gm)) {
      if(whitelist.includes(match.groups.output))
        resultArr.push(match[0])
    }

    // Add new
    for (const match of recipes.matchAll(/^(?<function>recipes\.addShape(?<postfix>d|less))\((?<name>".*?") *, *(?<output>[^, ]*?)(?<count> \* \d+)?, (?<grid>.*)\);$/gm)) {
      const g = match.groups

      const regex = /<(minecraft:iron_|ore:)(ingot|block|nugget)(?:Iron)?>/gi
      if(
        !whitelist.includes(g.output) ||
        !g.grid.match(new RegExp('.*' + regex.source + '.*'))
      ) continue

      const replacedGrid = g.grid.replaceAll(regex, (...args) => args[2].substring(0,1).toUpperCase())
      const line = `remakeShape${g.postfix}(${g.name}, ${g.output}${g.count??''}, ${replacedGrid});`
      resultArr.push(line)
    }


    injectInFile('scripts/category/fakeIron.zs', 
      '# Start of automatically generated recipes:\n',
      '\n# End of automatically generated recipes',
      resultArr.sort().join('\n')
    )
  } else {
    h.warn('No /ct recipes found in crafttweaker.log')
  }

  //###############################################################################
  //###############################################################################
  //###############################################################################

  let countCachedRemoved
  if(!options['keep-cache']) {
    await h.begin('Removing cached files')
    countCachedRemoved = del.sync([
      'config/thaumicjei_itemstack_aspects.json',
      'config/thaumicspeedup/cache.lock',
      'config/tinker_ore_dict_melting_cache.dat',
    ], {dryRun: false}).length
  }

  //###############################################################################
  //###############################################################################
  //###############################################################################

  /*

    Manually handle blockdrops.txt

  */
  await h.begin('Handling blockdrops.txt')
  // Remove noisy urns
  setBlockDropsList([
    {block_stack: 'thaumcraft:loot_crate_common',   dropList: undefined},
    {block_stack: 'thaumcraft:loot_urn_common',     dropList: undefined},
    {block_stack: 'thaumcraft:loot_crate_uncommon', dropList: undefined},
    {block_stack: 'thaumcraft:loot_urn_uncommon',   dropList: undefined},
    {block_stack: 'thaumcraft:loot_crate_rare',     dropList: undefined},
    {block_stack: 'thaumcraft:loot_urn_rare',       dropList: undefined},
    
    {block_stack: 'minecraft:mob_spawner',          dropList: [
      {stack:'enderio:item_broken_spawner'},
      {stack:'actuallyadditions:item_misc:20', luck: [1,3]},
    ]}
  ])

  //###############################################################################
  //###############################################################################
  //###############################################################################

  /*

    Heavy Sieve automatically recipes

  */
  await h.begin('Heavy Sieve automatically recipes')
  const blocksToCopy = [
    ['exnihilocreatio:block_andesite_crushed', 'contenttweaker:compressed_crushed_andesite'],
    ['exnihilocreatio:block_diorite_crushed' , 'contenttweaker:compressed_crushed_diorite'],
    ['exnihilocreatio:block_granite_crushed' , 'contenttweaker:compressed_crushed_granite'],
    ['exnihilocreatio:block_skystone_crushed', 'contenttweaker:compressed_crushed_skystone'],
    ['enderio:block_infinity', 'enderio:block_infinity:1'],
    ['additionalcompression:dustgunpowder_compressed', 'additionalcompression:dustgunpowder_compressed:1'],
  ]
  const sieveRegistry = loadJson('config/exnihilocreatio/SieveRegistry.json')
  const heavySievePath = 'config/ExCompressum/HeavySieve.json'
  const heavySieve = loadJson(heavySievePath)
  blocksToCopy.forEach(([normal, compressed]) => {
    const normEntry = sieveRegistry[normal] ?? sieveRegistry[normal+':0']
    if(!normEntry) {
      h.warn('Cant add Heavy Sieve recipe: Cant find normal entry: '+ normal)
      return;
    }
    const entries = heavySieve.custom.entries
    const [source, id, _meta] = compressed.split(':')
    const shortand = source+':'+id
    const meta = parseInt(_meta || '0')
    const index = entries.findIndex(o=>o.name == shortand && o.metadata == meta)
    const found = entries[index]

    const entry = {...(found ?? {}), ...{
      name: shortand,
      metadata: meta,
      type: "list",
      rewards: normEntry.map(o=>({
        meshLevel: o.meshLevel,
        name: o.drop.name,
        metadata: o.drop.meta,
        tag: o.drop.tag,
        count: 1,
        luck: 0.0,
        chance: o.chance,
        rolls: 1,
      }))
    }}

    if(index != -1) entries[index] = entry
    else entries.push(entry)
  })
  saveObjAsJson(heavySieve, heavySievePath)

  //###############################################################################
  //###############################################################################
  //###############################################################################
  h.result(`Replaced Optifine: ${countReplacedIDs}, Saved fakeIron recipes: ${resultArr.length}` + (countCachedRemoved ? `, Removed cached: ${countCachedRemoved}` : ''))
}

// @ts-ignore
if(import.meta.url === (await import('url')).pathToFileURL(process.argv[1]).href) init()