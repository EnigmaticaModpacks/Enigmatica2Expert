import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.cyclicmagic.Hydrator;  
import mods.cyclicmagic.Solidifier;  
import mods.cyclicmagic.Dehydrator;
import crafttweaker.data.IData;
#modloaded cyclicmagic

# *======= Recipes =======*

// Cyclic Guide
recipes.addShapeless('Cyclic Guide',
  <guideapi:cyclicmagic-guide>,
  [<minecraft:book>, <cyclicmagic:carbon_paper>]);

# Removing Simple Block Miner
	utils.rh(<cyclicmagic:block_miner>);

# [Redstone Clock] from [Ectoplasm][+2]
craft.remake(<cyclicmagic:clock>, ["pretty",
  "■ ♥ ■",
  "♥ E ♥",
  "■ ♥ ■"], {
  "■": <ore:blockPearl>,                        # Pearl Block
  "♥": <randomthings:advancedredstonetorch_on>, # Advanced Redstone Torch
  "E": <randomthings:ingredient:2>,             # Ectoplasm
});

# Speed Charm + Elytra is too OP
<cyclicmagic:charm_speed>.maxDamage = 100;

# Lower durab of glowes (default is 6000)
<cyclicmagic:glove_climb>.maxDamage = 3000;
<cyclicmagic:charm_air>.maxDamage = 1000;
<cyclicmagic:sword_weakness>.maxDamage = 600;
<cyclicmagic:sword_slowness>.maxDamage = 600;
<cyclicmagic:sword_ender>.maxDamage = 600;

# Harder shears
recipes.remove(<cyclicmagic:shears_obsidian>);
recipes.addShaped("Cyclic Shears", <cyclicmagic:shears_obsidian>, [
	[null, <ore:ingotRefinedObsidian>, null],
	[<ore:ingotRefinedObsidian>, <minecraft:shears>, <ore:ingotRefinedObsidian>],
	[null, <ore:ingotRefinedObsidian>, null]]);

# Harder Sleeping mat
recipes.remove(<cyclicmagic:sleeping_mat>);
recipes.addShapeless("Cyclic Sleep Mat", <cyclicmagic:sleeping_mat>, [
	utils.tryCatch("travelersbackpack:sleeping_bag_bottom", <minecraft:rabbit_hide>), <ore:leather>]);

# [Void_Charm] from [Slime_Cube][+3]
craft.remake(<cyclicmagic:charm_void>, ["pretty",
  "▲ § ▲",
  "§ ◊ §",
  "▲ § ▲"], {
  "▲": <ore:dustEnderEye>,
  "§": <ore:dyePurple>,
  "◊": <ore:quicksilver>,
});

# [Apple of Lofty Stature] from [Slime Cube][+1]
craft.remake(<cyclicmagic:food_step>, ["pretty",
  "  L  ",
  "L § L",
  "  L  "], {
  "L": <cyclicmagic:apple_lapis>, # Lapis Apple
  "§": <randomthings:slimecube>,  # Slime Cube
});

# [Player_Launcher] from [Slimesling][+2]
craft.remake(<cyclicmagic:tool_launcher>, ["pretty",
  "  # #",
  "  S #",
  "s    "], {
  "#": <randomthings:spectreplank>,
  "s": <quark:slime_bucket:*>,
  "S": <tconstruct:slimesling:*>.anyDamage() # Slimesling
});

# [Storage Bag] from [Cobweb][+2]
craft.remake(<cyclicmagic:storage_bag>, ["pretty",
  "  C  ",
  "U C U",
  "B B B"], {
  "C": <minecraft:web>,                     # Cobweb
  "U": <colossalchests:uncolossal_chest>,   # Uncolossal Chest
  "B": <actuallyadditions:item_hairy_ball>, # Ball of Fur
});


# [Ender Orb] from [Molten Demon Metal Bucket][+1]
recipes.remove(<cyclicmagic:ender_pearl_reuse>);
mods.tconstruct.Casting.addTableRecipe(<cyclicmagic:ender_pearl_reuse>  , <endreborn:item_advanced_ender_pearl>, <liquid:xu_demonic_metal>, 144*4, true);

# [Ender Orb Translocator] from [Molten Lapis Bucket][+1]
recipes.remove(<cyclicmagic:ender_pearl_mounted>);
mods.tconstruct.Casting.addTableRecipe(<cyclicmagic:ender_pearl_mounted>, <endreborn:item_advanced_ender_pearl>, <liquid:lapis>, 666*4, true);

# Soul stone as T3 crafting ingredient
recipes.remove(<cyclicmagic:soulstone>);
mods.rockytweaks.Anvil.addRecipe(<cyclicmagic:ender_pearl_reuse>  , <cyclicmagic:crystallized_obsidian>, <cyclicmagic:soulstone>, 45);
mods.rockytweaks.Anvil.addRecipe(<cyclicmagic:ender_pearl_mounted>, <cyclicmagic:crystallized_obsidian>, <cyclicmagic:soulstone>, 45);

# [Crystallized Amber] from [Chorus Glass][+3]
craft.remake(<cyclicmagic:crystallized_amber>, ["pretty",
  "M W",
  "■ C"], {
  "M": <tconstruct:materials:19>,          # Mending Moss
  "W": <randomthings:weatheregg>,          # Weather Egg <Sun>
  "■": <ore:blockAmber>,                   # Amber Block
  "C": <integratedterminals:chorus_glass>, # Chorus Glass
});

