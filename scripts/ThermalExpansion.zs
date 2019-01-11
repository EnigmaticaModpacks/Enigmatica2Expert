import crafttweaker.item.IItemStack;
#modloaded thermalexpansion
print("--- loading ThermalExpansion.zs ---");

/*
	FusedQuartz cannot work???

# Hardened Glass Fix
	for fusedQuartz in <ore:fusedQuartz>.items {
		for dust in <ore:dustCopper>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass:0> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
		for dust in <ore:dustSilver>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass:2> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
		for dust in <ore:dustLead>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass:3> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
		for dust in <ore:dustElectrum>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass_alloy:1> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
		for dust in <ore:dustPlatinum>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass:6> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
		for dust in <ore:dustBronze>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass_alloy:3> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
		for dust in <ore:dustTin>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass:1> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
		for dust in <ore:dustEnderium>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass_alloy:7> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
		for dust in <ore:dustSteel>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass_alloy:0> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
		for dust in <ore:dustConstantan>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass_alloy:4> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
		for dust in <ore:dustAluminum>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass:4> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
		for dust in <ore:dustInvar>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass_alloy:2> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
		for dust in <ore:dustNickel>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass:5> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
		for dust in <ore:dustIridium>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass:7> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
		for dust in <ore:dustLumium>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass_alloy:6> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
		for dust in <ore:dustSignalum>.items {
			mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:glass_alloy:5> * 2, dust, fusedQuartz, 6000, <thermalfoundation:material:865>, 15);
		}
	}
*/

# Nullifier 
	recipes.remove(<thermalexpansion:device:1>);
	recipes.addShaped("Nullifier", 
	<thermalexpansion:device:1>, 
	[[<ore:ingotTin>, <ore:ingotTin>, <ore:ingotTin>],
	[<ore:ingotTin>, <extrautils2:trashcan>, <ore:ingotTin>], 
	[<ore:ingotTin>, <ore:ingotTin>, <ore:ingotTin>]]);

# Igneous Extruder
	recipes.remove(<thermalexpansion:machine:15>);
	recipes.addShaped("Igneous Extruder", 
	<thermalexpansion:machine:15>, 
	[[null, <ore:blockGlass>, null],
	[<ore:ingotInvar>, <thermalexpansion:frame:64>, <ore:ingotInvar>], 
	[<ore:gearCopper>, <immersiveengineering:metal_decoration0>, <ore:gearCopper>]]);

# Reinforced Cell Frame (Empty)
	recipes.addShapedMirrored("Reinforced Cell Frame", 
	<thermalexpansion:frame:130>, 
	[[<ore:gearSilver>, <thermalfoundation:material:515>, <ore:gearSilver>],
	[<ore:plateElectrumFlux>, <thermalexpansion:frame:129>, <ore:plateElectrumFlux>], 
	[<ore:gemCrystalFlux>, <tconstruct:large_plate>.withTag({Material: "electrum"}), <ore:gemCrystalFlux>]]);

# Reinforced Cell Frame (Full)
	mods.thermalexpansion.Transposer.addFillRecipe(<thermalexpansion:frame:146>, <thermalexpansion:frame:130>, <liquid:lumium> * 576, 250000);

# Signalum Cell Frame (Empty)
	recipes.addShapedMirrored("Signalum Cell Frame Empty", 
	<thermalexpansion:frame:131>, 
	[[<ore:plateSignalum>, <ore:crystalCinnabar>, <ore:plateSignalum>],
	[<thermalfoundation:material:832>, <thermalexpansion:frame:146>, <thermalfoundation:material:832>], 
	[<ore:plateSignalum>, <ore:crystalSlagRich>, <ore:plateSignalum>]]);

# Signalum Cell Frame (Full)
	mods.thermalexpansion.InductionSmelter.addRecipe(<thermalexpansion:frame:147>, <thermalexpansion:frame:131>, <minecraft:redstone_block> * 40, 100000);

