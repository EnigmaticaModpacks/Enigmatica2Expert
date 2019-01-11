import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IItemStack as IItemStack;
#modloaded immersiveengineering
print("--- loading ImmersiveEngineering.zs ---");

# Aluminum Scaffolding
	recipes.remove(<immersiveengineering:metal_decoration2:8>);
	recipes.addShapedMirrored("Aluminum Scaffolding", 
	<immersiveengineering:metal_decoration2:8> * 4, 
	[[<ore:stickAluminum>, null, null],
	[<ore:scaffoldingAluminium>, <ore:stickAluminum>, null], 
	[<ore:scaffoldingAluminium>, <ore:scaffoldingAluminium>, <ore:stickAluminum>]]);
	
# Steel Scaffolding
	recipes.remove(<immersiveengineering:metal_decoration2:7>);
	recipes.addShapedMirrored("Steel Scaffolding", 
	<immersiveengineering:metal_decoration2:7> * 4, 
	[[<ore:stickSteel>, null, null],
	[<ore:scaffoldingSteel>, <ore:stickSteel>, null], 
	[<ore:scaffoldingSteel>, <ore:scaffoldingSteel>, <ore:stickSteel>]]);

# Concrete Conversion recipes
	recipes.addShapeless("Concrete Sheet", <immersiveengineering:stone_device:3> * 8, [<immersiveengineering:stone_decoration:5>,<tconstruct:throwball:1>]);
	recipes.addShapedMirrored("Concrete Panel", <immersiveengineering:stone_device:4>, [[<immersiveengineering:stone_device:3>, null, null],[<immersiveengineering:stone_device:3>, null, null], [null, null, null]]);
	recipes.addShapedMirrored("Concrete Slab", <immersiveengineering:stone_decoration_slab:5>, [[<immersiveengineering:stone_device:4>, null, null],[<immersiveengineering:stone_device:4>, null, null], [null, null, null]]);

# Coke Dust Compatibility
	mods.actuallyadditions.Crusher.addRecipe(<immersiveengineering:material:17>, <thermalfoundation:material:802>);
	mods.actuallyadditions.Crusher.addRecipe(<immersiveengineering:material:17>, <immersiveengineering:material:6>);
	mods.extrautils2.Crusher.add(<immersiveengineering:material:17>, <thermalfoundation:material:802>);
	mods.extrautils2.Crusher.add(<immersiveengineering:material:17>, <immersiveengineering:material:6>);
	mods.mekanism.crusher.addRecipe(<thermalfoundation:material:802>, <immersiveengineering:material:17>);
	mods.mekanism.crusher.addRecipe(<immersiveengineering:material:6>, <immersiveengineering:material:17>);
	mods.thermalexpansion.Pulverizer.addRecipe(<immersiveengineering:material:17>, <thermalfoundation:material:802>, 4000);
	mods.thermalexpansion.Pulverizer.addRecipe(<immersiveengineering:material:17>, <immersiveengineering:material:6>, 4000);

# Energy Capacitors
	recipes.remove(<immersiveengineering:metal_device0:1>);
	recipes.addShaped("MV Capacitor", 
	<immersiveengineering:metal_device0:1>, 
	[[<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>],
	[<ore:ingotElectrum>, <immersiveengineering:metal_device0>, <ore:ingotElectrum>], 
	[<ore:plankTreatedWood>, <ore:blockRedstone>, <ore:plankTreatedWood>]]);
	
	recipes.remove(<immersiveengineering:metal_device0:2>);
	recipes.addShaped("HV Capacitor", 
	<immersiveengineering:metal_device0:2>, 
	[[<ore:ingotSteel>, <ore:ingotSteel>, <ore:ingotSteel>],
	[<ore:blockLead>, <immersiveengineering:metal_device0:1>, <ore:blockLead>], 
	[<ore:plankTreatedWood>, <ore:blockRedstone>, <ore:plankTreatedWood>]]);
	
# LV - MV Connectors/Relays
	recipes.addShapeless("LV - MV Connector", <immersiveengineering:connector:2>, [<immersiveengineering:connector>, <ore:ingotIron>]);
	recipes.addShapeless("LV - MV Relay", <immersiveengineering:connector:3>, [<immersiveengineering:connector:1>, <ore:ingotIron>]);