# [Crystallized Obsidian] from [Chorus Glass][+3]
craft.remake(<cyclicmagic:crystallized_obsidian>, ["pretty",
  "M W",
  "C h"], {
  "M": <tconstruct:materials:19>,          # Mending Moss
  "W": <randomthings:weatheregg:1>,        # Weather Egg <Rain>
  "C": <biomesoplenty:crystal>,            # Crystallized Obsidian
  "h": <integratedterminals:chorus_glass>, # Chorus Glass
});

# [Empty Heart Container] from [Conglomerate_Of_Life][+2]
craft.remake(<cyclicmagic:heart_toxic>, ["pretty",
  "☼ S ☼",
  "☼ C ☼",
  "☼ ☼ ☼"], {
  "S": <iceandfire:siren_tear>,               # Siren Tear
  "C": <contenttweaker:conglomerate_of_life>, # Conglomerate Of Life
  "☼": <scalinghealth:heartdust>,             # Heart Dust
});

# ---------------------------------------------
# Cyclic machines rework
# https://github.com/Lothrazar/Cyclic/tree/trunk/1.12/scripts_zen_example

/*

  📮 Packager

*/
for it in [
  <minecraft:dirt:1>      , <minecraft:iron_block>       , <minecraft:iron_ingot>   ,
  <minecraft:gold_block>  , <minecraft:gold_ingot>       , <minecraft:melon_block>  ,
  <minecraft:coal_block>  , <minecraft:redstone_block>   , <minecraft:glowstone>    ,
  <minecraft:brick_block> , <minecraft:nether_brick>     , <minecraft:quartz_block> ,
  <minecraft:hay_block>   , <minecraft:emerald_block>    , <minecraft:diamond_block>,
  <minecraft:magma>       , <minecraft:nether_wart_block>, <minecraft:slime>        ,
  <minecraft:purpur_block>, <minecraft:clay>             , <minecraft:snow>         ,
  <minecraft:prismarine>  , <minecraft:sandstone>        , <minecraft:red_sandstone>,
  <minecraft:lapis_block> , <minecraft:bone_block>       ,
] as IItemStack[] {
  mods.cyclicmagic.Packager.removeRecipe(it);
}

val sa = <minecraft:sand> * 4;
val gr = <minecraft:gravel> * 4;
val packagerList = [
  [<minecraft:concrete_powder> * 8   ], [sa, gr, <ore:dyeWhite>.firstItem],
  [<minecraft:concrete_powder:1> * 8 ], [sa, gr, <ore:dyeOrange>.firstItem],
  [<minecraft:concrete_powder:2> * 8 ], [sa, gr, <ore:dyeMagenta>.firstItem],
  [<minecraft:concrete_powder:3> * 8 ], [sa, gr, <ore:dyeLightBlue>.firstItem],
  [<minecraft:concrete_powder:4> * 8 ], [sa, gr, <ore:dyeYellow>.firstItem],
  [<minecraft:concrete_powder:5> * 8 ], [sa, gr, <ore:dyeLime>.firstItem],
  [<minecraft:concrete_powder:6> * 8 ], [sa, gr, <ore:dyePink>.firstItem],
  [<minecraft:concrete_powder:7> * 8 ], [sa, gr, <ore:dyeGray>.firstItem],
  [<minecraft:concrete_powder:8> * 8 ], [sa, gr, <ore:dyeLightGray>.firstItem],
  [<minecraft:concrete_powder:9> * 8 ], [sa, gr, <ore:dyeCyan>.firstItem],
  [<minecraft:concrete_powder:10> * 8], [sa, gr, <ore:dyePurple>.firstItem],
  [<minecraft:concrete_powder:11> * 8], [sa, gr, <ore:dyeBlue>.firstItem],
  [<minecraft:concrete_powder:12> * 8], [sa, gr, <ore:dyeBrown>.firstItem],
  [<minecraft:concrete_powder:13> * 8], [sa, gr, <ore:dyeGreen>.firstItem],
  [<minecraft:concrete_powder:14> * 8], [sa, gr, <ore:dyeRed>.firstItem],
  [<minecraft:concrete_powder:15> * 8], [sa, gr, <ore:dyeBlack>.firstItem],

  [<mctsmelteryio:iceball>   ], [<minecraft:snow> * 2     ],
  
  [<environmentalmaterials:alabaster> * 16], [<minecraft:cobblestone> * 4, <minecraft:dye:15>                   * 5],
  [<environmentalmaterials:alabaster> * 16], [<minecraft:cobblestone> * 4, <biomesoplenty:white_dye>            * 5],
  [<environmentalmaterials:alabaster> * 16], [<minecraft:cobblestone> * 4, <thermalfoundation:dye:15>           * 5],
  [<environmentalmaterials:alabaster> * 16], [<minecraft:cobblestone> * 4, <botania:dye>                        * 5],
  [<environmentalmaterials:alabaster> * 16], [<minecraft:cobblestone> * 4, <industrialforegoing:artificial_dye> * 5],
  [<environmentalmaterials:alabaster> * 16], [<minecraft:cobblestone> * 4, <quark:root_dye:2>                   * 5],

  [<nuclearcraft:part:1>], [<ore:plateLead>.firstItem, <ic2:casing:4>, <ore:ingotTough>.firstItem * 4, <minecraft:redstone> * 4],
  [<nuclearcraft:part>], [<ore:plateLead>.firstItem, <ic2:casing:4>, <ore:ingotGraphite>.firstItem * 2],

  [<cyclicmagic:ender_snow>]      , [
    <extrautils2:decorativesolidwood>, # Magical Planks
    <ore:stickStone>.firstItem,        # Stone Rod
    <minecraft:snowball>,              # Snowball
  ],
  [<cyclicmagic:ender_blaze>]     , [
    <extrautils2:decorativesolidwood>, # Magical Planks
    <ore:stickStone>.firstItem,        # Stone Rod
    <forestry:ash>,                    # Ash
  ],
  [<cyclicmagic:battery>]         , [
    <rats:charged_creeper_chunk> * 2, # Charged Creeper Chunk
    <minecraft:redstone_block> * 4,   # Block of Redstone
    <ore:dustAsh>.firstItem * 4,      # Ash
  ],
  [<cyclicmagic:block_storeempty>], [
    <thermalfoundation:material:324>,   # Aluminum Plate
    <tconstruct:materials>,             # Seared Brick
    <ore:gemQuartzBlack>.firstItem * 4, # Black Quartz
    <thermalfoundation:material:320>,   # Copper Plate
  ],
] as IItemStack[][];

