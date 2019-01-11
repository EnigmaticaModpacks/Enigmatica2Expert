import mods.jei.JEI.removeAndHide as rh;
#modloaded nuclearcraft
print("--- loading NuclearCraft.zs ---");

# *======= Recipes =======*

# Rhodochrosite
	mods.actuallyadditions.AtomicReconstructor.addRecipe(<nuclearcraft:gem>, <biomesoplenty:gem:1>, 15000);

# Fluorite
	mods.actuallyadditions.AtomicReconstructor.addRecipe(<nuclearcraft:gem:2>, <biomesoplenty:gem:2>, 15000);

# Rock Crusher
	recipes.remove(<nuclearcraft:rock_crusher_idle>);
	recipes.addShapedMirrored("Rock Crusher", 
	<nuclearcraft:rock_crusher_idle>, 
	[[<ore:plateDU>, <ore:motor>, <ore:plateDU>],
	[<ore:actuator>, <ore:chassis>, <ore:actuator>], 
	[<ore:plateDU>, <ore:motor>, <ore:plateDU>]]);

# Clay Dust
	mods.nuclearcraft.manufactory.addRecipe(<minecraft:clay>, <ic2:dust:1> * 4);
	mods.nuclearcraft.manufactory.removeRecipeWithOutput(<ic2:dust:1> * 2);

# A slight buff to the Deuterium recipe
	mods.nuclearcraft.electrolyser.addRecipe([<liquid:heavywater> * 1000, <liquid:deuterium> * 500,  <liquid:deuterium> * 500, <liquid:oxygen> * 500, <liquid:tritium> * 50]);
	mods.nuclearcraft.electrolyser.addRecipe([<liquid:ic2heavy_water> * 1000, <liquid:deuterium> * 500,  <liquid:deuterium> * 500, <liquid:oxygen> * 500, <liquid:tritium> * 50]);
	mods.nuclearcraft.electrolyser.addRecipe([<liquid:water> * 1000, <liquid:hydrogen> * 500, <liquid:hydrogen> * 500,  <liquid:deuterium> * 50, <liquid:oxygen> * 500]);
	mods.nuclearcraft.electrolyser.removeRecipeWithOutput([<liquid:deuterium> * 950, <liquid:oxygen> * 500, <liquid:tritium> * 50, null]);
	mods.nuclearcraft.electrolyser.removeRecipeWithOutput([<liquid:hydrogen> * 950, <liquid:deuterium> * 50, <liquid:oxygen> * 500, null]);

# Basic Plating
	recipes.remove(<nuclearcraft:part>);
	recipes.addShapedMirrored("Basic Plating", 
	<nuclearcraft:part> * 4, 
	[[<ore:blockSheetmetalLead>, <ic2:casing:4>, <ore:blockSheetmetalLead>],
	[<ic2:casing:4>, <ore:blockGraphite>, <ic2:casing:4>], 
	[<ore:blockSheetmetalLead>, <ic2:casing:4>, <ore:blockSheetmetalLead>]]);

# Copper Solenoid
	recipes.remove(<nuclearcraft:part:4>);
	recipes.addShapedMirrored("Copper Solenoid", 
	<nuclearcraft:part:4> * 4, 
	[[<ore:plateCopper>, <ic2:casing:1>, <ore:plateCopper>],
	[<ore:stickAluminum>, <ic2:ingot>, <ore:stickAluminum>], 
	[<ore:plateCopper>, <ic2:casing:1>, <ore:plateCopper>]]);

# *======= Machine Integration =======*
	
//Manufactory:
//mods.nuclearcraft.manufactory.addRecipe(itemInput, itemOutput, processTime[optional]);
//mods.nuclearcraft.manufactory.removeRecipeWithOutput(itemOutput);

//Isotope Separator:
//mods.nuclearcraft.isotope_separator.addRecipe(itemInput, itemOutput1, itemOutput2, processTime[optional]);
//mods.nuclearcraft.isotope_separator.removeRecipeWithOutput(itemOutput1, itemOutput2);

//Decay Hastener:
//mods.nuclearcraft.decay_hastener.addRecipe(itemInput, itemOutput, processTime[optional]);
//mods.nuclearcraft.decay_hastener.removeRecipeWithOutput(itemOutput);

//Fuel Reprocessor:
//mods.nuclearcraft.fuel_reprocessor.addRecipe(itemInput, itemOutput1, itemOutput2, itemOutput3, itemOutput4, processTime[optional]);
//mods.nuclearcraft.fuel_reprocessor.removeRecipeWithOutput(itemOutput1, itemOutput2, itemOutput3, itemOutput4);

