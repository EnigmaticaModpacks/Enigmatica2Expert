#modloaded emberroot

<entity:emberroot:fairies>.addPlayerOnlyDrop(<astralsorcery:itemusabledust>, 1, 6);

scripts.lib.loot.tweak("emberroot:entity/golem_blue"     ,"main","minecraft:iron_nugget" , null, [<extrautils2:unstableingots:1>]         , [2,4]);
scripts.lib.loot.tweak("emberroot:entity/golem_green"    ,"main","minecraft:gunpowder"   , null, [<mysticalagriculture:crafting:39>]      , [2,8]);
scripts.lib.loot.tweak("emberroot:entity/golem_orange"   ,"main","minecraft:coal"        , null, [<mekanism:nugget:3>]                    , [3,14]);
scripts.lib.loot.tweak("emberroot:entity/golem_purple"   ,"main","minecraft:spider_eye"  , null, [<mechanics:heavy_nugget>]               , [5,24]);
scripts.lib.loot.tweak("emberroot:entity/golem_red"      ,"main","minecraft:redstone"    , null, [<mysticalagriculture:redstone_essence>] , [1,4]);
scripts.lib.loot.tweak("emberroot:entity/golem_yellow"   ,"main","minecraft:gold_nugget" , null, [<thermalfoundation:material:228>]       , [8,18]);
scripts.lib.loot.tweak("emberroot:entity/skeleton_frozen","main","minecraft:ice"         , null, [<mctsmelteryio:iceball>]                , [1,6]);
scripts.lib.loot.tweak("emberroot:entity/sprite_mini"    ,"main","minecraft:rotten_flesh", null, [<mysticalagriculture:nature_essence>]   , [1,3]);
scripts.lib.loot.tweak("emberroot:entity/sprite_normal"  ,"main","minecraft:rotten_flesh", null, [<mysticalagriculture:dye_essence>]      , [2,7]);
scripts.lib.loot.tweak("emberroot:entity/sprite_greater" ,"main",null                    , null, [<mysticalagriculture:platinum_essence>] , [1,3]);

<entity:emberroot:deers>.clearDrops();
<entity:emberroot:hero>.addPlayerOnlyDrop(<actuallyadditions:item_void_bag> % 10, 1, 1);
<entity:emberroot:hero>.addPlayerOnlyDrop(<cyclicmagic:charm_void> % 10, 1, 1);
<entity:emberroot:hero>.addPlayerOnlyDrop(<cyclicmagic:sack_ender> % 10, 1, 1);
<entity:emberroot:hero>.addPlayerOnlyDrop(<cyclicmagic:storage_bag> % 10, 1, 1);
<entity:emberroot:hero>.addPlayerOnlyDrop(<thermalexpansion:satchel:100> % 10, 1, 1);
<entity:emberroot:withercat>.addDrop(<extrautils2:ingredients:11>, 1, 3);
