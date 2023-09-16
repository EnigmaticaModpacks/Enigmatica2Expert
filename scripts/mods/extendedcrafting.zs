import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
#modloaded extendedcrafting

	var piston = <minecraft:piston>;
	var blackIron = <ore:ingotBlackIron>;

# Extended Crafting Table removal
	utils.rh(<extendedcrafting:crafting_table>);

# Handheld Crafting Table
	utils.rh(<extendedcrafting:handheld_table>);
	
# Black Iron
	recipes.remove(blackIron);
	recipes.addShapeless("Black Iron From Block", 
	<extendedcrafting:material> * 9, 
	[<ore:blockBlackIron>]);
	
	recipes.addShaped("Black Iron From Nuggets", 
	<extendedcrafting:material>, 
	[[<ore:nuggetBlackIron>, <ore:nuggetBlackIron>, <ore:nuggetBlackIron>],
	[<ore:nuggetBlackIron>, <ore:nuggetBlackIron>, <ore:nuggetBlackIron>], 
	[<ore:nuggetBlackIron>, <ore:nuggetBlackIron>, <ore:nuggetBlackIron>]]);
	
	mods.thermalexpansion.InductionSmelter.addRecipe
	(<extendedcrafting:material> * 3, 
	<thermalfoundation:storage_alloy:2>, <immersiveengineering:stone_decoration:3>, 50000);
	
	mods.thermalexpansion.InductionSmelter.addRecipe
	(<extendedcrafting:material> * 2, 
	<thermalfoundation:storage_alloy:2>, <actuallyadditions:block_misc:2>, 20000);
	
	mods.thermalexpansion.InductionSmelter.addRecipe
	(<extendedcrafting:material> * 3, 
	<thermalfoundation:storage_alloy:2>, <immersiveengineering:material:19>, 15000);
	
	mods.thermalexpansion.InductionSmelter.addRecipe
	(<extendedcrafting:material> * 4, 
	<thermalfoundation:storage_alloy:2>, <nuclearcraft:alloy:1>, 20000);
	
	mods.thermalexpansion.InductionSmelter.addRecipe
	(<extendedcrafting:material> * 3, 
	<thermalfoundation:storage_alloy:2>, <nuclearcraft:alloy:3>, 15000);
	
	mods.thermalexpansion.InductionSmelter.addRecipe
	(<extendedcrafting:material> * 3, 
	<thermalfoundation:storage_alloy:2>, <nuclearcraft:ingot_block:8>, 15000);	
	
# Crafting Core
	recipes.remove(<extendedcrafting:crafting_core>);
	scripts.mods.forestry.Carpenter.addRecipe(<extendedcrafting:crafting_core>, 
	[[<extendedcrafting:material:18>, <extendedcrafting:material:18>, <extendedcrafting:material:18>],
	[<plustic:osmiridiumingot>, <extendedcrafting:pedestal>, <plustic:osmiridiumingot>],
	[<extendedcrafting:pedestal>, <extendedcrafting:pedestal>, <extendedcrafting:pedestal>]], 
	40, <liquid:coal> * 5000, null, 1);
	
# [Quantum Compressor] from [Elite Compressing Factory][+4]
	craft.remake(<extendedcrafting:compressor>, ["pretty",
		"P P P P P",
		"P C A C P",
		"P ■ E ■ P",
		"P C A C P",
		"P P P P P"], {
		"P": <ore:craftingPiston>,           # Piston
		"C": <ic2:te:43>,                    # Compressor
		"A": <excompressum:auto_compressor>, # Auto Compressor
		"■": <ore:blockBlackIron>,           # Block of Black Iron
		"E": <mekanism:tierinstaller:2>,
	});

# [Basic Crafting Table] from [End Steel Block][+4]
craft.remake(<extendedcrafting:table_basic>, ["pretty",
  "B a B",
  "w ■ w",
  "B l B"], {
  "B": <extendedcrafting:material:14>, # Basic Component
  "a": <extendedcrafting:material:8>,  # Basic Catalyst
  "w": <ore:workbench>,                # Crafting Station
  "■": <ore:blockEndSteel>,            # End Steel Block
  "l": <extendedcrafting:material:2>,  # Black Iron Slate
});

