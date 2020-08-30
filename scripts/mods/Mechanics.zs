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

# Blasting powder
recipes.addShapeless(<mechanics:bursting_powder>, [
  <ore:gunpowder>, <mechanics:fuel_dust>, <appliedenergistics2:material:45>
]);


function addBurstSeedRecipe(input as IItemStack, additive as IItemStack, output as IItemStack) {
  craft.remake(output, ["pretty",
    "A B A",
    "B C B",
    "A B A"], {
    A: !isNull(additive) ? additive : <mechanics:bursting_powder>,
    B: input,
    C: <mechanics:bursting_powder>,
  });
}

addBurstSeedRecipe(<contenttweaker:compressed_crushed_andesite>, null, <mechanics:burst_seed_andesite>);
addBurstSeedRecipe(<contenttweaker:compressed_crushed_diorite> , null, <mechanics:burst_seed_diorite>);
addBurstSeedRecipe(<contenttweaker:compressed_crushed_granite> , null, <mechanics:burst_seed_granite>);
addBurstSeedRecipe(<enderio:block_infinity>, <bigreactors:dustcyanite>, <mechanics:burst_seed_grainsofinfinity>);

# Empty rod remake
recipes.addShaped(<mechanics:empty_rod>, [
[<mechanics:heavy_nugget>, <ore:blockGlass>, <mechanics:heavy_nugget>],
[<mechanics:heavy_nugget>, <ore:blockGlass>, <mechanics:heavy_nugget>],
[<mechanics:heavy_nugget>, <ore:blockGlass>, <mechanics:heavy_nugget>],
]);


# ----------------------------------
# Harder Refined obsidian and glowstone recipes
# ----------------------------------

# Remove melting in Smeltery
mods.tconstruct.Melting.removeRecipe(<liquid:refinedobsidian>);
mods.tconstruct.Melting.removeRecipe(<liquid:refinedglowstone>);

# Remove melting in other machines
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedobsidian> * 144);
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedglowstone> * 144);
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedobsidian> * 16);
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedglowstone> * 16);
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedobsidian> * 1296);
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedglowstone> * 1296);

# Also recipe added in ChemicalReactor.xml
# Add Tube recipes
mods.mechanics.addTubeRecipe([<mekanism:basicblock:2>] as IItemStack[], <liquid:refinedobsidian> * 1000);
mods.mechanics.addTubeRecipe([<mekanism:basicblock:4>] as IItemStack[], <liquid:refinedglowstone> * 1000);

# Add advanced liquid recipes
scripts.process.solution([<thermalfoundation:material:770>], [<liquid:diamond> * 66], [<liquid:refinedobsidian> * 144], null, "except: vat");
scripts.process.solution([<mekanism:dust:2>], [<liquid:glowstone> * 250], [<liquid:refinedglowstone> * 144], null, "except: vat");