recipes.remove(<cyclicmagic:magic_net>);
recipes.remove(<cyclicmagic:ender_snow>);
recipes.remove(<cyclicmagic:ender_blaze>);
recipes.remove(<cyclicmagic:battery>);
recipes.remove(<cyclicmagic:block_storeempty>);

# Clear tank
recipes.addShapeless("Cyclic tank clear", <cyclicmagic:block_storeempty>, [<cyclicmagic:block_storeempty>]);

for i, l in packagerList {
  if(i%2==0) continue;
  if(l.length==1)
    mods.cyclicmagic.Packager.addRecipe(packagerList[i - 1][0], l[0]);
  else
    mods.cyclicmagic.Packager.addRecipe(packagerList[i - 1][0], l);
}


/*

  💧 Hydrator

*/

Hydrator.addRecipe(<thermalexpansion:florb>.withTag({Fluid: "water"}), [<thermalexpansion:florb>], 1000);

# Concrete
var concreteArr = [<minecraft:clay_ball>, <minecraft:gravel>] as IItemStack[];
Hydrator.addRecipe(<immersiveengineering:stone_decoration:5> * 4, concreteArr + (<minecraft:sand> * 2), 500);
for it in <ore:itemSlag>.items {
  Hydrator.addRecipe(<immersiveengineering:stone_decoration:5> * 6, concreteArr + (it * 2), 500);
}

# Asphalt Concrete
for bit in <ore:bitumen>.items {
  var aspConcreteArr = [bit, <minecraft:gravel>] as IItemStack[];
  Hydrator.addRecipe(<immersivepetroleum:stone_decoration> * 4, aspConcreteArr + (<minecraft:sand> * 2), 500);
  for it in <ore:itemSlag>.items {
    Hydrator.addRecipe(<immersivepetroleum:stone_decoration> * 6, aspConcreteArr + (it * 2), 500);
  }
}

# Super lubricient ice
recipes.remove(<randomthings:superlubricentice>);
recipes.addShapeless('cheaper super ice', <randomthings:superlubricentice> * 4, [<ore:slimeball>, <minecraft:ice>]);

# Decor blocks
Hydrator.removeShapedRecipe(<minecraft:cobblestone>);
Hydrator.addRecipe(<quark:iron_plate:1> * 3, [<minecraft:iron_ingot>], 125);
Hydrator.addRecipe(<quark:iron_plate:1>, [<quark:iron_plate>], 125);
Hydrator.addRecipe(<chisel:waterstone>, [<minecraft:stone>], 125);


# Misc
Hydrator.addRecipe(<actuallyadditions:item_misc:12>, [<actuallyadditions:item_misc:9>], 250);
Hydrator.addRecipe(<minecraft:ice>, [<thermalfoundation:material:1025>], 1000);
Hydrator.addRecipe(<biomesoplenty:mud>, [<minecraft:dirt>], 1000);

# Remove terracotta hydrating to prevent Infinity Furnace dupe
for i in 0 .. 16 {
  Hydrator.removeShapedRecipe(itemUtils.getItem("minecraft:stained_hardened_clay", i));
}


Hydrator.removeShapedRecipe(<minecraft:wool>);

/*

  🌢 Dehydrator

*/

# Bug: Dehydrator always output only 100mb of water
// Dehydrator.addRecipe(<ae2fc:fluid_drop>.withTag({Fluid: "water"}), <mysticalagriculture:water_essence>, 250);

// Terracotta
Dehydrator.removeShapedRecipe(<minecraft:hardened_clay>);

# Remove default useless concrete recipes
for i in 0 .. 16 {
  Dehydrator.removeShapedRecipe(<minecraft:concrete_powder>.definition.makeStack(i));
}

recipes.remove(<cyclicmagic:stone_pebble>);
Dehydrator.addRecipe(<cyclicmagic:stone_pebble>, <biomesoplenty:mudball>, 100);

