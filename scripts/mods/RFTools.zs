#modloaded rftools
	
# Mooshroom Syringe
	recipes.addShapeless("Mooshroom Syringe", 
	<rftools:syringe>.withTag({mobName: "Mooshroom", level: 10, mobId: "minecraft:mooshroom"}), 
	[<rftools:syringe>,<excompressum:bait:2>,<minecraft:hay_block>,<ore:listAllmushroom>]);

# Modular Storage
	recipes.remove(<rftools:modular_storage>);
	recipes.addShaped("Modular Storage 1", <rftools:modular_storage>, 
	[[<ore:dustRedstone>, <ore:chest>, <ore:dustRedstone>],
	[<ore:gemQuartz>, <immersiveengineering:wooden_device0:5>, <ore:gemQuartz>], 
	[<ore:dustRedstone>, <ore:gemQuartz>, <ore:dustRedstone>]]);
	
	recipes.addShaped("Modular Storage 2", <rftools:modular_storage>, 
	[[<ore:dustRedstone>, <ore:chest>, <ore:dustRedstone>],
	[<ore:gemQuartz>, <forestry:sturdy_machine>, <ore:gemQuartz>], 
	[<ore:dustRedstone>, <ore:gemQuartz>, <ore:dustRedstone>]]);
	
	recipes.addShaped("Modular Storage 3", <rftools:modular_storage>, 
	[[<ore:dustRedstone>, <ore:chest>, <ore:dustRedstone>],
	[<ore:gemQuartz>, <ic2:resource:12>, <ore:gemQuartz>], 
	[<ore:dustRedstone>, <ore:gemQuartz>, <ore:dustRedstone>]]);
	
# Storage Scanner
	recipes.remove(<rftools:storage_scanner>);
	recipes.addShaped("Storage Scanner 1", <rftools:storage_scanner>,
	[[<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>],
	[<ore:ingotGold>, <mekanism:basicblock:8>, <ore:ingotGold>],
	[<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>]]);
	
	recipes.addShaped("Storage Scanner 2", <rftools:storage_scanner>,
	[[<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>],
	[<ore:ingotGold>, <actuallyadditions:block_misc:9>, <ore:ingotGold>],
	[<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>]]);
	
	recipes.addShaped("Storage Scanner 3", <rftools:storage_scanner>,
	[[<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>],
	[<ore:ingotGold>, <teslacorelib:machine_case>, <ore:ingotGold>],
	[<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>]]);
	
	recipes.addShaped("Storage Scanner 4", <rftools:storage_scanner>,
	[[<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>],
	[<ore:ingotGold>, <nuclearcraft:part:10>, <ore:ingotGold>],
	[<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>]]);

# Matter Transmitter
	recipes.remove(<rftools:matter_transmitter>);
	recipes.addShaped("RFTools Matter Transmitter", 
	<rftools:matter_transmitter>, 
	[[<ore:enderpearl>, <ore:enderpearl>, <ore:enderpearl>],
	[<mekanism:teleportationcore>, <ic2:te:39>, <mekanism:teleportationcore>], 
	[<appliedenergistics2:smooth_sky_stone_block>, <appliedenergistics2:smooth_sky_stone_block>, <appliedenergistics2:smooth_sky_stone_block>]]);

# Matter Receiver
	recipes.remove(<rftools:matter_receiver>);
	recipes.addShaped("RFTools Matter Receiver", 
	<rftools:matter_receiver>, 
	[[<appliedenergistics2:smooth_sky_stone_block>, <appliedenergistics2:smooth_sky_stone_block>, <appliedenergistics2:smooth_sky_stone_block>],
	[<mekanism:teleportationcore>, <ic2:te:39>, <mekanism:teleportationcore>], 
	[<ore:enderpearl>, <ore:enderpearl>, <ore:enderpearl>]]);

# Machine Frame
	recipes.remove(<rftools:machine_frame>);
	recipes.addShaped("RFTools Machine Frame", 
	<rftools:machine_frame> * 2, 
	[[<ic2:heat_vent>, <ore:gearGold>, <ic2:heat_vent>],
	[<industrialforegoing:dryrubber>, <teslacorelib:machine_case>, <industrialforegoing:dryrubber>], 
	[<industrialforegoing:pink_slime>, <industrialforegoing:range_addon:*>, <industrialforegoing:pink_slime>]]);

# Machine Base
	recipes.remove(<rftools:machine_base>);
	recipes.addShapedMirrored("Machine Base", 
	<rftools:machine_base>, 
	[[null, null, null],
	[<ore:plateCopper>, <ore:plateCopper>, <ore:plateCopper>], 
	[<ore:stone>, <ore:stone>, <ore:stone>]]);

# Quarry Card
	recipes.remove(<rftools:shape_card:2>);
	recipes.addShapedMirrored("Quarry Card",
	<rftools:shape_card:2>, 
	[[<rftools:machine_frame>, <tconstruct:hammer_head>.withTag({Material: "osgloglas"}), <rftools:machine_frame>],
	[<tconstruct:hammer_head>.withTag({Material: "manyullyn"}), <thermalexpansion:frame:146>, <tconstruct:hammer_head>.withTag({Material: "psimetal"})], 
	[<rftools:machine_frame>, <tconstruct:hammer_head>.withTag({Material: "enderium"}), <rftools:machine_frame>]]);
	
	recipes.addShaped("Quarry Card Clearing to Normal", 
	<rftools:shape_card:2>, 
	[[<ore:dirt>, <ore:dirt>, <ore:dirt>],
	[<ore:dirt>, <rftools:shape_card:5>, <ore:dirt>], 
	[<ore:dirt>, <ore:dirt>, <ore:dirt>]]);


