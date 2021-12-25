import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
#modloaded mysticalagriculture

# Enderman Chunks -> Ender Pearls
mods.nuclearcraft.pressurizer.addRecipe(<mysticalagriculture:chunk:19> * 2, <minecraft:ender_pearl>);

# Wither Proof Blocks
recipes.addShapedMirrored("Wither Proof Block", 
<mysticalagriculture:witherproof_block> * 16, 
[[<enderio:block_reinforced_obsidian>, <enderio:block_reinforced_obsidian>, <enderio:block_reinforced_obsidian>],
[<enderio:block_reinforced_obsidian>, <ore:dyeBlack>, <enderio:block_reinforced_obsidian>], 
[<enderio:block_reinforced_obsidian>, <enderio:block_reinforced_obsidian>, <enderio:block_reinforced_obsidian>]]);

recipes.addShapedMirrored("Wither Proof Glass", 
<mysticalagriculture:witherproof_glass> * 16, 
[[<enderio:block_reinforced_obsidian>, <extrautils2:decorativeglass:3>, <enderio:block_reinforced_obsidian>],
[<extrautils2:decorativeglass:3>, <ore:dyeBlack>, <extrautils2:decorativeglass:3>], 
[<enderio:block_reinforced_obsidian>, <extrautils2:decorativeglass:3>, <enderio:block_reinforced_obsidian>]]);

# Readding Essence to Ingot recipes because of an unidentified bug - 20-12-2018
	recipes.addShaped("Lead Essence to Ingot", <thermalfoundation:material:131> * 4, [[<mysticalagriculture:lead_essence>, <mysticalagriculture:lead_essence>, <mysticalagriculture:lead_essence>],[<mysticalagriculture:lead_essence>, null, <mysticalagriculture:lead_essence>], [<mysticalagriculture:lead_essence>, <mysticalagriculture:lead_essence>, <mysticalagriculture:lead_essence>]]);
	recipes.addShaped("Silver Essence to Ingot", <thermalfoundation:material:130> * 4, [[<mysticalagriculture:silver_essence>, <mysticalagriculture:silver_essence>, <mysticalagriculture:silver_essence>],[<mysticalagriculture:silver_essence>, null, <mysticalagriculture:silver_essence>], [<mysticalagriculture:silver_essence>, <mysticalagriculture:silver_essence>, <mysticalagriculture:silver_essence>]]);
	recipes.addShaped("Tin Essence to Ingot", <thermalfoundation:material:129> * 8, [[<mysticalagriculture:tin_essence>, <mysticalagriculture:tin_essence>, <mysticalagriculture:tin_essence>],[<mysticalagriculture:tin_essence>, null, <mysticalagriculture:tin_essence>], [<mysticalagriculture:tin_essence>, <mysticalagriculture:tin_essence>, <mysticalagriculture:tin_essence>]]);
	recipes.addShaped("Copper Essence to Ingot", <thermalfoundation:material:128> * 8, [[<mysticalagriculture:copper_essence>, <mysticalagriculture:copper_essence>, <mysticalagriculture:copper_essence>],[<mysticalagriculture:copper_essence>, null, <mysticalagriculture:copper_essence>], [<mysticalagriculture:copper_essence>, <mysticalagriculture:copper_essence>, <mysticalagriculture:copper_essence>]]);

# Disabling Obsidian recipe, readding Essence recipe
	recipes.remove(<minecraft:obsidian>);
	recipes.addShaped("Obsidian From Essence", 
	<minecraft:obsidian> * 8, 
	[[<mysticalagriculture:obsidian_essence>, <mysticalagriculture:obsidian_essence>, <mysticalagriculture:obsidian_essence>],
	[<mysticalagriculture:obsidian_essence>, null, <mysticalagriculture:obsidian_essence>], 
	[<mysticalagriculture:obsidian_essence>, <mysticalagriculture:obsidian_essence>, <mysticalagriculture:obsidian_essence>]]);

# Ultimate Furnace
	recipes.remove(<mysticalagriculture:ultimate_furnace>);
	recipes.addShapedMirrored("Ultimate Furnace", 
	<mysticalagriculture:ultimate_furnace>, 
	[[<ore:blockInsaniumEssence>, <extrautils2:machine>.withTag({Type: "extrautils2:generator_netherstar"}), <ore:blockInsaniumEssence>],
	[<mysticalagriculture:supremium_furnace>, <extendedcrafting:storage:3>, <mysticalagriculture:supremium_furnace>], 
	[<quark:black_ash>, <mysticalagradditions:stuff:1>, <quark:black_ash>]]);

