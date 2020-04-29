import mods.jei.JEI.removeAndHide as rh;
#modloaded environmentaltech
print("--- loading EnvironmentalTech.zs ---");
	
	

	var cell4 = <environmentaltech:solar_cell_pladium>;
	var cell5 = <environmentaltech:solar_cell_ionite>;
	var cell6 = <environmentaltech:solar_cell_aethium>;
	
	var blockPladium = <ore:blockPladium>;
	var blockIonite = <ore:blockIonite>;
	var blockAethium = <ore:blockAethium>;
	
	var mekSolar = <mekanismgenerators:generator:5>;

# Light Gray Alabaster
	recipes.addShaped("Light Gray Alabaster", 
	<environmentalmaterials:alabaster:8> * 8, 
	[[<ore:emcraftingAlabasterNormal>, <ore:emcraftingAlabasterNormal>, <ore:emcraftingAlabasterNormal>],
	[<ore:emcraftingAlabasterNormal>, <ore:dyeLightGray>, <ore:emcraftingAlabasterNormal>], 
	[<ore:emcraftingAlabasterNormal>, <ore:emcraftingAlabasterNormal>, <ore:emcraftingAlabasterNormal>]]);

# Environmental Tech Guide
	recipes.addShapeless("Environmental Tech Guide", 
	<valkyrielib:guide>, 
	[<minecraft:book>,<ore:crystalLitherite>]);

# Nanobot Beacon
	recipes.remove(<environmentaltech:nano_cont_personal_1>);
	recipes.addShapedMirrored("Nanobot Beacon", 
	<environmentaltech:nano_cont_personal_1>, 
	[[<ore:blockLonsdaleite>, <environmentaltech:mica>, <ore:blockLonsdaleite>],
	[<ore:blockErodium>, <cyclicmagic:beacon_potion>, <ore:blockErodium>], 
	[<environmentaltech:interconnect>, <environmentaltech:diode>, <environmentaltech:interconnect>]]);

# Lonsdaleite
	recipes.addShapedMirrored("Lonsdaleite", 
	<environmentaltech:lonsdaleite_crystal> * 3, 
	[[<ore:gemQuartzBlack>, <ore:dustWither>, <ore:gemQuartzBlack>],
	[<ore:dustWither>, <ore:ingotBlackIron>, <ore:dustWither>], 
	[<ore:gemQuartzBlack>, <ore:dustWither>, <ore:gemQuartzBlack>]]);

# Connector
	recipes.remove(<environmentaltech:connector>);
	recipes.addShapedMirrored("Environmental Tech Connector", 
	<environmentaltech:connector>, 
	[[<thermalfoundation:material:165>, <ore:blockTin>, <thermalfoundation:material:165>],
	[<ore:blockTin>, <ore:ingotAlubrass>, <ore:blockTin>], 
	[<thermalfoundation:material:165>, <ore:blockTin>, <thermalfoundation:material:165>]]);

# Diode
	recipes.remove(<environmentaltech:diode>);
	recipes.addShapedMirrored("Diode", 
	<environmentaltech:diode>, 
	[[<appliedenergistics2:smooth_sky_stone_block>, <actuallyadditions:block_crystal_empowered:3>, <appliedenergistics2:smooth_sky_stone_block>],
	[<ore:gearMithril>, <thermalexpansion:frame>, <ore:gearMithril>], 
	[<appliedenergistics2:smooth_sky_stone_block>, <ic2:crafting:4>, <appliedenergistics2:smooth_sky_stone_block>]]);

# Litherite
	recipes.remove(<environmentaltech:litherite_crystal>);
	mods.thermalexpansion.Transposer.addFillRecipe(<environmentaltech:litherite_crystal>, 
	<biomesoplenty:terrestrial_artifact>, 
	<liquid:enderium> * 72, 150000);
	recipes.addShapeless("Litherite Block -> Crystal", 
	<environmentaltech:litherite_crystal> * 9, 
	[<ore:blockLitherite>]);

