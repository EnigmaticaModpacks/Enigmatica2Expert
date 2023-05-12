import mods.jei.JEI.removeAndHide;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.cyclicmagic.Hydrator;
#modloaded cyclicmagic

# Removing Obsidian -> Lava
mods.cyclicmagic.Melter.removeShapedRecipe("lava", 1000);

# Removing Simple Block Miner
removeAndHide(<cyclicmagic:block_miner>);

recipes.remove(<cyclicmagic:plate_push>);
recipes.addShaped("cyclicmagic_conveyor_belt", 
<cyclicmagic:plate_push> * 8, 
[[<ore:ingotIron>, <ore:dyeGreen>, <ore:ingotIron>], 
[<ore:dyeGreen>, <minecraft:clay_ball:*>, <ore:dyeGreen>], 
[<ore:ingotIron>, <ore:dyeGreen>, <ore:ingotIron>]]);

# User
recipes.remove(<cyclicmagic:block_user>);
recipes.addShapedMirrored("Cyclic User", 
<cyclicmagic:block_user>, 
[[<ore:ingotGold>, <ore:ingotRefinedObsidian>, <ore:ingotGold>],
[<minecraft:golden_pickaxe>, <computercraft:turtle_expanded>, <minecraft:golden_axe>], 
[<ore:compressed2xCobblestone>, <ore:compressed2xCobblestone>, <ore:compressed2xCobblestone>]]);
recipes.addShapeless("Cyclic User2", 
<cyclicmagic:block_user> * 2, 
[<integratedtunnels:part_player_simulator_item>.anyDamage(), <integratedtunnels:part_player_simulator_item>.anyDamage()]);

# Redstone Clock
recipes.remove(<cyclicmagic:clock>);
recipes.addShapedMirrored("Cyclic Redstone Clock", 
<cyclicmagic:clock>, 
[[<ore:ingotIron>, <ore:circuitAdvanced>, <ore:ingotIron>],
[<ore:circuitBasic>, <extrautils2:redstoneclock>, <ore:circuitBasic>], 
[<ore:ingotIron>, <ore:circuitAdvanced>, <ore:ingotIron>]]);

# Fluid Storage Tank
recipes.remove(<cyclicmagic:block_storeempty>);
recipes.addShapedMirrored("Cyclic Fluid Storage Tank", 
<cyclicmagic:block_storeempty>, 
[[<ore:plateAluminum>, <ore:blockGlass>, <ore:plateAluminum>],
[<ore:blockGlass>, <thermalexpansion:tank>.anyDamage(), <ore:blockGlass>], 
[<ore:plateAluminum>, <ore:blockGlass>, <ore:plateAluminum>]]);

# Charms
recipes.remove(<cyclicmagic:charm_air>);
recipes.addShapedMirrored("Air Charm", 
<cyclicmagic:charm_air>, 
[[<actuallyadditions:item_misc:15>, <bloodmagic:slate:2>, <actuallyadditions:item_misc:15>],
[<openblocks:generic>, <extrautils2:goldenlasso>.withTag({Animal:{id:"minecraft:bat"}}), <openblocks:generic>],
[<actuallyadditions:item_misc:15>, <bloodmagic:slate:2>, <actuallyadditions:item_misc:15>]]);

recipes.remove(<cyclicmagic:charm_fire>);
recipes.addShapedMirrored("Fire Charm", 
<cyclicmagic:charm_fire>, 
[[<tconstruct:edible:34>, <minecraft:potion>.withTag({Potion: "minecraft:fire_resistance"}), <tconstruct:edible:34>],
[<ore:powderBlaze>, <extrautils2:goldenlasso:1>.withTag({Animal:{id:"minecraft:blaze"}}), <ore:powderBlaze>], 
[<tconstruct:edible:34>, <minecraft:potion>.withTag({Potion: "minecraft:fire_resistance"}), <tconstruct:edible:34>]]);

recipes.remove(<cyclicmagic:charm_boat>);
recipes.addShapedMirrored("Sailor Charm", 
<cyclicmagic:charm_boat>, 
[[<ore:listAllsugar>, <ore:listAllsugar>, <ore:listAllsugar>],
[<ore:boat>, <extrautils2:goldenlasso:1>, <ore:boat>], 
[<ore:listAllsugar>, <ore:listAllsugar>, <ore:listAllsugar>]]);

recipes.remove(<cyclicmagic:charm_void>);
recipes.addShapedMirrored("Void Charm", 
<cyclicmagic:charm_void>, 
[[<ore:bEnderAirBottle>, <cyclicmagic:ender_eye_orb>, <ore:bEnderAirBottle>],
[<cyclicmagic:ender_eye_orb>, <extrautils2:goldenlasso:1>.withTag({Animal:{id:"minecraft:enderman"}}), <cyclicmagic:ender_eye_orb>], 
[<ore:bEnderAirBottle>, <cyclicmagic:ender_eye_orb>, <ore:bEnderAirBottle>]]);

recipes.remove(<cyclicmagic:charm_water>);
recipes.addShapedMirrored("Water Charm", 
<cyclicmagic:charm_water>, 
[[<minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>],
[<mekanism:gastank>, <extrautils2:goldenlasso>.withTag({Animal:{id:"minecraft:squid"}}), <mekanism:gastank>], 
[<minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>]]);

recipes.remove(<cyclicmagic:charm_antidote>);
recipes.addShapedMirrored("Antidote Charm", 
<cyclicmagic:charm_antidote>, 
[[<ore:listAllmilk>, <ore:listAllmilk>, <ore:listAllmilk>],
[<minecraft:poisonous_potato>, <extrautils2:goldenlasso:1>.withTag({Animal:{id:"minecraft:witch"}}), <minecraft:poisonous_potato>], 
[<ore:listAllmilk>, <ore:listAllmilk>, <ore:listAllmilk>]]);

