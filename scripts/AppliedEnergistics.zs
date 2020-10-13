import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.item.IIngredient as IIngredient;
#modloaded appliedenergistics2
	
# Removing duplicate inputs in recipes for Charged Certus Ore -> Charged Certus in AA Crusher + IE Crusher
mods.immersiveengineering.Crusher.removeRecipe(<appliedenergistics2:material>);
mods.actuallyadditions.Crusher.removeRecipe(<appliedenergistics2:material>);

# Removing non-functional Extra Cells
	recipes.remove(<extracells:storage.fluid:5>);
	recipes.remove(<extracells:storage.fluid:6>);
	recipes.remove(<extracells:storage.component:9>);
	recipes.remove(<extracells:storage.component:10>);

	var pearlFluix = <ore:pearlFluix>;
	var crystalCertus = <ore:crystalCertus>;

# Smart Cable -> Dense
	recipes.addShapeless("4 Smart Cables to Dense", 
	<appliedenergistics2:part:76>, 
	[<appliedenergistics2:part:56>,<appliedenergistics2:part:56>,<appliedenergistics2:part:56>,<appliedenergistics2:part:56>,<ore:dustRedstone>,<ore:dustGlowstone>]);


# ---=== Storage Cell Helpers ===---
  function newCellRecipe(input as IIngredient, output as IItemStack) {
	recipes.remove(output);
	recipes.addShaped(output.displayName, output,
		[[<appliedenergistics2:quartz_glass>, <ore:dustRedstone>, <appliedenergistics2:quartz_glass>],
		[<ore:dustRedstone>, input, <ore:dustRedstone>], 
		[<ore:plateIron>, <ironchest:iron_chest>, <ore:plateIron>]]);
    if(!isNull(input)) {
      recipes.addShapeless("Shapeless - "~output.displayName, output, [<appliedenergistics2:material:39>, input]);
		}
	}

  function newAdvCellRecipe(input as IIngredient, output as IItemStack) {
	recipes.remove(output);
	recipes.addShaped(output.displayName, output,
		[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
		[<appliedenergistics2:material:8>, input, <appliedenergistics2:material:8>], 
		[<ironchest:iron_chest:2>, <ironchest:iron_chest:2>, <ironchest:iron_chest:2>]]);

    if(!isNull(input)) {
      recipes.addShapeless("Shapeless - "~output.displayName, output, [<extracells:storage.casing>, input]);
		}
	}

  function newGasCellRecipe(input as IIngredient, output as IItemStack) {
	recipes.remove(output);
	recipes.addShaped(output.displayName, output,
		[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
		[<appliedenergistics2:material:8>, input, <appliedenergistics2:material:8>], 
		[<ore:plateGold>, <ironchest:iron_chest:1>, <ore:plateGold>]]);
    if(!isNull(input)) {
      recipes.addShapeless("Shapeless - "~output.displayName, output, [<extracells:storage.casing:2>, input]);
		}
	}

# ---=== Storage Housings ===---

  newCellRecipe(null, <appliedenergistics2:material:39>);
  newAdvCellRecipe(null, <extracells:storage.casing>);
  newGasCellRecipe(null, <extracells:storage.casing:2>);

