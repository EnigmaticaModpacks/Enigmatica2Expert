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
  armor_hazmat:{
    prev: "armor_golden", 
    tier: 4,
    list: [
      {id:"ic2:hazmat_helmet"},
      {id:"ic2:hazmat_chestplate"},
      {id:"ic2:hazmat_leggings"},
      {id:"ic2:rubber_boots"},
      {id:"ic2:wrench_new"},
      {id:"thermalfoundation:tool.shield_copper"}
  ]},
  armor_knightslime:{
    prev: "armor_golden", 
    tier: 4,
    list: [
      {id:"tcomplement:knightslime_helmet"},
      {id:"tcomplement:knightslime_chestplate"},
      {id:"tcomplement:knightslime_leggings"},
      {id:"tcomplement:knightslime_boots"},
      {id:"tconstruct:broadsword", tag:{StatsOriginal:{AttackSpeedMultiplier:1,MiningSpeed:5.8,FreeModifiers:3,Durability:1086,HarvestLevel:6,Attack:6.1},Stats:{AttackSpeedMultiplier:1,MiningSpeed:5.8,FreeModifiers:2,Durability:1086,HarvestLevel:6,Attack:6.1},Special:{Categories:["tool","weapon"]},TinkerData:{Materials:["knightslime","knightslime","knightslime"],Modifiers:["toolleveling"]},Modifiers:[{identifier:"unnatural",color:-946192,level:1},{identifier:"crumbling",color:-946192,level:1},{identifier:"toolleveling",color:16777215,level:1}],Traits:["unnatural","crumbling","toolleveling"]}},
      {id:"spartanshields:shield_basic_lead"}
  ]},
  armor_faraday:{
    prev: "armor_iron", 
    tier: 3,
    list: [
      {id:"immersiveengineering:faraday_suit_head"},
      {id:"immersiveengineering:faraday_suit_chest"},
      {id:"immersiveengineering:faraday_suit_legs"},
      {id:"immersiveengineering:faraday_suit_feet"},
      {id:"thermalfoundation:tool.sword_aluminum"},
      {id:"spartanshields:shield_tower_iron"}
  ]},
  armor_hardenedleather:{
    prev: null, 
    tier: 1,
    list: [
      {id:"harvestcraft:hardenedleatherhelmitem"},
      {id:"harvestcraft:hardenedleatherchestitem"},
      {id:"harvestcraft:hardenedleatherleggingsitem"},
      {id:"harvestcraft:hardenedleatherbootsitem"},
      {id:"actuallyadditions:item_knife"},
      {id:"spartanshields:shield_basic_wood"}
  ]},
  armor_iron:{
    prev: "armor_hardenedleather", 
    tier: 2,
    list: [
      {id:"minecraft:iron_helmet"},
      {id:"minecraft:iron_chestplate"},
      {id:"minecraft:iron_leggings"},
      {id:"minecraft:iron_boots"},
      {id:"tconstruct:broadsword", tag:{StatsOriginal:{AttackSpeedMultiplier:1,MiningSpeed:6,FreeModifiers:3,Durability:303,HarvestLevel:3,Attack:5},Stats:{AttackSpeedMultiplier:1,MiningSpeed:6,FreeModifiers:2,Durability:303,HarvestLevel:3,Attack:5},Special:{Categories:["tool","weapon"]},TinkerData:{Materials:["iron","iron","iron"],Modifiers:["toolleveling"]},Modifiers:[{identifier:"magnetic",color:-3487030,level:3,magnetic1:1,magnetic2:1},{identifier:"toolleveling",color:16777215,level:1}],Traits:["magnetic1","magnetic2","toolleveling"]}},
      {id:"spartanshields:shield_basic_iron"}
  ]},
  armor_golden:{
    prev: "armor_iron", 
    tier: 3,
    list: [
      {id:"minecraft:golden_helmet"},
      {id:"minecraft:golden_chestplate"},
      {id:"minecraft:golden_leggings"},
      {id:"minecraft:golden_boots"},
      {id:"thermalfoundation:tool.sword_bronze"},
      {id:"spartanshields:shield_basic_gold"}
  ]},
  armor_diamond:{
    prev: "armor_knightslime", 
    tier: 5,
    list: [
      {id:"minecraft:diamond_helmet"},
      {id:"minecraft:diamond_chestplate"},
      {id:"minecraft:diamond_leggings"},
      {id:"minecraft:diamond_boots"},
      {id:"animus:kama_diamond"},
      {id:"spartanshields:shield_basic_diamond"}
  ]},
  armor_manyullyn:{
    prev: "armor_diamond", 
    tier: 6,
    list: [
      {id:"tcomplement:manyullyn_helmet"},
      {id:"tcomplement:manyullyn_chestplate"},
      {id:"tcomplement:manyullyn_leggings"},
      {id:"tcomplement:manyullyn_boots"},
      {id:"tconstruct:cleaver", tag:{StatsOriginal:{AttackSpeedMultiplier:1,MiningSpeed:7.02,FreeModifiers:3,Durability:1370,HarvestLevel:8,Attack:14.3359995},Stats:{AttackSpeedMultiplier:1,MiningSpeed:7.02,FreeModifiers:2,Durability:1370,HarvestLevel:8,Attack:14.3359995},Special:{Categories:["tool","weapon"]},TinkerData:{Materials:["manyullyn","manyullyn","manyullyn","manyullyn"],Modifiers:["beheading_cleaver","toolleveling"]},Modifiers:[{identifier:"coldblooded",color:-6202120,level:1},{identifier:"insatiable",color:-6202120,level:1},{identifier:"beheading_cleaver",color:1070923,level:2},{identifier:"toolleveling",color:16777215,level:1}],Traits:["coldblooded","insatiable","toolleveling"]}},
      {id:"spartanshields:shield_tower_diamond"}
  ]},
  armor_end_steel:{
    prev: "armor_dark_steel", 
    tier: 8,
    list: [
      {id:"enderio:item_end_steel_helmet"},
      {id:"enderio:item_end_steel_chestplate"},
      {id:"enderio:item_end_steel_leggings"},
      {id:"enderio:item_end_steel_boots"},
      {id:"enderio:item_end_steel_sword"},
      {id:"spartanshields:shield_riot_rftools", tag:{Energy:1000000}}
  ]},
  armor_inferium:{
    prev: "armor_diamond", 
    tier: 6,
    list: [
      {id:"mysticalagriculture:inferium_helmet"},
      {id:"mysticalagriculture:inferium_chestplate"},
      {id:"mysticalagriculture:inferium_leggings"},
      {id:"mysticalagriculture:inferium_boots"},
      {id:"mysticalagriculture:inferium_sword"},
      {id:"thermalfoundation:tool.shield_gold"}
  ]},
  armor_prudentium:{
    prev: "armor_inferium", 
    tier: 7,
    list: [
      {id:"mysticalagriculture:prudentium_helmet"},
      {id:"mysticalagriculture:prudentium_chestplate"},
      {id:"mysticalagriculture:prudentium_leggings"},
      {id:"mysticalagriculture:prudentium_boots"},
      {id:"mysticalagriculture:prudentium_sword"},
      {id:"thermalfoundation:tool.shield_silver"}
  ]},
  armor_intermedium:{
    prev: "armor_prudentium", 
    tier: 8,
    list: [
      {id:"mysticalagriculture:intermedium_helmet"},
      {id:"mysticalagriculture:intermedium_chestplate"},
      {id:"mysticalagriculture:intermedium_leggings"},
      {id:"mysticalagriculture:intermedium_boots"},
      {id:"mysticalagriculture:intermedium_sword"},
      {id:"thermalfoundation:tool.shield_constantan"}
  ]},
  armor_superium:{
    prev: "armor_intermedium", 
    tier: 9,
    list: [
      {id:"mysticalagriculture:superium_helmet"},
      {id:"mysticalagriculture:superium_chestplate"},
      {id:"mysticalagriculture:superium_leggings"},
      {id:"mysticalagriculture:superium_boots"},
      {id:"mysticalagriculture:superium_sword"},
      {id:"thermalfoundation:tool.shield_invar"}
  ]},
  armor_supremium:{
    prev: "armor_superium", 
    tier: 10,
    list: [
      {id:"mysticalagriculture:supremium_helmet", tag:{}},
      {id:"mysticalagriculture:supremium_chestplate", tag:{}},
      {id:"mysticalagriculture:supremium_leggings", tag:{}},
      {id:"mysticalagriculture:supremium_boots", tag:{}},
      {id:"mysticalagriculture:supremium_sword"},
      {id:"thermalfoundation:tool.shield_diamond"}
  ]},
  armor_manaweave:{
    prev: null, 
    tier: 1,
    list: [
      {id:"botania:manaweavehelm"},
      {id:"botania:manaweavechest"},
      {id:"botania:manaweavelegs"},
      {id:"botania:manaweaveboots"},
      {id:"botania:manaresource"},
      {id:"spartanshields:shield_basic_stone"}
  ]},
  armor_manasteel:{
    prev: "armor_manaweave", 
    tier: 2,
    list: [
      {id:"botania:manasteelhelm"},
      {id:"botania:manasteelchest"},
      {id:"botania:manasteellegs"},
      {id:"botania:manasteelboots"},
      {id:"botania:manasteelsword"},
      {id:"spartanshields:shield_botania_manasteel"}
  ]},
  armor_elementium:{
    prev: "armor_psimetal", 
    tier: 4,
    list: [
      {id:"botania:elementiumhelm"},
      {id:"botania:elementiumchest"},
      {id:"botania:elementiumlegs"},
      {id:"botania:elementiumboots"},
      {id:"botania:elementiumsword"},
      {id:"spartanshields:shield_botania_elementium"}
  ]},
  armor_terrasteel:{
    prev: "armor_elementium", 
    tier: 5,
    list: [
      {id:"botania:terrasteelhelm"},
      {id:"botania:terrasteelchest"},
      {id:"botania:terrasteellegs"},
      {id:"botania:terrasteelboots"},
      {id:"botania:terrasword"},
      {id:"spartanshields:shield_botania_terrasteel"}
  ]},
  armor_living_armour:{
    prev: "armor_manasteel", 
    tier: 3,
    list: [
      {id:"bloodmagic:living_armour_helmet"},
      {id:"bloodmagic:living_armour_chest", tag:{}},
      {id:"bloodmagic:living_armour_leggings"},
      {id:"bloodmagic:living_armour_boots"},
      {id:"animus:kama_bound"},
      {id:"spartanshields:shield_abyssalcraft_dreadium"}
  ]},
  armor_thaumium:{
    prev: "armor_manasteel", 
    tier: 3,
    list: [
      {id:"thaumcraft:thaumium_helm"},
      {id:"thaumcraft:thaumium_chest"},
      {id:"thaumcraft:thaumium_legs"},
      {id:"thaumcraft:thaumium_boots"},
      {id:"thaumcraft:thaumium_sword"},
      {id:"spartanshields:shield_basic_obsidian"}
  ]},
  armor_void:{
    prev: "armor_thaumium", 
    tier: 4,
    list: [
      {id:"thaumcraft:void_helm"},
      {id:"thaumcraft:void_chest"},
      {id:"thaumcraft:void_legs"},
      {id:"thaumcraft:void_boots"},
      {id:"thaumcraft:void_sword"},
      {id:"spartanshields:shield_tc_thaumium"}
  ]},
  armor_void_robe:{
    prev: "armor_void", 
    tier: 5,
    list: [
      {id:"thaumcraft:void_robe_helm"},
      {id:"thaumcraft:void_robe_chest"},
      {id:"thaumcraft:void_robe_legs"},
      {id:"thaumcraft:void_boots"},
      {id:"thaumcraft:crimson_blade"},
      {id:"spartanshields:shield_tc_void"}
  ]},
  armor_deathworm:{
    prev: "armor_knightslime", 
    tier: 5,
    list: [
      {id:"iceandfire:deathworm_yellow_helmet"},
      {id:"iceandfire:deathworm_yellow_chestplate"},
      {id:"iceandfire:deathworm_yellow_leggings"},
      {id:"iceandfire:deathworm_yellow_boots"},
      {id:"tconstruct:broadsword", tag:{StatsOriginal:{AttackSpeedMultiplier:1,MiningSpeed:5,FreeModifiers:3,Durability:473,HarvestLevel:4,Attack:6},Stats:{AttackSpeedMultiplier:1,MiningSpeed:5,FreeModifiers:2,Durability:473,HarvestLevel:4,Attack:6},Special:{Categories:["tool","weapon"]},TinkerData:{Materials:["silver","silver","silver"],Modifiers:["toolleveling"]},Modifiers:[{identifier:"holy",color:-3019530,level:1},{identifier:"toolleveling",color:16777215,level:1}],Traits:["holy","toolleveling"]}},
      {id:"spartanshields:shield_tower_invar"}
  ]},
  armor_myrmex:{
    prev: "armor_deathworm", 
    tier: 6,
    list: [
      {id:"iceandfire:myrmex_desert_helmet"},
      {id:"iceandfire:myrmex_desert_chestplate"},
      {id:"iceandfire:myrmex_desert_leggings"},
      {id:"iceandfire:myrmex_desert_boots"},
      {id:"tconstruct:broadsword", tag:{StatsOriginal:{AttackSpeedMultiplier:1,MiningSpeed:6.35,FreeModifiers:3,Durability:375,HarvestLevel:2,Attack:5.6},Stats:{AttackSpeedMultiplier:1,MiningSpeed:6.35,FreeModifiers:2,Durability:375,HarvestLevel:2,Attack:5.6},Special:{Categories:["tool","weapon"]},TinkerData:{Materials:["ma.soulium","ma.soulium","ma.soulium"],Modifiers:["toolleveling"]},Modifiers:[{identifier:"chunky",color:-11124169,level:1},{identifier:"toolleveling",color:16777215,level:1}],Traits:["chunky","toolleveling"]}},
      {id:"spartanshields:shield_tower_copper"}
  ]},
  armor_dragonscale:{
    prev: "armor_tide", 
    tier: 8,
    list: [
      {id:"iceandfire:armor_red_helmet"},
      {id:"iceandfire:armor_red_chestplate"},
      {id:"iceandfire:armor_red_leggings"},
      {id:"iceandfire:armor_red_boots"},
      {id:"iceandfire:dragonbone_sword_fire"},
      {id:"spartanshields:shield_basic_signalum"}
  ]},
  armor_dragonsteel:{
    prev: "armor_dragonscale", 
    tier: 9,
    list: [
      {id:"iceandfire:dragonsteel_fire_helmet"},
      {id:"iceandfire:dragonsteel_fire_chestplate"},
      {id:"iceandfire:dragonsteel_fire_leggings"},
      {id:"iceandfire:dragonsteel_fire_boots"},
      {id:"tconstruct:broadsword", tag:{StatsOriginal:{AttackSpeedMultiplier:1,MiningSpeed:7,FreeModifiers:3,Durability:1324,HarvestLevel:4,Attack:43},Stats:{AttackSpeedMultiplier:1,MiningSpeed:7,FreeModifiers:2,Durability:1324,HarvestLevel:4,Attack:43},Special:{Categories:["tool","weapon"]},TinkerData:{Materials:["dragonsteel_fire","dragonsteel_fire","dragonsteel_fire"],Modifiers:["toolleveling"]},Modifiers:[{identifier:"sharp",color:-3359804,level:1},{identifier:"flame2",color:-3359804,level:1},{identifier:"toolleveling",color:16777215,level:1}],Traits:["sharp","flame2","toolleveling"]}},
      {id:"spartanshields:shield_abyssalcraft_ethaxium"}
  ]},
  armor_tide:{
    prev: "armor_myrmex", 
    tier: 7,
    list: [
      {id:"iceandfire:tide_blue_helmet"},
      {id:"iceandfire:tide_blue_chestplate"},
      {id:"iceandfire:tide_blue_leggings"},
      {id:"iceandfire:tide_blue_boots"},
      {id:"tconstruct:broadsword", tag:{StatsOriginal:{AttackSpeedMultiplier:1,MiningSpeed:12,FreeModifiers:3,Durability:1179,HarvestLevel:7,Attack:5.1},Stats:{AttackSpeedMultiplier:1.1,MiningSpeed:12,FreeModifiers:2,Durability:1179,HarvestLevel:7,Attack:5.1},Special:{Categories:["tool","weapon"]},TinkerData:{Materials:["cobalt","cobalt","cobalt"],Modifiers:["toolleveling"]},Modifiers:[{identifier:"lightweight",color:-14122284,level:1},{identifier:"momentum",color:-14122284,level:1},{identifier:"toolleveling",color:16777215,level:1}],Traits:["lightweight","momentum","toolleveling"]}},
      {id:"spartanshields:shield_tower_platinum"}
  ]},
  armor_steel:{
    prev: "armor_faraday", 
    tier: 4,
    list: [
      {id:"immersiveengineering:steel_armor_head"},
      {id:"immersiveengineering:steel_armor_chest"},
      {id:"immersiveengineering:steel_armor_legs"},
      {id:"immersiveengineering:steel_armor_feet"},
      {id:"thermalfoundation:tool.sword_steel"},
      {id:"spartanshields:shield_basic_steel"}
  ]},
  armor_nano:{
    prev: "armor_steel", 
    tier: 5,
    list: [
      {id:"ic2:nano_helmet", tag:{charge:1000000}},
      {id:"ic2:nano_chestplate", tag:{charge:1000000}},
      {id:"ic2:nano_leggings", tag:{charge:1000000}},
      {id:"ic2:nano_boots", tag:{charge:1000000}},
      {id:"ic2:nano_saber", tag:{charge:160000}},
      {id:"spartanshields:shield_riot_enderio", tag:{Energy:1000000}}
  ]},
  armor_flux:{
    prev: "armor_nano", 
    tier: 6,
    list: [
      {id:"redstonearsenal:armor.helmet_flux", tag:{Energy:0}},
      {id:"redstonearsenal:armor.plate_flux", tag:{Energy:0}},
      {id:"redstonearsenal:armor.legs_flux", tag:{Energy:0}},
      {id:"redstonearsenal:armor.boots_flux", tag:{Energy:0}},
      {id:"redstonearsenal:tool.sword_flux", tag:{Energy:320000}},
      {id:"spartanshields:shield_flux_ra", tag:{Energy:1000000}}
  ]},
  armor_quantum:{
    prev: "armor_flux", 
    tier: 7,
    list: [
      {id:"ic2:quantum_helmet", tag:{charge:10000000}},
      {id:"ic2:quantum_chestplate", tag:{charge:10000000}},
      {id:"ic2:quantum_leggings", tag:{charge:10000000}},
      {id:"ic2:quantum_boots", tag:{charge:10000000}},
      {id:"tconstruct:broadsword", tag:{StatsOriginal:{AttackSpeedMultiplier:1,MiningSpeed:6,FreeModifiers:3,Durability:711,HarvestLevel:10,Attack:6.8},Stats:{AttackSpeedMultiplier:1,MiningSpeed:6.1609993,FreeModifiers:2,Durability:733,HarvestLevel:10,Attack:6.915003},Special:{Categories:["tool","weapon"],alienStatBonus:{identifier:"",color:0,attack:0.11500002,durability:22,speed:0.161},alienStatPool:{identifier:"",color:16777215,attack:1.314999,durability:265,speed:1.9039981}},TinkerData:{Materials:["iridium","iridium","iridium"],Modifiers:["toolleveling"]},Modifiers:[{identifier:"dense",color:-5592406,level:1},{identifier:"alien",color:-5592406,level:1},{identifier:"toolleveling",color:16777215,level:1}],Traits:["dense","alien","toolleveling"]}},
      {id:"spartanshields:shield_basic_lumium"}
  ]},
  armor_boron:{
    prev: "armor_hazmat", 
    tier: 5,
    list: [
      {id:"nuclearcraft:helm_boron"},
      {id:"nuclearcraft:chest_boron"},
      {id:"nuclearcraft:legs_boron"},
      {id:"nuclearcraft:boots_boron"},
      {id:"tconstruct:broadsword", tag:{StatsOriginal:{AttackSpeedMultiplier:1,MiningSpeed:8,FreeModifiers:3,Durability:580,HarvestLevel:2,Attack:5.5},Stats:{AttackSpeedMultiplier:1,MiningSpeed:8,FreeModifiers:2,Durability:580,HarvestLevel:2,Attack:5.5},Special:{Categories:["tool","weapon"]},TinkerData:{Materials:["boron","boron","boron"],Modifiers:["toolleveling"]},Modifiers:[{identifier:"stiff",color:-8553091,level:1},{identifier:"dense",color:-8553091,level:1},{identifier:"toolleveling",color:16777215,level:1}],Traits:["stiff","dense","toolleveling"]}},
      {id:"spartanshields:shield_tower_steel"}
  ]},
  armor_hard_carbon:{
    prev: "armor_boron", 
    tier: 6,
    list: [
      {id:"nuclearcraft:helm_hard_carbon"},
      {id:"nuclearcraft:chest_hard_carbon"},
      {id:"nuclearcraft:legs_hard_carbon"},
      {id:"nuclearcraft:boots_hard_carbon"},
      {id:"tconstruct:broadsword", tag:{StatsOriginal:{AttackSpeedMultiplier:1,MiningSpeed:11,FreeModifiers:3,Durability:1488,HarvestLevel:3,Attack:6},Stats:{AttackSpeedMultiplier:1.1,MiningSpeed:11,FreeModifiers:2,Durability:1488,HarvestLevel:3,Attack:6},Special:{Categories:["tool","weapon"]},TinkerData:{Materials:["hard_carbon","hard_carbon","hard_carbon"],Modifiers:["toolleveling"]},Modifiers:[{identifier:"lightweight",color:-15115920,level:1},{identifier:"sharp",color:-15115920,level:1},{identifier:"toolleveling",color:16777215,level:1}],Traits:["lightweight","sharp","toolleveling"]}},
      {id:"spartanshields:shield_tower_lead"}
  ]},
  armor_tough:{
    prev: "armor_hard_carbon", 
    tier: 7,
    list: [
      {id:"nuclearcraft:helm_tough"},
      {id:"nuclearcraft:chest_tough"},
      {id:"nuclearcraft:legs_tough"},
      {id:"nuclearcraft:boots_tough"},
      {id:"tconstruct:broadsword", tag:{StatsOriginal:{AttackSpeedMultiplier:1,MiningSpeed:10,FreeModifiers:3,Durability:1191,HarvestLevel:3,Attack:6},Stats:{AttackSpeedMultiplier:1,MiningSpeed:10,FreeModifiers:2,Durability:1191,HarvestLevel:3,Attack:6},Special:{Categories:["tool","weapon"]},TinkerData:{Materials:["tough","tough","tough"],Modifiers:["toolleveling"]},Modifiers:[{identifier:"dense",color:-15397087,level:1},{identifier:"momentum",color:-15397087,level:1},{identifier:"toolleveling",color:16777215,level:1}],Traits:["dense","momentum","toolleveling"]}},
      {id:"spartanshields:shield_tower_obsidian"}
  ]},
  armor_boron_nitride:{
    prev: "armor_tough", 
    tier: 8,
    list: [
      {id:"nuclearcraft:helm_boron_nitride"},
      {id:"nuclearcraft:chest_boron_nitride"},
      {id:"nuclearcraft:legs_boron_nitride"},
      {id:"nuclearcraft:boots_boron_nitride"},
      {id:"tconstruct:broadsword", tag:{StatsOriginal:{AttackSpeedMultiplier:1,MiningSpeed:12,FreeModifiers:3,Durability:1615,HarvestLevel:4,Attack:6.5},Stats:{AttackSpeedMultiplier:1,MiningSpeed:12,FreeModifiers:2,Durability:1615,HarvestLevel:4,Attack:6.5},Special:{Categories:["tool","weapon"]},TinkerData:{Materials:["boron_nitride","boron_nitride","boron_nitride"],Modifiers:["toolleveling"]},Modifiers:[{identifier:"splintering",color:-831147415,level:1},{identifier:"jagged",color:-831147415,level:1},{identifier:"toolleveling",color:16777215,level:1}],Traits:["splintering","jagged","toolleveling"]}},
      {id:"spartanshields:shield_tower_nickel"}
  ]},
  armor_arctic:{
    prev: "armor_fiery", 
    tier: 6,
    list: [
      {id:"twilightforest:arctic_helmet"},
      {id:"twilightforest:arctic_chestplate"},
      {id:"twilightforest:arctic_leggings"},
      {id:"twilightforest:arctic_boots"},
      {id:"twilightforest:ice_sword"},
      {id:"thermalfoundation:tool.shield_diamond"}
  ]},
  armor_ironwood:{
    prev: "armor_steeleaf", 
    tier: 3,
    list: [
      {id:"twilightforest:ironwood_helmet"},
      {id:"twilightforest:ironwood_chestplate"},
      {id:"twilightforest:ironwood_leggings"},
      {id:"twilightforest:ironwood_boots"},
      {id:"twilightforest:ironwood_sword", tag:{ench:[{lvl:1,id:19}]}},
      {id:"spartanshields:shield_tower_iron"}
  ]},
  armor_fiery:{
    prev: "armor_knightmetal", 
    tier: 5,
    list: [
      {id:"twilightforest:fiery_helmet"},
      {id:"twilightforest:fiery_chestplate"},
      {id:"twilightforest:fiery_leggings"},
      {id:"twilightforest:fiery_boots"},
      {id:"twilightforest:fiery_sword", tag:{ench:[{lvl:2,id:20}]}},
      {id:"thermalfoundation:tool.shield_nickel"}
  ]},
  armor_steeleaf:{
    prev: "armor_hardenedleather", 
    tier: 2,
    list: [
      {id:"twilightforest:steeleaf_helmet"},
      {id:"twilightforest:steeleaf_chestplate"},
      {id:"twilightforest:steeleaf_leggings"},
      {id:"twilightforest:steeleaf_boots"},
      {id:"twilightforest:steeleaf_sword", tag:{ench:[{lvl:2,id:21}]}},
      {id:"spartanshields:shield_tower_wood"}
  ]},
  armor_yeti:{
    prev: "armor_arctic", 
    tier: 7,
    list: [
      {id:"twilightforest:yeti_helmet"},
      {id:"twilightforest:yeti_chestplate"},
      {id:"twilightforest:yeti_leggings"},
      {id:"twilightforest:yeti_boots"},
      {id:"cyclicmagic:sword_slowness"},
      {id:"spartanshields:shield_basic_platinum"}
  ]},
  armor_knightmetal:{
    prev: "armor_ironwood", 
    tier: 4,
    list: [
      {id:"twilightforest:knightmetal_helmet"},
      {id:"twilightforest:knightmetal_chestplate"},
      {id:"twilightforest:knightmetal_leggings"},
      {id:"twilightforest:knightmetal_boots"},
      {id:"twilightforest:knightmetal_sword"},
      {id:"twilightforest:knightmetal_shield"}
  ]},
  armor_dark_steel:{
    prev: "armor_manyullyn", 
    tier: 7,
    list: [
      {id:"enderio:item_dark_steel_helmet"},
      {id:"enderio:item_dark_steel_chestplate"},
      {id:"enderio:item_dark_steel_leggings"},
      {id:"enderio:item_dark_steel_boots"},
      {id:"enderio:item_dark_steel_sword"},
      {id:"spartanshields:shield_riot_enderio", tag:{Energy:1000000}}
  ]},
  armor_psimetal:{
    prev: "armor_manasteel", 
    tier: 3,
    list: [
      {id:"psi:psimetal_exosuit_helmet"},
      {id:"psi:psimetal_exosuit_chestplate"},
      {id:"psi:psimetal_exosuit_leggings"},
      {id:"psi:psimetal_exosuit_boots"},
      {id:"psi:psimetal_sword"},
      {id:"spartanshields:shield_basic_enderium"}
  ]}
} as IData[string];