# Crafter tier 1-3
	recipes.remove(<rftools:crafter1>);
	recipes.addShapedMirrored("RFTools Crafter1",
	<rftools:crafter1>, 
	[[null, <ore:gearRedstone>, null],
	[<extrautils2:analogcrafter>, <extrautils2:machine>, <extrautils2:analogcrafter>], 
	[null, <ore:gearRedstone>, null]]);

	recipes.remove(<rftools:crafter2>);
	recipes.addShapedMirrored("RFTools Crafter2",
	<rftools:crafter2>, 
	[[null, <ore:gearRedstone>, null],
	[<extrautils2:analogcrafter>, <rftools:crafter1>, <extrautils2:analogcrafter>], 
	[null, <ore:gearRedstone>, null]]);
		
	recipes.remove(<rftools:crafter3>);
	recipes.addShapedMirrored("RFTools Crafter3",
	<rftools:crafter3>, 
	[[null, <ore:gearRedstone>, null],
	[<extrautils2:analogcrafter>, <rftools:crafter2>, <extrautils2:analogcrafter>], 
	[null, <ore:gearRedstone>, null]]);

# Storage Modules
	recipes.remove(<rftools:storage_module>);
	recipes.addShaped("rftools_storage_module_0", <rftools:storage_module>, [
		[<storagedrawers:upgrade_storage:1>, null, <storagedrawers:upgrade_storage:1>],
		[<ore:oc:materialCircuitBoardPrinted>, <ore:chest>, <ore:oc:materialCircuitBoardPrinted>],
		[<storagedrawers:upgrade_storage:1>, null, <storagedrawers:upgrade_storage:1>]]);

	recipes.remove(<rftools:storage_module:1>);
	recipes.addShaped("rftools_storage_module_1", <rftools:storage_module:1>, [
		[<storagedrawers:upgrade_storage:3>, null, <storagedrawers:upgrade_storage:3>],
		[<ore:circuitBasic>, <rftools:storage_module>.marked("module"), <ore:circuitBasic>], 
		[<storagedrawers:upgrade_storage:3>, null, <storagedrawers:upgrade_storage:3>]
	], function(out, ins, cInfo) {
		if(ins has "module" && !isNull(ins.module) && ins.module.hasTag) {
			return out.withTag(ins.module.tag);
		}
		return out;
	}, null);

	recipes.remove(<rftools:storage_module:2>);
	recipes.addShaped("rftools_storage_module_2", <rftools:storage_module:2>, [
		[<storagedrawers:upgrade_storage:4>, null, <storagedrawers:upgrade_storage:4>],
		[<ore:circuitBoard>, <rftools:storage_module:1>.marked("module"), <ore:circuitBoard>], 
		[<storagedrawers:upgrade_storage:4>, null, <storagedrawers:upgrade_storage:4>]
	], function(out, ins, cInfo) {
		if(ins has "module" && !isNull(ins.module) && ins.module.hasTag) {
			return out.withTag(ins.module.tag);
		}
		return out;
	}, null);

# Harder card recipe
recipes.removeByRecipeName("rftools:powercell_card");
recipes.addShaped(<rftools:powercell_card> * 4, [
	[<energeticsheep:energetic_wool:*>, <computercraft:printout>, <energeticsheep:energetic_wool:*>],
	[<computercraft:printout>, <rats:charged_creeper_chunk>, <computercraft:printout>],
	[<energeticsheep:energetic_wool:*>, <computercraft:printout>, <energeticsheep:energetic_wool:*>]]);

# Power cells
val iWireless = <cd4017be_lib:m:402>;
val iGate = <biomesoplenty:crystal_shard>;
val iPower = <energeticsheep:energetic_wool:*>;
remake("rftools powercell_simple", <rftools:powercell_simple>, [
	[iPower, iWireless, iPower], 
	[<minecraft:quartz>, <rftools:machine_frame>, <minecraft:quartz>], 
	[iPower, iWireless, iPower]]);

remake("rftools powercell_normal", <rftools:powercell>, [
	[<deepmoblearning:soot_covered_redstone>, iWireless, <deepmoblearning:soot_covered_redstone>],
	 [iGate, <rftools:powercell_simple>, iGate], 
	 [<deepmoblearning:soot_covered_redstone>, <minecraft:emerald>, <deepmoblearning:soot_covered_redstone>]]);

remake("rftools powercell", <rftools:powercell>, [
	[iPower, iWireless, iPower], 
	[iGate, <rftools:machine_frame>, iGate], 
	[iPower, <minecraft:emerald>, iPower]]);

remake("rftools powercell_advanced", <rftools:powercell_advanced>, [
	[iPower, <rftools:infused_diamond>, iPower], 
	[<rftools:infused_diamond>, <rftools:powercell>, <rftools:infused_diamond>], 
	[iPower, <rftools:infused_diamond>, iPower]]);

# Matter beamer
remake("rftools matter_beamer", <rftools:matter_beamer>, [
	[<rats:charged_creeper_chunk>, <ore:glowstone>, <rats:charged_creeper_chunk>],
	[<ore:glowstone>, <rftools:machine_frame>, <ore:glowstone>],
	[<rats:charged_creeper_chunk>, <ore:glowstone>, <rats:charged_creeper_chunk>]]);
