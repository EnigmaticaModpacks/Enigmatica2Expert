import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.item.IIngredient as IIngredient;
import scripts.craft.grid.Grid;
#modloaded appliedenergistics2
	
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

# [ME Drive] from [Disk Drive][+3]
craft.remake(<appliedenergistics2:drive>, ["pretty",
  "A A A",
  "A : A",
  "E ◙ E"], {
  "A": <ore:sheetAluminum>, # Aluminum Sheet
  "E": <appliedenergistics2:material:24>, # Engineering Processor
  "◙": <rftools:machine_frame>,           # Machine Frame
  ":": <ore:oc:diskDrive>,                # Disk Drive
});

# Matter Condenser
	recipes.remove(<appliedenergistics2:condenser>);	
	scripts.wrap.extendedcrafting.CompressionCrafting.addRecipe(<appliedenergistics2:condenser>, 
	<minecraft:piston>, 10000, <excompressum:double_compressed_diamond_hammer>, 1000000000, 1000000);
	
# [Molecular Assembler] from [Augment_ Pattern Validation][+4]
craft.remake(<appliedenergistics2:molecular_assembler>, ["pretty",
  "D • D",
  "F u A",
  "D • D"], {
  "A": <appliedenergistics2:material:44>,  # Annihilation Core
  "•": <appliedenergistics2:quartz_glass>, # Quartz Glass
  "D": <enderio:item_data_conduit>,        # Data Conduit
  "u": <thermalexpansion:augment:432>,     # Augment: Pattern Validation
  "F": <appliedenergistics2:material:43>,  # Formation Core
});

# Grindstone
	recipes.remove(<appliedenergistics2:grindstone>);
	recipes.addShapedMirrored("Grindstone", 
	<appliedenergistics2:grindstone>, 
	[[<appliedenergistics2:smooth_sky_stone_block>, <ore:gearWood>, <appliedenergistics2:smooth_sky_stone_block>],
	[<ore:crystalCertusQuartz>, <appliedenergistics2:smooth_sky_stone_block>, <ore:crystalCertusQuartz>], 
	[<appliedenergistics2:sky_stone_block>, <ore:crystalCertusQuartz>, <appliedenergistics2:sky_stone_block>]]);

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
	scripts.wrap.thermalexpansion.Compactor.addPressRecipe(<appliedenergistics2:material:13>, <appliedenergistics2:quartz_block>, 50000);
	scripts.wrap.thermalexpansion.Compactor.addPressRecipe(<appliedenergistics2:material:14>, <minecraft:diamond_block>, 50000);
	scripts.wrap.thermalexpansion.Compactor.addPressRecipe(<appliedenergistics2:material:15>, <ic2:plate:11>, 50000);
	scripts.wrap.thermalexpansion.Compactor.addPressRecipe(<appliedenergistics2:material:19>, <extrautils2:compressedsand:1>, 50000);

# Charged Certus Quartz -> Certus Dust
	scripts.wrap.thermalexpansion.Pulverizer.addRecipe(<appliedenergistics2:material:2>, <appliedenergistics2:material:1>, 2000, <appliedenergistics2:material:2>, 20);
		
# Lapis -> Dust
	scripts.wrap.appliedenergistics2.Grinder.addRecipe(<ic2:dust:9>, <minecraft:dye:4>, 4);



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
		[[<ore:ingotFakeIron>, anyFluix, <ore:ingotFakeIron>], 
		[anyFluix, meConduit, anyFluix],
		[<ore:ingotFakeIron>, anyFluix, <ore:ingotFakeIron>]]);
	} else {
		recipes.addShapedMirrored("Quantum Ring", 
		<appliedenergistics2:quantum_ring>, 
		[[<appliedenergistics2:material:9>, <appliedenergistics2:energy_cell>, <appliedenergistics2:material:24>],
		[<appliedenergistics2:energy_cell>, <appliedenergistics2:part:76>, <appliedenergistics2:energy_cell>], 
		[<appliedenergistics2:material:22>, <appliedenergistics2:energy_cell>, <appliedenergistics2:material:23>]]);

		# [ME Controller] from [Energy Acceptor][+5]
		craft.remake(<appliedenergistics2:controller>, ["pretty",
			"C o C",
			"F Ϟ F",
			"M A M"], {
			"A": <appliedenergistics2:material:28>,     # Advanced Card
			"C": <contenttweaker:compressed_crushed_skystone>, # Compressed Crushed Skystone
			"F": <ore:pearlFluix>,                      # Fluix Pearl
			"M": <thermalexpansion:frame>,              # Machine Frame
			"Ϟ": <appliedenergistics2:energy_acceptor>, # Energy Acceptor
			"o": <modularmachinery:blockcontroller>,
		});
	}

