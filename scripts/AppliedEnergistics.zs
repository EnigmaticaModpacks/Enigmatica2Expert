import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded appliedenergistics2
print("--- loading AppliedEnergistics.zs ---");
	
	var pearlFluix = <ore:pearlFluix>;
	var crystalCertus = <ore:crystalCertus>;

# Storage Housing
	recipes.remove(<appliedenergistics2:material:39>);
	recipes.addShaped("Storage Housing", 
	<appliedenergistics2:material:39>, 
	[[<appliedenergistics2:quartz_glass>, <ore:dustRedstone>, <appliedenergistics2:quartz_glass>],
	[<ore:dustRedstone>, null, <ore:dustRedstone>], 
	[<ore:plateIron>, <ironchest:iron_chest>, <ore:plateIron>]]);

	recipes.remove(<extracells:storage.casing>);
	recipes.addShaped("Advanced Storage Housing", 
	<extracells:storage.casing>, 
	[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
	[<appliedenergistics2:material:8>, null, <appliedenergistics2:material:8>], 
	[<ironchest:iron_chest:2>, <ironchest:iron_chest:2>, <ironchest:iron_chest:2>]]);

	recipes.remove(<extracells:storage.casing:2>);
	recipes.addShapedMirrored("Gas Storage Housing", 
	<extracells:storage.casing:2>, 
	[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
	[<appliedenergistics2:material:8>, null, <appliedenergistics2:material:8>], 
	[<ore:plateGold>, <ironchest:iron_chest:1>, <ore:plateGold>]]);
	
# Storage Cell 1-16384K
	recipes.remove(<appliedenergistics2:storage_cell_1k>);
	recipes.addShaped("Storage Cell 1k", 
	<appliedenergistics2:storage_cell_1k>, 
	[[<appliedenergistics2:quartz_glass>, <ore:dustRedstone>, <appliedenergistics2:quartz_glass>],
	[<ore:dustRedstone>, <appliedenergistics2:material:35>, <ore:dustRedstone>], 
	[<ore:plateIron>, <ironchest:iron_chest>, <ore:plateIron>]]);
	recipes.addShapeless("Storage Cell 1k Shapeless", <appliedenergistics2:storage_cell_1k>, [<appliedenergistics2:material:39>, <appliedenergistics2:material:35>]);

	recipes.remove(<appliedenergistics2:storage_cell_4k>);
	recipes.addShaped("Storage Cell 4k", 
	<appliedenergistics2:storage_cell_4k>, 
	[[<appliedenergistics2:quartz_glass>, <ore:dustRedstone>, <appliedenergistics2:quartz_glass>],
	[<ore:dustRedstone>, <appliedenergistics2:material:36>, <ore:dustRedstone>], 
	[<ore:plateIron>, <ironchest:iron_chest>, <ore:plateIron>]]);
	recipes.addShapeless("Storage Cell 4k Shapeless", <appliedenergistics2:storage_cell_4k>, [<appliedenergistics2:material:39>, <appliedenergistics2:material:36>]);

	recipes.remove(<appliedenergistics2:storage_cell_16k>);
	recipes.addShaped("Storage Cell 16k", 
	<appliedenergistics2:storage_cell_16k>, 
	[[<appliedenergistics2:quartz_glass>, <ore:dustRedstone>, <appliedenergistics2:quartz_glass>],
	[<ore:dustRedstone>, <appliedenergistics2:material:37>, <ore:dustRedstone>], 
	[<ore:plateIron>, <ironchest:iron_chest>, <ore:plateIron>]]);
	recipes.addShapeless("Storage Cell 16k Shapeless", <appliedenergistics2:storage_cell_16k>, [<appliedenergistics2:material:39>, <appliedenergistics2:material:37>]);

	recipes.remove(<appliedenergistics2:storage_cell_64k>);
	recipes.addShaped("Storage Cell 64k", 
	<appliedenergistics2:storage_cell_64k>, 
	[[<appliedenergistics2:quartz_glass>, <ore:dustRedstone>, <appliedenergistics2:quartz_glass>],
	[<ore:dustRedstone>, <appliedenergistics2:material:38>, <ore:dustRedstone>], 
	[<ore:plateIron>, <ironchest:iron_chest>, <ore:plateIron>]]);
	recipes.addShapeless("Storage Cell 64k Shapeless", <appliedenergistics2:storage_cell_64k>, [<appliedenergistics2:material:39>, <appliedenergistics2:material:38>]);

	recipes.remove(<extracells:storage.physical>);
	recipes.addShaped("Storage Cell 256k", 
	<extracells:storage.physical>, 
	[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
	[<appliedenergistics2:material:8>, <extracells:storage.component>, <appliedenergistics2:material:8>], 
	[<ironchest:iron_chest:2>, <ironchest:iron_chest:2>, <ironchest:iron_chest:2>]]);
	recipes.addShapeless("Storage Cell 256k Shapeless", <extracells:storage.physical>, [<extracells:storage.casing>, <extracells:storage.component>]);

	recipes.remove(<extracells:storage.physical:1>);
	recipes.addShaped("Storage Cell 1024k", 
	<extracells:storage.physical:1>, 
	[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
	[<appliedenergistics2:material:8>, <extracells:storage.component:1>, <appliedenergistics2:material:8>], 
	[<ironchest:iron_chest:2>, <ironchest:iron_chest:2>, <ironchest:iron_chest:2>]]);
	recipes.addShapeless("Storage Cell 1024k Shapeless",<extracells:storage.physical:1>, [<extracells:storage.casing>, <extracells:storage.component:1>]);

	recipes.remove(<extracells:storage.physical:2>);
	recipes.addShaped("Storage Cell 4096k", 
	<extracells:storage.physical:2>, 
	[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
	[<appliedenergistics2:material:8>, <extracells:storage.component:2>, <appliedenergistics2:material:8>], 
	[<ironchest:iron_chest:2>, <ironchest:iron_chest:2>, <ironchest:iron_chest:2>]]);
	recipes.addShapeless("Storage Cell 4096k Shapeless", <extracells:storage.physical:2>, [<extracells:storage.casing>, <extracells:storage.component:2>]);

	recipes.remove(<extracells:storage.physical:3>);
	recipes.addShaped("Storage Cell 16384k", 
	<extracells:storage.physical:3>, 
	[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
	[<appliedenergistics2:material:8>, <extracells:storage.component:3>, <appliedenergistics2:material:8>], 
	[<ironchest:iron_chest:2>, <ironchest:iron_chest:2>, <ironchest:iron_chest:2>]]);
	recipes.addShapeless("Storage Cell 16384k Shapeless", <extracells:storage.physical:3>, [<extracells:storage.casing>, <extracells:storage.component:3>]);