# Growth Accelerator
	recipes.remove(<mysticalagriculture:growth_accelerator>);
	recipes.addShapedMirrored("Growth Accelerator", 
	<mysticalagriculture:growth_accelerator> * 2, 
	[[<ore:blockInferiumEssence>, <ore:blockPrudentiumEssence>, <ore:blockInferiumEssence>],
	[<ore:manaDiamond>, <appliedenergistics2:quartz_growth_accelerator>, <ore:manaDiamond>], 
	[<ore:blockInferiumEssence>, <ore:blockPrudentiumEssence>, <ore:blockInferiumEssence>]]);
	
# Infusion Crystal
	recipes.remove(<mysticalagriculture:infusion_crystal>);
	mods.thermalexpansion.Infuser.addRecipe(<mysticalagriculture:infusion_crystal>, <biomesoplenty:gem>, 10000000);

# Master Infusion Crystal
	recipes.remove(<mysticalagriculture:master_infusion_crystal>);
	mods.astralsorcery.Altar.addConstellationAltarRecipe("enigmatica2expert:shaped/internal/altar/master_infusion_crystal",
		<mysticalagriculture:master_infusion_crystal>, 3000, 600, 
	[<botania:rune:12>, <botania:storage:3>, <botania:rune:15>,
	<botania:storage:2>, <biomesoplenty:gem>, <botania:storage>,
	<botania:rune:11>, <botania:storage:1>, <botania:rune:10>,
	<botania:spark>, <botania:spark>, <botania:spark>, <botania:spark>,
	<astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>, <botania:manaresource:1>, <botania:manaresource:1>,
	<botania:manaresource:1>, <botania:manaresource:1>, <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>]);
	
# Block of Prosperity
	recipes.addShapedMirrored("Block of Prosperity", 
	<mysticalagriculture:storage:5> * 2, 
	[[<minecraft:emerald_block>, <botania:grassseeds:*>, <minecraft:quartz_block>],
	[<botania:grassseeds:*>, <astralsorcery:itemrockcrystalsimple>.anyDamage(), <botania:grassseeds:*>], 
	[<minecraft:gold_block>, <botania:grassseeds:*>, <minecraft:diamond_block>]]);
	
# *======= Seeds Tier 1 =======*

	recipes.remove(<mysticalagriculture:nature_seeds>);
	recipes.addShapedMirrored("Nature Seeds", 
	<mysticalagriculture:nature_seeds>, 
	[[<mysticalagriculture:crafting:6>, <ore:blockInferiumEssence>, <mysticalagriculture:crafting:6>],
	[<ore:ingotInferium>, <mysticalagriculture:crafting:17>, <ore:ingotInferium>], 
	[<mysticalagriculture:crafting:6>, <ore:blockInferiumEssence>, <mysticalagriculture:crafting:6>]]);

# *======= Seeds Tier 2 =======*

# Aluminum Seeds
	recipes.remove(<mysticalagriculture:aluminum_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/aluminum_seeds",
		<mysticalagriculture:aluminum_seeds>, 500, 200, 
	[<ore:essenceTier1>, <ore:blockPrudentiumEssence>, <ore:essenceTier1>,
	<ore:blockPrudentiumEssence>, <mysticalagriculture:crafting:18>, <ore:blockPrudentiumEssence>, 
	<ore:essenceTier1>, <ore:blockPrudentiumEssence>, <ore:essenceTier1>,
	
	<ore:blockAluminum>, <ore:blockAluminum>, <ore:blockAluminum>, <ore:blockAluminum>]);

# Copper Seeds
	recipes.remove(<mysticalagriculture:copper_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/copper_seeds",
		<mysticalagriculture:copper_seeds>, 500, 200, 
	[<ore:essenceTier1>, <ore:blockPrudentiumEssence>, <ore:essenceTier1>,
	<ore:blockPrudentiumEssence>, <mysticalagriculture:crafting:18>, <ore:blockPrudentiumEssence>, 
	<ore:essenceTier1>, <ore:blockPrudentiumEssence>, <ore:essenceTier1>,
	
	<ore:blockCopper>, <ore:blockCopper>, <ore:blockCopper>, <ore:blockCopper>]);
	
# Mystical Flower Seeds
	recipes.remove(<mysticalagriculture:mystical_flower_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/mystical_flower_seeds",
		<mysticalagriculture:mystical_flower_seeds>, 400, 200, 
	[<mysticalagriculture:crafting:10>, <ore:blockPrudentiumEssence>, <mysticalagriculture:crafting:10>,
	<ore:blockPrudentiumEssence>, <mysticalagriculture:crafting:18>, <ore:blockPrudentiumEssence>, 
	<mysticalagriculture:crafting:10>, <ore:blockPrudentiumEssence>, <mysticalagriculture:crafting:10>,
	
	<ore:manaDiamond>, <ore:manaDiamond>, <ore:manaPearl>, <ore:manaPearl>]);
	
