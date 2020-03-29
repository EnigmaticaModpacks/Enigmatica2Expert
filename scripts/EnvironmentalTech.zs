import mods.jei.JEI.removeAndHide as rh;
#modloaded environmentaltech
	
# Personal Nano Beacon tier 5 + 6 harder recipes, to limit access to Resistance 5 (100% damage reduction)
recipes.remove(<environmentaltech:nano_cont_personal_6>);
recipes.addShapedMirrored("enigmatica_nano_cont_personal_6", <environmentaltech:nano_cont_personal_6>, 
[[<ore:blockCosmicNeutronium>, <ore:blockDraconiumAwakened>, <ore:blockCosmicNeutronium>],
[<ore:blockAethium>, <environmentaltech:nano_cont_personal_5>, <ore:blockAethium>], 
[<environmentaltech:mica>, <environmentaltech:modifier_null>, <environmentaltech:mica>]]);

recipes.remove(<environmentaltech:nano_cont_personal_5>);
recipes.addShapedMirrored("enigmatica_nano_cont_personal_5", <environmentaltech:nano_cont_personal_5>, 
[[<ore:blockCrystaltine>, <draconicevolution:draconium_block:1>, <ore:blockCrystaltine>],
[<ore:blockIonite>, <environmentaltech:nano_cont_personal_4>, <ore:blockIonite>], 
[<environmentaltech:mica>, <environmentaltech:modifier_null>, <environmentaltech:mica>]]);

# Resistance Modifier harder recipe
recipes.remove(<environmentaltech:modifier_resistance>);
recipes.addShapedMirrored("enigmatica_modifier_resistance", 
<environmentaltech:modifier_resistance>, 
[[<ore:blockPladium>, <mysticalagriculture:charm:6>, <ore:blockPladium>],
[<environmentaltech:mica>, <environmentaltech:modifier_null>, <environmentaltech:mica>], 
[<minecraft:potion>.withTag({Potion: "cofhcore:resistance"}), <ore:crystalLonsdaleite>, <minecraft:potion>.withTag({Potion: "cofhcore:resistance"})]]);


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