# ---=== Basic Cells ===---
  val cellRecipes = {
	# Standard Cells
	<appliedenergistics2:material:35>: <appliedenergistics2:storage_cell_1k>,
	<appliedenergistics2:material:36>: <appliedenergistics2:storage_cell_4k>,
	<appliedenergistics2:material:37>: <appliedenergistics2:storage_cell_16k>,
	<appliedenergistics2:material:38>: <appliedenergistics2:storage_cell_64k>,
	# Fluid Cells
	<appliedenergistics2:material:54>: <appliedenergistics2:fluid_storage_cell_1k>,
	<appliedenergistics2:material:55>: <appliedenergistics2:fluid_storage_cell_4k>,
	<appliedenergistics2:material:56>: <appliedenergistics2:fluid_storage_cell_16k>,
	<appliedenergistics2:material:57>: <appliedenergistics2:fluid_storage_cell_64k>,
	# Spatial Cells
	<appliedenergistics2:material:32>: <appliedenergistics2:spatial_storage_cell_2_cubed>,
	<appliedenergistics2:material:33>: <appliedenergistics2:spatial_storage_cell_16_cubed>,
	<appliedenergistics2:material:34>: <appliedenergistics2:spatial_storage_cell_128_cubed>,
	# View Cell
	<ore:crystalCertus>: <appliedenergistics2:view_cell>

	} as IItemStack[IIngredient];

	for input, output in cellRecipes {
		newCellRecipe(input,output);
	}

# ---=== Advanced Cells ===---
  for i in 0 .. 4 {
    newAdvCellRecipe(<extracells:storage.component>.definition.makeStack(i), <extracells:storage.physical>.definition.makeStack(i));
  }

# ---=== Gas Cells ===---
  for i in 0 .. 7 {
    newGasCellRecipe(<extracells:storage.component>.definition.makeStack(i+11), <extracells:storage.gas>.definition.makeStack(i));
  }

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
		
# Lapis Dust
	mods.appliedenergistics2.Grinder.addRecipe(<ic2:dust:9>, <minecraft:dye:4>, 4);



# If Channels are turned off in the config, these recipes will be changed
	recipes.remove(<appliedenergistics2:quantum_ring>);

	var controller = itemUtils.getItem("appliedenergistics2:controller");
	var meConduit = <enderio:item_me_conduit:1>;
	var anyFluix = <ore:crystalFluix> | <appliedenergistics2:material:12>;
	
	if (isNull(controller)) {
		recipes.addShapedMirrored("Quantum Ring", 
		<appliedenergistics2:quantum_ring>, 
		[[<appliedenergistics2:material:9>, <appliedenergistics2:energy_cell>, <appliedenergistics2:material:24>],
		[<appliedenergistics2:energy_cell>, meConduit, <appliedenergistics2:energy_cell>], 
		[<appliedenergistics2:material:22>, <appliedenergistics2:energy_cell>, <appliedenergistics2:material:23>]]);
		
		recipes.remove(<rf-capability-adapter:aecapabilityadapter>);
		recipes.addShaped("Capability Adapter", 
		<rf-capability-adapter:aecapabilityadapter>, 
		[[<minecraft:iron_ingot>, anyFluix, <minecraft:iron_ingot>], 
		[anyFluix, meConduit, anyFluix],
		[<minecraft:iron_ingot>, anyFluix, <minecraft:iron_ingot>]]);
	} else {
		recipes.addShapedMirrored("Quantum Ring", 
		<appliedenergistics2:quantum_ring>, 
		[[<appliedenergistics2:material:9>, <appliedenergistics2:energy_cell>, <appliedenergistics2:material:24>],
		[<appliedenergistics2:energy_cell>, <appliedenergistics2:part:76>, <appliedenergistics2:energy_cell>], 
		[<appliedenergistics2:material:22>, <appliedenergistics2:energy_cell>, <appliedenergistics2:material:23>]]);

		recipes.remove(controller);
		recipes.addShaped("ME Controller", 
		controller, 
		[[<appliedenergistics2:smooth_sky_stone_block>, <advancedrocketry:ic:3>, <appliedenergistics2:smooth_sky_stone_block>],
		[<appliedenergistics2:fluix_block>, <appliedenergistics2:energy_acceptor>, <appliedenergistics2:fluix_block>], 
		[<teslacorelib:machine_case>, pearlFluix, <teslacorelib:machine_case>]]);
	}
	
# Sky stone Dust
scripts.process.crush(<appliedenergistics2:sky_stone_block>, <appliedenergistics2:material:45>, "Except: AEGrinder Pulverizer", null, null);