# Inferium Seeds
	recipes.remove(<mysticalagriculture:tier2_inferium_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/tier2_inferium_seeds",
		<mysticalagriculture:tier2_inferium_seeds>, 400, 200, 
	[<ore:essenceTier1>, <ore:blockPrudentiumEssence>, <ore:essenceTier1>,
	<ore:blockPrudentiumEssence>, <mysticalagriculture:crafting:18>, <ore:blockPrudentiumEssence>, 
	<ore:essenceTier1>, <ore:blockPrudentiumEssence>, <ore:essenceTier1>,
	
	<ore:blockInferiumEssence>, <ore:blockInferiumEssence>, <ore:blockInferiumEssence>, <ore:blockInferiumEssence>]);
	
# Apatite Seeds
	recipes.remove(<mysticalagriculture:apatite_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/apatite_seeds",
		<mysticalagriculture:apatite_seeds>, 400, 200, 
	[<ore:essenceTier1>, <ore:blockPrudentiumEssence>, <ore:essenceTier1>,
	<ore:blockPrudentiumEssence>, <mysticalagriculture:crafting:18>, <ore:blockPrudentiumEssence>, 
	<ore:essenceTier1>, <ore:blockPrudentiumEssence>, <ore:essenceTier1>,
	
	<ore:blockApatite>, <ore:blockApatite>, <ore:blockApatite>, <ore:blockApatite>]);
	
# Coal Seeds
	recipes.remove(<mysticalagriculture:coal_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/coal_seeds",
		<mysticalagriculture:coal_seeds>, 400, 200, 
	[<ore:essenceTier1>, <ore:blockPrudentiumEssence>, <ore:essenceTier1>,
	<ore:blockPrudentiumEssence>, <mysticalagriculture:crafting:18>, <ore:blockPrudentiumEssence>, 
	<ore:essenceTier1>, <ore:blockPrudentiumEssence>, <ore:essenceTier1>,
	
	<ore:blockCoal>, <ore:blockCoal>, <ore:blockCoal>, <ore:blockCoal>]);
	
# *======= Seeds Tier 3 =======*

# Inferium Seeds
	recipes.remove(<mysticalagriculture:tier3_inferium_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/tier3_inferium_seeds",
		<mysticalagriculture:tier3_inferium_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:blockPrudentiumEssence>, <ore:blockPrudentiumEssence>, <ore:blockPrudentiumEssence>, <ore:blockPrudentiumEssence>]);
	
# Nether Seeds
	recipes.remove(<mysticalagriculture:nether_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/nether_seeds",
		<mysticalagriculture:nether_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:blockNetherWart>, <ore:blockNetherWart>, <ore:blockNetherWart>, <ore:blockNetherWart>]);
	
# Certus Seeds
	recipes.remove(<mysticalagriculture:certus_quartz_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/certus_quartz_seeds",
		<mysticalagriculture:certus_quartz_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:blockCertusQuartz>, <ore:blockCertusQuartz>, <ore:blockCertusQuartz>, <ore:blockCertusQuartz>]);

# Aquamarine Seeds
	recipes.remove(<mysticalagriculture:aquamarine_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/aquamarine_seeds",
		<mysticalagriculture:aquamarine_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:oreAquamarine>, <ore:oreAquamarine>, <ore:oreAquamarine>, <ore:oreAquamarine>]);
	
# Obsidian Seeds
	recipes.remove(<mysticalagriculture:obsidian_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/obsidian_seeds",
		<mysticalagriculture:obsidian_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:plateDenseObsidian>, <ore:plateDenseObsidian>, <ore:plateDenseObsidian>, <ore:plateDenseObsidian>]);
	
# Redstone Seeds
	recipes.remove(<mysticalagriculture:redstone_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/redstone_seeds",
		<mysticalagriculture:redstone_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:blockRedstone>, <ore:blockRedstone>, <ore:blockRedstone>, <ore:blockRedstone>]);
	
# Glowstone Seeds
	recipes.remove(<mysticalagriculture:glowstone_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/glowstone_seeds",
		<mysticalagriculture:glowstone_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:glowstone>, <ore:glowstone>, <ore:glowstone>, <ore:glowstone>]);
	
# Nether Quartz Seeds
	recipes.remove(<mysticalagriculture:nether_quartz_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/nether_quartz_seeds",
		<mysticalagriculture:nether_quartz_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:blockQuartz>, <ore:blockQuartz>, <ore:blockQuartz>, <ore:blockQuartz>]);
	
