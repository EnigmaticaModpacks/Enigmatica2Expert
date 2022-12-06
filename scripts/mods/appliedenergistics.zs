import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.craft.grid.Grid;
#modloaded appliedenergistics2
	
var pearlFluix = <ore:pearlFluix>;
var crystalCertus = <ore:crystalCertus>;

// ------ Silicon unification ------
var trueSilicon = <appliedenergistics2:material:5>;
<ore:itemSilicon>.remove([<nuclearcraft:gem:6>, <libvulpes:productingot:3>, <enderio:item_material:5>]);
<ore:ingotSilicon>.add(trueSilicon);

// Removing
furnace.remove(<appliedenergistics2:material:5>); // Furnance quartz dusts -> AE silicon
mods.nuclearcraft.manufactory.removeRecipeWithOutput(<appliedenergistics2:material:5>); // Ingot->AE
mods.mekanism.crusher.removeRecipe(<nuclearcraft:gem:6>); // Sand -> silicon

// Addition
furnace.addRecipe(trueSilicon, <ore:dustCertusQuartz>, 4.0d);
furnace.addRecipe(trueSilicon, <ore:dustNetherQuartz>, 4.0d);
mods.thermalexpansion.Compactor.addMintRecipe(trueSilicon * 2, <minecraft:sand>, 4000);
// ---------------------------------

// Other silver occurances
mods.appliedenergistics2.Grinder.removeRecipe(<minecraft:gold_ore>);
scripts.process.crush(<minecraft:gold_ore>, <thermalfoundation:material:1>, 'only: AEGrinder', [<contenttweaker:dust_tiny_silver>], [0.9f]);

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
      recipes.addShapeless("Shapeless - "~output.displayName, output, [<aeadditions:storage.casing>, input]);
		}
	}

  function newGasCellRecipe(input as IIngredient, output as IItemStack) {
	recipes.remove(output);
	recipes.addShaped(output.displayName, output,
		[[<appliedenergistics2:quartz_glass>, <appliedenergistics2:material:8>, <appliedenergistics2:quartz_glass>],
		[<appliedenergistics2:material:8>, input, <appliedenergistics2:material:8>], 
		[<ore:plateGold>, <ironchest:iron_chest:1>, <ore:plateGold>]]);
    if(!isNull(input)) {
      recipes.addShapeless("Shapeless - "~output.displayName, output, [<aeadditions:storage.casing:2>, input]);
		}
	}

# ---=== Storage Housings ===---

  newCellRecipe(null, <appliedenergistics2:material:39>);
  newAdvCellRecipe(null, <aeadditions:storage.casing>);
  newGasCellRecipe(null, <aeadditions:storage.casing:2>);

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
    newAdvCellRecipe(<aeadditions:storage.component>.definition.makeStack(i), <aeadditions:storage.physical>.definition.makeStack(i));
  }

# ---=== Gas Cells ===---
  for i in 0 .. 7 {
    newGasCellRecipe(<aeadditions:storage.component>.definition.makeStack(i+7), <aeadditions:storage.gas>.definition.makeStack(i));
  }

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
  "A": <ore:plateTitaniumAluminide>,
  "E": <appliedenergistics2:material:24>, # Engineering Processor
  "◙": <rftools:machine_frame>,           # Machine Frame
  ":": <ore:oc:diskDrive>,                # Disk Drive
});

