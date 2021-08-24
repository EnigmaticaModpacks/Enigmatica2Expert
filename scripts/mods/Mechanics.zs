import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

# Heavy mix lump
recipes.remove(<mechanics:heavy_mesh> * 2);
craft.shapeless(<mechanics:heavy_mesh> * 4, "CAABB", {
  A: <ore:dustLead>,
  B: <ore:dustQuartzBlack>,
  C: <ore:bitumen>,
});

# Melting heavy metal
scripts.process.melt(<mechanics:heavy_nugget>, <liquid:heavy_metal> * 16,   "No Exceptions");
scripts.process.melt(<mechanics:heavy_ingot>,  <liquid:heavy_metal> * 144,  "No Exceptions");
scripts.process.melt(<mechanics:heavy_block>,  <liquid:heavy_metal> * 1296, "No Exceptions");

# Heavy Crushing block
val compressed1 = <mechanics:heavy_block>;
val compressed2 = <additionalcompression:charcoal_compressed:1>;
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

addBurstSeedRecipe(<enderio:block_infinity>, <bigreactors:dustcyanite>, <mechanics:burst_seed_grainsofinfinity>);
addBurstSeedRecipe(<enderio:block_infinity>, <forestry:phosphor>      , <mechanics:burst_seed_grainsofinfinity>);
addBurstSeedRecipe(<contenttweaker:blasted_coal>, <thermalfoundation:material:162>, <mechanics:burst_seed_black_iron>);

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
mods.tconstruct.Melting.removeRecipe(<liquid:refined_obsidian>);
mods.tconstruct.Melting.removeRecipe(<liquid:refined_glowstone>);

# Remove melting in other machines
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedobsidian> * 144);
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedglowstone> * 144);
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedobsidian> * 16);
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedglowstone> * 16);
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedobsidian> * 1296);
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedglowstone> * 1296);

# Add recipes for high-end machines
scripts.process.melt(<ore:nuggetRefinedObsidian>, <liquid:refined_obsidian>  *   16, "only: Crucible");
scripts.process.melt(<ore:nuggetRefinedGlowstone>,<liquid:refined_glowstone> *   16, "only: Crucible");
scripts.process.melt(<ore:ingotRefinedObsidian>,  <liquid:refined_obsidian>  *  144, "only: Crucible");
scripts.process.melt(<ore:ingotRefinedGlowstone>, <liquid:refined_glowstone> *  144, "only: Crucible");
scripts.process.melt(<ore:blockRefinedObsidian>,  <liquid:refined_obsidian>  * 1296, "only: Crucible");
scripts.process.melt(<ore:blockRefinedGlowstone>, <liquid:refined_glowstone> * 1296, "only: Crucible");

# Also recipe added in ChemicalReactor.xml
# Add Tube recipes
mods.mechanics.addTubeRecipe([<mekanism:basicblock:2>] as IItemStack[], <liquid:refined_obsidian> * 1000);
mods.mechanics.addTubeRecipe([<mekanism:basicblock:4>] as IItemStack[], <liquid:refined_glowstone> * 1000);

# Add advanced liquid recipes
scripts.process.solution([<thermalfoundation:material:770>], [<liquid:diamond> * 66], [<liquid:refined_obsidian> * 144], null, "except: vat");
scripts.process.solution([<mekanism:dust:2>], [<liquid:glowstone> * 250], [<liquid:refined_glowstone> * 144], null, "except: vat");

// 
// Mystical Agriadditions metling recipes probably added
//  AFTER crafttweaker. That means they cant be changed
// 
// # ----------------------------------
// # Mystical Agriculture metals melting only in tube
// # ----------------------------------

// function remakeIntoTube(index as int, liquid as ILiquidStack) {
//   # Items
//   var nugget= itemUtils.getItem("mysticalagriculture:crafting", 39 + index);
//   var ingot = itemUtils.getItem("mysticalagriculture:crafting", 32 + index);
//   var block = itemUtils.getItem("mysticalagriculture:ingot_storage", index);
//   utils.log(["nugget.displayName =>", nugget.displayName]);

//   # Removing
//   mods.tconstruct.Melting.removeRecipe(liquid, nugget);
//   mods.tconstruct.Melting.removeRecipe(liquid, ingot );
//   mods.tconstruct.Melting.removeRecipe(liquid, block );

//   # Adding
//   mods.mechanics.addTubeRecipe([block] as IItemStack[], liquid * 1000);
// }

// remakeIntoTube(0, <liquid:base_essence>);
// remakeIntoTube(1, <liquid:inferium>);
// remakeIntoTube(2, <liquid:prudentium>);
// remakeIntoTube(3, <liquid:intermedium>);
// remakeIntoTube(4, <liquid:superium>);
// remakeIntoTube(5, <liquid:supremium>);
