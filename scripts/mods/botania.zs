import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
#modloaded botania


#----- Orechid progression -----#

# Remove unused ORE
mods.botania.Orechid.removeOre("oreTungsten");

# Remove orechid advanced ore (only leave basic ones)
mods.botania.Orechid.removeOre("oreCoal");
mods.botania.Orechid.removeOre("oreIron");
mods.botania.Orechid.removeOre("oreCopper");
mods.botania.Orechid.removeOre("oreLead");
mods.botania.Orechid.removeOre("oreTin");
mods.botania.Orechid.removeOre("oreOsmium");
mods.botania.Orechid.removeOre("oreSilver");
mods.botania.Orechid.removeOre("oreQuartzBlack");
mods.botania.Orechid.removeOre("oreAluminium");
mods.botania.Orechid.removeOre("oreAluminum");
mods.botania.Orechid.removeOre("oreGold");
mods.botania.Orechid.removeOre("oreNickel");
mods.botania.Orechid.removeOre("oreUranium");
mods.botania.Orechid.removeOre("oreDiamond");
mods.botania.Orechid.removeOre("oreTopaz");
mods.botania.Orechid.removeOre("oreMalachite");
mods.botania.Orechid.removeOre("oreTanzanite");
mods.botania.Orechid.removeOre("oreRuby");
mods.botania.Orechid.removeOre("orePeridot");
mods.botania.Orechid.removeOre("oreEmerald");
mods.botania.Orechid.removeOre("orePlatinum");
mods.botania.Orechid.removeOre("oreMithril");

# Buff Apatite
mods.botania.Orechid.removeOre("oreApatite");
mods.botania.Orechid.addOre("oreApatite", 15000);

# Add Orechid Ingem ores
mods.botania.OrechidIgnem.addOre("oreNetherChargedCertusQuartz", 800);


#-------------------------------#
# [Orechid] from [Mystical Red Petal][+7]
mods.botania.Apothecary.removeRecipe("excompressum.orechidEvolved");
mods.botania.Apothecary.addRecipe("excompressum.orechidEvolved", [
	<ore:petalGray>,       # Mystical Gray Petal
	<ore:petalYellow>,     # Mystical Yellow Petal
	<ore:petalGreen>,      # Mystical Green Petal
	<ore:petalRed>,        # Mystical Red Petal
	<ore:quicksilver>,     # Quicksilver
	<ore:redstoneRoot>,    # Redstone Root
	<ore:nuggetBrass>,     # Alchemical Brass Nugget
	<ore:nuggetManasteel>, # Manasteel Nugget
]);

# [Orechid Ignem] from [Rune of Autumn][+7]
mods.botania.Apothecary.removeRecipe("orechidIgnem");
mods.botania.Apothecary.addRecipe("orechidIgnem", [
	<ore:petalRed>,         # Mystical Red Petal
	<ore:petalWhite>,       # Mystical White Petal
	<ore:petalPink>,        # Mystical Pink Petal
	<ore:runeAutumnB>,      # Rune of Autumn
	<ore:runeManaB>,        # Rune of Mana
	<ore:redstoneRoot>,     # Redstone Root
	<ore:nuggetThaumium>,   # Thaumium Nugget
	<ore:nuggetTerrasteel>, # Terrasteel Nugget
]);

# [Orechid Vacuam] from [Rune of Pride][+7]
mods.botania.Apothecary.removeRecipe("orechidVacuam");
mods.botania.Apothecary.addRecipe("orechidVacuam", [
	<ore:petalYellow>,    # Mystical Yellow Petal
	<ore:petalPurple>,    # Mystical Purple Petal
	<ore:petalBlack>,     # Mystical Black Petal
	<ore:runePrideB>,     # Rune of Pride
	<ore:runeGreedB>,     # Rune of Greed
	<ore:redstoneRoot>,   # Redstone Root
	<ore:nuggetVoid>,     # Void Metal Nugget
	<ore:elvenPixieDust>, # Pixie Dust
]);
#-------------------------------#

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

# Peaceful alt
# [Gaia Spirit] from [Avatar of Ratlantis][+10]
mods.thaumcraft.Infusion.registerRecipe(
  "GaiaSpirit", # Name
  "INFUSION", # Research
  <botania:manaresource:5>, # Output
  10, # Instability
  [<aspect:caeles> * 100, <aspect:draco> * 100, <aspect:rattus> * 100],
  <rats:idol_of_ratlantis>, # Central Item
  Grid(["pretty",
  "S ◊ ╳",
  "▬   ▬",
  "* ◊ D"], {
  "S": <bloodmagic:item_demon_crystal:4>, # Steadfast Will Crystal
  "◊": <astralsorcery:itemperkgem:*>,     # Ourium Gem
  "╳": <bloodmagic:item_demon_crystal:1>, # Corrosive Will Crystal
  "▬": <ore:ingotMirion>,                 # Mirion Ingot
  "*": <bloodmagic:item_demon_crystal:3>, # Vengeful Will Crystal
  "D": <bloodmagic:item_demon_crystal:2>, # Destructive Will Crystal
}).spiral(1));

