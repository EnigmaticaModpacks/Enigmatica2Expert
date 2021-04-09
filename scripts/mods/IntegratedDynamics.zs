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

# [Mechanical Squeezer] from [Diamond Gear][+3]
craft.remake(<integrateddynamics:mechanical_squeezer>, ["pretty",
  "i S i",
  "Ϟ S Ϟ",
  "D S D"], {
  "S": <integrateddynamics:squeezer>, # Squeezer
  "D": <ore:plateDenseObsidian>,      # Dense Obsidian Plate
  "i": <ore:gearDiamond>,             # Diamond Gear
  "Ϟ": <integrateddynamics:energy_battery>.withTag({}), # Energy Battery
});

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
  "L O L",
  "L M L",
  "L I L"], {
  "I": <integrateddynamics:variable_transformer:1>, # Input Variable Transformer
  "L": <integrateddynamics:cable>,                  # Logic Cable
  "M": <ore:ingotManyullyn>,
  "O": <integrateddynamics:variable_transformer>,   # Output Variable Transformer
});

# Alternative for easy stacking 50 batteries
# [Energy Battery] from [Block of Redstone][+2]
craft.remake(<integrateddynamics:energy_battery>.withTag({energy: 0, capacity: 5000000}), ["pretty",
  "□ ◘ □",
  "□ ♥ □",
  "□ ◘ □"], {
  "♥": compressIt(<minecraft:redstone_block>, 2),
  "□": compressIt(<integrateddynamics:crystalized_menril_block>, 1), # Block of Crystalized Menril
  "◘": <integrateddynamics:crystalized_chorus_block>, # Block of Crystalized Chorus
});

# [Logic Cable] from [Redstone][+2]
craft.remake(<integrateddynamics:cable>, ["pretty",
  "C # C",
  "C ♥ C",
  "C # C"], {
  "C": <integrateddynamics:crystalized_menril_chunk>, # Crystalized Menril Chunk
  "#": <ore:stickWood>, # Stick
  "♥": <ore:dustRedstone>, # Redstone
});

# [Logic Cable*6] from [Redstone][+2]
craft.make(<integrateddynamics:cable> * 4, ["pretty",
  "C B C",
  "C ♥ C",
  "C B C"], {
  "B": <tconstruct:materials:18>, # Ball of Moss
  "C": <integrateddynamics:crystalized_menril_chunk>, # Crystalized Menril Chunk
  "♥": <ore:dustRedstone>, # Redstone
});

# [Fluid Interface] from [Flopper][+1]
craft.remake(<integratedtunnels:part_interface_fluid_item>, ["pretty",
  "∩ F ∩",
  "∩ ∩ ∩"], {
  "F": <flopper:flopper>, # Flopper
  "∩": <integrateddynamics:crystalized_menril_chunk>, # Crystalized Menril Chunk
});

# Remove cheaty Propolis recipe
# Other machines output only %10 of propolis
mods.integrateddynamics.Squeezer.removeRecipesWithOutput(<forestry:propolis>, <fluid:for.honey> * 180);
mods.integrateddynamics.MechanicalSqueezer.removeRecipesWithOutput(<forestry:propolis>, <fluid:for.honey> * 180);