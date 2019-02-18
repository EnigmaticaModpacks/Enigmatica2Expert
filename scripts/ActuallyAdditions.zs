import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded actuallyadditions
print("--- loading ActuallyAdditions.zs ---");
	
# Oil Generator Removal
	rh(<actuallyadditions:block_oil_generator>);

#Black Quartz Block to Black Quartz
	recipes.addShapeless("Black Quartz Block to Black Quartz", 
	<actuallyadditions:item_misc:5> * 4, [<ore:blockBlackQuartz>]);
		
# Drill Speed Augment I oredict compat
	recipes.remove(<actuallyadditions:item_drill_upgrade_speed>);
	recipes.addShaped("Drill Speed Augment I", 
	<actuallyadditions:item_drill_upgrade_speed>, 
	[[<actuallyadditions:item_crystal:5>, <ore:listAllsugar>, <actuallyadditions:item_crystal:5>],
	[<ore:listAllsugar>, <actuallyadditions:block_crystal>, <ore:listAllsugar>], 
	[<actuallyadditions:item_crystal:5>, <ore:listAllsugar>, <actuallyadditions:item_crystal:5>]]);

# Drill Speed Augment II oredict compat
	recipes.remove(<actuallyadditions:item_drill_upgrade_speed_ii>);
	recipes.addShapedMirrored("Drill Speed Augment II", 
	<actuallyadditions:item_drill_upgrade_speed_ii>, 
	[[<actuallyadditions:item_crystal:5>, <ore:listAllsugar>, <actuallyadditions:item_crystal:5>],
	[<ore:listAllsugar>, <ore:foodCake>, <ore:listAllsugar>], 
	[<actuallyadditions:item_crystal:5>, <ore:listAllsugar>, <actuallyadditions:item_crystal:5>]]);

# Drill Speed Augment III oredict compat
	recipes.remove(<actuallyadditions:item_drill_upgrade_speed_iii>);
	recipes.addShapedMirrored("Drill Speed Augment III",
	<actuallyadditions:item_drill_upgrade_speed_iii>, 
	[[<actuallyadditions:item_crystal_empowered:5>, <ore:foodCake>, <actuallyadditions:item_crystal_empowered:5>],
	[<ore:foodCake>, <actuallyadditions:item_crystal_empowered:2>, <ore:foodCake>], 
	[<actuallyadditions:item_crystal_empowered:5>, <ore:foodCake>, <actuallyadditions:item_crystal_empowered:5>]]);

# Lens of the Miner
	recipes.remove(<actuallyadditions:item_mining_lens>);
	recipes.addShapedMirrored("Lens of the Miner", 
	<actuallyadditions:item_mining_lens>, 
	[[<ore:oreRedstone>, <ore:oreEmerald>, <ore:oreLapis>],
	[<ore:blockBlackQuartz>, <botania:lens:21>, <ore:blockBlackQuartz>], 
	[<ore:blockBlackQuartz>, <actuallyadditions:item_color_lens>, <ore:blockBlackQuartz>]]);

# Experience Solidifier
	recipes.remove(<actuallyadditions:block_xp_solidifier>);
	
	recipes.addShapedMirrored("XP Bucket Cyclic", 
	<actuallyadditions:block_xp_solidifier>, 
	[[null, <forge:bucketfilled>.withTag({FluidName: "xpjuice", Amount: 1000}), null],
	[<actuallyadditions:block_crystal_empowered:2>, <actuallyadditions:item_misc:8>, <actuallyadditions:block_crystal_empowered:2>], 
	[null, <forge:bucketfilled>.withTag({FluidName: "xpjuice", Amount: 1000}), null]]);
	
	recipes.addShapedMirrored("XP Bucket TE", 
	<actuallyadditions:block_xp_solidifier>, 
	[[null, <forge:bucketfilled>.withTag({FluidName: "experience", Amount: 1000}), null],
	[<actuallyadditions:block_crystal_empowered:2>, <actuallyadditions:item_misc:8>, <actuallyadditions:block_crystal_empowered:2>], 
	[null, <forge:bucketfilled>.withTag({FluidName: "experience", Amount: 1000}), null]]);

