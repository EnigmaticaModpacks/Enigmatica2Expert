#modloaded rockytweaks
#ignoreBracketErrors

import mods.rockytweaks.Merchant.addTrade;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

recipes.remove(<cyclicmagic:block_shears>);
val pap = <conarm:polishing_kit>.withTag({Material: "paper"});
val E = <minecraft:emerald>;

// function getInjector(potionName as string) as IItemStack {
//   return <thermalinnovation:injector>.withTag({Fluid: {FluidName: "potion", Amount: 2000, Tag: {Potion: potionName}}});
// }

val merchData = {
  "minecraft:farmer": {
    "fisherman": {
      5: [
        [E, <mysticalagriculture:crafting:5> * 4, <mysticalagriculture:crafting:16>],
        [E*64, <botania:manaresource:5>, <botania:overgrowthseed>],
        [E*8, <botania:grassseeds>],
        [<mysticalagriculture:tier1_inferium_seeds> , E],
        [<mysticalagriculture:tier2_inferium_seeds> , E*2],
        [<mysticalagriculture:tier3_inferium_seeds> , E*3],
        [<mysticalagriculture:tier4_inferium_seeds> , E*4],
        [<mysticalagriculture:tier5_inferium_seeds> , E*5],
        [<mysticalagradditions:tier6_inferium_seeds>, E*6],
      ],
    },
    "shepherd": {
      3: [
        [E, <actuallyadditions:item_food:3> * 5],
        [E*6, <harvestcraft:fishtrapbaititem> * 64],
      ],
      4: [
        [E*10, <additionalcompression:meatfish_compressed>],
        [E*2, <thermalfoundation:bait> * 12],
        [E*2, <thermalfoundation:bait:1> * 12],
        [E*6, <iceandfire:fishing_spear>],
        [<harvestcraft:oystercookeditem>, E],
        [<harvestcraft:musselcookeditem>, E],
        [<harvestcraft:turtlecookeditem>, E],
        [<harvestcraft:scallopcookeditem>, E],
        [<harvestcraft:shrimpcookeditem>, E],
        [<harvestcraft:snailcookeditem>, E],
        [<harvestcraft:frogcookeditem>, E],
        [<harvestcraft:crayfishcookeditem>, E],
        [<harvestcraft:clamcookeditem>, E],
      ],
      5: [
        [E*40, <actuallyadditions:block_fishing_net>],
      ],
    },
    "fletcher": {
      3: [
        [E, <animania:wool:0>],
        [E, <animania:wool:1>],
        [E, <animania:wool:2>],
        [E, <animania:wool:3>],
        [E, <animania:wool:4>],
        [E, <animania:wool:5>],
        [E, <animania:wool:6>],
        [<animania:wool:3>, E],
      ],
      4: [
        [E*64, <cyclicmagic:shears_obsidian>],
        [E*20, <cyclicmagic:ender_wool>],
        [E*10, <cyclicmagic:block_shears>],
        [<excompressum:bait:5>, E],
      ],
      5: [
        [E*10, <animania:entity_egg_sheep_random>],
        [E*50, <openblocks:trophy>.withTag({entity_id: "minecraft:sheep"})],
        [E*2, <thermalfoundation:rockwool:7>],
        [<thermalfoundation:rockwool>, E],
      ],
    },
    "farmer": {
      3: [
        [<twilightforest:raven_feather> * 2, E],
        [E*15, <tconstruct:fletching>.withTag({Material: "stymph_feather"})],
      ],
      4: [
        [<iceandfire:stymphalian_bird_feather> * 2, E],
        [E*18, <tconstruct:fletching>.withTag({Material: "amphithere_feather"})],
        [E*24, <tconstruct:fletching>.withTag({Material: "ghostwood"})],
        [E*4, <tconstruct:bow_string>.withTag({Material: "hemp"})],
        [E*10, <tconstruct:bow_string>.withTag({Material: "string_cheese"})],
      ],
      5: [
        [<iceandfire:amphithere_feather> * 2, E],
        [E*30, <tconstruct:bow_string>.withTag({Material: "soularium"})],
        [E*40, <randomthings:ingredient:2> * 2, <tconstruct:bow_string>.withTag({Material: "spectre_string"})],
        [E*64, <thermalfoundation:material:2048> * 20, <tconstruct:arrow_head>.withTag({Material: "gelid_gem"})],
      ],
    },
  },
  "minecraft:librarian": {
    "cartographer": {
      4: [
        [E*4, <chisel:paper> * 64],
        [<chisel:bookshelf_oak>, E],
      ],
      5: [
        [E*10, <mia:packed_paper> * 2],
      ],
      6: [
        [E*10, <minecraft:bookshelf>, <cyclicmagic:block_library>],
        [E*40, <minecraft:bookshelf>, <cyclicmagic:block_library_ctrl>],
      ],
    },
    "librarian": {
      4: [
        [E*6, <forestry:carton>],
        [E*17, <bibliocraft:printingpress>],
        [E*14, <bibliocraft:typesettingtable>],
        [<forestry:carton> * 10, E*3],
      ],
      5: [
        [E*20, <compactmachines3:fieldprojector>],
        [E*4, <cyclicmagic:block_screen>],
      ],
      6: [
        [E*15, <forestry:carton> * 10, <littletiles:recipeadvanced>],
        [E*48, <tinkersaddons:modifier_item>],
      ],
    },
  },
  "minecraft:priest": {
    "cleric": {
      5: [
        [E*48, <tconevo:part_arcane_focus>.withTag({Material: "amber"})],
      ],
      6: [
        [E*48, <tconevo:part_arcane_focus>.withTag({Material: "pulsating_crystal"})],
      ],
      7: [
        [E*64, <thermalfoundation:material:895>, <advancedrocketry:aliensapling>],
      ],
    },
  },
  "minecraft:smith": {
    "weapon": {
      1: [
        [pap * 5, E],
      ],
      5: [
        [<conarm:polishing_kit>.withTag({Material: "magmaslime"}) * 2, E*4],
        [E*15, <nuclearcraft:rad_shielding>],
        [E*8, <conarm:resist_mat_blast>],
        [E*48, <conarm:gauntlet_mat_attack>],
        [E*12, <conarm:travel_potion>],
        [E*12, <conarm:travel_sack>],
        [E*12, <conarm:travel_goggles>],
        [E*12, <conarm:travel_sneak>],
        [E*4, <conarm:frosty_soles>],
        [E*10, pap, <conarm:polishing_kit>.withTag({Material: "bloodwood"})],
        [E*10, pap, <conarm:polishing_kit>.withTag({Material: "chitintandeathworm"})],
      ],
      6: [
        [E*15, <nuclearcraft:rad_shielding>, <nuclearcraft:rad_shielding:1>],
        [E*4, <conarm:travel_potion>],
        [E*22, <conarm:travel_goggles>],
        [E*5, <conarm:travel_sneak>],
        [E*10, pap, <conarm:polishing_kit>.withTag({Material: "emeraldic_crystal"})],
        [E*10, pap, <conarm:polishing_kit>.withTag({Material: "pink_slime"})],
        [E*10, pap, <conarm:polishing_kit>.withTag({Material: "carbon_fiber"})],
        [E*10, pap, <conarm:polishing_kit>.withTag({Material: "fusewood"})],
      ],
      7: [
        [E*15, <nuclearcraft:rad_shielding:1>, <nuclearcraft:rad_shielding:2>],
        [E*50, <conarm:travel_soul>],
        [E*10, pap, <conarm:polishing_kit>.withTag({Material: "flux_crystal"})],
        [E*10, pap, <conarm:polishing_kit>.withTag({Material: "scalebronzeseaserpent"})],
        [E*10, pap, <conarm:polishing_kit>.withTag({Material: "scaledeepblueseaserpent"})],
        [E*10, pap, <conarm:polishing_kit>.withTag({Material: "scaleredseaserpent"})],
        [E*10, pap, <conarm:polishing_kit>.withTag({Material: "scalegreenseaserpent"})],
        [E*10, pap, <conarm:polishing_kit>.withTag({Material: "scalereddragon"})],
      ],
    },
    "tool": {
      4: [
        [E*8, <animania:carving_knife>],
        [E*9, <actuallyadditions:item_knife>],
      ],
      5: [
        [E*17, <actuallyadditions:item_crystal>, <plethora:module:1>],
        [E*16, <tconstruct:throwball:1> * 5],
      ],
      6: [
        [E*43, <ic2:energy_crystal>.withTag({charge: 1000000.0}), <ic2:mining_laser>.withTag({charge: 300000.0})],
      ],
    },
    "armor": {
      4: [
        [E*15, <ic2:forge_hammer>],
        [E*24, <exnihilocreatio:hammer_diamond>],
        [<excompressum:compressed_hammer_diamond>, E*16],
        [<excompressum:double_compressed_diamond_hammer>, E*48],
        [E*23, <tconstruct:tough_tool_rod>.withTag({Material: "ma.prosperity"})],
        [E*13, <tconstruct:tough_tool_rod>.withTag({Material: "amber"})],
        [E*25, <tconstruct:tough_tool_rod>.withTag({Material: "carbon_fiber"})],
      ],
      5: [
        [E*7, <tconstruct:tough_tool_rod>.withTag({Material: "rubber"})],
        [E*12, <tconstruct:tough_tool_rod>.withTag({Material: "apatite"})],
        [E*22, <tconstruct:tough_tool_rod>.withTag({Material: "advanced_alloy"})],
        [E*8, <tconstruct:tough_tool_rod>.withTag({Material: "endstone"})],
        [E*15, <tconstruct:tough_tool_rod>.withTag({Material: "xu_magical_wood"})],
      ],
      6: [
        [E*2, <tconstruct:tough_tool_rod>.withTag({Material: "treatedwood"})],
        [E*17, <tconstruct:tough_tool_rod>.withTag({Material: "ghostwood"})],
        [E*55, <plustic:osmiridiumingot>, <littletiles:hammer>],
        [E*35, <littletiles:saw>],
      ],
      7: [
        [<thaumcraft:banner_red>, <thaumcraft:crimson_blade>, <thaumcraft:banner_crimson_cult>],
      ],
    },
  },
  "minecraft:butcher": {
    "leather": {
      3: [
        [E*3, <animania:raw_prime_rabbit>],
        [E*3, <animania:raw_peacock>],
        [E*3, <animania:raw_horse>],
        [E*3, <animania:raw_chevon>],
        [E*3, <betteranimalsplus:pheasantraw>],
        [E*3, <betteranimalsplus:turkey_leg_raw>],
        [E*3, <betteranimalsplus:eel_meat_raw>],
        [E*3, <betteranimalsplus:turkey_raw>],
        [E*3, <animania:raw_prime_steak>],
        [E*3, <animania:raw_prime_bacon>],
        [<animania:carving_knife>, E*3],
      ],
      4: [
        [E*11, <animania:raw_prime_peacock>],
        [E*11, <animania:raw_prime_beef>],
        [E*11, <animania:raw_prime_pork>],
        [E*11, <animania:raw_prime_chicken>],
        [E*11, <animania:raw_prime_mutton>],
        [E*11, <animania:raw_prime_chevon>],
        [E*11, <harvestcraft:turkeyrawitem>],
        [E*11, <harvestcraft:venisonrawitem>],
        [<actuallyadditions:item_knife>, E*4],
        [<farmingforblockheads:feeding_trough>, E*8],
      ],
      5: [
        [<actuallyadditions:block_feeder>, E*15],
        [<ic2:block_cutting_blade>, E*14],
      ],
      6: [
        [<industrialforegoing:animal_stock_increaser>, E*40],
      ],
      7: [
        [E*24, <mysticalagradditions:stuff:3>],
      ],
    },
    "butcher": {
      3: [
        [E*2, <harvestcraft:hardenedleatheritem>],
        [E*5, <betteranimalsplus:wolf_pelt_snowy>],
        [E*5, <betteranimalsplus:wolf_pelt_timber>],
        [E*5, <betteranimalsplus:wolf_pelt_black>],
        [E*5, <betteranimalsplus:wolf_pelt_arctic>],
        [E*5, <betteranimalsplus:wolf_pelt_brown>],
        [E*5, <betteranimalsplus:wolf_pelt_red>],
      ],
      4: [
        [E*35, <additionalcompression:leather_compressed>],
      ],
      5: [
        [<betteranimalsplus:bear_skin_brown>, E*10],
        [<betteranimalsplus:bear_skin_black>, E*10],
        [<betteranimalsplus:bear_skin_kermode>, E*10],
      ],
      6: [
        [E*12, <iceandfire:troll_leather_forest>],
        [E*12, <iceandfire:troll_leather_frost>],
        [E*12, <iceandfire:troll_leather_mountain>],
      ],
    },
  },
  "openblocks:radio": {
    "audiophile": {
      4: [
        [E*20, <mekanism:mufflingupgrade>],
        [E*40, <supersoundmuffler:sound_muffler>],
        [E*30, <supersoundmuffler:sound_muffler_bauble>],
        [E*2, <randomthings:soundbox>],
        [E*2, <randomthings:sounddampener>],
      ],
      5: [
        [<cyclicmagic:block_soundproofing>, E],
        [E*4, <enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:sounddetector"})],
        [E*30, <computercraft:turtle_expanded>.withTag({rightUpgrade: "computercraft:speaker"})],
      ],
    },
  },
  "actuallyadditions:jamguy": {
    "actuallyadditions.jammer": {
      4: [
        [<harvestcraft:grapejellyitem> * 2, E],
        [<harvestcraft:applejellyitem> * 2, E],
        [<harvestcraft:blackberryjellyitem> * 2, E],
        [<harvestcraft:blueberryjellyitem> * 2, E],
        [<harvestcraft:cherryjellyitem> * 2, E],
        [<harvestcraft:cranberryjellyitem> * 2, E],
        [<harvestcraft:kiwijellyitem> * 2, E],
        [<harvestcraft:lemonjellyitem> * 2, E],
        [<harvestcraft:limejellyitem> * 2, E],
        [<harvestcraft:mangojellyitem> * 2, E],
        [<harvestcraft:orangejellyitem> * 2, E],
        [<harvestcraft:papayajellyitem> * 2, E],
        [<harvestcraft:peachjellyitem> * 2, E],
        [<harvestcraft:pomegranatejellyitem> * 2, E],
        [<harvestcraft:raspberryjellyitem> * 2, E],
        [<harvestcraft:starfruitjellyitem> * 2, E],
        [<harvestcraft:strawberryjellyitem> * 2, E],
        [<harvestcraft:watermelonjellyitem> * 2, E],
        [<harvestcraft:apricotjellyitem> * 2, E],
        [<harvestcraft:figjellyitem> * 2, E],
        [<harvestcraft:grapefruitjellyitem> * 2, E],
        [<harvestcraft:persimmonjellyitem> * 2, E],
        [<harvestcraft:pearjellyitem> * 2, E],
        [<harvestcraft:plumjellyitem> * 2, E],
        [<harvestcraft:pepperjellyitem> * 2, E],
        [<harvestcraft:royaljellyitem> * 2, E],
      ],
    },
  },
  // forestry:apiarist output java.lang.IllegalArgumentException
  // "forestry:apiarist": {
  //   "apiarist": {
  //     5: [
  //       [E*4, <harvestcraft:honeyitem>],
  //       [E*4, <rustic:honeycomb>],
  //       [E*7, <animania:honey_bottle>.withTag({Fluid: {FluidName: "animania_honey", Amount: 1000}})],
  //       [E*1, <rustic:beeswax>*5],
  //       [E*2, <harvestcraft:grubitem>*10],
  //       [<rustic:apiary>, E],
  //     ],
  //     6: [
  //       [E*2, <harvestcraft:honeycombitem>*2],
  //       [E*2, <rustic:bee>],
  //       [<harvestcraft:apiary>, E*5],
  //       [<animania:bee_hive>, E*20],
  //     ],
  //     7: [
  //       [E*4, <biomesoplenty:honey_block>],
  //       [E*4, <harvestcraft:honey>],
  //       [E*4, <harvestcraft:honeycomb>],
  //       [E*6, <harvestcraft:queenbeeitem>],
  //       [E*9, <rustic:beehive>],
  //       [E*9, <harvestcraft:beehive>],
  //       [E*20, <animania:wild_hive>],
  //     ],
  //   },
  //   "arborist": {
  //     5: [
  //       [],
  //     ],
  //   },
  // },
  // "immersiveengineering:engineer": {
  //   "immersiveengineering.engineer": {
  //     4: [
  //       [],
  //     ],
  //   },
  //   "immersiveengineering.machinist": {
  //     6: [
  //       [],
  //     ],
  //   },
  //   "immersiveengineering.electrician": {
  //     5: [
  //       [],
  //     ],
  //   },
  //   "immersiveengineering.outfitter": {
  //     4: [
  //       [],
  //     ],
  //   },
  //   "immersiveengineering.gunsmith": {
  //     6: [
  //       [],
  //     ],
  //   },
  // },
  // "extrautils2:alchemist": {
  //   "alchemist": {
  //     3: [
  //       [E*14, <thermalinnovation:quiver>],
  //       [E*14, <thermalinnovation:injector>],
  //       [E*14, <conarm:travel_potion>],
  //     ],
  //     4: [
  //       [E*10, <thermalinnovation:injector>, getInjector("quark:danger_sight")],
  //       [E*10, <thermalinnovation:injector>, getInjector("quark:haste")],
  //       [E*10, <thermalinnovation:injector>, getInjector("potioncore:slow_fall")],
  //       [E*10, <thermalinnovation:injector>, getInjector("potioncore:revival")],
  //     ],
  //     5: [
  //       [E*20, <thermalinnovation:injector>, getInjector("potioncore:chance")],
  //     ],
  //   },
  // },
  // red_mechanic output java.lang.IllegalArgumentException
  // "extrautils2:red_mechanic": {
  //   "red_mechanic": {
  //     2: [
  //       [E*10, <rftools:wire_block>],
  //       [E*13, <rftools:counter_block>],
  //       [E*15, <rftools:analog_block>],
  //       [E*5, <opencomputers:material:6> * 5],
  //       [E*6, <opencomputers:material:12> * 3],
  //       [E*9, <opencomputers:material:4>],
  //       [<computercraft:computer>, E*8],
  //     ],
  //     3: [
  //       [E*10, <rftools:logic_block>],
  //       [E*12, <rftools:digit_block>],
  //       [E*8, <opencomputers:material:5>],
  //       [E*8, <opencomputers:material:7> * 8],
  //       [<computercraft:computer:16384>, E*12],
  //     ],
  //     4: [
  //       [E*10, <rftools:sequencer_block>],
  //       [E*3, <opencomputers:material:11>],
  //       [E*5, <opencomputers:material:10>],
  //       [E*7, <opencomputers:material:8> * 2],
  //     ],
  //     5: [
  //       [E*10, <rftools:invchecker_block>],
  //       [E*6, <opencomputers:material:9>],
  //       [E*8, <opencomputers:component:6>],
  //     ],
  //   },
  // },
} as IItemStack[][][int][string][string];

for profession, pList in merchData {
  for career, cList in pList {
    for level, lList in cList {
      for items in lList {
        if(items.length<=0 || isNull(items[0]) || isNull(items[1])) continue;
        utils.log(['Adding merchant trade:',
          profession,
          career,
          '[' ~ items[0].displayName ~ ']',
          '[' ~ items[1].displayName ~ ']',
          '[' ~ ((items.length > 2 && !isNull(items[2])) ? items[2].displayName : '') ~ ']',
          level
        ]);
        if(items.length > 2 && !isNull(items[2]))
          addTrade(profession, career, items[0], items[1], items[2], level);
        else if(items.length > 1)
          addTrade(profession, career, items[0], items[1], level);
        else
          logger.logWarning("Merchant trade have not anough items: profession: "~profession~", career: "~career~", level: "~level);
      }
    }
  }
}