/*
	IC2 Recipes
	Built by BookerTheGeek
*/

//	Imports
	import crafttweaker.item.IItemStack;

//	Variables
	var tinCableIns = <ic2:cable:4>.withTag({type: 4 as byte, insulation: 1 as byte}) as IItemStack;
	var goldCableIns = <ic2:cable:2>.withTag({type: 2 as byte, insulation: 2 as byte}) as IItemStack;
	var copperCableIns = <ic2:cable>.withTag({type: 0 as byte, insulation: 1 as byte}) as IItemStack;
	var highCableIns = <ic2:cable:3>.withTag({type: 3 as byte, insulation: 3 as byte}) as IItemStack;
	var perfectRSH = <ic2:rsh_condensator>.withTag({advDmg: 0}) as IItemStack;
	var perfectLZH = <ic2:lzh_condensator>.withTag({advDmg: 0}) as IItemStack;
	var tinCable = <ic2:cable:4>.withTag({type: 4 as byte, insulation: 0 as byte}) as IItemStack;
	var glassCable = <ic2:cable:1>.withTag({type: 1 as byte, insulation: 0 as byte}) as IItemStack;
#	var null = null as IItemStack;

/*
	The following recipies are in Industrialcraft.zs
		Jetpacks
		Hazmat/Rubber Armor
		Clay Dust
		Bronze
		Batch Crafter
		Jetpack Attachment Plate
		Overclocker Upgrade
		Iridium Reinforced Plate
		Reactor Chamber
		Basic Machine Casing
		Reinforced Stone
		MFE -> MFSU Upgrade Kit removal
		Industrial Diamond (Replaced with regular diamond)
		Lapis Dust
		Diamond Dust
*/

//	Electronic Circuit
	recipes.remove(<ic2:crafting:1>);
	recipes.addShapedMirrored(<ic2:crafting:1>, [
		[copperCableIns, copperCableIns, copperCableIns],
		[<ore:dustRedstone>, <ore:plateIron>, <ore:dustRedstone>],
		[copperCableIns, copperCableIns, copperCableIns]
	]);

//	Advanced Circuit
	recipes.remove(<ic2:crafting:2>);
	recipes.addShapedMirrored(<ic2:crafting:2>, [
		[<ore:dustRedstone>, <minecraft:dye:4>, <ore:dustRedstone>],
		[<ore:dustGlowstone>, <ore:circuitBasic>, <ore:dustGlowstone>],
		[<ore:dustRedstone>, <minecraft:dye:4>, <ore:dustRedstone>]
	]);
	
//	Nuclear Reactor Vessel
	recipes.remove(<ic2:resource:14>);
	recipes.addShaped(<ic2:resource:14>*4, [
		[<ore:plateLead>, <minecraft:stone:*>, <ore:plateLead>],
		[<minecraft:stone:*>, <ore:plateLead>, <minecraft:stone:*>],
		[<ore:plateLead>, <minecraft:stone:*>, <ore:plateLead>]
	]);

//	Nuclear Reactor Access Hatch
	recipes.remove(<ic2:te:23>);
	recipes.addShaped(<ic2:te:23>, [
		[<ic2:resource:14>, <ic2:resource:14>, <ic2:resource:14>],
		[<ic2:resource:14>, <ore:trapdoorWood>, <ic2:resource:14>],
		[<ic2:resource:14>, <ic2:resource:14>, <ic2:resource:14>]
	]);

//	Nuclear Reactor Fluid Port
	recipes.remove(<ic2:te:25>);
	recipes.addShaped(<ic2:te:25>, [
		[<ic2:resource:14>, <ic2:resource:14>, <ic2:resource:14>],
		[<ic2:resource:14>, <ic2:fluid_cell>, <ic2:resource:14>],
		[<ic2:resource:14>, <ic2:resource:14>, <ic2:resource:14>]
	]);

//	Nuclear Reactor Redstone Port
	recipes.remove(<ic2:te:26>);
	recipes.addShaped(<ic2:te:26>, [
		[<ic2:resource:14>, <ic2:resource:14>, <ic2:resource:14>],
		[<ic2:resource:14>, <minecraft:redstone>, <ic2:resource:14>],
		[<ic2:resource:14>, <ic2:resource:14>, <ic2:resource:14>]
	]);

//	Reinforced Glass
	recipes.remove(<ic2:glass>);
	recipes.addShaped(<ic2:glass>*7, [
		[<ore:blockGlass>, <ic2:crafting:3>, <ore:blockGlass>],
		[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>],
		[<ore:blockGlass>, <ic2:crafting:3>, <ore:blockGlass>]
	]);
	recipes.addShaped(<ic2:glass>*7, [
		[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>],
		[<ic2:crafting:3>, <ore:blockGlass>, <ic2:crafting:3>],
		[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>]
	]);

//	Crop Sticks
	recipes.remove(<ic2:crop_stick>);
	recipes.addShaped(<ic2:crop_stick>*2, [
		[null, null, null],
		[<ore:stickWood>, null, <ore:stickWood>],
		[<ore:stickWood>, null, <ore:stickWood>]
	]);

//	BatBox
	recipes.remove(<ic2:te:72>);
	recipes.addShaped(<ic2:te:72>, [
		[<ore:plankWood>, tinCableIns, <ore:plankWood>],
		[<ic2:re_battery:*>, <ic2:re_battery:*>, <ic2:re_battery:*>],
		[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]
	]);

//	CESU
	recipes.remove(<ic2:te:73>);
	recipes.addShaped(<ic2:te:73>, [
		[<ore:plateBronze>, copperCableIns, <ore:plateBronze>],
		[<ic2:advanced_re_battery:*>, <ic2:advanced_re_battery:*>, <ic2:advanced_re_battery:*>],
		[<ore:plateBronze>, <ore:plateBronze>, <ore:plateBronze>]
	]);

//	MFE
	recipes.remove(<ic2:te:74>);
	recipes.addShaped(<ic2:te:74>, [
		[goldCableIns, <ic2:energy_crystal:*>, goldCableIns],
		[<ic2:energy_crystal:*>, <ic2:resource:12>, <ic2:energy_crystal:*>],
		[goldCableIns, <ic2:energy_crystal:*>, goldCableIns]
	]);

//	MFSU
	recipes.remove(<ic2:te:75>);
	recipes.addShaped(<ic2:te:75>, [
		[<ic2:lapotron_crystal:*>, <ore:circuitAdvanced>, <ic2:lapotron_crystal:*>],
		[<ic2:lapotron_crystal:*>, <ic2:te:74>, <ic2:lapotron_crystal:*>],
		[<ic2:lapotron_crystal:*>, <ic2:resource:13>, <ic2:lapotron_crystal:*>]
	]);

//	LV-Transformer
	recipes.remove(<ic2:te:77>);
	recipes.addShaped(<ic2:te:77>, [
		[<ore:plankWood>, tinCableIns, <ore:plankWood>],
		[<ore:plankWood>, <ic2:crafting:5>, <ore:plankWood>],
		[<ore:plankWood>, tinCableIns, <ore:plankWood>]
	]);

//	MV-Transformer
	recipes.remove(<ic2:te:78>);
	recipes.addShaped(<ic2:te:78>, [
		[null, copperCableIns, null],
		[null, <ic2:resource:12>, null],
		[null, copperCableIns, null]
	]);

//	HV-Transformer
	recipes.remove(<ic2:te:79>);
	recipes.addShaped(<ic2:te:79>, [
		[null, goldCableIns, null],
		[<ore:circuitBasic>, <ic2:te:78>, <ic2:advanced_re_battery:*>],
		[null, goldCableIns, null]
	]);

//	EV-Transformer
	recipes.remove(<ic2:te:80>);
	recipes.addShaped(<ic2:te:80>, [
		[null, highCableIns, null],
		[<ore:circuitAdvanced>, <ic2:te:79>, <ic2:lapotron_crystal:*>],
		[null, highCableIns, null]
	]);