# Matter Condenser
	recipes.remove(<appliedenergistics2:condenser>);	
	mods.extendedcrafting.CompressionCrafting.addRecipe(<appliedenergistics2:condenser>, 
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

# [Energy Acceptor] from [Redstone Engineering Block][+4]
craft.remake(<appliedenergistics2:energy_acceptor>, ["pretty",
  "⌃ ⌃ ⌃",
  "■ ♥ ■",
  "T E T"], {
  "⌃": <appliedenergistics2:part:140>,             # Quartz Fiber
  "■": <appliedenergistics2:fluix_block>,          # Fluix Block
  "♥": <immersiveengineering:metal_decoration0:3>, # Redstone Engineering Block
  "T": <ore:electronTube>,                         # Vacuum Tube
  "E": <appliedenergistics2:material:24>,          # Engineering Processor
});

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
		
# Lapis -> Dust
	mods.appliedenergistics2.Grinder.addRecipe(<ic2:dust:9>, <minecraft:dye:4>, 4);



# If Channels are turned off in the config, these recipes will be changed
	recipes.remove(<appliedenergistics2:quantum_ring>);

	var controller = itemUtils.getItem("appliedenergistics2:controller");
	
	if (isNull(controller)) {
		recipes.addShapedMirrored("Quantum Ring", 
		<appliedenergistics2:quantum_ring>, 
		[[<appliedenergistics2:material:9>, <appliedenergistics2:energy_cell>, <appliedenergistics2:material:24>],
		[<appliedenergistics2:energy_cell>, <enderio:item_me_conduit:1>, <appliedenergistics2:energy_cell>], 
		[<appliedenergistics2:material:22>, <appliedenergistics2:energy_cell>, <appliedenergistics2:material:23>]]);
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
			"o": <ore:controllerModular>,
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
scripts.process.crush(<appliedenergistics2:fluix_block>, <appliedenergistics2:material:8> * 4, "only: SagMill", null, null);

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

# [Printed (Every) Circuit] shortcut in [Cutting Machine]
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
mods.forestry.ThermionicFabricator.addCast(<appliedenergistics2:quartz_glass> * 10, Grid(qglass_grid, {
  "•": <ore:dustQuartz>,
}).shaped(), <liquid:glass> * 1000, <forestry:wax_cast:*>);
mods.forestry.ThermionicFabricator.addCast(<appliedenergistics2:quartz_glass> * 10, Grid(qglass_grid, {
  "•": <ore:dustCertusQuartz>,
}).shaped(), <liquid:glass> * 1000, <forestry:wax_cast:*>);

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

# [ME Interface] from [Annihilation Core][+3]
recipes.removeByRecipeName("appliedenergistics2:network/blocks/interfaces_interface");
craft.make(<appliedenergistics2:interface>, ["pretty",
  "▬ ■ ▬",
  "A   F",
  "▬ ■ ▬"], {
  "A": <appliedenergistics2:material:44>, # Annihilation Core
  "F": <appliedenergistics2:material:43>, # Formation Core
  "■": <ore:blockGlass>, # Glass
  "▬": <ore:ingotTungsten>, # Tungsten Ingot
});

# [ME Storage Bus] from [Resonant Requester][+2]
recipes.remove(<appliedenergistics2:part:220>);
recipes.addShaped("ME Storage Bus", <appliedenergistics2:part:220>, [
	[utils.tryCatch("thermallogistics:requester", 4, <thermaldynamics:retriever:4>)], # Resonant Requester
	[<actuallyadditions:block_giant_chest>], # Small Storage Crate
	[<appliedenergistics2:interface>],       # ME Interface
]);

# [Certus Quartz Tank] from [Tank][+1]
craft.reshapeless(<aeadditions:certustank>, 'ABB', {
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

# [Charged Quartz Fixture]*6 from [Tin Item Casing][+1]
craft.reshapeless(<appliedenergistics2:quartz_fixture> * 6, "⌃⌂", {
  "⌃": <ore:gemChargedCertusQuartz>, # Charged Certus Quartz Crystal
  "⌂": <ic2:casing:6>, # Tin Item Casing
});

# [Vibrant Quartz Glass]*8 from [Glowstone Dust][+1]
craft.remake(<appliedenergistics2:quartz_vibrant_glass> * 8, ["pretty",
  "⌃ ⌃ ⌃",
  "⌃ ▲ ⌃",
  "⌃ ⌃ ⌃"], {
  "⌃": <appliedenergistics2:quartz_glass>, # Quartz Glass
  "▲": <ore:dustGlowstone>,                # Glowstone Dust
});

function regrind(input as IItemStack, output as IItemStack, isOre as bool = false) as void {
	scripts.process.crush(input, output, "strict: aegrinder", isOre ? [output] as IItemStack[] : null, [0.9f]);
}

/*Inject_js(
[['ore', 'dust'], ['ingot', 'dust']]
.map((pair, i) =>
	_.uniqBy(
		getOreBases_byKinds(pair)
		.map(b=>['regrind('+
			getByOredict_first(pair[0]+b).commandString, ', ',
			getByOredict_first(pair[1]+b).commandString+(i==0?', true':'')+');'
		])
	, '0')
  .filter(([input]) => 
    !'minecraft biomesoplenty appliedenergistics2'
    .split(' ')
    .some(p=>input.startsWith(`<${p}:`))
  )
	.sort(([a],[b]) => naturalSort(a,b))
).flat()
)*/
regrind(<actuallyadditions:block_misc:3>        , <actuallyadditions:item_dust:7>, true);
regrind(<appliedenergistics2:charged_quartz_ore>, <appliedenergistics2:material:2>, true);
regrind(<astralsorcery:blockcustomore:1>        , <astralsorcery:itemcraftingcomponent:2>, true);
regrind(<astralsorcery:blockcustomsandore>      , <jaopca:item_dustaquamarine>, true);
regrind(<bigreactors:oreyellorite>              , <bigreactors:dustyellorium>, true);
regrind(<biomesoplenty:gem_ore:1>               , <jaopca:item_dustruby>, true);
regrind(<biomesoplenty:gem_ore:2>               , <jaopca:item_dustperidot>, true);
regrind(<biomesoplenty:gem_ore:3>               , <jaopca:item_dusttopaz>, true);
regrind(<biomesoplenty:gem_ore:4>               , <jaopca:item_dusttanzanite>, true);
regrind(<biomesoplenty:gem_ore:5>               , <jaopca:item_dustmalachite>, true);
regrind(<biomesoplenty:gem_ore:6>               , <jaopca:item_dustsapphire>, true);
regrind(<biomesoplenty:gem_ore:7>               , <jaopca:item_dustamber>, true);
regrind(<biomesoplenty:gem_ore>                 , <jaopca:item_dustamethyst>, true);
regrind(<draconicevolution:draconium_ore>       , <draconicevolution:draconium_dust>, true);
regrind(<endreborn:block_wolframium_ore>        , <contenttweaker:item_ore_tungsten:2>, true);
regrind(<forestry:resources>                    , <jaopca:item_dustapatite>, true);
regrind(<immersiveengineering:ore:5>            , <immersiveengineering:metal:14>, true);
regrind(<libvulpes:ore0:8>                      , <libvulpes:productdust:7>, true);
regrind(<libvulpes:ore0>                        , <libvulpes:productdust>, true);
regrind(<mekanism:oreblock>                     , <mekanism:dust:2>, true);
regrind(<minecraft:coal_ore>                    , <thermalfoundation:material:768>, true);
regrind(<minecraft:diamond_ore>                 , <ic2:dust:5>, true);
regrind(<minecraft:emerald_ore>                 , <actuallyadditions:item_dust:3>, true);
regrind(<minecraft:gold_ore>                    , <thermalfoundation:material:1>, true);
regrind(<minecraft:iron_ore>                    , <thermalfoundation:material>, true);
regrind(<minecraft:lapis_ore>                   , <ic2:dust:9>, true);
regrind(<minecraft:quartz_ore>                  , <appliedenergistics2:material:3>, true);
regrind(<minecraft:redstone_ore>                , <minecraft:redstone>, true);
regrind(<nuclearcraft:ore:3>                    , <nuclearcraft:dust:3>, true);
regrind(<nuclearcraft:ore:5>                    , <nuclearcraft:dust:5>, true);
regrind(<nuclearcraft:ore:6>                    , <ic2:dust:11>, true);
regrind(<nuclearcraft:ore:7>                    , <nuclearcraft:dust:7>, true);
regrind(<rftools:dimensional_shard_ore>         , <jaopca:item_dustdimensionalshard>, true);
regrind(<tconstruct:ore:1>                      , <enderio:item_material:30>, true);
regrind(<tconstruct:ore>                        , <enderio:item_material:31>, true);
regrind(<thermalfoundation:ore:1>               , <thermalfoundation:material:65>, true);
regrind(<thermalfoundation:ore:2>               , <thermalfoundation:material:66>, true);
regrind(<thermalfoundation:ore:3>               , <thermalfoundation:material:67>, true);
regrind(<thermalfoundation:ore:4>               , <thermalfoundation:material:68>, true);
regrind(<thermalfoundation:ore:5>               , <thermalfoundation:material:69>, true);
regrind(<thermalfoundation:ore:6>               , <thermalfoundation:material:70>, true);
regrind(<thermalfoundation:ore:7>               , <thermalfoundation:material:71>, true);
regrind(<thermalfoundation:ore:8>               , <thermalfoundation:material:72>, true);
regrind(<thermalfoundation:ore>                 , <thermalfoundation:material:64>, true);
regrind(<advancedrocketry:productingot:1>       , <advancedrocketry:productdust:1>);
regrind(<advancedrocketry:productingot>         , <advancedrocketry:productdust>);
regrind(<astralsorcery:itemcraftingcomponent:1> , <astralsorcery:itemcraftingcomponent:2>);
regrind(<bigreactors:ingotblutonium>            , <bigreactors:dustblutonium>);
regrind(<bigreactors:ingotcyanite>              , <bigreactors:dustcyanite>);
regrind(<bigreactors:ingotludicrite>            , <bigreactors:dustludicrite>);
regrind(<bigreactors:ingotyellorium>            , <bigreactors:dustyellorium>);
regrind(<draconicevolution:draconium_ingot>     , <draconicevolution:draconium_dust>);
regrind(<enderio:item_alloy_ingot:7>            , <enderio:item_material:74>);
regrind(<endreborn:item_ingot_wolframium>       , <contenttweaker:item_ore_tungsten:2>);
regrind(<immersiveengineering:material:19>      , <immersiveengineering:material:18>);
regrind(<immersiveengineering:metal:5>          , <immersiveengineering:metal:14>);
regrind(<libvulpes:productingot:7>              , <libvulpes:productdust:7>);
regrind(<mekanism:ingot:1>                      , <mekanism:dust:2>);
regrind(<mekanism:ingot>                        , <mekanism:otherdust:5>);
regrind(<minecraft:gold_ingot>                  , <thermalfoundation:material:1>);
regrind(<minecraft:iron_ingot>                  , <thermalfoundation:material>);
regrind(<nuclearcraft:ingot_oxide:1>            , <nuclearcraft:dust_oxide:1>);
regrind(<nuclearcraft:ingot_oxide:2>            , <nuclearcraft:dust_oxide:2>);
regrind(<nuclearcraft:ingot_oxide:3>            , <nuclearcraft:dust_oxide:3>);
regrind(<nuclearcraft:ingot_oxide>              , <nuclearcraft:dust_oxide>);
regrind(<nuclearcraft:ingot:3>                  , <nuclearcraft:dust:3>);
regrind(<nuclearcraft:ingot:5>                  , <nuclearcraft:dust:5>);
regrind(<nuclearcraft:ingot:6>                  , <ic2:dust:11>);
regrind(<nuclearcraft:ingot:7>                  , <nuclearcraft:dust:7>);
regrind(<nuclearcraft:ingot:8>                  , <nuclearcraft:dust:8>);
regrind(<nuclearcraft:ingot:9>                  , <nuclearcraft:dust:9>);
regrind(<nuclearcraft:ingot:10>                 , <nuclearcraft:dust:10>);
regrind(<nuclearcraft:ingot:11>                 , <nuclearcraft:dust:11>);
regrind(<psi:material:1>                        , <psi:material>);
regrind(<redstonearsenal:material:32>           , <redstonearsenal:material>);
regrind(<redstonerepository:material:1>         , <redstonerepository:material>);
regrind(<tconevo:metal:5>                       , <tconevo:metal:6>);
regrind(<tconevo:metal:10>                      , <tconevo:metal:11>);
regrind(<tconevo:metal:15>                      , <tconevo:metal:16>);
regrind(<tconevo:metal:20>                      , <tconevo:metal:21>);
regrind(<tconevo:metal:25>                      , <tconevo:metal:26>);
regrind(<tconevo:metal:30>                      , <tconevo:metal:31>);
regrind(<tconevo:metal:35>                      , <tconevo:metal:36>);
regrind(<tconevo:metal:40>                      , <tconevo:metal:41>);
regrind(<tconevo:metal>                         , <tconevo:metal:1>);
regrind(<tconstruct:ingots:1>                   , <enderio:item_material:30>);
regrind(<tconstruct:ingots>                     , <enderio:item_material:31>);
regrind(<thermalfoundation:material:128>        , <thermalfoundation:material:64>);
regrind(<thermalfoundation:material:129>        , <thermalfoundation:material:65>);
regrind(<thermalfoundation:material:130>        , <thermalfoundation:material:66>);
regrind(<thermalfoundation:material:131>        , <thermalfoundation:material:67>);
regrind(<thermalfoundation:material:132>        , <thermalfoundation:material:68>);
regrind(<thermalfoundation:material:133>        , <thermalfoundation:material:69>);
regrind(<thermalfoundation:material:134>        , <thermalfoundation:material:70>);
regrind(<thermalfoundation:material:135>        , <thermalfoundation:material:71>);
regrind(<thermalfoundation:material:136>        , <thermalfoundation:material:72>);
regrind(<thermalfoundation:material:160>        , <thermalfoundation:material:96>);
regrind(<thermalfoundation:material:161>        , <thermalfoundation:material:97>);
regrind(<thermalfoundation:material:162>        , <thermalfoundation:material:98>);
regrind(<thermalfoundation:material:163>        , <thermalfoundation:material:99>);
regrind(<thermalfoundation:material:164>        , <thermalfoundation:material:100>);
regrind(<thermalfoundation:material:165>        , <thermalfoundation:material:101>);
regrind(<thermalfoundation:material:166>        , <thermalfoundation:material:102>);
regrind(<thermalfoundation:material:167>        , <thermalfoundation:material:103>);
/**/

regrind(<minecraft:obsidian>, <thermalfoundation:material:770>);

# [Pattern Expansion Card] from [ME Interface][+2]
craft.remake(<appliedenergistics2:material:58>, ["pretty",
  "  A  ",
  "d M A",
  "  A  "], {
  "A": <ore:plateTitanium>,
  "d": <appliedenergistics2:material:28>, # Advanced Card
  "M": <appliedenergistics2:interface>,   # ME Interface
});

# [Pattern Expansion Card] from [ME Interface][+2]
craft.make(<appliedenergistics2:material:58>, ["pretty",
  "  A  ",
  "d M A",
  "  A  "], {
  "A": <ore:plateTitanium>,
  "d": <appliedenergistics2:material:28>, # Advanced Card
  "M": <appliedenergistics2:part:440>,    # ME Interface
});

# ---------------------------------
# Storage Component rework
# ---------------------------------
val storCompIngrs = [
	[<appliedenergistics2:material:35>, /*     1k */ <ore:dustGlowstone>, <appliedenergistics2:material:22>, /*Logic Processor*/              <appliedenergistics2:material:1>], # Charged Certus Quartz Crystal
	[<appliedenergistics2:material:36>, /*     4k */ <ore:dustGlowstone>, <appliedenergistics2:material:22>, /*Logic Processor*/              <ic2:re_battery>.withTag({charge: 10000.0})], # RE-Battery
	[<appliedenergistics2:material:37>, /*    16k */ <ore:dustGlowstone>, <appliedenergistics2:material:23>, /*Calculation Processor*/        <ic2:advanced_re_battery>.withTag({charge: 100000.0})], # Advanced RE-Battery
	[<appliedenergistics2:material:38>, /*    64k */ <ore:dustGlowstone>, <appliedenergistics2:material:23>, /*Calculation Processor*/        <ic2:energy_crystal>.withTag({charge: 1000000.0})], # Energy Crystal
	[<aeadditions:storage.component>  , /*   256k */ <ore:dustGlowstone>, <appliedenergistics2:material:24>, /*Engineering Processor*/        <ic2:lapotron_crystal>.withTag({charge: 1.0E7})], # Lapotron Crystal
	[<aeadditions:storage.component:1>, /*  1024k */ <ore:dustGlowstone>, <appliedenergistics2:material:24>, /*Engineering Processor*/        <requious:quantron>.withTag({energy: 200000000})], # Quantron
	[<aeadditions:storage.component:2>, /*  4096k */ <ore:dustGlowstone>, <threng:material:6>,               /*Massively Parallel Processor*/ <requious:positron_unit>.withTag({energy: 2000000000})], # Positron Unit
	[<aeadditions:storage.component:3>, /* 16384k */ <ore:dustGlowstone>, <threng:material:6>,               /*Massively Parallel Processor*/ <ore:blockDraconiumCharged>], # Charged Draconium Block
] as IIngredient[][];

for i, inputs in storCompIngrs {
	craft.remake(inputs[0].items[0], ["pretty",
		"♥ - ♥",
		"⌃ C ⌃",
		"♥ - ♥"], {
		"♥": inputs[1], # Dust
		"-": inputs[2], # Processor
		"⌃": i==0 ? <appliedenergistics2:material:1> as IIngredient : storCompIngrs[i - 1][0], # Prev
		"C": inputs[3], # Battery
	});
}
# ---------------------------------

// Clear singularity tags
recipes.addShapeless('Clear singularity tags', <appliedenergistics2:material:48> * 2, [<ore:singularityEntangled>, <ore:singularityEntangled>]);