# Solar Array Tier 4-6
	recipes.remove(<environmentaltech:solar_cont_4>);
	mods.extendedcrafting.TableCrafting.addShaped(0, <environmentaltech:solar_cont_4>, 
	[[mekSolar, cell4, cell4, cell4, mekSolar], 
	[cell4, blockPladium, <thermalexpansion:frame:128>, blockPladium, cell4], 
	[cell4, <thermalexpansion:frame:128>, <environmentaltech:solar_cont_3>, <thermalexpansion:frame:128>, cell4], 
	[cell4, blockPladium, <thermalexpansion:frame:146>, blockPladium, cell4], 
	[mekSolar, cell4, cell4, cell4, mekSolar]]);  

	recipes.remove(<environmentaltech:solar_cont_5>);
	mods.extendedcrafting.TableCrafting.addShaped(0, <environmentaltech:solar_cont_5>, 
	[[<advancedrocketry:satellitepowersource:1>, cell5, cell5, cell5, cell5, cell5, <advancedrocketry:satellitepowersource:1>], 
	[cell5, blockIonite, blockIonite, <thermalexpansion:frame:129>, blockIonite, blockIonite, cell5], 
	[cell5, blockIonite, <nuclearcraft:part:3>, <thermalexpansion:frame:147>, <nuclearcraft:part:3>, blockIonite, cell5], 
	[cell5, <thermalexpansion:frame:129>, <compactsolars:compact_solar_block:2>, <environmentaltech:solar_cont_4>, <compactsolars:compact_solar_block:2>, <thermalexpansion:frame:129>, cell5], 
	[cell5, blockIonite, <nuclearcraft:part:3>, <thermalexpansion:frame:147>, <nuclearcraft:part:3>, blockIonite, cell5], 
	[cell5, blockIonite, blockIonite, <thermalexpansion:frame:129>, blockIonite, blockIonite, cell5], 
	[<advancedrocketry:satellitepowersource:1>, cell5, cell5, cell5, cell5, cell5, <advancedrocketry:satellitepowersource:1>]]);  

	recipes.remove(<environmentaltech:solar_cont_6>);
	mods.extendedcrafting.TableCrafting.addShaped(0, <environmentaltech:solar_cont_6>, 
	[[<compactsolars:compact_solar_block:2>, cell6, cell6, cell6, <thermalexpansion:frame:148>, cell6, cell6, cell6, <compactsolars:compact_solar_block:2>], 
	[cell6, <extendedcrafting:material:32>, blockAethium, blockAethium, <ic2:nuclear:10>, blockAethium, blockAethium, <extendedcrafting:material:32>, cell6], 
	[cell6, blockAethium, <extendedcrafting:material:32>, <draconicevolution:draconic_block>, <extendedcrafting:singularity:66>, <draconicevolution:draconic_block>, <extendedcrafting:material:32>, blockAethium, cell6], 
	[cell6, blockAethium, <draconicevolution:draconic_block>, <extendedcrafting:storage:3>, <draconicevolution:reactor_core>, <extendedcrafting:storage:3>, <draconicevolution:draconic_block>, blockAethium, cell6], 
	[<thermalexpansion:frame:148>, <mekanism:machineblock3:1>, <extendedcrafting:singularity:5>, <draconicevolution:awakened_core>, <environmentaltech:solar_cont_5>, <draconicevolution:awakened_core>, <extendedcrafting:singularity:6>, <mekanism:machineblock3:1>, <thermalexpansion:frame:148>], 
	[cell6, blockAethium, <draconicevolution:draconic_block>, <extendedcrafting:storage:3>, <draconicevolution:reactor_component>, <extendedcrafting:storage:3>, <draconicevolution:draconic_block>, blockAethium, cell6], 
	[cell6, blockAethium, <extendedcrafting:material:32>, <draconicevolution:draconic_block>, <extendedcrafting:singularity:29>, <draconicevolution:draconic_block>, <extendedcrafting:material:32>, blockAethium, cell6], 
	[cell6, <extendedcrafting:material:32>, blockAethium, blockAethium, <ic2:nuclear:10>, blockAethium, blockAethium, <extendedcrafting:material:32>, cell6], 
	[<compactsolars:compact_solar_block:2>, cell6, cell6, cell6, <thermalexpansion:frame:148>, cell6, cell6, cell6, <compactsolars:compact_solar_block:2>]]);  
	
# Void Ore Miner Tier 5-6
	recipes.remove(<environmentaltech:void_ore_miner_cont_5>);
	recipes.addShaped("Void Ore Miner Tier 5", 
	<environmentaltech:void_ore_miner_cont_5>, 
	[[blockIonite, <ic2:iridium_reflector>, blockIonite],
	[blockIonite, <environmentaltech:void_ore_miner_cont_4>, blockIonite], 
	[blockIonite, <ic2:iridium_reflector>, blockIonite]]);
 
	recipes.remove(<environmentaltech:void_ore_miner_cont_6>);
	mods.extendedcrafting.TableCrafting.addShaped(0, <environmentaltech:void_ore_miner_cont_6>, 
	[[blockAethium, <ic2:iridium_reflector>, blockAethium], 
	[<ic2:nuclear:10>, <environmentaltech:void_ore_miner_cont_5>, <ic2:nuclear:10>], 
	[blockAethium, <ic2:iridium_reflector>, blockAethium]]);  

# Removing Crystal Lens
	rh(<environmentaltech:laser_lens_crystal>);
	
	
# Photovoltatic cell Hard earlier recipe
recipes.remove(<environmentaltech:photovoltaic_cell>);
recipes.addShaped(<environmentaltech:photovoltaic_cell>, [
		[<ic2:crafting:4>, <ic2:crafting:4>, <ic2:crafting:4>],
		[<actuallyadditions:item_crystal_empowered:1>, <actuallyadditions:item_crystal_empowered:1>, <actuallyadditions:item_crystal_empowered:1>], 
		[<ic2:crafting:4>, <ic2:crafting:4>, <ic2:crafting:4>]
	]);

# Photovoltatic cell Simplier recipe
recipes.addShaped(<environmentaltech:photovoltaic_cell>, [
		[<advancedrocketry:productsheet:1>, <advancedrocketry:productsheet:1>, <advancedrocketry:productsheet:1>],
		[<ic2:plate:13>, <ic2:plate:13>, <ic2:plate:13>], 
		[<advancedrocketry:productsheet:1>, <advancedrocketry:productsheet:1>, <advancedrocketry:productsheet:1>]
	]);

remake("environmentaltech modifier_speed", 
	<environmentaltech:modifier_speed>, [
		[<ore:blockRedstone>, <environmentaltech:erodium_crystal>, <ore:blockRedstone>], 
		[<environmentaltech:mica>, <environmentaltech:modifier_null>, <environmentaltech:mica>], 
		[<fluid:low_pressure_steam> * 1000, <environmentaltech:lonsdaleite_crystal>, <fluid:low_pressure_steam> * 1000]]);

remake("environmentaltech modifier_accuracy", 
	<environmentaltech:modifier_accuracy>, [
		[<ore:blockDiamond>, <environmentaltech:pladium_crystal>, <ore:blockDiamond>], 
		[<environmentaltech:mica>, <environmentaltech:modifier_null>, <environmentaltech:mica>], 
		[<fluid:low_pressure_steam> * 1000, <environmentaltech:lonsdaleite_crystal>, <fluid:low_pressure_steam> * 1000]]);