# Iron Seeds
	recipes.remove(<mysticalagriculture:iron_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/iron_seeds",
		<mysticalagriculture:iron_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:blockIron>, <ore:blockIron>, <ore:blockIron>, <ore:blockIron>]);
	
# Lead Seeds
	recipes.remove(<mysticalagriculture:lead_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/lead_seeds",
		<mysticalagriculture:lead_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:blockLead>, <ore:blockLead>, <ore:blockLead>, <ore:blockLead>]);
	
# Sky Stone Seeds
	recipes.remove(<mysticalagriculture:sky_stone_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/sky_stone_seeds",
		<mysticalagriculture:sky_stone_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<appliedenergistics2:material:45>, <appliedenergistics2:material:45>, <appliedenergistics2:material:45>, <appliedenergistics2:material:45>]);
	
# Silver Seeds
	recipes.remove(<mysticalagriculture:silver_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/silver_seeds",
		<mysticalagriculture:silver_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:blockSilver>, <ore:blockSilver>, <ore:blockSilver>, <ore:blockSilver>]);
	
# Tin Seeds
	recipes.remove(<mysticalagriculture:tin_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/tin_seeds",
		<mysticalagriculture:tin_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:blockTin>, <ore:blockTin>, <ore:blockTin>, <ore:blockTin>]);
	
# Knightslime Seeds
	recipes.remove(<mysticalagriculture:knightslime_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/knightslime_seeds",
		<mysticalagriculture:knightslime_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:blockKnightslime>, <ore:blockKnightslime>, <ore:blockKnightslime>, <ore:blockKnightslime>]);
	
# Steeleaf Seeds
	recipes.remove(<mysticalagriculture:steeleaf_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/steeleaf_seeds",
		<mysticalagriculture:steeleaf_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:ingotSteeleaf>, <ore:ingotSteeleaf>, <twilightforest:block_storage:2>, <twilightforest:block_storage:2>]);
	
# Ironwood Seeds
	recipes.remove(<mysticalagriculture:ironwood_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/ironwood_seeds",
		<mysticalagriculture:ironwood_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:ingotIronwood>, <ore:ingotIronwood>, <twilightforest:block_storage>, <twilightforest:block_storage>]);
	
# Black Quartz Seeds
	recipes.remove(<mysticalagriculture:black_quartz_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/black_quartz_seeds",
		<mysticalagriculture:black_quartz_seeds>, 500, 200, 
	[<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	<ore:blockIntermediumEssence>, <mysticalagriculture:crafting:19>, <ore:blockIntermediumEssence>, 
	<ore:essenceTier2>, <ore:blockIntermediumEssence>, <ore:essenceTier2>,
	
	<ore:blockBlackQuartz>, <ore:blockBlackQuartz>, <ore:blockBlackQuartz>, <ore:blockBlackQuartz>]);
	
# *======= Seeds Tier 4 =======*

# Thaumium Seeds 
	recipes.remove(<mysticalagriculture:thaumium_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/thaumium_seeds",
		<mysticalagriculture:thaumium_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<ore:blockThaumium>, <ore:blockThaumium>, <ore:blockThaumium>, <ore:blockThaumium>]);

# Inferium Seeds
	recipes.remove(<mysticalagriculture:tier4_inferium_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/tier4_inferium_seeds",
		<mysticalagriculture:tier4_inferium_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<ore:blockIntermediumEssence>, <ore:blockIntermediumEssence>, <ore:blockIntermediumEssence>, <ore:blockIntermediumEssence>]);

# Enderman Seeds
	recipes.remove(<mysticalagriculture:enderman_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/enderman_seeds",
	<mysticalagriculture:enderman_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<actuallyadditions:block_misc:6>, <actuallyadditions:block_misc:6>, <actuallyadditions:block_misc:8>, <actuallyadditions:block_misc:8>]);

# Ruby Seeds
	recipes.remove(<mysticalagriculture:ruby_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/ruby_seeds",
	<mysticalagriculture:ruby_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<biomesoplenty:gem_block:1>, <biomesoplenty:gem_block:1>, <biomesoplenty:gem_block:1>, <biomesoplenty:gem_block:1>]);

# Fiery_Ingot Seeds
	recipes.remove(<mysticalagriculture:fiery_ingot_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/fiery_ingot_seeds",
	<mysticalagriculture:fiery_ingot_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<ore:ingotFiery>, <ore:ingotFiery>, <twilightforest:block_storage:1>, <twilightforest:block_storage:1>]);

# Knightmetal Seeds
	recipes.remove(<mysticalagriculture:knightmetal_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/knightmetal_seeds",
	<mysticalagriculture:knightmetal_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<ore:ingotKnightmetal>, <ore:ingotKnightmetal>, <twilightforest:knightmetal_block>, <twilightforest:knightmetal_block>]);

