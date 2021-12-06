#modloaded deepmoblearning

val ing = <deepmoblearning:glitch_infused_ingot>;

recipes.remove(<deepmoblearning:glitch_infused_sword>);
recipes.addShaped(<deepmoblearning:glitch_infused_sword>, [
  [null, null, ing],
  [null, ing, null],
  [<endreborn:sword_shard>, null, null]]);

recipes.remove(<deepmoblearning:soot_covered_plate> * 8);
recipes.addShaped(<deepmoblearning:soot_covered_plate> * 4, [
  [null, <deepmoblearning:soot_covered_redstone>, null],
  [<biomesoplenty:crystal>, <tconstruct:large_plate>.withTag({Material: "black_quartz"}), <biomesoplenty:crystal>],
  [null, <deepmoblearning:soot_covered_redstone>, null]]);

remakeEx(<deepmoblearning:extraction_chamber>, [
  [<ore:sheetTitaniumIridium>, <mekanism:glowpanel:11>, <ore:sheetTitaniumIridium>],
  [<extrautils2:decorativesolid:7>, <deepmoblearning:machine_casing>, <extrautils2:decorativesolid:7>]]);

remakeEx(<deepmoblearning:simulation_chamber>, [
  [<ore:gearEmerald>, <mekanism:glowpanel:6>, <ore:gearEmerald>],
  [<extrautils2:decorativesolid:7>, <deepmoblearning:machine_casing>, <extrautils2:decorativesolid:7>]]);

remakeEx(<deepmoblearning:machine_casing>, [
  [<deepmoblearning:soot_covered_plate>, <deepmoblearning:soot_covered_redstone>, <deepmoblearning:soot_covered_plate>],
  [<tconstruct:fancy_frame:2>, <extendedcrafting:trimmed:2>, <tconstruct:fancy_frame:2>],
  [<deepmoblearning:soot_covered_plate>, <deepmoblearning:soot_covered_redstone>, <deepmoblearning:soot_covered_plate>]]);

recipes.remove(<deepmoblearning:polymer_clay> * 16);
recipes.addShapeless(<deepmoblearning:polymer_clay> * 16, [<liquid:concrete> * 1000, <ore:dustClay>, <ore:dustClay>, <ore:dustClay>, <ore:dustGold>, <ore:dustLapis>]);

# Remove level-to-level conversions
recipes.removeByRecipeName("deepmoblearning:living_matter_exchange/metadata2_extraterrestrial_living_matter");
recipes.removeByRecipeName("deepmoblearning:living_matter_exchange/metadata1_hellish_living_matter");

# Add mass crafting recipes for iron
val matterOver = <deepmoblearning:living_matter_overworldian>;
recipes.addShapeless("Over matter to Iron Blocks", <minecraft:iron_block> * 2, [
  matterOver, matterOver, matterOver, matterOver, <thaumcraft:flesh_block>, matterOver, matterOver, matterOver, matterOver]);

# Add mass crafting recipes for gold
val matterHell = <deepmoblearning:living_matter_hellish>;
recipes.addShaped("Hellish matter to Gold Blocks", <minecraft:gold_block> * 4, [
  [<ore:glowstone>, matterHell, <ore:glowstone>],
  [matterHell, <ore:blockFakeIron>, matterHell],
  [matterHell, matterHell, matterHell]]);

# [Trial Keystone] from [Soot-covered Plate][+3]
craft.remake(<deepmoblearning:trial_keystone>, ["pretty",
  "◊ § ◊",
  "□ п □",
  "□ □ □"], {
  "□": <ore:plateSilicon>,                   # Silicon Plate
  "§": <deepmoblearning:trial_key>,          # Trial Key
  "◊": <ore:gemDiamond>,                     # Diamond
  "п": <deepmoblearning:soot_covered_plate>, # Soot-covered Plate
});

# [Blank Data Model] from [Soot-covered Redstone][+2]
craft.remake(<deepmoblearning:data_model_blank>, ["pretty",
  "* M *",
  "M ♥ M",
  "* M *"], {
  "♥": <deepmoblearning:soot_covered_redstone>, # Soot-covered Redstone
  "*": <ore:itemPulsatingCrystal>,              # Pulsating Crystal
  "M": <endreborn:food_ender_flesh>,            # Mysical Flesh
});

# Redstone from Sool-covered version
mods.harvestcrafttweaker.HarvestCraftTweaker.addWaterFilter(<deepmoblearning:soot_covered_redstone>, <actuallyadditions:item_misc:10>, <jaopca:item_dusttinyredstone> * 8);
scripts.wrap.thermalexpansion.Transposer.addFillRecipe(<minecraft:redstone>, <deepmoblearning:soot_covered_redstone>, <fluid:water> * 10, 1000);

# [Ender Air Bottle] from [End Stone][+2]
craft.shapeless(<botania:manaresource:15>, "EeG", {
  "E": <deepmoblearning:living_matter_extraterrestrial>, # Extraterrestrial Matter
  "e": <ore:endstone> | <ore:oc:stoneEndstone>, # End Stone
  "G": <minecraft:glass_bottle>,                # Glass Bottle
});

# [Dragon's Breath] from [Dragon Scale][+2]
craft.shapeless(<minecraft:dragon_breath>, "EDG", {
  "E": <deepmoblearning:living_matter_extraterrestrial>, # Extraterrestrial Matter
  "D": <mysticalagradditions:stuff:3>, # Dragon Scale
  "G": <minecraft:glass_bottle>,       # Glass Bottle
});