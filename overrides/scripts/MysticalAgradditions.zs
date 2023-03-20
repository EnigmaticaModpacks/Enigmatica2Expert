import mods.jei.JEI.removeAndHide as rh;
#modloaded mysticalagradditions


# *======= Seeds Tier 6 =======*

# Insanium Ingot
	recipes.remove(<mysticalagradditions:insanium:2>);
	recipes.addShaped("Insanium Ingot", 
	<mysticalagradditions:insanium:2>, 
	[[null, <ore:essenceInsanium>, null],
	[<ore:essenceInsanium>, <ore:ingotSupremium>, <ore:essenceInsanium>], 
	[null, <ore:essenceInsanium>, null]]);

# Tier 6 Crafting Seeds 
	recipes.remove(<mysticalagradditions:insanium:1>);
	mods.forestry.Carpenter.addRecipe(<mysticalagradditions:insanium:1>, 
	[[<ore:listAllseed>,<mysticalagradditions:insanium>,<ore:listAllseed>],
	[<mysticalagradditions:insanium>,<mysticalagriculture:crafting:21>,<mysticalagradditions:insanium>],
	[<ore:listAllseed>,<mysticalagradditions:insanium>,<ore:listAllseed>]], 40, <liquid:sewage> * 1000);

# Inferium Seeds
	recipes.remove(<mysticalagradditions:tier6_inferium_seeds>);
	mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/tier6_inferium_seeds",
		<mysticalagradditions:tier6_inferium_seeds>, 3500, 600, [
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:blockInsaniumEssence>, <mysticalagradditions:insanium:1>, <ore:blockInsaniumEssence>,
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>,
            <ore:blockSupremiumEssence>, <ore:blockSupremiumEssence>,
            <astralsorcery:itemcoloredlens:2>, <astralsorcery:itemcoloredlens:2>,
            <botania:prism>, <botania:prism>,
            <ore:blockSupremiumEssence>, <ore:blockSupremiumEssence>,
			<ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, 
			<minecraft:nether_star>],
			"astralsorcery.constellation.aevitas");
			
# Awakended Draconium Seeds
	recipes.remove(<mysticalagradditions:awakened_draconium_seeds>);
		mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/awakended_draconium_seeds",
		<mysticalagradditions:awakened_draconium_seeds>, 3500, 600, [
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:blockInsaniumEssence>, <mysticalagradditions:insanium:1>, <ore:blockInsaniumEssence>,
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>,
            <ore:blockDraconiumAwakened>, <ore:blockDraconiumAwakened>,
            <astralsorcery:itemcoloredlens:2>, <astralsorcery:itemcoloredlens:2>,
            <draconicevolution:wyvern_energy_core>, <draconicevolution:wyvern_energy_core>,
            <ore:blockDraconiumAwakened>, <ore:blockDraconiumAwakened>,
			<ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, 
			<ore:blockNetherStar>],
			"astralsorcery.constellation.mineralis");
			
# Nether Star Seeds
	recipes.remove(<mysticalagradditions:nether_star_seeds>);
	mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/nether_star_seeds",
		<mysticalagradditions:nether_star_seeds>, 3500, 600, [
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:blockInsaniumEssence>, <mysticalagradditions:insanium:1>, <ore:blockInsaniumEssence>,
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>,
            <ore:blockNetherStar>, <ore:blockNetherStar>,
            <astralsorcery:itemcoloredlens:2>, <astralsorcery:itemcoloredlens:2>,
            <ore:ingotCrystaltine>, <ore:ingotCrystaltine>,
            <ore:blockNetherStar>, <ore:blockNetherStar>,
			<ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, 
			<ore:blockNetherStar>],
			"astralsorcery.constellation.aevitas");
			
