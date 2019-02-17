import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded appliedenergistics2
print("--- loading AppliedEnergistics.zs ---");
	
	var pearlFluix = <ore:pearlFluix>;
	var crystalCertus = <ore:crystalCertus>;

# ---=== Storage Cell Helpers ===---
	function addCellRecipe(_i as IItemStack, _o as IItemStack) {
		recipes.remove(_o);
		recipes.addShaped(_o.displayName,
		_o,
		[[<appliedenergistics2:quartz_glass>, <ore:dustRedstone>, <appliedenergistics2:quartz_glass>],
		[<ore:dustRedstone>, _i, <ore:dustRedstone>], 
		[<ore:plateIron>, <ironchest:iron_chest>, <ore:plateIron>]]);
	}

  function newCellRecipe(_i as IIngredient, _o as IItemStack) {
		recipes.remove(_o);
		recipes.addShaped(_o.displayName, _o,
		[[<appliedenergistics2:quartz_glass>, <ore:dustRedstone>, <appliedenergistics2:quartz_glass>],
		[<ore:dustRedstone>, _i, <ore:dustRedstone>], 
		[<ore:plateIron>, <ironchest:iron_chest>, <ore:plateIron>]]);
    if(!isNull(_i)) {
      recipes.addShapeless("Shapeless - "~_o.displayName, _o, [<appliedenergistics2:material:39>, _i]);
    }
	}

  function newAdvCellRecipe(_i as IIngredient, _o as IItemStack) {
		recipes.remove(_o);
		recipes.addShaped(_o.displayName, _o,
    [[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
    [<appliedenergistics2:material:8>, _i, <appliedenergistics2:material:8>], 
    [<ironchest:iron_chest:2>, <ironchest:iron_chest:2>, <ironchest:iron_chest:2>]]);

    if(!isNull(_i)) {
      recipes.addShapeless("Shapeless - "~_o.displayName, _o, [<extracells:storage.casing>, _i]);
    }
	}

  function newGasCellRecipe(_i as IIngredient, _o as IItemStack) {
		recipes.remove(_o);
		recipes.addShaped(_o.displayName, _o,
		[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
    [<appliedenergistics2:material:8>, _i, <appliedenergistics2:material:8>], 
  	[<ore:plateGold>, <ironchest:iron_chest:1>, <ore:plateGold>]]);
    if(!isNull(_i)) {
      recipes.addShapeless("Shapeless - "~_o.displayName, _o, [<extracells:storage.casing:2>, _i]);
    }
	}

# ---=== Storage Housings ===---
  newCellRecipe(null, <appliedenergistics2:material:39>);
  newAdvCellRecipe(null, <extracells:storage.casing>);
  newGasCellRecipe(null, <extracells:storage.casing:2>);

# ---=== Basic Cells ===---
  # Standard Cells
  newCellRecipe(<appliedenergistics2:material:35>,<appliedenergistics2:storage_cell_1k>);
  newCellRecipe(<appliedenergistics2:material:36>,<appliedenergistics2:storage_cell_4k>);
  newCellRecipe(<appliedenergistics2:material:37>,<appliedenergistics2:storage_cell_16k>);
  newCellRecipe(<appliedenergistics2:material:38>,<appliedenergistics2:storage_cell_64k>);
  # Fluid Cells
  newCellRecipe(<appliedenergistics2:material:54>,<appliedenergistics2:fluid_storage_cell_1k>);
  newCellRecipe(<appliedenergistics2:material:55>,<appliedenergistics2:fluid_storage_cell_4k>);
  newCellRecipe(<appliedenergistics2:material:56>,<appliedenergistics2:fluid_storage_cell_16k>);
  newCellRecipe(<appliedenergistics2:material:57>,<appliedenergistics2:fluid_storage_cell_64k>);
  # Spatial Cells
  newCellRecipe(<appliedenergistics2:material:32>,<appliedenergistics2:spatial_storage_cell_2_cubed>);
  newCellRecipe(<appliedenergistics2:material:33>,<appliedenergistics2:spatial_storage_cell_16_cubed>);
  newCellRecipe(<appliedenergistics2:material:34>,<appliedenergistics2:spatial_storage_cell_128_cubed>);
  # View Cell
  newCellRecipe(crystalCertus, <appliedenergistics2:view_cell>);

# ---=== Advanced Cells ===---
  # Standard Cells
  newAdvCellRecipe(<extracells:storage.component:0>, <extracells:storage.physical:0>);
  newAdvCellRecipe(<extracells:storage.component:1>, <extracells:storage.physical:1>);
  newAdvCellRecipe(<extracells:storage.component:2>, <extracells:storage.physical:2>);
  newAdvCellRecipe(<extracells:storage.component:3>, <extracells:storage.physical:3>);
  # Fluid Cells
  # FIXME: Should the Extra Cells Fluid Cells (256k and upwards) use Fluid Storage Cells?

# ---=== Gas Cells ===---
  newGasCellRecipe(<extracells:storage.component:11>, <extracells:storage.gas:0>);
  newGasCellRecipe(<extracells:storage.component:12>, <extracells:storage.gas:1>);
  newGasCellRecipe(<extracells:storage.component:13>, <extracells:storage.gas:2>);
  newGasCellRecipe(<extracells:storage.component:14>, <extracells:storage.gas:3>);
  newGasCellRecipe(<extracells:storage.component:15>, <extracells:storage.gas:4>);
  newGasCellRecipe(<extracells:storage.component:16>, <extracells:storage.gas:5>);
  newGasCellRecipe(<extracells:storage.component:17>, <extracells:storage.gas:6>);

# TODO: (Maybe) add helper function for this?
# ---=== High Tier Storage Components ===---
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
