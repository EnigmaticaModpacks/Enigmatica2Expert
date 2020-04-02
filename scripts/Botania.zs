import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IIngredient as IIngredient;
#modloaded botania
print("--- loading Botania.zs ---");
	
# Mana Pool
	recipes.remove(<botania:pool>);
	recipes.addShapedMirrored("Mana Pool", 
	<botania:pool>, 
	[[<botania:petalblock:8>, <astralsorcery:itemrockcrystalsimple>.anyDamage(), <botania:petalblock>],
	[<ore:livingrock>, null, <ore:livingrock>], 
	[<ore:livingrock>, <botania:pool:2>, <ore:livingrock>]]);

# Diluted Mana Pool
	recipes.remove(<botania:pool:2>);
	recipes.addShapedMirrored("Diluted Mana Pool", 
	<botania:pool:2>, 
	[[<ore:dyeLightBlue>, <ore:dyeLightBlue>, <ore:dyeLightBlue>],
	[<ore:livingrock>, null, <ore:livingrock>], 
	[<ore:livingrock>, <ore:livingrock>, <ore:livingrock>]]);

# Mana Spreaders
	# Normal
	recipes.remove(<botania:spreader>);
	recipes.addShapedMirrored("Mana Spreader", 
	<botania:spreader>, 
	[[<botania:livingwood:5>, <ore:livingwood>, <ore:livingwood>],
	[<astralsorcery:itemusabledust>, <botania:petalblock:5>, <ore:livingwood>], 
	[<botania:livingwood:5>, <ore:livingwood>, <ore:livingwood>]]);

	# Elven
	recipes.remove(<botania:spreader:2>);
	recipes.addShapedMirrored("Elven Mana Spreader", 
	<botania:spreader:2>, 
	[[<ore:dreamwood>, <ore:dreamwood>, <ore:dreamwood>],
	[<ore:dustAstralStarmetal>, <botania:spreader>, <tconstruct:tough_tool_rod>.withTag({Material: "elementium"})], 
	[<ore:dreamwood>, <ore:dreamwood>, <ore:dreamwood>]]);

	# Gaia
	recipes.remove(<botania:spreader:3>);
	recipes.addShapedMirrored("Gaia Mana Spreader", 
	<botania:spreader:3>, 
	[[<botania:bifrostperm>, <botania:bifrostperm>, <botania:bifrostperm>],
	[<ore:eternalLifeEssence>, <botania:spreader:2>, <astralsorcery:itemcoloredlens>.anyDamage()],
	[<botania:bifrostperm>, <botania:bifrostperm>, <botania:bifrostperm>]]);

# Gaia Spirit Duplication
	mods.bloodmagic.AlchemyTable.addRecipe(<botania:manaresource:5> * 4, 
	[<botania:manaresource:5>, <bloodmagic:item_demon_crystal:1>, <bloodmagic:item_demon_crystal:2>, 
	<bloodmagic:item_demon_crystal:3>, <bloodmagic:item_demon_crystal:4>, <bloodmagic:points_upgrade>], 100000, 300, 4);

# Shh, intended for later
	function runicAltarRecipeMaker(output as IItemStack, input as IIngredient[], tier as int) { 
		# Tier 1 runes
		var mana = 4000;
		if (tier == 2) {
		# Tier 2 runes
			mana = 8000;
		} else if (tier == 3) {
		# Tier 3 runes
			mana = 12000;
		} else if (tier >= 5) {
		# Turning tier into mana
			mana = tier;
		}
		mods.botania.RuneAltar.removeRecipe(output);
		mods.botania.RuneAltar.addRecipe(output, input, mana);
	}

# Livingrock
	mods.botania.PureDaisy.addRecipe(<thaumcraft:stone_arcane>, <botania:livingrock>);
	mods.botania.PureDaisy.removeRecipe(<botania:livingrock>);

# Livingwood
	mods.botania.PureDaisy.addRecipe(<astralsorcery:blockinfusedwood>, <botania:livingwood>);
	mods.botania.PureDaisy.removeRecipe(<botania:livingwood>);

# Gaia Ingot
	recipes.remove(<botania:manaresource:14>);
	recipes.addShapedMirrored("Gaia Ingot", 
	<botania:manaresource:14>, 
	[[<ore:dustMana>, <ore:eternalLifeEssence>, <ore:dustMana>],
	[<ore:eternalLifeEssence>, <ore:ingotTerrasteel>, <ore:eternalLifeEssence>], 
	[<ore:ingotMithril>, <ore:eternalLifeEssence>, <ore:ingotMithril>]]);

# Gaia Pylon
	recipes.remove(<botania:pylon:2>);
	recipes.addShapedMirrored("Gaia Pylon", 
	<botania:pylon:2>, 
	[[<ore:dustMana>, <ore:elvenPixieDust>, <ore:dustMana>],
	[<ore:ingotElvenElementium>, <botania:pylon>, <ore:ingotElvenElementium>], 
	[<ore:dustMana>, <ore:elvenPixieDust>, <ore:dustMana>]]);

