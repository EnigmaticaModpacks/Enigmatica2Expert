import crafttweaker.item.IItemStack;

# Heavy mix lump
recipes.remove(<mechanics:heavy_mesh> * 2);
recipes.addShapeless(<mechanics:heavy_mesh> * 4, [
  <fluid:oil> * 1000, <ore:dustLead>, <ore:dustLead>, <ore:dustQuartzBlack>, <ore:dustQuartzBlack>]);

# heavy crushing block
val compressed1 = compressIt(<mechanics:heavy_block>, 1);
val compressed2 = compressIt(<actuallyadditions:block_misc:2>, 3);
recipes.addShaped(<mechanics:crushing_block>, [
  [compressed1, compressed1],
  [compressed2, compressed2]]);

<mechanics:crushing_block>.hardness = <mechanics:crushing_block>.hardness*20;

# Amplyfying tube
recipes.addShaped(<mechanics:amplifying_tube>, [
  [<integratedterminals:chorus_glass>, <extrautils2:suncrystal>, <integratedterminals:chorus_glass>],
  [<ore:ingotHeavy>, null, <ore:ingotHeavy>], 
  [<ore:ingotHeavy>, <industrialforegoing:laser_lens_inverted:4>, <ore:ingotHeavy>]]);

# Remove excess recipes
mods.mechanics.removeTubeRecipe(<minecraft:stone>);
mods.mechanics.removeTubeRecipe(<minecraft:cobblestone>);

# Rework of crushed obsidian
val obsDust  = <thermalfoundation:material:770>;
val obsBlock = <minecraft:obsidian>;

mods.immersiveengineering.Crusher.removeRecipesForInput(obsBlock);
mods.integrateddynamics.Squeezer.removeRecipesWithOutput(obsDust);
mods.integrateddynamics.MechanicalSqueezer.removeRecipesWithOutput(obsDust);
mods.mekanism.enrichment.removeRecipe(obsBlock);
mods.appliedenergistics2.Grinder.removeRecipe(obsBlock);
mods.actuallyadditions.Crusher.removeRecipe(obsDust);

mods.mechanics.addCrushingBlockRecipe(obsBlock, [obsDust * 2] as IItemStack[], [1] as double[]);

# Blasting powder
recipes.addShapeless(<mechanics:bursting_powder>, [
  <ore:gunpowder>, <mechanics:fuel_dust>, <appliedenergistics2:material:45>
]);


function addBurstSeedRecipe(input as IItemStack, output as IItemStack) {
  val compressed = compressIt(input, 1);
  recipes.addShaped(output, [
  [null, compressed, null],
  [compressed, <mechanics:bursting_powder>, compressed],
  [null, compressed, null],
  ]);
}

addBurstSeedRecipe(<exnihilocreatio:block_andesite_crushed>, <mechanics:burst_seed_andesite>);
addBurstSeedRecipe(<exnihilocreatio:block_diorite_crushed>, <mechanics:burst_seed_diorite>);
addBurstSeedRecipe(<exnihilocreatio:block_granite_crushed>, <mechanics:burst_seed_granite>);