# Ender_Amethyst_Seeds
	recipes.remove(<mysticalagriculture:ender_amethyst_seeds>);
	mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/ender_amethyst_seeds",
		<mysticalagriculture:ender_amethyst_seeds>, 3500, 600, [
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:blockInsaniumEssence>, <mysticalagradditions:insanium:1>, <ore:blockInsaniumEssence>,
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>,
            <biomesoplenty:gem_block>, <biomesoplenty:gem_block>,
            <astralsorcery:itemcoloredlens:2>, <astralsorcery:itemcoloredlens:2>,
            <ore:ingotCrystaltine>, <ore:ingotCrystaltine>,
            <biomesoplenty:gem_block>, <biomesoplenty:gem_block>,
			<ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, 
			<minecraft:nether_star>],
			"astralsorcery.constellation.aevitas");
			
# Iridium Seeds
	recipes.remove(<mysticalagriculture:iridium_seeds>);
		mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/iridium_seeds",
		<mysticalagriculture:iridium_seeds>, 3500, 600, [
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:blockInsaniumEssence>, <mysticalagradditions:insanium:1>, <ore:blockInsaniumEssence>,
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>,
            <ore:blockIridium>, <ore:blockIridium>,
            <astralsorcery:itemcoloredlens:2>, <astralsorcery:itemcoloredlens:2>,
            <ore:ingotCrystaltine>, <ore:ingotCrystaltine>,
            <ore:blockIridium>, <ore:blockIridium>,
			<ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, 
			<minecraft:nether_star>],
			"astralsorcery.constellation.mineralis");
			
# Enderium Seeds
	recipes.remove(<mysticalagriculture:enderium_seeds>);
	mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/enderium_seeds",
		<mysticalagriculture:enderium_seeds>, 3500, 600, [
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:blockInsaniumEssence>, <mysticalagradditions:insanium:1>, <ore:blockInsaniumEssence>,
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>,
            <ore:blockEnderium>, <ore:blockEnderium>,
            <astralsorcery:itemcoloredlens:2>, <astralsorcery:itemcoloredlens:2>,
            <ore:ingotCrystaltine>, <ore:ingotCrystaltine>,
            <ore:blockEnderium>, <ore:blockEnderium>,
			<ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, 
			<minecraft:nether_star>],
			"astralsorcery.constellation.mineralis");
			
# Terrasteel Seeds
	recipes.remove(<mysticalagriculture:terrasteel_seeds>);
	mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/terrasteel_seeds",
		<mysticalagriculture:terrasteel_seeds>, 3500, 600, [
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:blockInsaniumEssence>, <mysticalagradditions:insanium:1>, <ore:blockInsaniumEssence>,
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:ingotCrystaltine>, <ore:ingotCrystaltine>, <ore:ingotInsanium>, <ore:ingotInsanium>,
            <botania:storage:1>, <botania:storage:1>,
            <botania:laputashard>, <botania:laputashard>,
            <botania:prism>, <botania:prism>,
            <botania:storage:1>, <botania:storage:1>,
			<ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, 
			<minecraft:nether_star>],
			"astralsorcery.constellation.mineralis");
	
# Dragon Egg Seeds	
	recipes.remove(<mysticalagradditions:dragon_egg_seeds>);
	mods.astralsorcery.Altar.addTraitAltarRecipe("enigmatica2expert:shaped/internal/altar/dragon_egg_seeds",
		<mysticalagradditions:dragon_egg_seeds>, 3500, 600, [
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:blockInsaniumEssence>, <mysticalagradditions:insanium:1>, <ore:blockInsaniumEssence>,
            <ore:essenceTier5>, <ore:blockInsaniumEssence>, <ore:essenceTier5>,
            <ore:ingotCrystaltine>, <ore:ingotCrystaltine>, <ore:ingotInsanium>, <ore:ingotInsanium>,
            <mysticalagradditions:stuff:3>, <mysticalagradditions:stuff:3>,
            <mysticalagradditions:stuff:3>, <mysticalagradditions:stuff:3>,
            <mysticalagradditions:stuff:3>, <mysticalagradditions:stuff:3>,
            <mysticalagradditions:stuff:3>, <mysticalagradditions:stuff:3>,
			<ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, <ore:ingotInsanium>, 
			<ore:blockNetherStar>],
			"astralsorcery.constellation.aevitas");
				
	