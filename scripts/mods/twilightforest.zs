import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;

scripts.lib.loot.tweak("twilightforest:entities/helmet_crab", "fish", "minecraft:fish", null, [<harvestcraft:crabrawitem>], [1,3]);
scripts.lib.loot.tweak("twilightforest:entities/deer"       , "meat", "twilightforest:raw_venison", <twilightforest:raw_venison>, [<harvestcraft:venisonrawitem>], [1,3]);

// Peacock fan
recipes.addShaped(<twilightforest:peacock_fan>, [
  [<ore:peacockFeathers>, <ore:peacockFeathers>, null],
  [<forestry:oak_stick>, <forestry:oak_stick>, <ore:peacockFeathers>],
  [<ore:slimecrystalBlue>, <forestry:oak_stick>, <ore:peacockFeathers>],
]);

# List of blocks and their respetive recycle materials
# Note: despite Rock Crusher uses IIngredient as input, IOreDictEntry or
#   wildcarded items (like <twilightforest:maze_stone:*>) will be
#   visible in JEI, but cant be actually pushed into machine
val rockRecycleTable as IItemStack[][IIngredient] = {
<twilightforest:castle_brick:3>      |
<twilightforest:castle_pillar>       |
<twilightforest:castle_pillar:1>     : [<mekanism:salt>, <appliedenergistics2:material:3>, <astralsorcery:itemusabledust:1>],
<twilightforest:deadrock>            |
<twilightforest:deadrock:1>          |
<twilightforest:deadrock:2>          : [<ic2:dust:1>, <nuclearcraft:dust:8>, <jaopca:item_dustdimensionalshard>],
<twilightforest:castle_brick>        |
<twilightforest:castle_brick:1>      |
<twilightforest:castle_brick:2>      |
<twilightforest:castle_brick:4>      |
<twilightforest:castle_brick:5>      |
<twilightforest:castle_pillar:3>     |
<twilightforest:castle_pillar:2>     : [<mekanism:salt>, <appliedenergistics2:material:3>, <thermalfoundation:material:69>],
<twilightforest:maze_stone>          |
<twilightforest:maze_stone:1>        |
<twilightforest:maze_stone:2>        |
<twilightforest:maze_stone:3>        |
<twilightforest:maze_stone:4>        |
<twilightforest:maze_stone:5>        |
<twilightforest:maze_stone:6>        |
<twilightforest:maze_stone:7>        : [<mekanism:dust:2>, <nuclearcraft:dust:14>, <mekanism:otherdust:5>],
<twilightforest:underbrick>          |
<twilightforest:underbrick:1>        |
<twilightforest:underbrick:2>        |
<twilightforest:underbrick:3>        : [<ic2:dust:1>, <thermalfoundation:material:772>, <enderio:item_material:74>],
<twilightforest:castle_rune_brick>   : [<randomthings:runedust:6>, <thermalfoundation:material:72>, <nuclearcraft:compound>],
<twilightforest:castle_rune_brick:3> : [<randomthings:runedust:10>, <thermalfoundation:material:72>, <nuclearcraft:compound>],
<twilightforest:castle_rune_brick:1> : [<randomthings:runedust:11>, <thermalfoundation:material:72>, <nuclearcraft:compound>],
<twilightforest:castle_rune_brick:2> : [<randomthings:runedust:4>, <thermalfoundation:material:72>, <nuclearcraft:compound>],
<twilightforest:aurora_block>        : [<nuclearcraft:compound:7>, <botania:manaresource:23>, <nuclearcraft:plutonium:15>],
<twilightforest:aurora_pillar>       : [<nuclearcraft:compound:7>, <ic2:dust:5>, <nuclearcraft:plutonium:15>],
};

for input, output in rockRecycleTable{
  scripts.process.crushRock(input, output, [0.8, 0.3, 0.1], "No exceptions");
}

# Gold minotaur axe
scripts.process.recycleMetal(<twilightforest:minotaur_axe_gold>, <minecraft:gold_ingot> * 6,   <liquid:gold> * (144*6), null);