// //Do not modify this unless you change mechanics config!
// recipes.addShaped(<mechanics:burst_seed_wool>, [
// [null, <minecraft:wool:0>, null],
// [<minecraft:wool:0>, <mechanics:bursting_powder>, <minecraft:wool:0>],
// [null, <minecraft:wool:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_prismarine>, [
// [null, <minecraft:prismarine:0>, null],
// [<minecraft:prismarine:0>, <mechanics:bursting_powder>, <minecraft:prismarine:0>],
// [null, <minecraft:prismarine:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_red_sandstone>, [
// [null, <minecraft:red_sandstone:0>, null],
// [<minecraft:red_sandstone:0>, <mechanics:bursting_powder>, <minecraft:red_sandstone:0>],
// [null, <minecraft:red_sandstone:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_end_stone>, [
// [null, <minecraft:end_stone:0>, null],
// [<minecraft:end_stone:0>, <mechanics:bursting_powder>, <minecraft:end_stone:0>],
// [null, <minecraft:end_stone:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_dirt>, [
// [null, <minecraft:dirt:0>, null],
// [<minecraft:dirt:0>, <mechanics:bursting_powder>, <minecraft:dirt:0>],
// [null, <minecraft:dirt:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_clay>, [
// [null, <minecraft:clay:0>, null],
// [<minecraft:clay:0>, <mechanics:bursting_powder>, <minecraft:clay:0>],
// [null, <minecraft:clay:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_quartz>, [
// [null, <minecraft:quartz:0>, null],
// [<minecraft:quartz:0>, <mechanics:bursting_powder>, <minecraft:quartz:0>],
// [null, <minecraft:quartz:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_ice>, [
// [null, <minecraft:ice:0>, null],
// [<minecraft:ice:0>, <mechanics:bursting_powder>, <minecraft:ice:0>],
// [null, <minecraft:ice:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_stone>, [
// [null, <minecraft:stone:0>, null],
// [<minecraft:stone:0>, <mechanics:bursting_powder>, <minecraft:stone:0>],
// [null, <minecraft:stone:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_sand>, [
// [null, <minecraft:sand:0>, null],
// [<minecraft:sand:0>, <mechanics:bursting_powder>, <minecraft:sand:0>],
// [null, <minecraft:sand:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_gravel>, [
// [null, <minecraft:gravel:0>, null],
// [<minecraft:gravel:0>, <mechanics:bursting_powder>, <minecraft:gravel:0>],
// [null, <minecraft:gravel:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_cobblestone>, [
// [null, <minecraft:cobblestone:0>, null],
// [<minecraft:cobblestone:0>, <mechanics:bursting_powder>, <minecraft:cobblestone:0>],
// [null, <minecraft:cobblestone:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_snow>, [
// [null, <minecraft:snow:0>, null],
// [<minecraft:snow:0>, <mechanics:bursting_powder>, <minecraft:snow:0>],
// [null, <minecraft:snow:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_andesite>, [
// [null, <minecraft:stone:5>, null],
// [<minecraft:stone:5>, <mechanics:bursting_powder>, <minecraft:stone:5>],
// [null, <minecraft:stone:5>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_granite>, [
// [null, <minecraft:stone:1>, null],
// [<minecraft:stone:1>, <mechanics:bursting_powder>, <minecraft:stone:1>],
// [null, <minecraft:stone:1>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_soul_sand>, [
// [null, <minecraft:soul_sand:0>, null],
// [<minecraft:soul_sand:0>, <mechanics:bursting_powder>, <minecraft:soul_sand:0>],
// [null, <minecraft:soul_sand:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_glass>, [
// [null, <minecraft:glass:0>, null],
// [<minecraft:glass:0>, <mechanics:bursting_powder>, <minecraft:glass:0>],
// [null, <minecraft:glass:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_sandstone>, [
// [null, <minecraft:sandstone:0>, null],
// [<minecraft:sandstone:0>, <mechanics:bursting_powder>, <minecraft:sandstone:0>],
// [null, <minecraft:sandstone:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_diorite>, [
// [null, <minecraft:stone:3>, null],
// [<minecraft:stone:3>, <mechanics:bursting_powder>, <minecraft:stone:3>],
// [null, <minecraft:stone:3>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_grass>, [
// [null, <minecraft:grass:0>, null],
// [<minecraft:grass:0>, <mechanics:bursting_powder>, <minecraft:grass:0>],
// [null, <minecraft:grass:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_red_sand>, [
// [null, <minecraft:sand:1>, null],
// [<minecraft:sand:1>, <mechanics:bursting_powder>, <minecraft:sand:1>],
// [null, <minecraft:sand:1>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_purpur>, [
// [null, <minecraft:purpur_block:0>, null],
// [<minecraft:purpur_block:0>, <mechanics:bursting_powder>, <minecraft:purpur_block:0>],
// [null, <minecraft:purpur_block:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_glowstone>, [
// [null, <minecraft:glowstone:0>, null],
// [<minecraft:glowstone:0>, <mechanics:bursting_powder>, <minecraft:glowstone:0>],
// [null, <minecraft:glowstone:0>, null],
// ]);
// recipes.addShaped(<mechanics:burst_seed_netherrack>, [
// [null, <minecraft:netherrack:0>, null],
// [<minecraft:netherrack:0>, <mechanics:bursting_powder>, <minecraft:netherrack:0>],
// [null, <minecraft:netherrack:0>, null],
// ]);

recipes.addShaped(<mechanics:empty_rod>, [
[<mechanics:heavy_nugget>, <ore:blockGlass>, <mechanics:heavy_nugget>],
[<mechanics:heavy_nugget>, <ore:blockGlass>, <mechanics:heavy_nugget>],
[<mechanics:heavy_nugget>, <ore:blockGlass>, <mechanics:heavy_nugget>],
]);