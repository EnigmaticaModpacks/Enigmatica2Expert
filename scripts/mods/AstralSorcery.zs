import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.liquid.ILiquidStack;
#modloaded astralsorcery
	
# *======= Recipes =======*

# Nocturnal Powder
	mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/nocturnalpowder");
	scripts.wrap.astralsorcery.Altar.addDiscoveryAltarRecipe("enigmatica2expert:shaped/internal/altar/nocturnalpowder",
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
	scripts.wrap.astralsorcery.Altar.addDiscoveryAltarRecipe("enigmatica2expert:shaped/internal/altar/glasslens",
		<astralsorcery:itemcraftingcomponent:3>, 300, 100, [
		<botania:managlasspane>, <ore:quicksilver>, <botania:managlasspane>,
		<ore:gemAquamarine>, <thaumcraft:mirrored_glass>, <ore:gemAquamarine>, 
		<botania:managlasspane>, <ore:quicksilver>, <botania:managlasspane>]);

# Illumination Powder
	mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/illuminationpowder");
	scripts.wrap.astralsorcery.Altar.addDiscoveryAltarRecipe("enigmatica2expert:shaped/internal/altar/illuminationpowder",
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
	scripts.wrap.astralsorcery.Altar.addDiscoveryAltarRecipe("enigmatica2expert:shaped/internal/altar/upgrade_tier2",
		<astralsorcery:blockaltar:1>, 350, 100, [
            <astralsorcery:blockmarble:2>, <astralsorcery:itemrockcrystalsimple>.anyDamage(), <astralsorcery:blockmarble:2>,
			<astralsorcery:blockmarble:4>, <liquid:astralsorcery.liquidstarlight>, <astralsorcery:blockmarble:4>, 
			<astralsorcery:blockmarble:2>, <ore:nitor>, <astralsorcery:blockmarble:2>]);

# Celestial Altar
	mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/upgrade_tier3");
	scripts.wrap.astralsorcery.Altar.addAttunementAltarRecipe("enigmatica2expert:shaped/internal/altar/upgrade_tier3",
		<astralsorcery:blockaltar:2>, 600, 300, [
            <ore:gemAquamarine>, <ore:blockThaumium>, <ore:gemAquamarine>,
            <bloodmagic:slate:1>, <astralsorcery:itemrockcrystalsimple>.anyDamage(), <bloodmagic:slate:1>,
            <ore:gemAquamarine>, <thaumcraft:pedestal_arcane>, <ore:gemAquamarine>,
            <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>, <ore:dustAstralStarmetal>]);
	
# Iridescent Altar
	mods.astralsorcery.Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/upgrade_tier4");
	scripts.wrap.astralsorcery.Altar.addConstellationAltarRecipe("enigmatica2expert:shaped/internal/altar/upgrade_tier4",
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
scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, <astralsorcery:itemknowledgeshare>.withTag({astralsorcery: {creativeKnowledge: 1 as byte}}), [
	[IW, IW, PC, PC, null, null, null], 
	[IW, IW, CO, CO, BT, BT, null], 
	[PC, CO, <astralsorcery:itemperkgem:*>, EI, <astralsorcery:itemknowledgeshare>, BT, null], 
	[PC, CO, EI, TE, EI, CO, PC], 
	[null, BT, <astralsorcery:itemknowledgeshare>, EI, <astralsorcery:itemperkgem:*>, CO, PC], 
	[null, BT, BT, CO, CO, IW, IW], 
	[null, null, null, PC, PC, IW, IW]
]);


/* Patchouli_js('Liquids/Liquid Interactions', 
	paged({
		type: "fluid_interaction",
		icon: "astralsorcery:blockchalice"
	},
  match_block_below(/^ *\[<liquid:(.*?)>.*?<liquid:(.*?)>.*?<(.*?)>.*?<(.*?)>.*?<(.*?)>.*$/gm)
  .reduce((arr, match) => {
    match.slice(1).forEach((m,i)=>arr.push([i<2 ? wrap_bucket(m) : m]));
    return arr
  }, [])
))*/
# Chalice interactions
val chaliceGrid = {
  # First                      , Second                                                             , ⏩ + ⏩                                , ⏩ + 🔷                             , 🔷 + ⏩                      ,
  [<liquid:cloud_seed_concentrated>* 10 , <liquid:water>                         * 90 ,]: [<chisel:cloud>                          , <twilightforest:wispy_cloud>            , <twilightforest:fluffy_cloud>      ] ,
  [<liquid:cloud_seed_concentrated>* 10 , <liquid:lava>                          * 90 ,]: [<exnihilocreatio:block_endstone_crushed>, <minecraft:end_stone>                   , <excompressum:compressed_block:7>  ] ,
  [<liquid:cloud_seed_concentrated>* 10 , <liquid:astralsorcery.liquidstarlight> * 90 ,]: [<exnihilocreatio:block_dust>            , <exnihilocreatio:block_andesite_crushed>, <excompressum:compressed_block>    ] ,
  [<liquid:lifeessence>            * 10 , <liquid:water>                         * 90 ,]: [<biomesoplenty:flesh>                   , <biomesoplenty:flesh>                   , <thaumcraft:flesh_block>           ] ,
  [<liquid:lifeessence>            * 10 , <liquid:lava>                          * 90 ,]: [<thaumcraft:flesh_block>                , <thaumcraft:flesh_block>                , <thaumcraft:flesh_block>           ] ,
  [<liquid:lifeessence>            * 10 , <liquid:astralsorcery.liquidstarlight> * 90 ,]: [<harvestcraft:honey>                    , <harvestcraft:honeycomb>                , <biomesoplenty:honey_block>        ] ,
  [<liquid:lifeessence>            * 10 , <liquid:cloud_seed_concentrated>       * 90 ,]: [<animania:wool:4>                       , <animania:wool:2>                       , <animania:wool>                    ] ,
  [<liquid:plasma>                 * 10 , <liquid:water>                         * 90 ,]: [<chisel:basalt2:7>                      , <chisel:basalt2:7>                      , <quark:basalt>                     ] ,
  [<liquid:plasma>                 * 10 , <liquid:lava>                          * 90 ,]: [<minecraft:obsidian>                    , <chisel:lavastone>                      , <minecraft:magma>                  ] ,
  [<liquid:plasma>                 * 10 , <liquid:astralsorcery.liquidstarlight> * 90 ,]: [<quark:marble>                          , <quark:slate>                           , <biomesoplenty:white_sandstone>    ] ,
  [<liquid:plasma>                 * 10 , <liquid:cloud_seed_concentrated>       * 90 ,]: [<enderio:block_fused_quartz>            , <mysticalagriculture:storage:5>         , <biomesoplenty:crystal>            ] ,
  [<liquid:plasma>                 * 10 , <liquid:lifeessence>                   * 90 ,]: [<minecraft:bone_block>                  , <minecraft:bone_block>                  , <minecraft:bone_block>             ] ,
  [<liquid:ic2uu_matter>           * 10 , <liquid:water>                         * 90 ,]: [<quark:crystal:5>                       , <quark:crystal:6>                       , <actuallyadditions:block_crystal:2>] ,
  [<liquid:ic2uu_matter>           * 10 , <liquid:lava>                          * 90 ,]: [<quark:basalt>                          , <draconicevolution:infused_obsidian>    , <draconicevolution:draconium_block>] ,
  [<liquid:ic2uu_matter>           * 10 , <liquid:astralsorcery.liquidstarlight> * 90 ,]: [<quark:marble>                          , <minecraft:quartz_block>                , <thermalfoundation:storage:7>      ] ,
  [<liquid:ic2uu_matter>           * 10 , <liquid:cloud_seed_concentrated>       * 90 ,]: [<randomthings:superlubricentice>        , <nuclearcraft:block_ice>                , <iceandfire:dragonsteel_ice_block> ] ,
  [<liquid:ic2uu_matter>           * 10 , <liquid:lifeessence>                   * 90 ,]: [<tconstruct:slime_congealed:3>          , <minecraft:nether_wart_block>           , <tconevo:metal_block:5>            ] ,
  [<liquid:ic2uu_matter>           * 10 , <liquid:plasma>                        * 90 ,]: [<enderio:block_infinity>                , <minecraft:obsidian>                    , <bigreactors:blockludicrite>       ] ,
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

# Weights by interaction type
var weights = [
	1200, # Flow+Flow
	70,   # Flow+Source
	2,    # Source+Flow
] as int[];

for lList, itList in chaliceGrid {
	for i, it in itList {
		# LiquidInteraction.addInteraction(ILiquidStack liquidIn1, float chanceConsumption1, ILiquidStack liquidIn2, float chanceConsumption2, int weight, IItemStack output);
		mods.astralsorcery.LiquidInteraction.addInteraction(lList[0], 0.1, lList[1], 0.2, weights[i], it);
	}

	# Liquid interactions:
	mods.plustweaks.Liquid.registerLiquidInteraction(lList[0], lList[1], itList[0].asBlock().definition.defaultState, true);
	mods.plustweaks.Liquid.registerLiquidInteraction(lList[0], lList[1], itList[1].asBlock().definition.defaultState, false);
	mods.plustweaks.Liquid.registerLiquidInteraction(lList[1], lList[0], itList[2].asBlock().definition.defaultState, true);
}