# Diamond minotaur axe
scripts.process.crush(<twilightforest:minotaur_axe>, <minecraft:diamond> * 11,
  "No Exceptions", [<ic2:dust:5> * 5] as IItemStack[], [0.25f] as float[]);

# Increasing the durability of Twilight Forest rare items
  <twilightforest:crumble_horn>.maxDamage = 4096; # Orig: 1024
  <twilightforest:ore_magnet>.maxDamage = 128; # Orig: 16



# [Ice Bomb] from [Shulker_Pearl][+3]
craft.remake(<twilightforest:ice_bomb> * 8, ["pretty",
  "I C I",
  "W ◊ W",
  "I C I"], {
  "C": <forestry:carton>,              # Carton
  "W": <forestry:crafting_material:3>, # Woven Silk
  "I": <forestry:crafting_material:5>, # Ice Shard
  "◊": <ore:gemPearl>                  # Shulker Pearl
});

scripts.do.expire_in_block.set(<ore:gemPearl>, {"cyclicmagic:fire_frost" : <twilightforest:ice_bomb>});

# [Sickly Twilight Oak Sapling]*8 from [Moonworm][+1]
craft.remake(<twilightforest:twilight_sapling> * 8, ["pretty",
  "S S S",
  "S M S",
  "S S S"], {
  "S": <ore:treeSapling>,         # Oak Sapling
  "M": <twilightforest:moonworm>, # Moonworm
});

# [Tree of Transformation Sapling] from [Naga Scale][+3]
craft.remake(<twilightforest:twilight_sapling:6>, ["pretty",
  "L N L",
  "L # L",
  "T # T"], {
  "#": <twilightforest:twilight_log:2>,    # Mangrove Wood
  "T": <twilightforest:torchberries>,      # Torchberries
  "L": <integrateddynamics:menril_leaves>, # Menril Leaves
  "N": <twilightforest:naga_scale>,        # Naga Scale
});

# [Sorting Tree Sapling] from [Naga Scale][+3]
craft.remake(<twilightforest:twilight_sapling:8>, ["pretty",
  "L N L",
  "L # L",
  "T # T"], {
  "#": <twilightforest:twilight_log:1>, # Canopy Tree Wood
  "T": <twilightforest:torchberries>,   # Torchberries
  "L": <twilightforest:magic_leaves:1>, # Leaves of Transformation
  "N": <twilightforest:naga_scale>,     # Naga Scale
});

# [Tree of Time Sapling] from [Naga Scale][+3]
craft.remake(<twilightforest:twilight_sapling:5>, ["pretty",
  "L N L",
  "L # L",
  "T # T"], {
  "#": <twilightforest:twilight_log:3>, # Darkwood
  "T": <twilightforest:torchberries>,   # Torchberries
  "L": <twilightforest:magic_leaves:1>, # Leaves of Transformation
  "N": <twilightforest:naga_scale>,     # Naga Scale
});

# [Miner's Tree Sapling] from [Huge Stalk][+5]
craft.remake(<twilightforest:twilight_sapling:7>, ["pretty",
  "L N L",
  "L H L",
  "≢ ≠ #"], {
  "≠": <twilightforest:magic_log:3>,       # Sortingwood
  "≢": <twilightforest:magic_log:1>,       # Transwood
  "#": <twilightforest:magic_log>,         # Timewood
  "H": <twilightforest:huge_stalk>,        # Huge Stalk
  "L": <twilightforest:twilight_leaves:3>, # Rainbow Oak Leaves
  "N": <twilightforest:naga_scale>,        # Naga Scale
});

# [Robust Twilight Oak Sapling] from [Cicada][+3]
craft.remake(<twilightforest:twilight_sapling:4>, ["pretty",
  "F F F",
  "# ≢ #",
  "# ≢ #"], {
  "≢": <twilightforest:magic_log:2>,  # Minewood
  "#": <twilightforest:twilight_log>, # Twilight Oak Wood
  "F": <twilightforest:firefly>,      # Firefly
});

