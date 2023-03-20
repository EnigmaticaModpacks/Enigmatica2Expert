#modloaded advgenerators


# Iron Frame
	recipes.addShapedMirrored("AdvancedGenerators Iron Frame" ,
	<advgenerators:iron_frame> * 2, 
	[[<ore:stickIron>, <minecraft:iron_bars>, <ore:stickIron>],
	[<minecraft:iron_bars>, <immersiveengineering:material:8>, <minecraft:iron_bars>], 
	[<ore:stickIron>, <minecraft:iron_bars>, <ore:stickIron>]]);
	
# Control Circuit
	recipes.addShaped("AdvancedGenerators Control Circuit", 
	<advgenerators:controller>, 
	[[<ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>],
	[<ore:circuitElite>, <gendustry:genetics_processor>, <ore:circuitElite>], 
	[<ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>]]);

# Iron Tubing
	recipes.addShapedMirrored("AdvancedGenerators Iron Tubing",
	<advgenerators:iron_tubing> * 4, 
	[[null, <ore:wireAluminium>, <actuallyadditions:item_misc:7>],
	[<ore:wireAluminium>, <actuallyadditions:item_misc:7>, <ore:wireAluminium>], 
	[<actuallyadditions:item_misc:7>, <ore:wireAluminium>, null]]);

# Redstone-Iron Tubing
	recipes.addShapedMirrored("AdvancedGenerators Redstone-Iron Tubing", 
	<advgenerators:iron_wiring> * 4, 
	[[null, <ore:xuRedstoneCoil>, <actuallyadditions:item_misc:7>],
	[<ore:xuRedstoneCoil>, <actuallyadditions:item_misc:7>, <ore:xuRedstoneCoil>], 
	[<actuallyadditions:item_misc:7>, <ore:xuRedstoneCoil>, null]]);

# Pressure Valve
	recipes.addShapedMirrored("AdvancedGenerators Pressure Valve", 
	<advgenerators:pressure_valve>, 
	[[<mekanism:basicblock:11>, <advgenerators:iron_tubing>, <mekanism:basicblock:11>],
	[<advgenerators:iron_tubing>, <minecraft:iron_trapdoor>, <advgenerators:iron_tubing>], 
	[<mekanism:basicblock:11>, <advgenerators:iron_tubing>, <mekanism:basicblock:11>]]);

# Power IO Module
	recipes.addShapedMirrored("AdvancedGenerators Power IO Module",
	<advgenerators:power_io>, 
	[[<ore:ingotSilver>, <ore:ingotTin>, <ore:ingotSilver>],
	[<ore:ingotTin>, <gendustry:power_module>, <ore:ingotTin>], 
	[<ore:ingotSilver>, <ore:ingotTin>, <ore:ingotSilver>]]);

		