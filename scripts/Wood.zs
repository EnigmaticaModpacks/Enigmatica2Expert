import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;


# JEI search string to see all planks
# plankWood -@chisel -"(fireproof)" -"Vertical" -" Painted "

# Helper Function
function saw(input as IIngredient, output as IItemStack, exceptions as string) as void {
  if(isNull(input) || isNull(output)) return;

  # BlockCutter should add all recipes.
  # All table recipes should be replaced
  scripts.process.sawWood(input, output, "only: blockCutter strict: shapeless");

  # TE Sawmill generates x3 recipes automatically from craftingTable recipes so we add its in exceptions
  scripts.process.sawWood(input, output, "except: TESawmill blockCutter shapeless AdvRockCutter " ~ exceptions);
}


# Logs to planks recipes
# Vanilla
val vanilla as IItemStack[IIngredient] = {
  <minecraft:log>    : <minecraft:planks>, 
  <minecraft:log:1>  : <minecraft:planks:1>,
  <minecraft:log:2>  : <minecraft:planks:2>,
  <minecraft:log:3>  : <minecraft:planks:3>,
  <minecraft:log2>   : <minecraft:planks:4>,
  <minecraft:log2:1> : <minecraft:planks:5>,
};

# Twilight Forest
val twilight as IItemStack[IIngredient] = {
  <twilightforest:twilight_log>   : <twilightforest:twilight_oak_planks>,
  <twilightforest:twilight_log:1> : <twilightforest:canopy_planks>,
  <twilightforest:twilight_log:2> : <twilightforest:mangrove_planks>,
  <twilightforest:twilight_log:3> : <twilightforest:dark_planks>,
  <twilightforest:magic_log>      : <twilightforest:time_planks>,
  <twilightforest:magic_log:1>    : <twilightforest:trans_planks>,
  <twilightforest:magic_log:2>    : <twilightforest:mine_planks>,
  <twilightforest:magic_log:3>    : <twilightforest:sort_planks>,
};

# Biomes O' plenty, made by Trilexcom
val bop as IItemStack[IIngredient] = {
  <biomesoplenty:log_0:4> : <biomesoplenty:planks_0>,
  <biomesoplenty:log_0:5> : <biomesoplenty:planks_0:1>,
  <biomesoplenty:log_0:6> : <biomesoplenty:planks_0:2>,
  <biomesoplenty:log_0:7> : <biomesoplenty:planks_0:3>,
  <biomesoplenty:log_1:4> : <biomesoplenty:planks_0:4>,
  <biomesoplenty:log_1:5> : <biomesoplenty:planks_0:5>,
  <biomesoplenty:log_1:6> : <biomesoplenty:planks_0:6>,
  <biomesoplenty:log_2:4> : <biomesoplenty:planks_0:8>,
  <biomesoplenty:log_2:5> : <biomesoplenty:planks_0:9>,
  <biomesoplenty:log_2:6> : <biomesoplenty:planks_0:10>,
  <biomesoplenty:log_2:7> : <biomesoplenty:planks_0:11>,
  <biomesoplenty:log_3:4> : <biomesoplenty:planks_0:12>,
  <biomesoplenty:log_3:5> : <biomesoplenty:planks_0:13>,
  <biomesoplenty:log_3:6> : <biomesoplenty:planks_0:14>,
  <biomesoplenty:log_3:7> : <biomesoplenty:planks_0:15>,
  <biomesoplenty:log_1:7> : <biomesoplenty:planks_0:7>,
};

# Forestry, made by Trilexcom
val forestry as IItemStack[IIngredient] = {
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

# pam
val pam as IItemStack[IIngredient] = {
  <harvestcraft:pamcinnamon>  : <minecraft:planks:3>,
  <harvestcraft:pammaple>     : <minecraft:planks:1>,
  <harvestcraft:pampaperbark> : <minecraft:planks:3>,
};


for log, plank in vanilla   { saw(log, plank, "strict: manufactory mekSawmill"); }
for log, plank in twilight  { saw(log, plank, "strict: manufactory mekSawmill"); }
for log, plank in pam       { saw(log, plank, "strict: manufactory mekSawmill"); }
for log, plank in bop       { saw(log, plank, "strict: manufactory mekSawmill"); }
for log, plank in forestry  { saw(log, plank, "no exceptions"); }


# Other Mods
saw(<rustic:log>                    , <rustic:planks>                    , "strict: manufactory mekSawmill");
saw(<rustic:log:1>                  , <rustic:planks:1>                  , "strict: manufactory mekSawmill");
saw(<thaumcraft:log_greatwood>      , <thaumcraft:plank_greatwood>       , "strict: manufactory mekSawmill");
saw(<thaumcraft:log_silverwood>     , <thaumcraft:plank_silverwood>      , "strict: manufactory mekSawmill");
saw(<integrateddynamics:menril_log> , <integrateddynamics:menril_planks> , "strict: manufactory mekSawmill");
saw(<advancedrocketry:alienwood>    , <advancedrocketry:planks>          , "strict: manufactory mekSawmill");
saw(<extrautils2:ironwood_log>      , <extrautils2:ironwood_planks>      , "strict: manufactory mekSawmill");
saw(<extrautils2:ironwood_log:1>    , <extrautils2:ironwood_planks:1>    , "strict: manufactory mekSawmill");
saw(<randomthings:spectrelog>       , <randomthings:spectreplank>        , "strict: manufactory mekSawmill");
saw(itemUtils.getItem("iceandfire:dreadwood_log"), itemUtils.getItem("iceandfire:dreadwood_planks"), "no exceptions");

# Magical wood special
saw(<extrautils2:decorativesolidwood:1>,<extrautils2:decorativesolidwood>, "no exceptions");
scripts.process.sawWood(<extrautils2:decorativesolidwood:1>,<extrautils2:decorativesolidwood>, "only: TESawmill");


# Sawdust compat
// mods.mekanism.sawmill.removeRecipe(<ore:stickWood>);
mods.mekanism.sawmill.removeRecipe(<ore:plankWood>);
mods.mekanism.sawmill.removeRecipe(<ore:slabWood>);
mods.mekanism.sawmill.addRecipe(<ore:stickWood>, <thermalfoundation:material:800>);
mods.mekanism.sawmill.addRecipe(<ore:plankWood>, <minecraft:stick> * 6, <thermalfoundation:material:800>, 0.25d);
mods.mekanism.sawmill.addRecipe(<ore:slabWood> , <minecraft:stick> * 3, <thermalfoundation:material:800>, 0.25d / 2.0d);
