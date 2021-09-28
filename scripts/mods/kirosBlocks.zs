#modloaded kirosblocks

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;


val hasRecipes = [
  'colored_blinking_light_block',
  'colored_blinking_light_fast_block',
  'colored_blinking_light_fast_reverse_block',
  'colored_brick_light_block',
  'colored_brick_medium_block',
  'colored_full_leaves_block',
  'colored_light_fifteen_block',
  'colored_light_five_block',
  'colored_light_nine_block',
  'colored_light_one_block',
  'colored_light_seven_block',
  'colored_light_three_block',
  'colored_metal_block',
  'colored_noise_block',
  'colored_raw_wooden_block',
  'colored_raw_wooden_vertical_block',
  'colored_stucco_block',
  'colored_tatami_block',
  'colored_thin_leaves_block',
  'colored_thin_marble_block',
  'colored_white_emissive_block',
  'colored_wooden_planks_block',
  'colored_wooden_planks_block',
  'colored_wooden_planks_vertical_block',
  'colored_wooden_planks_vertical_block',
  'colored_wooly_block',
  'test_block',
] as string[];

val unique = scripts.unique.Unique([
  <minecraft:clay>,
  <rustic:clay_wall>,
  <rustic:clay_wall>,
]);

for i, item in loadedMods["kirosblocks"].items {
  if (hasRecipes has item.definition.id.substring(12)) continue;

  recipes.addShaped("kirosblocks #"~i, item * 4, unique.next());
}