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
	
	scripts.wrap.thermalexpansion.InductionSmelter.addRecipe
	(<extendedcrafting:material> * 3, 
	<thermalfoundation:storage_alloy:2>, <immersiveengineering:stone_decoration:3>, 50000);
	
	scripts.wrap.thermalexpansion.InductionSmelter.addRecipe
	(<extendedcrafting:material> * 2, 
	<thermalfoundation:storage_alloy:2>, <actuallyadditions:block_misc:2>, 20000);
	
	scripts.wrap.thermalexpansion.InductionSmelter.addRecipe
	(<extendedcrafting:material> * 3, 
	<thermalfoundation:storage_alloy:2>, <immersiveengineering:material:19>, 15000);
	
	scripts.wrap.thermalexpansion.InductionSmelter.addRecipe
	(<extendedcrafting:material> * 4, 
	<thermalfoundation:storage_alloy:2>, <nuclearcraft:alloy:1>, 20000);
	
	scripts.wrap.thermalexpansion.InductionSmelter.addRecipe
	(<extendedcrafting:material> * 3, 
	<thermalfoundation:storage_alloy:2>, <nuclearcraft:alloy:3>, 15000);
	
	scripts.wrap.thermalexpansion.InductionSmelter.addRecipe
	(<extendedcrafting:material> * 3, 
	<thermalfoundation:storage_alloy:2>, <bigreactors:blockgraphite>, 15000);	
	
# Crafting Core
	recipes.remove(<extendedcrafting:crafting_core>);
	scripts.wrap.forestry.Carpenter.addRecipe(<extendedcrafting:crafting_core>, 
	[[<extendedcrafting:material:18>, <extendedcrafting:material:18>, <extendedcrafting:material:18>],
	[<plustic:osmiridiumingot>, <extendedcrafting:pedestal>, <plustic:osmiridiumingot>],
	[<extendedcrafting:pedestal>, <extendedcrafting:pedestal>, <extendedcrafting:pedestal>]], 
	40, <liquid:coal> * 5000);
	
# Compression
	recipes.remove(<extendedcrafting:compressor>);
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:compressor>, 
	[[piston, piston, piston, piston, piston], 
	[piston, <ic2:te:43>, <excompressum:auto_compressor>, <ic2:te:43>, piston], 
	[piston, <extendedcrafting:storage>, <mekanism:machineblock:7>.withTag({recipeType: 3}), <extendedcrafting:storage>, piston], 
	[piston, <ic2:te:43>, <excompressum:auto_compressor>, <ic2:te:43>, piston], 
	[piston, piston, piston, piston, piston]]);  
	
# Advanced Crafting
	recipes.remove(<extendedcrafting:table_advanced>);
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, 
	<extendedcrafting:table_advanced>, 
	[[<extendedcrafting:material:8>, <extendedcrafting:material:15>, <extendedcrafting:material:9>], 
	[<extendedcrafting:material:14>, <extendedcrafting:table_basic>, <extendedcrafting:material:17>], 
	[<extendedcrafting:material:10>, <extendedcrafting:material:16>, <extendedcrafting:material:11>]]);  

# Elite Crafting
	recipes.remove(<extendedcrafting:table_elite>);
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:table_elite>, [
	[<thermalexpansion:frame:129>, <extendedcrafting:material:16>, <thermalexpansion:frame:147>, <extendedcrafting:material:16>, <thermalexpansion:frame:129>], 
	[<extendedcrafting:material:16>, <ore:dustMana>, <extendedcrafting:table_advanced>, <ore:dustMana>, <extendedcrafting:material:16>], 
	[<thermalfoundation:fertilizer:2>, <ore:blockOsgloglas>, <rftools:crafter3>, <ore:blockOsgloglas>, <thermalfoundation:fertilizer:2>], 
	[<extendedcrafting:material:16>, <ore:dustMana>, <extendedcrafting:table_advanced>, <ore:dustMana>, <extendedcrafting:material:16>], 
	[<thermalexpansion:frame:129>, <extendedcrafting:material:16>, <thermalexpansion:frame:147>, <extendedcrafting:material:16>, <thermalexpansion:frame:129>]]);

