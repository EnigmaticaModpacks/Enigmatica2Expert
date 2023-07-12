#modloaded quark

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

scripts.lib.loot.tweak("quark:entities/crab", "legs", "quark:crab_leg", <quark:crab_leg>, [<harvestcraft:crabrawitem>], [1,3]);

// Quark Polished Marble
val marble = <ore:stoneMarble>;
recipes.removeShaped(<quark:marble:1>);
recipes.addShaped('Polished Marble', <quark:marble:1> * 9,
  [[marble, marble, marble],
    [marble, marble, marble],
    [marble, marble, marble]]);

// Quark Marble Wall Oredicted version
recipes.remove(<quark:marble_wall>);
recipes.addShaped('Quark Marble Wall',
  <quark:marble_wall> * 6,
  [[<ore:stoneMarble>, <ore:stoneMarble>, <ore:stoneMarble>],
    [<ore:stoneMarble>, <ore:stoneMarble>, <ore:stoneMarble>]]);

// Prevent melting dupe
craft.remake(<quark:obsidian_pressure_plate>, ['AA', 'AA'], { A: <ore:obsidian> });

// Conflict recipes
recipes.removeByRecipeName('quark:basalt_1');

// Too easy recipe
recipes.removeByRecipeName("quark:basalt");

recipes.remove(<quark:stone_basalt_slab>);
recipes.addShaped('oredicted_slab', <quark:stone_basalt_slab> * 6, [[<ore:stoneBasalt>, <ore:stoneBasalt>, <ore:stoneBasalt>]]);

# Fix recipes (each original quark recipe use basalt bricks for some reason)
for i in [
/*Inject_js(getSubMetas('quark:world_stone_carved').join(', '))*/
0, 1, 2, 3, 4, 5, 6, 7
/**/
] as int[] {
  if(i==3) continue;
  craft.remake(<quark:world_stone_carved>.definition.makeStack(i) * 8, ["pretty",
    "G G G",
    "G   G",
    "G G G"], {
    "G": <quark:world_stone_bricks>.definition.makeStack(i), # Bricks
  });
}

# Fix conflicts with compressed
val mcWoodLogs = [
  <minecraft:log>,
  <minecraft:log:1>,
  <minecraft:log:2>,
  <minecraft:log:3>,
  <minecraft:log2>,
  <minecraft:log2:1>,
] as IItemStack[];
for i, log in mcWoodLogs {
  craft.remake(<quark:bark>.definition.makeStack(i) * 17, ["pretty",
    "G G G",
    "G c G",
    "G G G"], {
    "G": mcWoodLogs[i],
    "c": <additionalcompression:logwood_compressed>,
  });
}

# Fix conflicts with CoT compressed granite
recipes.remove(<quark:world_stone_pavement:*>);

# [Iron Rod] from [Slime in a Bucket][+2]
craft.remake(<quark:iron_rod>, ["pretty",
  "    ╱",
  "  ~  ",
  "B    "], {
  "╱": <ore:stickIron>,      # Iron Rod
  "~": <quark:slime_bucket:*>, # Slime in a Bucket
  "B": <ore:stoneBrimstone>, # Brimstone
});

# [Backpack] from [Iron Rod][+2]
craft.make(<quark:backpack>, ["pretty",
  "  ▬  ",
  "J / J",
  "J J J"], {
  "▬": <ore:ingotAlubrass>,
  "J": <ore:stoneJasper>,     # Jasper
  "/": <quark:iron_rod>,      # Iron Rod
});

# Alt usage
scripts.process.extract(<quark:glowcelium>, <thermalfoundation:material:2049>, "No Exceptions");

# Turn Heart of diamond into Empowered Diamond with rat
mods.rats.recipes.addGemcutterRatRecipe(<quark:diamond_heart>, <actuallyadditions:item_crystal_empowered:2>);

# [White Candle] from [String][+1]
recipes.removeByRecipeName("quark:candle");
craft.make(<quark:candle> * 8, ["s","t","t"], {
  "s": <ore:string>, # String
  "t": <ore:tallow>, # Tallow
});

# [Paper Lamp] from [White Candle][+1]
craft.reshapeless(<quark:paper_lantern> * 4, "C■", {
  "C": <forestry:carton>, # Carton
  "■": <ore:blockCandle>, # White Candle
});

# [Slime in a Bucket] from [Bucket][+1]
craft.shapeless(<quark:slime_bucket>, "§~", {
  "§": <randomthings:slimecube>, # Slime Cube
  "~": <minecraft:bucket>,       # Bucket
});

# [Monster Box] from [Truffle][+1]
craft.shapeless(<quark:monster_box>, "MT", {
  "M": <minecraft:mob_spawner>, # Monster Spawner
  "T": <animania:truffle>,      # Truffle
});

# Recipe added with another mod
recipes.remove(<quark:gravisand>);

recipes.removeByRecipeName("quark:turf");
recipes.addShapeless('turf any grass', <quark:turf>, [<ore:grassTall>, <ore:grassTall>, <ore:grassTall>, <ore:grassTall>]);

# [Cave root]
mods.thaumcraft.Crucible.registerRecipe(
  "quark:root", # Name
  "HEDGEALCHEMY@1", # Research
  <quark:root>, # Output
  <harvestcraft:ediblerootitem>, # Input
  [<aspect:herba>*5]
);

# [Blue sprout]
mods.thaumcraft.Crucible.registerRecipe(
  "quark:root_flower_blue", # Name
  "HEDGEALCHEMY@1", # Research
  <quark:root_flower>, # Output
  <harvestcraft:ediblerootitem>, # Input
  [<aspect:instrumentum>*5]
);

# [Black sprout]
mods.thaumcraft.Crucible.registerRecipe(
  "quark:root_flower_black", # Name
  "HEDGEALCHEMY@1", # Research
  <quark:root_flower:1>, # Output
  <harvestcraft:ediblerootitem>, # Input
  [<aspect:tenebrae>*5]
);

# [White sprout]
mods.thaumcraft.Crucible.registerRecipe(
  "quark:root_flower_white", # Name
  "HEDGEALCHEMY@1", # Research
  <quark:root_flower:2>, # Output
  <harvestcraft:ediblerootitem>, # Input
  [<aspect:potentia>*5]
);