# Fluix Seeds
	recipes.remove(<mysticalagriculture:fluix_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/fluix_block",
	<mysticalagriculture:fluix_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<appliedenergistics2:fluix_block>, <appliedenergistics2:fluix_block>, <appliedenergistics2:fluix_block>, <appliedenergistics2:fluix_block>]);

# Ardite Seeds
	recipes.remove(<mysticalagriculture:ardite_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/ardite_seeds",
	<mysticalagriculture:ardite_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<ore:blockArdite>, <ore:blockArdite>, <ore:blockArdite>, <ore:blockArdite>]);

# Peridot Seeds
	recipes.remove(<mysticalagriculture:peridot_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/peridot_seeds",
	<mysticalagriculture:peridot_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<biomesoplenty:gem_block:2>, <biomesoplenty:gem_block:2>, <biomesoplenty:gem_block:2>, <biomesoplenty:gem_block:2>]);

# Cobalt Seeds
	recipes.remove(<mysticalagriculture:cobalt_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/cobalt_seeds",
	<mysticalagriculture:cobalt_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<ore:blockCobalt>, <ore:blockCobalt>, <ore:blockCobalt>, <ore:blockCobalt>]);

# Sapphire Seeds
	recipes.remove(<mysticalagriculture:sapphire_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/sapphire_seeds",
	<mysticalagriculture:sapphire_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<biomesoplenty:gem_block:6>, <biomesoplenty:gem_block:6>, <biomesoplenty:gem_block:6>, <biomesoplenty:gem_block:6>]);

# Lapis Seeds
	recipes.remove(<mysticalagriculture:lapis_lazuli_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/lapis_lazuli_seeds",
	<mysticalagriculture:lapis_lazuli_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<ore:blockLapis>, <ore:blockLapis>, <ore:blockLapis>, <ore:blockLapis>]);

# Gold Seeds
	recipes.remove(<mysticalagriculture:gold_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/gold_seeds",
	<mysticalagriculture:gold_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<ore:blockGold>, <ore:blockGold>, <ore:blockGold>, <ore:blockGold>]);

# Amber Seeds
	recipes.remove(<mysticalagriculture:amber_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/amber_seeds",
	<mysticalagriculture:amber_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<ore:blockAmber>, <ore:blockAmber>, <ore:blockAmber>, <ore:blockAmber>]);

# Topaz Seeds
	recipes.remove(<mysticalagriculture:topaz_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/topaz_seeds",
	<mysticalagriculture:topaz_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<biomesoplenty:gem_block:3>, <biomesoplenty:gem_block:3>, <biomesoplenty:gem_block:3>, <biomesoplenty:gem_block:3>]);

# Osmium Seeds
	recipes.remove(<mysticalagriculture:osmium_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/osmium_seeds",
	<mysticalagriculture:osmium_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<ore:blockOsmium>, <ore:blockOsmium>, <ore:blockOsmium>, <ore:blockOsmium>]);

# Malachite Seeds
	recipes.remove(<mysticalagriculture:malachite_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/malachite_seeds",
	<mysticalagriculture:malachite_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<biomesoplenty:gem_block:5>, <biomesoplenty:gem_block:5>, <biomesoplenty:gem_block:5>, <biomesoplenty:gem_block:5>]);

# Tanzanite Seeds
	recipes.remove(<mysticalagriculture:tanzanite_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/tanzanite_seeds",
	<mysticalagriculture:tanzanite_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<biomesoplenty:gem_block:4>, <biomesoplenty:gem_block:4>, <biomesoplenty:gem_block:4>, <biomesoplenty:gem_block:4>]);

# Nickel Seeds
	recipes.remove(<mysticalagriculture:nickel_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/nickel_seeds",
	<mysticalagriculture:nickel_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<ore:blockNickel>, <ore:blockNickel>, <ore:blockNickel>, <ore:blockNickel>]);

# End Seeds
	recipes.remove(<mysticalagriculture:end_seeds>);
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expertskyblock:shaped/internal/altar/end_seeds",
	<mysticalagriculture:end_seeds>, 600, 200, 
	[<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	<ore:blockSuperiumEssence>, <mysticalagriculture:crafting:20>, <ore:blockSuperiumEssence>, 
	<ore:essenceTier3>, <ore:blockSuperiumEssence>, <ore:essenceTier3>,
	
	<excompressum:compressed_block:10>, <excompressum:compressed_block:10>, <excompressum:compressed_block:10>, <excompressum:compressed_block:10>]);

# *======= Seeds Tier 5 =======*
	
