import mods.jei.JEI.removeAndHide as rh;
#modloaded extendedcrafting

	var piston = <minecraft:piston>;
	var blackIron = <ore:ingotBlackIron>;

# Extended Crafting Table removal
	rh(<extendedcrafting:crafting_table>);

# Handheld Crafting Table
	rh(<extendedcrafting:handheld_table>);
	
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
	<thermalfoundation:storage_alloy:2>, <bigreactors:blockgraphite>, 15000);	
	
# Crafting Core
	recipes.remove(<extendedcrafting:crafting_core>);
	mods.forestry.Carpenter.addRecipe(<extendedcrafting:crafting_core>, 
	[[<extendedcrafting:material:18>, <extendedcrafting:material:18>, <extendedcrafting:material:18>],
	[<plustic:osmiridiumingot>, <extendedcrafting:pedestal>, <plustic:osmiridiumingot>],
	[<extendedcrafting:pedestal>, <extendedcrafting:pedestal>, <extendedcrafting:pedestal>]], 
	40, <liquid:coal> * 5000);
	
# Compression
	recipes.remove(<extendedcrafting:compressor>);
	mods.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:compressor>, 
	[[piston, piston, piston, piston, piston], 
	[piston, <ic2:te:43>, <excompressum:auto_compressor>, <ic2:te:43>, piston], 
	[piston, <extendedcrafting:storage>, <mekanism:machineblock:7>.withTag({recipeType: 3}), <extendedcrafting:storage>, piston], 
	[piston, <ic2:te:43>, <excompressum:auto_compressor>, <ic2:te:43>, piston], 
	[piston, piston, piston, piston, piston]]);  
	
# Advanced Crafting
	recipes.remove(<extendedcrafting:table_advanced>);
	mods.extendedcrafting.TableCrafting.addShaped(0, 
	<extendedcrafting:table_advanced>, 
	[[<extendedcrafting:material:8>, <extendedcrafting:material:15>, <extendedcrafting:material:9>], 
	[<extendedcrafting:material:14>, <extendedcrafting:table_basic>, <extendedcrafting:material:17>], 
	[<extendedcrafting:material:10>, <extendedcrafting:material:16>, <extendedcrafting:material:11>]]);  

# Elite Crafting
	recipes.remove(<extendedcrafting:table_elite>);
	mods.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:table_elite>, [
	[<thermalexpansion:frame:129>, <extendedcrafting:material:16>, <thermalexpansion:frame:147>, <extendedcrafting:material:16>, <thermalexpansion:frame:129>], 
	[<extendedcrafting:material:16>, <ore:dustMana>, <extendedcrafting:table_advanced>, <ore:dustMana>, <extendedcrafting:material:16>], 
	[<thermalfoundation:fertilizer:2>, <ore:blockOsgloglas>, <rftools:crafter3>, <ore:blockOsgloglas>, <thermalfoundation:fertilizer:2>], 
	[<extendedcrafting:material:16>, <ore:dustMana>, <extendedcrafting:table_advanced>, <ore:dustMana>, <extendedcrafting:material:16>], 
	[<thermalexpansion:frame:129>, <extendedcrafting:material:16>, <thermalexpansion:frame:147>, <extendedcrafting:material:16>, <thermalexpansion:frame:129>]]);

