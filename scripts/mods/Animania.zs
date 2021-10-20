#modloaded animania

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.jaopca.JAOPCA;
import mods.jaopca.OreEntry;


# ######################################################################
#
# Animania
#
# ######################################################################

#CheeseArray (yes, hashtag)
for cheese in [
	<animania:friesian_cheese_wheel>,
	<animania:holstein_cheese_wheel>,
	<animania:jersey_cheese_wheel>,
	<animania:goat_cheese_wheel>,
	<animania:sheep_cheese_wheel>
] as IItemStack[] {
	scripts.category.tooltip_utils.desc.jei(cheese, "cheese_in_mold");
}

##################
# Ore Dict
##################
<ore:peacockFeathers>.add([
    <animania:blue_peacock_feather>,
    <animania:white_peacock_feather>,
    <animania:charcoal_peacock_feather>,
    <animania:opal_peacock_feather>,
    <animania:peach_peacock_feather>,
    <animania:purple_peacock_feather>,
    <animania:taupe_peacock_feather>
]);

<ore:animaniaEggs>.add([
	<animania:brown_egg>,
	<animania:peacock_egg_blue>,
	<animania:peacock_egg_white>
]);

<ore:cheeseWheels>.add([
	<animania:friesian_cheese_wheel>,
	<animania:holstein_cheese_wheel>,
	<animania:jersey_cheese_wheel>,
	<animania:goat_cheese_wheel>,
	<animania:sheep_cheese_wheel>
]);

<ore:cheeseAnimania>.add([
	<animania:friesian_cheese_wedge>,
	<animania:holstein_cheese_wedge>,
	<animania:jersey_cheese_wedge>,
	<animania:goat_cheese_wedge>,
	<animania:sheep_cheese_wedge>
]);


var primeMeatRaw = [
    <animania:raw_prime_beef>,
    <animania:raw_prime_steak>,
    <animania:raw_prime_pork>,
    <animania:raw_prime_bacon>,
    <animania:raw_prime_chicken>,
    <animania:raw_prime_mutton>,
    <animania:raw_prime_rabbit>,
    <animania:raw_prime_chevon>,
    <animania:raw_prime_peacock>
] as IItemStack[];
<ore:primeMeatRaw>.add(primeMeatRaw);

var primeMeatCooked = [
    <animania:cooked_prime_beef>,
    <animania:cooked_prime_steak>,
    <animania:cooked_prime_pork>,
    <animania:cooked_prime_bacon>,
    <animania:cooked_prime_chicken>,
    <animania:cooked_prime_mutton>,
    <animania:cooked_prime_rabbit>,
    <animania:cooked_prime_chevon>,
    <animania:cooked_prime_peacock>
] as IItemStack[];
<ore:primeMeatCooked>.add(primeMeatCooked);


##################
# Other changes
##################

# Straw craft duplicate
recipes.removeByRecipeName("animania:straw");

# Hamster energy tooltip
<animania:block_hamster_wheel>.addTooltip("Generates 200 RF/t for 900 ticks");


# Prime meat recipes
for i, meat in primeMeatCooked { 
	furnace.remove(meat);
	scripts.wrap.inworldcrafting.FireCrafting.addRecipe(meat, primeMeatRaw[i], 20);
    mods.rats.recipes.addChefRatRecipe(primeMeatRaw[i], meat);
}

# Cut cheese and prime meat in pieces
scripts.process.mash(<animania:raw_prime_beef>        , <animania:raw_prime_steak> * 6       , null);
scripts.process.mash(<animania:jersey_cheese_wheel>   , <animania:jersey_cheese_wedge> * 6   , null);
scripts.process.mash(<animania:sheep_cheese_wheel>    , <animania:sheep_cheese_wedge> * 6    , null);
scripts.process.mash(<animania:goat_cheese_wheel>     , <animania:goat_cheese_wedge> * 6     , null);
scripts.process.mash(<animania:holstein_cheese_wheel> , <animania:holstein_cheese_wedge> * 6 , null);
scripts.process.mash(<animania:friesian_cheese_wheel> , <animania:friesian_cheese_wedge> * 6 , null);
scripts.process.mash(<animania:raw_prime_pork>        , <animania:raw_prime_bacon> * 6       , null);
scripts.process.mash(<minecraft:wheat>                , <animania:block_straw> * 2           , null);