# Void Metal Seeds
	recipes.remove(<mysticalagriculture:void_metal_seeds>);
	mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/void_metal_seeds",
	<mysticalagriculture:void_metal_seeds>, 3500, 300, 
	[<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	<ore:blockSupremiumEssence>, <mysticalagriculture:crafting:21>, <ore:blockSupremiumEssence>, 
	<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	
	<ore:blockVoid>, <ore:blockVoid>, <ore:blockVoid>, <ore:blockVoid>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:blockVoid>, <ore:blockVoid>, <ore:blockVoid>, <ore:blockVoid>, 
			<minecraft:nether_star>],
	"astralsorcery.constellation.mineralis");

# Inferium Seeds
	recipes.remove(<mysticalagriculture:tier5_inferium_seeds>);
	mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/tier5_inferium_seeds",
	<mysticalagriculture:tier5_inferium_seeds>, 3500, 300, 
	[<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	<ore:blockSupremiumEssence>, <mysticalagriculture:crafting:21>, <ore:blockSupremiumEssence>, 
	<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	
	<ore:blockSuperiumEssence>, <ore:blockSuperiumEssence>, <ore:blockSuperiumEssence>, <ore:blockSuperiumEssence>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:blockSuperiumEssence>, <ore:blockSuperiumEssence>, <ore:blockSuperiumEssence>, <ore:blockSuperiumEssence>, 
			<minecraft:nether_star>],
	"astralsorcery.constellation.aevitas");
	
# Platinum Seeds
	recipes.remove(<mysticalagriculture:platinum_seeds>);
	mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/platinum_seeds",
	<mysticalagriculture:platinum_seeds>, 3500, 300, 
	[<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	<ore:blockSupremiumEssence>, <mysticalagriculture:crafting:21>, <ore:blockSupremiumEssence>, 
	<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	
	<ore:blockPlatinum>, <ore:blockPlatinum>, <ore:blockPlatinum>, <ore:blockPlatinum>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:blockPlatinum>, <ore:blockPlatinum>, <ore:blockPlatinum>, <ore:blockPlatinum>, 
			<minecraft:nether_star>],
	"astralsorcery.constellation.mineralis");

# Uranium Seeds
	recipes.remove(<mysticalagriculture:uranium_seeds>);
	mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/uranium_seeds",
	<mysticalagriculture:uranium_seeds>, 3500, 300, 
	[<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	<ore:blockSupremiumEssence>, <mysticalagriculture:crafting:21>, <ore:blockSupremiumEssence>, 
	<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	
	<ore:blockUranium>, <ore:blockUranium>, <ore:blockUranium>, <ore:blockUranium>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:blockUranium>, <ore:blockUranium>, <ore:blockUranium>, <ore:blockUranium>, 
			<minecraft:nether_star>],
	"astralsorcery.constellation.mineralis");

# Diamond Seeds
	recipes.remove(<mysticalagriculture:diamond_seeds>);
	mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/diamond_seeds",
	<mysticalagriculture:diamond_seeds>, 3500, 300, 
	[<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	<ore:blockSupremiumEssence>, <mysticalagriculture:crafting:21>, <ore:blockSupremiumEssence>, 
	<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	
	<ore:blockDiamond>, <ore:blockDiamond>, <ore:blockDiamond>, <ore:blockDiamond>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:blockDiamond>, <ore:blockDiamond>, <ore:blockDiamond>, <ore:blockDiamond>, 
			<minecraft:nether_star>],
	"astralsorcery.constellation.mineralis");

# Rock_Crystal Seeds
	recipes.remove(<mysticalagriculture:rock_crystal_seeds>);
	mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/rock_crystal_seeds",
	<mysticalagriculture:rock_crystal_seeds>, 3500, 300, 
	[<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	<ore:blockSupremiumEssence>, <mysticalagriculture:crafting:21>, <ore:blockSupremiumEssence>, 
	<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	
	<astralsorcery:itemcelestialcrystal>.anyDamage(), <astralsorcery:itemcelestialcrystal>.anyDamage(), <astralsorcery:itemcelestialcrystal>.anyDamage(), <astralsorcery:itemcelestialcrystal>.anyDamage(),
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<astralsorcery:itemcelestialcrystal>.anyDamage(), <astralsorcery:itemcelestialcrystal>.anyDamage(), <astralsorcery:itemcelestialcrystal>.anyDamage(), <astralsorcery:itemcelestialcrystal>.anyDamage(), 
			<minecraft:nether_star>],
	"astralsorcery.constellation.mineralis");

