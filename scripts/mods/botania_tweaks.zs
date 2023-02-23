#modloaded botania_tweaks

import crafttweaker.item.IItemStack;

val tinyPotatoes = [
  <botania:tinypotato>,
  <botania_tweaks:compressed_tiny_potato_1>,
  <botania_tweaks:compressed_tiny_potato_2>,
  <botania_tweaks:compressed_tiny_potato_3>,
  <botania_tweaks:compressed_tiny_potato_4>,
  <botania_tweaks:compressed_tiny_potato_5>,
  <botania_tweaks:compressed_tiny_potato_6>,
  <botania_tweaks:compressed_tiny_potato_7>,
  <botania_tweaks:compressed_tiny_potato_8>,
] as IItemStack[];

# Add back-conversion recipe
for i, potato in tinyPotatoes {
  if(i==0) continue;
  recipes.addShapeless(tinyPotatoes[i - 1] * 9, [potato]);
}