# Resonant Cell Frame (Empty)
	mods.forestry.ThermionicFabricator.addCast(<thermalexpansion:frame:132>, 
	[[<thermalfoundation:material:166>, <actuallyadditions:block_misc:8>, <thermalfoundation:material:166>],
	[<thermalfoundation:glass_alloy:7>, <thermalexpansion:frame:147>, <thermalfoundation:glass_alloy:7>],
	[<thermalfoundation:material:1028>, <thermalfoundation:material:1028>, <thermalfoundation:material:1028>]], <liquid:glass> * 4000);

# Resonant Cell Frame (Full)
	mods.extendedcrafting.CombinationCrafting.addRecipe(<thermalexpansion:frame:148>, 
	100000000, 1000000, 
	<thermalexpansion:frame:132>, 
	[<gendustry:genetics_processor>, <extrautils2:ingredients:5>, <ic2:plate:16>,
	<ic2:lapotron_crystal>.anyDamage(), <forestry:thermionic_tubes:12>, <forestry:crafting_material:1>,
	<mekanismgenerators:reactor:1>, <environmentaltech:structure_frame_1>, <rftools:infused_diamond>,
	<mekanism:controlcircuit:3>, <thermalfoundation:material:295>, <environmentaltech:litherite_crystal>,
	<nuclearcraft:part:6>, <nuclearcraft:gem:1>]);
	
# Mana Dust
	recipes.addShapedMirrored("Mana Dust", 
	<thermalfoundation:material:1028> * 2, 
	[[<ore:manaDiamond>, <ore:dustCryotheum>, <ore:manaDiamond>],
	[<ore:dustPyrotheum>, <ore:powderMana>, <ore:dustAerotheum>], 
	[<ore:manaDiamond>, <ore:dustPetrotheum>, <ore:manaDiamond>]]);

# Centrifugal Seperator
	recipes.remove(<thermalexpansion:machine:10>);
	recipes.addShaped("Centrifugal Seperator", 
	<thermalexpansion:machine:10>, 
	[[null, <forestry:centrifuge>, null],
	[<ore:ingotConstantan>, <thermalexpansion:frame>, <ore:ingotConstantan>], 
	[<ore:gearCopper>, <thermalfoundation:material:513>, <ore:gearCopper>]]);

# Fluid Transposer
	recipes.remove(<thermalexpansion:machine:8>);
	recipes.addShaped("Fluid Transposer", 
	<thermalexpansion:machine:8>, 
	[[<thermalexpansion:tank>, <forestry:carpenter>, <thermalexpansion:tank>],
	[<ore:blockGlass>, <thermalexpansion:frame>, <ore:blockGlass>], 
	[<ore:gearInvar>, <thermalfoundation:material:513>, <ore:gearInvar>]]);

# Sawmill
	recipes.remove(<thermalexpansion:machine:2>);
	recipes.addShaped("Sawmill", 
	<thermalexpansion:machine:2>, 
	[[null, <mekanism:machineblock2:5>, null],
	[<ore:logWood>, <thermalexpansion:frame>, <ore:logWood>], 
	[<ore:gearCopper>, <thermalfoundation:material:513>, <ore:gearCopper>]]);

# Pulverizer
	recipes.remove(<thermalexpansion:machine:1>);
	recipes.addShaped("Pulverizer", 
	<thermalexpansion:machine:1>, 
	[[<ore:craftingPiston>, <actuallyadditions:block_grinder>, <ore:craftingPiston>],
	[<tconstruct:large_plate>.withTag({Material: "flint"}), <thermalexpansion:frame>, <tconstruct:large_plate>.withTag({Material: "flint"})], 
	[<ore:gearCopper>, <thermalfoundation:material:513>, <ore:gearCopper>]]);
	
	recipes.addShaped("Pulverizer2", 
	<thermalexpansion:machine:1>, 
	[[<ore:craftingPiston>, <actuallyadditions:block_grinder_double>, <ore:craftingPiston>],
	[<tconstruct:large_plate>.withTag({Material: "flint"}), <thermalexpansion:frame>, <tconstruct:large_plate>.withTag({Material: "flint"})], 
	[<ore:gearCopper>, <thermalfoundation:material:513>, <ore:gearCopper>]]);

