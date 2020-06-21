import crafttweaker.item.IItemStack as IItemStack;
import scripts.process.saw;


# Planks
recipes.remove(<ore:plankWood>);

# Vanilla
saw(<minecraft:log>                  , <minecraft:planks>                   , "only: shapeless blockCutter");
saw(<minecraft:log:1>                , <minecraft:planks:1>                 , "only: shapeless blockCutter");
saw(<minecraft:log:2>                , <minecraft:planks:2>                 , "only: shapeless blockCutter");
saw(<minecraft:log:3>                , <minecraft:planks:3>                 , "only: shapeless blockCutter");
saw(<minecraft:log2>                 , <minecraft:planks:4>                 , "only: shapeless blockCutter");
saw(<minecraft:log2:1>               , <minecraft:planks:5>                 , "only: shapeless blockCutter");

# Twilight Forest
saw(<twilightforest:twilight_log>    , <twilightforest:twilight_oak_planks> , "only: shapeless blockCutter");
saw(<twilightforest:twilight_log:1>  , <twilightforest:canopy_planks>       , "only: shapeless blockCutter");
saw(<twilightforest:twilight_log:2>  , <twilightforest:mangrove_planks>     , "only: shapeless blockCutter");
saw(<twilightforest:twilight_log:3>  , <twilightforest:dark_planks>         , "only: shapeless blockCutter");
saw(<twilightforest:magic_log>       , <twilightforest:time_planks>         , "only: shapeless blockCutter");
saw(<twilightforest:magic_log:1>     , <twilightforest:trans_planks>        , "only: shapeless blockCutter");
saw(<twilightforest:magic_log:2>     , <twilightforest:mine_planks>         , "only: shapeless blockCutter");
saw(<twilightforest:magic_log:3>     , <twilightforest:sort_planks>         , "only: shapeless blockCutter");

# Other Mods
saw(<rustic:log>                     , <rustic:planks>                      , "only: shapeless blockCutter");
saw(<rustic:log:1>                   , <rustic:planks:1>                    , "only: shapeless blockCutter");
saw(<extrautils2:ironwood_log>       , <extrautils2:ironwood_planks>        , "except: mekSawmill manufactory");
saw(<extrautils2:ironwood_log:1>     , <extrautils2:ironwood_planks:1>      , "except: mekSawmill manufactory");
saw(<integrateddynamics:menril_log>  , <integrateddynamics:menril_planks>   , "only: blockCutter");
saw(<ic2:rubber_wood>                , <minecraft:planks:4>                 , "except: shapeless mekSawmill");
saw(<harvestcraft:pamcinnamon>       , <minecraft:planks:3>                 , "except: mekSawmill manufactory");
saw(<harvestcraft:pammaple>          , <minecraft:planks:1>                 , "except: mekSawmill manufactory");
saw(<harvestcraft:pampaperbark>      , <minecraft:planks:3>                 , "except: mekSawmill manufactory");

saw(<advancedrocketry:alienwood>, <advancedrocketry:planks>, "except: manufactory mekSawmill");


# saw(, , "");


# BoP Plank recipes, made by Trilexcom
val bopLogsAndPlanks as IItemStack[IItemStack] = {
  <biomesoplenty:log_0:4>: <biomesoplenty:planks_0>,
  <biomesoplenty:log_0:5>: <biomesoplenty:planks_0:1>,
  <biomesoplenty:log_0:6>: <biomesoplenty:planks_0:2>,
  <biomesoplenty:log_0:7>: <biomesoplenty:planks_0:3>,
  <biomesoplenty:log_1:4>: <biomesoplenty:planks_0:4>,
  <biomesoplenty:log_1:5>: <biomesoplenty:planks_0:5>,
  <biomesoplenty:log_1:6>: <biomesoplenty:planks_0:6>,
  <biomesoplenty:log_2:4>: <biomesoplenty:planks_0:8>,
  <biomesoplenty:log_2:5>: <biomesoplenty:planks_0:9>,
  <biomesoplenty:log_2:6>: <biomesoplenty:planks_0:10>,
  <biomesoplenty:log_2:7>: <biomesoplenty:planks_0:11>,
  <biomesoplenty:log_3:4>: <biomesoplenty:planks_0:12>,
  <biomesoplenty:log_3:5>: <biomesoplenty:planks_0:13>,
  <biomesoplenty:log_3:6>: <biomesoplenty:planks_0:14>,
  <biomesoplenty:log_3:7>: <biomesoplenty:planks_0:15>,
  <biomesoplenty:log_1:7>: <biomesoplenty:planks_0:7>,
};

for log, plank in bopLogsAndPlanks {
  saw(log, plank, "only: shapeless, blockCutter");
}


# ThaumCraft Logs -> Planks
saw(<thaumcraft:log_greatwood>, <thaumcraft:plank_greatwood>,  "only: shapeless, blockCutter");
saw(<thaumcraft:log_silverwood>,<thaumcraft:plank_silverwood>, "only: shapeless, blockCutter");

	
# Plank logs and planks, made by TrilexCom
val forestryLogsAndPlanks as IItemStack[IItemStack] = {
  <forestry:logs.0>   : <forestry:planks.0>,
  <forestry:logs.0:1> : <forestry:planks.0:1>,
  <forestry:logs.0:2> : <forestry:planks.0:2>,
  <forestry:logs.0:3> : <forestry:planks.0:3>,
  <forestry:logs.1>   : <forestry:planks.0:4>,
  <forestry:logs.1:1> : <forestry:planks.0:5>,
  <forestry:logs.1:2> : <forestry:planks.0:6>,
  <forestry:logs.1:3> : <forestry:planks.0:7>,
  <forestry:logs.2>   : <forestry:planks.0:8>,
  <forestry:logs.4:2> : <forestry:planks.1:2>,
  <forestry:logs.4:3> : <forestry:planks.1:3>,
  <forestry:logs.5>   : <forestry:planks.1:4>,
  <forestry:logs.5:2> : <forestry:planks.1:6>,
  <forestry:logs.5:1> : <forestry:planks.1:5>,
  <forestry:logs.3:3> : <forestry:planks.0:15>,
  <forestry:logs.2:3> : <forestry:planks.0:11>,
  <forestry:logs.3>   : <forestry:planks.0:12>,
  <forestry:logs.3:1> : <forestry:planks.0:13>,
  <forestry:logs.3:2> : <forestry:planks.0:14>,
  <forestry:logs.5:3> : <forestry:planks.1:7>,
  <forestry:logs.6:2> : <forestry:planks.1:10>,
  <forestry:logs.6:1> : <forestry:planks.1:9>,
  <forestry:logs.6>   : <forestry:planks.1:8>,
  <forestry:logs.4>   : <forestry:planks.1>,
  <forestry:logs.4:1> : <forestry:planks.1:1>,
  <forestry:logs.2:1> : <forestry:planks.0:9>,
  <forestry:logs.7>   : <forestry:planks.1:12>,
  <forestry:logs.2:2> : <forestry:planks.0:10>,
  <forestry:logs.6:3> : <forestry:planks.1:11>,
};

for log, plank in forestryLogsAndPlanks {
  saw(log, plank, "no exceptions");
}

# Spectre Wood compat
saw(<randomthings:spectrelog>, <randomthings:spectreplank>, "Except: manufactory mekSawmill");