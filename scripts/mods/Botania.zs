import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IIngredient as IIngredient;
#modloaded botania
	
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
	recipes.addShapeless("Botania ring 6", <botania:magnetring>, [<botania:lens:10>, <thaumcraft:baubles:5>, <astralsorcery:itemcoloredlens:5>]);
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

# Remove unused ORE
mods.botania.Orechid.removeOre("oreYellorite");

# Add missed ORE
mods.botania.Orechid.addOre("oreThorium", 1285);
mods.botania.Orechid.addOre("oreMagnesium", 1285);
mods.botania.Orechid.addOre("oreLithium", 1285);
mods.botania.Orechid.addOre("oreBoron", 1285);
mods.botania.Orechid.addOre("oreProsperity", 900);

function remakeRune(rune as IItemStack, ingrList as IIngredient[], mana as int) {
	mods.botania.RuneAltar.removeRecipe(rune * 1);
	mods.botania.RuneAltar.addRecipe(rune, ingrList, mana);
}

/* Water */   remakeRune(<botania:rune:0>*2, [<botania:manaresource:23>, <botania:manaresource>, <ore:foodBassraw>, <ore:dustBlizz>, <minecraft:reeds>, <ore:gemAquamarine>], 5000);
/* Fire */    remakeRune(<botania:rune:1>*2, [<botania:manaresource:23>, <botania:manaresource>, <harvestcraft:blazingsoupitem>, <ore:dustBlaze>, <ore:slimeballMagma>, <minecraft:lava_bucket>], 5000);
/* Earth */   remakeRune(<botania:rune:2>*2, [<botania:manaresource:23>, <botania:manaresource>, <ore:blockCoal>, <ore:dustBasalz>, <minecraft:mushroom_stew>, <extrautils2:compresseddirt>], 5000);
/* Air */     remakeRune(<botania:rune:3>*2, [<botania:manaresource:23>, <botania:manaresource>, <minecraft:wool:3>, <ore:dustBlitz>, <ore:feather>, <ore:dragonscales>], 5000);
/* Spring */  remakeRune(<botania:rune:4>,   [<botania:rune>, <botania:rune:1>, <minecraft:red_flower:1>, <minecraft:red_flower:2>, <quark:variant_sapling:1>, <minecraft:pumpkin_pie>], 10000);
/* Summer */  remakeRune(<botania:rune:5>,   [<botania:rune:2>, <botania:rune:3>, <minecraft:sandstone:*>, <tconstruct:slime_congealed:*>, <minecraft:speckled_melon>, <ore:listAllicecream>], 10000);
/* Autumn */  remakeRune(<botania:rune:6>,   [<botania:rune:1>, <botania:rune:3>, <botania:biomestonea:6>, <botania:biomestonea:3>, <botania:biomestonea>, <minecraft:fermented_spider_eye>], 10000);
/* Winter */  remakeRune(<botania:rune:7>,   [<botania:rune>, <botania:rune:2>, <minecraft:snow>, <minecraft:packed_ice>, <botania:manaresource:22>, <ore:foodCake>], 10000);
/* Mana */    remakeRune(<botania:rune:8>,   [<ore:manaDiamond>, <ore:manaDiamond>, <ore:quartzMana>, <ore:ingotMithril>, <botania:manaresource:22>, <botania:manaresource:1>], 20000);
/* Lust */    remakeRune(<botania:rune:9>,   [<ore:manaDiamond>, <ore:manaDiamond>, <botania:rune:5>, <botania:rune:5>, <botania:rune:3>, <botania:rune:3>], 25000);
/* Gluttony */remakeRune(<botania:rune:10>,  [<ore:manaDiamond>, <ore:manaDiamond>, <botania:rune:7>, <botania:rune:7>, <botania:rune:1>, <botania:rune:1>], 25000);
/* Greed */   remakeRune(<botania:rune:11>,  [<ore:manaDiamond>, <ore:manaDiamond>, <botania:rune:4>, <botania:rune:4>, <botania:rune>, <botania:rune>], 25000);
/* Sloth */   remakeRune(<botania:rune:12>,  [<ore:manaDiamond>, <ore:manaDiamond>, <botania:rune:6>, <botania:rune:6>, <botania:rune:3>, <botania:rune:3>], 25000);
/* Wrath */   remakeRune(<botania:rune:13>,  [<ore:manaDiamond>, <ore:manaDiamond>, <botania:rune:7>, <botania:rune:7>, <botania:rune:2>, <botania:rune:2>], 25000);
/* Envy */    remakeRune(<botania:rune:14>,  [<ore:manaDiamond>, <ore:manaDiamond>, <botania:rune:7>, <botania:rune:7>, <botania:rune>, <botania:rune>], 25000);
/* Pride */   remakeRune(<botania:rune:15>,  [<ore:manaDiamond>, <ore:manaDiamond>, <botania:rune:5>, <botania:rune:5>, <botania:rune:1>, <botania:rune:1>], 25000);


#----- Sapling Cycling -----#

# Remove vanilla loop
mods.botania.ManaInfusion.removeRecipe(<minecraft:sapling>);

# Add modded in loop
var saplings = [
	<minecraft:sapling:5>,
	<ic2:sapling>,
	<integrateddynamics:menril_sapling>,
	<quark:variant_sapling>,
	<quark:variant_sapling:1>,
	<rustic:sapling>,
	<rustic:sapling:1>,
	<rustic:sapling_apple>,
	<thaumcraft:sapling_greatwood>,
	<thaumcraft:sapling_silverwood>,
	<minecraft:sapling>,
] as IItemStack[];
for i, sapling in saplings {
	if (i != 0) {
		mods.botania.ManaInfusion.addAlchemy(saplings[i], saplings[i - 1], 120);
	}
}

/* Patchouli_js()
var petuniaPage = {
  category: "Knowledge",
  subcategory: "Liquids",
  title: "Petro Petunia Fuels",
  entry: "Petro Petunia",
  type: "item_list",
  item: `botania:specialflower{type: "petro_petunia"}`
}

Patchouli_js({
  ...petuniaPage,
  type: "spotlight",
  _text: `$(l)Petro Petunia/$ is generating flower that burns liquids around it to provide $(#1df)mana/$.`
})

Patchouli_js( paged(petuniaPage, 7, 
  [...Object.entries( config("acronym/floralchemy.cfg").fuelvalues )]
  .sort((a,b)=>b[1].burnTime * b[1].powerPreTick - a[1].burnTime * a[1].powerPreTick)
  .map(o=>( [
    wrap_bucket(o[0]), `${o[1].burnTime} ticks, ${o[1].powerPreTick} mana/tick`
  ] ))
))*/