# Wood Casing
	recipes.remove(<actuallyadditions:block_misc:4>);
	recipes.addShapedMirrored("Wood Casing", 
	<actuallyadditions:block_misc:4> * 2, 
	[[<ore:plankTreatedWood>, <forestry:oak_stick>, <ore:plankTreatedWood>],
	[<forestry:oak_stick>, <ore:logWood>, <forestry:oak_stick>], 
	[<ore:plankTreatedWood>, <forestry:oak_stick>, <ore:plankTreatedWood>]]);

# "Small" Storage Crate
	recipes.remove(<actuallyadditions:block_giant_chest>);
	recipes.addShapedMirrored("Small Storage Crate", 
	<actuallyadditions:block_giant_chest>, 
	[[<ore:chest>, <ore:plankTreatedWood>, <ore:chest>],
	[<ore:plankTreatedWood>, <actuallyadditions:block_misc:4>, <ore:plankTreatedWood>], 
	[<ore:chest>, <ore:plankTreatedWood>, <ore:chest>]]);

# Emerald Dust
	recipes.remove(<actuallyadditions:item_dust:3>);
	
# Black Quartz Dust
	recipes.remove(<actuallyadditions:item_dust:7>);
	
# Iron Casing
	recipes.remove(<actuallyadditions:block_misc:9>);
	recipes.addShapedMirrored("Iron Casing", 
	<actuallyadditions:block_misc:9> * 2, 
	[[<ore:blockSheetmetalIron>, <forestry:thermionic_tubes:1>, <ore:blockSheetmetalIron>],
	[<forestry:thermionic_tubes:1>, <forestry:hardened_machine>, <forestry:thermionic_tubes:1>], 
	[<ore:blockSheetmetalIron>, <forestry:thermionic_tubes:1>, <ore:blockSheetmetalIron>]]);

# Basic Coil
	recipes.remove(<actuallyadditions:item_misc:7>);
	recipes.addShapedMirrored("Basic Coil", 
	<actuallyadditions:item_misc:7>, 
	[[<actuallyadditions:item_crystal:5>, <ore:wireAluminum>, <forestry:oak_stick>],
	[<ore:wireAluminum>, <forestry:oak_stick>, <ore:wireAluminum>], 
	[<forestry:oak_stick>, <ore:wireAluminum>, <actuallyadditions:item_crystal:5>]]);

# Advanced Coil
	recipes.remove(<actuallyadditions:item_misc:8>);
	recipes.addShapedMirrored("Advanced Coil", 
	<actuallyadditions:item_misc:8>, 
	[[null, <ic2:cable:2>.withTag({type: 2 as byte, insulation: 0 as byte}), <forestry:oak_stick>],
	[<ic2:cable:2>.withTag({type: 2 as byte, insulation: 0 as byte}), <actuallyadditions:item_misc:7>, <ic2:cable:2>.withTag({type: 2 as byte, insulation: 0 as byte})], 
	[<forestry:oak_stick>, <ic2:cable:2>.withTag({type: 2 as byte, insulation: 0 as byte}), null]]);

# Atomic Reconstructor
	recipes.remove(<actuallyadditions:block_atomic_reconstructor>);
	recipes.addShaped("Atomic Reconstructor", 
	<actuallyadditions:block_atomic_reconstructor>, 
	[[<ore:plateSteel>, <forestry:thermionic_tubes:4>, <ore:plateSteel>],
	[<ore:dustRedstone>, <actuallyadditions:block_misc:9>, <industrialforegoing:laser_lens_inverted:14>], 
	[<ore:plateSteel>, <forestry:thermionic_tubes:4>, <ore:plateSteel>]]);

# Removing Recipes
	var recipesToRemove = [
	<actuallyadditions:item_dust>,
	<actuallyadditions:item_dust:1>,
	<actuallyadditions:item_dust:2>,
	<actuallyadditions:item_dust:4>,
	<actuallyadditions:item_dust:6>,
	<actuallyadditions:block_misc:5>
	] as IItemStack[];
	
	for items in recipesToRemove {
		rh(items);
	}
	
# *======= Empowerer =======*
	
	#mods.actuallyadditions.Empowerer.addRecipe(IItemStack output, IItemStack input, IItemStack modifier1, IItemStack modifier2, IItemStack modifier3, IItemStack modifier4, int energyPerStand, int time, @Optional float[] particleColourArray);