# Fast dryed clay
Dehydrator.addRecipe(<tconstruct:materials:2>, <minecraft:clay_ball> * 2, 100);
Dehydrator.addRecipe(<tconstruct:dried_clay>, <minecraft:clay> * 2, 100);


/*

  🙫 Solidifier

*/

# Remove bugged recipe (Apple + Biomass => null)
// Solidifier.removeShapedRecipe(null); # Cant remove sadly =(

# Remake crystallized items to be bit harder
Solidifier.removeShapedRecipe(<cyclicmagic:crystallized_amber>);
Solidifier.addRecipe(<cyclicmagic:crystallized_amber>,    [<randomthings:weatheregg>], "amber", 1000);

Solidifier.removeShapedRecipe(<cyclicmagic:crystallized_obsidian>);
Solidifier.addRecipe(<cyclicmagic:crystallized_obsidian>, [<randomthings:weatheregg:1>], "crystal", 1000);

Solidifier.addRecipe(<cyclicmagic:glowing_chorus>, [<cyclicmagic:corrupted_chorus>], "crystal", 1000);

// Solidifier.addRecipe(<minecraft:clay>, [<minecraft:dirt>, <minecraft:dirt>], "water", 300);

recipes.remove(<cyclicmagic:charm_antidote>); Solidifier.addRecipe(<cyclicmagic:charm_antidote>, [<ore:quicksilver>.firstItem], "poison"     , 1000);
recipes.remove(<cyclicmagic:charm_water>   ); Solidifier.addRecipe(<cyclicmagic:charm_water>   , [<ore:quicksilver>.firstItem], "water"      , 1000);
recipes.remove(<cyclicmagic:charm_boat>    ); Solidifier.addRecipe(<cyclicmagic:charm_boat>    , [<ore:quicksilver>.firstItem], "canolaoil"  , 1000);
recipes.remove(<cyclicmagic:charm_fire>    ); Solidifier.addRecipe(<cyclicmagic:charm_fire>    , [<ore:quicksilver>.firstItem], "lava"       , 1000);
recipes.remove(<cyclicmagic:charm_wing>    ); Solidifier.addRecipe(<cyclicmagic:charm_wing>    , [<ore:quicksilver>.firstItem], "knightslime", 1000);

Solidifier.addRecipe(<forestry:oak_stick> * 2, [<ore:logWood>.firstItem * 2], "oliveoil", 100);
Solidifier.addRecipe(<forestry:oak_stick> * 2, [<ore:logWood>.firstItem * 2], "seed.oil", 100);

# ---------------------------------------------

# [Sword of Atrophy] from [Iron Sword][+2]
craft.remake(<cyclicmagic:sword_weakness>, ["pretty",
  "    ◊",
  "  I  ",
  "T    "], {
  "◊": <ore:gemPeridot>,                   # Peridot
  "I": <minecraft:iron_sword>.anyDamage(), # Iron Sword
  "T": <cyclicmagic:glass_strong>,         # Tempered Glass
});

# [Sword of Decay] from [Iron Sword][+2]
craft.remake(<cyclicmagic:sword_slowness>, ["pretty",
  "    ◊",
  "  I  ",
  "T    "], {
  "◊": <ore:gemSapphire>,                  # Sapphire
  "I": <minecraft:iron_sword>.anyDamage(), # Iron Sword
  "T": <cyclicmagic:glass_strong>,         # Tempered Glass
});

# [Sword of Evasion] from [Iron Sword][+2]
craft.remake(<cyclicmagic:sword_ender>, ["pretty",
  "    *",
  "  I  ",
  "T    "], {
  "*": <biomesoplenty:crystal_shard>,      # Celestial Crystal Shard
  "I": <minecraft:iron_sword>.anyDamage(), # Iron Sword
  "T": <cyclicmagic:glass_strong>,         # Tempered Glass
});

# Fix color of conveyor (was purple)
# [Conveyor_Belt] from [Clay][+2]
craft.remake(<cyclicmagic:plate_push> * 8, ["pretty",
  "▬ d ▬",
  "d c d",
  "▬ d ▬"], {
  "c": <ore:clay>,     # Clay
  "d": <ore:dyeLime>,
  "▬": <ore:ingotIron>, # Iron Ingot
});

# Remove because transcended by Conarm modifiers
utils.rh(<cyclicmagic:glowing_helmet>);

# [Experience Pylon] from [Mending Moss][+2]
craft.remake(<cyclicmagic:exp_pylon>, ["pretty",
  "S ▲ S",
  "S M S",
  "S ▲ S"], {
  "▲": <ore:dustEmerald>,         # Crushed Emerald
  "S": <ore:itemXP>, # Solidified Experience
  "M": <tconstruct:materials:19>, # Mending Moss
});

# [Empty Sack of Holding] from [Propolis][+2]
craft.remake(<cyclicmagic:chest_sack_empty>, ["pretty",
  "  s  ",
  "B P B",
  "B B B"], {
  "P": <forestry:propolis:*>, # Propolis
  "B": <ore:pelt>, # Brown Wolf Pelt
  "s": <ore:string>, # String
});

