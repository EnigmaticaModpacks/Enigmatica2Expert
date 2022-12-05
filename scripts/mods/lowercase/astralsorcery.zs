#modloaded astralsorcery
	
# *======= Recipes =======*

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
val IW = <astralsorcery:blockinfusedwood:6>;
val PC = <astralsorcery:itemcraftingcomponent:5>;
val CO = <thaumcraft:curio:1>;
val EI = <ore:ingotEssenceMetal>;
val TE = <thermalfoundation:tome_experience>.withTag({Experience: 10000});
val BT = <bigreactors:mineralbenitoite>;
mods.extendedcrafting.TableCrafting.addShaped(0, <astralsorcery:itemknowledgeshare>.withTag({astralsorcery: {creativeKnowledge: 1 as byte}}), [
	[IW, IW, PC, PC, null, null, null], 
	[IW, IW, CO, CO, BT, BT, null], 
	[PC, CO, <astralsorcery:itemperkgem:*>, EI, <astralsorcery:itemknowledgeshare>, BT, null], 
	[PC, CO, EI, TE, EI, CO, PC], 
	[null, BT, <astralsorcery:itemknowledgeshare>, EI, <astralsorcery:itemperkgem:*>, CO, PC], 
	[null, BT, BT, CO, CO, IW, IW], 
	[null, null, null, PC, PC, IW, IW]
]);

# [Marble]*8 from [Aquamarine][+1]
craft.make(<astralsorcery:blockmarble> * 8, ["pretty",
  "D D D",
  "D ◊ D",
  "D D D"], {
  "D": <ore:stoneDiorite>,  # Diorite
  "◊": <ore:gemAquamarine>, # Aquamarine
});

# [Luminous Crafting Table] from [Arcane Workbench][+2]
recipes.addShaped("Luminous Crafting Table - RecipeAction", <astralsorcery:blockaltar>, scripts.craft.grid.Grid(["pretty",
  "M n M",
  "M A M",
  "M   M"], {
  "M": <ore:stoneMarble>, # Marble
  "n": <thaumcraft:nitor_black>, # Black Nitor
  "A": <thaumcraft:arcane_workbench>, # Arcane Workbench
}).shaped(), null, function(out,cInfo,player){
	if (isNull(player)) return;
  if (player.world.isRemote()) return;
	val server = player.server;
	server.commandManager.executeCommand(server, '/astralsorcery research '~player.name~' BASIC_CRAFT');
});


# Skyblock alt
# [Constellation Paper] from [Glass Lens][+3]
val pp = <astralsorcery:itemcraftingcomponent:5>;
mods.astralsorcery.Altar.addAttunementAltarRecipe("Const paper",	<astralsorcery:itemconstellationpaper>, 900, 400, [
	null, <thaumcraft:curio:4>, null,                    # Illuminating Curiosity
	null, <astralsorcery:itemcraftingcomponent:3>, null, # Glass Lens
	null, <minecraft:golden_apple:1>, null,              # Golden Apple
	pp, pp, pp, pp
]);

# Make "Technical Crystals"
val TC = <astralsorcery:itemrockcrystalsimple>.withTag({
	astralsorcery: {crystalProperties: {collectiveCapability: 1, size: 1, fract: 0, purity: 1, sizeOverride: -1}}
});
scripts.process.crush(<ore:oreRockCrystal>, TC, "only: SagMill AEGrinder", [TC, TC, TC], [1.0f, 1.0f, 1.0f]);