# 256k - 16384k ME Storage Components
	recipes.remove(<extracells:storage.component>);
	recipes.addShapedMirrored("AE2 Storage Components 256k", 
	<extracells:storage.component>, 
	[[<ore:dustEnder>, <appliedenergistics2:material:24>, <ore:dustEnder>],
	[<appliedenergistics2:material:38>, <appliedenergistics2:material:22>, <appliedenergistics2:material:38>], 
	[<ore:dustEnder>, <appliedenergistics2:material:38>, <ore:dustEnder>]]);

	recipes.remove(<extracells:storage.component:1>);
	recipes.addShapedMirrored("AE2 Storage Components 1024k", 
	<extracells:storage.component:1>, 
	[[<ore:dustEnder>, <appliedenergistics2:material:24>, <ore:dustEnder>],
	[<extracells:storage.component>, <appliedenergistics2:material:22>, <extracells:storage.component>], 
	[<ore:dustEnder>, <extracells:storage.component>, <ore:dustEnder>]]);

	recipes.remove(<extracells:storage.component:2>);
	recipes.addShapedMirrored("AE2 Storage Components 4096k", 
	<extracells:storage.component:2>, 
	[[<ore:dustEnder>, <appliedenergistics2:material:24>, <ore:dustEnder>],
	[<extracells:storage.component:1>, <appliedenergistics2:material:22>, <extracells:storage.component:1>], 
	[<ore:dustEnder>, <extracells:storage.component:1>, <ore:dustEnder>]]);

	recipes.remove(<extracells:storage.component:3>);
	recipes.addShapedMirrored("AE2 Storage Components 16384k", 
	<extracells:storage.component:3>, 
	[[<ore:dustEnder>, <appliedenergistics2:material:24>, <ore:dustEnder>],
	[<extracells:storage.component:2>, <appliedenergistics2:material:22>, <extracells:storage.component:2>], 
	[<ore:dustEnder>, <extracells:storage.component:2>, <ore:dustEnder>]]);


