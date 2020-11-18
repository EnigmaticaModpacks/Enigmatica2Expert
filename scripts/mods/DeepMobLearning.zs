#modloaded deepmoblearning

val ing = <deepmoblearning:glitch_infused_ingot>;

recipes.remove(<deepmoblearning:glitch_infused_sword>);
recipes.addShaped(<deepmoblearning:glitch_infused_sword>, [
  [null, null, ing],
  [null, ing, null],
  [<enderio:item_stellar_alloy_sword>.anyDamage(), null, null]]);

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
  [matterHell, <ore:blockIron>, matterHell],
  [matterHell, matterHell, matterHell]]);
