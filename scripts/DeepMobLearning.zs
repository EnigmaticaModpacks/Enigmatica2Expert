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

recipes.remove(<deepmoblearning:machine_casing>);
recipes.addShaped(<deepmoblearning:machine_casing>, [
  [<deepmoblearning:soot_covered_plate>, <deepmoblearning:soot_covered_redstone>, <deepmoblearning:soot_covered_plate>],
  [<ore:sheetTitaniumIridium>, <extendedcrafting:trimmed:2>, <ore:sheetTitaniumIridium>],
  [<deepmoblearning:soot_covered_plate>, <deepmoblearning:soot_covered_redstone>, <deepmoblearning:soot_covered_plate>]]);

recipes.remove(<deepmoblearning:soot_covered_plate> * 8);
recipes.addShaped(<deepmoblearning:soot_covered_plate> * 4, [
  [null, <deepmoblearning:soot_covered_redstone>, null],
  [<biomesoplenty:crystal>, <tconstruct:large_plate>.withTag({Material: "blackquartz_plustic"}), <biomesoplenty:crystal>],
  [null, <deepmoblearning:soot_covered_redstone>, null]]);
