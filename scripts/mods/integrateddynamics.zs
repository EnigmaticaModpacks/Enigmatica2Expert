import crafttweaker.item.IItemStack as IItemStack;
#modloaded integrateddynamics

/*
# Aluminum / Osmium Squeezer Compatibility
	mods.integrateddynamics.Squeezer.addRecipe(<mekanism:oreblock>, <mekanism:dust:2>, 0.75f, <mekanism:dust:2>);
	mods.integrateddynamics.Squeezer.addRecipe(<thermalfoundation:ore:4>, <thermalfoundation:material:68>, 0.75f, <mekanism:dust:2>);

	mods.integrateddynamics.MechanicalSqueezer.addRecipe(<mekanism:oreblock>, <mekanism:dust:2> * 2, 0.50f, <mekanism:dust:2>);
	mods.integrateddynamics.MechanicalSqueezer.addRecipe(<thermalfoundation:ore:4>, <thermalfoundation:material:68> * 2, 0.50f, <thermalfoundation:material:68>);
*/

# Generator
	recipes.remove(<integrateddynamics:coal_generator>);
	recipes.addShapedMirrored("IntegratedDynamics Generator", 
	<integrateddynamics:coal_generator>, 
	[[<integrateddynamics:crystalized_menril_chunk>, <ic2:te:46>, <integrateddynamics:crystalized_menril_chunk>],
	[<integrateddynamics:crystalized_menril_block>, <integrateddynamics:energy_battery>.withTag({}), <integrateddynamics:crystalized_menril_block>], 
	[<integrateddynamics:crystalized_menril_chunk>, <ic2:te:46>, <integrateddynamics:crystalized_menril_chunk>]]);

# [Mechanical Squeezer] from [Crushing Block][+4]
craft.remake(<integrateddynamics:mechanical_squeezer>, ["pretty",
  "¤ ■ ¤",
  "Ϟ   Ϟ",
  "□ * □"], {
  "■": <mechanics:crushing_block>, # Crushing Block
  "□": <ore:plateDenseLapis>,      # Dense Lapis Lazuli Plate
  "¤": <ore:gearVibrant>,          # Vibrant Bimetal Gear
  "*": <actuallyadditions:block_crystal_empowered:1>, # Empowered Palis Crystal Block
  "Ϟ": <integrateddynamics:energy_battery>, # Energy Battery
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
recipes.removeShaped(connector);

recipes.addShaped("part_connector_omni_directional_item_11", connector * 3, [
	[part, <enderio:block_transceiver>, part], 
	[mono, connector, mono],
	[null, part, null]]);

recipes.addShaped("part_connector_omni_directional_item", connector * 2, [
	[part, <enderio:block_transceiver>, part], 
	[mono, <integrateddynamics:cable>, mono], 
	[null, part, null]]);

# terminal_storage
recipes.remove(<integratedterminals:part_terminal_storage_item>);
	recipes.addShaped("part_terminal_storage_item", 
	<integratedterminals:part_terminal_storage_item>, 
	[[<ore:dustGlowstone>, <integratedterminals:menril_glass>, <ore:dustGlowstone>], 
	[<integrateddynamics:variable_transformer>, <integrateddynamics:part_display_panel_item>, <integrateddynamics:variable_transformer:1>], 
	[<ore:dustGlowstone>, <rftools:storage_scanner>, <ore:dustGlowstone>]]);

# [Output Variable Transformer] from [Piston][+2]
craft.remake(<integrateddynamics:variable_transformer> * 2, ["pretty",
  "  ▬  ",
  "C P C",
  "  ▬  "], {
  "P": <minecraft:piston>, # Piston
  "C": <integrateddynamics:crystalized_menril_chunk>, # Crystalized Menril Chunk
  "▬": <ore:ingotCobalt>,    # Cobalt Ingot
});

# [Input Variable Transformer] from [Sticky Piston][+2]
craft.remake(<integrateddynamics:variable_transformer:1> * 2, ["pretty",
  "  ▬  ",
  "C P C",
  "  ▬  "], {
  "P": <minecraft:sticky_piston>, # Sticky Piston
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
  "M": <tconstruct:large_plate>.withTag({Material: "manyullyn"}),
  "O": <integrateddynamics:variable_transformer>,   # Output Variable Transformer
});

# Alternative for easy stacking 50 batteries
# [Energy Battery] from [Block of Redstone][+2]
craft.remake(<integrateddynamics:energy_battery>.withTag({energy: 0, capacity: 8000000}), ["pretty",
  "□ ◘ □",
  "□ ♥ □",
  "□ ◘ □"], {
  "♥": <additionalcompression:dustredstone_compressed:1>,
  "□": utils.tryCatch(utils.get("openblocks:tank", 0, 1, {tank: {FluidName: "menrilresin", Amount: 24000}}), Bucket("menrilresin")),
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

# Fix Aluminum not squeezed
val AD = <thermalfoundation:material:68>; # Aluminum Dust
scripts.processWork.work(["Squeezer"]          , null, [<thermalfoundation:ore:4>], null, [AD, AD], null, null, [1.0f, 0.75f]);
scripts.processWork.work(["MechanicalSqueezer"], null, [<thermalfoundation:ore:4>], null, [AD*2, AD], null, null, [1.0f, 0.5f]);

# [Player Simulator] from [Turtle][+3]
craft.remake(<integratedtunnels:part_player_simulator_item>, ["pretty",
  "L ▬ L",
  "M T M",
  "L ▬ L"], {
  "T": <computercraft:turtle_expanded>,     # Turtle
  "L": <integrateddynamics:logic_director>, # Logic Director
  "▬": <ore:ingotRefinedObsidian>,          # Refined Obsidian Ingot
  "M": <tconstruct:materials:19>,           # Mending Moss
});

# [Logic Director*4] from [Block of Crystalized Menril][+2]
craft.remake(<integrateddynamics:logic_director> * 4, ["pretty",
  "∩ ◊ ∩",
  "∩ ■ ∩",
  "∩ ◊ ∩"], {
  "■": <ore:blockMenril>,  # Block of Crystalized Menril
  "∩": <integrateddynamics:crystalized_chorus_chunk>, # Crystalized Chorus Chunk
  "◊": <ore:gemTanzanite>, # Tanzanite
});