# Elven Gateway Core
	recipes.remove(<botania:alfheimportal>);
	mods.astralsorcery.Altar.addConstellationAltarRecipe("enigmatica2expert:shaped/internal/altar/elven_gateway_core",
		<botania:alfheimportal>, 2800, 300, [
            <ore:livingwood>, <botania:livingwood:5>, <ore:livingwood>,
            <botania:livingwood:5>, <botania:petalblock:5>, <botania:livingwood:5>,
            <ore:livingwood>, <botania:livingwood:5>, <ore:livingwood>,
            <ore:nuggetTerrasteel>, <ore:nuggetTerrasteel>, <ore:nuggetTerrasteel>, <ore:nuggetTerrasteel>,
            <astralsorcery:blockmarble:6>, <astralsorcery:blockmarble:6>,
            <ore:ingotAstralStarmetal>, <ore:ingotAstralStarmetal>,
            <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>,
            <astralsorcery:blockmarble:6>, <astralsorcery:blockmarble:6>]);

# Petal Apothecary
	recipes.remove(<botania:altar>);
	mods.astralsorcery.Altar.addDiscoveryAltarRecipe("enigmatica2expert:shaped/internal/altar/petal_apothecary",
	<botania:altar>, 200, 450, 
	[<minecraft:stone_slab:3>, <botania:petal>, <minecraft:stone_slab:3>,
    null, <ore:cobblestone>, null,
    <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>]);
	
# Runic Altar
	recipes.remove(<botania:runealtar>);
	mods.astralsorcery.Altar.addDiscoveryAltarRecipe("enigmatica2expert:shaped/internal/altar/runic_altar1",
	<botania:runealtar>, 200, 800, 
	[null, <astralsorcery:itemrockcrystalsimple>.anyDamage(), null,
    <botania:livingrock>, <botania:manaresource:1>, <botania:livingrock>,
    <botania:livingrock>, <botania:livingrock>, <botania:livingrock>]);
	
	mods.astralsorcery.Altar.addDiscoveryAltarRecipe("enigmatica2expert:shaped/internal/altar/runic_altar2",
	<botania:runealtar>, 200, 800, 
	[null, <astralsorcery:itemrockcrystalsimple>.anyDamage(), null,
    <botania:livingrock>, <botania:manaresource:2>, <botania:livingrock>,
    <botania:livingrock>, <botania:livingrock>, <botania:livingrock>]);

# Removing double flower recipes
	recipes.remove(<botania:petal:*> * 4, <botania:doubleflower1:*>);
	recipes.remove(<botania:petal:*> * 4, <botania:doubleflower2:*>);
	
# Super travel belt
	recipes.remove(<botania:supertravelbelt>);
	recipes.addShaped("Botania Globetrotter's Sash", 
	<botania:supertravelbelt>, 
	[[null, <botania:manaresource:14>, null], 
	[<botania:manaresource:7>, <botania:travelbelt>, <botania:manaresource:7>], 
	[null, <thaumcraft:baubles:6>, null]]);

# Knockback belt
	recipes.remove(<botania:knockbackbelt>);
	recipes.addShaped("Botania Knockback belt",<botania:knockbackbelt>, 
	[[null, <ore:ingotManasteel>, null], 
	[<ore:runeEarthB>, <thaumcraft:baubles:2>, <ore:runeFireB>],
	[null, null, null]]);

# travel belt
	recipes.remove(<botania:travelbelt>);
	recipes.addShaped("Botania travel belt", 
	<botania:travelbelt>, 
	[[null, <ore:ingotManasteel>, null], 
	[<ore:runeEarthB>, <thaumcraft:baubles:2>, <ore:runeAirB>],
	[null, null, null]]);

# rings
	recipes.remove(<botania:swapring>);
	recipes.remove(<botania:manaring>);
	recipes.remove(<botania:pixiering>);
	recipes.remove(<botania:reachring>);
	recipes.remove(<botania:dodgering>);
	recipes.remove(<botania:magnetring>);
	recipes.remove(<botania:miningring>);
	recipes.remove(<botania:waterring>);
	recipes.remove(<botania:auraring>);

	recipes.addShapeless("Botania ring 1", <botania:swapring>, [<minecraft:clay>, <thaumcraft:baubles:5>]);
	recipes.addShapeless("Botania ring 2", <botania:manaring>, [<botania:manatablet>, <thaumcraft:baubles:5>]);
	recipes.addShapeless("Botania ring 3", <botania:pixiering>, [<botania:manaresource:8>, <thaumcraft:baubles:5>, <botania:manaresource:7>]);
	recipes.addShapeless("Botania ring 4", <botania:reachring>, [<botania:rune:15>, <thaumcraft:baubles:5>, <botania:manaresource:7>]);
	recipes.addShapeless("Botania ring 5", <botania:dodgering>, [<botania:rune:3>, <thaumcraft:baubles:5>, <minecraft:emerald>]);
	recipes.addShapeless("Botania ring 6", <botania:magnetring>, [<botania:lens:10>, <thaumcraft:baubles:5>]);
	recipes.addShapeless("Botania ring 7", <botania:miningring>, [<botania:rune:2>, <thaumcraft:baubles:5>, <minecraft:golden_pickaxe>]);
	recipes.addShapeless("Botania ring 8", <botania:waterring>, [<botania:rune>, <thaumcraft:baubles:5>, <minecraft:fish:1>, <minecraft:fish:3>]);
	recipes.addShapeless("Botania ring 9", <botania:auraring>, [<botania:rune:8>, <thaumcraft:baubles:5>]);
	