# Gas Storage Cell 1-4096K
	recipes.remove(<extracells:storage.gas>);
	recipes.addShaped("Gas Storage Cell 1k", 
	<extracells:storage.gas>, 
	[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
	[<appliedenergistics2:material:8>, <extracells:storage.component:11>, <appliedenergistics2:material:8>], 
	[<ore:plateGold>, <ironchest:iron_chest:1>, <ore:plateGold>]]);
	recipes.addShapeless("Gas Storage Cell 1k Shapeless", <extracells:storage.gas>, [<extracells:storage.casing:2>, <extracells:storage.component:11>]);

	recipes.remove(<extracells:storage.gas:1>);
	recipes.addShaped("Gas Storage Cell 4k", 
	<extracells:storage.gas:1>, 
	[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
	[<appliedenergistics2:material:8>, <extracells:storage.component:12>, <appliedenergistics2:material:8>], 
	[<ore:plateGold>, <ironchest:iron_chest:1>, <ore:plateGold>]]);
	recipes.addShapeless("Gas Storage Cell 4k Shapeless", <extracells:storage.gas:1>, [<extracells:storage.casing:2>, <extracells:storage.component:12>]);

	recipes.remove(<extracells:storage.gas:2>);
	recipes.addShaped("Gas Storage Cell 16k", 
	<extracells:storage.gas:2>, 
	[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
	[<appliedenergistics2:material:8>, <extracells:storage.component:13>, <appliedenergistics2:material:8>], 
	[<ore:plateGold>, <ironchest:iron_chest:1>, <ore:plateGold>]]);
	recipes.addShapeless("Gas Storage Cell 16k Shapeless", <extracells:storage.gas:2>, [<extracells:storage.casing:2>, <extracells:storage.component:13>]);

	recipes.remove(<extracells:storage.gas:3>);
	recipes.addShaped("Gas Storage Cell 64k", 
	<extracells:storage.gas:3>, 
	[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
	[<appliedenergistics2:material:8>, <extracells:storage.component:14>, <appliedenergistics2:material:8>], 
	[<ore:plateGold>, <ironchest:iron_chest:1>, <ore:plateGold>]]);
	recipes.addShapeless("Gas Storage Cell 64k Shapeless", <extracells:storage.gas:3>, [<extracells:storage.casing:2>, <extracells:storage.component:14>]);
	
	recipes.remove(<extracells:storage.gas:4>);
	recipes.addShaped("Gas Storage Cell 256k", 
	<extracells:storage.gas:4>, 
	[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
	[<appliedenergistics2:material:8>, <extracells:storage.component:15>, <appliedenergistics2:material:8>], 
	[<ore:plateGold>, <ironchest:iron_chest:1>, <ore:plateGold>]]);
	recipes.addShapeless("Gas Storage Cell 256k Shapeless", <extracells:storage.gas:4>, [<extracells:storage.casing:2>, <extracells:storage.component:15>]);

	recipes.remove(<extracells:storage.gas:5>);
	recipes.addShaped("Gas Storage Cell 1024k", 
	<extracells:storage.gas:5>, 
	[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
	[<appliedenergistics2:material:8>, <extracells:storage.component:16>, <appliedenergistics2:material:8>], 
	[<ore:plateGold>, <ironchest:iron_chest:1>, <ore:plateGold>]]);
	recipes.addShapeless("Gas Storage Cell 1024k Shapeless", <extracells:storage.gas:5>, [<extracells:storage.casing:2>, <extracells:storage.component:16>]);

	recipes.remove(<extracells:storage.gas:6>);
	recipes.addShaped("Gas Storage Cell 4096k", 
	<extracells:storage.gas:6>, 
	[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
	[<appliedenergistics2:material:8>, <extracells:storage.component:17>, <appliedenergistics2:material:8>], 
	[<ore:plateGold>, <ironchest:iron_chest:1>, <ore:plateGold>]]);
	recipes.addShapeless("Gas Storage Cell 4096k Shapeless", <extracells:storage.gas:6>, [<extracells:storage.casing:2>, <extracells:storage.component:17>]);

# Quantum Ring
	recipes.remove(<appliedenergistics2:quantum_ring>);
	recipes.addShapedMirrored("Quantum Ring", 
	<appliedenergistics2:quantum_ring>, 
	[[<appliedenergistics2:material:9>, <appliedenergistics2:energy_cell>, <appliedenergistics2:material:24>],
	[<appliedenergistics2:energy_cell>, <appliedenergistics2:part:76>, <appliedenergistics2:energy_cell>], 
	[<appliedenergistics2:material:22>, <appliedenergistics2:energy_cell>, <appliedenergistics2:material:23>]]);

# Quantum Link Chamber
	recipes.remove(<appliedenergistics2:quantum_link>);
	recipes.addShapedMirrored("Quantum Link Chamber", 
	<appliedenergistics2:quantum_link>, 
	[[<appliedenergistics2:quartz_vibrant_glass>, <rftools:infused_enderpearl>, <appliedenergistics2:quartz_vibrant_glass>],
	[pearlFluix, <mekanism:machineblock3>, pearlFluix], 
	[<appliedenergistics2:quartz_vibrant_glass>, <ore:manaPearl>, <appliedenergistics2:quartz_vibrant_glass>]]);