# [Advanced Crafting Table] from [Block of Luminessence][+4]
recipes.remove(<extendedcrafting:table_advanced>);
mods.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:table_advanced>, Grid(["pretty",
  "A d A",
  "B ■ B",
  "A l A"], {
  "A": <extendedcrafting:material:15>, # Advanced Component
  "d": <extendedcrafting:material:9>,  # Advanced Catalyst
  "B": <extendedcrafting:table_basic>, # Basic Crafting Table
  "■": <ore:blockLuminessence>,        # Block of Luminessence
  "l": <extendedcrafting:material:2>,  # Black Iron Slate
}).shaped());

# [Elite Crafting Table] from [Basic Crafting Table][+7]
craft.remake(<extendedcrafting:table_elite>, ["pretty",
  "◘ E ◙ E ◘",
  "E ▲ ■ ▲ E",
  "f A B A f",
  "E ▲ ■ ▲ E",
  "◘ E ◙ E ◘"], {
  "◘": <thermalexpansion:frame:129>,      # Hardened Cell Frame
  "E": <extendedcrafting:material:10>,    # Elite Catalyst
  "◙": <thermalexpansion:frame:147>,      # Signalum Cell Frame (Full)
  "▲": <ore:dustMana>,                    # Mana Dust
  "■": <ore:blockOsgloglas>,              # Osgloglas Block
  "f": <thermalfoundation:fertilizer:2>,  # Fluxed Phyto-Gro
  "A": <extendedcrafting:table_advanced>, # Advanced Crafting Table
  "B": <extendedcrafting:table_basic>,    # Basic Crafting Table
});

# [Ultimate Crafting Table] from [Extreme Crafting Table][+14]
craft.remake(<extendedcrafting:table_ultimate>, ["pretty",
  "◘ ■ * A * ■ ◘",
  "■ e V ◙ V ▀ ■",
  "* V d E d V *",
  "A Ϟ I x I Ϟ A",
  "* V d E d V *",
  "■ i V ◙ V ▄ ■",
  "◘ ■ * A * ■ ◘"], {
  "◘": <thermalexpansion:frame:147>,           # Signalum Cell Frame (Full)
  "■": <extendedcrafting:trimmed:4>,           # Block of Black Iron
  "*": <ore:crystalDraconium>,                 # Draconium Crystal
  "A": <advancedrocketry:ic:2>,                # Advanced Circuit
  "e": <ore:blockAethium>,                     # Aethium
  "V": <vaultopic:vice>,                       # V.I.C.E. (Vaultopic Item Crafting Entity)
  "◙": <thermalexpansion:frame:148>,           # Resonant Cell Frame (Full)
  "▀": <ore:blockEnderium>,                    # Block of Enderium
  "d": <extendedcrafting:table_advanced>,      # Advanced Crafting Table
  "E": <extendedcrafting:table_elite>,         # Elite Crafting Table
  "Ϟ": <draconicevolution:wyvern_energy_core>, # Wyvern Energy Core
  "I": <ic2:iridium_reflector>,                # Iridium Neutron Reflector
  "x": <avaritia:extreme_crafting_table>,      # Extreme Crafting Table
  "i": <ore:blockVividAlloy>,                  # Vivid Alloy Block
  "▄": <ore:blockMirion>,                      # Mirion Block
});

# Pedestal
	recipes.remove(<extendedcrafting:pedestal>);
	scripts.mods.forestry.Carpenter.addRecipe(<extendedcrafting:pedestal>, 
	[[null, <extendedcrafting:material:2>, null],
	[null, blackIron, null],
	[blackIron, <extendedcrafting:storage>, blackIron]], 
	40, <liquid:coal> * 1000);

# Luminiscence made in chemical reactor and drying basin
recipes.removeByRecipeName("extendedcrafting:luminessence");
scripts.process.evaporate(<fluid:liquid_sunshine> * 1000, <extendedcrafting:material:7> * 2, null);

# Insanium from inferium
mods.extendedcrafting.CompressionCrafting.addRecipe(<mysticalagradditions:insanium> * 10, 
<mysticalagriculture:crafting>, 10240, <mysticalagriculture:master_infusion_crystal>, 2000000, 100000);