# MV - HV Connectors/Relays
	recipes.addShapeless("MV - HV Connector", <immersiveengineering:connector:4>, [<immersiveengineering:connector:2>, <ore:ingotAluminium>]);
	recipes.addShapeless("MV - HV Relay", <immersiveengineering:connector:5>, [<immersiveengineering:connector:3>, <ore:ingotAluminium>]);

# Coke Bricks
	recipes.remove(<immersiveengineering:stone_decoration>);
	recipes.addShaped("Coke Brick", 
	<immersiveengineering:stone_decoration> * 3, 
	[[<ore:clayPorcelain>, <ore:ingotBrick>, <ore:clayPorcelain>],
	[<ore:ingotBrick>, <ore:sandstone>, <ore:ingotBrick>], 
	[<ore:clayPorcelain>, <ore:ingotBrick>, <ore:clayPorcelain>]]);
	
# Redstone Engineering Block
	recipes.remove(<immersiveengineering:metal_decoration0:3>);
	recipes.addShaped("Redstone Engineering Block", 
	<immersiveengineering:metal_decoration0:3> * 2, 
	[[<ore:plateCopper>, <ore:ingotConstantan>, <ore:plateCopper>],
	[<ore:ingotConstantan>, <ore:gearRedstone>, <ore:ingotConstantan>], 
	[<ore:plateCopper>, <ore:ingotConstantan>, <ore:plateCopper>]]);

# Light Engineering Block
	recipes.remove(<immersiveengineering:metal_decoration0:4>);
	recipes.addShaped("Light Engineering Block", 
	<immersiveengineering:metal_decoration0:4> * 4, 
	[[<ore:plateBronze>, <ore:alloyAdvanced>, <ore:plateBronze>],
	[<ore:alloyAdvanced>, <immersiveengineering:metal_decoration1:5>, <ore:alloyAdvanced>], 
	[<ore:plateBronze>, <ore:alloyAdvanced>, <ore:plateBronze>]]);

# Heavy Engineering Block
	recipes.remove(<immersiveengineering:metal_decoration0:5>);
	recipes.addShaped("Heavy Engineering Block", 
	<immersiveengineering:metal_decoration0:5> * 4, 
	[[<ore:plateUranium>, <ore:alloyElite>, <ore:plateUranium>],
	[<immersiveengineering:material:8>, <immersiveengineering:metal_decoration1:1>, <immersiveengineering:material:8>], 
	[<ore:plateUranium>, <ore:alloyElite>, <ore:plateUranium>]]);

# Garden Cloche
	recipes.remove(<immersiveengineering:metal_device1:13>);
	mods.forestry.ThermionicFabricator.addCast(<immersiveengineering:metal_device1:13>, 
	[[null, <immersiveengineering:connector>, null],
	[null, <ic2:upgrade:4>, null], 
	[<ore:plankTreatedWood>, <immersiveengineering:metal_decoration0:5>, <ore:plankTreatedWood>]], 
	<liquid:glass> * 4000);
	

# *======= Arc Furnace =======*

	#OutputStack, InputStack, SlagOutput, Time in Ticks, Energy per Tick, AdditiveArray, RecipeTypeString 
	#Either create your own NEI pages with custom strings or use original ones
	#mods.immersiveengineering.ArcFurnace.addRecipe(<minecraft:gravel>, <minecraft:dirt> * 9, <immersiveengineering:material:13>, 4600, 3600, [<immersiveengineering:fluidContainers:4>], "Purifying");
	#OutputStack
	#mods.immersiveengineering.ArcFurnace.removeRecipe(<immersiveengineering:metal:7>);

# *======= Blast Furnace =======*

	#Smelting
	#OutputStack, InputStack, Time in Ticks, SlagOutput
	#mods.immersiveengineering.BlastFurnace.addRecipe(<immersiveengineering:material:12>, <immersiveengineering:material:11>, 4800, <immersiveengineering:material:13>);
	#OutputStack
	#mods.immersiveengineering.BlastFurnace.removeRecipe(<immersiveengineering:metal:7>);
	#Fuel
	#InputStack, Time in Ticks
	#mods.immersiveengineering.BlastFurnace.addFuel(<immersiveengineering:metal:17>, 1200);
	#InputStack
	#mods.immersiveengineering.BlastFurnace.removeFuel(<immersiveengineering:material:6>);

