import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded astralsorcery

# Quartz Dust unification
	mods.astralsorcery.Grindstone.removeRecipe(<nuclearcraft:gem_dust:2>);
	mods.astralsorcery.Grindstone.addRecipe(<minecraft:quartz_ore>, <appliedenergistics2:material:3>);

# Nocturnal Powder
	mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/nocturnalpowder");
	mods.astralsorcery.Altar.addDiscoveryAltarRecipe("enigmatica2expert:shaped/internal/altar/nocturnalpowder",
		<astralsorcery:itemusabledust:1>, 300, 100, [
		<ore:gemCoal>, <ore:dyeBlack>, <ore:gemCoal>,
		<ore:dustWither>, <astralsorcery:itemusabledust>, <ore:dustWither>, 
		<ore:gemCoal>, <ore:dustLapis>, <ore:gemCoal>]);

# Sooty Marble (This recipe already exists, I'm just "adding it" for the sake of JEI integration)
	recipes.addShaped("Sooty Marble JEI Hack", 
	<astralsorcery:blockblackmarble> * 8, 
	[[<ore:stoneMarble>, <ore:stoneMarble>, <ore:stoneMarble>],
	[<ore:stoneMarble>, <minecraft:coal>, <ore:stoneMarble>],
	[<ore:stoneMarble>, <ore:stoneMarble>, <ore:stoneMarble>]]);

# Glass Lens
	mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/glasslens");
	mods.astralsorcery.Altar.addDiscoveryAltarRecipe("enigmatica2expert:shaped/internal/altar/glasslens",
		<astralsorcery:itemcraftingcomponent:3>, 300, 100, [
		<botania:managlasspane>, <ore:quicksilver>, <botania:managlasspane>,
		<ore:gemAquamarine>, <thaumcraft:mirrored_glass>, <ore:gemAquamarine>, 
		<botania:managlasspane>, <ore:quicksilver>, <botania:managlasspane>]);

# Illumination Powder
	mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/illuminationpowder");
	mods.astralsorcery.Altar.addDiscoveryAltarRecipe("enigmatica2expert:shaped/internal/altar/illuminationpowder",
		<astralsorcery:itemusabledust> * 16, 100, 60, [
		<ore:dustGlowstone>, <ore:gemAquamarine>, <ore:dustGlowstone>,
		<ore:dustGlowstone>, <thaumcraft:nitor_yellow>, <ore:dustGlowstone>, 
		<ore:dustGlowstone>, <ore:gemAquamarine>, <ore:dustGlowstone>]);

# Resonating Wand
	mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/tool_basicwand");
	recipes.addShapedMirrored(<astralsorcery:itemwand>, 
	[[null, <ore:gemAquamarine>, <thaumcraft:salis_mundus>],
	[null, <ore:stoneMarble>, <ore:gemAquamarine>], 
	[<ore:stoneMarble>, null, null]]);

# Starlight Crafting Altar
	mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/upgrade_tier2");
	mods.astralsorcery.Altar.addDiscoveryAltarRecipe("enigmatica2expert:shaped/internal/altar/upgrade_tier2",
		<astralsorcery:blockaltar:1>, 350, 100, [
            <astralsorcery:blockmarble:2>, <astralsorcery:itemrockcrystalsimple>.anyDamage(), <astralsorcery:blockmarble:2>,
			<astralsorcery:blockmarble:4>, <liquid:astralsorcery.liquidstarlight>, <astralsorcery:blockmarble:4>, 
			<astralsorcery:blockmarble:2>, <ore:nitor>, <astralsorcery:blockmarble:2>]);

# Celestial Altar
	mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/upgrade_tier3");
	mods.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/upgrade_tier3",
		<astralsorcery:blockaltar:2>, 600, 300, [
            <ore:gemAquamarine>, <ore:blockThaumium>, <ore:gemAquamarine>,
            <bloodmagic:slate:1>, <astralsorcery:itemrockcrystalsimple>.anyDamage(), <bloodmagic:slate:1>,
            <ore:gemAquamarine>, <thaumcraft:pedestal_arcane>, <ore:gemAquamarine>,
            <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>]);
	
# Iridescent Altar
	mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/upgrade_tier4");
	mods.astralsorcery.Altar.addConstellationAltarRecipe("enigmatica2expert:shaped/internal/altar/upgrade_tier4",
		<astralsorcery:blockaltar:3>, 3250, 200, [
            <ore:blockMarble>, <bloodmagic:component:6>, <ore:blockMarble>,
            <astralsorcery:itemcoloredlens:4>, <astralsorcery:itemcelestialcrystal>, <astralsorcery:itemcoloredlens:6>,
            <ore:blockMarble>, <bloodmagic:points_upgrade>, <ore:blockMarble>,
            <liquid:astralsorcery.liquidstarlight>, <liquid:astralsorcery.liquidstarlight>, <liquid:astralsorcery.liquidstarlight>, <liquid:astralsorcery.liquidstarlight>,
            <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>,
            <bloodmagic:blood_rune:6>, <bloodmagic:blood_rune:6>,
            <bloodmagic:blood_rune:6>, <bloodmagic:blood_rune:6>,
            <astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcraftingcomponent:4>]);

# Astral Sorcery Journal
	recipes.addShaped("Astral Sorcery Journal", 
	<astralsorcery:itemjournal>, 
	[[null, <ore:gemAquamarine>, null],
	[<ore:leather>, <minecraft:book>, <ore:leather>], 
	[null, <ore:leather>, null]]);


# Creative Knowlenge Scroll
# [Scroll of Written Expertise] from [Tome of Knowledge][+8]
craft.make(<astralsorcery:itemknowledgeshare>.withTag({astralsorcery: {creativeKnowledge: 1 as byte}}), ["pretty",
  "# # P P      ",
  "# # r r B B  ",
  "P r ♦ ■ S B  ",
  "P r ■ T ■ r P",
  "  B S ■ ♦ r P",
  "  B B r r # #",
  "      P P # #"], {
  "P": <astralsorcery:itemcraftingcomponent:5>, # Parchment
  "■": <ore:blockLuminessence>,                 # Block of Luminessence
  "r": <thaumcraft:curio:1>,                    # Preserved Curiosity
  "B": <contenttweaker:benitoite>,              # Benitoite
  "#": <astralsorcery:blockinfusedwood:6>,      # Vibrant Infused Wood
  "S": <astralsorcery:itemknowledgeshare>,      # Scroll of Written Expertise
  "T": <thermalfoundation:tome_experience>,     # Tome of Knowledge
  "♦": <astralsorcery:itemperkgem:*>,           # Ilium Gem
});