# [Ender Book] from [Tome of Knowledge][+3]
craft.remake(<cyclicmagic:book_ender>, ["pretty",
  "▬ S ▬",
  "R T R",
  "▬ S ▬"], {
  "R": <rats:ratlantean_flame>, # Ratlantean Spirit Flame
  "S": <cyclicmagic:soulstone>, # Soulstone
  "▬": <ore:ingotEndorium>,     # Endorium Ingot
  "T": <thermalfoundation:tome_experience>
    .withTag({Experience: 10000}, false)
    .only(function(item) { return
      !isNull(item.tag) &&
      !isNull(item.tag.Experience) &&
      item.tag.Experience.asInt() >= 10000
    ;}), # Tome of Knowledge
});

# [Emerald Apple] from [Magical Apple][+1]
craft.remake(<cyclicmagic:apple_emerald>, ["pretty",
  "  ◊  ",
  "◊ M ◊",
  "  ◊  "], {
  "◊": <ore:gemEmerald>,         # Emerald
  "M": <extrautils2:magicapple>, # Magical Apple
});

# [Apple Sprout] and some other items
recipes.remove(<cyclicmagic:apple>);
recipes.remove(<cyclicmagic:corrupted_chorus>);
recipes.remove(<cyclicmagic:glowing_chorus>);
scripts.lib.tooltip.desc.both(<cyclicmagic:apple>, "kill.slime.by.zombie");
scripts.lib.tooltip.desc.both(<cyclicmagic:corrupted_chorus>, "kill.slime.by.enderman");
scripts.do.entity_kill_entity.add("minecraft:slime", "minecraft:zombie", <cyclicmagic:apple>);
scripts.do.entity_kill_entity.add("minecraft:slime", "minecraft:enderman", <cyclicmagic:corrupted_chorus>);

# Craft in fire
recipes.remove(<cyclicmagic:apple_lapis>);
recipes.remove(<cyclicmagic:horse_upgrade_type>);
scripts.do.expire_in_block.set(<ore:cropApple>,  {"cyclicmagic:fire_frost": <cyclicmagic:apple_lapis>});
scripts.do.expire_in_block.set(<ore:cropCarrot>, {"cyclicmagic:fire_dark" : <cyclicmagic:horse_upgrade_type>});

# [Corrupted Chorus Fruit] peaceful alt
# [Corrupted Chorus Fruit]*16 from [Draconium Essence]*2[+1]
craft.remake(<cyclicmagic:corrupted_chorus> * 16, ["pretty",
  "  T  ",
  "T i T",
  "  T  "], {
  "T": <mysticalagriculture:slime_essence>,     # Slime Essence
  "i": <mysticalagriculture:draconium_essence>, # Draconium Essence
});

# [Dehydrator] from [Iron Rod][+2]
craft.remake(<cyclicmagic:dehydrator>, ["pretty",
  "c   c",
  "c / c",
  "# # #"], {
  "c": <ore:clay>, # Clay
  "/": <quark:iron_rod>, # Iron Rod
  "#": <ore:plankWood>, # Oak Wood Planks
});

# [Magic Bean]*4 from [Pebble]*2[+7]
craft.remake(<cyclicmagic:sprout_seed> * 4, ["pretty",
  "● ○ ⌀",
  "F r F",
  "l s A"], {
  "●": <exnihilocreatio:item_seed_oak>,     # Oak Seed
  "○": <exnihilocreatio:item_seed_spruce>,  # Spruce Seed
  "⌀": <exnihilocreatio:item_seed_birch>,   # Birch Seed
  "F": <randomthings:fertilizeddirt>,       # Fertilized Dirt
  "r": <cyclicmagic:stone_pebble>,          # Pebble
  "l": <exnihilocreatio:item_seed_jungle>,  # Jungle Seed
  "s": <exnihilocreatio:item_seed_acacia>,  # Acacia Seed
  "A": <exnihilocreatio:item_seed_darkoak>, # Dark Oak Seed
});

# [Forester] from [Magical Planks][+3]
craft.remake(<cyclicmagic:block_forester>, ["pretty",
  "r M r",
  "▲ M ▲",
  "L L L"], {
  "r": <cyclicmagic:stone_pebble>,        # Pebble
  "M": <extrautils2:decorativesolidwood>, # Magical Planks
  "▲": <ore:dustAsh>,                     # Ash
  "L": <tconstruct:firewood>,             # Lavawood
});

# [Automatic Fishing Net] from [Pebble]*2[+2]
craft.remake(<cyclicmagic:block_fishing>, ["pretty",
  "M C M",
  "C r C",
  "M C M"], {
  "M": <extrautils2:decorativesolidwood>, # Magical Planks
  "C": <minecraft:web>,                   # Cobweb
  "r": <cyclicmagic:stone_pebble>,        # Pebble
});

# [Antimatter Evaporator] from [Sponge][+2]
craft.remake(<cyclicmagic:ender_water>, ["pretty",
  "  ◊ ◊",
  "r S ◊",
  "S r  "], {
  "◊": <ore:gemLapis>,            # Lapis Lazuli
  "r": <cyclicmagic:stone_pebble>,# Pebble
  "S": <openblocks:sponge>,       # Sponge
});

