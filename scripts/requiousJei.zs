#priority 1000
#modloaded requious

import mods.requious.Assembly;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import mods.ctintegration.data.DataUtil.parse as sNBT;


function add(ass as Assembly, chunk as IItemStack[][IIngredient[]]) {
  for inputs, outputs in chunk {
    val assRec = AssemblyRecipe.create(function(container) {
      for i, output in outputs {
        if(isNull(output)) continue;
        container.addItemOutput("output" ~ i, output);
      }
    });
    for i, input in inputs {
      if(isNull(input)) continue;
      assRec.requireItem("input"~i, input);
    }
    ass.addJEIRecipe(assRec);
  }
}

function addInsOuts(ass as Assembly, inputs as int[][], outputs as int[][]) {
  for j,way in ['input', 'output'] as string[] {
    for i,pair in (j==0 ? inputs : outputs) {
      ass.setJEIItemSlot(pair[0], pair[1], way ~ i);
    }
  }
}

function getVisGauge(u as int, w as int) as SlotVisual {
  return SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png",u,w);
}
function getVisSlots(u as int, w as int) as SlotVisual {
  return SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_slots.png",u,w);
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var 
x = <assembly:infernal_furnace>;
x.addJEICatalyst(<thaumcraft:infernal_furnace>);
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
x.setJEIDurationSlot(2,0,"duration", getVisGauge(1,13));
addInsOuts(x, [[0,0]], [[3,0],[4,0],[5,0],[6,0]]);

val RE = <thaumcraft:nugget:10>;

function infFurLore(outs as WeightedItemStack[], i as int) as IItemStack {
  if(i >= outs.length) return null;
  return outs[i].stack.withLore(["§d§l" ~ outs[i].percent as int ~ "%"]);
}

function addInfFur(input as IIngredient, outs as WeightedItemStack[]) {
  add(<assembly:infernal_furnace>, {[input] as IIngredient[]: [
    infFurLore(outs, 0),
    infFurLore(outs, 1),
    infFurLore(outs, 2),
    infFurLore(outs, 3),
  ]});
}

/*Inject_js(
Object.entries(
  _.groupBy(
    getCrtLogBlock('Thaumcraft dump:\n-Smelting Bonus:\n', '\n-Warp')
      .split('\n')

      // Filter unwanted ores
      .filter((s) => !s.match(/yellorium/i))

      // Split into [in, out, chance]
      .map((s) =>
        s.match(/--in: (.*?), out: (.*?), change: (.*)/)?.splice(1)
      )
      .filter(Boolean)

      // Unwrap wildcarded
      .flatMap(([inp, out, chance]) => {
        const id = inp.match(/<([^:]+:[^:]+):\*>/)?.[1]
        if (!id) return [[inp, out, chance]]
        return getSubMetas(id).map((meta) => [
          `<${id}:${meta}>`,
          out,
          chance,
        ])
      }),
    '0'
  )
)
  // Filter only items that actually present in furnace
  .filter(([inp]) => {
    const oreName = inp.match(/<ore:([^>]+)>/)?.[1]
    if (!oreName) return true
    return getByOredict(oreName).some((tm) =>
      getFurnaceRecipes().some(
        (fr) =>
          fr.in_id === tm.id &&
          (fr.in_meta === '*' ||
            Number(fr.in_meta ?? 0) === tm.damage)
      )
    )
  })
  .map(
    ([inp, arr]) =>
      `addInfFur(${inp.padEnd(41)}, [${arr
        .map(
          ([, out, chance]) =>
            out.replace('<thaumcraft:nugget:10>', 'RE') +
            ' % ' +
            ((parseFloat(chance) * 100) | 0)
        )
        .sort((a, b) => a.length - b.length)
        .join(', ')}]);`
  )
  .sort(naturalSort)
)*/
addInfFur(<contenttweaker:ore_phosphor>            , [<contenttweaker:nugget_phosphor> * 2 % 50]);
addInfFur(<jaopca:item_clusteraluminium>           , [RE % 2, <thermalfoundation:material:196> % 33, <jaopca:item_nuggetaquamarine> * 28 % 50]);
addInfFur(<jaopca:item_clusteramber>               , [RE % 2, <jaopca:item_nuggetamber> % 33, <thermalfoundation:material:16> * 14 % 50]);
addInfFur(<jaopca:item_clusteramethyst>            , [RE % 2, <jaopca:item_nuggetamethyst> % 33, <jaopca:item_nuggetchargedcertusquartz> * 14 % 50]);
addInfFur(<jaopca:item_clusterapatite>             , [RE % 2, <jaopca:item_nuggetapatite> % 33, <jaopca:item_nuggetmagnesium> * 9 % 50]);
addInfFur(<jaopca:item_clusteraquamarine>          , [RE % 2, <jaopca:item_nuggetaquamarine> % 33, <thermalfoundation:material:17> * 14 % 50]);
addInfFur(<jaopca:item_clusterardite>              , [RE % 2, <tconstruct:nuggets:1> % 33, <minecraft:gold_nugget> * 9 % 50]);
addInfFur(<jaopca:item_clusterastralstarmetal>     , [RE % 2, <jaopca:item_nuggettungsten> * 9 % 50, <jaopca:item_nuggetastralstarmetal> % 33]);
addInfFur(<jaopca:item_clusterboron>               , [RE % 2, <jaopca:item_nuggetboron> % 33, <thaumcraft:nugget:9> * 21 % 50]);
addInfFur(<jaopca:item_clustercertusquartz>        , [RE % 2, <jaopca:item_nuggetcertusquartz> % 33, <thermalfoundation:material:16> * 14 % 50]);
addInfFur(<jaopca:item_clusterchargedcertusquartz> , [RE % 2, <jaopca:item_nuggetlapis> * 64 % 50, <jaopca:item_nuggetchargedcertusquartz> % 33]);
addInfFur(<jaopca:item_clustercoal>                , [RE % 2, <thaumcraft:nugget:9> * 21 % 50]);
addInfFur(<jaopca:item_clustercobalt>              , [RE % 2, <tconstruct:nuggets> % 33, <thermalfoundation:material:197> * 9 % 50]);
addInfFur(<jaopca:item_clusterdiamond>             , [RE % 2, <thermalfoundation:material:16> % 33, <jaopca:item_nuggetmalachite> * 14 % 50]);
addInfFur(<jaopca:item_clusterdilithium>           , [RE % 2, <jaopca:item_nuggetdilithium> % 33, <jaopca:item_nuggetdimensionalshard> * 21 % 50]);
addInfFur(<jaopca:item_clusterdimensionalshard>    , [RE % 2, <jaopca:item_nuggetperidot> * 14 % 50, <jaopca:item_nuggetdimensionalshard> % 33]);
addInfFur(<jaopca:item_clusterdraconium>           , [RE % 2, <draconicevolution:nugget> % 33, <jaopca:item_nuggetastralstarmetal> * 9 % 50]);
addInfFur(<jaopca:item_clusteremerald>             , [RE % 2, <thermalfoundation:material:17> % 33, <jaopca:item_nuggetmalachite> * 14 % 50]);
addInfFur(<jaopca:item_clusteriridium>             , [RE % 2, <mekanism:nugget:1> * 9 % 50, <thermalfoundation:material:199> % 33]);
addInfFur(<jaopca:item_clusterlapis>               , [RE % 2, <jaopca:item_nuggetlapis> % 33, <jaopca:item_nuggetsapphire> * 14 % 50]);
addInfFur(<jaopca:item_clusterlithium>             , [RE % 2, <jaopca:item_nuggetlithium> % 33, <jaopca:item_nuggetapatite> * 64 % 50]);
addInfFur(<jaopca:item_clustermagnesium>           , [RE % 2, <jaopca:item_nuggetmagnesium> % 33, <thermalfoundation:material:192> * 9 % 50]);
addInfFur(<jaopca:item_clustermalachite>           , [RE % 2, <jaopca:item_nuggetmalachite> % 33, <thermalfoundation:material:192> * 9 % 50]);
addInfFur(<jaopca:item_clustermithril>             , [RE % 2, <thermalfoundation:material:200> % 33, <jaopca:item_nuggetastralstarmetal> * 9 % 50]);
addInfFur(<jaopca:item_clusternickel>              , [RE % 2, <mekanism:nugget:1> * 9 % 50, <thermalfoundation:material:197> % 33]);
addInfFur(<jaopca:item_clusterosmium>              , [RE % 2, <mekanism:nugget:1> % 33, <thermalfoundation:material:198> * 9 % 50]);
addInfFur(<jaopca:item_clusterperidot>             , [RE % 2, <jaopca:item_nuggetperidot> % 33, <thermalfoundation:material:16> * 14 % 50]);
addInfFur(<jaopca:item_clusterplatinum>            , [RE % 2, <thermalfoundation:material:198> % 33, <thermalfoundation:material:199> * 9 % 50]);
addInfFur(<jaopca:item_clusterquartzblack>         , [RE % 2, <jaopca:item_nuggetquartzblack> % 33, <jaopca:item_nuggetaquamarine> * 28 % 50]);
addInfFur(<jaopca:item_clusterredstone>            , [RE % 2, <jaopca:item_nuggetquartzblack> * 14 % 50]);
addInfFur(<jaopca:item_clusterruby>                , [RE % 2, <jaopca:item_nuggetruby> % 33, <jaopca:item_nuggetmagnesium> * 9 % 50]);
addInfFur(<jaopca:item_clustersapphire>            , [RE % 2, <jaopca:item_nuggetsapphire> % 33, <draconicevolution:nugget> * 9 % 50]);
addInfFur(<jaopca:item_clustertanzanite>           , [RE % 2, <jaopca:item_nuggettanzanite> % 33, <thermalfoundation:material:16> * 14 % 50]);
addInfFur(<jaopca:item_clusterthorium>             , [RE % 2, <jaopca:item_nuggetthorium> % 33, <jaopca:item_nuggetboron> * 9 % 50]);
addInfFur(<jaopca:item_clustertitanium>            , [RE % 2, <libvulpes:productnugget:7> % 33, <jaopca:item_nuggetmagnesium> * 9 % 50]);
addInfFur(<jaopca:item_clustertopaz>               , [RE % 2, <jaopca:item_nuggettopaz> % 33, <thaumcraft:nugget:9> * 21 % 50]);
addInfFur(<jaopca:item_clustertungsten>            , [RE % 2, <jaopca:item_nuggettungsten> % 33, <thermalfoundation:material:199> * 9 % 50]);
addInfFur(<jaopca:item_clusteruranium>             , [RE % 2, <immersiveengineering:metal:25> % 33, <jaopca:item_nuggetlithium> * 9 % 50]);
addInfFur(<jaopca:item_dirtygemaluminium>          , [<jaopca:item_nuggetaquamarine> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemamber>              , [<thermalfoundation:material:16> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemamethyst>           , [<jaopca:item_nuggetchargedcertusquartz> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemapatite>            , [<jaopca:item_nuggetmagnesium> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemaquamarine>         , [<thermalfoundation:material:17> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemardite>             , [<minecraft:gold_nugget> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemastralstarmetal>    , [<jaopca:item_nuggettungsten> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemboron>              , [<thaumcraft:nugget:9> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemcertusquartz>       , [<thermalfoundation:material:16> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemchargedcertusquartz>, [<jaopca:item_nuggetlapis> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemcoal>               , [<thaumcraft:nugget:9> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemcobalt>             , [<thermalfoundation:material:197> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemcopper>             , [<minecraft:gold_nugget> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemdiamond>            , [<jaopca:item_nuggetmalachite> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemdilithium>          , [<jaopca:item_nuggetdimensionalshard> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemdimensionalshard>   , [<jaopca:item_nuggetperidot> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemdraconium>          , [<jaopca:item_nuggetastralstarmetal> * 64 % 100]);
addInfFur(<jaopca:item_dirtygememerald>            , [<jaopca:item_nuggetmalachite> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemgold>               , [<thermalfoundation:material:196> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemiridium>            , [<mekanism:nugget:1> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemiron>               , [<minecraft:gold_nugget> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemlapis>              , [<jaopca:item_nuggetsapphire> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemlead>               , [<thermalfoundation:material:194> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemlithium>            , [<jaopca:item_nuggetapatite> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemmagnesium>          , [<thermalfoundation:material:192> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemmalachite>          , [<thermalfoundation:material:192> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemmithril>            , [<jaopca:item_nuggetastralstarmetal> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemnickel>             , [<mekanism:nugget:1> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemosmium>             , [<thermalfoundation:material:198> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemperidot>            , [<thermalfoundation:material:16> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemplatinum>           , [<thermalfoundation:material:199> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemquartz>             , [<thermalfoundation:material:16> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemquartzblack>        , [<jaopca:item_nuggetaquamarine> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemredstone>           , [<jaopca:item_nuggetquartzblack> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemruby>               , [<jaopca:item_nuggetmagnesium> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemsapphire>           , [<draconicevolution:nugget> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemsilver>             , [<minecraft:gold_nugget> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemtanzanite>          , [<thermalfoundation:material:16> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemthorium>            , [<jaopca:item_nuggetboron> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemtin>                , [<thermalfoundation:material:195> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemtitanium>           , [<jaopca:item_nuggetmagnesium> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemtopaz>              , [<thaumcraft:nugget:9> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemtungsten>           , [<thermalfoundation:material:199> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemuranium>            , [<jaopca:item_nuggetlithium> * 64 % 100]);
addInfFur(<minecraft:beef>                         , [<thaumcraft:chunk> % 33]);
addInfFur(<minecraft:chicken>                      , [<thaumcraft:chunk:1> % 33]);
addInfFur(<minecraft:fish:0>                       , [<thaumcraft:chunk:3> % 33]);
addInfFur(<minecraft:fish:1>                       , [<thaumcraft:chunk:3> % 33]);
addInfFur(<minecraft:fish:2>                       , [<thaumcraft:chunk:3> % 33]);
addInfFur(<minecraft:fish:3>                       , [<thaumcraft:chunk:3> % 33]);
addInfFur(<minecraft:mutton>                       , [<thaumcraft:chunk:5> % 33]);
addInfFur(<minecraft:porkchop>                     , [<thaumcraft:chunk:2> % 33]);
addInfFur(<minecraft:rabbit>                       , [<thaumcraft:chunk:4> % 33]);
addInfFur(<ore:oreAluminium>                       , [RE % 1, <thermalfoundation:material:196> % 33]);
addInfFur(<ore:oreAmber>                           , [RE % 1, <jaopca:item_nuggetamber> % 33]);
addInfFur(<ore:oreAmethyst>                        , [RE % 1, <jaopca:item_nuggetamethyst> % 33]);
addInfFur(<ore:oreApatite>                         , [RE % 1, <jaopca:item_nuggetapatite> % 33]);
addInfFur(<ore:oreAquamarine>                      , [RE % 1, <jaopca:item_nuggetaquamarine> % 33]);
addInfFur(<ore:oreArdite>                          , [RE % 1, <tconstruct:nuggets:1> % 33]);
addInfFur(<ore:oreAstralStarmetal>                 , [RE % 1, <jaopca:item_nuggetastralstarmetal> % 33]);
addInfFur(<ore:oreBoron>                           , [RE % 1, <jaopca:item_nuggetboron> % 33]);
addInfFur(<ore:oreCinnabar>                        , [RE % 2, <thaumcraft:nugget:5> % 33]);
addInfFur(<ore:oreCoal>                            , [RE % 1]);
addInfFur(<ore:oreCobalt>                          , [RE % 1, <tconstruct:nuggets> % 33]);
addInfFur(<ore:oreCopper>                          , [RE % 1, <thermalfoundation:material:192> % 32]);
addInfFur(<ore:oreDiamond>                         , [RE % 2]);
addInfFur(<ore:oreDraconium>                       , [RE % 1, <draconicevolution:nugget> % 33]);
addInfFur(<ore:oreEmerald>                         , [RE % 2]);
addInfFur(<ore:oreGold>                            , [RE % 2, <minecraft:gold_nugget> % 33]);
addInfFur(<ore:oreIridium>                         , [RE % 1, <thermalfoundation:material:199> % 33]);
addInfFur(<ore:oreIron>                            , [RE % 1, <minecraft:iron_nugget> % 33]);
addInfFur(<ore:oreLapis>                           , [RE % 1]);
addInfFur(<ore:oreLead>                            , [RE % 1, <thermalfoundation:material:195> % 32]);
addInfFur(<ore:oreLithium>                         , [RE % 1, <jaopca:item_nuggetlithium> % 33]);
addInfFur(<ore:oreMagnesium>                       , [RE % 1, <jaopca:item_nuggetmagnesium> % 33]);
addInfFur(<ore:oreMalachite>                       , [RE % 1, <jaopca:item_nuggetmalachite> % 33]);
addInfFur(<ore:oreMithril>                         , [RE % 1, <thermalfoundation:material:200> % 33]);
addInfFur(<ore:oreNickel>                          , [RE % 1, <thermalfoundation:material:197> % 33]);
addInfFur(<ore:oreOsmium>                          , [RE % 1, <mekanism:nugget:1> % 33]);
addInfFur(<ore:orePeridot>                         , [RE % 1, <jaopca:item_nuggetperidot> % 33]);
addInfFur(<ore:orePlatinum>                        , [RE % 1, <thermalfoundation:material:198> % 33]);
addInfFur(<ore:oreQuartz>                          , [RE % 1, <thaumcraft:nugget:9> % 33]);
addInfFur(<ore:oreQuartzBlack>                     , [RE % 1, <jaopca:item_nuggetquartzblack> % 33]);
addInfFur(<ore:oreRedstone>                        , [RE % 1]);
addInfFur(<ore:oreRuby>                            , [RE % 1, <jaopca:item_nuggetruby> % 33]);
addInfFur(<ore:oreSapphire>                        , [RE % 1, <jaopca:item_nuggetsapphire> % 33]);
addInfFur(<ore:oreSilver>                          , [RE % 2, <thermalfoundation:material:194> % 32]);
addInfFur(<ore:oreTanzanite>                       , [RE % 1, <jaopca:item_nuggettanzanite> % 33]);
addInfFur(<ore:oreThorium>                         , [RE % 1, <jaopca:item_nuggetthorium> % 33]);
addInfFur(<ore:oreTin>                             , [RE % 1, <thermalfoundation:material:193> % 32]);
addInfFur(<ore:oreTopaz>                           , [RE % 1, <jaopca:item_nuggettopaz> % 33]);
addInfFur(<ore:oreTungsten>                        , [RE % 1, <jaopca:item_nuggettungsten> % 33]);
addInfFur(<ore:oreUranium>                         , [RE % 1, <immersiveengineering:metal:25> % 33]);
addInfFur(<rats:rat_nugget_ore:1>.withTag({OreItem: {id: "forestry:resources", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "forestry:apatite", Count: 1 as byte, Damage: 0 as short}}), [<jaopca:item_nuggetmagnesium> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:2>.withTag({OreItem: {id: "astralsorcery:blockcustomsandore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "astralsorcery:itemcraftingcomponent", Count: 3 as byte, Damage: 0 as short}}), [<thermalfoundation:material:17> * 6 % 50]);
addInfFur(<rats:rat_nugget_ore:3>.withTag({OreItem: {id: "tconstruct:ore", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "tconstruct:ingots", Count: 1 as byte, Damage: 1 as short}}), [<minecraft:gold_nugget> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:5>.withTag({OreItem: {id: "actuallyadditions:block_misc", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "actuallyadditions:item_misc", Count: 1 as byte, Damage: 5 as short}}), [<jaopca:item_nuggetaquamarine> * 13 % 50]);
addInfFur(<rats:rat_nugget_ore:6>.withTag({OreItem: {id: "nuclearcraft:ore", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1 as byte, Damage: 5 as short}}), [<thaumcraft:nugget:9> * 9 % 50]);
addInfFur(<rats:rat_nugget_ore:8>.withTag({OreItem: {id: "minecraft:coal_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:coal", Count: 1 as byte, Damage: 0 as short}}), [<thaumcraft:nugget:9> * 9 % 50]);
addInfFur(<rats:rat_nugget_ore:9>.withTag({OreItem: {id: "tconstruct:ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "tconstruct:ingots", Count: 1 as byte, Damage: 0 as short}}), [<thermalfoundation:material:197> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:11>.withTag({OreItem: {id: "minecraft:diamond_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:diamond", Count: 1 as byte, Damage: 0 as short}}), [<jaopca:item_nuggetmalachite> * 6 % 50]);
addInfFur(<rats:rat_nugget_ore:12>.withTag({OreItem: {id: "draconicevolution:draconium_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "draconicevolution:draconium_ingot", Count: 1 as byte, Damage: 0 as short}}), [<jaopca:item_nuggetastralstarmetal> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:13>.withTag({OreItem: {id: "minecraft:emerald_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:emerald", Count: 1 as byte, Damage: 0 as short}}), [<jaopca:item_nuggetmalachite> * 6 % 50]);
addInfFur(<rats:rat_nugget_ore:44>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 0 as short}}), [<jaopca:item_nuggetchargedcertusquartz> * 6 % 50]);
addInfFur(<rats:rat_nugget_ore:45>.withTag({OreItem: {id: "minecraft:gold_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:gold_ingot", Count: 1 as byte, Damage: 0 as short}}), [<thermalfoundation:material:196> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:46>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 7 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 135 as short}}), [<mekanism:nugget:1> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:47>.withTag({OreItem: {id: "minecraft:iron_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:iron_ingot", Count: 1 as byte, Damage: 0 as short}}), [<minecraft:gold_nugget> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:48>.withTag({OreItem: {id: "minecraft:lapis_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:dye", Count: 1 as byte, Damage: 4 as short}}), [<jaopca:item_nuggetsapphire> * 6 % 50]);
addInfFur(<rats:rat_nugget_ore:49>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 131 as short}}), [<thermalfoundation:material:194> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:50>.withTag({OreItem: {id: "nuclearcraft:ore", Count: 1 as byte, Damage: 6 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1 as byte, Damage: 6 as short}}), [<jaopca:item_nuggetapatite> * 32 % 50]);
addInfFur(<rats:rat_nugget_ore:51>.withTag({OreItem: {id: "nuclearcraft:ore", Count: 1 as byte, Damage: 7 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1 as byte, Damage: 7 as short}}), [<thermalfoundation:material:192> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:52>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 5 as short}}), [<thermalfoundation:material:192> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:53>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 8 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 136 as short}}), [<jaopca:item_nuggetastralstarmetal> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:76>.withTag({OreItem: {id: "minecraft:quartz_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:quartz", Count: 1 as byte, Damage: 0 as short}}), [<thermalfoundation:material:16> * 6 % 50]);
addInfFur(<rats:rat_nugget_ore:85>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 133 as short}}), [<mekanism:nugget:1> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:86>.withTag({OreItem: {id: "mekanism:oreblock", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "mekanism:ingot", Count: 1 as byte, Damage: 1 as short}}), [<thermalfoundation:material:198> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:87>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 2 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 2 as short}}), [<thermalfoundation:material:16> * 6 % 50]);
addInfFur(<rats:rat_nugget_ore:89>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 6 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 134 as short}}), [<thermalfoundation:material:199> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:91>.withTag({OreItem: {id: "minecraft:redstone_ore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "minecraft:redstone", Count: 1 as byte, Damage: 0 as short}}), [<jaopca:item_nuggetquartzblack> * 6 % 50]);
addInfFur(<rats:rat_nugget_ore:92>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 1 as short}}), [<jaopca:item_nuggetmagnesium> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:93>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 6 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 6 as short}}), [<draconicevolution:nugget> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:95>.withTag({OreItem: {id: "astralsorcery:blockcustomore", Count: 1 as byte, Damage: 1 as short}, IngotItem: {id: "astralsorcery:itemcraftingcomponent", Count: 1 as byte, Damage: 1 as short}}), [<jaopca:item_nuggettungsten> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:96>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 4 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 4 as short}}), [<thermalfoundation:material:16> * 6 % 50]);
addInfFur(<rats:rat_nugget_ore:97>.withTag({OreItem: {id: "nuclearcraft:ore", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "nuclearcraft:ingot", Count: 1 as byte, Damage: 3 as short}}), [<jaopca:item_nuggetboron> * 4 % 50]);
addInfFur(<rats:rat_nugget_ore:99>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 3 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 3 as short}}), [<thaumcraft:nugget:9> * 9 % 50]);
addInfFur(<rats:rat_nugget_ore:101>.withTag({OreItem: {id: "immersiveengineering:ore", Count: 1 as byte, Damage: 5 as short}, IngotItem: {id: "immersiveengineering:metal", Count: 1 as byte, Damage: 5 as short}}), [<jaopca:item_nuggetlithium> * 4 % 50]);
addInfFur(<thaumcraft:cluster:0>                   , [RE % 2]);
addInfFur(<thaumcraft:cluster:1>                   , [RE % 2, <minecraft:gold_nugget> % 33, <thermalfoundation:material:196> * 9 % 50]);
addInfFur(<thaumcraft:cluster:2>                   , [RE % 2, <thaumcraft:nugget:1> % 33, <minecraft:gold_nugget> * 9 % 50, <thermalfoundation:material:192> * 2 % 32]);
addInfFur(<thaumcraft:cluster:3>                   , [RE % 2, <thaumcraft:nugget:2> % 33, <thermalfoundation:material:193> * 2 % 32, <thermalfoundation:material:195> * 9 % 50]);
addInfFur(<thaumcraft:cluster:4>                   , [RE % 2, <thaumcraft:nugget:3> % 33, <minecraft:gold_nugget> * 9 % 50, <thermalfoundation:material:194> * 2 % 32]);
addInfFur(<thaumcraft:cluster:5>                   , [RE % 2, <thaumcraft:nugget:4> % 33, <thermalfoundation:material:195> * 2 % 32, <thermalfoundation:material:194> * 9 % 50]);
addInfFur(<thaumcraft:cluster:6>                   , [RE % 2, <thaumcraft:nugget:5> % 33]);
addInfFur(<thaumcraft:cluster:7>                   , [RE % 2, <thaumcraft:nugget:9> % 33, <thermalfoundation:material:16> * 14 % 50]);
addInfFur(<thaumcraft:cluster>                     , [<minecraft:iron_nugget> % 33, <minecraft:gold_nugget> * 9 % 50]);
addInfFur(<thaumicwonders:eldritch_cluster:0>      , [RE % 2, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:1>      , [RE % 2, <minecraft:gold_nugget> % 33, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:2>      , [RE % 2, <thaumcraft:nugget:1> % 33, <thermalfoundation:material:192> * 4 % 32, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:3>      , [RE % 2, <thaumcraft:nugget:2> % 33, <thermalfoundation:material:193> * 4 % 32, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:4>      , [RE % 2, <thaumcraft:nugget:3> % 33, <thermalfoundation:material:194> * 4 % 32, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:5>      , [RE % 2, <thaumcraft:nugget:4> % 33, <thermalfoundation:material:195> * 4 % 32, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:6>      , [RE % 2, <thaumcraft:nugget:5> % 33, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:7>      , [RE % 2, <thaumcraft:nugget:9> % 33, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:8>      , [RE % 2, <thaumcraft:nugget:7> % 33, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster>        , [<minecraft:iron_nugget> % 33]);
/**/

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:liquid_interaction>;
x.addJEICatalyst(<minecraft:lava_bucket>);
x.setJEIDurationSlot(1,0,"duration", getVisGauge(0,6));
addInsOuts(x, [[0,0],[2,0]], [[1,1]]);

function add_liquid_interaction(input1 as IIngredient, input2 as IIngredient, out as IItemStack) {
  add(<assembly:liquid_interaction>, {[input1, input2] : [out]});
}

add_liquid_interaction(Bucket("blood"), Bucket("water"), <biomesoplenty:flesh>);
add_liquid_interaction(Bucket("astralsorcery.liquidstarlight"), Bucket("water"), <minecraft:ice>);
add_liquid_interaction(Bucket("astralsorcery.liquidstarlight"), Bucket("lava"), <minecraft:sand>);
add_liquid_interaction(Bucket("astralsorcery.liquidstarlight"), Bucket("lava"), <astralsorcery:blockcustomsandore>);

add_liquid_interaction(Bucket("mana"), <thermalfoundation:storage:2>, <thermalfoundation:storage:8>);
add_liquid_interaction(Bucket("mana"), <thermalfoundation:storage:3>, <minecraft:gold_block>);
add_liquid_interaction(Bucket("mana"), <thermalfoundation:ore:3>, <minecraft:gold_ore>);
add_liquid_interaction(Bucket("mana"), <thermalfoundation:ore:2>, <thermalfoundation:ore:8>);
add_liquid_interaction(Bucket("mana"), <minecraft:dirt>, <minecraft:grass>);
add_liquid_interaction(Bucket("mana"), <minecraft:dirt:1>, <minecraft:dirt:2>);
add_liquid_interaction(Bucket("mana"), <minecraft:farmland>, <minecraft:mycelium>);
add_liquid_interaction(Bucket("mana"), <minecraft:glass>, <minecraft:sand>);
add_liquid_interaction(Bucket("mana"), <minecraft:lapis_ore>, <minecraft:lapis_block>);

add_liquid_interaction(Bucket("pyrotheum") | Bucket("cryotheum"), <minecraft:grass>, <minecraft:dirt>);

add_liquid_interaction(Bucket("pyrotheum"), <minecraft:cobblestone:*>, <minecraft:stone>);
add_liquid_interaction(Bucket("pyrotheum"), <minecraft:sand:*>, <minecraft:glass>);
add_liquid_interaction(Bucket("pyrotheum"), <minecraft:clay:*>, <minecraft:hardened_clay>);
add_liquid_interaction(Bucket("pyrotheum"), <minecraft:stone_stairs:*>, <minecraft:stone_brick_stairs>);

add_liquid_interaction(Bucket("cryotheum"), <minecraft:water_bucket>, <minecraft:ice>);
add_liquid_interaction(Bucket("cryotheum"), <minecraft:water_bucket>, <minecraft:snow>);
add_liquid_interaction(Bucket("cryotheum"), <minecraft:lava_bucket>, <minecraft:obsidian>);
add_liquid_interaction(Bucket("cryotheum"), <minecraft:lava_bucket>, <minecraft:stone>);
add_liquid_interaction(Bucket("cryotheum"), Soul('minecraft:creeper') | Soul('minecraft:zombie'), Soul('minecraft:snowman'));

add_liquid_interaction(Bucket("petrotheum"), <minecraft:stone:*>, <minecraft:gravel>);
add_liquid_interaction(Bucket("petrotheum"), <minecraft:cobblestone:*>, <minecraft:gravel>);
add_liquid_interaction(Bucket("petrotheum"), <minecraft:stonebrick:*>, <minecraft:gravel>);
add_liquid_interaction(Bucket("petrotheum"), <minecraft:mossy_cobblestone:*>, <minecraft:gravel>);


/*Inject_js(
_(loadJson("config/exnihilocreatio/WitchWaterWorldRegistry.json"))
.map((t,liquid)=>Object.entries(t).map(([block,weight])=>
  `add_liquid_interaction(Bucket("witchwater"), `+
  `Bucket("${liquid}"), <${block.replace(':-1','')}>`+
  `${weight<=1?'':' * '+Math.min(64,parseInt(weight))});`
))
.flatten()
.value()
)*/
add_liquid_interaction(Bucket("witchwater"), Bucket("lava"), <minecraft:cobblestone>);
add_liquid_interaction(Bucket("witchwater"), Bucket("lava"), <minecraft:stone:5>);
add_liquid_interaction(Bucket("witchwater"), Bucket("lava"), <minecraft:stone:1>);
add_liquid_interaction(Bucket("witchwater"), Bucket("lava"), <minecraft:stone:3>);
add_liquid_interaction(Bucket("witchwater"), Bucket("petrotheum"), <minecraft:dirt>);
add_liquid_interaction(Bucket("witchwater"), Bucket("petrotheum"), <minecraft:dirt:2>);
add_liquid_interaction(Bucket("witchwater"), Bucket("petrotheum"), <minecraft:dirt:1>);
add_liquid_interaction(Bucket("witchwater"), Bucket("water"), <minecraft:dirt:1>);
add_liquid_interaction(Bucket("witchwater"), Bucket("water"), <biomesoplenty:dirt:8>);
add_liquid_interaction(Bucket("witchwater"), Bucket("water"), <biomesoplenty:dirt:9>);
add_liquid_interaction(Bucket("witchwater"), Bucket("water"), <biomesoplenty:dirt:10>);
add_liquid_interaction(Bucket("witchwater"), Bucket("fiery_essence"), <exnihilocreatio:block_netherrack_crushed> * 64);
add_liquid_interaction(Bucket("witchwater"), Bucket("fiery_essence"), <minecraft:netherrack> * 20);
add_liquid_interaction(Bucket("witchwater"), Bucket("fiery_essence"), <netherendingores:block_nether_netherfish>);
/**/

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:everflow_chalice>;
x.addJEICatalyst(<astralsorcery:blockchalice>);
x.setJEIDurationSlot(1,0,"duration", getVisGauge(0,6));
addInsOuts(x, [[0,0],[2,0]], [[1,1], [0,2], [2,2]]);

function add_everflow_chalice(input1 as IIngredient, input2 as IIngredient, out as IItemStack[]) {
  add(<assembly:everflow_chalice>, {[input1, input2] : out});
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:liquid_heat_exchanger>;
x.addJEICatalyst(<ic2:te:31>);
x.setJEIFluidSlot(0, 0, 'liquid_input');
x.setJEIItemSlot(1, 0, 'item_in');
x.setJEIDurationSlot(2,0,"duration", getVisGauge(5,1));
x.setJEIFluidSlot(3, 0, 'liquid_output');

for l_in, l_out in {
  lava: 'ic2pahoehoe_lava',
  ic2hot_coolant: 'ic2coolant',
} as string[string] {
  x.addJEIRecipe(AssemblyRecipe.create(function(container) {
    container.addFluidOutput('liquid_output', game.getLiquid(l_out));
  })
  .requireFluid('liquid_input', game.getLiquid(l_in))
  .requireItem("item_in", <ic2:crafting:7>)
  );
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:neromantic_prime>;
x.addJEICatalyst(<astralsorcery:blockbore>);
x.addJEICatalyst(<astralsorcery:blockborehead>);
x.addJEICatalyst(<astralsorcery:blockchalice>);
x.setJEIFluidSlot(0, 0, 'fluid_out');

static neromantic_prime_fluids as ILiquidStack[] = [
/*Inject_js(
config('config/astralsorcery/fluid_rarities.cfg').data.data
.slice(0, 9*5)
.map(l=>l.split(';'))
.map(l=>[
  parseInt(l[3]),
  [`  <fluid:${(l[0]+'>')}`,` * ${l[3]},`]
])
.sort(([a], [b]) => b - a)
.map(([,l])=>l)
)*/
  <fluid:mana>              * 1500,
  <fluid:amber>             * 800,
  <fluid:xpjuice>           * 500,
  <fluid:pyrotheum>         * 200,
  <fluid:cryotheum>         * 200,
  <fluid:hydrofluoric_acid> * 120,
  <fluid:mutagen>           * 100,
  <fluid:vibrant_alloy>     * 40,
  <fluid:ic2uu_matter>      * 1,
/**/
];

for i, output in neromantic_prime_fluids {
  x.addJEIRecipe(AssemblyRecipe.create(function(container) {
    container.addFluidOutput("fluid_out", output);
  }));
}


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:scented_hive>;
x.addJEICatalyst(<exnihilocreatio:hive:1>);
x.setJEIDurationSlot(3,0,"duration", getVisSlots(5,1));
addInsOuts(x, [[1,1],[1,0],[2,0],[0,0]], [[4,0]]);

val worldItem as IItemStack[int] = {
  0: <biomesoplenty:earth>.withTag({display:{Name:"§6OVERWORLD"}}),
  1: <biomesoplenty:earth>.withTag({display:{Name:"§6THE END"}}),
};

/*Inject_js(
JSON.parse(loadText('config/exnihilocreatio/ScentedHiveRegistry.json'))
.map(l=>`add(x, {[worldItem[${l.dim}], ${'<exnihilocreatio:hive:1>'}, ${
  Object.keys(l.adjacentBlocks).map(i=>`<${i}>`).join(', ')
}] : [<${l.hive}>]});`)
.join('\n')
)*/
add(x, {[worldItem[0], <exnihilocreatio:hive:1>, <ore:treeLeaves>, <ore:logWood>] : [<forestry:beehives:0>]});
add(x, {[worldItem[0], <exnihilocreatio:hive:1>, <ore:flower>] : [<forestry:beehives:1>]});
add(x, {[worldItem[0], <exnihilocreatio:hive:1>, <ore:sand>] : [<forestry:beehives:2>]});
add(x, {[worldItem[0], <exnihilocreatio:hive:1>, <minecraft:log:3>, <ore:treeLeaves>] : [<forestry:beehives:3>]});
add(x, {[worldItem[1], <exnihilocreatio:hive:1>, <minecraft:end_stone:0>] : [<forestry:beehives:4>]});
add(x, {[worldItem[0], <exnihilocreatio:hive:1>, <minecraft:ice:0>, <minecraft:snow:0>] : [<forestry:beehives:5>]});
add(x, {[worldItem[0], <exnihilocreatio:hive:1>, <ore:dirt>] : [<forestry:beehives:6>]});
/**/

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:oc_printer3d>;
x.addJEICatalyst(<opencomputers:printer>);
x.setJEIDurationSlot(2,0,"duration", getVisGauge(1,8));
addInsOuts(x, [[0,0],[1,0]], [[3,0]]);
add(x, {[<opencomputers:material:28>, <ore:dye>] : [<opencomputers:print>]});

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:electronics_assembler>;
x.addJEICatalyst(<opencomputers:assembler>);
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
addInsOuts(x, [[0,0]], [[2,0]]);
add(x, {[<opencomputers:case1> | <opencomputers:case2> | <opencomputers:case3>] : [<opencomputers:robot>]});
add(x, {[<opencomputers:material:17> | <opencomputers:material:18>] : [<opencomputers:misc>]});
add(x, {[<opencomputers:material:23> | <opencomputers:material:24>] : [<opencomputers:misc:1>]});

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:cc_printer>;
x.addJEICatalyst(<computercraft:peripheral:3>);
x.setJEIDurationSlot(2,0,"duration", getVisGauge(1,8));
addInsOuts(x, [[0,0],[1,0]], [[3,0]]);
add(x, {[<minecraft:paper>, <minecraft:dye:*>] : [<computercraft:printout>]});

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:witch_water>;
x.addJEICatalyst(Bucket('witchwater'));
x.addJEICatalyst(<exnihilocreatio:witchwater>);
x.setJEIDurationSlot(1,0,"duration", getVisGauge(1,8));
addInsOuts(x, [[0,0]], [[2,0]]);
add(x, {[Soul('minecraft:skeleton')] : [Soul('minecraft:wither_skeleton')]});
add(x, {[Soul('minecraft:creeper')]  : [Soul('minecraft:creeper')]});
add(x, {[Soul('minecraft:slime')]    : [Soul('minecraft:magma_cube')]});
add(x, {[Soul('minecraft:spider')]   : [Soul('minecraft:cave_spider')]});
add(x, {[Soul('minecraft:squid')]    : [Soul('minecraft:ghast')]});
add(x, {[Soul('minecraft:villager')] : [Soul('minecraft:zombie_villager')]});
add(x, {[Soul('minecraft:pig')]      : [Soul('minecraft:zombie_pigman')]});
add(x, {[<openblocks:luggage>]       : [<openblocks:luggage>.withTag({size: 54})]});

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:meteor>;
x.addJEICatalyst(<bloodmagic:ritual_diviner:1>.withTag({current_ritual: "meteor"}));
x.setJEIDurationSlot(1,1,"duration", getVisGauge(1,8));
x.setJEIItemSlot (0, 1, 'f0');
x.setJEIFluidSlot(0, 0, 'f1');

static meteors as string[][] = [
/*Inject_js(
glob.sync('config/bloodmagic/meteors/*.json')
.map(loadJson)
.map(f=>
  [
  `${f.catalystStack.registryName.domain}:${f.catalystStack.registryName.path}`,
  f.catalystStack.meta,
  f.cost,
  ...f.components.map(c=>c.oreName.substring(3))
  ]
  .map(s=>`"${s}"`).join(', ')
).map(s=>`[${s}]`).join(',\n')
)*/
["minecraft:iron_block", "0", "600000", "Iron", "Copper", "Tin", "Silver", "Lead", "Gold", "Lapis", "Redstone", "Aluminum"],
["thermalfoundation:storage", "6", "600000", "Iron", "Copper", "Tin", "Gold", "AstralStarmetal", "Draconium", "Nickel", "Osmium", "Platinum", "Rutile", "Uranium"],
["thermalfoundation:storage", "7", "1000000", "Iron", "Gold", "Lapis", "Emerald", "Redstone", "Diamond", "Iridium", "Mithril"],
["nuclearcraft:ingot_block", "3", "1100000", "Thorium", "Boron", "Lithium", "Magnesium"],
["minecraft:emerald_block", "0", "1400000", "Lapis", "Diamond", "Emerald", "Coal", "Ruby", "Peridot", "Topaz", "Tanzanite", "Malachite", "Sapphire", "Amber", "Apatite", "CertusQuartz", "Cinnabar", "Prosperity", "QuartzBlack"],
["tconstruct:metal", "1", "1700000", "Quartz", "NetherAluminum", "NetherCopper", "NetherLead", "NetherNickel", "NetherRedstone", "NetherLapis", "NetherIron", "NetherGold", "NetherEmerald", "NetherDiamond", "NetherCoal", "NetherPlatinum", "NetherSilver", "NetherTin", "NetherCertusQuartz", "NetherChargedCertusQuartz", "NetherOsmium", "NetherUranium", "Cobalt", "Ardite"],
["jaopca:block_blockdilithium", "0", "2000000", "EndDilithium", "ClathrateRedstone", "ClathrateEnder", "ClathrateGlowstone"]
/**/
];

var k = 0;
var maxRows = 0;
for t in meteors { if(t.length > maxRows) maxRows = t.length; }
for _y in 0 .. ((maxRows - 4) / 7 + 1) as int {
  for _x in 2 .. 9 {
    x.setJEIItemSlot(_x, _y, 'i'~k);
    k += 1;
  }
}

for i, meteor in meteors {
  val meteorAss = AssemblyRecipe.create(function(container) {
    for i, ore in meteor {
      if(i<3) continue;
      container.addItemOutput("i"~(i - 3), oreDict.get('ore' ~ ore).firstItem);
    }
  });
  meteorAss.requireItem('f0', itemUtils.getItem(meteor[0], meteor[1]));
  meteorAss.requireFluid('f1', <fluid:lifeessence> * (meteor[2] as int));
  x.addJEIRecipe(meteorAss);
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
static turbineFuel as int[string][] = [
/*Inject_js(
[...
  loadText('config/AdvGenerators/overrides/turbine.cfg')
  .matchAll(/^\s+turbine-fuel\s*:\s*([^\s]+)\s+([^\s]+)\s+.*$/gm)
].sort((a,b)=>a[2] - b[2])
.map(([_, name, mj_mb])=>`  {${name.padEnd(16)}: ${mj_mb}},`)
.join('\n')
)*/
  {liquidhydrogen  : 4},
  {gasoline        : 5},
  {canolaoil       : 10},
  {refinedcanolaoil: 20},
  {oil             : 25},
  {biomass         : 30},
  {biodiesel       : 40},
  {crystaloil      : 40},
  {ic2biogas       : 50},
  {diesel          : 70},
  {ethene          : 80},
  {liquidethene    : 80},
  {"bio.ethanol"   : 90},
  {biofuel         : 90},
  {refined_oil     : 95},
  {rocket_fuel     : 95},
  {syngas          : 100},
  {refined_fuel    : 105},
  {empoweredoil    : 120},
  {fire_water      : 120},
  {rocketfuel      : 410},
  {perfect_fuel    : 32800},
/**/
];

x = <assembly:turbine>;
x.addJEICatalyst(<advgenerators:turbine_controller>);
x.setJEIDurationSlot(1,0,"duration", getVisGauge(0,5));
x.setJEIFluidSlot(0, 0, 'liquid_input');
x.setJEIEnergySlot(2, 0, 'energy_out', "rf");

for map in turbineFuel {
  for name, mj_mb in map {
    val liq = game.getLiquid(name);
    if(isNull(liq)) {
      logger.logWarning('Liquid ['~name~'] not exist. Remove it from config/AdvGenerators/overrides/turbine.cfg');
      continue;
    }
    x.addJEIRecipe(AssemblyRecipe.create(function(container) {
      container.addEnergyOutput('energy_out', mj_mb, 0);
    }).requireFluid('liquid_input', liq));
  }
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:heat_exchanger>;
x.addJEICatalyst(<advgenerators:exchanger_controller>);
x.setJEIFluidSlot(0, 0, 'fluid_in');
x.setJEIItemSlot(1, 0, 'item_in');
x.setJEIDurationSlot(2,0,"duration", getVisGauge(9,1));
x.setJEIFluidSlot(3, 0, 'fluid_out');
x.setJEIItemSlot(4, 0, 'item_out1');
x.setJEIItemSlot(5, 0, 'item_out2');

function showHeat(heat as int) as IItemStack {
  return <ic2:heat_exchanger>.withTag({advDmg: (2500 - heat), display:{Name:"§e"~heat~" Heat"}});
}

function addHeatExch(fluid_in as ILiquidStack, heat_in as int, fluid_out as ILiquidStack, item_out1 as IItemStack, heat_out as int) {
  val r = AssemblyRecipe.create(function(container) {
    if(!isNull(fluid_out)) container.addFluidOutput('fluid_out', fluid_out);
    if(!isNull(item_out1)) container.addItemOutput('item_out1', item_out1);
    if(heat_out>0) container.addItemOutput('item_out2', showHeat(heat_out));
  })
  .requireFluid('fluid_in', fluid_in);
  if(heat_in>0) r.requireItem('item_in', showHeat(heat_in));
  <assembly:heat_exchanger>.addJEIRecipe(r);
}

/*Inject_js{
const cfg = [...
  loadText('config/AdvGenerators/overrides/exchanger.cfg')
  .matchAll(/^\s*exchanger\s*:\s*(.*)$/gm)
].map(([,m])=>m.trim())
const bl = (id)=>{const s=id.split(':'); return s.length>=2?id.replace(/@(\d+)/,':$1'):'minecraft:'+s[0]}
const B = (block,amount)=>`<${bl(block)}>${parseFloat(amount)>1?' * ' + amount : ''}`
const H = (h)=>Math.round(h)
return _(cfg
.map(g=>g.match(
  /fluid:(\w+) (\d+) mB(?: \+ (\d+) HU)? =>(?: fluid:(\w+) (\d+) ?mB)?(?: [BI]:(\w+(?::\w+)?(?:@\d+)?) (\d+\.\d+))?(?: \+ (\d+) HU)?/
)?.slice(1))
.filter(m=>m))
.sortBy(o=>parseInt(o[7]) * 1000 + parseInt(o[4])).value()
.map(([
  fluid_in, fluid_in_amount, heat_in, 
  fluid_out, fluid_out_amount, item_out, item_out_amount, heat_out
])=>
  `addHeatExch(${B('fluid:'+fluid_in, fluid_in_amount)}, ` +
  `${H(heat_in ?? 0)}, ` +
  `${fluid_out ? B('fluid:'+fluid_out, fluid_out_amount) : 'null'}, ` +
  `${item_out ? B(item_out, item_out_amount) : 'null'}, ` +
  `${H(heat_out ?? 0)});`
)
}*/
addHeatExch(<fluid:ic2hot_coolant>, 0, <fluid:ic2coolant>, null, 40);
addHeatExch(<fluid:lava>, 0, null, <minecraft:obsidian>, 30);
addHeatExch(<fluid:ic2pahoehoe_lava>, 0, null, <advancedrocketry:basalt>, 40);
addHeatExch(<fluid:pyrotheum>, 0, null, <chisel:basalt2:7>, 60);
addHeatExch(<fluid:fire_water>, 0, null, <botania:blazeblock>, 200);
addHeatExch(<fluid:enrichedlava>, 0, null, <draconicevolution:infused_obsidian>, 500);
addHeatExch(<fluid:water> * 5, 3, <fluid:steam> * 15, null, 0);
addHeatExch(<fluid:distwater>, 20, <fluid:steam> * 300, null, 0);
addHeatExch(<fluid:ic2hot_water>, 12, <fluid:steam> * 300, null, 0);
addHeatExch(<fluid:ic2distilled_water>, 16, <fluid:steam> * 400, null, 0);
/**/


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:forestry_farm>;
x.setJEIItemSlot(0, 0, 'item_in');
x.setJEIDurationSlot(1,0,"duration", getVisSlots(11,1));
for i in 0 .. 11 {
  x.addJEICatalyst(<forestry:ffarm:3>.withTag({FarmBlock: i}));
}

static fertilizers as IItemStack[] = [
/*Inject_js(
(()=>{
let t = config('config/forestry/farm.cfg').fertilizers.items
  .map(l=>l.split(';'))
let max =       Math.max(...t.map(l=>l[1]))
let qnt = max / Math.min(...t.map(l=>l[1])) + 1
return t
  .sort((a,b)=>b[1]-a[1])
  .map(([id,value])=>`  <${id}> * ${
    Math.min(64, Math.max(1, qnt * max / value | 0))
  },`)
  .join('\n')
})()
)*/
  <thermalfoundation:fertilizer:2> * 7,
  <mysticalagriculture:mystical_fertilizer> * 8,
  <mysticalagriculture:fertilized_essence> * 13,
  <thermalfoundation:fertilizer:1> * 14,
  <industrialforegoing:fertilizer> * 15,
  <botania:fertilizer> * 17,
  <forestry:fertilizer_compound> * 21,
  <actuallyadditions:item_fertilizer> * 42,
  <ic2:crop_res:2> * 42,
  <thermalfoundation:fertilizer> * 42,
/**/
];

for input in fertilizers {
  x.addJEIRecipe(AssemblyRecipe.create(function(container) {})
    .requireItem("item_in", input)
  );
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
val xp_bottler = itemUtils.getItem("openblocks:xp_bottler");
if(!isNull(xp_bottler)) {
  x = <assembly:xp_bottler>;
  x.addJEICatalyst(xp_bottler);
  x.setJEIFluidSlot(1, 0, 'liquid_input');
  x.setJEIDurationSlot(2,0,"duration", SlotVisual.arrowRight());
  addInsOuts(x, [[0,0]], [[3,0]]);

  for fluid in [
    "essence",
    "xpjuice",
    "experience",
  ] as string[] {
    x.addJEIRecipe(AssemblyRecipe.create(function(container) {
      container.addItemOutput('output0', <minecraft:experience_bottle>);
    })
    .requireFluid('liquid_input', game.getLiquid(fluid) * 160)
    .requireItem("input0", <minecraft:glass_bottle>)
    );
  }
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:nether_portal_spread>;
x.addJEICatalyst(<minecraft:obsidian>);
x.setJEIDurationSlot(5,0,"duration", SlotVisual.arrowRight());
addInsOuts(x, [[4,0],[3,0],[2,0],[1,0],[0,0]], [[6,0],[7,0],[8,0]]);

/*Inject_js{
const fluids = getCSV('config/tellme/fluids-csv.csv')

const toStack=([__, mod, id, amount], isWildcard)=>{
  const def = `${mod||'minecraft'}:${id}`
  const fluid = fluids.find(o=>o.Block === def)
  const count = parseInt(amount)>1?' * '+Math.min(64,amount):''
  return (fluid
    ? `Bucket("${fluid.Name}")`
    : `<${def + (isWildcard===true ? ':*' : '')}>`)
  + count
}

return loadText('config/netherportalspread/spreadsettings.txt')
.split('\n')
.filter(l=>l.match(/\S+/))
.map(l=>l.match(/(?:([^:\s]+):)?([^:\s]+); \[([^\]]+)\],/))
.map(m=>[
  toStack(m, true),
  [...m[3].matchAll(/(?:([^:\s]+):)?([^:\s]+)>(\d+)/g)].map(toStack).join(', '),
]).reduce((acc,[inp, out])=>{
  const arr = acc.find(o=>o[1]===out)?.[0]
  if(arr) arr.push(inp)
  else acc.push([[inp], out])
  return acc
}, [])
.map(([inps, out])=>`add(x, {[${inps.join(', ')}] : [${out}]});`)
.join('\n')
}*/
add(x, {[<minecraft:cobblestone:*>, <quark:slate:*>, <minecraft:stone_stairs:*>] : [<quark:biome_cobblestone>]});
add(x, {[<minecraft:stone:*>, <minecraft:dirt:*>, <minecraft:grass:*>, <minecraft:grass_path:*>, <minecraft:farmland:*>, <biomesoplenty:grass:*>, <biomesoplenty:dirt:*>] : [<minecraft:netherrack> * 64, <minecraft:quartz_ore> * 4, <netherendingores:block_nether_netherfish>]});
add(x, {[<minecraft:leaves:*>, <minecraft:leaves2:*>, <advancedrocketry:alienleaves:*>, <exnihilocreatio:block_infesting_leaves:*>, <exnihilocreatio:block_infested_leaves:*>, <extrautils2:ironwood_leaves:*>, <biomesoplenty:leaves_0:*>, <biomesoplenty:leaves_1:*>, <biomesoplenty:leaves_2:*>, <biomesoplenty:leaves_3:*>, <biomesoplenty:leaves_4:*>, <biomesoplenty:leaves_5:*>, <forestry:leaves.decorative.0:*>, <forestry:leaves.decorative.1:*>, <forestry:leaves.decorative.2:*>, <minecraft:gravel:*>, <minecraft:clay:*>, <rustic:leaves:*>] : [<biomesoplenty:ash_block>]});
add(x, {[<minecraft:gold_ore:*>, <minecraft:iron_ore:*>, <minecraft:lapis_ore:*>, <appliedenergistics2:quartz_ore:*>, <thaumcraft:ore_cinnabar:*>, <thaumcraft:ore_amber:*>] : [<netherendingores:ore_nether_modded_1>]});
add(x, {[<appliedenergistics2:charged_quartz_ore:*>, <minecraft:diamond_ore:*>, <minecraft:emerald_ore:*>] : [<tconstruct:ore>]});
add(x, {[<minecraft:redstone_ore:*>, <minecraft:coal_ore:*>, <thermalfoundation:ore:*>] : [<minecraft:quartz_ore>]});
add(x, {[<appliedenergistics2:sky_stone_block:*>] : [<minecraft:quartz_block>]});
add(x, {[<biomesoplenty:white_sand:*>] : [<quark:jasper>]});
add(x, {[<chisel:basalt2:*>] : [<tconstruct:seared>]});
add(x, {[<chisel:bricks:*>] : [<minecraft:red_nether_brick>]});
add(x, {[<chisel:limestone:*>, <minecraft:sandstone:*>] : [<mysticalagriculture:soulstone>]});
add(x, {[<chisel:marble2:*>, <astralsorcery:blockmarble:*>] : [<thaumictinkerer:black_quartz_block> * 10, <botania:quartztypedark>]});
add(x, {[<iceandfire:ash:*>] : [<chisel:block_coal_coke>]});
add(x, {[<minecraft:brick_block:*>] : [<minecraft:nether_brick>]});
add(x, {[<minecraft:diamond_block:*>] : [<minecraft:gold_block>]});
add(x, {[<minecraft:emerald_block:*>] : [<tconstruct:metal>]});
add(x, {[<minecraft:fence:*>] : [<minecraft:nether_brick_fence>]});
add(x, {[<minecraft:hardened_clay:*>] : [<tcomplement:scorched_block>]});
add(x, {[<minecraft:log:*>, <minecraft:log2:*>] : [<advancedrocketry:charcoallog>]});
add(x, {[<minecraft:melon_block:*>, <minecraft:hay_block:*>] : [<minecraft:nether_wart_block>]});
add(x, {[<minecraft:mossy_cobblestone:*>] : [<minecraft:magma>]});
add(x, {[<minecraft:mycelium:*>] : [<extrautils2:cursedearth>]});
add(x, {[<minecraft:planks:*>] : [<tconstruct:firewood>]});
add(x, {[<minecraft:prismarine:*>, <minecraft:piston:*>] : [<minecraft:glowstone>]});
add(x, {[<minecraft:redstone_block:*>] : [<quark:smoker>]});
add(x, {[<minecraft:ice:*>] : [<minecraft:obsidian>]});
add(x, {[<minecraft:sand:*>] : [<minecraft:soul_sand>]});
add(x, {[<minecraft:slime:*>] : [<minecraft:bone_block>]});
add(x, {[<minecraft:stonebrick:*>] : [<quark:magma_bricks>]});
add(x, {[<thaumcraft:stone_porous:*>] : [<additionalcompression:dustgunpowder_compressed>, <forestry:ash_block_1> * 5]});
add(x, {[<minecraft:yellow_flower:*>, <minecraft:red_flower:*>] : [<minecraft:fire>]});
add(x, {[<biomesoplenty:flower_0:*>, <biomesoplenty:flower_1:*>, <botania:flower:*>, <minecraft:snow_layer:*>] : [<biomesoplenty:blue_fire>]});
add(x, {[Bucket("water")] : [Bucket("blood")]});
add(x, {[<additionalcompression:meatfish_compressed:*>, <additionalcompression:meatchicken_compressed:*>, <additionalcompression:meatbeef_compressed:*>, <additionalcompression:meatporkchop_compressed:*>] : [<thaumcraft:flesh_block>]});
add(x, {[<minecraft:wool:*>] : [<quark:color_slime>]});
add(x, {[<minecraft:stone_slab:*>] : [<quark:fire_stone_slab>]});
add(x, {[<minecraft:wooden_slab:*>] : [<appliedenergistics2:sky_stone_slab>]});
add(x, {[<minecraft:glass_pane:*>] : [<chisel:glasspane1>]});
add(x, {[<minecraft:cobblestone_wall:*>] : [<mysticalagriculture:cobbled_soulstone_wall>]});
add(x, {[<minecraft:spruce_stairs:*>, <minecraft:oak_stairs:*>] : [<quark:basalt>]});
add(x, {[<rats:garbage_pile:*>] : [<tconstruct:soil>]});
add(x, {[<floralchemy:hedge:*>] : [<twilightforest:thorns>]});
add(x, {[<minecraft:wooden_door:*>] : [<minecraft:iron_bars>]});
add(x, {[<minecraft:glass:*>] : [<chisel:glassdyedred>]});
/**/


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:lens_of_the_miner>;
x.addJEICatalyst(<actuallyadditions:item_mining_lens>);
x.addJEICatalyst(<actuallyadditions:block_atomic_reconstructor>);
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
addInsOuts(x, [[0,0]], [[2,0]]);

function addMiningLensOre(base as IIngredient, oreDictName as string, weight as int) as void {
  val ore = oreDict[oreDictName];
  if(ore.items.length == 0) return;
  val output = ore.firstItem.withLore(["§e§lWeight: " ~ weight]);
  add(<assembly:lens_of_the_miner>, {[base] as IIngredient[] : [output]});
}

function addMiningLensStoneOre(oreDictName as string, weight as int) {
  addMiningLensOre(<minecraft:stone>, oreDictName, weight);
}
function addMiningLensNetherOre(oreDictName as string, weight as int) {
  addMiningLensOre(<minecraft:netherrack>, oreDictName, weight);
}

// Values taken from:
// https://github.com/Ellpeck/ActuallyAdditions/blob/main/src/main/java/de/ellpeck/actuallyadditions/common/items/lens/LensMining.java
addMiningLensNetherOre("oreNetherDiamond", 50);
addMiningLensNetherOre("oreNetherRedstone", 200);
addMiningLensNetherOre("oreNetherLapis", 250);
addMiningLensNetherOre("oreQuartz", 3000);
addMiningLensNetherOre("oreNetherCoal", 5000);
addMiningLensNetherOre("crushedNetherrack", 6000);

addMiningLensStoneOre("oreMalachite", 40);
addMiningLensStoneOre("orePeridot", 40);
addMiningLensStoneOre("oreRuby", 40);
addMiningLensStoneOre("oreSapphire", 40);
addMiningLensStoneOre("oreApatite", 700);
addMiningLensStoneOre("oreCertusQuartz", 800);
addMiningLensStoneOre("oreQuartzBlack", 3000);
addMiningLensStoneOre("oreCoal", 5000);
addMiningLensStoneOre("gravel", 6000);


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:petro_petunia>;
x.addJEICatalyst(<botania:specialflower>.withTag({type: "petro_petunia"}));
x.addJEICatalyst(<botania:floatingspecialflower>.withTag({type: "petro_petunia"}));
x.setJEIFluidSlot(0, 0, 'liquid_input');
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
x.setJEIItemSlot(2, 0, 'output0');

for fluid, arr in {
/*Inject_js(
Object.entries(
  config('config/acronym/floralchemy.cfg').fuelvalues
).map(([fluid, {burnTime, powerPreTick}]) => 
  [fluid, ((20*60) / burnTime * 1000) | 0, powerPreTick * burnTime]
).sort((a, b) => b[2] - a[2])
.map(([fluid, consumption, manaTotal]) =>
  `  ${('"'+fluid+'":').padEnd(16)}[${consumption}, ${manaTotal}],`
))*/
  "perfect_fuel": [12, 768000000],
  "rocketfuel":   [500, 480000],
  "empoweredoil": [1200, 100000],
  "refined_fuel": [1411, 85000],
  "diesel":       [3428, 17500],
  "crystaloil":   [3428, 17500],
  "biodiesel":    [4800, 12500],
  "biomass":      [4800, 12500],
  "canolaoil":    [8000, 7500],
  "oil":          [12000, 5000],
/**/
} as int[][string] {
  val consumption = arr[0];
  val manaTotal = arr[1];
  x.addJEIRecipe(AssemblyRecipe.create(function(container) {
    container.addItemOutput('output0',
      <botania:manatablet>.withTag({mana: min(500000, manaTotal), display:{Name:"§b"~manaTotal~" Mana"}})
      * (manaTotal / 500000 + 1)
    );
  })
  .requireFluid('liquid_input', game.getLiquid(fluid) * consumption)
  );
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:syngas_producer>;
x.addJEICatalyst(<advgenerators:syngas_controller>);
x.setJEIItemSlot(0, 0, 'input0');
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
x.setJEIFluidSlot(2, 0, 'fluid_out');

function getOreDictBurnTime(oreName as string) as int {
  for item in oreDict[oreName].items {
    if (item.burnTime > 0) return item.burnTime;
  }
  return 0;
}

function addSyngas(input as IIngredient, carbon as int) as void {
  if(carbon<=0) return;
  <assembly:syngas_producer>.addJEIRecipe(AssemblyRecipe.create(function(container) {
    container.addFluidOutput('fluid_out', <fluid:syngas> * (carbon / 50));
  })
  .requireItem("input0", input)
  );
}


/*Inject_js{
const cfg = [...
  loadText('config/AdvGenerators/overrides/syngas.cfg')
  .matchAll(/^\s*carbon-value\s*:\s*(.*)$/gm)
].map(([,m])=>m.trim())

const bl = (id)=>((id.split(':').length===1?'minecraft:':'')+id).replace(/@(\d+)/,':$1')

return cfg
.map(l=>l.match(
  /(B|I|OD):(\w+(?::\w+)?(?:@\d+)?) (?:=> (\d+)|DEFAULT)(?:\s*\/\/.*)?$/
)?.slice(1))
.filter(m=>m)
.sort(([,,a],[,,b])=>naturalSort(b??'',a??''))
.map(([type, _item, val])=>{
  const OD = type==='OD'
  const item = OD ? _item : _item.toLowerCase()
  const it = `<${OD ? 'ore:'+item : bl(item)}>`
  return ((OD ? !isODExist(item) : !isItemExist(bl(item)))?'#':'') +
    `addSyngas(${it}, ${val ?? (OD ? `getOreDictBurnTime("${item}")` : it+'.burnTime')});`
})
}*/
addSyngas(<contenttweaker:saturated_phosphor>, 450000);
addSyngas(<ore:compressedCharcoal3x>, 256000);
addSyngas(<ore:compressedCoal3x>, 256000);
addSyngas(<contenttweaker:empowered_phosphor>, 180000);
addSyngas(<contenttweaker:blasted_coal>, 120000);
addSyngas(<ore:compressedCharcoal2x>, 64000);
addSyngas(<ore:compressedCoal2x>, 64000);
addSyngas(<contenttweaker:conglomerate_of_coal>, 60000);
#addSyngas(<railcraft:cube:0>, 32000);
addSyngas(<ore:blockFuelCoke>, 32000);
addSyngas(<ore:crystalCrudeOil>, 32000);
addSyngas(<ore:blockCharcoal>, 16000);
addSyngas(<ore:blockGraphite>, 16000);
addSyngas(<rats:little_black_squash_balls>, 8000);
addSyngas(<ore:fuelCoke>, 3200);
addSyngas(<mekanism:compressedcarbon>, 3200);
addSyngas(<ore:logWood>, 1600);
addSyngas(<ore:pulpWood>, 1600);
addSyngas(<ore:dustCoal>, 1600);
addSyngas(<ore:dustCharcoal>, 1600);
#addSyngas(<ore:molecule_cellulose>, 1200);
addSyngas(<mekanism:biofuel>, 800);
addSyngas(<ore:plankWood>, 400);
#addSyngas(<ore:element_C>, 200);
addSyngas(<ore:blockCoal>, getOreDictBurnTime("blockCoal"));
addSyngas(<minecraft:coal:0>, <minecraft:coal:0>.burnTime);
addSyngas(<minecraft:coal:1>, <minecraft:coal:1>.burnTime);
#addSyngas(<ore:itemCharcoalSugar>, getOreDictBurnTime("itemCharcoalSugar"));
#addSyngas(<minefactoryreloaded:brick:15>, <minefactoryreloaded:brick:15>.burnTime);
addSyngas(<ore:woodRubber>, getOreDictBurnTime("woodRubber"));
addSyngas(<forestry:bituminous_peat>, <forestry:bituminous_peat>.burnTime);
addSyngas(<forestry:peat>, <forestry:peat>.burnTime);
addSyngas(<extrautils2:ingredients:4>, <extrautils2:ingredients:4>.burnTime);
/**/

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:garden_cloche>;
x.addJEICatalyst(<immersiveengineering:metal_device1:13>);
x.setJEIFluidSlot(0, 0, 'fluid_in');
x.setJEIDurationSlot(1,0,"duration", getVisGauge(9,1));
addInsOuts(x, [[1,0]], [[3,0]]);

function addGardenClocheFluid(fluid as ILiquidStack, amount as int) as void {
  <assembly:garden_cloche>.addJEIRecipe(AssemblyRecipe.create(function(c) {
    c.addItemOutput('output0', <minecraft:potato> * amount);
  })
  .requireFluid('fluid_in', fluid * 100)
  .requireItem("input0", <minecraft:potato>)
  );
}


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:typewriter>;
x.addJEICatalyst(<bibliocraft:typewriter>);
x.addJEICatalyst(<bibliocraft:desk>);
x.setJEIDurationSlot(4,1,"duration", SlotVisual.arrowRight());
addInsOuts(x, [[2,0],[0,1],[1,1],[2,1],[1,2],[2,2]], [[6,1]]);

for name, book in scripts._init.variables.bookWrittenBy {
  add(x, {[
    <minecraft:name_tag:*>,
    <minecraft:paper>,
    <bibliocraft:typewriter:*>,
    Soul(scripts._init.variables.bookWriters[name]),
    <bibliocraft:desk:*>,
    <bibliocraft:seat:*>,
  ] : [book]});
}



// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:excavator>;
x.addJEICatalyst(<immersiveengineering:metal_multiblock:11>);
x.addJEICatalyst(<immersiveengineering:metal_multiblock:12>);
x.addJEICatalyst(<immersivepetroleum:schematic>.withTag({multiblock: "IE:ExcavatorDemo", flip: 1 as byte}));

val excavatorList = [
/*Inject_js{

const oreSet = new Map()
const defList = [
  [25, 0.1, ['oreIron'    , 'oreNickel'       , 'oreTin'          , 'denseoreIron'                       ], [0.5, 0.25, 0.20, 0.05]],
  [25, 0.1, ['oreIron'    , 'oreGold'                                                                    ], [0.85, 0.15]],
  [20, 0.1, ['oreIron'    , 'dustSulfur'                                                                 ], [0.5, 0.5]],
  [20, 0.2, ['oreAluminum', 'oreTitanium'     , 'denseoreAluminum'                                       ], [0.90, 0.05, 0.05]],
  [30, 0.2, ['oreCopper'  , 'oreGold'         , 'oreNickel'       , 'denseoreCopper'                     ], [0.65, 0.25, 0.05, 0.05]],
  [15, 0.2, ['oreTin'     , 'denseoreTin'                                                                ], [0.95, 0.05]],
  [20, 0.3, ['oreGold'    , 'oreCopper'       , 'oreNickel'       , 'denseoreGold'                       ], [0.65, 0.25, 0.05, 0.05]],
  [20, 0.3, ['oreNickel'  , 'orePlatinum'     , 'oreIron'         , 'denseoreNickel'                     ], [0.85, 0.05, 0.05, 0.05]],
  [ 5, 0.35,['orePlatinum', 'oreNickel'       , '-oreIridium-'    , 'denseorePlatinum'                   ], [0.40, 0.30, 0.15, 0.1, 0.05]],
  [10, 0.35,['oreUranium' , 'oreLead'         , 'orePlutonium'    , 'denseoreUranium'                    ], [0.55, 0.3, 0.1, 0.05]],
  [ 5, 0.3, ['oreQuartz'  , 'oreCertusQuartz'                                                            ], [0.6, 0.4]],
  [15, 0.2, ['oreLead'    , 'oreSilver'       , 'oreSulfur'       , 'denseoreLead'   , 'denseoreSilver'  ], [0.40, 0.40, 0.1, 0.05, 0.05]],
  [10, 0.15,['oreLead'    , 'oreSilver'       , 'denseoreLead'                                           ], [0.55, 0.4, 0.05]],
  [10, 0.2, ['oreSilver'  , 'oreLead'         , 'denseoreSilver'                                         ], [0.55, 0.4, 0.05]],
  [10, 0.2, ['oreLapis'   , 'oreIron'         , 'dustSulfur'      , 'denseoreLapis'                      ], [0.65, 0.275, 0.025, 0.05]],
  [15, 0.1, ['oreRedstone', 'denseoreRedstone', 'oreRuby'         , 'oreCinnabar'    , 'dustSulfur'      ], [0.75, 0.05, 0.05, 0.1, 0.05]],
  [25, 0.1, ['oreCoal'    , 'denseoreCoal'    , 'oreDiamond'      , 'oreEmerald'                         ], [0.92, 0.1, 0.015, 0.015]],
  [25, 0.05,['blockClay'  , 'sand'            , 'gravel'                                                 ], [0.5, 0.3, 0.2]],
]

glob.sync('scripts/**'+'/*.zs').forEach(filePath => {
  for (const match of loadText(filePath).matchAll(/immersiveengineering\.Excavator\.addMineral\("[^"]+?", (.*)\);/gm)) {
    defList.push(eval(`([${match[1]}])`))
  }
})

const wSumm = _.sum(defList.map(([a])=>a))
defList.forEach(([weight, failChance, ores, probs])=>{
  const sum = _.sum(probs)
  probs = probs.map(p=>p/sum)

  const gain = weight / wSumm * (1-failChance)

  ores.forEach((ore,i)=>{
    oreSet.set(ore, (oreSet.get(ore)??0) + gain * probs[i])
  })
})

const result = [...oreSet]
  .filter(([ore])=>isODExist(ore))
  .sort(([,a],[,b])=>b-a)

return result.map(([ore,weight])=>{
  const tm = getByOredict_first(ore)
  const amount = (weight / result[0][1] * 64 + 1) | 0
  return `  ${tm.commandString}${amount > 1 ? ' * '+amount : ''},`
})

}*/
  <minecraft:iron_ore> * 65,
  <thermalfoundation:ore:1> * 64,
  <minecraft:coal_ore> * 53,
  <thermalfoundation:ore:2> * 31,
  <thermalfoundation:ore:5> * 31,
  <thermalfoundation:ore> * 29,
  <minecraft:gold_ore> * 28,
  <mekanism:oreblock> * 24,
  <thermalfoundation:ore:3> * 23,
  <thermalfoundation:ore:4> * 22,
  <minecraft:clay> * 18,
  <minecraft:redstone_ore> * 16,
  <thermalfoundation:material:771> * 15,
  <minecraft:sand> * 11,
  <minecraft:lapis_ore> * 8,
  <nuclearcraft:ore:3> * 8,
  <nuclearcraft:ore:5> * 8,
  <nuclearcraft:ore:6> * 8,
  <nuclearcraft:ore:7> * 8,
  <actuallyadditions:block_misc:3> * 8,
  <minecraft:gravel> * 8,
  <immersiveengineering:ore:5> * 6,
  <minecraft:quartz_ore> * 4,
  <thermalfoundation:ore:6> * 4,
  <appliedenergistics2:charged_quartz_ore> * 3,
  <thaumcraft:ore_cinnabar> * 3,
  <libvulpes:ore0:8> * 2,
  <biomesoplenty:gem_ore:1> * 2,
  <minecraft:diamond_ore>,
  <minecraft:emerald_ore>,
/**/
] as IItemStack[];

k = 0;
for _y in 0 .. (excavatorList.length / 9 + 1) as int {
  for _x in 0 .. 9 {
    x.setJEIItemSlot(_x, _y, 'output'~k);
    k += 1;
  }
}

add(x, {[] : excavatorList});

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:mineralis>;
x.addJEICatalyst(<astralsorcery:blockritualpedestal>);
x.addJEICatalyst(<astralsorcery:itemtunedcelestialcrystal>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.mineralis", crystalProperties: {collectiveCapability: 100, size: 900, fract: 0, purity: 100, sizeOverride: -1}}}));
x.addJEICatalyst(<astralsorcery:itemtunedrockcrystal>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.mineralis", crystalProperties: {collectiveCapability: 100, size: 400, fract: 0, purity: 100, sizeOverride: -1}}}));

val mineralisList = [
/*Inject_js{
  const list = config('config/astralsorcery/mineralis_ritual.cfg').data.data
  .map(o=>((a,b)=>[a, parseInt(b)])(...o.split(';')))
  .filter(([od])=>isODExist(od))
  .sort(([,a],[,b])=>b-a)
  let max = _.max(list.map(([,a])=>a))
  return list.map(([od,w])=>`  ${$('ore', od, 0, Math.max(1,(w/max*64)|0), null, '.firstItem')},`)
}*/
  <ore:oreCoal>.firstItem * 64,
  <ore:oreIron>.firstItem * 30,
  <ore:oreTin>.firstItem * 18,
  <ore:oreCopper>.firstItem * 13,
  <ore:oreLead>.firstItem * 12,
  <ore:oreOsmium>.firstItem * 11,
  <ore:oreRedstone>.firstItem * 8,
  <ore:oreAluminum>.firstItem * 7,
  <ore:oreBoron>.firstItem * 7,
  <ore:oreLithium>.firstItem * 7,
  <ore:oreMagnesium>.firstItem * 7,
  <ore:oreThorium>.firstItem * 7,
  <ore:oreGold>.firstItem * 6,
  <ore:oreUranium>.firstItem * 6,
  <ore:oreCertusQuartz>.firstItem * 6,
  <ore:oreNickel>.firstItem * 3,
  <ore:oreDiamond>.firstItem * 2,
  <ore:oreSilver>.firstItem * 2,
  <ore:oreLapis>.firstItem,
  <ore:oreEmerald>.firstItem,
  <ore:oreMithril>.firstItem,
  <ore:orePlatinum>.firstItem,
/**/
] as IItemStack[];

k = 0;
for _y in 0 .. (mineralisList.length / 9 + 1) as int {
  for _x in 0 .. 9 {
    x.setJEIItemSlot(_x, _y, 'output'~k);
    k += 1;
  }
}

add(x, {[] : mineralisList});


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:chemthrower>;
x.addJEICatalyst(<immersiveengineering:chemthrower>);
x.addJEICatalyst(<immersiveengineering:metal_device1:10>);
x.setJEIFluidSlot(0, 0, 'fluid_in');
x.setJEIDurationSlot(2,0,"duration", SlotVisual.arrowRight());
addInsOuts(x, [[1,0]], [[3,0]]);

function addChemthrower(fluid as ILiquidStack, blockInput as IIngredient, output as IItemStack) as void {
  val rec = AssemblyRecipe.create(function(c) {
    c.addItemOutput('output0', output);
  });
  rec.requireFluid("fluid_in", fluid);
  if(!isNull(blockInput)) rec.requireItem("input0", blockInput);
  
  <assembly:chemthrower>.addJEIRecipe(rec);
}

addChemthrower(<fluid:concrete>, null, <immersiveengineering:stone_decoration:9>);


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:expire_in_block>;
x.addJEICatalyst(<biomesoplenty:blue_fire>);
x.addJEICatalyst(<cyclicmagic:fire_frost>);
x.addJEICatalyst(<cyclicmagic:fire_dark>);
x.addJEICatalyst(<enderio:item_cold_fire_igniter>.withTag({"enderio:famount": 1000}));
x.addJEICatalyst(<cyclicmagic:fire_starter>);
x.addJEICatalyst(<cyclicmagic:ender_blaze>);
x.setJEIDurationSlot(2,0,"duration", getVisSlots(5,1));
addInsOuts(x, [[0,0],[1,0]], [[3,0]]);

function add_expire_in_block(input as IIngredient, block as IItemStack, output as IItemStack) as void {
  <assembly:expire_in_block>.addJEIRecipe(AssemblyRecipe.create(function(c) {
      c.addItemOutput('output0', output);
    })
    .requireItem("input0", input)
    .requireItem("input1", block)
    .requireDuration("duration", 20*60*5)
  );
}


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:barrel_milking>;
x.addJEICatalyst(<exnihilocreatio:block_barrel0>);
x.addJEICatalyst(<exnihilocreatio:block_barrel1>);
x.setJEIItemSlot(0, 0, 'input0');
x.setJEIFluidSlot(2, 0, 'fluid_out');
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());

function add_barrel_milking(input as IIngredient, output as ILiquidStack, duration as int) as void {
  <assembly:barrel_milking>.addJEIRecipe(AssemblyRecipe.create(function(c) {
      c.addFluidOutput('fluid_out', output);
    })
    .requireItem("input0", input)
    .requireDuration("duration", max(1, duration))
  );
}


/*Inject_js(
loadJson("config/exnihilocreatio/MilkEntityRegistry.json")
.map(o=>[
  `add_barrel_milking(Soul("${o.entityOnTop}")`,
  `, <liquid:${o.result}>`, ` * ${o.amount}`,
  `, ${o.coolDown});`
])
)*/
add_barrel_milking(Soul("minecraft:cow")                  , <liquid:milk>               * 10  , 20);
add_barrel_milking(Soul("betteranimalsplus:jellyfish")    , <liquid:distwater>          * 1000, 20);
add_barrel_milking(Soul("emberroot:timberwolf")           , <liquid:tree_oil>           * 10  , 20);
add_barrel_milking(Soul("emberroot:rainbow_golem")        , <liquid:construction_alloy> * 10  , 20);
add_barrel_milking(Soul("excompressum:angry_chicken")     , <liquid:fiery_essence>      * 10  , 20);
add_barrel_milking(Soul("emberroot:skeleton_frozen")      , <liquid:ice>                * 10  , 20);
add_barrel_milking(Soul("betteranimalsplus:walrus")       , <liquid:lubricant>          * 10  , 20);
add_barrel_milking(Soul("mekanism:robit")                 , <liquid:electronics>        * 10  , 20);
add_barrel_milking(Soul("endreborn:watcher")              , <liquid:obsidian>           * 40  , 20);
add_barrel_milking(Soul("betteranimalsplus:hirschgeist")  , <liquid:platinum>           * 10  , 20);
add_barrel_milking(Soul("industrialforegoing:pink_slime") , <liquid:if.pink_slime>      * 10  , 20);
add_barrel_milking(Soul("rats:neo_ratlantean")            , <liquid:crystal_matrix>     * 1   , 20);
add_barrel_milking(Soul("draconicevolution:chaosguardian"), <liquid:chaotic_metal>      * 10  , 20);
add_barrel_milking(Soul("iceandfire:if_cockatrice")       , <liquid:gelatin>            * 10  , 20);
/**/


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:entity_kill_entity>;
x.addJEICatalyst(<randomthings:slimecube>);
addInsOuts(x, [[0,0],[2,0]], [[4,0]]);
x.setJEIDurationSlot(1,0,"duration0", getVisGauge(3,6));
x.setJEIDurationSlot(3,0,"duration1", SlotVisual.arrowRight());

function add_entity_kill_entity(entity1 as IIngredient, entity2 as IIngredient, output as IItemStack) as void {
  add(<assembly:entity_kill_entity>, {[entity1, entity2] as IIngredient[] : [output]});
}


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:special_craft>;
x.addJEICatalyst(<minecraft:crafting_table>);
x.setJEIDurationSlot(3,1,"duration", SlotVisual.arrowRight());
addInsOuts(x, [
  [0,0],[1,0],[2,0],
  [0,1],[1,1],[2,1],
  [0,2],[1,2],[2,2],
], [[4,1],[5,1]]);

function add_special_craft(output as IItemStack, input2d as IIngredient[][], condition as string) as void {
  val assRec = AssemblyRecipe.create(function(container) {
    container.addItemOutput("output0", output);
    container.addItemOutput("output1", <engineersdecor:sign_caution>.withDisplayName("§e§lCondition").withLore(["§e" ~ condition]));
  });
  for y, input1d in input2d {
    for x, ingr in input1d {
      if(isNull(ingr)) continue;
      assRec.requireItem("input"~(y*3+x), ingr);
    }
  }
  <assembly:special_craft>.addJEIRecipe(assRec);
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:ic2_crops>;
x.addJEICatalyst(<ic2:crop_stick>);
x.addJEICatalyst(<ic2:te:58>);
x.addJEICatalyst(<ic2:crop_seed_bag>);
x.setJEIDurationSlot(2,0,"duration", getVisSlots(11,1));
x.setJEIItemSlot(1, 0, 'input1', getVisSlots(0,2));
addInsOuts(x, [[0,0]], [[3,0],[4,0],[5,0],[6,0]]);

static glyphs as IItemStack[] = [
  <openblocks:glyph:48>, <openblocks:glyph:49>, <openblocks:glyph:50>,
  <openblocks:glyph:51>, <openblocks:glyph:52>, <openblocks:glyph:53>,
  <openblocks:glyph:54>, <openblocks:glyph:55>, <openblocks:glyph:56>,
  <openblocks:glyph:57>, <openblocks:glyph:65>, <openblocks:glyph:66>,
  <openblocks:glyph:67>, <openblocks:glyph:68>, <openblocks:glyph:69>,
  <openblocks:glyph:70>,
] as IItemStack[];

function add_ic2_crops(id as string, drops as IItemStack[], tier as int, attributes as string, requirments as string = null) as void {
  val seed = <ic2:crop_seed_bag>.withTag({owner: "ic2", scan: 1 as byte, growth: 1 as byte, id: id, resistance: 1 as byte, gain: 1 as byte});
  add(<assembly:ic2_crops>, {[
    isNull(requirments) ? seed : seed.withLore(["§6§lRequirments: ", requirments]),
    glyphs[tier].withDisplayName("§bTier: "~tier).withLore(["§e§lAttributes: ", "§e" ~ attributes])
  ] : drops});
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:asteroids>;
x.addJEICatalyst(<advancedrocketry:asteroidchip>);
x.setJEIDurationSlot(1,0,"duration", getVisGauge(3,1));
addInsOuts(x, [[0,0]], [[2,0],[3,0],[4,0]]);

function addAsteroid(name as string, values as double[], output as IItemStack[]) as void {
  add(<assembly:asteroids>, {[<advancedrocketry:asteroidchip>.withLore([
    "§8Distance: §b" ~ values[0],
    "§8Mass: §b" ~ values[1],
    "§8Mass variability: §b" ~ values[2],
    "§8Probability: §b" ~ values[3],
    "§8Richness: §b" ~ values[4],
    "§8Richness variability: §b" ~ values[5],
    ]).withDisplayName("§6" + name)] as IIngredient[] :
    output
  });
}

/*Inject_js(
xml_to_js(loadText('config/advRocketry/asteroidConfig.xml')).elements[0].elements.map(
  (asteroid) => [`addAsteroid("${asteroid.attributes.name}"`, `, [${
      Object.entries(asteroid.attributes)
      .filter(([key]) => key !== 'name')
      .sort(([a],[b])=>a.length-b.length)
      .map(([,val]) => val)
      .join(', ')}]`, `, [${
      asteroid.elements
      .map((item) => `<${
        String(item.attributes.itemStack).replace(' ', ':')
      }>.withLore(["§8Chance: §b${item.attributes.chance}"])`)
      .join(', ')}]);`]
))*/
addAsteroid("Iridium Enriched asteroid"     , [25, 100, 0.8, 3, 10, 0.2], [<minecraft:iron_ore>.withLore(["§8Chance: §b25"]), <thermalfoundation:ore:7>.withLore(["§8Chance: §b25"])]);
addAsteroid("Draconium asteroid"            , [64, 75, 0.7, 5, 1, 0.5]  , [<draconicevolution:draconium_ore>.withLore(["§8Chance: §b100"])]);
addAsteroid("Prosperity asteroid"           , [64, 75, 0.7, 5, 1, 0.5]  , [<mysticalagriculture:prosperity_ore>.withLore(["§8Chance: §b100"])]);
addAsteroid("Dimensional Shard asteroid"    , [64, 75, 0.7, 5, 1, 0.5]  , [<rftools:dimensional_shard_ore>.withLore(["§8Chance: §b100"])]);
addAsteroid("Emerald asteroid"              , [64, 75, 0.7, 5, 1, 0.5]  , [<minecraft:emerald_ore>.withLore(["§8Chance: §b100"])]);
addAsteroid("Mana Infused asteroid"         , [64, 75, 0.7, 5, 1, 0.5]  , [<thermalfoundation:ore:8>.withLore(["§8Chance: §b100"])]);
addAsteroid("Destabilized Redstone asteroid", [64, 75, 0.7, 5, 1, 0.5]  , [<thermalfoundation:ore_fluid:2>.withLore(["§8Chance: §b100"])]);
addAsteroid("Energized Netherrack asteroid" , [64, 75, 0.7, 5, 1, 0.5]  , [<thermalfoundation:ore_fluid:3>.withLore(["§8Chance: §b100"])]);
addAsteroid("Resonant End Stone asteroid"   , [64, 75, 0.7, 5, 1, 0.5]  , [<thermalfoundation:ore_fluid:4>.withLore(["§8Chance: §b100"])]);
addAsteroid("Dilithium asteroid"            , [64, 75, 0.7, 5, 1, 0.5]  , [<netherendingores:ore_end_modded_1:14>.withLore(["§8Chance: §b100"])]);
addAsteroid("Titanium asteroid"             , [64, 75, 0.7, 5, 1, 0.5]  , [<libvulpes:ore0:8>.withLore(["§8Chance: §b100"])]);
addAsteroid("Starmetal asteroid"            , [64, 75, 0.7, 5, 1, 0.5]  , [<astralsorcery:blockcustomore:1>.withLore(["§8Chance: §b100"])]);
addAsteroid("Rock Crystal asteroid"         , [64, 75, 0.7, 5, 1, 0.5]  , [<astralsorcery:blockcustomore>.withLore(["§8Chance: §b100"])]);
addAsteroid("Steel asteroid"                , [64, 75, 0.3, 7, 1, 0.2]  , [<thermalfoundation:storage_alloy>.withLore(["§8Chance: §b100"])]);
/**/


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:beacon_effects>;
x.addJEICatalyst(<minecraft:beacon>);
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
addInsOuts(x, [[0,0], [0,1]], [[2,0],[3,0]]);

val glyphs = {
  '1': <openblocks:glyph:49>,
  '2': <openblocks:glyph:50>,
  '3': <openblocks:glyph:51>,
  '4': <openblocks:glyph:52>,
} as IItemStack[string];

/*Inject_js(
config('config/quark.cfg')
.misc['extra potions']['Beacon Replacements'].map((l) => l.split(','))
.sort(([,,a1,a2],[,,b1,b2])=>(+a1)-(+b1)||(+a2)-(+b2))
.map(
  ([id, meta, level, pos, potion]) => {
    const item = id === 'immersiveengineering:conveyor'
      ? `<immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:verticalcovered"})`
      : `<${id}:${meta == -1 ? '*' : meta}>`
    return `add(x, {[${item.padStart(40)}, glyphs['${
      Number(level) + 1
    }']] : [${pos==1?'null, ':''}<minecraft:potion>.withTag({Potion: "${potion.replace('minecraft:health_boost','potioncore:health_boost')}"})]});`
}))*/
add(x, {[   <draconicevolution:draconium_block:0>, glyphs['1']] : [<minecraft:potion>.withTag({Potion: "potioncore:diamond_skin"})]});
add(x, {[            <minecraft:redstone_block:*>, glyphs['1']] : [<minecraft:potion>.withTag({Potion: "potioncore:extension"})]});
add(x, {[        <twilightforest:block_storage:0>, glyphs['1']] : [<minecraft:potion>.withTag({Potion: "potioncore:solid_core"})]});
add(x, {[              <thaumcraft:metal_brass:*>, glyphs['1']] : [null, <minecraft:potion>.withTag({Potion: "minecraft:absorption"})]});
add(x, {[  <endreborn:block_decorative_lormyte:*>, glyphs['1']] : [null, <minecraft:potion>.withTag({Potion: "potioncore:step_up"})]});
add(x, {[          <tconstruct:slime_congealed:0>, glyphs['2']] : [<minecraft:potion>.withTag({Potion: "potioncore:recoil"})]});
add(x, {[              <thaumcraft:amber_block:*>, glyphs['2']] : [<minecraft:potion>.withTag({Potion: "potioncore:health_boost"})]});
add(x, {[        <scalingfeast:exhaustingblock:*>, glyphs['2']] : [<minecraft:potion>.withTag({Potion: "scalingfeast:hungerplus"})]});
add(x, {[    <twilightforest:knightmetal_block:*>, glyphs['2']] : [null, <minecraft:potion>.withTag({Potion: "potioncore:repair"})]});
add(x, {[           <twilightforest:huge_stalk:*>, glyphs['2']] : [null, <minecraft:potion>.withTag({Potion: "cyclicmagic:slowfall"})]});
add(x, {[        <twilightforest:block_storage:4>, glyphs['3']] : [<minecraft:potion>.withTag({Potion: "potioncore:magic_focus"})]});
add(x, {[          <endreborn:block_wolframium:*>, glyphs['3']] : [<minecraft:potion>.withTag({Potion: "potioncore:archery"})]});
add(x, {[<immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:verticalcovered"}), glyphs['4']] : [<minecraft:potion>.withTag({Potion: "potioncore:climb"})]});
add(x, {[              <plustic:osgloglasblock:*>, glyphs['4']] : [<minecraft:potion>.withTag({Potion: "cyclicmagic:potion.magnet"})]});
add(x, {[  <contenttweaker:conglomerate_of_sun:*>, glyphs['4']] : [<minecraft:potion>.withTag({Potion: "potioncore:flight"})]});
add(x, {[ <contenttweaker:conglomerate_of_life:*>, glyphs['4']] : [<minecraft:potion>.withTag({Potion: "potioncore:revival"})]});
add(x, {[ <contenttweaker:conglomerate_of_coal:*>, glyphs['4']] : [<minecraft:potion>.withTag({Potion: "potioncore:reach"})]});
/**/

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:crafting_hints>;
x.addJEICatalyst(<minecraft:item_frame>);
x.setJEIDurationSlot(4,1,"duration", SlotVisual.arrowRight());
addInsOuts(x, [
        [4,0],
  [0,0],[1,0],[2,0],
  [0,1],[1,1],[2,1],
  [0,2],[1,2],[2,2],
], [
  [6,1],[7,1],[8,1],
]);
x.setJEIItemSlot(4, 0, 'input0', getVisSlots(0,2));
x.setJEIFluidSlot(1, 3, 'fluid_in');
x.setJEIFluidSlot(7, 2, 'fluid_out');

function addCraftingHint_single(input as IIngredient, output as IItemStack, catalyst as IIngredient = null) as void {
  add(<assembly:crafting_hints>, {
    [catalyst, null, null, null, null, input] : [null, output]
  });
}

addCraftingHint_single(<thaumcraft:cluster:1>, <minecraft:gold_ingot> * 8, Soul('randomthings:goldenchicken'));
addCraftingHint_single(Soul("minecraft:zombie"), <bloodmagic:blood_shard>, <bloodmagic:bound_sword>.withTag({Unbreakable: 1 as byte, activated: 1 as byte}));

x.addJEIRecipe(AssemblyRecipe.create(function(c) {
  c.addFluidOutput('fluid_out', <liquid:canolaoil> * 80);})
  .requireItem("input0", <actuallyadditions:block_canola_press>)
  .requireItem("input5", <actuallyadditions:item_misc:13>)
);
x.addJEIRecipe(AssemblyRecipe.create(function(c) {
  c.addFluidOutput('fluid_out', <liquid:refinedcanolaoil> * 80);})
  .requireFluid("fluid_in", <liquid:canolaoil> * 80)
  .requireItem("input0", <actuallyadditions:block_fermenting_barrel>)
);
x.addJEIRecipe(AssemblyRecipe.create(function(c) {
  c.addFluidOutput('fluid_out', <liquid:blockfluidantimatter> * 1000);})
  .requireFluid("fluid_in", <liquid:lifeessence> * 1000)
  .requireItem("input0", <cyclicmagic:ender_lightning>)
);

add(x, {[null, null, null, null, <exnihilocreatio:item_material:3>, <minecraft:dirt:*>] : [null, <minecraft:mycelium>]});

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:pech_trades>;
x.addJEICatalyst(Soul('thaumcraft:pech'));
x.setJEIItemSlot(3, 0, 'input0');

// Diamonds
for _y in 0 .. 5 {
  x.setJEIItemSlot(0, _y+1, 'input1'~_y, getVisSlots(0,1));
}

// Main outputs
k = 0;
for _y in 0 .. 5 {
  for _x in 0 .. 6 {
    x.setJEIItemSlot(_x+1, _y+1, 'output'~_x~_y);
    k += 1;
  }
}

val pechTrades = {
/*Inject_js(
loadText('config/thaumtweaks_pech_trades.txt')
  .replace(/#[\s\S\n]+/gm, '') // Remove custom comment
  .replace(/\s*\/\/.*$/gm, '') // Remove inline comment
  .trim()
  .replace(/\n\s*\d+:/gm, '\n  ], [')
  .replace(/^\s+(\w+:[^\s]+)/gm, '    <$1>') // Item
  .replace(/\s+(\{.*\})/gm, ".withTag(sNBT('$1'))") // Tag
  .replace(/\s+(\d+)$/gm, ' * $1') // Weight
  .replace(/^(\s{4}.*)/gm, '$1,') // Commas
  .replace(/^(\w+:)\n\s+\], /gm, '  ]],\n$1 [') // Excess brackets
  .replace(/\s+\]\],\n/, '') + // Excess at start
'\n]]'
)*/
MINER: [[
    <extrautils2:compressedcobblestone:2>,
    <jaopca:item_clustertungsten>,
    <thaumcraft:cluster:4>,
    <jaopca:item_clusterdraconium>,
    <jaopca:item_clustertitanium>,
    <jaopca:item_clusterruby>,
  ], [
    <extrautils2:compresseddirt:2>,
    <jaopca:item_clusteriridium>,
    <jaopca:item_clusterastralstarmetal>,
    <thaumcraft:thaumium_pick>,
    <thaumcraft:thaumium_shovel>,
    <thaumcraft:thaumium_axe>,
  ], [
    <extrautils2:compressednetherrack:2>,
    <jaopca:item_clustermithril>,
    <jaopca:item_clustertanzanite>,
    <astralsorcery:blockcelestialcrystals:4>,
    <thaumcraft:turret:2>,
    <twilightforest:ore_magnet>,
  ], [
    <astralsorcery:blockcustomore>,
    <thaumicwonders:transmuter_stone>,
    <twilightforest:twilight_sapling:7>,
    <cyclicmagic:storage_bag>,
    <thaumcraft:elemental_pick>.withTag(sNBT('{infench:[{lvl:1s,id:4s},{lvl:2s,id:3s}]}')),
    <actuallyadditions:quartz_paxel>,
  ], [
    <bloodmagic:demon_crystal>,
    <thaumicwonders:eldritch_cluster:4>,
    <thaumicwonders:eldritch_cluster:6>,
    <astralsorcery:blockgemcrystals:2>,
    <astralsorcery:blockgemcrystals:3>,
    <astralsorcery:blockgemcrystals:4>,
  ]],
MAGE: [[
    <thaumcraft:phial:1>.withTag(sNBT('{Aspects: [{amount: 10, key: "aer"}]}')),
    <thaumcraft:phial:1>.withTag(sNBT('{Aspects: [{amount: 10, key: "terra"}]}')),
    <thaumcraft:phial:1>.withTag(sNBT('{Aspects: [{amount: 10, key: "ignis"}]}')),
    <thaumcraft:phial:1>.withTag(sNBT('{Aspects: [{amount: 10, key: "aqua"}]}')),
    <thaumcraft:phial:1>.withTag(sNBT('{Aspects: [{amount: 10, key: "perditio"}]}')),
    <thaumcraft:phial:1>.withTag(sNBT('{Aspects: [{amount: 10, key: "ordo"}]}')),
  ], [
    <thaumcraft:cloth_chest>,
    <thaumcraft:cloth_legs>,
    <thaumcraft:cloth_boots>,
    <thaumcraft:thaumometer>,
    <darkutils:charm_null>,
    <darkutils:charm_portal>,
  ], [
    <thaumcraft:goggles>,
    <thaumcraft:baubles:3>,
    <conarm:travel_soul>,
    <cyclicmagic:charm_antidote>,
    <cyclicmagic:charm_boat>,
    <cyclicmagic:charm_fire>,
  ], [
    <thaumcraft:lamp_arcane>,
    <twilightforest:charm_of_life_2>,
    <twilightforest:charm_of_keeping_3>,
    <iceandfire:pixie_dust>,
    <extrautils2:ingredients:12>,
    <thaumicwonders:panacea:1>,
  ], [
    <thaumcraft:pech_wand>,
    <thaumcraft:amulet_vis>,
    <thaumcraft:charm_undying>,
    <botania:overgrowthseed>,
    <randomthings:beans:2>,
    <mysticalagriculture:growth_accelerator>,
  ]],
ARCHER: [[
    <forestry:hunter_bag>,
    <cyclicmagic:water_candle>,
    <rats:rat_arrow>,
    <forestry:hunter_bag_t2>,
    <thaumcraft:candle_white>,
    <cyclicmagic:sleeping_mat>,
  ], [
    <cyclicmagic:sack_ender>,
    <rustic:silver_lantern>,
    <cyclicmagic:glove_climb>,
    <cyclicmagic:wand_missile>,
    <minecraft:enchanted_book>.withTag(sNBT('{StoredEnchantments: [{lvl: 1s, id: 51}]}')),
    <minecraft:enchanted_book>.withTag(sNBT('{StoredEnchantments: [{lvl: 1s, id: 78}]}')),
  ], [
    <tconstruct:bow_string>.withTag(sNBT('{Material: "soularium"}')),
    <tconstruct:bow_limb>.withTag(sNBT('{Material: "ghostwood"}')),
    <tconstruct:bow_limb>.withTag(sNBT('{Material: "ionite"}')),
    <cyclicmagic:ender_lightning>,
    <tconstruct:bow_string>.withTag(sNBT('{Material: "fluxed_string"}')),
    <endreborn:item_ender_string>,
  ], [
    <conarm:travel_sack>,
    <tconstruct:bow_string>.withTag(sNBT('{Material: "spectre_string"}')),
    <tconstruct:bow_limb>.withTag(sNBT('{Material: "aethium"}')),
    <tconstruct:bow_limb>.withTag(sNBT('{Material: "gelid_gem"}')),
    <cyclicmagic:wand_hypno>,
    <minecraft:enchanted_book>.withTag(sNBT('{StoredEnchantments: [{lvl: 1s, id: 70}]}')),
  ], [
    <minecraft:dragon_breath>,
    <cyclicmagic:storage_bag>,
    <thaumicwonders:bone_bow>,
    <minecraft:enchanted_book>.withTag(sNBT('{StoredEnchantments: [{lvl: 10s, id: 48}]}')),
    <minecraft:enchanted_book>.withTag(sNBT('{StoredEnchantments: [{lvl: 4s, id: 49}]}')),
    <minecraft:enchanted_book>.withTag(sNBT('{StoredEnchantments: [{lvl: 6s, id: 65}]}')),
  ]],
COMMON: [[
    <mysticalagriculture:inferium_apple> * 2,
    <extrautils2:magicapple> * 4,
    <thaumcraft:curio:1> * 4,
    <rustic:fluid_bottle>.withTag(sNBT('{Fluid: {FluidName: "ironwine", Amount: 1000, Tag: {Quality: 1.0f}}}')),
    <rustic:fluid_bottle>.withTag(sNBT('{Fluid: {FluidName: "wine", Amount: 1000, Tag: {Quality: 1.0f}}}')),
    <rustic:fluid_bottle>.withTag(sNBT('{Fluid: {FluidName: "mead", Amount: 1000, Tag: {Quality: 1.0f}}}')),
  ], [
    <mysticalagriculture:prudentium_apple>,
    <bhc:relic_apple> * 4,
    <thaumcraft:curio:5> * 4,
    <scalingfeast:exhaustingapple> * 5,
    <cyclicmagic:apple>,
    <thaumcraft:lamp_arcane>,
  ], [
    <mysticalagriculture:intermedium_apple>,
    <minecraft:golden_apple> * 4,
    <thaumcraft:curio> * 4,
    <thaumcraft:curio:2> * 4,
    <thaumadditions:dawn_totem>,
    <thaumadditions:twilight_totem>,
  ], [
    <mysticalagriculture:superium_apple>,
    <minecraft:golden_apple:1>,
    <thaumcraft:curio:4> * 5,
    <thaumcraft:sanity_soap>,
    <thaumcraft:mechanism_complex>,
    <bloodmagic:soul_snare>,
  ], [
    <mysticalagriculture:supremium_apple>,
    <scalingfeast:enchantedironapple>,
    <thaumcraft:curio:3> * 6,
    <thaumadditions:zeith_fur> * 3,
    <minecraft:totem_of_undying> * 3,
    <thaumadditions:jar_eldritch>,
]]
/**/
} as IItemStack[][][string];

val pechOrder = [
  "MINER",
  "MAGE",
  "ARCHER",
  "COMMON",
] as string[];

val pechRepresentation = {
  MINER: <minecraft:stone_pickaxe>,
  MAGE: <betterbuilderswands:wandstone>,
  ARCHER: <minecraft:bow>,
  COMMON: <thaumcraft:stone_arcane>,
} as IItemStack[string];

val pechDiamonds = [
  <rats:rat_diamond>,
  <minecraft:diamond>,
  <actuallyadditions:item_crystal:2>,
  <minecraft:diamond_block>,
  <additionalcompression:gemdiamond_compressed:1>,
] as IItemStack[];

for i, kind in pechOrder {
  val assRec = AssemblyRecipe.create(function(container) {
    for y, arr1d in pechTrades[kind] {
      for x, output in arr1d {
        if(isNull(output)) continue;
        container.addItemOutput("output" ~ x ~ y, output);
      }
    }
  });
  assRec.requireItem("input0", pechRepresentation[kind]);
  for j in 0 .. 5 { assRec.requireItem("input1"~j, pechDiamonds[j]); }
  x.addJEIRecipe(assRec);
}


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:ic2_semifluid>;
x.addJEICatalyst(<ic2:te:7>);
x.setJEIFluidSlot(0, 0, 'fluid_in');
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
x.setJEIEnergySlot(2, 0, 'energy_out', "rf");

function add_ic2_semifluid(input as ILiquidStack, power as int) as void {
  <assembly:ic2_semifluid>.addJEIRecipe(AssemblyRecipe.create(function(c) {
      c.addEnergyOutput('energy_out', power * 4, 0);
    })
    .requireFluid("fluid_in", input)
  );
}

# Defaults
add_ic2_semifluid(<fluid:biomass>    , 8000);
add_ic2_semifluid(<fluid:ic2biogas>  , 16000);
add_ic2_semifluid(<fluid:bio.ethanol>, 32000);