//	ChargePad Batbox
	recipes.remove(<ic2:te:68>);
	recipes.addShaped(<ic2:te:68>, [
		[null, null, null],
		[<ore:circuitBasic>, <minecraft:stone_pressure_plate>, <ore:circuitBasic>],
		[<ore:itemRubber>, <ic2:te:72>, <ore:itemRubber>]
	]);

//	ChargePad CESU
	recipes.remove(<ic2:te:69>);
	recipes.addShaped(<ic2:te:69>, [
		[null, null, null],
		[<ore:circuitBasic>, <minecraft:stone_pressure_plate>, <ore:circuitBasic>],
		[<ore:itemRubber>, <ic2:te:73>, <ore:itemRubber>]
	]);

//	ChargePad MFE
	recipes.remove(<ic2:te:70>);
	recipes.addShaped(<ic2:te:70>, [
		[null, null, null],
		[<ore:circuitBasic>, <minecraft:stone_pressure_plate>, <ore:circuitBasic>],
		[<ore:itemRubber>, <ic2:te:74>, <ore:itemRubber>]
	]);

//	ChargePad MFSU
	recipes.remove(<ic2:te:71>);
	recipes.addShaped(<ic2:te:71>, [
		[null, null, null],
		[<ore:circuitBasic>, <minecraft:stone_pressure_plate>, <ore:circuitBasic>],
		[<ore:itemRubber>, <ic2:te:75>, <ore:itemRubber>]
	]);

//	Generator
	recipes.remove(<ic2:te:3>);
	recipes.addShaped(<ic2:te:3>, [
		[null, <ic2:re_battery:*>, null],
		[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>],
		[null, <ic2:te:46>, null]
	]);
	recipes.addShaped(<ic2:te:3>, [
		[null, <ic2:re_battery:*>, null],
		[null, <ic2:resource:12>, null],
		[null, <minecraft:furnace>, null]
	]);

//	Geothermal Generator
	recipes.remove(<ic2:te:4>);
	recipes.addShaped(<ic2:te:4>, [
		[<ore:blockGlass>, <ic2:fluid_cell>, <ore:blockGlass>],
		[<ore:blockGlass>, <ic2:fluid_cell>, <ore:blockGlass>],
		[<ic2:casing:3>, <ic2:te:3>, <ic2:casing:3>]
	]);

//	Water Mill
	recipes.remove(<ic2:te:10>);
	recipes.addShaped(<ic2:te:10>, [
		[<ore:stickWood>, <ore:plankWood>, <ore:stickWood>],
		[<ore:plankWood>, <ic2:te:3>, <ore:plankWood>],
		[<ore:stickWood>, <ore:plankWood>, <ore:stickWood>]
	]);

//	Solar Panel
	recipes.remove(<ic2:te:8>);
	recipes.addShaped(<ic2:te:8>, [
		[<ore:dustCoal>, <ore:blockGlass>, <ore:dustCoal>],
		[<ore:blockGlass>, <ore:dustCoal>, <ore:blockGlass>],
		[<ore:circuitBasic>, <ic2:te:3>, <ore:circuitBasic>]
	]);

//	Wind Mill
	recipes.remove(<ic2:te:11>);
	recipes.addShaped(<ic2:te:11>, [
		[<ore:ingotIron>, null, <ore:ingotIron>],
		[null, <ic2:te:3>, null],
		[<ore:ingotIron>, null, <ore:ingotIron>]
	]);

//	Nuclear Reactor
	recipes.remove(<ic2:te:22>);
	recipes.addShaped(<ic2:te:22>, [
		[<ore:plateDenseLead>, <ore:circuitAdvanced>, <ore:plateDenseLead>],
		[<ic2:te:24>, <ic2:te:24>, <ic2:te:24>],
		[<ore:plateDenseLead>, <ic2:te:3>, <ore:plateDenseLead>]
	]);

//	RCI-RSH
	recipes.remove(<ic2:te:84>);
	recipes.addShaped(<ic2:te:84>, [
		[<ic2:upgrade:4>, perfectRSH, <ic2:upgrade:4>],
		[perfectRSH, <ic2:resource:13>, perfectRSH],
		[<ic2:upgrade:4>, <ic2:te:83>, <ic2:upgrade:4>]
	]);

//	RCI-LZH
	recipes.remove(<ic2:te:85>);
	recipes.addShaped(<ic2:te:85>, [
		[<ic2:upgrade:4>, perfectLZH, <ic2:upgrade:4>],
		[perfectLZH, <ic2:resource:13>, perfectLZH],
		[<ic2:upgrade:4>, <ic2:te:83>, <ic2:upgrade:4>]
	]);

//	Radioisotope Thermoelectric Gen.
	recipes.remove(<ic2:te:6>);
	recipes.addShaped(<ic2:te:6>, [
		[<ic2:casing:3>, <ic2:casing:3>, <ic2:casing:3>],
		[<ic2:casing:3>, <ic2:te:24>, <ic2:casing:3>],
		[<ic2:casing:3>, <ic2:te:3>, <ic2:casing:3>]
	]);

//	Semifluid Generator
	recipes.remove(<ic2:te:7>);
	recipes.addShaped(<ic2:te:7>, [
		[<ic2:casing:3>, <ic2:fluid_cell>, <ic2:casing:3>],
		[<ic2:fluid_cell>, <ic2:te:4>, <ic2:fluid_cell>],
		[<ic2:casing:3>, <ic2:fluid_cell>, <ic2:casing:3>]
	]);

//	Stirling Generator
	recipes.remove(<ic2:te:9>);
	recipes.addShaped(<ic2:te:9>, [
		[<ic2:casing:3>, <ic2:crafting:7>, <ic2:casing:3>],
		[<ic2:casing:3>, <ic2:te:3>, <ic2:casing:3>],
		[<ic2:casing:3>, <ic2:casing:3>, <ic2:casing:3>]
	]);

//	Kinetic Generator
	recipes.remove(<ic2:te:5>);
	recipes.addShaped(<ic2:te:5>, [
		[<ic2:casing:3>, <ic2:casing:3>, <ic2:casing:3>],
		[<ic2:te:3>, <ic2:crafting:6>, <ic2:crafting:29>],
		[<ic2:casing:3>, <ic2:casing:3>, <ic2:casing:3>]
	]);

//	Solid Heat Generator
	recipes.remove(<ic2:te:15>);
	recipes.addShaped(<ic2:te:15>, [
		[null, <ic2:crafting:7>, null],
		[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>],
		[null, <ic2:te:46>, null]
	]);
	recipes.addShaped(<ic2:te:15>, [
		[null, <ic2:crafting:7>, null],
		[null, <ic2:te:46>, null],
		[null, <minecraft:furnace>, null]
	]);

//	Fluid Heat Generator
	recipes.remove(<ic2:te:13>);
	recipes.addShaped(<ic2:te:13>, [
		[<ic2:casing:3>, <ic2:fluid_cell>, <ic2:casing:3>],
		[<ic2:fluid_cell>, <ic2:crafting:7>, <ic2:fluid_cell>],
		[<ic2:casing:3>, <ic2:fluid_cell>, <ic2:casing:3>]
	]);

//	Radioisotope Thermo Heat Generator
	recipes.remove(<ic2:te:14>);
	recipes.addShaped(<ic2:te:14>, [
		[<ic2:casing:3>, <ic2:casing:3>, <ic2:casing:3>],
		[<ic2:casing:3>, <ic2:te:24>, <ic2:casing:3>],
		[<ic2:casing:3>, <ic2:crafting:7>, <ic2:casing:3>]
	]);

//	Electric Heat Generator
	recipes.remove(<ic2:te:12>);
	recipes.addShaped(<ic2:te:12>, [
		[<ic2:casing:3>, <ic2:re_battery:*>, <ic2:casing:3>],
		[<ic2:casing:3>, <ore:circuitBasic>, <ic2:casing:3>],
		[<ic2:casing:3>, <ic2:crafting:7>, <ic2:casing:3>]
	]);

//	Wind Kinetic Generator
	recipes.remove(<ic2:te:21>);
	recipes.addShaped(<ic2:te:21>, [
		[null, <ic2:crafting:29>, null],
		[null, <ic2:te:46>, null],
		[null, <ic2:crafting:29>, null]
	]);