# Primal Mana
	mods.tconstruct.Alloy.addRecipe(<liquid:mana> * 125, [<liquid:mirion> * 18, <liquid:osgloglas> * 18, <liquid:ic2coolant> * 125]);

# Mana Infused Ingot&Block
	mods.mekanism.infuser.addRecipe("DIAMOND", 20, <botania:manaresource>, <thermalfoundation:material:136>);
	mods.mekanism.infuser.addRecipe("DIAMOND", 160, <botania:storage>, <thermalfoundation:storage:8>);

# Energy Cell Frame
	recipes.remove(<thermalexpansion:frame:128>);
	mods.mekanism.infuser.addRecipe("REDSTONE", 400, <thermalexpansion:frame>, <thermalexpansion:frame:128>);

# Machine Frame
	recipes.remove(<thermalexpansion:frame>);
	mods.forestry.ThermionicFabricator.addCast(<thermalexpansion:frame> * 2, 
	[[<actuallyadditions:item_crystal:5>, <rftools:machine_frame>, <actuallyadditions:item_crystal:5>],
	[<immersiveengineering:metal_decoration0:5>, <thermalexpansion:frame:64>, <actuallyadditions:block_misc:9>], 
	[<actuallyadditions:item_crystal:5>, <teslacorelib:machine_case>, <actuallyadditions:item_crystal:5>]], 
	<liquid:glass> * 6000);
	
# Removing craftable Bronze 
	recipes.removeShapeless(<thermalfoundation:material:163> * 4, 
	[<ore:ingotTin>, <ore:ingotCopper>, <ore:ingotCopper>, <ore:ingotCopper>]);

# Redstone Reception Coil
	recipes.remove(<thermalfoundation:material:513>);
	mods.actuallyadditions.AtomicReconstructor.addRecipe(<thermalfoundation:material:513> * 1, <immersiveengineering:metal_decoration0>, 25000);
	mods.mekanism.infuser.addRecipe("REDSTONE", 160, <minecraft:gold_ingot>, <thermalfoundation:material:513>);

# Redstone Transmission Coil
	recipes.remove(<thermalfoundation:material:514>);
	mods.actuallyadditions.AtomicReconstructor.addRecipe(<thermalfoundation:material:514>, <immersiveengineering:wirecoil:2>, 5000);
	mods.mekanism.infuser.addRecipe("REDSTONE", 160, <thermalfoundation:material:130>, <thermalfoundation:material:514>);
	
# Redstone Conductance Coil
	recipes.remove(<thermalfoundation:material:515>);
	mods.actuallyadditions.AtomicReconstructor.addRecipe(<thermalfoundation:material:515> * 1, <immersiveengineering:metal_decoration0:1>, 25000);
	mods.mekanism.infuser.addRecipe("REDSTONE", 160, <thermalfoundation:material:161>, <thermalfoundation:material:515>);

# Removing Netherrack -> Gravel Pulverizer recipes
	mods.thermalexpansion.Pulverizer.removeRecipe(<minecraft:netherrack>);

# Making TE alloys meltable
	mods.thermalexpansion.Crucible.addRecipe(<liquid:signalum> * 144, <thermalfoundation:material:165>, 5000);
	mods.thermalexpansion.Crucible.addRecipe(<liquid:lumium> * 144, <thermalfoundation:material:166>, 5000);
	mods.thermalexpansion.Crucible.addRecipe(<liquid:enderium> * 144, <thermalfoundation:material:167>, 5000);