# [Advanced Card*2] from [Calculation Processor][+3]
craft.remake(<appliedenergistics2:material:28> * 2, ["pretty",
  "▲ ▬  ",
  "♥ C ▬",
  "▲ ▬  "], {
  "▲": <ore:dustCryotheum>,               # Cryotheum Dust
  "C": <appliedenergistics2:material:23>, # Calculation Processor
  "♥": <ore:ingotRedstoneAlloy>,          # Redstone Alloy Ingot
  "▬": <ore:ingotElectricalSteel>,        # Electrical Steel Ingot
});


# Add ore for Better Questing
<ore:craftingStorageAny>.add([
  <appliedenergistics2:crafting_storage_64k>,
  <appliedenergistics2:crafting_storage_16k>,
  <appliedenergistics2:crafting_storage_4k>,
  <appliedenergistics2:crafting_storage_1k>,
]);

# Sky stone Dust
scripts.process.crush(<appliedenergistics2:sky_stone_block>, <appliedenergistics2:material:45>, "Except: AEGrinder Pulverizer", null, null);

# Batch dust crushing
scripts.process.crush(<appliedenergistics2:fluix_block>, <appliedenergistics2:material:8>, "only: SagMill", null, null);

/* 
Patchouli_js('Items/Matter Cannon', [
  {
    icon: "appliedenergistics2:matter_cannon",
    title: "Matter Cannon Ammo",
    _text: `
      This items can be used as ammo for $(l)Matter Cannon/$.
      Number represent $(l)Atomic_Mass / 10/$, not actual damage!`
  },
  ...paged({
    title: "Matter Cannon Ammo",
    type:  "grid"
  },
    match_block_below(/^<([^>]+)>\s*:\s*(\d+)\.0d,$/gm)
		.sort((a,b)=>b[2]-a[2])
    .map(match=>match[1] +'#'+ Math.round(match[2] / 10))
  )
])*/
# Matter cannon more matter
val itemMass as double[IItemStack] = {
<tconevo:metal:42>                                   : 500.0d,
<deepmoblearning:pristine_matter_zombie>             : 100.0d,
<deepmoblearning:pristine_matter_skeleton>           : 100.0d,
<deepmoblearning:pristine_matter_creeper>            : 100.0d,
<deepmoblearning:pristine_matter_spider>             : 100.0d,
<deepmoblearning:pristine_matter_slime>              : 100.0d,
<deepmoblearning:pristine_matter_witch>              : 100.0d,
<deepmoblearning:pristine_matter_blaze>              : 150.0d,
<deepmoblearning:pristine_matter_ghast>              : 150.0d,
<deepmoblearning:pristine_matter_wither_skeleton>    : 200.0d,
<deepmoblearning:pristine_matter_enderman>           : 200.0d,
<deepmoblearning:pristine_matter_wither>             : 250.0d,
<deepmoblearning:pristine_matter_dragon>             : 400.0d,
<deepmoblearning:pristine_matter_shulker>            : 150.0d,
<deepmoblearning:pristine_matter_guardian>           : 150.0d,
<deepmoblearning:pristine_matter_thermal_elemental>  : 150.0d,
<deepmoblearning:pristine_matter_tinker_slime>       : 100.0d,
<deepmoblearning:pristine_matter_twilight_forest>    : 200.0d,
<deepmoblearning:pristine_matter_twilight_swamp>     : 200.0d,
<deepmoblearning:pristine_matter_twilight_darkwood>  : 200.0d,
<deepmoblearning:pristine_matter_twilight_glacier>   : 200.0d,
<nuclearcraft:thorium:2>     												 : 230.0d,
<nuclearcraft:thorium:3>     												 : 230.0d,
<nuclearcraft:thorium:6>     												 : 232.0d,
<nuclearcraft:thorium:7>     												 : 232.0d,
<nuclearcraft:uranium:2>     												 : 233.0d,
<nuclearcraft:uranium:3>     												 : 234.0d,
<nuclearcraft:uranium:6>     												 : 235.0d,
<nuclearcraft:uranium:7>     												 : 235.0d,
<nuclearcraft:uranium:10>    												 : 238.0d,
<nuclearcraft:uranium:11>    												 : 238.0d,
<nuclearcraft:neptunium:2>   												 : 236.0d,
<nuclearcraft:neptunium:3>   												 : 236.0d,
<nuclearcraft:neptunium:6>   												 : 237.0d,
<nuclearcraft:neptunium:7>   												 : 237.0d,
<nuclearcraft:plutonium:2>   												 : 238.0d,
<nuclearcraft:plutonium:3>   												 : 238.0d,
<nuclearcraft:plutonium:6>   												 : 239.0d,
<nuclearcraft:plutonium:7>   												 : 239.0d,
<nuclearcraft:plutonium:10>  												 : 241.0d,
<nuclearcraft:plutonium:11>  												 : 241.0d,
<nuclearcraft:plutonium:14>  												 : 242.0d,
<nuclearcraft:plutonium:15>  												 : 242.0d,
<nuclearcraft:americium:2>   												 : 241.0d,
<nuclearcraft:americium:3>   												 : 241.0d,
<nuclearcraft:americium:6>   												 : 242.0d,
<nuclearcraft:americium:7>   												 : 242.0d,
<nuclearcraft:americium:10>  												 : 243.0d,
<nuclearcraft:americium:11>  												 : 244.0d,
<nuclearcraft:curium:2>      												 : 243.0d,
<nuclearcraft:curium:3>      												 : 243.0d,
<nuclearcraft:curium:6>      												 : 245.0d,
<nuclearcraft:curium:7>      												 : 245.0d,
<nuclearcraft:curium:10>     												 : 246.0d,
<nuclearcraft:curium:11>     												 : 246.0d,
<nuclearcraft:curium:14>     												 : 247.0d,
<nuclearcraft:curium:15>     												 : 247.0d,
<nuclearcraft:berkelium:2>   												 : 247.0d,
<nuclearcraft:berkelium:3>   												 : 247.0d,
<nuclearcraft:berkelium:6>   												 : 248.0d,
<nuclearcraft:berkelium:7>   												 : 248.0d,
<nuclearcraft:californium:2> 												 : 249.0d,
<nuclearcraft:californium:3> 												 : 249.0d,
<nuclearcraft:californium:6> 												 : 250.0d,
<nuclearcraft:californium:7> 												 : 250.0d,
<nuclearcraft:californium:10>												 : 251.0d,
<nuclearcraft:californium:11>												 : 251.0d,
<nuclearcraft:californium:14>												 : 252.0d,
<nuclearcraft:californium:15>												 : 252.0d,
<nuclearcraft:boron:1>       												 : 10.0d,
<nuclearcraft:boron:3>       												 : 11.0d,
<nuclearcraft:lithium:1>     												 : 6.0d,
<nuclearcraft:lithium:3>     												 : 7.0d,
} as double[IItemStack];