# *======= Bottling Machine =======*

	#OutputStack, InputStack, InputFluid
	#mods.immersiveengineering.BottlingMachine.addRecipe(<minecraft:packed_ice>, <minecraft:ice>, <liquid:water> * 1000);
	#OutputStack
	#mods.immersiveengineering.BottlingMachine.removeRecipe(<minecraft:water_bucket>); 

# *======= Coke Oven =======*

	#OutputStack, FuelOutput, InputStack, Time in Ticks
	#mods.immersiveengineering.CokeOven.addRecipe(<minecraft:coal:1> * 2, 500, <minecraft:chest>, 1800);
	#OutputStack
	#mods.immersiveengineering.CokeOven.removeRecipe(<immersiveengineering:material:6>);

# *======= Crusher =======*

	#OutputStack1, InputStack, Energy, OutputStack2, OutputStack2Chance #Chance in Decimals
	#mods.immersiveengineering.Crusher.addRecipe(<immersiveengineering:metal> * 8, <immersiveengineering:storage:8>, 8000, <minecraft:iron_ingot>, 0.5);
	#OutputStack
	#mods.immersiveengineering.Crusher.removeRecipe(<minecraft:blaze_powder>);

# *======= Excavator =======*

	#MineralString, MineralWeight, FailChance, OreStringArray, OreChanceArray, DimensionIDArray, isWhitelistOrBlacklist #true=blacklist; false=whitelist
	#mods.immersiveengineering.Excavator.addMineral("Sediment", 30, 15, ["sand", "sandstone"], [50, 15], [0, 1], false);
	#MineralString
	#mods.immersiveengineering.Excavator.removeMineral("Bauxite");
	#MineralString + OreString, Chance
	#mods.immersiveengineering.Excavator.getMineral("Magnetite").addOre("oreNickel", 0.75);
	#MineralString + OreString
	#mods.immersiveengineering.Excavator.getMineral("Magnetite").removeOre("oreGold");

# *======= Fermenter =======*

	#OutputStack, OutputFluid, InputStack, Time in Ticks
	#mods.immersiveengineering.Fermenter.addRecipe(<minecraft:blaze_powder>, <liquid:lava> * 80, <minecraft:nether_wart>, 80);
	#OutputStack
	#mods.immersiveengineering.Fermenter.removeItemRecipe(<minecraft:blaze_powder>);
	#OutputFluid
	#mods.immersiveengineering.Fermenter.removeFluidRecipe(<liquid:ethanol>);

# *======= Metal Press =======*

	#OutputStack, InputStack, MoldStack, Energy, SizeValue
	#mods.immersiveengineering.MetalPress.addRecipe(<minecraft:stone_slab> * 2, <minecraft:stone>, <immersiveengineering:mold>, 500, 2);


	#OutputStack
	#mods.immersiveengineering.MetalPress.removeRecipe(<immersiveengineering:metal:30>);
	#MoldStack
	#mods.immersiveengineering.MetalPress.removeRecipeByMold(<immersiveengineering:mold:2>);

# *======= Refinery =======*

	#OutputFluid, InputFluid1, InputFluid2
	#mods.immersiveengineering.Refinery.addRecipe(<liquid:lava> * 16, <liquid:plantoil> * 8, <liquid:biodiesel> * 8);
	#OutputStack
	#mods.immersiveengineering.Refinery.removeRecipe(<liquid:biodiesel>);

# *======= Squeezer =======*

	#OutputStack, OutputFluid, InputStack, Time in Ticks
	#mods.immersiveengineering.Squeezer.addRecipe(<minecraft:melon_seeds> * 4, <liquid:water> * 500, <minecraft:melon_block>, 240);
	#OutputStack
	#mods.immersiveengineering.Squeezer.removeItemRecipe(<minecraft:melon_seeds>);
	#OutputFluid
	#mods.immersiveengineering.Squeezer.removeFluidRecipe(<liquid:plantoil>);
	
		print("--- ImmersiveEngineering.zs initialized ---");