# Signalum Ingots
	mods.thermalexpansion.Transposer.addFillRecipe(<thermalfoundation:material:165>, <nuclearcraft:alloy:7>, <liquid:redstone> * 250, 5000);
	mods.thermalexpansion.InductionSmelter.addRecipe(<nuclearcraft:alloy:7> * 4, <thermalfoundation:material:130>, <thermalfoundation:material:128> * 3, 15000);

# Lumium Ingots
	mods.thermalexpansion.Transposer.addFillRecipe(<thermalfoundation:material:166>, <nuclearcraft:alloy:8>, <liquid:glowstone> * 250, 5000);
	mods.thermalexpansion.InductionSmelter.addRecipe(<nuclearcraft:alloy:8> * 4, <thermalfoundation:material:130>, <thermalfoundation:material:129> * 3, 20000);

# Enderium Ingots
	mods.thermalexpansion.Transposer.addFillRecipe(<thermalfoundation:material:167>, <nuclearcraft:alloy:9>, <liquid:ender> * 250, 10000);
	mods.thermalexpansion.InductionSmelter.addRecipe(<nuclearcraft:alloy:9> * 4, <thermalfoundation:material:134>, <thermalfoundation:material:131> * 3, 25000);

# Hardened Cell Frame
	mods.actuallyadditions.Empowerer.addRecipe(<thermalexpansion:frame:129>, <thermalexpansion:frame:128>, <immersiveengineering:material:2>, <thermalfoundation:material:354>, <thermalfoundation:material:290>, <mekanism:basicblock:8>, 2500000, 200, [0.25, 0.25, 0.29]);

# *======= Compactor =======*

#Mint
	#mods.thermalexpansion.Compactor.addMintRecipe(IItemStack output, IItemStack input, int energy);
	#mods.thermalexpansion.Compactor.addMintRecipe(<minecraft:sand>, <minecraft:stick>, 1500);


	#mods.thermalexpansion.Compactor.removeMintRecipe(IItemStack input);
	#mods.thermalexpansion.Compactor.removeMintRecipe(<thermalfoundation:material:167>);

#Press
	#mods.thermalexpansion.Compactor.addPressRecipe(IItemStack output, IItemStack input, int energy);
	#mods.thermalexpansion.Compactor.addPressRecipe(<minecraft:sand>, <minecraft:apple>, 1500);

	#mods.thermalexpansion.Compactor.removePressRecipe(IItemStack input);
	#mods.thermalexpansion.Compactor.removePressRecipe(<thermalfoundation:material:167>);

#Storage
	#mods.thermalexpansion.Compactor.addStorageRecipe(IItemStack output, IItemStack input, int energy);
	#mods.thermalexpansion.Compactor.addStorageRecipe(<minecraft:sand>, <minecraft:arrow>, 1500);

	#mods.thermalexpansion.Compactor.removeStorageRecipe(IItemStack input);
	#mods.thermalexpansion.Compactor.removeStorageRecipe(<thermalfoundation:material:167>);
	
#Gear
	#mods.thermalexpansion.Compactor.addGearRecipe(IItemStack output, IItemStack input, int energy);
	#mods.thermalexpansion.Compactor.addGearRecipe(<minecraft:sand>, <minecraft:arrow>, 1500);
	
	#mods.thermalexpansion.Compactor.removeGearRecipe(IItemStack input);
	#mods.thermalexpansion.Compactor.removeGearRecipe(<thermalfoundation:material:167>);

# *======= Fluid Transposer =======*

//mods.thermalexpansion.Transposer.addExtractRecipe(ILiquidStack output, IItemStack input, int energy);
//mods.thermalexpansion.Transposer.addExtractRecipe(ILiquidStack output, IItemStack input, int energy, WeightedItemStack itemOut);
#mods.thermalexpansion.Transposer.addExtractRecipe(<liquid:water> * 250, <minecraft:leaves:0>, 360);
#mods.thermalexpansion.Transposer.addExtractRecipe(<liquid:water> * 250, <minecraft:leaves:1>, 360, <minecraft:leaves:0> % 30);

