import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded integrateddynamics

/*
# Aluminum / Osmium Squeezer Compatibility
	scripts.wrap.integrateddynamics.Squeezer.addRecipe(<mekanism:oreblock>, <mekanism:dust:2>, 0.75f, <mekanism:dust:2>);
	scripts.wrap.integrateddynamics.Squeezer.addRecipe(<thermalfoundation:ore:4>, <thermalfoundation:material:68>, 0.75f, <mekanism:dust:2>);

	scripts.wrap.integrateddynamics.MechanicalSqueezer.addRecipe(<mekanism:oreblock>, <mekanism:dust:2> * 2, 0.50f, <mekanism:dust:2>);
	scripts.wrap.integrateddynamics.MechanicalSqueezer.addRecipe(<thermalfoundation:ore:4>, <thermalfoundation:material:68> * 2, 0.50f, <thermalfoundation:material:68>);
*/

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

	
# Omnidirectional
var connector = <integrateddynamics:part_connector_omni_directional_item>;
var part = <integrateddynamics:logic_director>;
var mono = <integrateddynamics:part_connector_mono_directional_item>;
recipes.remove(connector);

recipes.addShaped("part_connector_omni_directional_item_11", connector * 3, [
	[part, <enderio:block_transceiver>, part], 
	[mono, connector, mono],
	[null, part, null]]);

recipes.addShaped("part_connector_omni_directional_item", connector * 2, [
	[part, <enderio:block_transceiver>, part], 
	[mono, <integrateddynamics:cable>, mono], 
	[null, part, null]]);

# interface_crafting
recipes.remove(<integratedcrafting:part_interface_crafting_item>);
recipes.addShaped("part_interface_crafting_item", 
	<integratedcrafting:part_interface_crafting_item>, 
	[[<ore:ingotFakeIron>, <appliedenergistics2:crafting_unit>, <ore:ingotFakeIron>], 
	[<integrateddynamics:variable_transformer>, <integrateddynamics:crystalized_menril_block>, <integrateddynamics:variable_transformer:1>], 
	[<ore:ingotFakeIron>, <appliedenergistics2:crafting_unit>, <ore:ingotFakeIron>]]);

# terminal_storage
recipes.remove(<integratedterminals:part_terminal_storage_item>);
	recipes.addShaped("part_terminal_storage_item", 
	<integratedterminals:part_terminal_storage_item>, 
	[[<ore:dustGlowstone>, <integratedterminals:menril_glass>, <ore:dustGlowstone>], 
	[<integrateddynamics:variable_transformer>, <integrateddynamics:part_display_panel_item>, <integrateddynamics:variable_transformer:1>], 
	[<ore:dustGlowstone>, <rftools:storage_scanner>, <ore:dustGlowstone>]]);

# [Output Variable Transformer*4] from [Piston][+2]
craft.remake(<integrateddynamics:variable_transformer> * 4, ["pretty",
  "  ▬  ",
  "C P C",
  "  ▬  "], {
  "P": <ore:craftingPiston>, # Piston
  "C": <integrateddynamics:crystalized_menril_chunk>, # Crystalized Menril Chunk
  "▬": <ore:ingotCobalt>,    # Cobalt Ingot
});

# [Input Variable Transformer*4] from [Sticky Piston][+2]
craft.remake(<integrateddynamics:variable_transformer:1> * 4, ["pretty",
  "  ▬  ",
  "C P C",
  "  ▬  "], {
  "P": <ore:craftingPiston>, # Sticky Piston
  "C": <integrateddynamics:crystalized_menril_chunk>, # Crystalized Menril Chunk
  "▬": <ore:ingotCobalt>,    # Cobalt Ingot
});

# [Mono-Directional Connector] from [Manyullyn Item Frame][+3]
craft.remake(<integrateddynamics:part_connector_mono_directional_item>, ["pretty",
  "  O  ",
  "L M L",
  "  I  "], {
  "I": <integrateddynamics:variable_transformer:1>, # Input Variable Transformer
  "L": <integrateddynamics:cable>,                  # Logic Cable
  "M": <tconstruct:fancy_frame:4>,                  # Manyullyn Item Frame
  "O": <integrateddynamics:variable_transformer>,   # Output Variable Transformer
});