# Ultimate Crafting
	recipes.remove(<extendedcrafting:table_ultimate>);
	mods.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:table_ultimate>, [
	[<thermalexpansion:frame:147>, <extendedcrafting:trimmed:4>, <ore:crystalDraconium>, <advancedrocketry:ic:2>, <ore:crystalDraconium>, <extendedcrafting:trimmed:4>, <thermalexpansion:frame:147>], 
	[<extendedcrafting:trimmed:4>, <ore:blockAethium>, <avaritia:double_compressed_crafting_table>, <thermalexpansion:frame:148>, <avaritia:double_compressed_crafting_table>, <ore:blockEnderium>, <extendedcrafting:trimmed:4>], 
	[<ore:crystalDraconium>, <avaritia:double_compressed_crafting_table>, <extendedcrafting:table_advanced>, <extendedcrafting:table_elite>, <extendedcrafting:table_advanced>, <avaritia:double_compressed_crafting_table>, <ore:crystalDraconium>], 
	[<advancedrocketry:ic:2>, <draconicevolution:wyvern_core>, <ic2:iridium_reflector>, <avaritia:extreme_crafting_table>, <ic2:iridium_reflector>, <draconicevolution:wyvern_core>, <advancedrocketry:ic:2>], 
	[<ore:crystalDraconium>, <avaritia:double_compressed_crafting_table>, <extendedcrafting:table_advanced>, <extendedcrafting:table_elite>, <extendedcrafting:table_advanced>, <avaritia:double_compressed_crafting_table>, <ore:crystalDraconium>], 
	[<extendedcrafting:trimmed:4>, <ore:blockLudicrite>, <avaritia:double_compressed_crafting_table>, <thermalexpansion:frame:148>, <avaritia:double_compressed_crafting_table>, <ore:blockMirion>, <extendedcrafting:trimmed:4>], 
	[<thermalexpansion:frame:147>, <extendedcrafting:trimmed:4>, <ore:crystalDraconium>, <advancedrocketry:ic:2>, <ore:crystalDraconium>, <extendedcrafting:trimmed:4>, <thermalexpansion:frame:147>]]);

# Pedestal
	recipes.remove(<extendedcrafting:pedestal>);
	mods.forestry.Carpenter.addRecipe(<extendedcrafting:pedestal>, 
	[[null, <extendedcrafting:material:2>, null],
	[null, blackIron, null],
	[blackIron, <extendedcrafting:storage>, blackIron]], 
	40, <liquid:coal> * 1000);

# Increasing the price of Lapis, Redstone, Coal & Glowstone Singularities
	mods.extendedcrafting.CompressionCrafting.remove(<extendedcrafting:singularity>);
	mods.extendedcrafting.CompressionCrafting.addRecipe(<extendedcrafting:singularity>, <minecraft:coal_block>, 10000, <extendedcrafting:material:12>, 1000000000, 1000000);

	mods.extendedcrafting.CompressionCrafting.remove(<extendedcrafting:singularity:2>);
	mods.extendedcrafting.CompressionCrafting.addRecipe(<extendedcrafting:singularity:2>, <minecraft:lapis_block>, 10000, <extendedcrafting:material:12>, 1000000000, 1000000);

	mods.extendedcrafting.CompressionCrafting.remove(<extendedcrafting:singularity:3>);
	mods.extendedcrafting.CompressionCrafting.addRecipe(<extendedcrafting:singularity:3>, <minecraft:redstone_block>, 10000, <extendedcrafting:material:12>, 1000000000, 1000000);

	mods.extendedcrafting.CompressionCrafting.remove(<extendedcrafting:singularity:4>);
	mods.extendedcrafting.CompressionCrafting.addRecipe(<extendedcrafting:singularity:4>, <minecraft:glowstone>, 10000, <extendedcrafting:material:12>, 1000000000, 1000000);

# Luminiscence made in chemical reactor and drying basin
recipes.removeByRecipeName("extendedcrafting:luminessence");
scripts.Processing.evaporate(<fluid:liquid_sunshine> * 1000, <extendedcrafting:material:7> * 2, null);

# Insanium from inferium
mods.extendedcrafting.CompressionCrafting.addRecipe(<mysticalagradditions:insanium>, 
<mysticalagriculture:crafting>, 1024, <mysticalagriculture:master_infusion_crystal>, 2000000, 100000);

# Simplify Automating table
recipes.remove(<extendedcrafting:interface>);
recipes.addShaped(<extendedcrafting:interface>, [
	[<ore:ingotBlackIron>, <extendedcrafting:material:10>, <ore:ingotBlackIron>],
	[<extendedcrafting:material:17>, <extendedcrafting:frame>, <extendedcrafting:material:17>],
	[<ore:ingotBlackIron>, <extendedcrafting:material:2>, <ore:ingotBlackIron>]]);