# Ultimate Crafting
	recipes.remove(<extendedcrafting:table_ultimate>);
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:table_ultimate>, [
	[<thermalexpansion:frame:147>, <extendedcrafting:trimmed:4>, <ore:crystalDraconium>, <advancedrocketry:ic:2>, <ore:crystalDraconium>, <extendedcrafting:trimmed:4>, <thermalexpansion:frame:147>], 
	[<extendedcrafting:trimmed:4>, <ore:blockAethium>, <avaritia:double_compressed_crafting_table>, <thermalexpansion:frame:148>, <avaritia:double_compressed_crafting_table>, <ore:blockEnderium>, <extendedcrafting:trimmed:4>], 
	[<ore:crystalDraconium>, <avaritia:double_compressed_crafting_table>, <extendedcrafting:table_advanced>, <extendedcrafting:table_elite>, <extendedcrafting:table_advanced>, <avaritia:double_compressed_crafting_table>, <ore:crystalDraconium>], 
	[<advancedrocketry:ic:2>, <draconicevolution:wyvern_core>, <ic2:iridium_reflector>, <avaritia:extreme_crafting_table>, <ic2:iridium_reflector>, <draconicevolution:wyvern_core>, <advancedrocketry:ic:2>], 
	[<ore:crystalDraconium>, <avaritia:double_compressed_crafting_table>, <extendedcrafting:table_advanced>, <extendedcrafting:table_elite>, <extendedcrafting:table_advanced>, <avaritia:double_compressed_crafting_table>, <ore:crystalDraconium>], 
	[<extendedcrafting:trimmed:4>, <ore:blockLudicrite>, <avaritia:double_compressed_crafting_table>, <thermalexpansion:frame:148>, <avaritia:double_compressed_crafting_table>, <ore:blockMirion>, <extendedcrafting:trimmed:4>], 
	[<thermalexpansion:frame:147>, <extendedcrafting:trimmed:4>, <ore:crystalDraconium>, <advancedrocketry:ic:2>, <ore:crystalDraconium>, <extendedcrafting:trimmed:4>, <thermalexpansion:frame:147>]]);

# Pedestal
	recipes.remove(<extendedcrafting:pedestal>);
	scripts.wrap.forestry.Carpenter.addRecipe(<extendedcrafting:pedestal>, 
	[[null, <extendedcrafting:material:2>, null],
	[null, blackIron, null],
	[blackIron, <extendedcrafting:storage>, blackIron]], 
	40, <liquid:coal> * 1000);

# Luminiscence made in chemical reactor and drying basin
recipes.removeByRecipeName("extendedcrafting:luminessence");
scripts.process.evaporate(<fluid:liquid_sunshine> * 1000, <extendedcrafting:material:7> * 2, null);

# Insanium from inferium
scripts.wrap.extendedcrafting.CompressionCrafting.addRecipe(<mysticalagradditions:insanium>, 
<mysticalagriculture:crafting>, 1024, <mysticalagriculture:master_infusion_crystal>, 2000000, 100000);

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
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<mekanism:controlcircuit:3>, 2000000, 1000000, <mekanism:controlcircuit:2>, [<mekanism:atomicalloy>, <mekanism:atomicalloy>, <mekanism:atomicalloy>, <mekanism:atomicalloy>]);
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<thermalexpansion:frame:129>, 10000000, 1000000, <thermalexpansion:frame:128>, [<immersiveengineering:material:2>, <thermalfoundation:material:354>, <thermalfoundation:material:290>, <mekanism:basicblock:8>]);
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<actuallyadditions:block_crystal_empowered>, 1000000, 1000000, <actuallyadditions:block_crystal>, [<nuclearcraft:gem>, <thermalfoundation:material:513>, <tconstruct:tool_rod>.withTag({Material: "ardite"}), <minecraft:red_nether_brick>]);
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<actuallyadditions:block_crystal_empowered:1>, 1000000, 1000000, <actuallyadditions:block_crystal:1>, [<tconstruct:ingots>, <ic2:plate:13>, <biomesoplenty:gem:6>, <tconstruct:slime_congealed:1>]);
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<actuallyadditions:block_crystal_empowered:2>, 2000000, 1000000, <actuallyadditions:block_crystal:2>, [<nuclearcraft:dust:10>, <botania:manaresource:2>, <tconstruct:ingots:2>, <biomesoplenty:gem:5>]);
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<actuallyadditions:block_crystal_empowered:3>, 10000000, 1000000,  <actuallyadditions:block_crystal:3>, [<randomthings:ingredient:13>, <extendedcrafting:storage>, <ore:stoneBasalt>, <appliedenergistics2:sky_stone_block>]);
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<actuallyadditions:block_crystal_empowered:4>, 2000000, 1000000, <actuallyadditions:block_crystal:4>, [<minecraft:dye:2>, <minecraft:emerald>, <nuclearcraft:dust:9>, <actuallyadditions:block_testifi_bucks_green_wall>]);
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<actuallyadditions:block_crystal_empowered:5>, 1000000, 1000000, <actuallyadditions:block_crystal:5>, [<minecraft:quartz_block>, <minecraft:bone_block>, <mekanism:ingot:1>, <nuclearcraft:gem:2>]);
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<actuallyadditions:item_misc:24>, 100000, 1000000, <actuallyadditions:item_misc:23>, [<actuallyadditions:item_canola_seed>, <actuallyadditions:item_canola_seed>, <actuallyadditions:item_canola_seed>, <actuallyadditions:item_canola_seed>]);

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