//	Steam Kinetic Generator
	recipes.remove(<ic2:te:18>);
	recipes.addShaped(<ic2:te:18>, [
		[<ic2:casing:5>, <ic2:casing:5>, <ic2:casing:5>],
		[<ic2:crafting:8>, <ic2:crafting:29>, <ic2:crafting:29>],
		[<ic2:fluid_cell>, <ic2:casing:5>, <ic2:casing:5>]
	]);

//	Electric Kinetic Generator
	recipes.remove(<ic2:te:16>);
	recipes.addShaped(<ic2:te:16>, [
		[<ic2:casing:3>, <ic2:re_battery:*>, <ic2:casing:3>],
		[<ic2:casing:3>, <ic2:crafting:29>, <ic2:casing:3>],
		[<ic2:casing:3>, <ic2:crafting:6>, <ic2:casing:3>]
	]);

//	Water Kinetic Generator
	recipes.remove(<ic2:te:20>);
	recipes.addShaped(<ic2:te:20>, [
		[<ic2:crafting:29>, null, <ic2:crafting:29>],
		[null, <ic2:te:46>, null],
		[<ic2:crafting:29>, null, <ic2:crafting:29>]
	]);

//	Stirling Kinetic Generator
	recipes.remove(<ic2:te:19>);
	recipes.addShaped(<ic2:te:19>, [
		[<minecraft:glass_bottle>, <minecraft:piston>, <minecraft:glass_bottle>],
		[<minecraft:glass_bottle>, <ic2:te:46>, <minecraft:glass_bottle>],
		[<minecraft:glass_bottle>, <minecraft:piston>, <minecraft:glass_bottle>]
	]);

//	Industrial TNT
	recipes.remove(<ic2:te:1>);
	recipes.addShaped(<ic2:te:1>*4, [
		[<ore:itemFlint>, <ore:itemFlint>, <ore:itemFlint>],
		[<minecraft:tnt>, <minecraft:tnt>, <minecraft:tnt>],
		[<ore:itemFlint>, <ore:itemFlint>, <ore:itemFlint>]
	]);
	recipes.addShaped(<ic2:te:1>*4, [
		[<ore:itemFlint>, <minecraft:tnt>, <ore:itemFlint>],
		[<ore:itemFlint>, <minecraft:tnt>, <ore:itemFlint>],
		[<ore:itemFlint>, <minecraft:tnt>, <ore:itemFlint>]
	]);

//	Iron Scaffold
	recipes.remove(<ic2:scaffold:2>);
	recipes.addShaped(<ic2:scaffold:2>*16, [
		[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>],
		[<ic2:fence>, <ic2:fence>, <ic2:fence>],
		[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>]
	]);

//	Luminator
	recipes.remove(<ic2:te:36>);
	recipes.addShaped(<ic2:te:36>*8, [
		[<ic2:casing:3>, copperCableIns, <ic2:casing:3>],
		[<ore:blockGlass>, tinCable, <ore:blockGlass>],
		[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>]
	]);

//	Teleporter
	recipes.remove(<ic2:te:39>);
	recipes.addShaped(<ic2:te:39>, [
		[<ore:circuitAdvanced>, <ic2:frequency_transmitter>, <ore:circuitAdvanced>],
		[glassCable, <ic2:resource:13>, glassCable],
		[<ore:circuitAdvanced>, <ore:gemDiamond>, <ore:circuitAdvanced>]
	]);

//	Tesla Coil
	recipes.remove(<ic2:te:41>);
	recipes.addShaped(<ic2:te:41>, [
		[<ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>],
		[<ore:dustRedstone>, <ic2:te:78>, <ore:dustRedstone>],
		[<ic2:casing:3>, <ore:circuitBasic>, <ic2:casing:3>]
	]);

//	Bottling Plant
	recipes.remove(<ic2:te:28>);
	recipes.addShaped(<ic2:te:28>, [
		[null, <ic2:fluid_cell>, null],
		[null, <ic2:fluid_cell>, null],
		[<ore:circuitBasic>, <ic2:te:46>, <ore:circuitBasic>]
	]);

//	Advanced Miner
	recipes.remove(<ic2:te:57>);
	recipes.addShaped(<ic2:te:57>, [
		[<ic2:crafting:3>, <ic2:te:60>, <ic2:crafting:3>],
		[<ic2:te:74>, <ic2:resource:13>, <ic2:te:39>],
		[<ic2:crafting:3>, <ic2:te:60>, <ic2:crafting:3>]
	]);

//	Liquid Heat Exvchanger
	recipes.remove(<ic2:te:31>);
	recipes.addShaped(<ic2:te:31>, [
		[<ore:blockGlass>, <ic2:fluid_cell>, <ore:blockGlass>],
		[<ore:blockGlass>, <ic2:fluid_cell>, <ore:blockGlass>],
		[<ic2:casing:3>, <ic2:crafting:7>, <ic2:casing:3>]
	]);

//	Fermenter
	recipes.remove(<ic2:te:53>);
	recipes.addShaped(<ic2:te:53>, [
		[<ic2:casing:3>, <ic2:casing:3>, <ic2:casing:3>],
		[<ic2:fluid_cell>, <ic2:fluid_cell>, <ic2:fluid_cell>],
		[<ic2:casing:3>, <ic2:crafting:7>, <ic2:casing:3>]
	]);

//	Fluid Regulator
	recipes.remove(<ic2:te:30>);
	recipes.addShaped(<ic2:te:30>, [
		[<ic2:casing:3>, <ic2:casing:3>, <ic2:casing:3>],
		[<ic2:fluid_cell>, <ic2:crafting:6>, <ic2:fluid_cell>],
		[<ic2:casing:3>, <ore:circuitBasic>, <ic2:casing:3>]
	]);

//	Condenser
	recipes.remove(<ic2:te:27>);
	recipes.addShaped(<ic2:te:27>, [
		[<ic2:fluid_cell>, <ic2:casing:3>, <ic2:fluid_cell>],
		[<ic2:fluid_cell>, <ic2:te:46>, <ic2:fluid_cell>],
		[<ic2:casing:3>, <ore:circuitBasic>, <ic2:casing:3>]
	]);

//	Steam Boiler
	recipes.remove(<ic2:te:34>);
	recipes.addShaped(<ic2:te:34>, [
		[<ic2:casing:3>, <ic2:casing:3>, <ic2:casing:3>],
		[<ic2:casing:3>, <ic2:crafting:8>, <ic2:casing:3>],
		[<ic2:casing:3>, <ic2:crafting:7>, <ic2:casing:3>]
	]);