# Mystical Flower Petal Duplication
	recipes.addShapeless("Petal Duplication0", <botania:petal> * 4, [<botania:petal>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);
	recipes.addShapeless("Petal Duplication1", <botania:petal:1> * 4, [<botania:petal:1>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);
	recipes.addShapeless("Petal Duplication2", <botania:petal:2> * 4, [<botania:petal:2>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);
	recipes.addShapeless("Petal Duplication3", <botania:petal:3> * 4, [<botania:petal:3>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);
	recipes.addShapeless("Petal Duplication4", <botania:petal:4> * 4, [<botania:petal:4>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);
	recipes.addShapeless("Petal Duplication5", <botania:petal:5> * 4, [<botania:petal:5>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);
	recipes.addShapeless("Petal Duplication6", <botania:petal:6> * 4, [<botania:petal:6>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);
	recipes.addShapeless("Petal Duplication7", <botania:petal:7> * 4, [<botania:petal:7>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);
	recipes.addShapeless("Petal Duplication8", <botania:petal:8> * 4, [<botania:petal:8>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);
	recipes.addShapeless("Petal Duplication9", <botania:petal:9> * 4, [<botania:petal:9>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);
	recipes.addShapeless("Petal Duplication10", <botania:petal:10> * 4, [<botania:petal:10>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);
	recipes.addShapeless("Petal Duplication11", <botania:petal:11> * 4, [<botania:petal:11>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);
	recipes.addShapeless("Petal Duplication12", <botania:petal:12> * 4, [<botania:petal:12>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);
	recipes.addShapeless("Petal Duplication13", <botania:petal:13> * 4, [<botania:petal:13>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);
	recipes.addShapeless("Petal Duplication14", <botania:petal:14> * 4, [<botania:petal:14>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);
	recipes.addShapeless("Petal Duplication15", <botania:petal:15> * 4, [<botania:petal:15>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>, <ore:fertilizer>]);

	
## *======= Mana Infusion =======*
//mods.botania.ManaInfusion.addInfusion(IItemStack output, IIngredient input, int mana);
#mods.botania.ManaInfusion.addInfusion(<minecraft:grass>, <ore:stone>, 1000);

//mods.botania.ManaInfusion.addAlchemy(IItemStack output, IIngredient input, int mana);
#mods.botania.ManaInfusion.addAlchemy(<minecraft:gold_ore>, <ore:stone>, 5000);

//mods.botania.ManaInfusion.addConjuration(IItemStack output, IIngredient input, int mana);
#mods.botania.ManaInfusion.addConjuration(<minecraft:stone>, <minecraft:stone>, 1000);

## *======= Botanical Brewing =======*
	//InputArray, BrewString
	//mods.botania.Brew.addRecipe([<minecraft:nether_wart>, <minecraft:reeds>, <minecraft:redstone>], "speed");
	//BrewString
	//mods.botania.Brew.removeRecipe("absorption"); 

## *======= Elven Trade =======*
	//OutputArray, InputArray
	//mods.botania.ElvenTrade.addRecipe([<botania:flower:4>], [<minecraft:yellow_flower>]);
	//OutputArray
	//mods.botania.ElvenTrade.removeRecipe([<botania:dreamwood>]);

## *======= Orechid =======*
	//InputOredict, Weight
	//mods.botania.Orechid.addOre(<ore:logWood>, 5000);
	//InputOredict
	//mods.botania.Orechid.removeOre(<ore:oreIron>);

## *======= Petal Apothecary =======*
	//OutputStack, InputArray
	//mods.botania.Apothecary.addRecipe("bubbell", [<ore:petalCyan>, <ore:petalBlue>, <Botania:manaresource:6>, <Botania:manaresource:10> * 1]);
	//mods.botania.Apothecary.addRecipe(<minecraft:melon>, [<ore:petalLime>, <ore:petalRed>, <minecraft:wheat_seeds>]);
	//OutputStack OR String (String is for subtiled Botania Flowers)
	//mods.botania.Apothecary.removeRecipe("daybloom");

## *======= Pure Daisy =======*
	//InputBlock, OutputBlock
	//mods.botania.PureDaisy.addRecipe(<minecraft:emerald_block>, <minecraft:diamond_block>);
	//OutputBlock
	//mods.botania.PureDaisy.removeRecipe(<minecraft:obsidian>);

## *======= Rune Altar =======*
	//OutputStack, InputArray, ManaCost
	//mods.botania.RuneAltar.addRecipe(<minecraft:stonebrick:2>, [<minecraft:stonebrick>, <minecraft:gunpowder>], 5);
	//OutputStack
	//mods.botania.RuneAltar.removeRecipe(<botania:rune>);

	
	print("--- Botania.zs initialized ---");