# [Water Spreader] from [Demon Ingot][+3]
craft.remake(<cyclicmagic:water_spreader>, ["pretty",
  "r ◊ r",
  "  ▬  ",
  "  ■  "], {
  "r": <cyclicmagic:stone_pebble>, # Pebble
  "◊": <ore:gemLapis>,             # Lapis Lazuli
  "▬": <ore:ingotDemonicMetal>,    # Demon Ingot
  "■": <ore:blockLapis>,           # Lapis Lazuli Block
});

# [Hydrator] from [Ectoplasm][+3]
craft.remake(<cyclicmagic:block_hydrator>, ["pretty",
  "A y A",
  "A E A",
  "M M M"], {
  "A": <ore:listAllwater>,                # Fresh Water
  "y": <endreborn:food_ender_flesh>,      # Mysical Flesh
  "E": <randomthings:ingredient:2>,       # Ectoplasm
  "M": <extrautils2:decorativesolidwood>, # Magical Planks
});

# [Tempered Glass]*6 from [Mysical Flesh][+2]
craft.remake(<cyclicmagic:glass_strong> * 6, ["pretty",
  "r F r",
  "r M r",
  "r r r"], {
  "r": <cyclicmagic:stone_pebble>,   # Pebble
  "F": <thermalexpansion:florb>.withTag({Fluid: "water"}), # Florb (Water)
  "M": <endreborn:food_ender_flesh>, # Mysical Flesh
});

# [Fan] from [Tempered Glass][+1]
craft.remake(<cyclicmagic:fan>, [
  "H",
  "T"], {
  "H": <animania:block_hamster_wheel>, # Hamster Wheel
  "T": <cyclicmagic:glass_strong>,     # Tempered Glass
});

# [Standard Exchange Scepter] from [Pure Certus Quartz Crystal][+2]
craft.remake(<cyclicmagic:tool_swap>, ["pretty",
  "  ▲ ⌃",
  "  T ▲",
  "T    "], {
  "▲": <ore:dustDimensional>,      # Dimensional Blend
  "⌃": <ore:crystalPureCertusQuartz>, # Pure Certus Quartz Crystal
  "T": <cyclicmagic:glass_strong>, # Tempered Glass
});

# [Gentle Exchange Scepter] from [Precious Emerald][+2]
craft.remake(<cyclicmagic:tool_swap_match>, ["pretty",
  "  ▲ P",
  "  T ▲",
  "T    "], {
  "▲": <ore:dustDimensional>,       # Dimensional Blend
  "P": <randomthings:ingredient:9>, # Precious Emerald
  "T": <cyclicmagic:glass_strong>,  # Tempered Glass
});

# [Rod of Elevation] from [Blaze Rod][+2]
craft.remake(<cyclicmagic:tool_elevate>, ["pretty",
  "    E",
  "  /  ",
  "T    "], {
  "E": <randomthings:ingredient:2>,# Ectoplasm
  "/": <ore:rodBlaze>,             # Blaze Rod
  "T": <cyclicmagic:glass_strong>, # Tempered Glass
});

# [Enchanter] from [Tank][+3]
craft.remake(<cyclicmagic:block_enchanter>, ["pretty",
  "  L  ",
  "S T S",
  "E E E"], {
  "L": <openblocks:luggage>.withTag({size: 54}), # Luggage
  "S": <cyclicmagic:ender_eye_orb>.anyDamage(),  # Solid Ender Eye
  "T": <openblocks:tank>,                        # Tank
  "E": <minecraft:enchanting_table>,             # Enchantment Table
});

# [Magma Anvil] from [Luggage][+3]
craft.remake(<cyclicmagic:block_anvil_magma>, ["pretty",
  "■ ■ ■",
  "  L  ",
  "░ T ░"], {
  "■": <ore:blockMagma>,                         # Magma Block
  "L": <openblocks:luggage>.withTag({size: 54}), # Luggage
  "░": <ore:cobblestone>,                        # Cobblestone
  "T": <cyclicmagic:glass_strong>,               # Tempered Glass
});

# [Ender Wing Prime] from [Precious Emerald][+2]
recipes.remove(<cyclicmagic:tool_warp_home>);
craft.make(<cyclicmagic:tool_warp_home:16>, ["pretty",
  "  f f",
  "  P f",
  "E    "], {
  "f": <ore:peacockFeathers>,       # White Peacock Feather
  "P": <randomthings:ingredient:9>, # Precious Emerald
  "E": <randomthings:ingredient:1>, # Evil Tear
});

# [Ender Wing] from [Rat Diamond][+2]
recipes.remove(<cyclicmagic:tool_warp_spawn>);
craft.make(<cyclicmagic:tool_warp_spawn:16>, ["pretty",
  "  f f",
  "  ◊ f",
  "E    "], {
  "f": <ore:peacockFeathers>,       # White Peacock Feather
  "◊": <ore:gemDiamondRat>,         # Rat Diamond
  "E": <randomthings:ingredient:1>, # Evil Tear
});

# [Climbing Gloves] from [Evil Tear][+2]
craft.remake(<cyclicmagic:glove_climb>, ["pretty",
  "R R  ",
  "R E l",
  "  l l"], {
  "R": <ore:itemResin>,             # Sticky Resin
  "E": <randomthings:ingredient:1>, # Evil Tear
  "l": <ore:leather>,               # Leather
});

