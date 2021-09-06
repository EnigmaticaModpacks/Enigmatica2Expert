import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;

# List of blocks and their respetive recycle materials
# Note: despite Rock Crusher uses IIngredient as input, IOreDictEntry or
#   wildcarded items (like <twilightforest:maze_stone:*>) will be
#   visible in JEI, but cant be actually pushed into machine
val rockRecycleTable as IItemStack[][IIngredient] = {
<twilightforest:castle_brick:3>      |
<twilightforest:castle_pillar>       |
<twilightforest:castle_pillar:1>     : [<harvestcraft:saltitem>, <appliedenergistics2:material:3>, <astralsorcery:itemusabledust:1>],
<twilightforest:deadrock>            |
<twilightforest:deadrock:1>          |
<twilightforest:deadrock:2>          : [<ic2:dust:1>, <nuclearcraft:dust:8>, <jaopca:item_dustdimensionalshard>],
<twilightforest:castle_brick>        |
<twilightforest:castle_brick:1>      |
<twilightforest:castle_brick:2>      |
<twilightforest:castle_brick:4>      |
<twilightforest:castle_brick:5>      |
<twilightforest:castle_pillar:3>     |
<twilightforest:castle_pillar:2>     : [<harvestcraft:saltitem>, <appliedenergistics2:material:3>, <thermalfoundation:material:69>],
<twilightforest:maze_stone>          |
<twilightforest:maze_stone:1>        |
<twilightforest:maze_stone:2>        |
<twilightforest:maze_stone:3>        |
<twilightforest:maze_stone:4>        |
<twilightforest:maze_stone:5>        |
<twilightforest:maze_stone:6>        |
<twilightforest:maze_stone:7>        : [<mekanism:dust:2>, <nuclearcraft:dust_oxide:1>, <mekanism:otherdust:5>],
<twilightforest:underbrick>          |
<twilightforest:underbrick:1>        |
<twilightforest:underbrick:2>        |
<twilightforest:underbrick:3>        : [<ic2:dust:1>, <thermalfoundation:material:772>, <enderio:item_material:74>],
<twilightforest:castle_rune_brick>   : [<randomthings:runedust:6>, <thermalfoundation:material:72>, <nuclearcraft:compound>],
<twilightforest:castle_rune_brick:3> : [<randomthings:runedust:10>, <thermalfoundation:material:72>, <nuclearcraft:compound>],
<twilightforest:castle_rune_brick:1> : [<randomthings:runedust:11>, <thermalfoundation:material:72>, <nuclearcraft:compound>],
<twilightforest:castle_rune_brick:2> : [<randomthings:runedust:4>, <thermalfoundation:material:72>, <nuclearcraft:compound>],
<twilightforest:aurora_block>        : [<nuclearcraft:compound:7>, <botania:manaresource:23>, <bigreactors:dustcyanite>],
<twilightforest:aurora_pillar>       : [<nuclearcraft:compound:7>, <ic2:dust:5>, <bigreactors:dustcyanite>],
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



# [Ice_Bomb*4] from [Shulker_Pearl][+3]
craft.remake(<twilightforest:ice_bomb> * 4, ["pretty",
  "I C I",
  "W ◊ W",
  "I C I"], {
  "C": <forestry:carton>,              # Carton
  "W": <forestry:crafting_material:3>, # Woven Silk
  "I": <forestry:crafting_material:5>, # Ice Shard
  "◊": <ore:gemPearl>                  # Shulker Pearl
});

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
  "F C F",
  "# ≢ #",
  "# ≢ #"], {
  "≢": <twilightforest:magic_log:2>,  # Minewood
  "#": <twilightforest:twilight_log>, # Twilight Oak Wood
  "C": <twilightforest:cicada>,       # Cicada
  "F": <twilightforest:firefly>,      # Firefly
});