for item, mass in itemMass {
	if (!isNull(item)) {
		mods.appliedenergistics2.Cannon.registerAmmo(item, mass);
	}
}

# Circuits alternative
scripts.process.saw(<ore:blockGold>, <appliedenergistics2:material:18> *  9, "only: AdvRockCutter");
scripts.process.saw(<ore:blockDiamond>, <appliedenergistics2:material:17> *  9, "only: AdvRockCutter");
scripts.process.saw(<ore:crystalPureCertusQuartz> * 9, <appliedenergistics2:material:16> *  9, "only: AdvRockCutter");

val circIngrs = [<ore:dustRedstone>, <ore:itemSilicon>] as IIngredient[];
val aeMat = <appliedenergistics2:material>.definition;
scripts.processUtils.avdRockXmlRecipe("PrecisionAssembler", circIngrs + aeMat.makeStack(18), null, [aeMat.makeStack(22)], null);
scripts.processUtils.avdRockXmlRecipe("PrecisionAssembler", circIngrs + aeMat.makeStack(17), null, [aeMat.makeStack(24)], null);
scripts.processUtils.avdRockXmlRecipe("PrecisionAssembler", circIngrs + aeMat.makeStack(16), null, [aeMat.makeStack(23)], null);

# ---------------------------------------------------------
# Make Quartz glass harder and then Show through fabricator