# Simplify Automating table
recipes.remove(<extendedcrafting:interface>);
recipes.addShaped(<extendedcrafting:interface>, [
	[<ore:ingotBlackIron>, <extendedcrafting:material:10>, <ore:ingotBlackIron>],
	[<extendedcrafting:material:17>, <extendedcrafting:frame>, <extendedcrafting:material:17>],
	[<ore:ingotBlackIron>, <extendedcrafting:material:2>, <ore:ingotBlackIron>]]);

# Pack 9->1 recipe for ender ingot (somehow its missed)
val e = <extendedcrafting:material:37>;
recipes.addShapeless("9->1 Ender Ingot", <extendedcrafting:material:36>, [e,e,e,e,e,e,e,e,e]);

# See the Draconic Evolution configs for DE compat
# *======= Empowerer Extended Crafting Combination recipes =======*
mods.extendedcrafting.CombinationCrafting.addRecipe(<mekanism:controlcircuit:3>, 2000000, 1000000, <mekanism:controlcircuit:2>, [<mekanism:atomicalloy>, <mekanism:atomicalloy>, <mekanism:atomicalloy>, <mekanism:atomicalloy>]);
mods.extendedcrafting.CombinationCrafting.addRecipe(<thermalexpansion:frame:129>, 10000000, 1000000, <thermalexpansion:frame:128>, [<immersiveengineering:material:2>, <thermalfoundation:material:354>, <thermalfoundation:material:290>, <mekanism:basicblock:8>]);
mods.extendedcrafting.CombinationCrafting.addRecipe(<actuallyadditions:block_crystal_empowered>, 1000000, 1000000, <actuallyadditions:block_crystal>, [<nuclearcraft:gem>, <thermalfoundation:material:513>, <tconstruct:tool_rod>.withTag({Material: "ardite"}), <minecraft:red_nether_brick>]);
mods.extendedcrafting.CombinationCrafting.addRecipe(<actuallyadditions:block_crystal_empowered:1>, 1000000, 1000000, <actuallyadditions:block_crystal:1>, [<tconstruct:ingots>, <ic2:plate:13>, <biomesoplenty:gem:6>, <tconstruct:slime_congealed:1>]);
mods.extendedcrafting.CombinationCrafting.addRecipe(<actuallyadditions:block_crystal_empowered:2>, 2000000, 1000000, <actuallyadditions:block_crystal:2>, [<nuclearcraft:dust:10>, <botania:manaresource:2>, <tconstruct:ingots:2>, <biomesoplenty:gem:5>]);
mods.extendedcrafting.CombinationCrafting.addRecipe(<actuallyadditions:block_crystal_empowered:3>, 10000000, 1000000,  <actuallyadditions:block_crystal:3>, [<randomthings:ingredient:13>, <extendedcrafting:storage>, <ore:stoneBasalt>, <appliedenergistics2:sky_stone_block>]);
mods.extendedcrafting.CombinationCrafting.addRecipe(<actuallyadditions:block_crystal_empowered:4>, 2000000, 1000000, <actuallyadditions:block_crystal:4>, [<minecraft:dye:2>, <minecraft:emerald>, <nuclearcraft:dust:9>, <actuallyadditions:block_testifi_bucks_green_wall>]);
mods.extendedcrafting.CombinationCrafting.addRecipe(<actuallyadditions:block_crystal_empowered:5>, 1000000, 1000000, <actuallyadditions:block_crystal:5>, [<minecraft:quartz_block>, <minecraft:bone_block>, <mekanism:ingot:1>, <nuclearcraft:gem:2>]);
mods.extendedcrafting.CombinationCrafting.addRecipe(<actuallyadditions:item_misc:24>, 100000, 1000000, <actuallyadditions:item_misc:23>, [<actuallyadditions:item_canola_seed>, <actuallyadditions:item_canola_seed>, <actuallyadditions:item_canola_seed>, <actuallyadditions:item_canola_seed>]);

