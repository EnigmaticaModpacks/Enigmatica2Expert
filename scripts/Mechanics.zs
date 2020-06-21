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

recipes.addShaped(<mechanics:empty_rod>, [
[<mechanics:heavy_nugget>, <ore:blockGlass>, <mechanics:heavy_nugget>],
[<mechanics:heavy_nugget>, <ore:blockGlass>, <mechanics:heavy_nugget>],
[<mechanics:heavy_nugget>, <ore:blockGlass>, <mechanics:heavy_nugget>],
]);