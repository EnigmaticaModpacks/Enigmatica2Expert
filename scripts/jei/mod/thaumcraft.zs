#priority 950
#modloaded thaumcraft

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import mods.requious.SlotVisual;


var x = <assembly:infernal_furnace>;
x.addJEICatalyst(<thaumcraft:infernal_furnace>);
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
x.setJEIDurationSlot(2,0,"duration", scripts.jei.requious.getVisGauge(1,13));
scripts.jei.requious.addInsOuts(x, [[0,0]], [[3,0],[4,0],[5,0],[6,0]]);

val RE = <thaumcraft:nugget:10>;

function infFurLore(outs as WeightedItemStack[], i as int) as IItemStack {
  if(i >= outs.length) return null;
  return outs[i].stack.withLore(["§d§l" ~ outs[i].percent as int ~ "%"]);
}

function addInfFur(input as IIngredient, outs as WeightedItemStack[]) {
  scripts.jei.requious.add(<assembly:infernal_furnace>, {[input] as IIngredient[]: [
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
addInfFur(<jaopca:item_clusteraluminium>           , [RE % 2, <thermalfoundation:material:196> % 33, <jaopca:item_nuggetaquamarine> * 13 % 32]);
addInfFur(<jaopca:item_clusteramber>               , [RE % 2, <jaopca:item_nuggetamber> % 33, <thermalfoundation:material:16> * 6 % 32]);
addInfFur(<jaopca:item_clusteramethyst>            , [RE % 2, <jaopca:item_nuggetamethyst> % 33, <jaopca:item_nuggetchargedcertusquartz> * 6 % 32]);
addInfFur(<jaopca:item_clusterapatite>             , [RE % 2, <jaopca:item_nuggetapatite> % 33, <jaopca:item_nuggetmagnesium> * 4 % 32]);
addInfFur(<jaopca:item_clusteraquamarine>          , [RE % 2, <jaopca:item_nuggetaquamarine> % 33, <thermalfoundation:material:17> * 6 % 32]);
addInfFur(<jaopca:item_clusterardite>              , [RE % 2, <tconstruct:nuggets:1> % 33, <minecraft:gold_nugget> * 4 % 32]);
addInfFur(<jaopca:item_clusterastralstarmetal>     , [RE % 2, <jaopca:item_nuggettungsten> * 4 % 32, <jaopca:item_nuggetastralstarmetal> % 33]);
addInfFur(<jaopca:item_clusterboron>               , [RE % 2, <jaopca:item_nuggetboron> % 33, <jaopca:item_nuggetlithium> * 4 % 32]);
addInfFur(<jaopca:item_clustercertusquartz>        , [RE % 2, <jaopca:item_nuggetcertusquartz> % 33, <thermalfoundation:material:16> * 6 % 32]);
addInfFur(<jaopca:item_clusterchargedcertusquartz> , [RE % 2, <jaopca:item_nuggettopaz> * 6 % 32, <jaopca:item_nuggetchargedcertusquartz> % 33]);
addInfFur(<jaopca:item_clustercoal>                , [RE % 2, <thaumcraft:nugget:9> * 9 % 32]);
addInfFur(<jaopca:item_clustercobalt>              , [RE % 2, <tconstruct:nuggets> % 33, <thermalfoundation:material:197> * 4 % 32]);
addInfFur(<jaopca:item_clusterdiamond>             , [RE % 2, <thermalfoundation:material:16> % 33, <jaopca:item_nuggetmalachite> * 6 % 32]);
addInfFur(<jaopca:item_clusterdilithium>           , [RE % 2, <jaopca:item_nuggetdilithium> % 33, <jaopca:item_nuggetdimensionalshard> * 9 % 32]);
addInfFur(<jaopca:item_clusterdimensionalshard>    , [RE % 2, <jaopca:item_nuggetperidot> * 6 % 32, <jaopca:item_nuggetdimensionalshard> % 33]);
addInfFur(<jaopca:item_clusterdraconium>           , [RE % 2, <draconicevolution:nugget> % 33, <jaopca:item_nuggetastralstarmetal> * 4 % 32]);
addInfFur(<jaopca:item_clusteremerald>             , [RE % 2, <thermalfoundation:material:17> % 33, <jaopca:item_nuggettanzanite> * 6 % 32]);
addInfFur(<jaopca:item_clusteriridium>             , [RE % 2, <mekanism:nugget:1> * 4 % 32, <thermalfoundation:material:199> % 33]);
addInfFur(<jaopca:item_clusterlapis>               , [RE % 2, <jaopca:item_nuggetlapis> % 33, <jaopca:item_nuggetsapphire> * 6 % 32]);
addInfFur(<jaopca:item_clusterlithium>             , [RE % 2, <jaopca:item_nuggetlithium> % 33, <jaopca:item_nuggettopaz> * 6 % 32]);
addInfFur(<jaopca:item_clustermagnesium>           , [RE % 2, <jaopca:item_nuggetmagnesium> % 33, <thermalfoundation:material:192> * 4 % 32]);
addInfFur(<jaopca:item_clustermalachite>           , [RE % 2, <jaopca:item_nuggetmalachite> % 33, <thermalfoundation:material:192> * 4 % 32]);
addInfFur(<jaopca:item_clustermithril>             , [RE % 2, <thermalfoundation:material:200> % 33, <jaopca:item_nuggetastralstarmetal> * 4 % 32]);
addInfFur(<jaopca:item_clusternickel>              , [RE % 2, <mekanism:nugget:1> * 4 % 32, <thermalfoundation:material:197> % 33]);
addInfFur(<jaopca:item_clusterosmium>              , [RE % 2, <mekanism:nugget:1> % 33, <thermalfoundation:material:198> * 4 % 32]);
addInfFur(<jaopca:item_clusterperidot>             , [RE % 2, <jaopca:item_nuggetperidot> % 33, <thermalfoundation:material:16> * 6 % 32]);
addInfFur(<jaopca:item_clusterplatinum>            , [RE % 2, <thermalfoundation:material:198> % 33, <thermalfoundation:material:199> * 4 % 32]);
addInfFur(<jaopca:item_clusterquartzblack>         , [RE % 2, <jaopca:item_nuggetquartzblack> % 33, <jaopca:item_nuggetaquamarine> * 13 % 32]);
addInfFur(<jaopca:item_clusterredstone>            , [RE % 2, <jaopca:item_nuggetquartzblack> * 6 % 32]);
addInfFur(<jaopca:item_clusterruby>                , [RE % 2, <jaopca:item_nuggetruby> % 33, <jaopca:item_nuggetmagnesium> * 4 % 32]);
addInfFur(<jaopca:item_clustersapphire>            , [RE % 2, <jaopca:item_nuggetsapphire> % 33, <draconicevolution:nugget> * 4 % 32]);
addInfFur(<jaopca:item_clustertanzanite>           , [RE % 2, <jaopca:item_nuggettanzanite> % 33, <thermalfoundation:material:16> * 6 % 32]);
addInfFur(<jaopca:item_clusterthorium>             , [RE % 2, <jaopca:item_nuggetthorium> % 33, <jaopca:item_nuggetboron> * 4 % 32]);
addInfFur(<jaopca:item_clustertitanium>            , [RE % 2, <libvulpes:productnugget:7> % 33, <jaopca:item_nuggetmagnesium> * 4 % 32]);
addInfFur(<jaopca:item_clustertopaz>               , [RE % 2, <jaopca:item_nuggettopaz> % 33, <thaumcraft:nugget:9> * 9 % 32]);
addInfFur(<jaopca:item_clustertrinitite>           , [RE % 2, <jaopca:item_nuggettrinitite> % 33, <jaopca:item_nuggettrinitite> * 4 % 32]);
addInfFur(<jaopca:item_clustertungsten>            , [RE % 2, <jaopca:item_nuggettungsten> % 33, <thermalfoundation:material:199> * 4 % 32]);
addInfFur(<jaopca:item_clusteruranium>             , [RE % 2, <immersiveengineering:metal:25> % 33, <jaopca:item_nuggetlithium> * 4 % 32]);
addInfFur(<jaopca:item_dirtygemaluminium>          , [<jaopca:item_nuggetaquamarine> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemamber>              , [<thermalfoundation:material:16> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemamethyst>           , [<jaopca:item_nuggetchargedcertusquartz> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemapatite>            , [<jaopca:item_nuggetmagnesium> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemaquamarine>         , [<thermalfoundation:material:17> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemardite>             , [<minecraft:gold_nugget> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemastralstarmetal>    , [<jaopca:item_nuggettungsten> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemboron>              , [<jaopca:item_nuggetlithium> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemcertusquartz>       , [<thermalfoundation:material:16> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemchargedcertusquartz>, [<jaopca:item_nuggettopaz> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemcoal>               , [<thaumcraft:nugget:9> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemcobalt>             , [<thermalfoundation:material:197> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemcopper>             , [<minecraft:gold_nugget> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemdiamond>            , [<jaopca:item_nuggetmalachite> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemdilithium>          , [<jaopca:item_nuggetdimensionalshard> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemdimensionalshard>   , [<jaopca:item_nuggetperidot> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemdraconium>          , [<jaopca:item_nuggetastralstarmetal> * 64 % 100]);
addInfFur(<jaopca:item_dirtygememerald>            , [<jaopca:item_nuggettanzanite> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemgold>               , [<thermalfoundation:material:196> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemiridium>            , [<mekanism:nugget:1> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemiron>               , [<minecraft:gold_nugget> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemlapis>              , [<jaopca:item_nuggetsapphire> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemlead>               , [<thermalfoundation:material:194> * 64 % 100]);
addInfFur(<jaopca:item_dirtygemlithium>            , [<jaopca:item_nuggettopaz> * 64 % 100]);
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
addInfFur(<jaopca:item_dirtygemtrinitite>          , [<jaopca:item_nuggettrinitite> * 64 % 100]);
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
addInfFur(<thaumcraft:cluster:0>                   , [RE % 2]);
addInfFur(<thaumcraft:cluster:1>                   , [RE % 2, <minecraft:gold_nugget> % 33, <thermalfoundation:material:196> * 4 % 32]);
addInfFur(<thaumcraft:cluster:2>                   , [RE % 2, <thaumcraft:nugget:1> % 33, <minecraft:gold_nugget> * 4 % 32, <thermalfoundation:material:192> * 2 % 32]);
addInfFur(<thaumcraft:cluster:3>                   , [RE % 2, <thaumcraft:nugget:2> % 33, <thermalfoundation:material:193> * 2 % 32, <thermalfoundation:material:195> * 4 % 32]);
addInfFur(<thaumcraft:cluster:4>                   , [RE % 2, <thaumcraft:nugget:3> % 33, <minecraft:gold_nugget> * 4 % 32, <thermalfoundation:material:194> * 2 % 32]);
addInfFur(<thaumcraft:cluster:5>                   , [RE % 2, <thaumcraft:nugget:4> % 33, <thermalfoundation:material:195> * 2 % 32, <thermalfoundation:material:194> * 4 % 32]);
addInfFur(<thaumcraft:cluster:6>                   , [RE % 2, <thaumcraft:nugget:5> % 33]);
addInfFur(<thaumcraft:cluster:7>                   , [RE % 2, <thaumcraft:nugget:9> % 33, <thermalfoundation:material:16> * 6 % 32]);
addInfFur(<thaumcraft:cluster>                     , [<minecraft:iron_nugget> % 33, <minecraft:gold_nugget> * 4 % 32]);
addInfFur(<thaumicwonders:eldritch_cluster:0>      , [RE % 2, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:1>      , [RE % 2, <minecraft:gold_nugget> % 33, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:2>      , [RE % 2, <thaumcraft:nugget:1> % 33, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:3>      , [RE % 2, <thaumcraft:nugget:2> % 33, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:4>      , [RE % 2, <thaumcraft:nugget:3> % 33, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:5>      , [RE % 2, <thaumcraft:nugget:4> % 33, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:6>      , [RE % 2, <thaumcraft:nugget:5> % 33, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:7>      , [RE % 2, <thaumcraft:nugget:9> % 33, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster:8>      , [RE % 2, <thaumcraft:nugget:7> % 33, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) % 10]);
addInfFur(<thaumicwonders:eldritch_cluster>        , [<minecraft:iron_nugget> % 33]);
/**/