# Draconium Seeds
	recipes.remove(<mysticalagriculture:draconium_seeds>);
	mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/draconium_seeds",
	<mysticalagriculture:draconium_seeds>, 3500, 300, 
	[<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	<ore:blockSupremiumEssence>, <mysticalagriculture:crafting:21>, <ore:blockSupremiumEssence>, 
	<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,

	<ore:blockDraconium>, <ore:blockDraconium>, <ore:blockDraconium>, <ore:blockDraconium>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:blockDraconium>, <ore:blockDraconium>, <ore:blockDraconium>, <ore:blockDraconium>, 
			<minecraft:nether_star>],
	"astralsorcery.constellation.mineralis");

# Emerald Seeds
	recipes.remove(<mysticalagriculture:emerald_seeds>);
	mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/emerald_seeds",
	<mysticalagriculture:emerald_seeds>, 3500, 300, 
	[<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	<ore:blockSupremiumEssence>, <mysticalagriculture:crafting:21>, <ore:blockSupremiumEssence>, 
	<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	
	<ore:blockEmerald>, <ore:blockEmerald>, <ore:blockEmerald>, <ore:blockEmerald>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:blockEmerald>, <ore:blockEmerald>, <ore:blockEmerald>, <ore:blockEmerald>, 
			<minecraft:nether_star>],
	"astralsorcery.constellation.mineralis");
	
# Neutronium Seeds
	recipes.remove(<mysticalagradditions:neutronium_seeds>);
	mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/neutronium_seeds",
	<mysticalagradditions:neutronium_seeds>, 3500, 300, 
	[<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	<ore:blockSupremiumEssence>, <mysticalagriculture:crafting:21>, <ore:blockSupremiumEssence>, 
	<ore:essenceTier4>, <ore:blockSupremiumEssence>, <ore:essenceTier4>,
	
	<ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>, <ore:ingotSupremium>,
	<ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, 
			<minecraft:nether_star>],
	"astralsorcery.constellation.mineralis");
	
var itemsToRemoveAndHide as IItemStack[] = [
	<mysticalagriculture:chunk>,
	<mysticalagriculture:chunk:1>,
	<mysticalagriculture:chunk:2>,
	<mysticalagriculture:chunk:3>,
	<mysticalagriculture:chunk:4>,
	<mysticalagradditions:insanium:4>,
	<mysticalagriculture:nether_prosperity_ore>,
	<mysticalagriculture:end_prosperity_ore>,
	<mysticalagriculture:inferium_ore>,
	<mysticalagriculture:nether_inferium_ore>,
	<mysticalagriculture:end_inferium_ore>
];

for item in itemsToRemoveAndHide {
	mods.jei.JEI.removeAndHide(item);
}

# *======= Unification =======*

# Sulfur Essence to Dust
  recipes.removeByRecipeName("mysticalagriculture:dustsulfur");
  recipes.addShapeless("Mystical Agriculture Sulfur", <thermalfoundation:material:771> * 8, [<mysticalagriculture:sulfur_essence>,<mysticalagriculture:sulfur_essence>,<mysticalagriculture:sulfur_essence>]);

# Uranium Essence to Ingot
  recipes.removeByRecipeName("mysticalagriculture:ingoturanium");
  recipes.addShaped("Mystical Agriculture Uranium", <immersiveengineering:metal:5> * 3, [[<mysticalagriculture:uranium_essence>,<mysticalagriculture:uranium_essence>,<mysticalagriculture:uranium_essence>],[<mysticalagriculture:uranium_essence>,null,<mysticalagriculture:uranium_essence>],[<mysticalagriculture:uranium_essence>,<mysticalagriculture:uranium_essence>,<mysticalagriculture:uranium_essence>]]);
	
# Changed Amber Essence to the more sensible amber
  recipes.removeByRecipeName("mysticalagriculture:gemamber");
  recipes.addShaped("Mystical Agriculture Amber", <thaumcraft:amber> * 6, [[<mysticalagriculture:amber_essence>,<mysticalagriculture:amber_essence>,<mysticalagriculture:amber_essence>],[<mysticalagriculture:amber_essence>,null,<mysticalagriculture:amber_essence>],[<mysticalagriculture:amber_essence>,<mysticalagriculture:amber_essence>,<mysticalagriculture:amber_essence>]]);


# Recycling can
scripts.process.recycleMetal(<mysticalagriculture:watering_can>,   <mysticalagriculture:crafting:33> * 4, <liquid:inferium> * (144*4), null);
scripts.process.recycleMetal(<mysticalagriculture:watering_can:1>, <mysticalagriculture:crafting:34> * 4, <liquid:prudentium> * (144*4), null);
scripts.process.recycleMetal(<mysticalagriculture:watering_can:2>, <mysticalagriculture:crafting:35> * 4, <liquid:intermedium> * (144*4), null);
scripts.process.recycleMetal(<mysticalagriculture:watering_can:3>, <mysticalagriculture:crafting:36> * 4, <liquid:superium> * (144*4), null);
scripts.process.recycleMetal(<mysticalagriculture:watering_can:4>, <mysticalagriculture:crafting:37> * 4, <liquid:supremium> * (144*4), null);


