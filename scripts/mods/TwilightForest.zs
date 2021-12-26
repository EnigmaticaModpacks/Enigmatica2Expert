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

scripts.category.expire_in_block.set(<ore:gemPearl>, {"cyclicmagic:fire_frost" : <twilightforest:ice_bomb>});

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
recipes.addShaped("twilightforest_moonworm", <twilightforest:moonworm>, [
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

#-------------------------------------------------------------------------

# Alt from chicken
scripts.wrap.tconstruct.Alloy.addRecipe(<liquid:fierymetal> * 144, [<liquid:fiery_essence> * 250, <liquid:end_steel> * 144]);
scripts.wrap.tconstruct.Alloy.addRecipe(<liquid:lava> * 288,       [<liquid:fiery_essence> * 50,  <liquid:stone> * 288]);