# Twilight worm
recipes.addShaped("twilightforest_moonworm", <twilightforest:moonworm> * 10, [
	[<ore:egg>, <tconstruct:slime_channel>, <ore:egg>], 
	[<tconstruct:slime_channel>, null, null], 
	[<ore:egg>, <tconstruct:slime_channel>, <exnihilocreatio:item_material:2>]
]);

# [Glowstone Dust] from [Firefly][+1]
scripts.process.crush(<twilightforest:firefly>, <minecraft:glowstone_dust> * 20, "only: crushingBlock",null,null);

#-------------------------------------------------------------------------
# SPAWNERS
#-------------------------------------------------------------------------

# [Naga Spawner] from [Propolis]*3[+3]
craft.remake(<twilightforest:boss_spawner>, ["pretty",
  "□ M □",
  "* P *",
  "□ M □"], {
  "□": <ore:plateMithril>,                  # Mana Infused Plate
  "M": <twilightforest:magic_map_focus>,    # Magic Map Focus
  "*": <actuallyadditions:block_crystal:4>, # Emeradic Crystal Block
  "P": <forestry:propolis:*>,               # Propolis
});

# [Lich Spawner] from [Propolis]*3[+3]
craft.remake(<twilightforest:boss_spawner:1>, ["pretty",
  "□ N □",
  "* P *",
  "□ N □"], {
  "□": <ore:plateMithril>,                  # Mana Infused Plate
  "N": <twilightforest:naga_scale>,         # Naga Scale
  "*": <actuallyadditions:block_crystal:4>, # Emeradic Crystal Block
  "P": <forestry:propolis:*>,               # Propolis
});

# [Alpha Yeti Spawner] from [Glitch Infused Ingot][+3]
craft.remake(<twilightforest:boss_spawner:7>, ["pretty",
  "□ A □",
  "■ ▬ ■",
  "□ A □"], {
  "□": <ore:plateMithril>,             # Mana Infused Plate
  "A": <ore:furArctic>,                # Arctic Fur
  "■": <twilightforest:block_storage>, # Block of Ironwood
  "▬": <ore:ingotGlitch>,              # Glitch Infused Ingot
});

# [Knight Phantoms Spawner] from [Glitch Infused Ingot][+3]
craft.remake(<twilightforest:boss_spawner:4>, ["pretty",
  "□ M □",
  "■ ▬ ■",
  "□ M □"], {
  "□": <ore:plateMithril>,             # Mana Infused Plate
  "M": <twilightforest:cooked_meef>,   # Meef Steak
  "■": <twilightforest:block_storage>, # Block of Ironwood
  "▬": <ore:ingotGlitch>,              # Glitch Infused Ingot
});

# [Minoshroom Spawner] from [Glitch Infused Ingot][+3]
craft.remake(<twilightforest:boss_spawner:6>, ["pretty",
  "□ C □",
  "■ ▬ ■",
  "□ C □"], {
  "□": <ore:plateMithril>,             # Mana Infused Plate
  "C": <twilightforest:cicada>,        # Cicada
  "■": <twilightforest:block_storage>, # Block of Ironwood
  "▬": <ore:ingotGlitch>,              # Glitch Infused Ingot
});

# [Hydra Spawner] from [Galactic Potato][+3]
craft.remake(<twilightforest:boss_spawner:2>, ["pretty",
  "□ M □",
  "■ G ■",
  "□ M □"], {
  "□": <ore:plateMithril>,                        # Mana Infused Plate
  "M": <twilightforest:meef_stroganoff>,          # Meef Stroganoff
  "■": <twilightforest:block_storage:4>,          # Block of Carminite
  "G": <botania_tweaks:compressed_tiny_potato_8>, # Galactic Potato
});

# [Ur-Ghast Spawner] from [Galactic Potato][+3]
craft.remake(<twilightforest:boss_spawner:3>, ["pretty",
  "□ ■ □",
  "▄ G ▄",
  "□ ■ □"], {
  "□": <ore:plateMithril>,                        # Mana Infused Plate
  "■": <ore:blockKnightmetal>,                    # Block of Knightmetal
  "▄": <twilightforest:block_storage:4>,          # Block of Carminite
  "G": <botania_tweaks:compressed_tiny_potato_8>, # Galactic Potato
});