# Peaceful alt
# [Dice of Fate] from [Chaos Shard][+4]
mods.thaumcraft.Infusion.removeRecipe(<botania:dice>);
mods.thaumcraft.Infusion.registerRecipe(
  "dice", # Name
  "INFUSION", # Research
  <botania:dice>.withTag({soulbindUUID: "e23a4a76-82ed-47e0-9ea3-fef726675065"}), # Output
  10, # Instability
  [<aspect:caeles> * 160, <aspect:mana> * 160],
  <draconicevolution:chaos_shard>, # Central Item
  Grid(["pretty",
  "  D  ",
  "D   D",
  "  D  "], {
  "D": <cyclicmagic:dice>, # Dice
}).spiral(1));

# Livingrock
	mods.botania.PureDaisy.removeRecipe(<botania:livingrock>);
	mods.botania.PureDaisy.addRecipe(<thaumcraft:stone_arcane>, <botania:livingrock>);

# Livingwood
	mods.botania.PureDaisy.removeRecipe(<botania:livingwood>);
	mods.botania.PureDaisy.addRecipe(<astralsorcery:blockinfusedwood>, <botania:livingwood>);

# Obsidian cheaper
	mods.botania.PureDaisy.removeRecipe(<minecraft:obsidian>);
	mods.botania.PureDaisy.addRecipe(<tconstruct:firewood>, <minecraft:obsidian>);

# Gaia Ingot
	recipes.remove(<botania:manaresource:14>);
	recipes.addShapedMirrored("Gaia Ingot", 
	<botania:manaresource:14>, 
	[[<ore:dustMana>, <ore:eternalLifeEssence>, <ore:dustMana>],
	[<ore:eternalLifeEssence>, <ore:ingotTerrasteel>, <ore:eternalLifeEssence>], 
	[<ore:ingotManasteel>, <ore:eternalLifeEssence>, <ore:ingotManasteel>]]);

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
	recipes.addShapeless("Botania ring 6", <botania:magnetring>, [<botania:lens:10>, <thaumcraft:cloud_ring>, <astralsorcery:itemcoloredlens:5>, <jaopca:item_rockychunkastralstarmetal>]);
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

function remakeRune(rune as IItemStack, ingrList as IIngredient[], mana as int) {
	mods.botania.RuneAltar.removeRecipe(rune.anyAmount());
	mods.botania.RuneAltar.addRecipe(rune, ingrList, mana);
}

/* Water */   remakeRune(<botania:rune:0>*2, [<ore:dustBlizz>, <ore:fish>, <ore:gemAquamarine>, <ore:ingotManasteel>, <ore:powderMana>], 5000);
/* Fire */    remakeRune(<botania:rune:1>*2, [<ore:dustBlaze>, <ore:slimeballMagma>, <ore:gemAmber>, <ore:ingotManasteel>, <ore:powderMana>], 5000);
/* Earth */   remakeRune(<botania:rune:2>*2, [<ore:dustBasalz>, <ore:brickPeat>, <ore:podzol>, <ore:ingotManasteel>, <ore:powderMana>], 5000);
/* Air */     remakeRune(<botania:rune:3>*2, [<ore:dustBlitz>, <ore:boneDragon>, <ore:peacockFeathers>, <ore:ingotManasteel>, <ore:powderMana>], 5000);
/* Spring */  remakeRune(<botania:rune:4>,   [<ore:runeWaterB>, <ore:runeFireB>, <astralsorcery:blockinfusedwood>, <ore:flower>, <ore:nitor>], 10000);
/* Summer */  remakeRune(<botania:rune:5>,   [<ore:runeEarthB>, <ore:runeAirB>, <ore:treeSapling>, <ore:nuggetBrass>, <ore:livingwood>], 10000);
/* Autumn */  remakeRune(<botania:rune:6>,   [<ore:runeFireB>, <ore:runeAirB>, <ore:quicksilver>, <minecraft:deadbush>, <ore:stoneMetamorphic>], 10000);
/* Winter */  remakeRune(<botania:rune:7>,   [<ore:runeWaterB>, <ore:runeEarthB>, <mctsmelteryio:iceball>, <astralsorcery:itemusabledust>, <ore:blockSalt>], 10000);
/* Mana */    remakeRune(<botania:rune:8>,   [<ore:manaPearl>, <ore:powderMana>, <ore:quartzMana>, <ore:manaDiamond>, <ore:clothManaweave>], 20000);
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

# Dragon Bone conversion for rune recipes
mods.botania.ManaInfusion.addAlchemy(<iceandfire:dragonbone>, <ore:blockBone>, 420);

# Myrmex conversion
mods.botania.ManaInfusion.addAlchemy(<iceandfire:myrmex_desert_resin>, <iceandfire:myrmex_jungle_resin>, 120);
mods.botania.ManaInfusion.addAlchemy(<iceandfire:myrmex_jungle_resin>, <iceandfire:myrmex_desert_resin>, 120);

