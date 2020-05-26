import crafttweaker.item.IItemStack as IItemStack;
import scripts.Processing.saw;


# Planks
recipes.remove(<ore:plankWood>);

saw(<minecraft:log>                  , <minecraft:planks>                   , "only: shapeless");
saw(<minecraft:log:1>                , <minecraft:planks:1>                 , "only: shapeless");
saw(<minecraft:log:2>                , <minecraft:planks:2>                 , "only: shapeless");
saw(<minecraft:log:3>                , <minecraft:planks:3>                 , "only: shapeless");
saw(<minecraft:log2>                 , <minecraft:planks:4>                 , "only: shapeless");
saw(<minecraft:log2:1>               , <minecraft:planks:5>                 , "only: shapeless");
saw(<rustic:log>                     , <rustic:planks>                      , "only: shapeless blockCutter");
saw(<rustic:log:1>                   , <rustic:planks:1>                    , "only: shapeless blockCutter");
saw(<twilightforest:twilight_log>    , <twilightforest:twilight_oak_planks> , "only: shapeless blockCutter");
saw(<twilightforest:twilight_log:1>  , <twilightforest:canopy_planks>       , "only: shapeless blockCutter");
saw(<twilightforest:twilight_log:2>  , <twilightforest:mangrove_planks>     , "only: shapeless blockCutter");
saw(<twilightforest:twilight_log:3>  , <twilightforest:dark_planks>         , "only: shapeless blockCutter");
saw(<twilightforest:magic_log>       , <twilightforest:time_planks>         , "only: shapeless blockCutter");
saw(<twilightforest:magic_log:1>     , <twilightforest:trans_planks>        , "only: shapeless blockCutter");
saw(<twilightforest:magic_log:2>     , <twilightforest:mine_planks>         , "only: shapeless blockCutter");
saw(<twilightforest:magic_log:3>     , <twilightforest:sort_planks>         , "only: shapeless blockCutter");

saw(<extrautils2:ironwood_log>          , <extrautils2:ironwood_planks>      , "except: mekSawmill manufactory");
saw(<extrautils2:ironwood_log:1>        , <extrautils2:ironwood_planks:1>    , "except: mekSawmill manufactory");

saw(<integrateddynamics:menril_log>     , <integrateddynamics:menril_planks> , "only: blockCutter");

saw(<ic2:rubber_wood>                   , <minecraft:planks:4>               , "except: shapeless blockCutter mekSawmill");

saw(<harvestcraft:pamcinnamon>          , <minecraft:planks:3>               , "except: mekSawmill manufactory");
saw(<harvestcraft:pammaple>             , <minecraft:planks:1>               , "except: mekSawmill manufactory");
saw(<harvestcraft:pampaperbark>         , <minecraft:planks:3>               , "except: mekSawmill manufactory");




// saw(, , "");