# Drive
	recipes.remove(<appliedenergistics2:drive>);
	recipes.addShaped("ME Drive", 
	<appliedenergistics2:drive>, 
	[[<ic2:casing:3>, <appliedenergistics2:material:24>, <ic2:casing:3>],
	[<actuallyadditions:block_misc:9>, <opencomputers:diskdrive>, <actuallyadditions:block_misc:9>], 
	[<ic2:casing:3>, <appliedenergistics2:material:24>, <ic2:casing:3>]]);

# Matter Condenser
	recipes.remove(<appliedenergistics2:condenser>);	
	mods.extendedcrafting.CompressionCrafting.addRecipe(<appliedenergistics2:condenser>, 
	<minecraft:piston>, 10000, <mekanism:machineblock:7>.withTag({recipeType: 3}), 1000000000, 1000000);
	
# Molecular Assembler
	recipes.remove(<appliedenergistics2:molecular_assembler>);
	recipes.addShapedMirrored("Molecular Assembler", 
	<appliedenergistics2:molecular_assembler>, 
	[[<ore:blockSheetmetalIron>, <appliedenergistics2:quartz_glass>, <ore:blockSheetmetalIron>],
	[<appliedenergistics2:material:44>, <rftools:crafter3>, <appliedenergistics2:material:43>], 
	[<ore:blockSheetmetalIron>, <appliedenergistics2:quartz_glass>, <ore:blockSheetmetalIron>]]);

# Grindstone
	recipes.remove(<appliedenergistics2:grindstone>);
	recipes.addShapedMirrored("Grindstone", 
	<appliedenergistics2:grindstone>, 
	[[<appliedenergistics2:smooth_sky_stone_block>, <ore:gearWood>, <appliedenergistics2:smooth_sky_stone_block>],
	[<ore:crystalCertusQuartz>, <appliedenergistics2:smooth_sky_stone_block>, <ore:crystalCertusQuartz>], 
	[<appliedenergistics2:sky_stone_block>, <ore:crystalCertusQuartz>, <appliedenergistics2:sky_stone_block>]]);

# Silicon
	mods.thermalexpansion.Compactor.addMintRecipe(<nuclearcraft:gem:6>, <minecraft:sand>, 2000);
	
# Energy Acceptor
	recipes.remove(<appliedenergistics2:energy_acceptor>);
	recipes.addShaped("Energy Acceptor", 
	<appliedenergistics2:energy_acceptor>, 
	[[<immersiveengineering:material:26>, <immersiveengineering:metal_decoration0:3>, <immersiveengineering:material:26>],
	[<appliedenergistics2:part:16>, <appliedenergistics2:quartz_fixture>, <appliedenergistics2:part:16>], 
	[<appliedenergistics2:fluix_block>, <appliedenergistics2:material:24>, <appliedenergistics2:fluix_block>]]);
	
# ME Controller
	recipes.remove(<appliedenergistics2:controller>);
	recipes.addShaped("ME Controller", 
	<appliedenergistics2:controller>, 
	[[<appliedenergistics2:smooth_sky_stone_block>, <advancedrocketry:ic:3>, <appliedenergistics2:smooth_sky_stone_block>],
	[<appliedenergistics2:fluix_block>, <appliedenergistics2:energy_acceptor>, <appliedenergistics2:fluix_block>], 
	[<teslacorelib:machine_case>, pearlFluix, <teslacorelib:machine_case>]]);

# Inscriber
	recipes.remove(<appliedenergistics2:inscriber>);
	recipes.addShapedMirrored("Inscriber", 
	<appliedenergistics2:inscriber>, 
	[[<ic2:resource:11>, <minecraft:sticky_piston>, <ic2:resource:11>],
	[<appliedenergistics2:fluix_block>, null, <teslacorelib:machine_case>], 
	[<ic2:resource:11>, <minecraft:sticky_piston>, <ic2:resource:11>]]);

# Presses with TE Compactor, press mode
	mods.thermalexpansion.Compactor.addPressRecipe(<appliedenergistics2:material:13>, <appliedenergistics2:quartz_block>, 50000);
	mods.thermalexpansion.Compactor.addPressRecipe(<appliedenergistics2:material:14>, <minecraft:diamond_block>, 50000);
	mods.thermalexpansion.Compactor.addPressRecipe(<appliedenergistics2:material:15>, <ic2:plate:11>, 50000);
	mods.thermalexpansion.Compactor.addPressRecipe(<appliedenergistics2:material:19>, <extrautils2:compressedsand:1>, 50000);

# Charged Certus Quartz -> Certus Dust
	mods.thermalexpansion.Pulverizer.addRecipe(<appliedenergistics2:material:2>, <appliedenergistics2:material:1>, 2000, <appliedenergistics2:material:2>, 20);
		
	print("--- AppliedEnergistics.zs initialized ---");