# Missed 4 types of dyes from [Dye Essence]
val dyeEssence = {x: <mysticalagriculture:dye_essence>} as IIngredient[string];
craft.make(<biomesoplenty:green_dye> * 4, ["pretty",
	"x    ",
	"  x  ",
	"x    "], dyeEssence);
craft.make(<biomesoplenty:brown_dye> * 4, ["pretty",
	"  x  ",
	"    x",
	"  x  "], dyeEssence);
craft.make(<biomesoplenty:blue_dye> * 4, ["pretty",
	"    x",
	"  x  ",
	"    x"], dyeEssence);
craft.make(<biomesoplenty:white_dye> * 4, ["pretty",
	"  x  ",
	"x    ",
	"  x  "], dyeEssence);

# Squeeze cow essence
scripts.process.squeeze([<mysticalagriculture:cow_essence>], <liquid:milk> * 250, "no exceptions", null);

# Squeeze water essence
scripts.process.squeeze([<mysticalagriculture:water_essence>], <liquid:water> * 250, "no exceptions", null);

# Saplings from essence
# ----------------------------

static groups as int[][IIngredient][string] = {
	biomesoplenty: {<biomesoplenty:biome_essence>: [0,1,2,3]},
	tconstruct   : {<ore:slimeball>: [0,1,2,3]},
	other        : {<mysticalagriculture:nature_essence>: [0,1,2,3]},
} as int[][IIngredient][string];

for sap in <ore:treeSapling>.items {
	if(sap.damage == 32767)
    for sap0 in sap.definition.subItems {
			handleSapling(sap0);
		}
	else
		handleSapling(sap);
}

static counter as int[] = [0] as int[];

function handleSapling(sap as IItemStack) as void {
	val owner = sap.definition.owner;

	if(owner == "biomesoplenty") {
		if(sap.matches(<biomesoplenty:sapling_1:7>)) return;
		addSaplingsRecipe(sap * 10, groups.biomesoplenty);
	} else

	if (owner == "tconstruct") {
		addSaplingsRecipe(sap * 6, groups.tconstruct);
	} else

	if (!owner.matches("minecraft|harvestcraft|twilightforest|randomthings|forestry|advancedrocketry|integrateddynamics")) {
		addSaplingsRecipe(sap * 6, groups.other);
	}
}

function shiftGroup(a as int[], n as int) as void {
	a[n] = a[n] + 1;
	if(a[n] > 5 + n) {
		if(n == 0) {
			a[0] = 0;
			return;
		}
		shiftGroup(a, n - 1);
		a[n] = a[n - 1] + 1;
	}
}


static defGroup as IIngredient[] = [
	<mysticalagriculture:nature_essence>,
	<mysticalagriculture:nature_essence>,
	<mysticalagriculture:wood_essence>,
	<mysticalagriculture:wood_essence>,
] as IIngredient[];


function getIngredients(group as int[][IIngredient]) as IIngredient[][] {
	val map = [
		[null, null, null],
		[null, null, null],
		[null, null, null]
	] as IIngredient[][];

	for i0, arr in group {
		for i, pos in arr {
			val x as int = pos % 3;
			val y = (pos / 3) as int;
			map[y][x] = i==0 ? i0 : defGroup[i];
		}

		shiftGroup(arr, 3);
	}
	return map;
}

function addSaplingsRecipe(sap as IItemStack, group as int[][IIngredient]) {
	recipes.addShaped(sap.definition.owner~" sapling #"~counter[0], sap, getIngredients(group));
	counter[0] = counter[0] + 1;
}

# ----------------------------

# [Fertilized Essence] from [Phyto-Gro]*2[+4]
craft.reshapeless(<mysticalagriculture:fertilized_essence>, "rF*ef", {
  "*": <mysticalagriculture:infusion_crystal>.anyDamage() | <mysticalagriculture:master_infusion_crystal>, # Infusion Crystal
  "r": <actuallyadditions:item_fertilizer>, # Fertilizer
  "F": <ic2:crop_res:2>,                    # Fertilizer
  "e": <forestry:fertilizer_compound>,      # Fertilizer
  "f": <thermalfoundation:fertilizer>,      # Phyto-Gro
});

# Better enderpearl recipe
recipes.removeByRecipeName("mysticalagriculture:ender_pearl");
craft.shapeless(<minecraft:ender_pearl> * 6, "AAA", {A: <mysticalagriculture:enderman_essence>});