# Colored Glass -> Quark Cave Crystals
mods.botania.PureDaisy.addRecipe(<ore:blockGlassWhite>,  <quark:crystal>);
mods.botania.PureDaisy.addRecipe(<ore:blockGlassRed>,    <quark:crystal:1>);
mods.botania.PureDaisy.addRecipe(<ore:blockGlassOrange>, <quark:crystal:2>);
mods.botania.PureDaisy.addRecipe(<ore:blockGlassYellow>, <quark:crystal:3>);
mods.botania.PureDaisy.addRecipe(<ore:blockGlassLime>,   <quark:crystal:4>);
mods.botania.PureDaisy.addRecipe(<ore:blockGlassCyan>,   <quark:crystal:5>);
mods.botania.PureDaisy.addRecipe(<ore:blockGlassBlue>,   <quark:crystal:6>);
mods.botania.PureDaisy.addRecipe(<ore:blockGlassPurple>, <quark:crystal:7>);
mods.botania.PureDaisy.addRecipe(<ore:blockGlassBlack>,  <quark:crystal:8>);

# --------------------------
# Mana diamond from Rat Diamond recipe
mods.botania.ManaInfusion.addInfusion(<botania:manaresource:2>, <rats:rat_diamond>, 10000);

# Way cheaper tiny potato dupe
mods.botania.ManaInfusion.removeRecipe(<botania:tinypotato>);
mods.botania.ManaInfusion.addInfusion(<botania:tinypotato> * 640, <minecraft:potato>, 64);

# Make Crafty Crate tables free
mods.botania.ElvenTrade.removeRecipe(<botania_tweaks:basic_extended_crafty_crate>);
mods.botania.ElvenTrade.removeRecipe(<botania_tweaks:advanced_extended_crafty_crate>);
mods.botania.ElvenTrade.removeRecipe(<botania_tweaks:elite_extended_crafty_crate>);
mods.botania.ElvenTrade.removeRecipe(<botania_tweaks:ultimate_extended_crafty_crate>);
mods.botania.ElvenTrade.addRecipe([<botania_tweaks:basic_extended_crafty_crate>, <extendedcrafting:table_basic>], [<botania:opencrate:1>, <extendedcrafting:table_basic>]);
mods.botania.ElvenTrade.addRecipe([<botania_tweaks:advanced_extended_crafty_crate>, <extendedcrafting:table_advanced>], [<botania:opencrate:1>, <extendedcrafting:table_advanced>]);
mods.botania.ElvenTrade.addRecipe([<botania_tweaks:elite_extended_crafty_crate>, <extendedcrafting:table_elite>], [<botania:opencrate:1>, <extendedcrafting:table_elite>]);
mods.botania.ElvenTrade.addRecipe([<botania_tweaks:ultimate_extended_crafty_crate>, <extendedcrafting:table_ultimate>], [<botania:opencrate:1>, <extendedcrafting:table_ultimate>]);

# [Faint Amaranth] from [Goldenrod]
mods.botania.ManaInfusion.addInfusion(<astralsorcery:blockcustomflower>, <biomesoplenty:flower_1:1>, 10000);

# Melt Gaia's Head to receive Dark Matter
scripts.process.melt(<botania:gaiahead>, <liquid:dark_matter> * (144*3), "except: Melter");

<entity:botania:pink_wither>.addDrop(<enderio:item_alloy_endergy_ingot:4>, 2, 6);
<entity:botania:pink_wither>.addDrop(<industrialforegoing:pink_slime_ingot>, 3, 9);
<entity:botania:pixie>.addPlayerOnlyDrop(<jaopca:item_dusttinytitanium>, 1, 3);

# Metamorphic stones
val metStones = [
	<botania:biomestonea>,
	<botania:biomestonea:1>,
	<botania:biomestonea:2>,
	<botania:biomestonea:3>,
	<botania:biomestonea:4>,
	<botania:biomestonea:5>,
	<botania:biomestonea:6>,
	<botania:biomestonea:7>,
] as IItemStack[];
for stone in metStones {
	scripts.jei.crafting_hints.addInsOutCatl([<minecraft:stone:*>], stone, <botania:specialflower>.withTag({type: "marimorphosis"}));
}

// Way cheaper because all mods ca spawn vanilla animals
# [Cocoon of Caprice]*4 from [Pumpkin][+2]
craft.remake(<botania:cocoon> * 4, ["pretty",
  "W B W",
  "W P W",
  "W B W"], {
  "W": <ore:petalWhite>,                    # Mystical White Petal
  "B": <actuallyadditions:item_hairy_ball>, # Ball of Fur
  "P": <ore:cropPumpkin>,                   # Pumpkin
});

// Cheaper to compete other timers
# [Hovering Hourglass] from [Redstone Torch][+3]
craft.remake(<botania:hourglass>, ["pretty",
  "G ‚ G",
  "W ♥ W",
  "G ‚ G"], {
  "G": <ore:paneGlass>, # Glass Pane
  "‚": <ore:nuggetGold>, # Gold Nugget
  "W": <ore:petalWhite>, # Mystical White Petal
  "♥": <ore:torchRedstoneActive>, # Redstone Torch
});
