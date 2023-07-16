
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

// ---------------------------
// Entity brewing
// ---------------------------
for output, ingrs in {

  # Small worm
  <iceandfire:iceandfire.deathworm_egg> : [
    <twilightforest:moonworm>,
    <betteranimalsplus:goose_egg>,
    <actuallyadditions:item_worm>,
  ],

  # Big worm
  <iceandfire:iceandfire.deathworm_egg:1> : [
    <twilightforest:moonworm>,
    <iceandfire:iceandfire.deathworm_egg>,
    <actuallyadditions:item_worm>,
  ],

  # [Jungle Myrmex Egg]
  <iceandfire:myrmex_jungle_egg> : [
    <randomthings:weatheregg:1>,
    <twilightforest:cicada>,
    <ore:deathwormChitin>,
  ],

  # [Desert Myrmex Egg]
  <iceandfire:myrmex_desert_egg> : [
    <randomthings:weatheregg>,
    <twilightforest:cicada>,
    <ore:deathwormChitin>,
  ],

  # [Jungle Myrmex Queen Egg]
  <iceandfire:myrmex_jungle_egg:4> : [
    <ore:carminite>,
    <twilightforest:cicada>,
    <iceandfire:myrmex_jungle_resin>,
  ],

  # [Desert Myrmex Queen Egg]
  <iceandfire:myrmex_desert_egg:4> : [
    <ore:carminite>,
    <twilightforest:cicada>,
    <iceandfire:myrmex_desert_resin>,
  ],

  # Hippogryphs
  <iceandfire:hippogryph_egg:0> : [<ore:foodGroundduck>, <actuallyadditions:item_misc:15>, <thermalfoundation:rockwool>],
  <iceandfire:hippogryph_egg:1> : [<ore:foodGroundduck>, <actuallyadditions:item_misc:15>, <thermalfoundation:rockwool:3>],
  <iceandfire:hippogryph_egg:2> : [<ore:foodGroundduck>, <actuallyadditions:item_misc:15>, <thermalfoundation:rockwool:7>],
  <iceandfire:hippogryph_egg:3> : [<ore:foodGroundduck>, <actuallyadditions:item_misc:15>, <thermalfoundation:rockwool:14>],
  <iceandfire:hippogryph_egg:4> : [<ore:foodGroundduck>, <actuallyadditions:item_misc:15>, <thermalfoundation:rockwool:9>],
  <iceandfire:hippogryph_egg:5> : [<ore:foodGroundduck>, <actuallyadditions:item_misc:15>, <thermalfoundation:rockwool:8>],
  <iceandfire:hippogryph_egg:6> : [<ore:foodGroundduck>, <actuallyadditions:item_misc:15>, <thermalfoundation:rockwool:15>],

} as IIngredient[][IItemStack] {
  mods.rustic.Condenser.addRecipe(output, ingrs, <scalinghealth:heartdust>, <tconstruct:edible:33>, <fluid:wine> * 1000, 40);
}