# [Snow Queen Spawner] from [Galactic Potato][+3]
craft.remake(<twilightforest:boss_spawner:5>, ["pretty",
  "□ ■ □",
  "▄ G ▄",
  "□ ■ □"], {
  "□": <ore:plateMithril>,                        # Mana Infused Plate
  "■": <twilightforest:block_storage:3>,          # Block of Arctic Fur
  "▄": <twilightforest:block_storage:4>,          # Block of Carminite
  "G": <botania_tweaks:compressed_tiny_potato_8>, # Galactic Potato
});

# [Lamp of Cinders] from [Twilit Shader_ Snow Queen][+4]
craft.make(<twilightforest:lamp_of_cinders>, ["pretty",
  "▲    ",
  "i w T",
  "■ ■ ■"], {
  "▲": <ore:dustGelidEnderium>, # Gelid Enderium Dust
  "i": <twilightforest:shader>.withTag({shader_type: "Alpha Yeti"}), # Twilit Shader: Alpha Yeti
  "w": <twilightforest:shader>.withTag({shader_type: "Snow Queen"}), # Twilit Shader: Snow Queen
  "T": <twilightforest:shader>.withTag({shader_type: "Ur-Ghast"}), # Twilit Shader: Ur-Ghast
  "■": <ore:blockAlubrass>,     # Block of Aluminum Brass
});

# [Castle Brick] from [Lamp of Cinders][+2]
craft.make(<twilightforest:castle_brick>, ["pretty",
  "■ ▲ ■",
  "■ L ■",
  "■ ■ ■"], {
  "■": <ore:blockSalt>,  # Salt Block
  "▲": <ore:dustNickel>, # Pulverized Nickel
  "L": <twilightforest:lamp_of_cinders>.anyDamage().transformDamage(1), # Lamp of Cinders
});

val castleIngrs = {
  "C": <twilightforest:castle_brick:*>, # Castle Brick
  "▲": <ore:dustCalciumSulfate>,        # Calcium Sulfate
  "P": <randomthings:runedust:6>,       # Pink Runic Dust
  "∆": <randomthings:runedust:11>,      # Blue Runic Dust
  "♣": <randomthings:runedust:4>,       # Yellow Runic Dust
  "♠": <randomthings:runedust:10>,      # Purple Runic Dust
} as IIngredient[string];

# [Pink Castle Rune Brick] from [Pink Runic Dust][+2]
craft.shapeless(<twilightforest:castle_rune_brick>, "CC▲P", castleIngrs);

# [Blue Castle Rune Brick] from [Blue Runic Dust][+2]
craft.shapeless(<twilightforest:castle_rune_brick:1>, "CC▲∆", castleIngrs);

# [Yellow Castle Rune Brick] from [Yellow Runic Dust][+2]
craft.shapeless(<twilightforest:castle_rune_brick:2>, "CC▲♣", castleIngrs);

# [Violet Castle Rune Brick] from [Purple Runic Dust][+2]
craft.shapeless(<twilightforest:castle_rune_brick:3>, "CC▲♠", castleIngrs);

#-------------------------------------------------------------------------
# Recycling of spawners