recipes.remove(<cyclicmagic:charm_wing>);
recipes.addShapedMirrored("Wing Charm", 
<cyclicmagic:charm_wing>, 
[[<ore:feather>, <ore:feather>, <ore:feather>],
[<minecraft:rabbit_foot>, <extrautils2:goldenlasso>.withTag({Animal:{id:"minecraft:chicken"} }), <minecraft:rabbit_foot>], 
[<ore:feather>, <ore:feather>, <ore:feather>]]);

recipes.remove(<cyclicmagic:charm_speed>);
recipes.addShaped("Speed Charm", 
<cyclicmagic:charm_speed>, 
[[null, <minecraft:potion>.withTag({Potion: "minecraft:swiftness"}), null],
[<ore:foodCake>, <extrautils2:goldenlasso>.withTag({Animal:{id:"minecraft:horse"} }), <ore:foodCake>], 
[null, <minecraft:potion>.withTag({Potion: "minecraft:swiftness"}), null]]);

# Harvester
recipes.remove(<cyclicmagic:harvester_block>);
recipes.addShaped("Cyclic Harvester", 
<cyclicmagic:harvester_block>, 
[[<ore:gemEmerald>, <minecraft:dispenser>, <ore:gemEmerald>],
[<ore:gemQuartz>, <ic2:resource:13>, <ore:gemQuartz>], 
[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>]]);

# Forester
recipes.remove(<cyclicmagic:block_forester>);
recipes.addShaped("Cyclic Forester", 
<cyclicmagic:block_forester>, 
[[<ore:logWood>, <minecraft:dispenser>, <ore:logWood>],
[<minecraft:diamond_axe>, <ic2:resource:12>, <minecraft:diamond_axe>], 
[<minecraft:furnace>, <minecraft:furnace>, <minecraft:furnace>]]);

# Cyclic Storage Bag
recipes.remove(<cyclicmagic:storage_bag>);
recipes.addShaped("Storage Bag", 
<cyclicmagic:storage_bag>, 
[[<ore:leather>, <ore:string>, <ore:leather>],
[<ore:leather>, <ore:blockGold>, <ore:leather>], 
[<ore:leather>, <ore:blockRedstone>, <ore:leather>]]);

# Diamond Anvil
recipes.remove(<cyclicmagic:block_anvil>);
recipes.addShaped("Diamond Anvil", 
<cyclicmagic:block_anvil>, 
[[<ore:gemDiamond>, <ore:plateDenseObsidian>, <ore:gemDiamond>],
[<ore:dustRedstone>, <actuallyadditions:block_item_repairer>, <ore:dustRedstone>], 
[<ore:blockIron>, <ore:blockIron>, <ore:blockIron>]]);

# Explosionproof Cyclic Glass
recipes.remove(<cyclicmagic:glass_strong>);
recipes.addShaped("Cyclic Strong Glass", 
<cyclicmagic:glass_strong>*8, 
[[<extrautils2:decorativeglass:3>, <extrautils2:decorativeglass:3>, <extrautils2:decorativeglass:3>], 
[<extrautils2:decorativeglass:3>, <enderio:block_reinforced_obsidian>, <extrautils2:decorativeglass:3>], 
[<extrautils2:decorativeglass:3>, <extrautils2:decorativeglass:3>, <extrautils2:decorativeglass:3>]
]);

# Clear tank
recipes.addShapeless("Cyclic tank clear", <cyclicmagic:block_storeempty>, [<cyclicmagic:block_storeempty>]);


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
  
  [<environmentalmaterials:alabaster> * 16], [<minecraft:cobblestone> * 4, <minecraft:dye:15>                   * 5],
  [<environmentalmaterials:alabaster> * 16], [<minecraft:cobblestone> * 4, <biomesoplenty:white_dye>            * 5],
  [<environmentalmaterials:alabaster> * 16], [<minecraft:cobblestone> * 4, <thermalfoundation:dye:15>           * 5],
  [<environmentalmaterials:alabaster> * 16], [<minecraft:cobblestone> * 4, <botania:dye>                        * 5],
  [<environmentalmaterials:alabaster> * 16], [<minecraft:cobblestone> * 4, <industrialforegoing:artificial_dye> * 5],
  [<environmentalmaterials:alabaster> * 16], [<minecraft:cobblestone> * 4, <quark:root_dye:2>                   * 5],
] as IItemStack[][];

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
for it in <ore:slimeball>.items {
  Hydrator.addRecipe(<randomthings:superlubricentice> * 16, [it, <minecraft:ice>], 1000);
}

# Decor blocks
Hydrator.removeShapedRecipe(<minecraft:cobblestone>);
Hydrator.addRecipe(<quark:iron_plate:1> * 3, [<minecraft:iron_ingot>], 125);
Hydrator.addRecipe(<quark:iron_plate:1>, [<quark:iron_plate>], 125);
Hydrator.addRecipe(<chisel:waterstone>, [<minecraft:stone>], 125);


# Misc
Hydrator.addRecipe(<actuallyadditions:item_misc:12>, [<actuallyadditions:item_misc:9>], 250);
Hydrator.addRecipe(<minecraft:ice>, [<thermalfoundation:material:1025>], 1000);
Hydrator.addRecipe(<biomesoplenty:mud>, [<minecraft:dirt>], 1000);

# Remove terracotta hydrating
for i in 0 .. 16 {
  Hydrator.removeShapedRecipe(itemUtils.getItem("minecraft:stained_hardened_clay", i));
}


Hydrator.removeShapedRecipe(<minecraft:wool>);
# ---------------------------------------------

