
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

// ---------------------------
// Entity brewing
// ---------------------------
for tuple in [

  {itemUtils.getItem("betteranimalsplus:pheasant_egg") : [
    <ore:feather>,
    <ore:foodGroundchicken>, # Ground Chicken
    <nuclearcraft:cocoa_solids>,
  ]},

  {itemUtils.getItem("betteranimalsplus:turkey_egg") : [
    <ore:feather>,
    <ore:foodGroundturkey>, # Ground Turkey
    <nuclearcraft:cocoa_solids>,
  ]},

  {itemUtils.getItem("betteranimalsplus:goose_egg") : [
    <ore:feather>,
    <ore:foodGroundduck>, # Ground Duck
    <nuclearcraft:cocoa_solids>,
  ]},

  {<emberroot:owl_egg> : [
    <ore:feather>,
    <minecraft:spider_eye>, # Spider Eye
    <nuclearcraft:cocoa_solids>,
  ]},

  {<quark:parrot_egg> : [
    <ore:feather>,
    <ore:dyeGray>, # Gray Dye
    <nuclearcraft:cocoa_solids>,
  ]},

  {<quark:parrot_egg:1> : [
    <ore:feather>,
    <ore:dyeRed>, # Rose Red
    <nuclearcraft:cocoa_solids>,
  ]},

  {<quark:parrot_egg:2> : [
    <ore:feather>,
    <ore:dyeBlue>, # Blue Dye
    <nuclearcraft:cocoa_solids>,
  ]},

  {<quark:parrot_egg:3> : [
    <ore:feather>,
    <ore:dyeGreen>, # Cactus Green
    <nuclearcraft:cocoa_solids>,
  ]},

  {<quark:parrot_egg:4> : [
    <ore:feather>,
    <ore:dyeCyan>, # Cyan Dye
    <nuclearcraft:cocoa_solids>,
  ]},

  # Small worm
  {<iceandfire:iceandfire.deathworm_egg> : [
    <twilightforest:moonworm>,
    utils.tryCatch("betteranimalsplus:goose_egg", <iceandfire:iceandfire.deathworm_egg>),
    <actuallyadditions:item_worm>,
  ]},

  # Big worm
  {<iceandfire:iceandfire.deathworm_egg:1> : [
    <twilightforest:moonworm>,
    <iceandfire:iceandfire.deathworm_egg>,
    <actuallyadditions:item_worm>,
  ]},

  # [Jungle Myrmex Egg]
  {<iceandfire:myrmex_jungle_egg> : [
    <randomthings:weatheregg:1>,
    <twilightforest:cicada>,
    <ore:deathwormChitin>,
  ]},

  # [Desert Myrmex Egg]
  {<iceandfire:myrmex_desert_egg> : [
    <randomthings:weatheregg>,
    <twilightforest:cicada>,
    <ore:deathwormChitin>,
  ]},

  # [Jungle Myrmex Queen Egg]
  {<iceandfire:myrmex_jungle_egg:4> : [
    <ore:carminite>,
    <twilightforest:cicada>,
    <iceandfire:myrmex_jungle_resin>,
  ]},

  # [Desert Myrmex Queen Egg]
  {<iceandfire:myrmex_desert_egg:4> : [
    <ore:carminite>,
    <twilightforest:cicada>,
    <iceandfire:myrmex_desert_resin>,
  ]},

  # Hippogryphs
  {<iceandfire:hippogryph_egg:0> : [<ore:foodGroundduck>, <actuallyadditions:item_misc:15>, <thermalfoundation:rockwool>]},
  {<iceandfire:hippogryph_egg:1> : [<ore:foodGroundduck>, <actuallyadditions:item_misc:15>, <thermalfoundation:rockwool:3>]},
  {<iceandfire:hippogryph_egg:2> : [<ore:foodGroundduck>, <actuallyadditions:item_misc:15>, <thermalfoundation:rockwool:7>]},
  {<iceandfire:hippogryph_egg:3> : [<ore:foodGroundduck>, <actuallyadditions:item_misc:15>, <thermalfoundation:rockwool:14>]},
  {<iceandfire:hippogryph_egg:4> : [<ore:foodGroundduck>, <actuallyadditions:item_misc:15>, <thermalfoundation:rockwool:9>]},
  {<iceandfire:hippogryph_egg:5> : [<ore:foodGroundduck>, <actuallyadditions:item_misc:15>, <thermalfoundation:rockwool:8>]},
  {<iceandfire:hippogryph_egg:6> : [<ore:foodGroundduck>, <actuallyadditions:item_misc:15>, <thermalfoundation:rockwool:15>]},

  {<iceandfire:jar_pixie:0> : [<biomesoplenty:jar_filled:1>, <tconstruct:materials:19>, <quark:crystal:1>]},
  {<iceandfire:jar_pixie:1> : [<biomesoplenty:jar_filled:1>, <tconstruct:materials:19>, <quark:crystal:7>]},
  {<iceandfire:jar_pixie:2> : [<biomesoplenty:jar_filled:1>, <tconstruct:materials:19>, <quark:crystal:5>]},
  {<iceandfire:jar_pixie:3> : [<biomesoplenty:jar_filled:1>, <tconstruct:materials:19>, <quark:crystal:4>]},
  {<iceandfire:jar_pixie:4> : [<biomesoplenty:jar_filled:1>, <tconstruct:materials:19>, <quark:crystal:3>]},


  {<iceandfire:dragonegg_red>      : [<iceandfire:fire_dragon_heart>, <ore:seaSerpentScaleBlock>, <iceandfire:dragonscale_red>]},
  {<iceandfire:dragonegg_green>    : [<iceandfire:fire_dragon_heart>, <ore:seaSerpentScaleBlock>, <iceandfire:dragonscale_green>]},
  {<iceandfire:dragonegg_bronze>   : [<iceandfire:fire_dragon_heart>, <ore:seaSerpentScaleBlock>, <iceandfire:dragonscale_bronze>]},
  {<iceandfire:dragonegg_gray>     : [<iceandfire:fire_dragon_heart>, <ore:seaSerpentScaleBlock>, <iceandfire:dragonscale_gray>]},
  {<iceandfire:dragonegg_blue>     : [<iceandfire:ice_dragon_heart>, <ore:seaSerpentScaleBlock>, <iceandfire:dragonscale_blue>]},
  {<iceandfire:dragonegg_white>    : [<iceandfire:ice_dragon_heart>, <ore:seaSerpentScaleBlock>, <iceandfire:dragonscale_white>]},
  {<iceandfire:dragonegg_sapphire> : [<iceandfire:ice_dragon_heart>, <ore:seaSerpentScaleBlock>, <iceandfire:dragonscale_sapphire>]},
  {<iceandfire:dragonegg_silver>   : [<iceandfire:ice_dragon_heart>, <ore:seaSerpentScaleBlock>, <iceandfire:dragonscale_silver>]},

  {<thermalexpansion:morb>.withTag({Generic: 1 as byte, id: "iceandfire:hippocampus"}) : [
    <iceandfire:ambrosia>,  # Ambrosia
    <ore:dustPrismarine>, # Prismarine Crystals
    <tconstruct:edible:20>, # Fish Jerky
  ]},

  {<thermalexpansion:morb>.withTag({Generic: 1 as byte, id: "iceandfire:amphithere"}) : [
    <iceandfire:rotten_egg>,       # Rotten Egg
    <iceandfire:shiny_scales>,     # Shiny Scales
    <iceandfire:hippogryph_talon>, # Hippogryph Talon
  ]},

  {<thermalexpansion:morb>.withTag({Generic: 1 as byte, id: "iceandfire:seaserpent"}) : [
    <iceandfire:amphithere_skull>, # Amphithere Skull
    <ore:dragonscaleBlock>, # Block of Dragon Scales
    <iceandfire:hippocampus_fin>, # Hippocampus Fin
  ]},

] as IIngredient[][IItemStack][] {
  for output, ingrs in tuple {
    if(isNull(output)) continue;
    mods.rustic.Condenser.addRecipe(output, ingrs, <scalinghealth:heartdust>, <tconstruct:edible:33>, <fluid:wine> * 1000, 40);
  }
}