static armorSortedKeys as IData = [
/*Tier 1 */ "armor_hardenedleather", "armor_manaweave", 
/*Tier 2 */ "armor_iron", "armor_manasteel", "armor_steeleaf", 
/*Tier 3 */ "armor_faraday", "armor_golden", "armor_living_armour", "armor_thaumium", "armor_ironwood", "armor_psimetal", 
/*Tier 4 */ "armor_hazmat", "armor_knightslime", "armor_elementium", "armor_void", "armor_steel", "armor_knightmetal", 
/*Tier 5 */ "armor_diamond", "armor_terrasteel", "armor_void_robe", "armor_deathworm", "armor_nano", "armor_boron", "armor_fiery", 
/*Tier 6 */ "armor_manyullyn", "armor_inferium", "armor_myrmex", "armor_flux", "armor_hard_carbon", "armor_arctic", 
/*Tier 7 */ "armor_prudentium", "armor_tide", "armor_quantum", "armor_tough", "armor_yeti", "armor_dark_steel", 
/*Tier 8 */ "armor_end_steel", "armor_intermedium", "armor_dragonscale", "armor_boron_nitride", 
/*Tier 9 */ "armor_superium", "armor_dragonsteel", 
/*Tier 10*/ "armor_supremium"
] as IData;

#           mod:id                          meta     UUvalue
static matterTooltips as string[] = [
  "actuallyadditions:block_misc",           "9",     "1600",
  "actuallyadditions:item_misc",            "8",     "600",
  "computercraft:computer",                 "16384", "600",
  "draconicevolution:chaos_shard",          "0",     "600000",
  "draconicevolution:chaos_shard",          "1",     "66667",
  "draconicevolution:chaos_shard",          "2",     "7407",
  "draconicevolution:chaos_shard",          "3",     "823",
  "draconicevolution:dragon_heart",         "0",     "200000",
  "draconicevolution:fusion_crafting_core", "0",     "100000",
  "environmentaltech:litherite_crystal",    "0",     "6000",
  "extrautils2:machine",                    "0",     "450",
  "forestry:hardened_machine",              "0",     "1800",
  "ic2:crafting",                           "1",     "80",
  "ic2:crafting",                           "3",     "180",
  "ic2:nuclear",                            "3",     "21324",
  "ic2:nuclear",                            "7",     "2369",
  "ic2:resource",                           "13",    "1600",
  "immersiveengineering:metal_decoration0", "3",     "950",
  "immersiveengineering:metal_decoration0", "4",     "1600",
  "immersiveengineering:metal_decoration0", "5",     "2500",
  "mekanism:basicblock",                    "8",     "1750",
  "mekanism:controlcircuit",                "3",     "1500",
  "minecraft:cookie",                       "0",     "10",
  "minecraft:skull",                        "1",     "5000",
  "quark:crystal",                          "0",     "25",
  "quark:crystal",                          "1",     "25",
  "quark:crystal",                          "2",     "25",
  "quark:crystal",                          "3",     "25",
  "quark:crystal",                          "4",     "25",
  "quark:crystal",                          "5",     "25",
  "quark:crystal",                          "6",     "25",
  "quark:crystal",                          "7",     "25",
  "rftools:machine_frame",                  "0",     "2600",
  "teslacorelib:machine_case",              "0",     "1900",
  "thermalexpansion:frame",                 "0",     "4000",
  "rats:ancient_sawblade",                  "0",     "3900",
  "rats:arcane_technology",                 "0",     "3900",
  "rats:block_of_cheese",                   "0",     "180",
  "rats:charged_creeper_chunk",             "0",     "600",
  "rats:cheese",                            "0",     "30",
  "rats:chunky_cheese_token",               "0",     "450000",
  "rats:token_piece",                       "0",     "4500",
  "rats:token_fragment",                    "0",     "450",
  "rats:tiny_coin",                         "0",     "45",
  "rats:compressed_rat",                    "0",     "600",
  "rats:feral_bagh_nakhs",                  "0",     "1200",
  "rats:feral_rat_claw",                    "0",     "2400",
  "rats:gem_of_ratlantis",                  "0",     "2400",
  "rats:herb_bundle",                       "0",     "300",
  "rats:idol_of_ratlantis",                 "0",     "2400",
  "rats:little_black_squash_balls",         "0",     "60",
  "rats:marbled_cheese_golem_core",         "0",     "3900",
  "rats:marbled_cheese_rat_head",           "0",     "1950",
  "rats:marbled_cheese_raw",                "0",     "8",
  "rats:plague_leech",                      "0",     "600",
  "rats:psionic_rat_brain",                 "0",     "3900",
  "rats:rat_breeding_lantern",              "0",     "1050",
  "rats:rat_cage",                          "0",     "600",
  "rats:rat_diamond",                       "0",     "300",
  "rats:rat_toga",                          "0",     "840",
  "rats:rat_upgrade_basic_ratlantean",      "0",     "1125",
  "rats:rat_upgrade_basic",                 "0",     "390",
  "rats:rat_upgrade_combined",              "0",     "1650",
  "rats:ratglove_flower",                   "0",     "105",
  "rats:ratglove_petals",                   "0",     "1050",
  "rats:ratlantean_flame",                  "0",     "570",
  "rats:treacle",                           "0",     "3900",
  "rats:vial_of_sentience",                 "0",     "1950",
] as string[];