# Restonia
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered>);
	
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:item_crystal_empowered>, <actuallyadditions:item_crystal>, <nuclearcraft:gem>, <thermalfoundation:material:513>, <tconstruct:tool_rod>.withTag({Material: "ardite"}), <minecraft:red_nether_brick>, 25000, 100, [1.0, 0.0, 0.0]);
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered>, <actuallyadditions:block_crystal>, <nuclearcraft:gem>, <thermalfoundation:material:513>, <tconstruct:tool_rod>.withTag({Material: "ardite"}), <minecraft:red_nether_brick>, 250000, 200, [1.0, 0.0, 0.0]);

# Palis
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:1>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:1>);

	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:item_crystal_empowered:1>, <actuallyadditions:item_crystal:1>, <tconstruct:ingots>, <ic2:plate:13>, <biomesoplenty:gem:6>, <tconstruct:slime_congealed:1>, 25000, 100, [0.0, 0.0, 1.0]);
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:1>, <actuallyadditions:block_crystal:1>, <tconstruct:ingots>, <ic2:plate:13>, <biomesoplenty:gem:6>, <tconstruct:slime_congealed:1>, 250000, 200, [0.0, 0.0, 1.0]);

# Diamantine
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:2>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:2>);
	
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:item_crystal_empowered:2>, <actuallyadditions:item_crystal:2>, <nuclearcraft:dust:10>, <botania:manaresource:2>, <tconstruct:ingots:2>, <biomesoplenty:gem:5>, 50000, 200, [0.0, 1.0, 1.0]);
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:2>, <actuallyadditions:block_crystal:2>, <nuclearcraft:dust:10>, <botania:manaresource:2>, <tconstruct:ingots:2>, <biomesoplenty:gem:5>, 500000, 400, [0.0, 1.0, 1.0]);

# Void
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:3>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:3>);

	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:item_crystal_empowered:3>, <actuallyadditions:item_crystal:3>, <minecraft:dye>, <extendedcrafting:storage>, <chisel:basalt2:*>, <actuallyadditions:block_misc:2>, 250000, 100, [0.1, 0.0, 0.0]);
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:3>, <actuallyadditions:block_crystal:3>, <minecraft:dye>, <extendedcrafting:storage>, <chisel:basalt2:*>, <actuallyadditions:block_misc:2>, 2500000, 200, [0.1, 0.0, 0.0]);

# Emeradic
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:4>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:4>);

	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:item_crystal_empowered:4>, <actuallyadditions:item_crystal:4>, <minecraft:dye:2>, <minecraft:emerald>, <nuclearcraft:dust:9>, <actuallyadditions:block_testifi_bucks_green_wall>, 50000, 200, [0.0, 1.0, 0.498039]);
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:4>, <actuallyadditions:block_crystal:4>, <minecraft:dye:2>, <minecraft:emerald>, <nuclearcraft:dust:9>, <actuallyadditions:block_testifi_bucks_green_wall>, 500000, 400, [0.0, 1.0, 0.498039]);

# Enori
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:5>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:5>);

	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:item_crystal_empowered:5>, <actuallyadditions:item_crystal:5>, <minecraft:quartz_block>, <minecraft:bone_block>, <mekanism:ingot:1>, <nuclearcraft:gem:2>, 25000, 100, [1.0, 1.0, 1.0]);
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:5>, <actuallyadditions:block_crystal:5>, <minecraft:quartz_block>, <minecraft:bone_block>, <mekanism:ingot:1>, <nuclearcraft:gem:2>, 250000, 200, [1.0, 1.0, 1.0]);


