import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded integrateddynamics

/*
# Aluminum / Osmium Squeezer Compatibility
	mods.integrateddynamics.Squeezer.addRecipe(<mekanism:oreblock>, <mekanism:dust:2>, 0.75f, <mekanism:dust:2>);
	mods.integrateddynamics.Squeezer.addRecipe(<thermalfoundation:ore:4>, <thermalfoundation:material:68>, 0.75f, <mekanism:dust:2>);

	mods.integrateddynamics.MechanicalSqueezer.addRecipe(<mekanism:oreblock>, <mekanism:dust:2> * 2, 0.50f, <mekanism:dust:2>);
	mods.integrateddynamics.MechanicalSqueezer.addRecipe(<thermalfoundation:ore:4>, <thermalfoundation:material:68> * 2, 0.50f, <thermalfoundation:material:68>);
*/

# User
	recipes.remove(<integratedtunnels:part_player_simulator_item>);
	recipes.addShapeless("IT User", 
	<integratedtunnels:part_player_simulator_item> * 2, 
	[<extrautils2:user>.anyDamage(), <extrautils2:user>.anyDamage()]);

# Generator
	recipes.remove(<integrateddynamics:coal_generator>);
	recipes.addShapedMirrored("IntegratedDynamics Generator", 
	<integrateddynamics:coal_generator>, 
	[[<integrateddynamics:crystalized_menril_chunk>, <ic2:te:46>, <integrateddynamics:crystalized_menril_chunk>],
	[<integrateddynamics:crystalized_menril_block>, <integrateddynamics:energy_battery>.withTag({}), <integrateddynamics:crystalized_menril_block>], 
	[<integrateddynamics:crystalized_menril_chunk>, <ic2:te:46>, <integrateddynamics:crystalized_menril_chunk>]]);

# Mechanical Squeezer
	recipes.remove(<integrateddynamics:mechanical_squeezer>);
	recipes.addShapedMirrored("IntegratedDynamics Mechanical Squeezer", 
	<integrateddynamics:mechanical_squeezer>, 
	[[<ore:dustDiamond>, <integrateddynamics:squeezer>, <ore:dustDiamond>],
	[<integrateddynamics:energy_battery>.withTag({}), <integrateddynamics:squeezer>, <integrateddynamics:energy_battery>.withTag({})], 
	[<ore:plateObsidian>, <integrateddynamics:squeezer>, <ore:plateObsidian>]]);

# Mechanical Drying Basin
	recipes.remove(<integrateddynamics:mechanical_drying_basin>);
	recipes.addShapedMirrored("IntegratedDynamics Mechanical Drying Basin", 
	<integrateddynamics:mechanical_drying_basin>, 
	[[<ore:plateObsidian>, <integrateddynamics:drying_basin>, <ore:plateObsidian>],
	[<integrateddynamics:energy_battery>.withTag({}), <integrateddynamics:drying_basin>, <integrateddynamics:energy_battery>.withTag({})], 
	[<ore:plateObsidian>, <integrateddynamics:drying_basin>, <ore:plateObsidian>]]);

	
# Omni directional
var connector = <integrateddynamics:part_connector_omni_directional_item>;
var part = <integrateddynamics:logic_director>;
var mono = <integrateddynamics:part_connector_mono_directional_item>;
recipes.remove(connector);

recipes.addShaped("part_connector_omni_directional_item_11", connector * 3, [
	[part, <enderstorage:ender_storage>, part], 
	[mono, connector, mono],
	[null, part, null]]);

recipes.addShaped("part_connector_omni_directional_item", connector * 2, [
	[part, <enderstorage:ender_storage>, part], 
	[mono, <integrateddynamics:cable>, mono], 
	[null, part, null]]);
	
recipes.addShapeless("part_connector_omni_directional_item_12", connector * 2, [connector, connector]); 

# Logic Cable
	recipes.remove(<integrateddynamics:cable>);
//	recipes.remove(<integrateddynamics:cable_11>);
	recipes.addShapedMirrored("IntegratedDynamics Cable", 
	<integrateddynamics:cable> * 3,
	[[<integrateddynamics:crystalized_menril_chunk>,<integrateddynamics:crystalized_menril_chunk>,<integrateddynamics:crystalized_menril_chunk>],
	[<ore:dustRedstone>,<xnet:netcable>,<ore:dustRedstone>],
	[<integrateddynamics:crystalized_menril_chunk>,<integrateddynamics:crystalized_menril_chunk>,<integrateddynamics:crystalized_menril_chunk>]]);

# Menril Sapling
//mods.tconstruct.Casting.addTableRecipe(IItemStack output, IIngredient cast, ILiquidStack fluid, int amount, @Optional boolean consumeCast, @Optional int time);
	mods.tconstruct.Casting.addTableRecipe(<integrateddynamics:menril_sapling>, <minecraft:sapling>, <liquid:blueslime>, 250, true);
