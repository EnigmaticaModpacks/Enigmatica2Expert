#modloaded deepmoblearning

val ing = <deepmoblearning:glitch_infused_ingot>;

recipes.remove(<deepmoblearning:glitch_infused_sword>);
recipes.addShaped(<deepmoblearning:glitch_infused_sword>, [
  [null, null, ing],
  [null, ing, null],
  [<enderio:item_end_steel_sword>.anyDamage(), null, null]]);

recipes.remove(<deepmoblearning:glitch_infused_boots>);
recipes.addShaped(<deepmoblearning:glitch_infused_boots>, [
  [null, null, null],
  [ing, <enderio:item_end_steel_boots>.anyDamage(), ing],
  [ing, null, ing]]);

recipes.remove(<deepmoblearning:glitch_infused_leggings>);
recipes.addShaped(<deepmoblearning:glitch_infused_leggings>, [
  [ing, ing, ing],
  [ing, <enderio:item_end_steel_leggings>.anyDamage(), ing],
  [ing, null, ing]]);

recipes.remove(<deepmoblearning:glitch_infused_chestplate>);
recipes.addShaped(<deepmoblearning:glitch_infused_chestplate>, [
  [ing, <enderio:item_end_steel_chestplate>.anyDamage(), ing],
  [ing, ing, ing],
  [ing, ing, ing]]);

recipes.remove(<deepmoblearning:glitch_infused_helmet>);
recipes.addShaped(<deepmoblearning:glitch_infused_helmet>, [
  [ing, ing, ing],
  [ing, <enderio:item_end_steel_helmet>.anyDamage(), ing],
  [null, null, null]]);

recipes.remove(<deepmoblearning:soot_covered_plate> * 8);
recipes.addShaped(<deepmoblearning:soot_covered_plate> * 4, [
  [null, <deepmoblearning:soot_covered_redstone>, null],
  [<biomesoplenty:crystal>, <tconstruct:large_plate>.withTag({Material: "blackquartz_plustic"}), <biomesoplenty:crystal>],
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