/*
//	Blast Furnace
"III|IBI|IGI" G:<ic2:crafting:7> B:<ic2:te:46> I:<ic2:casing:3> = <ic2:te:50>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Block Cutting Machine
"C|B|M" B:<ic2:te:46> M:<ic2:crafting:6> C:<ore:circuitBasic> = <ic2:te:51>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	SolarDestiller
"GGG|G G|CMC" C:<ic2:fluid_cell> M:<ic2:te:46> G:<ore:blockGlass> = <ic2:te:33>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Fluid Distributor
"UUU|UMU|CCC" M:<ic2:te:46> U:<ic2:upgrade:8> C:<ic2:fluid_cell> = <ic2:te:29>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	SortingMachine
"UBU|UMU|UCU" M:<ic2:te:46> U:<ic2:upgrade:4> B:<ore:circuitBasic> C:<ore:chestWood> = <ic2:te:38>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	ItemBuffer
"III|CMC|III" M:<ic2:te:46> C:<ore:chestWood> I:<ic2:casing:3> = <ic2:te:35>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	CompactItemBuffer
"ICI|IMI|ICI" M:<ic2:te:46> C:<ore:chestWood> I:<ic2:casing:3> = <ic2:te:83>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Tank
" U |UCU| U " U:<ic2:fluid_cell> C:<ic2:te:46> = <ic2:te:81>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Crop-Matron
"cBc|UMU|CCC" M:<ic2:te:46> C:<ic2:crop_stick> c:<ore:circuitBasic> B:<ore:chestWood> U:<ic2:fluid_cell> = <ic2:te:59>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Crop-Havster
"cBc|UMU|CCC" M:<ic2:te:46> C:<ic2:crop_stick> c:<ore:circuitBasic> B:<ore:chestWood> U:<minecraft:shears> = <ic2:te:58>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Thermal Centrifuge
"CMC|RAR|RER" C:<ic2:crafting:5> R:<ore:ingotIron> A:<ic2:resource:13> M:<ic2:mining_laser> E:<ic2:crafting:6> = <ic2:te:52>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Metal Former
" E |TMT|KKK" E:<ore:circuitBasic> T:<ic2:tool_box> M:<ic2:te:46> K:<ic2:crafting:5> = <ic2:te:55>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Ore Washing Plant
"III|BAB|EWE" A:<ic2:te:46> E:<ic2:crafting:6> B:<minecraft:bucket> W:<ore:circuitBasic> I:<ore:plateIron> = <ic2:te:56>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Pattern Storage
"SSS|CAC|MRM" S:<ic2:resource:11> R:<ore:circuitAdvanced> A:<ic2:resource:13> M:<ic2:mining_laser> C:<ic2:crystal_memory> = <ic2:te:62>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Scanner
"PGP|MLM|CAC" L:<ic2:te:36> A:<ic2:resource:13> C:<ore:circuitAdvanced> M:<ic2:crafting:6> G:<ic2:glass> P:<ore:plateIron> = <ic2:te:64>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Replicator
"SGS|TTT|VFV" T:<ic2:te:39> S:<ic2:resource:11> G:<ic2:glass> F:<ic2:te:74> V:<ic2:te:79> = <ic2:te:63>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Canning Machine
" T | T |CMC" T:<ic2:crafting:10> M:<ic2:te:46> C:<ore:circuitBasic> = <ic2:te:49>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Iron Furnace
" I |I I|IFI" I:<ore:plateIron> F:<minecraft:furnace> = <ic2:te:46>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Electrolyzer
"c c|cCc|EME" E:<ic2:fluid_cell> c:copperCableIns M:<ic2:te:46> C:<ore:circuitBasic> = <ic2:te:76>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Recycler
" G |DMD|IDI" D:<minecraft:dirt> G:<ore:dustGlowstone> M:<ic2:te:43> I:<ore:ingotIron> = <ic2:te:48>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Advanced Machine Casing
"SCS|AMA|SCS" M:<ic2:te:46> A:<ic2:crafting:3> S:OreDict:plateSteel C:<ic2:crafting:15> = <ic2:resource:13>
"SAS|CMC|SAS" M:<ic2:te:46> A:<ic2:crafting:3> S:OreDict:plateSteel C:<ic2:crafting:15> = <ic2:resource:13>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Induction Furnace
"CCC|CFC|CMC" C:<ore:ingotCopper> F:<ic2:te:44> M:<ic2:resource:13> = <ic2:te:54>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Mass Fabricator
"GCG|ALA|GCG" A:<ic2:resource:13> L:<ic2:lapotron_crystal:*> G:<ore:dustGlowstone> C:<ore:circuitAdvanced> = <ic2:te:61>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Terraformer
"GTG|DMD|GDG" T:<ic2:tfbp:0> G:<ore:dustGlowstone> D:<minecraft:dirt> M:<ic2:resource:13> = <ic2:te:40>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Electric Furnace
" C |RFR" C:<ore:circuitBasic> R:<ore:dustRedstone> F:<ic2:te:46> = <ic2:te:44>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Macerator
"FFF|SMS| C " F:<ore:itemFlint> S:<ore:cobblestone> M:<ic2:te:46> C:<ore:circuitBasic> = <ic2:te:47>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Extractor
"TMT|TCT" T:<ic2:treetap> M:<ic2:te:46> C:<ore:circuitBasic> = <ic2:te:45>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Compressor
"S S|SMS|SCS" S:<minecraft:stone:*> M:<ic2:te:46> C:<ore:circuitBasic> = <ic2:te:43>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Canning Machine
"TCT|TMT|TTT" T:<ic2:casing:6> M:<ic2:te:46> C:<ore:circuitBasic> = <ic2:te:42>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Miner
" X |CMC| P " P:<ic2:mining_pipe> M:<ic2:te:46> C:<ore:circuitBasic> X:<ore:chestWood> = <ic2:te:60>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Pump
"cCc|cMc|PTP" c:<ic2:fluid_cell> T:<ic2:treetap> P:<ic2:mining_pipe> M:<ic2:te:46> C:<ore:circuitBasic> = <ic2:te:32>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Magnetizer
"RFR|RMR|RFR" R:<ore:dustRedstone> F:<ic2:fence> M:<ic2:te:46> = <ic2:te:37>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Mining Pipe
"I I|I I|ITI" I:<ore:plateIron> T:<ic2:treetap> = <ic2:mining_pipe>*16
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Nuke
"RCR|RMR|RCR" R:<ic2:thick_neutron_reflector> C:<ore:circuitAdvanced> M:<ic2:resource:13> = <ic2:te:2>
	recipes.remove(output);
	recipes.addHiddenShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Personal Safe
"c|M|C" c:<ore:circuitBasic> C:<ore:chestWood> M:<ic2:te:46> = <ic2:te:66>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Trade-O-Mat
"RRR|CMC" R:<ore:dustRedstone> C:<ore:chestWood> M:<ic2:te:46> = <ic2:te:67>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Energy-O-Mat
"RBR|CMC" R:<ore:dustRedstone> C:copperCableIns M:<ic2:te:46> B:<ic2:re_battery:*> = <ic2:te:65>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Rubber Sheet
"RRR|RRR" R:<ore:itemRubber> = <ic2:sheet:1>*3
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Resin Sheet
"RRR|RRR" R:<ic2:misc_resource::4> = <ic2:sheet:1>*3
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Wool Sheet
"WRW" W:<minecraft:carpet> R:<ic2:sheet:1> = <ic2:sheet:2>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Scaffold
"PPP| s |s s" P:<ore:plankWood> s:<ore:stickWood> = <ic2:scaffold:0>*4
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Advanced RE-Battery
"CTC|TST|TLT" T:<ic2:casing:0> S:<ore:dustSulfur> L:<ore:dustLead> C:copperCableIns = <ic2:advanced_re_battery>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Adv.Batpack
"BCB|BTB|B B" T:<ic2:casing:1> C:<ore:circuitBasic> B:<ic2:advanced_re_battery:*> = <ic2:advanced_batpack>
	recipes.removeShaped(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Composite Vest
"A A|ALA|AIA" L:<minecraft:leather_chestplate:*> I:<minecraft:iron_chestplate:*> A:<ic2:crafting:3> = <ic2:alloy_chestplate>
	recipes.removeShaped(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	BatPack
"BCB|BTB|B B" T:<ore:plankWood> C:<ore:circuitBasic> B:<ic2:re_battery:*> = <ic2:batpack>
	recipes.removeShaped(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Empty Booze Barrel
"P|W|P" P:<ore:plankWood> W:ic2:rubber_wood = ic2:barrel
"#" #:ic2:barrel = ic2:barrel
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Lapotron Crystal
"LCL|LDL|LCL" D:ic2:energy_crystal@* C:<ore:circuitAdvanced> L:OreDict:dustLapis = ic2:lapotron_crystal
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	RE-Battery
" C |TRT|TRT" T:<ic2:casing:6> R:<ore:dustRedstone> C:ic2:cable#type:tin,insulation:1 = ic2:re_battery
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Single-Use Battery
"C|R|D" D:OreDict:dustCoal R:<ore:dustRedstone> C:copperCableIns = ic2:single_use_battery*5
"C|D|R" D:OreDict:dustCoal R:<ore:dustRedstone> C:copperCableIns = ic2:single_use_battery*5
"c|C|R" R:<ore:dustRedstone> C:OreDict:dustHydratedCoal c:copperCableIns = ic2:single_use_battery*8
"c|R|C" R:<ore:dustRedstone> C:OreDict:dustHydratedCoal c:copperCableIns = ic2:single_use_battery*8
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Charging RE Battery
"CBC|B B|CBC" B:<ic2:re_battery:*> C:<ore:circuitBasic> = ic2:charging_re_battery
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Advanced Charging Battery
"EBE|BOB|EBE" E:ic2:heat_exchanger B:<ic2:advanced_re_battery:*> O:ic2:charging_re_battery@* = ic2:advanced_charging_re_battery
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Charging Energy Crystal
"ECE|COC|ECE" E:ic2:component_heat_exchanger C:ic2:energy_crystal@* O:ic2:advanced_charging_re_battery@* = ic2:charging_energy_crystal
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Charging Lapotron Crystal
"CLC|LOL|CLC" C:ic2:advanced_heat_exchanger L:<ic2:lapotron_crystal:*> O:ic2:charging_energy_crystal@* = ic2:charging_lapotron_crystal
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Carbon Fiber Canoe
"X X|XXX" X:<ic2:crafting:15> = ic2:boat#carbon
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Rubber Dinghy
"X X|XXX" X:OreDict:itemRubber = ic2:boat#rubber
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Electric Boat
"CCC|XmX|XrX" X:<ore:plateIron> C:copperCableIns m:<ic2:crafting:6> r:ic2:rotor_iron = ic2:boat#electric
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	EU-Detector Cable
" C |RIR| R " R:<ore:dustRedstone> I:ic2:cable#type:iron,insulation:3 C:<ore:circuitBasic> = ic2:cable#type:detector,insulation:0
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	EU-Splitter Cable
" R |ILI| R " R:<ore:dustRedstone> I:ic2:cable#type:iron,insulation:3 L:minecraft:lever@* = ic2:cable#type:splitter,insulation:0
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Glass Fibre Cable
"GGG|DRD|GGG" G:<ore:blockGlass> R:OreDict:dustSilver D:ic2:dust#energium = glassCable*6
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Cropnalyzer
"cc |RGR|RCR" G:<ore:blockGlass> c:copperCableIns R:<ore:dustRedstone> C:<ore:circuitBasic> = ic2:cropnalyzer
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Reinforced Door
"ILI|ILI|ILI" I:<ore:plateIron> L:OreDict:plateLead = ic2:reinforced_door
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Energium Dust
"RDR|DRD|RDR" D:OreDict:dustDiamond R:<ore:dustRedstone> = ic2:dust#energium*9
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Lead Dust
"XXX|XXX|XXX" X:ic2:dust#small_lead = ic2:dust#lead
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Sulfur Dust
"XXX|XXX|XXX" X:ic2:dust#small_sulfur = ic2:dust#sulfur
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Copper Dust
"XXX|XXX|XXX" X:ic2:dust#small_copper = ic2:dust#copper
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Gold Dust
"XXX|XXX|XXX" X:ic2:dust#small_gold = ic2:dust#gold
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Iron Dust
"XXX|XXX|XXX" X:ic2:dust#small_iron = ic2:dust#iron
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Silver Dust
"XXX|XXX|XXX" X:ic2:dust#small_silver = ic2:dust#silver
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Tin Dust
"XXX|XXX|XXX" X:ic2:dust#small_tin = ic2:dust#tin
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Bronze Dust
"XXX|XXX|XXX" X:ic2:dust#small_bronze = ic2:dust#bronze
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Obsidian Dust
"XXX|XXX|XXX" X:ic2:dust#small_obsidian = ic2:dust#obsidian
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Lithium Dust
"XXX|XXX|XXX" X:ic2:dust#small_lithium = ic2:dust#lithium
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Hydrated Coal Dust
"CCC|CWC|CCC" C:OreDict:dustCoal W:Fluid:water = ic2:dust#coal_fuel*8
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Sticky Dynamite
"DDD|DRD|DDD" D:ic2:dynamite R:<ic2:misc_resource::4> = ic2:dynamite_sticky
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Universal Fluid Cell
" C |CGC| C " C:<ic2:casing:6> G:minecraft:glass_pane@* = <ic2:fluid_cell>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	CF Sprayer
"C  | C | FC" F:<ic2:fluid_cell> C:<ic2:casing:3> = ic2:foam_sprayer
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Plantball
"PPP|P P|PPP" P:minecraft:wheat@* = ic2:crafting#plant_ball
"PPP|P P|PPP" P:minecraft:reeds@* = ic2:crafting#plant_ball
"PPP|P P|PPP" P:minecraft:cactus@* = ic2:crafting#plant_ball
"PPP|P P|PPP" P:OreDict:treeLeaves = ic2:crafting#plant_ball
"PPP|P P|PPP" P:OreDict:treeSapling = ic2:crafting#plant_ball
"PPP|P P|PPP" P:minecraft:tallgrass@* = ic2:crafting#plant_ball
"PPP|P P|PPP" P:minecraft:wheat_seeds = ic2:crafting#plant_ball
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Copper Ingot
"B" B:ic2:resource#copper_block = ic2:ingot#copper*9
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Tin Ingot
"B" B:ic2:resource#tin_block = ic2:ingot#tin*9
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Bronze Ingot
"B" B:ic2:resource#bronze_block = ic2:ingot#bronze*9
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Mixed Metal Ingot
"III|BBB|TTT" I:<ore:plateIron> B:OreDict:plateBronze T:OreDict:plateTin = ic2:ingot#alloy*2
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Lead Ingot
"B" B:ic2:resource#lead_block = ic2:ingot#lead*9
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Silver Ingot
"B" B:ic2:resource#silver_block = ic2:ingot#silver*9
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Steel Ingot
"B" B:ic2:resource#steel_block = ic2:ingot#steel*9
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	MOX Nuclear Fuel
"UUU|CCC|UUU" U:ic2:nuclear#uranium_238 C:ic2:nuclear#plutonium = ic2:nuclear#mox
"UUU|CCC|UUU" U:ic2:nuclear#uranium_238 C:OreDict:ingotPlutonium = ic2:nuclear#mox
"UUU|CCC|UUU" U:OreDict:ingotUranium C:ic2:nuclear#plutonium = ic2:nuclear#mox
"UUU|CCC|UUU" U:OreDict:ingotUranium C:OreDict:ingotPlutonium = ic2:nuclear#mox
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Stone Mug
"SS |SSS|SS " S:<minecraft:stone:*> = ic2:mug#empty
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Nano Saber
"GA |GA |CcC" C:<ic2:crafting:15> c:ic2:energy_crystal@* G:<ore:dustGlowstone> A:<ic2:crafting:3> = ic2:nano_saber
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Nightvision Goggles
"XbX|LGL|RCR" X:ic2:advanced_heat_exchanger b:<ic2:advanced_re_battery:*> L:<ic2:te:36> G:<ic2:glass> R:OreDict:itemRubber C:<ore:circuitAdvanced> = ic2:nightvision_goggles
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	CF Powder
"SAS|SCS|SAS" A:minecraft:sand@* C:minecraft:clay_ball@* S:OreDict:dustStone = ic2:crafting#cf_powder
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Raw Carbon Fibre
"CC|CC" C:OreDict:dustCoal = ic2:crafting#carbon_fibre
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Coal Ball
"CCC|CFC|CCC" C:OreDict:dustCoal F:<ore:itemFlint> = ic2:crafting#coal_ball
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Coal Chunk
"###|#O#|###" #:ic2:crafting#coal_block O:minecraft:obsidian@*|minecraft:iron_block@*|minecraft:brick_block@* = ic2:crafting#coal_chunk
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Plutonium
"UUU|UUU|UUU" U:ic2:nuclear#small_plutonium = ic2:nuclear#plutonium
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Pellets of RTG Fuel
"RAR|RAR|RAR" R:OreDict:plateDenseIron A:ic2:nuclear#plutonium = ic2:nuclear#rtg_pellet
"RRR|AAA|RRR" R:OreDict:plateDenseIron A:ic2:nuclear#plutonium = ic2:nuclear#rtg_pellet
"RAR|RAR|RAR" R:OreDict:plateDenseIron A:OreDict:ingotPlutonium = ic2:nuclear#rtg_pellet
"RRR|AAA|RRR" R:OreDict:plateDenseIron A:OreDict:ingotPlutonium = ic2:nuclear#rtg_pellet
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Coil
"CCC|CXC|CCC" X:<ore:ingotIron> C:ic2:cable#type:copper,insulation:0 = <ic2:crafting:5>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Electric Motor
" T |CXC| T " X:<ore:ingotIron> C:<ic2:crafting:5> T:<ic2:casing:6> = <ic2:crafting:6>
" C |TXT| C " X:<ore:ingotIron> C:<ic2:crafting:5> T:<ic2:casing:6> = <ic2:crafting:6>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Power Unit
"BAC|BIM|BAC" C:<ic2:casing:3> B:<ic2:re_battery:*> I:<ore:circuitBasic> M:<ic2:crafting:6> A:ic2:cable#type:copper,insulation:0 = ic2:crafting#power_unit
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Small Power Unit
" AC|BIM| AC" C:<ic2:casing:3> B:<ic2:re_battery:*> I:<ore:circuitBasic> M:<ic2:crafting:6> A:ic2:cable#type:copper,insulation:0 = ic2:crafting#small_power_unit
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Crystal Memory (raw)
"SOS|OSO|SOS" O:OreDict:dustObsidian S:OreDict:dustSiliconDioxide = ic2:crafting#raw_crystal_memory
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Heat Conductor
"RCR|RCR|RCR" R:OreDict:itemRubber C:OreDict:plateCopper = <ic2:crafting:7>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Copper Boiler
"CCC|C C|CCC" C:<ic2:casing:1> = <ic2:crafting:8>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	wood Rotor Blade
"PSP|PSP|PSP" P:<ore:plankWood> S:OreDict:logWood@* = ic2:crafting#wood_rotor_blade
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Iron Rotor Blade
"PSP|PSP|PSP" P:<ore:plateIron> S:minecraft:iron_ingot = ic2:crafting#iron_rotor_blade
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Steel Rotor Blade
"PSP|PSP|PSP" P:OreDict:plateSteel S:OreDict:ingotSteel = ic2:crafting#steel_rotor_blade
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Carbon Rotor Blade
"PSP|PSP|PSP" P:<ic2:crafting:15> S:ic2:crafting#carbon_mesh = ic2:crafting#carbon_rotor_blade
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	wood Rotor
" A |ABA| A " A:ic2:crafting#wood_rotor_blade B:minecraft:iron_ingot = ic2:rotor_wood
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Iron Rotor
" A |ABA| A " A:ic2:crafting#iron_rotor_blade B:<ic2:crafting:29> = ic2:rotor_iron
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Iron Rotor
" A |ABA| A " A:ic2:crafting#steel_rotor_blade B:<ic2:crafting:29> = ic2:rotor_steel
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Carbon Rotor
" A |ABA| A " A:ic2:crafting#carbon_rotor_blade B:ic2:crafting#steel_shaft = ic2:rotor_carbon
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Steam Turbine Blade
"AAA|ABA|AAA" A:OreDict:plateSteel B:OreDict:ingotSteel = ic2:crafting#steam_turbine_blade
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Steam Turbine
"A|A|A" A:ic2:crafting#steam_turbine_blade = ic2:crafting#steam_turbine
"AAA" A:ic2:crafting#steam_turbine_blade = ic2:crafting#steam_turbine
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Block Cutting Blade (Iron)
"AAA|ABA|AAA" A:<ore:plateIron> B:<minecraft:stone:*> = ic2:block_cutting_blade#iron
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Block Cutting Blade (Refined Iron)
"AAA|ABA|AAA" A:OreDict:plateSteel B:minecraft:iron_ingot = ic2:block_cutting_blade#steel
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Block Cutting Blade (Diamond)
"AAA|ABA|AAA" A:<ore:gemDiamond> B:OreDict:ingotSteel = ic2:block_cutting_blade#diamond
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Dynamite-O-Mote
" c |GCG|TTT" c:copperCableIns G:<ore:dustGlowstone> C:<ore:circuitBasic> T:<minecraft:tnt> = ic2:remote
" C |TLT| F " C:copperCableIns F:<ic2:frequency_transmitter> L:OreDict:dustLapis T:<ic2:casing:6> = ic2:remote
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	OD Scanner
"PGP|CBC|ccc" B:<ic2:advanced_re_battery:*> c:copperCableIns G:<ore:dustGlowstone> C:<ore:circuitBasic> P:ic2:casing#gold = ic2:scanner
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	OV Scanner
"PDP|GCG|cSc" S:ic2:scanner@* c:ic2:cable#type:gold,insulation:2 G:<ore:dustGlowstone> C:<ore:circuitAdvanced> P:ic2:casing#gold D:ic2:energy_crystal@* = ic2:advanced_scanner
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Scrap Box
"SSS|SSS|SSS" S:ic2:crafting#scrap = ic2:crafting#scrap_box
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Solar Helmet
"III|ISI|CCC" I:<ore:ingotIron> S:ic2:te#solar_generator C:copperCableIns = ic2:solar_helmet
" H | S |CCC" H:minecraft:iron_helmet@* S:ic2:te#solar_generator C:copperCableIns = ic2:solar_helmet
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Static Boots
"I I|ISI|CCC" I:<ore:ingotIron> S:minecraft:wool@* C:copperCableIns = ic2:static_boots
" H | S |CCC" H:minecraft:iron_boots@* S:minecraft:wool@* C:copperCableIns = ic2:static_boots
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	TFBP - Empty
" C | A |R R" C:<ore:circuitBasic> A:<ore:circuitAdvanced> R:<ore:dustRedstone> = <ic2:tfbp:0>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	TFBP - Chilling
" S |S#S| S " #:<ic2:tfbp:0> S:minecraft:snowball@* = ic2:tfbp#chilling
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	TFBP - Cultivation
" S |S#S| S " #:<ic2:tfbp:0> S:minecraft:wheat_seeds@* = ic2:tfbp#cultivation
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	TFBP - Desertification
" S |S#S| S " #:<ic2:tfbp:0> S:minecraft:sand@* = ic2:tfbp#desertification
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	TFBP - Flatification
" D |D#D| D " #:<ic2:tfbp:0> D:<minecraft:dirt> = ic2:tfbp#flatification
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	TFBP - Irrigation
" W |W#W| W " #:<ic2:tfbp:0> W:minecraft:water_bucket@* = ic2:tfbp#irrigation
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	TFBP - Mushroom
"mMm|M#M|mMm" #:<ic2:tfbp:0> M:minecraft:brown_mushroom@* m:minecraft:mycelium@* = ic2:tfbp#mushroom
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Chainsaw
" II|III|BI " I:<ore:plateIron> B:ic2:crafting#power_unit = ic2:chainsaw
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Cutter
"A A| A |I I" A:<ore:plateIron> I:<ore:ingotIron> = ic2:cutter
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Diamond Drill
" D |DdD" D:<ore:gemDiamond> d:ic2:drill@* = ic2:diamond_drill
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Mining Drill
" I |III|IBI" I:<ore:plateIron> B:ic2:crafting#power_unit = ic2:drill
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Forge Hammer
"II |ISS|II " S:<ore:stickWood> I:<ore:ingotIron> = ic2:forge_hammer
" II|SSI| II" S:<ore:stickWood> I:<ore:ingotIron> = ic2:forge_hammer
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Electric Hoe
"II| I| B" I:<ore:plateIron> B:ic2:crafting#small_power_unit = ic2:electric_hoe
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	WindMeter
" C |CAC| CB" C:<ic2:casing:6> A:<ic2:casing:0> B:ic2:crafting#small_power_unit = ic2:wind_meter
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Weeding Trowel
"I I| I |RIR" I:<ore:ingotIron> R:OreDict:itemRubber = ic2:weeding_trowel
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Iridium Drill
" I |IdI| C " I:ic2:crafting#iridium d:ic2:diamond_drill@* C:ic2:energy_crystal@* = ic2:iridium_drill
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	EU-Reader
" G |cCc|c c" G:<ore:dustGlowstone> c:copperCableIns C:<ore:circuitBasic> = ic2:meter
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Mining Laser
"RRc|AAC| AA" A:<ic2:crafting:3> C:<ore:circuitAdvanced> c:ic2:energy_crystal@* R:<ore:dustRedstone> = ic2:mining_laser
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Painter
" CC| IC|I  " C:minecraft:wool@* I:<ore:ingotIron> = ic2:painter
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Wrench
"B B|BBB| B " B:OreDict:ingotBronze = ic2:wrench
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Tool Box
"ICI|III" C:<ore:chestWood> I:<ic2:casing:0> = ic2:tool_box

	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Containment Box
"III|ICI|III" C:<ore:chestWood> I:ic2:casing#lead = ic2:containment_box
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Treetap
" P |PPP|P  " P:<ore:plankWood> = <ic2:treetap>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Enriched Uranium Nuclear Fuel
"UUU|CCC|UUU" U:ic2:nuclear#uranium_238 C:ic2:nuclear#small_uranium_235 = ic2:nuclear#uranium
"UUU|CCC|UUU" U:ic2:nuclear#uranium_238 C:OreDict:nuggetUranium235 = ic2:nuclear#uranium
"UUU|CCC|UUU" U:OreDict:ingotUranium C:ic2:nuclear#small_uranium_235 = ic2:nuclear#uranium
"UUU|CCC|UUU" U:OreDict:ingotUranium C:OreDict:nuggetUranium235 = ic2:nuclear#uranium
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Uranium 235
"UUU|UUU|UUU" U:ic2:nuclear#small_uranium_235 = ic2:nuclear#uranium_235
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Weed-EX
"R|G|C" R:<ore:dustRedstone> G:ic2:crop_res#grin_powder C:<ic2:fluid_cell> = <ic2:fluid_cell>#ic2weed_ex
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Obscurator
"rEr|CAC|rrr" r:<ore:dustRedstone> E:<ic2:advanced_re_battery:*> C:ic2:cable#type:gold,insulation:2 A:<ore:circuitAdvanced> = ic2:obscurator
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	RSH-Condensator
"RRR|RVR|RSR" R:<ore:dustRedstone> V:ic2:heat_vent S:ic2:heat_exchanger = ic2:rsh_condensator
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	LZH-Condensator
"RVR|CLC|RSR" R:<ore:dustRedstone> V:ic2:reactor_heat_vent S:ic2:reactor_heat_exchanger C:ic2:rsh_condensator L:minecraft:lapis_block@* = ic2:lzh_condensator
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	10k Coolant Cell
" T |TWT| T " W:Fluid:ic2coolant T:OreDict:plateTin = ic2:heat_storage
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	30k Coolant Cell
"TTT|CCC|TTT" C:ic2:heat_storage T:OreDict:plateTin = ic2:tri_heat_storage
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	60k Coolant Cell
"TCT|TcT|TCT" C:ic2:tri_heat_storage T:OreDict:plateTin c:<ore:plateIron> = ic2:hex_heat_storage
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Heat Exchanger
"CcC|TCT|CTC" c:<ore:circuitBasic> T:OreDict:plateTin C:OreDict:plateCopper = ic2:heat_exchanger
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Reactor Heat Exchanger
"CCC|CSC|CCC" S:ic2:heat_exchanger C:OreDict:plateCopper = ic2:reactor_heat_exchanger
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Advanced Heat Exchanger
"GcG|SCS|GcG" S:ic2:heat_exchanger C:OreDict:plateCopper G:OreDict:plateLapis c:<ore:circuitBasic> = ic2:advanced_heat_exchanger
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Component Heat Exchanger
" G |GSG| G " S:ic2:heat_exchanger G:OreDict:plateGold = ic2:component_heat_exchanger
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Dual Fuel Rod (MOX)
"UIU" U:ic2:mox_fuel_rod@0 I:<ore:plateIron> = ic2:dual_mox_fuel_rod
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Quad Fuel Rod (MOX)
"UIU|CIC|UIU" U:ic2:mox_fuel_rod@0 I:<ore:plateIron> C:OreDict:plateCopper = ic2:quad_mox_fuel_rod
" U |CIC| U " U:ic2:dual_mox_fuel_rod@0 I:<ore:plateIron> C:OreDict:plateCopper = ic2:quad_mox_fuel_rod
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Heat-Capacity Reactor Plating
"CCC|CcC|CCC" c:ic2:plating C:OreDict:plateCopper = ic2:heat_plating
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Neutron Reflector
"TcT|cCc|TcT" c:OreDict:dustCoal C:OreDict:plateCopper T:OreDict:dustTin = ic2:neutron_reflector
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Thick Neutron Reflector
"CRC|RCR|CRC" C:OreDict:plateCopper R:ic2:neutron_reflector = <ic2:thick_neutron_reflector>
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Iridium Neutron Reflector
"RRR|CIC|RRR" C:OreDict:plateDenseCopper R:<ic2:thick_neutron_reflector> I:ic2:crafting#iridium = ic2:iridium_reflector
"RCR|RIR|RCR" C:OreDict:plateDenseCopper R:<ic2:thick_neutron_reflector> I:ic2:crafting#iridium = ic2:iridium_reflector
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Dual Fuel Rod (Uranium)
"UIU" U:ic2:uranium_fuel_rod@0 I:<ore:plateIron> = ic2:dual_uranium_fuel_rod
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Quad Fuel Rod (Uranium)
"UIU|CIC|UIU" U:ic2:uranium_fuel_rod@0 I:<ore:plateIron> C:OreDict:plateCopper = ic2:quad_uranium_fuel_rod
" U |CIC| U " U:ic2:dual_uranium_fuel_rod@0 I:<ore:plateIron> C:OreDict:plateCopper = ic2:quad_uranium_fuel_rod
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Heat Vent
"#I#|IMI|#I#" M:<ic2:crafting:6> I:<ore:plateIron> #:minecraft:iron_bars = ic2:heat_vent
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Reactor Heat Vent
"CCC|CVC|CCC" V:ic2:heat_vent C:OreDict:plateCopper = ic2:reactor_heat_vent
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Advanced Heat Vent
"#V#|#D#|#V#" V:ic2:heat_vent #:minecraft:iron_bars D:<ore:gemDiamond> = ic2:advanced_heat_vent
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Overclocked Heat Vent
" G |GVG| G " V:ic2:reactor_heat_vent G:OreDict:plateGold = ic2:overclocked_heat_vent
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Component Heat Vent
"#T#|TVT|#T#" V:ic2:heat_vent #:minecraft:iron_bars T:OreDict:plateTin = ic2:component_heat_vent
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Transformer Upgrade
"GGG|WTW|GEG" G:<ore:blockGlass> W:ic2:cable#type:gold,insulation:2 T:<ic2:te:78> E:<ore:circuitBasic> = ic2:upgrade#transformer
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Energy Storage Upgrade
"www|WBW|wEw" w:<ore:plankWood> W:copperCableIns B:<ic2:re_battery:*> E:<ore:circuitBasic> = ic2:upgrade#energy_storage
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Ejector Upgrade
"T T| P |T T" T:OreDict:plateTin P:<minecraft:piston>@* = <ic2:upgrade:4>
"T T| P |T T" T:OreDict:plateDenseTin P:<minecraft:piston>@* = <ic2:upgrade:4>*9
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Pulling Upgrade
"T T| P |T T" T:OreDict:plateTin P:minecraft:sticky_piston@* = ic2:upgrade#pulling
"T T| P |T T" T:OreDict:plateDenseTin P:minecraft:sticky_piston@* = ic2:upgrade#pulling*9
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Fluid Ejector Upgrade
"T T| E |T T" E:<ic2:crafting:6> T:OreDict:plateTin = <ic2:upgrade:8>
"T T| E |T T" E:<ic2:crafting:6> T:OreDict:plateDenseTin = <ic2:upgrade:8>*9
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Fluid Pulling Upgrade
"TXT| E |T T" E:<ic2:crafting:6> T:OreDict:plateTin X:<ic2:treetap> = ic2:upgrade#fluid_pulling
"TXT| E |T T" E:<ic2:crafting:6> T:OreDict:plateDenseTin X:<ic2:treetap> = ic2:upgrade#fluid_pulling*9
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Redstone Inverter Upgrade
"T T| L |T T" L:minecraft:lever T:OreDict:plateTin = ic2:upgrade#redstone_inverter
"T T| L |T T" L:minecraft:lever T:OreDict:plateDenseTin = ic2:upgrade#redstone_inverter*9
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Chunk loader
"TET|LML|TCT" T:OreDict:plateTin E:minecraft:ender_pearl L:minecraft:dye@4 M:<ic2:te:46> C:<ore:circuitBasic> = ic2:te#chunk_loader
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Industrial Workbench
" T |HMC" H:ic2:forge_hammer M:<ic2:te:46> C:ic2:cutter T:minecraft:crafting_table@* = ic2:te#industrial_workbench
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Batch Crafter
" I |ACA|HWH" H:ic2:forge_hammer W:ic2:wrench C:<ic2:resource:13> A:<ore:circuitAdvanced> I:ic2:te#industrial_workbench = ic2:te#batch_crafter
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Steam Repressurizer
"III|TBT|ICI" I:<ic2:casing:3> T:<ic2:te:81> B:<ic2:crafting:8> C:<ic2:crafting:7> = ic2:te#steam_repressurizer
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Weighted Item Distributor
"CUC|UMU|CIC" M:<ic2:te:46> C:<ore:chestWood> U:<ic2:upgrade:4> I:ic2:upgrade#pulling = ic2:te#weighted_item_distributor
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Weighted Fluid Distributor
"CUC|UMU|CIC" M:<ic2:te:46> C:<ic2:fluid_cell> U:<ic2:upgrade:8> I:ic2:upgrade#fluid_pulling = ic2:te#weighted_fluid_distributor
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Jetpack attachment plate
"IAI|CRC|IAI" R:OreDict:plateSteel A:<ic2:crafting:3> C:<ic2:crafting:15> I:ic2:misc_resource#iridium_shard = ic2:crafting#jetpack_attachment_plate
	recipes.remove(output);
	recipes.addShaped(output, [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	]);

//	Rubber Dinghy
ic2:boat#broken_rubber OreDict:itemRubber = ic2:boat#rubber
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Copper Cable
OreDict:itemRubber ic2:cable#type:copper,insulation:0 = copperCableIns
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Uninsulated Copper Cable
OreDict:plateCopper OreDict:craftingToolWireCutter = ic2:cable#type:copper,insulation:0*2
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Tin Cable
OreDict:plateTin OreDict:craftingToolWireCutter = tinCable*3
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Insulated Tin Cable
OreDict:itemRubber tinCable = ic2:cable#type:tin,insulation:1
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Gold Cable
OreDict:plateGold OreDict:craftingToolWireCutter = ic2:cable#type:gold,insulation:0*4
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Insulated Gold Cable
OreDict:itemRubber ic2:cable#type:gold,insulation:0 = ic2:cable#type:gold,insulation:1
OreDict:itemRubber ic2:cable#type:gold,insulation:1 = ic2:cable#type:gold,insulation:2
OreDict:itemRubber OreDict:itemRubber ic2:cable#type:gold,insulation:0 = ic2:cable#type:gold,insulation:2
recipes.remove(output);
recipes.addShapeless(output,[inputs]);
recipes.addShapeless(output,[inputs]);
recipes.addShapeless(output,[inputs]);

//	Insulated HV Cable
OreDict:itemRubber ic2:cable#type:iron,insulation:0 = ic2:cable#type:iron,insulation:1
OreDict:itemRubber OreDict:itemRubber ic2:cable#type:iron,insulation:0 = ic2:cable#type:iron,insulation:2
OreDict:itemRubber OreDict:itemRubber OreDict:itemRubber ic2:cable#type:iron,insulation:0 = ic2:cable#type:iron,insulation:3
OreDict:itemRubber ic2:cable#type:iron,insulation:1 = ic2:cable#type:iron,insulation:2
OreDict:itemRubber OreDict:itemRubber ic2:cable#type:iron,insulation:1 = ic2:cable#type:iron,insulation:3
OreDict:itemRubber ic2:cable#type:iron,insulation:2 = ic2:cable#type:iron,insulation:3
recipes.remove(output);
recipes.addShapeless(output,[inputs]);
recipes.addShapeless(output,[inputs]);
recipes.addShapeless(output,[inputs]);
recipes.addShapeless(output,[inputs]);
recipes.addShapeless(output,[inputs]);
recipes.addShapeless(output,[inputs]);

//	Water Cell
<ic2:fluid_cell> minecraft:water_bucket@* = <ic2:fluid_cell>#water
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Lava Cell
<ic2:fluid_cell> minecraft:lava_bucket@* = <ic2:fluid_cell>#lava
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Hydrated Coal Dust
OreDict:dustCoal Fluid:water = ic2:dust#coal_fuel
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Hydrated Tin Dust
OreDict:dustTin Fluid:water = ic2:dust#tin_hydrated
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Dynamite
ic2:te#itnt minecraft:string@* = ic2:dynamite
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Fertilizer
ic2:crafting#scrap minecraft:dye@15 = ic2:crop_res#fertilizer*2
ic2:crafting#scrap ic2:crafting#scrap ic2:crop_res#fertilizer = ic2:crop_res#fertilizer*2
recipes.remove(output);
recipes.addShapeless(output,[inputs]);
recipes.addShapeless(output,[inputs]);

//	Frequency Transmitter
<ore:circuitBasic> copperCableIns = <ic2:frequency_transmitter>
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Raw Carbon Mesh
ic2:crafting#carbon_fibre ic2:crafting#carbon_fibre = ic2:crafting#carbon_mesh
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Tiny Pile of Plutonium
ic2:nuclear#plutonium = ic2:nuclear#small_plutonium*9
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	TFBP - Empty
ic2:tfbp@* = <ic2:tfbp:0>
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Painter
ic2:painter@* = ic2:painter
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Black Painter
ic2:painter OreDict:dyeBlack = ic2:painter#black
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Blue Painter
ic2:painter OreDict:dyeBlue = ic2:painter#blue
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Brown Painter
ic2:painter OreDict:dyeBrown = ic2:painter#brown
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Light Blue Painter
ic2:painter OreDict:dyeLightBlue = ic2:painter#light_blue
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Cyan Painter
ic2:painter OreDict:dyeCyan = ic2:painter#cyan
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Dark Grey Painter
ic2:painter OreDict:dyeGray = ic2:painter#gray
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Green Painter
ic2:painter OreDict:dyeGreen = ic2:painter#green
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Light GreyPainter
ic2:painter OreDict:dyeLightGray = ic2:painter#light_gray
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Lime Painter
ic2:painter OreDict:dyeLime = ic2:painter#lime
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Magenta Painter
ic2:painter OreDict:dyeMagenta = ic2:painter#magenta
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Orange Painter
ic2:painter OreDict:dyeOrange = ic2:painter#orange
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Pink Painter
ic2:painter OreDict:dyePink = ic2:painter#pink
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Purple Painter
ic2:painter OreDict:dyePurple = ic2:painter#purple
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Red Painter
ic2:painter OreDict:dyeRed = ic2:painter#red
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	White Painter
ic2:painter OreDict:dyeWhite = ic2:painter#white
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Yellow Painter
ic2:painter OreDict:dyeYellow = ic2:painter#yellow
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Electric Wrench
ic2:wrench ic2:crafting#small_power_unit = ic2:electric_wrench
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Electric Treetap
<ic2:treetap> ic2:crafting#small_power_unit = ic2:electric_treetap
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Tiny Pile of Uranium 235
ic2:nuclear#uranium_235 = ic2:nuclear#small_uranium_235*9
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Uranium 238
ic2:resource#uranium_block = ic2:nuclear#uranium_238*9
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Reactor Plating
OreDict:plateLead <ic2:crafting:3> = ic2:plating
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

//	Containment Reactor Plating
ic2:plating <ic2:crafting:3> <ic2:crafting:3> = ic2:containment_plating
recipes.remove(output);
recipes.addShapeless(output,[inputs]);

*/