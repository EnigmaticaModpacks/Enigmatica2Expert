# ######################################################################
#
# This file automatically generated from equipmentParse.js
#
# ######################################################################

import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;

#priority 10

static armorStaged as IData[string] = 
{
  armor_leather:{
    tier: 0,
    material: "minecraft:leather",
    recycle:  "minecraft:leather",
    recipe: {manual: true},
    list: [
      {id:"minecraft:leather_helmet"},
      {id:"minecraft:leather_chestplate"},
      {id:"minecraft:leather_leggings"},
      {id:"minecraft:leather_boots"},
      {id:"minecraft:stick"},
      {id:"minecraft:sign"}
  ]},
  armor_end_steel:{
    prev: "armor_dark_steel", 
    tier: 8,
    material: "ore:ingotEndSteel",
    recycle:  "ore:ingotEndSteel",
    recipe: {extra: "enderio:item_material:56"},
    list: [
      {id:"enderio:item_end_steel_helmet"},
      {id:"enderio:item_end_steel_chestplate"},
      {id:"enderio:item_end_steel_leggings"},
      {id:"enderio:item_end_steel_boots"},
      {id:"enderio:item_end_steel_sword"},
      {id:"enderio:item_end_steel_shield"}
  ]},
  armor_manaweave:{
    prev: "armor_leather", 
    tier: 1,
    material: "ore:clothManaweave",
    recycle:  "botania:manaresource:16",
    list: [
      {id:"botania:manaweavehelm"},
      {id:"botania:manaweavechest"},
      {id:"botania:manaweavelegs"},
      {id:"botania:manaweaveboots"},
      {id:"botania:manaresource"},
      {id:"botania:grassseeds"}
  ]},
  armor_manasteel:{
    prev: "armor_manaweave", 
    tier: 2,
    material: "ore:ingotManasteel",
    recycle:  "ore:ingotManasteel",
    list: [
      {id:"botania:manasteelhelm"},
      {id:"botania:manasteelchest"},
      {id:"botania:manasteellegs"},
      {id:"botania:manasteelboots"},
      {id:"tconstruct:broadsword", tag:{StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 4.5 as float, FreeModifiers: 3, Durability: 272, HarvestLevel: 4, Attack: 4.75 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 4.5 as float, FreeModifiers: 2, Durability: 272, HarvestLevel: 4, Attack: 4.75 as float}, Special: {Categories: ["tool", "weapon"]}, TinkerData: {Materials: ["manasteel", "manasteel", "manasteel"], Modifiers: ["toolleveling"]}, Modifiers: [{identifier: "momentum", color: -15764755, level: 1}, {identifier: "tconevo.mana_infused", color: -15764755, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}], Traits: ["momentum", "tconevo.mana_infused", "toolleveling"]}},
      {id:"botania:manaresource:3"}
  ]},
  armor_elementium:{
    prev: "armor_psimetal", 
    tier: 4,
    material: "ore:ingotElvenElementium",
    recycle:  "ore:ingotElvenElementium",
    list: [
      {id:"botania:elementiumhelm"},
      {id:"botania:elementiumchest"},
      {id:"botania:elementiumlegs"},
      {id:"botania:elementiumboots"},
      {id:"botania:elementiumsword"},
      {id:"botania:tinypotato"}
  ]},
  armor_terrasteel:{
    prev: "armor_elementium", 
    tier: 5,
    material: "ore:ingotTerrasteel",
    recycle:  "ore:ingotTerrasteel",
    recipe: {manual: true},
    list: [
      {id:"botania:terrasteelhelm"},
      {id:"botania:terrasteelchest"},
      {id:"botania:terrasteellegs"},
      {id:"botania:terrasteelboots"},
      {id:"botania:terrasword"},
      {id:"botania:terrapick"}
  ]},
  armor_living_armour:{
    prev: "armor_manasteel", 
    tier: 3,
    material: "bloodmagic:component:8",
    recycle:  "bloodmagic:component:8",
    recipe: {manual: true},
    list: [
      {id:"bloodmagic:living_armour_helmet"},
      {id:"bloodmagic:living_armour_chest"},
      {id:"bloodmagic:living_armour_leggings"},
      {id:"bloodmagic:living_armour_boots"},
      {id:"animus:kama_bound"},
      {id:"animus:bloodapple"}
  ]},
  armor_thaumium:{
    prev: "armor_leather", 
    tier: 3,
    material: "ore:ingotThaumium",
    recycle:  "ore:ingotThaumium",
    list: [
      {id:"thaumcraft:thaumium_helm"},
      {id:"thaumcraft:thaumium_chest"},
      {id:"thaumcraft:thaumium_legs"},
      {id:"thaumcraft:thaumium_boots"},
      {id:"thaumcraft:thaumium_sword"},
      {id:"thaumcraft:nitor_purple"}
  ]},
  armor_thaumium_fortress:{
    prev: "armor_thaumium", 
    tier: 4,
    material: "ore:ingotThaumium",
    recycle:  "ore:ingotThaumium",
    recipe: {manual: true},
    list: [
      {id:"thaumcraft:fortress_helm"},
      {id:"thaumcraft:fortress_chest"},
      {id:"thaumcraft:fortress_legs"},
      {id:"thaumcraft:thaumium_boots"},
      {id:"thaumcraft:thaumium_sword"},
      {id:"thaumcraft:alumentum"}
  ]},
  armor_void:{
    prev: "armor_thaumium", 
    tier: 5,
    material: "ore:ingotVoid",
    recycle:  "ore:ingotVoid",
    list: [
      {id:"thaumcraft:void_helm"},
      {id:"thaumcraft:void_chest"},
      {id:"thaumcraft:void_legs"},
      {id:"thaumcraft:void_boots"},
      {id:"thaumcraft:void_sword"},
      {id:"thaumcraft:bottle_taint"}
  ]},
  armor_void_robe:{
    prev: "armor_void", 
    tier: 6,
    material: "thaumcraft:void_seed",
    recycle:  "thaumcraft:void_seed",
    recipe: {manual: true},
    list: [
      {id:"thaumcraft:void_robe_helm"},
      {id:"thaumcraft:void_robe_chest"},
      {id:"thaumcraft:void_robe_legs"},
      {id:"thaumicaugmentation:void_boots"},
      {id:"thaumcraft:crimson_blade"},
      {id:"thaumcraft:caster_basic"}
  ]},
  armor_space_suit:{
    prev: "armor_leather", 
    tier: 2,
    material: "libvulpes:productsheet:6",
    recycle:  "libvulpes:productsheet:6",
    recipe: {manual: true},
    list: [
      {id:"advancedrocketry:spacehelmet"},
      {id:"advancedrocketry:spacechestplate"},
      {id:"advancedrocketry:spaceleggings"},
      {id:"advancedrocketry:spaceboots"},
      {id:"advancedrocketry:basiclasergun"},
      {id:"advancedrocketry:misc:1"}
  ]},
  armor_hazmat:{
    prev: "armor_leather", 
    tier: 2,
    material: "ic2:crafting",
    recycle:  "ic2:crafting",
    recipe: {manual: true},
    list: [
      {id:"ic2:hazmat_helmet"},
      {id:"ic2:hazmat_chestplate"},
      {id:"ic2:hazmat_leggings"},
      {id:"ic2:rubber_boots"},
      {id:"ic2:wrench_new"},
      {id:"ic2:tool_box"}
  ]},
  armor_nc_hazmat:{
    prev: "armor_leather", 
    tier: 3,
    material: "nuclearcraft:part",
    recycle:  "nuclearcraft:part",
    recipe: {manual: true},
    list: [
      {id:"nuclearcraft:helm_hazmat"},
      {id:"nuclearcraft:chest_hazmat"},
      {id:"nuclearcraft:legs_hazmat"},
      {id:"nuclearcraft:boots_hazmat"},
      {id:"nuclearcraft:multitool"},
      {id:"nuclearcraft:rad_x"}
  ]},
  armor_hev:{
    prev: "armor_leather", 
    tier: 5,
    material: "nuclearcraft:rad_shielding:2",
    recycle:  "nuclearcraft:rad_shielding:2",
    recipe: {manual: true},
    list: [
      {id:"qmd:helm_hev", tag:{energyStorage: {energy: 1000000 as long, capacity: 1000000 as long}}},
      {id:"qmd:chest_hev", tag:{energyStorage: {energy: 1000000 as long, capacity: 1000000 as long}}},
      {id:"qmd:legs_hev", tag:{energyStorage: {energy: 1000000 as long, capacity: 1000000 as long}}},
      {id:"qmd:boots_hev", tag:{energyStorage: {energy: 1000000 as long, capacity: 1000000 as long}}},
      {id:"qmd:lepton_cannon"},
      {id:"qmd:potassium_iodine_tablet"}
  ]},
  armor_nano:{
    prev: "armor_leather", 
    tier: 5,
    material: "ic2:crafting:15",
    recycle:  "ic2:crafting:15",
    recipe: {manual: true},
    list: [
      {id:"ic2:nano_helmet", tag:{charge:1000000}},
      {id:"ic2:nano_chestplate", tag:{charge:1000000}},
      {id:"ic2:nano_leggings", tag:{charge:1000000}},
      {id:"ic2:nano_boots", tag:{charge:1000000}},
      {id:"ic2:nano_saber", tag:{charge:160000}},
      {id:"ic2:cutter"}
  ]},
  armor_flux:{
    prev: "armor_nano", 
    tier: 6,
    material: "redstonearsenal:material:224",
    recycle:  "redstonearsenal:material:32",
    list: [
      {id:"redstonearsenal:armor.helmet_flux", tag:{Energy:800000}},
      {id:"redstonearsenal:armor.plate_flux", tag:{Energy:800000}},
      {id:"redstonearsenal:armor.legs_flux", tag:{Energy:800000}},
      {id:"redstonearsenal:armor.boots_flux", tag:{Energy:800000}},
      {id:"redstonearsenal:tool.sword_flux", tag:{Energy:320000}},
      {id:"redstonearsenal:tool.shield_flux", tag:{Energy:320000}}
  ]},
  armor_quantum:{
    prev: "armor_flux", 
    tier: 7,
    material: "ic2:misc_resource:2",
    recycle:  "ic2:misc_resource:2",
    recipe: {manual: true},
    list: [
      {id:"ic2:quantum_helmet", tag:{charge:10000000}},
      {id:"ic2:quantum_chestplate", tag:{charge:10000000}},
      {id:"ic2:quantum_leggings", tag:{charge:10000000}},
      {id:"ic2:quantum_boots", tag:{charge:10000000}},
      {id:"tconstruct:broadsword", tag:{StatsOriginal:{AttackSpeedMultiplier:1,MiningSpeed:6,FreeModifiers:3,Durability:711,HarvestLevel:10,Attack:6.8},Stats:{AttackSpeedMultiplier:1,MiningSpeed:6.1609993,FreeModifiers:2,Durability:733,HarvestLevel:10,Attack:6.915003},Special:{Categories:["tool","weapon"],alienStatBonus:{identifier:"",color:0,attack:0.11500002,durability:22,speed:0.161},alienStatPool:{identifier:"",color:16777215,attack:1.314999,durability:265,speed:1.9039981}},TinkerData:{Materials:["iridium","iridium","iridium"],Modifiers:["toolleveling"]},Modifiers:[{identifier:"dense",color:-5592406,level:1},{identifier:"alien",color:-5592406,level:1},{identifier:"toolleveling",color:16777215,level:1}],Traits:["dense","alien","toolleveling"]}},
      {id:"ic2:chainsaw", tag:{charge:30000.0}}
  ]},
  armor_arctic:{
    prev: "armor_leather", 
    tier: 6,
    material: "ore:furArctic",
    recycle:  "ore:furArctic",
    list: [
      {id:"twilightforest:arctic_helmet"},
      {id:"twilightforest:arctic_chestplate"},
      {id:"twilightforest:arctic_leggings"},
      {id:"twilightforest:arctic_boots"},
      {id:"twilightforest:ice_sword"},
      {id:"thermalfoundation:tool.shield_diamond"}
  ]},
  armor_ironwood:{
    prev: "armor_leather", 
    tier: 3,
    material: "ore:ingotIronwood",
    recycle:  "ore:ingotIronwood",
    list: [
      {id:"twilightforest:ironwood_helmet"},
      {id:"twilightforest:ironwood_chestplate"},
      {id:"twilightforest:ironwood_leggings"},
      {id:"twilightforest:ironwood_boots"},
      {id:"twilightforest:ironwood_sword", tag:{ench:[{lvl:1,id:19}]}},
      {id:"twilightforest:ironwood_axe"}
  ]},
  armor_yeti:{
    prev: "armor_leather", 
    tier: 7,
    material: "twilightforest:alpha_fur",
    recycle:  "twilightforest:alpha_fur",
    list: [
      {id:"twilightforest:yeti_helmet"},
      {id:"twilightforest:yeti_chestplate"},
      {id:"twilightforest:yeti_leggings"},
      {id:"twilightforest:yeti_boots"},
      {id:"cyclicmagic:sword_slowness"},
      {id:"tconstruct:battlesign", tag:{StatsOriginal: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 2.0 as float, FreeModifiers: 3, Durability: 130, HarvestLevel: 1, Attack: 1.0 as float}, Stats: {AttackSpeedMultiplier: 1.0 as float, MiningSpeed: 2.0 as float, FreeModifiers: 2, Durability: 130, HarvestLevel: 1, Attack: 1.0 as float}, Special: {Categories: ["tool", "weapon"]}, TinkerData: {Materials: ["alpha_fur", "alpha_fur"], Modifiers: ["toolleveling"]}, Modifiers: [{identifier: "alpha_fur", color: -14575885, level: 1}, {identifier: "ecological", color: -14575885, level: 1}, {identifier: "toolleveling", color: 16777215, level: 1}], Traits: ["alpha_fur", "ecological", "toolleveling"]}}
  ]},
  armor_dark_steel:{
    prev: "armor_leather", 
    tier: 7,
    material: "ore:ingotDarkSteel",
    recycle:  "ore:ingotDarkSteel",
    recipe: {extra: "ore:itemPulsatingCrystal"},
    list: [
      {id:"enderio:item_dark_steel_helmet"},
      {id:"enderio:item_dark_steel_chestplate"},
      {id:"enderio:item_dark_steel_leggings"},
      {id:"enderio:item_dark_steel_boots"},
      {id:"enderio:item_dark_steel_sword"},
      {id:"enderio:item_dark_steel_shield"}
  ]},
  armor_psimetal:{
    prev: "armor_manasteel", 
    tier: 3,
    material: "ore:ingotPsi",
    recycle:  "psi:material:1",
    recipe: {extra: "ore:gemPsi"},
    list: [
      {id:"psi:psimetal_exosuit_helmet"},
      {id:"psi:psimetal_exosuit_chestplate"},
      {id:"psi:psimetal_exosuit_leggings"},
      {id:"psi:psimetal_exosuit_boots"},
      {id:"psi:psimetal_sword"},
      {id:"psicosts:psi_cell:2", tag: {PsioCharge: 720000}}
  ]},
  armor_dragon:{
    prev: "armor_ironwood", 
    tier: 5,
    material: "endreborn:dragon_scales",
    recycle:  "endreborn:dragon_scales",
    recipe: {extra: "endreborn:item_ender_string"},
    list: [
      {id:"endreborn:armour_helmet_dragon"},
      {id:"endreborn:armour_chestplate_dragon"},
      {id:"endreborn:armour_leggings_dragon"},
      {id:"endreborn:armour_boots_dragon"},
      {id:"endreborn:tool_magnifier"},
      {id:"endreborn:death_essence"}
  ]},
  armor_stellar:{
    prev: "armor_end_steel", 
    tier: 9,
    material: "ore:ingotStellarAlloy",
    recycle:  "enderio:item_alloy_endergy_ingot:3",
    recipe: {extra: "ore:skullSentientEnder"},
    list: [
      {id:"enderio:item_stellar_alloy_helmet"},
      {id:"enderio:item_stellar_alloy_chestplate"},
      {id:"enderio:item_stellar_alloy_leggings"},
      {id:"enderio:item_stellar_alloy_boots"},
      {id:"enderio:item_stellar_alloy_sword"},
      {id:"enderio:item_stellar_alloy_axe"}
  ]},
  armor_glitch_infused:{
    prev: "armor_end_steel", 
    tier: 9,
    material: "deepmoblearning:glitch_infused_ingot",
    recycle:  "deepmoblearning:glitch_infused_ingot",
    list: [
      {id:"deepmoblearning:glitch_infused_helmet"},
      {id:"deepmoblearning:glitch_infused_chestplate"},
      {id:"deepmoblearning:glitch_infused_leggings"},
      {id:"deepmoblearning:glitch_infused_boots"},
      {id:"deepmoblearning:glitch_infused_sword"},
      {id:"deepmoblearning:pristine_matter_dragon"}
  ]},
  armor_wyvern:{
    prev: ["armor_terrasteel", "armor_living_armour", "armor_void_robe", "armor_quantum", "armor_arctic", "armor_yeti", "armor_glitch_infused"],
    tier: 11,
    material: "draconicevolution:wyvern_core",
    recycle:  "draconicevolution:wyvern_core",
    recipe: {manual: true, noFoundry: true},
    list: [
      {id:"draconicevolution:wyvern_helm", tag:{Energy:2000000}},
      {id:"draconicevolution:wyvern_chest", tag:{Energy:2000000}},
      {id:"draconicevolution:wyvern_legs", tag:{Energy:2000000}},
      {id:"draconicevolution:wyvern_boots", tag:{Energy:2000000}},
      {id:"draconicevolution:wyvern_sword", tag:{Energy:2000000}},
      {id:"draconicevolution:draconium_block:1"}
  ]},
  armor_draconic:{
    prev: "armor_wyvern", 
    tier: 12,
    material: "draconicevolution:awakened_core",
    recycle:  "draconicevolution:awakened_core",
    recipe: {manual: true, noFoundry: true},
    list: [
      {id:"draconicevolution:draconic_helm", tag:{Energy:16000000}},
      {id:"draconicevolution:draconic_chest", tag:{Energy:16000000}},
      {id:"draconicevolution:draconic_legs", tag:{Energy:16000000}},
      {id:"draconicevolution:draconic_boots", tag:{Energy:16000000}},
      {id:"draconicevolution:draconic_sword", tag:{Energy:16000000}},
      {id:"draconicevolution:draconium_block"}
  ]}
} as IData[string];