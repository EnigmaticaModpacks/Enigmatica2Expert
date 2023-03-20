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
	[<rftools:machine_frame>, <tconstruct:hammer_head>.withTag({Material: "enderium_plustic"}), <rftools:machine_frame>]]);
	
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
	
	
	