# [Block of Crystaltine] from [Glitch Infused Ingot][+4]
mods.extendedcrafting.TableCrafting.remove(<extendedcrafting:material:24>);
craft.make(<extendedcrafting:storage:3>, ["pretty",
  "             ",
  "■ ▬ ▬ ▬ ▬ ▬ ■",
  "■ - ▄ ▄ ▄ - ■",
  "■ - ▄ § ▄ - ■",
  "■ - ▄ ▄ ▄ - ■",
  "■ ▬ ▬ ▬ ▬ ▬ ■"], {
  "■": <ore:blockDiamond>,                     # Block of Diamond
  "▄": <ore:blockSilver>,                      # Block of Silver
  "§": <deepmoblearning:glitch_infused_ingot>, # Glitch Infused Ingot
  "▬": <ore:ingotMithril>,                     # Mana Infused Ingot
  "-": <ore:ingotEvilMetal>,                   # Evil Infused Iron Ingot
});

# [Basic Component] from [Infinity Bimetal Gear][+3]
craft.remake(<extendedcrafting:material:14>, ["pretty",
  "F ╱ F",
  "# ¤ #",
  "F ╱ F"], {
  "F": <fluxnetworks:flux>,    # Flux
  "╱": <forestry:oak_stick>,   # Impregnated Stick
  "#": <ore:plankTreatedWood>, # Treated Wood Planks
  "¤": <ore:gearIronInfinity>, # Infinity Bimetal Gear
});

# [Basic Catalyst] from [Advanced Alloy][+1]
craft.remake(<extendedcrafting:material:8>, ["pretty",
  "  B  ",
  "B □ B",
  "  B  "], {
  "B": <extendedcrafting:material:14>, # Basic Component
  "□": <ore:plateAdvancedAlloy>, # Advanced Alloy
});

# [Advanced Component] from [Plastic][+4]
craft.remake(<extendedcrafting:material:15>, ["pretty",
  "# A #",
  "M R M",
  "# G #"], {
  "#": <astralsorcery:blockinfusedwood:1>, # Infused Wood Planks
  "A": <ore:alloyAdvanced>, # Enriched Alloy
  "M": <extrautils2:decorativesolidwood>,  # Magical Planks
  "R": <industrialforegoing:plastic>,      # Plastic
  "G": <biomesoplenty:coral:*>,            # Glowing Coral
});

# [Advanced Catalyst] from [Void Crystal][+2]
craft.remake(<extendedcrafting:material:9>, ["pretty",
  "∩ A ∩",
  "A * A",
  "∩ A ∩"], {
  "∩": <integrateddynamics:crystalized_menril_chunk>, # Crystalized Menril Chunk
  "A": <extendedcrafting:material:15>, # Advanced Component
  "*": <ore:crystalVoid>,              # Void Crystal
});

# [Elite Component] from [Emerald Gear][+4]
craft.remake(<extendedcrafting:material:16>, ["pretty",
  "L ◘ L",
  "▬ ¤ ▬",
  "L P L"], {
  "L": <botania:livingwood:1>,            # Livingwood Planks
  "◘": <ic2:fluid_cell>.withTag({Fluid: {FluidName: "syngas", Amount: 1000}}), # Universal Fluid Cell
  "▬": <ore:ingotPlutonium242All>,        # Plutonium-242
  "¤": <ore:gearEmerald>,                 # Emerald Gear
  "P": <appliedenergistics2:material:20>, # Printed Silicon
});

# [Elite Catalyst] from [Material Absorber][+2]
craft.remake(<extendedcrafting:material:10>, ["pretty",
  "▲ E ▲",
  "E M E",
  "▲ E ▲"], {
  "▲": <ore:dustPsi>,                  # Psidust
  "E": <extendedcrafting:material:16>, # Elite Component
  "M": <rftoolsdim:material_absorber>.withTag({meta: 0, absorbing: 0, block: "minecraft:stone"}), # Material Absorber
});

# [Black Iron Frame]*8 from [Quartz Glass][+1]
craft.remake(<extendedcrafting:frame> * 8, ["pretty",
  "‚ ⌃ ‚",
  "⌃   ⌃",
  "‚ ⌃ ‚"], {
  "‚": <ore:nuggetBlackIron>,              # Black Iron Nugget
  "⌃": <appliedenergistics2:quartz_glass>, # Quartz Glass
});