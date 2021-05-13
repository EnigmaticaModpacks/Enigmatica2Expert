#modloaded quark

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

# Fix recipes (each original quark recipe use basalt bricks for some reason)
for i, item in <quark:world_stone_carved>.definition.subItems {
  if(i==3) continue;
  recipes.remove(item);
  craft.make(item * 8, ["pretty",
    "G G G",
    "G   G",
    "G G G"], {
    "G": <quark:world_stone_bricks>.definition.makeStack(i), # Bricks
  });
}

# Fix conflicts with compressed
val mcWoodLogs = [
  <minecraft:log>,
  <minecraft:log:1>,
  <minecraft:log:2>,
  <minecraft:log:3>,
  <minecraft:log2>,
  <minecraft:log2:1>,
] as IItemStack[];
for i, item in <quark:bark>.definition.subItems {
  recipes.remove(item);
  craft.make(item * 17, ["pretty",
    "G G G",
    "G c G",
    "G G G"], {
    "G": mcWoodLogs[i],
    "c": <additionalcompression:logwood_compressed>,
  });
}

# Fix conflicts with CoT compressed granite
recipes.remove(<quark:world_stone_pavement:*>);