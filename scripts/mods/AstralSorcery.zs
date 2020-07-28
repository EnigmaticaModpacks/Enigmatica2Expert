import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.liquid.ILiquidStack;
#modloaded astralsorcery
print("--- loading AstralSorcery.zs ---");
	
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

# Chalice interactions
val liqStarlight = <liquid:astralsorcery.liquidstarlight>;
val cloudSeed = <liquid:cloud_seed_concentrated>;
val chaliceGrid = {
  # First                      , Second                                  , ⏩ + ⏩                               , 🔷 + ⏩                                , ⏩ + 🔷                                     ,
  [cloudSeed              * 10 , <liquid:water>        * 90 ,]: [<chisel:cloud>                            *6 , <twilightforest:fluffy_cloud>        *1 , <twilightforest:wispy_cloud>              *3] ,
  [cloudSeed              * 10 , <liquid:lava>         * 90 ,]: [<exnihilocreatio:block_endstone_crushed>  *6 ,<excompressum:compressed_block:7>     *1 ,<minecraft:end_stone>                      *3] ,
  [cloudSeed              * 10 , liqStarlight          * 90 ,]: [<exnihilocreatio:block_dust>              *6 , <excompressum:compressed_block>      *1 , <exnihilocreatio:block_andesite_crushed>  *3] ,
  [<liquid:lifeessence>   * 10 , <liquid:water>        * 90 ,]: [<biomesoplenty:flesh>                     *6 , <thaumcraft:flesh_block>             *1 , <biomesoplenty:flesh>                     *3] ,
  [<liquid:lifeessence>   * 10 , <liquid:lava>         * 90 ,]: [<thaumcraft:flesh_block>                  *6 , <thaumcraft:flesh_block>             *1 , <thaumcraft:flesh_block>                  *3] ,
  [<liquid:lifeessence>   * 10 , liqStarlight          * 90 ,]: [<harvestcraft:honey>                      *6 , <biomesoplenty:honey_block>          *1 , <harvestcraft:honeycomb>                  *3] ,
  [<liquid:lifeessence>   * 10 , cloudSeed             * 90 ,]: [<animania:wool:4>                         *6 , <animania:wool>                      *1 , <animania:wool:2>                         *3] ,
  [<liquid:plasma>        * 10 , <liquid:water>        * 90 ,]: [<chisel:basalt2:7>                        *6 , <quark:basalt>                       *1 , <chisel:basalt2:7>                        *3] ,
  [<liquid:plasma>        * 10 , <liquid:lava>         * 90 ,]: [<minecraft:obsidian>                      *6 , <minecraft:magma>                    *1 , <chisel:lavastone>                        *3] ,
  [<liquid:plasma>        * 10 , liqStarlight          * 90 ,]: [<quark:marble>                            *6 , <biomesoplenty:white_sandstone>      *1 , <quark:slate>                             *3] ,
  [<liquid:plasma>        * 10 , cloudSeed             * 90 ,]: [<enderio:block_fused_quartz>              *6 , <biomesoplenty:crystal>              *1 , <mysticalagriculture:storage:5>           *3] ,
  [<liquid:plasma>        * 10 , <liquid:lifeessence>  * 90 ,]: [<minecraft:bone_block>                    *6 , <minecraft:bone_block>               *1 , <minecraft:bone_block>                    *3] ,
  [<liquid:ic2uu_matter>  * 10 , <liquid:water>        * 90 ,]: [<quark:crystal:5>                         *6 , <actuallyadditions:block_crystal:2>  *1 , <quark:crystal:6>                         *3] ,
  [<liquid:ic2uu_matter>  * 10 , <liquid:lava>         * 90 ,]: [<quark:basalt>                            *6 , <draconicevolution:draconium_block>  *1 , <draconicevolution:infused_obsidian>      *3] ,
  [<liquid:ic2uu_matter>  * 10 , liqStarlight          * 90 ,]: [<quark:marble>                            *6 , <thermalfoundation:storage:7>        *1 , <minecraft:quartz_block>                  *3] ,
  [<liquid:ic2uu_matter>  * 10 , cloudSeed             * 90 ,]: [<randomthings:superlubricentice>          *6 , <iceandfire:dragonsteel_ice_block>   *1 , <nuclearcraft:block_ice>                  *3] ,
  [<liquid:ic2uu_matter>  * 10 , <liquid:lifeessence>  * 90 ,]: [<tconstruct:slime_congealed:3>            *6 , <tconevo:metal_block:5>              *1 , <minecraft:nether_wart_block>             *3] ,
  [<liquid:ic2uu_matter>  * 10 , <liquid:plasma>       * 90 ,]: [<enderio:block_infinity>                  *6 , <bigreactors:blockludicrite>         *1 , <minecraft:obsidian>                      *3] ,
} as IItemStack[][ILiquidStack[]];

#### Honorable mentions: ####
# liquid_sunshine
# cloud_seed_concentrated
# vibrant_alloy
# deuterium
# hydrofluoric_acid
# milk_chocolate
# honey
# blockfluiddirt
# mutagen
# dist_water
# if.pink_slime
# menrilresin
# liquidchorus
# witchwater
# xpjuice

# Defauls weights:
# 1200: lava + starlight = sand
#   70: lava + starlight = Aquamarine

for lList, itList in chaliceGrid {
	for it in itList {
		# LiquidInteraction.addInteraction(ILiquidStack liquidIn1, float chanceConsumption1, ILiquidStack liquidIn2, float chanceConsumption2, int weight, IItemStack output);
		val weight = pow(2, it.amount) as int;
		mods.astralsorcery.LiquidInteraction.addInteraction(lList[0], 0.1, lList[1], 0.2, weight, it * 1);
	}

	# Liquid interactions:
	mods.plustweaks.Liquid.registerLiquidInteraction(lList[0], lList[1], itList[0].asBlock().definition.defaultState, true);
	mods.plustweaks.Liquid.registerLiquidInteraction(lList[0], lList[1], itList[1].asBlock().definition.defaultState, false);
}


// <>.asBlock().definition.defaultState;