//Alloy Furnace:
//mods.nuclearcraft.alloy_furnace.addRecipe(itemInput1, itemInput2, itemOutput, processTime[optional]);
//mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(itemOutput);

//Infuser:
//mods.nuclearcraft.infuser.addRecipe(itemInput, fluidInput, itemOutput, processTime[optional]);
//mods.nuclearcraft.infuser.removeRecipeWithOutput(itemOutput);

//Melter:
//mods.nuclearcraft.melter.addRecipe(itemInput, fluidOutput, processTime[optional]);
//mods.nuclearcraft.melter.removeRecipeWithOutput(fluidOutput);

//Supercooler:
//mods.nuclearcraft.supercooler.addRecipe(fluidInput, fluidOutput, processTime[optional]);
//mods.nuclearcraft.supercooler.removeRecipeWithOutput(fluidOutput);

//Electrolyser:
//mods.nuclearcraft.electrolyser.addRecipe(fluidInput, fluidOutput1, fluidOutput2, fluidOutput3, fluidOutput4, processTime[optional]);
//mods.nuclearcraft.electrolyser.removeRecipeWithOutput(fluidOutput1, fluidOutput2, fluidOutput3, fluidOutput4);

//Irradiator:
//mods.nuclearcraft.irradiator.addRecipe(fluidInput1, fluidInput2, fluidOutput1, fluidOutput2, processTime[optional]);
//mods.nuclearcraft.irradiator.removeRecipeWithOutput(fluidOutput1, fluidOutput2);

//Ingot Former:
//mods.nuclearcraft.ingot_former.addRecipe(fluidInput, itemOutput, processTime[optional]);
//mods.nuclearcraft.ingot_former.removeRecipeWithOutput(itemOutput);

//Pressurizer:
//mods.nuclearcraft.pressurizer.addRecipe(itemInput, itemOutput, processTime[optional]);
//mods.nuclearcraft.pressurizer.removeRecipeWithOutput(itemOutput);

//Chemical Reactor:
//mods.nuclearcraft.chemical_reactor.addRecipe(fluidInput1, fluidInput2, fluidOutput1, fluidOutput2, processTime[optional]);
//mods.nuclearcraft.chemical_reactor.removeRecipeWithOutput(fluidOutput1, fluidOutput2);

//Salt Mixer:
//mods.nuclearcraft.salt_mixer.addRecipe(fluidInput1, fluidInput2, fluidOutput, processTime[optional]);
//mods.nuclearcraft.salt_mixer.removeRecipeWithOutput(fluidOutput);

//Crystallizer:
//mods.nuclearcraft.crystallizer.addRecipe(fluidInput, itemOutput, processTime[optional]);
//mods.nuclearcraft.crystallizer.removeRecipeWithOutput(itemOutput);

//Dissolver:
//mods.nuclearcraft.dissolver.addRecipe(itemInput, fluidInput, fluidOutput, processTime[optional]);
//mods.nuclearcraft.dissolver.removeRecipeWithOutput(fluidOutput);

//Fission:
//mods.nuclearcraft.fission.addRecipe(itemInput, itemOutput, baseTime, basePowerGen, baseHeatGen, guiName);
//mods.nuclearcraft.fission.removeRecipeWithOutput(itemOutput);

//Fusion:
//mods.nuclearcraft.fusion.addRecipe(fluidInput1, fluidInput2, fluidOutput1, fluidOutput2, fluidOutput3, fluidOutput4, comboFuelTime, comboPowerGen, comboHeatVar);
//mods.nuclearcraft.fusion.removeRecipeWithOutput(fluidOutput1, fluidOutput2, fluidOutput3, fluidOutput4);

# *======= Remove & Hide =======*
	
	rh(<nuclearcraft:ore>);
	rh(<nuclearcraft:ore:1>);
	rh(<nuclearcraft:ore:2>);
	rh(<nuclearcraft:ore:4>);
	rh(<nuclearcraft:dust>);
	rh(<nuclearcraft:dust:2>);
	rh(<nuclearcraft:dust:1>);
	rh(<nuclearcraft:ingot:4>);
	rh(<nuclearcraft:ingot:2>);
	rh(<nuclearcraft:ingot:1>);
	rh(<nuclearcraft:dust:4>);
	rh(<nuclearcraft:alloy>);
	rh(<nuclearcraft:alloy:5>);
	rh(<nuclearcraft:ingot>);
# *======= Recipes =======*

	
	print("--- NuclearCraft.zs initialized ---");