# [Powered Diamond Anvil] from [Magma Anvil][+4]
craft.remake(<cyclicmagic:block_anvil>, ["pretty",
  "◊ E ◊",
  "∩ M ∩",
  "■ ■ ■"], {
  "◊": <ore:gemDiamondRat>,             # Rat Diamond
  "E": <randomthings:ingredient:1>,     # Evil Tear
  "∩": <rats:charged_creeper_chunk>,    # Charged Creeper Chunk
  "M": <cyclicmagic:block_anvil_magma>, # Magma Anvil
  "■": <ore:blockFakeIron>,             # Iron Alloy Block
});

# [Solid Ender Eye] from [Eye of Ender][+1]
recipes.remove(<cyclicmagic:ender_eye_orb>);
craft.make(<cyclicmagic:ender_eye_orb:100>, ["pretty",
  "‚ ‚ ‚",
  "‚ E ‚",
  "‚ ‚ ‚"], {
  "‚": <ore:nuggetFakeIron>, # Iron Alloy Nugget
  "E": <ore:pearlEnderEye>,  # Eye of Ender
});

# [Chaos Reaper] from [Solid Ender Eye][+2]
craft.remake(<cyclicmagic:wand_hypno>, ["pretty",
  "  G S",
  "  T G",
  "T    "], {
  "G": <minecraft:golden_carrot>,   # Golden Carrot
  "S": <cyclicmagic:ender_eye_orb>, # Solid Ender Eye
  "T": <cyclicmagic:glass_strong>,  # Tempered Glass
});

# [Speed Charm] from [Evil Tear][+3]
craft.remake(<cyclicmagic:charm_speed>, ["qͼ","SE"], {
  "q": <ore:quicksilver>,             # Quicksilver
  "ͼ": <cyclicmagic:corrupted_chorus>,# Corrupted Chorus Fruit
  "S": <cyclicmagic:ender_eye_orb>,   # Solid Ender Eye
  "E": <randomthings:ingredient:1>,   # Evil Tear
});

# [Auto Crafter] from [Corrupted Chorus Fruit][+2]
craft.remake(<cyclicmagic:auto_crafter>, ["pretty",
  "T E T",
  "T ͼ T",
  "T T T"], {
  "T": <cyclicmagic:glass_strong>,     # Tempered Glass
  "E": <randomthings:ingredient:1>,    # Evil Tear
  "ͼ": <cyclicmagic:corrupted_chorus>, # Corrupted Chorus Fruit
});

# [Sprinkler] from [Slime Cube][+3]
craft.remake(<cyclicmagic:sprinkler>, ["pretty",
  "F ͼ F",
  "D § D",
  "D D D"], {
  "F": <thermalexpansion:florb>.withTag({Fluid: "water"}), # Florb (Water)
  "ͼ": <cyclicmagic:corrupted_chorus>, # Corrupted Chorus Fruit
  "D": <ore:boneDragon>,               # Dragon Bone
  "§": <randomthings:slimecube>,       # Slime Cube
});


# [Packager] from [Crafting Table][+2]
craft.remake(<cyclicmagic:auto_packager>, ["pretty",
  "◊ R ◊",
  "R w R",
  "◊ R ◊"], {
  "◊": <ore:gemLapis>,       # Lapis Lazuli
  "R": <rustic:wildberries>, # Wildberries
  "w": <ore:workbench>,      # Crafting Table
});

# [Fire Starter] from [Enchanted Plate][+4]
craft.remake(<cyclicmagic:fire_starter>, ["pretty",
  "n D n",
  "B □ B",
  "L L L"], {
  "n": <ore:netherrack>,                         # Netherrack
  "D": <cyclicmagic:ender_blaze>.anyDamage(),    # Duskflame Hex
  "B": <randomthings:ingredient:13>,             # Blackout Powder
  "□": <bibliocraft:enchantedplate>.anyDamage(), # Enchanted Plate
  "L": <tconstruct:firewood>,                    # Lavawood
});

# [Structure Builder] from [Battery][+3]
craft.remake(<cyclicmagic:builder_block>, ["pretty",
  "♥ ░ ♥",
  "░ B ░",
  "L L L"], {
  "♥": <ore:blockRedstone>,           # Block of Redstone
  "░": <appliedenergistics2:smooth_sky_stone_block>,
  "B": <cyclicmagic:battery>,         # Battery
  "L": <tconstruct:firewood>,         # Lavawood
});

# [Controlled Miner] from [Battery][+3]
craft.remake(<cyclicmagic:block_miner_smart>, ["pretty",
  "■ ░ ■",
  "░ B ░",
  "L L L"], {
  "■": <ore:blockLapis>,              # Lapis Lazuli Block
  "░": <appliedenergistics2:smooth_sky_stone_block>,
  "B": <cyclicmagic:battery>,         # Battery
  "L": <tconstruct:firewood>,         # Lavawood
});

# [Harvester] from [Battery][+4]
craft.remake(<cyclicmagic:harvester_block>, ["pretty",
  "P e P",
  "M B M",
  "L L L"], {
  "P": <randomthings:ingredient:9>,       # Precious Emerald
  "e": <ore:essence>,                     # Essence
  "M": <extrautils2:decorativesolidwood>, # Magical Planks
  "B": <cyclicmagic:battery>,             # Battery
  "L": <tconstruct:firewood>,             # Lavawood
});