recipes.remove(<appliedenergistics2:quartz_glass>);

# [Quartz Glass*2] from [Glass][+1]
craft.make(<appliedenergistics2:quartz_glass> * 2, ["pretty",
  "• □ •",
  "□ • □",
  "• □ •"], {
  "□": <ore:blockGlass>, # Glass
  "•": <ore:dustQuartz> | <ore:dustCertusQuartz>,
});

# [Quartz Glass*8] from [Nether Quartz Dust]
val qglass_grid = ["pretty",
  "• • •",
  "•   •",
  "• • •"] as string[];
scripts.wrap.forestry.ThermionicFabricator.addCast(<appliedenergistics2:quartz_glass> * 10, Grid(qglass_grid, {
  "•": <ore:dustQuartz>,
}).shaped(), <liquid: glass> * 1000, <forestry:wax_cast:*>);
scripts.wrap.forestry.ThermionicFabricator.addCast(<appliedenergistics2:quartz_glass> * 10, Grid(qglass_grid, {
  "•": <ore:dustCertusQuartz>,
}).shaped(), <liquid: glass> * 1000, <forestry:wax_cast:*>);

# ---------------------------------------------------------

# [Crafting Unit] from [Logic Processor][+3]
craft.remake(<appliedenergistics2:crafting_unit>, ["pretty",
  "▬ C ▬",
  "M L M",
  "▬ C ▬"], {
  "C": <appliedenergistics2:material:23>, # Calculation Processor
  "▬": <ore:ingotFluixSteel>,             # Fluix Steel Ingot
  "L": <appliedenergistics2:material:22>, # Logic Processor
  "M": <appliedenergistics2:part:76>,     # ME Dense Smart Cable - Fluix
});

# [ME Storage Bus] from [Resonant Requester][+2]
recipes.remove(<appliedenergistics2:part:220>);
recipes.addShaped("ME Storage Bus", <appliedenergistics2:part:220>, [
	[<thermallogistics:requester:4>],        # Resonant Requester
	[<actuallyadditions:block_giant_chest>], # Small Storage Crate
	[<appliedenergistics2:interface>],       # ME Interface
]);

# [Certus Quartz Tank] from [Tank][+1]
craft.reshapeless(<extracells:certustank>, 'ABB', {
  "A": <enderio:block_omni_reservoir>,                  # Tank
  "B": <appliedenergistics2:quartz_glass>, # Quartz Glass
});


# ---------------------------------------------------------
# Universal facade crafting recipe
# Sadly, this cant be changed like this.
# Option
#   B:EnableFacadeCrafting=false
# wont actually remove crafting recipes.
# Also, recipes.remove dont work too.
// val A = <appliedenergistics2:part:120>;
// recipes.remove(<appliedenergistics2:facade:*>);
// recipes.addHiddenShaped("Universal Facade", <appliedenergistics2:facade>, [
// 	[null, A, null],       
// 	[A, <*>.marked('block'), A],
// 	[null, A, null],      
// ],
// function(out, ins, cInfo) {
// 	if(isNull(ins) || isNull(ins.block)) return null;
//   return <appliedenergistics2:facade>.withTag({damage: ins.block.damage, item: ins.block.definition.id});
// });
// recipes.addShaped("Universal Facade Example", <appliedenergistics2:facade>.withTag({damage: 0, item: "minecraft:cobblestone"}), [
// 	[null, A, null],       
// 	[A, <minecraft:cobblestone>, A],
// 	[null, A, null],      
// ]);
# ---------------------------------------------------------

# [1k ME Storage Component] from [Cobweb][+3]
craft.remake(<appliedenergistics2:material:35>, ["pretty",
  "♥ L ♥",
  "⌃ C ⌃",
  "♥ ⌃ ♥"], {
  "⌃": <ore:crystalCertus>, # Certus Quartz Crystal
  "C": <minecraft:web>, # Cobweb
  "♥": <ore:dustRedstone>, # Redstone
  "L": <appliedenergistics2:material:22>, # Logic Processor
});