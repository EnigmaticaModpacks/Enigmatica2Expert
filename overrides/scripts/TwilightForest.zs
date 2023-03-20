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
<twilightforest:castle_rune_brick>   : [<randomthings:runedust:6>, <thermalfoundation:material:72>, <appliedenergistics2:material:3>],
<twilightforest:castle_rune_brick:3> : [<randomthings:runedust:10>, <thermalfoundation:material:72>, <appliedenergistics2:material:3>],
<twilightforest:castle_rune_brick:1> : [<randomthings:runedust:11>, <thermalfoundation:material:72>, <appliedenergistics2:material:3>],
<twilightforest:castle_rune_brick:2> : [<randomthings:runedust:4>, <thermalfoundation:material:72>, <appliedenergistics2:material:3>],
<twilightforest:aurora_block>        : [<immersiveengineering:metal:14>, <botania:manaresource:23>, <ic2:dust:9>],
<twilightforest:aurora_pillar>       : [<immersiveengineering:metal:14>, <ic2:dust:5>, <ic2:dust:9>],
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