# [Engraved Thunder] from [Stone Rod][+3]
craft.remake(<cyclicmagic:ender_lightning>, ["pretty",
  "  ▬ ■",
  "  / ▬",
  "B    "], {
  "▬": <ore:ingotDemonicMetal>, # Demon Ingot
  "■": <ore:blockAmber>,        # Amber Block
  "/": <ore:stickStone>,        # Stone Rod
  "B": <cyclicmagic:battery>,   # Battery
});

# [Water Candle] from [Heart Dust][+2]
craft.remake(<cyclicmagic:water_candle>, ["pretty",
  "  ‚  ",
  "  ▲  ",
  "□ □ □"], {
  "‚": <endreborn:item_raw_endorium>,             # Endorium Nugget
  "▲": <scalinghealth:heartdust>,                 # Heart Dust
  "□": <minecraft:light_weighted_pressure_plate>, # Weighted Pressure Plate (Light)
});

# [Ranged Building Scepter] from [Endorium Nugget][+1]
craft.remake(<cyclicmagic:cyclic_wand_build>, ["pretty",
  "    ‚",
  "  T  ",
  "T    "], {
  "‚": <endreborn:item_raw_endorium>, # Endorium Nugget
  "T": <cyclicmagic:glass_strong>,    # Tempered Glass
});

# [Item Collector] from [Lapis Apple][+2]
craft.remake(<cyclicmagic:block_vacuum>, ["pretty",
  "M L M",
  "M ▲ M",
  "M ▲ M"], {
  "M": <extrautils2:decorativesolidwood>, # Magical Planks
  "L": <cyclicmagic:apple_lapis>,         # Lapis Apple
  "▲": <ore:dustSkyStone>,                # Sky Stone Dust
});

# [Solidifier] from [Endorium Nugget][+4]
craft.remake(<cyclicmagic:solidifier>, ["pretty",
  "F P F",
  "■ ‚ ■",
  "M M M"], {
  "F": <cyclicmagic:block_storeempty>,    # Fluid Storage Tank
  "P": <darkutils:ender_pearl_hopper>,    # Pearled Ender Hopper
  "■": <ore:blockFakeIron>,               # Iron Alloy Block
  "‚": <endreborn:item_raw_endorium>,     # Endorium Nugget
  "M": <extrautils2:decorativesolidwood>, # Magical Planks
});

# [Automated User] from [Shulker Pearl][+3]
craft.remake(<cyclicmagic:block_user>, ["pretty",
  "  ͼ  ",
  "# ◊ #",
  "M M M"], {
  "ͼ": <cyclicmagic:glowing_chorus>,      # Glowing Chorus Fruit
  "#": <randomthings:spectrelog>,         # Spectre Wood
  "◊": <ore:gemPearl>,                    # Shulker Pearl
  "M": <extrautils2:decorativesolidwood>, # Magical Planks
});

# [Air Charm] from [Ender Wing][+3]
craft.remake(<cyclicmagic:charm_air>, ["qͼ","IE"], {
  "q": <ore:quicksilver>,                         # Quicksilver
  "ͼ": <cyclicmagic:glowing_chorus>,              # Glowing Chorus Fruit
  "I": <twilightforest:ice_bomb>,                 # Ice Bomb
  "E": <cyclicmagic:tool_warp_spawn>.anyDamage(), # Ender Wing
});

# [Pharos Beacon] from [Spectre Illuminator][+3]
craft.remake(<cyclicmagic:beacon_potion>, ["pretty",
  "▬ ͼ ▬",
  "▬ S ▬",
  "- - -"], {
  "▬": <ore:ingotSpectre>,                # Spectre Ingot
  "ͼ": <cyclicmagic:glowing_chorus>,      # Glowing Chorus Fruit
  "S": <randomthings:spectreilluminator>, # Spectre Illuminator
  "-": <ore:ingotEndorium>,               # Endorium Ingot
});

# [Pattern Replicator] from [Battery][+2]
craft.remake(<cyclicmagic:builder_pattern>, ["pretty",
  "♥   ♥",
  "◊ B ◊",
  "♥   ♥"], {
  "♥": <ore:blockRedstone>,   # Block of Redstone
  "◊": <ore:gemDiamondRat>,   # Diamond
  "B": <cyclicmagic:battery>, # Battery
});

# [Inventory Upgrade] from [Sugar Block][+3]
craft.remake(<cyclicmagic:inventory_food>, ["pretty",
  "e e e",
  "▬ ■ ▬",
  "C C C"], {
  "e": <ore:essence>,       # Essence
  "▬": <ore:ingotEndorium>, # Endorium Ingot
  "■": <ore:blockSugar>,    # Sugar Block
  "C": <ore:foodCake>,      # Cake
});

# [Monster Ball]*3 from [Heart Dust][+2]
craft.shapeless(<cyclicmagic:magic_net> * 3, "SGSG▲GSGS", {
  "S": <minecraft:snowball>,      # Snowball
  "G": <minecraft:tallgrass:1>,   # Grass
  "▲": <scalinghealth:heartdust>, # Heart Dust
});

# [Alluring Fishhook]*64 from [Truffle][+2]
craft.reshapeless(<cyclicmagic:ender_fishing> * 64, "FTC", {
  "F": <randomthings:ingredient:7>, # Floo Powder
  "T": <animania:truffle>,          # Truffle
  "C": <minecraft:web>,             # Cobweb
});