# *======= Grinder =======*
	#OutputStack, InputStack, (Optional)Output2Stack, (Optional)Output2Chance
	#mods.actuallyadditions.Crusher.addRecipe(<minecraft:iron_ore>, <minecraft:iron_ingot>, <minecraft:stone>, 50);
	
	#BoP Gems -> Dyes
	mods.actuallyadditions.Crusher.addRecipe(<minecraft:dye:9> * 2, <biomesoplenty:gem_block:1>, <minecraft:dye:9> * 2, 50);
	mods.actuallyadditions.Crusher.addRecipe(<minecraft:dye:2> * 2, <biomesoplenty:gem_block:2>, <minecraft:dye:2> * 2, 50);
	mods.actuallyadditions.Crusher.addRecipe(<minecraft:dye:14> * 2, <biomesoplenty:gem_block:3>, <minecraft:dye:14> * 2, 50);
	mods.actuallyadditions.Crusher.addRecipe(<minecraft:dye:10> * 2, <biomesoplenty:gem_block:5>, <minecraft:dye:10> * 2, 50);
	mods.actuallyadditions.Crusher.addRecipe(<minecraft:dye:12> * 2, <biomesoplenty:gem_block:6>, <minecraft:dye:6> * 2, 50);
	
	# Certus Quartz compatibility
	mods.actuallyadditions.Crusher.addRecipe(<appliedenergistics2:material:1> * 2, <appliedenergistics2:charged_quartz_ore>);
	mods.actuallyadditions.Crusher.addRecipe(<appliedenergistics2:material:2>, <appliedenergistics2:material:1>);
	mods.actuallyadditions.Crusher.addRecipe(<appliedenergistics2:material:2>, <appliedenergistics2:material>);
	

# *======= TreasureChest =======*
	#mods.actuallyadditions.TreasureChest.addLoot(IItemStack returnItem, int chance, int minAmount, int maxAmount);
	#mods.actuallyadditions.TreasureChest.addLoot(<minecraft:dirt>, 50, 1, 64);


# *======= BallOfFur =======*

	mods.actuallyadditions.BallOfFur.addReturn(<thermalfoundation:material:160>, 3);
	mods.actuallyadditions.BallOfFur.addReturn(<astralsorcery:itemusabledust>, 5);
	mods.actuallyadditions.BallOfFur.addReturn(<extendedcrafting:material>, 1);
	mods.actuallyadditions.BallOfFur.addReturn(<appliedenergistics2:material:45>, 8);
	mods.actuallyadditions.BallOfFur.addReturn(<appliedenergistics2:material:3>, 6);
	mods.actuallyadditions.BallOfFur.addReturn(<biomesoplenty:gem:1>, 6);
	mods.actuallyadditions.BallOfFur.addReturn(<immersiveengineering:material:9>, 1);
	mods.actuallyadditions.BallOfFur.addReturn(<immersiveengineering:material:8>, 12);
	mods.actuallyadditions.BallOfFur.addReturn(<plustic:alumiteingot>, 1);


# *======= AtomicReconstructor =======*

	#mods.actuallyadditions.AtomicReconstructor.addRecipe(IItemStack output, IItemStack input, int energyUsed);
	#mods.actuallyadditions.AtomicReconstructor.addRecipe(<minecraft:fire_charge>, <minecraft:coal:1>, 1000);

	#mods.actuallyadditions.AtomicReconstructor.removeRecipe(IItemStack output);
	#mods.actuallyadditions.AtomicReconstructor.removeRecipe(<minecraft:coal>);
	
# *======= Compost =======*

	#mods.actuallyadditions.Compost.addRecipe(IItemStack output, IItemStack outputDisplay, IItemStack input, IItemStack inputDisplay);
	#mods.actuallyadditions.Compost.addRecipe(<minecraft:dirt>, <minecraft:dirt>, <minecraft:sugar>, <minecraft:snow>);
	
	#mods.actuallyadditions.Compost.removeRecipe(IItemStack output);
	#mods.actuallyadditions.Compost.removeRecipe(<actuallyadditions:item_canola_seed>);
	
# *======= Empowerer =======*

	#mods.actuallyadditions.Empowerer.addRecipe(IItemStack output, IItemStack input, IItemStack modifier1, IItemStack modifier2, IItemStack modifier3, IItemStack modifier4, int energyPerStand, int time, @Optional float[] particleColourArray);
	#mods.actuallyadditions.Empowerer.addRecipe(<minecraft:gold_ingot>, <minecraft:iron_ingot>, <minecraft:redstone>, <minecraft:redstone>, <minecraft:redstone>, <minecraft:redstone>, 500, 100, [0.5, 0.3, 0.2]);

	print("--- ActuallyAdditions.zs initialized ---");