//mods.thermalexpansion.Transposer.addFillRecipe(IItemStack output, IItemStack input, ILiquidStack fluid, int energy);
#mods.thermalexpansion.Transposer.addFillRecipe(<minecraft:leaves:1>, <minecraft:leaves:0>, <liquid:water> * 200, 20);

# *======= Magma Crucible =======*

#mods.thermalexpansion.Crucible.addRecipe(ILiquidStack output, IItemStack input, int energy);
#mods.thermalexpansion.Crucible.addRecipe(<liquid:refined_oil>, <minecraft:diamond>, 50);

#mods.thermalexpansion.Crucible.removeRecipe(IItemStack input);
#mods.thermalexpansion.Crucible.removeRecipe(<minecraft:glowstone>);

# *======= Energetic Infuser =======*

//mods.thermalexpansion.Infuser.addRecipe(IItemStack output, IItemStack input, int energy);
#mods.thermalexpansion.Infuser.addRecipe(<minecraft:gold_ingot>, <minecraft:iron_ingot>, 1000);

//mods.thermalexpansion.Infuser.removeRecipe(IItemStack input);
#mods.thermalexpansion.Infuser.removeRecipe(<minecraft:gold_ore>);

# *======= Induction Smelter =======*

	#mods.thermalexpansion.InductionSmelter.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
	#mods.thermalexpansion.InductionSmelter.addRecipe(<minecraft:diamond>, <minecraft:stick>, <minecraft:iron_ore>, 1500, <minecraft:stone>, 20);

	#mods.thermalexpansion.InductionSmelter.removeRecipe(input);
	#mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:bucket>, <minecraft:sand>);

# *======= Insolator =======*

	#mods.thermalexpansion.Insolator.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
	#mods.thermalexpansion.Insolator.addRecipe(<minecraft:diamond>, <minecraft:stick>, <minecraft:iron_ore>, 1500, <minecraft:stone>, 20);

	#mods.thermalexpansion.Insolator.removeRecipe(IItemStack primaryInput, IItemStack secondaryInput);
	#mods.thermalexpansion.Insolator.removeRecipe(<minecraft:melon_seeds>, <thermalfoundation:fertilizer:1>);

# *======= Pulverizer =======*

	#mods.thermalexpansion.Pulverizer.addRecipe(IItemStack output, IItemStack input, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
	#mods.thermalexpansion.Pulverizer.addRecipe(<minecraft:diamond>, <minecraft:stick>, 1500, <minecraft:stone>, 20);

	#mods.thermalexpansion.Pulverizer.removeRecipe(IItemStack input);
	#mods.thermalexpansion.Pulverizer.removeRecipe(<thermalfoundation:material:136>);

# *======= Refinery =======*

	#mods.thermalexpansion.Refinery.addRecipe(ILiquidStack output, IItemStack outputItem, ILiquidStack input, int energy);
	#mods.thermalexpansion.Refinery.addRecipe(<liquid:lava>, <minecraft:diamond>,<liquid:water>, 50);

	#mods.thermalexpansion.Refinery.removeRecipe(ILiquidStack input);
	#mods.thermalexpansion.Refinery.removeRecipe(<liquid:resin>);

# *======= Sawmill =======*

	#mods.thermalexpansion.Sawmill.addRecipe(IItemStack output, IItemStack input, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
	#mods.thermalexpansion.Sawmill.addRecipe(<minecraft:diamond>, <minecraft:stick>, 1500, <minecraft:stone>, 20);

	#mods.thermalexpansion.Sawmill.removeRecipe(IItemStack input);
	#mods.thermalexpansion.Sawmill.removeRecipe(<minecraft:painting>);
	
		print("--- ThermalExpansion.zs initialized ---");