val spawnerRecycle = {
  <twilightforest:boss_spawner>   : [
    <twilightforest:shader>.withTag({shader_type: "Naga"}) % 100,
    <twilightforest:trophy> % 100,
    <twilightforest:naga_scale> % 100,
  ],
  <twilightforest:boss_spawner:5> : [
    <twilightforest:shader>.withTag({shader_type: "Snow Queen"}) % 100,
    <twilightforest:trophy:5> % 100,
    <minecraft:packed_ice> * 20 % 100,
    <minecraft:snowball> * 64 % 100,
    <twilightforest:triple_bow> % 20,
    <twilightforest:seeker_bow> % 20,
    <twilightforest:ice_bow> % 20,
    <twilightforest:ender_bow> % 20,
  ],
  <twilightforest:boss_spawner:7> : [
    <twilightforest:shader>.withTag({shader_type: "Alpha Yeti"}) % 100,
    <twilightforest:alpha_fur> * 4 % 100,
    <twilightforest:ice_bomb> * 10 % 100,
  ],
  <twilightforest:boss_spawner:1> : [
    <twilightforest:shader>.withTag({shader_type: "Lich"}) % 100,
    <twilightforest:trophy:1> % 100,
    <twilightforest:twilight_scepter> % 20,
    <twilightforest:lifedrain_scepter> % 20,
    <twilightforest:zombie_scepter> % 20,
    <twilightforest:shield_scepter> % 20,
  ],
  <twilightforest:boss_spawner:3> : [
    <twilightforest:shader>.withTag({shader_type: "Ur-Ghast"}) % 100,
    <twilightforest:trophy:3> % 100,
    <twilightforest:fiery_tears> * 6 % 100,
    <twilightforest:carminite> * 10 % 100,
  ],
  <twilightforest:boss_spawner:6> : [
    <twilightforest:shader>.withTag({shader_type: "Minoshroom"}) % 100,
    <twilightforest:trophy:6> % 100,
    <twilightforest:meef_stroganoff> * 3 % 100,
    <twilightforest:minotaur_axe> % 100,
  ],
  <twilightforest:boss_spawner:4> : [
    <twilightforest:shader>.withTag({shader_type: "Knight Phantom"}) % 100,
    <twilightforest:trophy:4> % 100,
    <twilightforest:armor_shard> * 16 % 100,
  ],
  <twilightforest:boss_spawner:2> : [
    <twilightforest:shader>.withTag({shader_type: "Hydra"}) % 100,
    <twilightforest:trophy:2> % 100,
    <twilightforest:hydra_chop> * 4 % 100,
    <twilightforest:fiery_blood> * 6 % 100,
  ],
} as WeightedItemStack[][IItemStack];

val defaultShader = <twilightforest:shader_bag>.withTag({shader_rarity: "Twilight"}) % 100;

for spawner, rewards in spawnerRecycle {
  mods.forestry.Centrifuge.addRecipe(rewards + defaultShader, spawner, 200);
}

#-------------------------------------------------------------------------

# Alt from chicken
mods.tconstruct.Alloy.addRecipe(<liquid:fierymetal> * 144, [<liquid:fiery_essence> * 250, <liquid:end_steel> * 144]);
mods.tconstruct.Alloy.addRecipe(<liquid:lava> * 250,       [<liquid:fiery_essence> * 50,  <liquid:menrilresin> * 250]);

<entity:twilightforest:ice_crystal>.addDrop(<iceandfire:dragon_ice>, 1, 3);
<entity:twilightforest:pinch_beetle>.addDrop(<thermalfoundation:material:2051>, 1, 3);
<entity:twilightforest:redcap_sapper>.addPlayerOnlyDrop(<tconevo:material> % 50, 1, 2);
<entity:twilightforest:redcap>.addPlayerOnlyDrop(<tconevo:material> % 50, 1, 2);
<entity:twilightforest:slime_beetle>.addDrop(<tconstruct:materials:9>, 1, 3);
<entity:twilightforest:squirrel>.addDrop(<harvestcraft:chestnutitem> % 30, 1, 1);
<entity:twilightforest:squirrel>.addDrop(<harvestcraft:hazelnutitem> % 30, 1, 1);
<entity:twilightforest:squirrel>.addDrop(<harvestcraft:nutmegitem> % 30, 1, 1);
<entity:twilightforest:squirrel>.addDrop(<harvestcraft:peanutitem> % 30, 1, 1);
<entity:twilightforest:squirrel>.addDrop(<harvestcraft:waterchestnutitem> % 30, 1, 1);
<entity:twilightforest:stable_ice_core>.addDrop(<mysticalagriculture:ice_essence>, 4, 12);
<entity:twilightforest:unstable_ice_core>.addDrop(<forestry:crafting_material:5>, 3, 9);
<entity:twilightforest:wraith>.addDrop(<enderio:block_holier_fog>, 10, 40);