# Remake Omelettes to use only Animania cheese
recipes.remove(<animania:super_omelette>);
recipes.remove(<animania:cheese_omelette>);
recipes.addShapeless("animania_super_omelette",   <animania:super_omelette>,   [<animania:plain_omelette>, <ore:foodBaconCooked>, <animania:truffle>, <ore:cheeseAnimania>]);
recipes.addShapeless("animania_cheese_omelette",  <animania:cheese_omelette>,  [<animania:plain_omelette>, <ore:cheeseAnimania>]);

# [Hamster_Wheel] from [Stone_Slab][+1]
craft.remake(<animania:block_hamster_wheel>, ["pretty",
    "  ╱  ",
    "╱   ╱",
    "S ╱ S"], {
    "╱": <ore:stickIron>, # Iron Rod
    "S": <ore:slabStone>  # Stone Slab
});

# Skyblock Alt
var sphere = <architecturecraft:shape>.withTag({Shape: 33, BaseName: "minecraft:planks", BaseData: 0});
scripts.wrap.tconstruct.Casting.addBasinRecipe(<animania:wild_hive>, sphere, <liquid:oliveoil>, 1000, true, 100);
scripts.wrap.tconstruct.Casting.addBasinRecipe(<animania:wild_hive>, sphere, <liquid:animania_honey>, 1000, true, 100);
scripts.wrap.tconstruct.Casting.addBasinRecipe(<animania:wild_hive>, sphere, <liquid:for.honey>, 1000, true, 100);
scripts.wrap.tconstruct.Casting.addBasinRecipe(<animania:wild_hive>, sphere, <liquid:honey>, 1000, true, 100);

# Spawn random animals
// ---------------------------
for output, ingrs in {
  # [Random Peacock] from [Ground Turkey]*2[+3]
  <animania:entity_egg_peacock_random> : [
    <harvestcraft:groundturkeyitem>,   # Ground Turkey
    <mysticalagriculture:crafting:24>, # Mystical Feather
    <rats:feathery_wing>,              # Feathery Wing
  ],

  # [Random Rabbit] from [Ground Rabbit]*2[+2]
  <animania:entity_egg_rabbit_random> : [
    <harvestcraft:groundrabbititem>, # Ground Rabbit
    <minecraft:rabbit_foot>,         # Rabbit's Foot
    <tconstruct:edible:15>,          # Rabbit Jerky
  ],

  # [Random Cow] from [Ground Beef]*2[+2]
  <animania:entity_egg_cow_random> : [
    <harvestcraft:groundbeefitem>,  # Ground Beef
    <cookingforblockheads:cow_jar>, # Cow in a Jar
    <ore:blockCheese>,              # Block of Cheese
  ],

  # [Random Pig] from [Ground Pork]*2[+2]
  <animania:entity_egg_pig_random> : [
    <harvestcraft:groundporkitem>, # Ground Pork
    <tconstruct:edible>,           # Bacon
    <ore:nuggetPigiron>,           # Pigiron Nugget
  ],

  # [Random Chicken] from [Ground Chicken]*2[+2]
  <animania:entity_egg_chicken_random> : [
    <harvestcraft:groundchickenitem>, # Ground Chicken
    <tconstruct:edible:12>,           # Chicken Jerky
    <ore:blockMeatChicken>,           # Single Compressed Chicken
  ],

  # [Random Goat] from [Ground Venison]*2[+2]
  <animania:entity_egg_goat_random> : [
    <harvestcraft:groundvenisonitem>, # Ground Venison
    <ore:boneWither>,                 # Necrotic Bone
    <endreborn:food_ender_flesh>,     # Mysical Flesh
  ],

  # [Random Sheep] from [Ground Mutton]*2[+2]
  <animania:entity_egg_sheep_random> : [
    <harvestcraft:groundmuttonitem>,    # Ground Mutton
    <ore:wool>,                         # White Wool
    <harvestcraft:hardenedleatheritem>, # Hardened Leather
  ],

  # Hamster
  <animania:entity_egg_hamster> : [
    <ore:foodGroundnutmeg>,
    <animania:hamster_food>,
    <animania:hamster_ball_clear>,
  ],
} as IIngredient[][IItemStack] {
  mods.rustic.Condenser.addRecipe(output, ingrs, <scalinghealth:heartdust>, <tconstruct:edible:33>, <fluid:wine> * 1000, 40);
}