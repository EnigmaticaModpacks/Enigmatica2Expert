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

# Buff from 100
<animania:carving_knife>.maxDamage = 1000;

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
# Other changes
##################

# Straw craft duplicate
recipes.removeByRecipeName("animania:straw");

# Hamster energy tooltip
<animania:block_hamster_wheel>.addTooltip("Generates 200 RF/t for 900 ticks");

val primeMeatRecipes = {
  <tconstruct:edible>          :  <animania:cooked_prime_bacon>,
  <animania:raw_prime_beef>    :  <animania:cooked_prime_beef>,
  <animania:raw_prime_steak>   :  <animania:cooked_prime_steak>,
  <animania:raw_prime_pork>    :  <animania:cooked_prime_pork>,
  <animania:raw_prime_bacon>   :  <animania:cooked_prime_bacon>,
  <animania:raw_prime_chicken> :  <animania:cooked_prime_chicken>,
  <animania:raw_prime_mutton>  :  <animania:cooked_prime_mutton>,
  <animania:raw_prime_rabbit>  :  <animania:cooked_prime_rabbit>,
  <animania:raw_prime_chevon>  :  <animania:cooked_prime_chevon>,
  <animania:raw_prime_peacock> :  <animania:cooked_prime_peacock>,
} as IItemStack[IItemStack];

# Prime meat recipes
for raw, cooked in primeMeatRecipes { 
	furnace.remove(cooked);
	mods.inworldcrafting.FireCrafting.addRecipe(cooked, raw, 20);
  mods.rats.recipes.addChefRatRecipe(raw, cooked);
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
mods.tconstruct.Casting.addBasinRecipe(<animania:wild_hive>, sphere, <liquid:oliveoil>, 1000, true, 100);
mods.tconstruct.Casting.addBasinRecipe(<animania:wild_hive>, sphere, <liquid:animania_honey>, 1000, true, 100);
mods.tconstruct.Casting.addBasinRecipe(<animania:wild_hive>, sphere, <liquid:for.honey>, 1000, true, 100);
mods.tconstruct.Casting.addBasinRecipe(<animania:wild_hive>, sphere, <liquid:honey>, 1000, true, 100);

# Spawn random animals
// ---------------------------
for output, ingrs in {
  # [Random Peacock] from [Ground Turkey]*2[+3]
  <animania:entity_egg_peacock_random> * 4 : [
    <harvestcraft:groundturkeyitem>,   # Ground Turkey
    <mysticalagriculture:crafting:24>, # Mystical Feather
    <rats:feathery_wing>,              # Feathery Wing
  ],

  # [Random Rabbit] from [Ground Rabbit]*2[+2]
  <animania:entity_egg_rabbit_random> * 4 : [
    <harvestcraft:groundrabbititem>, # Ground Rabbit
    <minecraft:rabbit_foot>,         # Rabbit's Foot
    <tconstruct:edible:15>,          # Rabbit Jerky
  ],

  # [Random Cow] from [Ground Beef]*2[+2]
  <animania:entity_egg_cow_random> * 4 : [
    <harvestcraft:groundbeefitem>,  # Ground Beef
    <cookingforblockheads:cow_jar>, # Cow in a Jar
    <ore:blockCheese>,              # Block of Cheese
  ],

  # [Random Pig] from [Ground Pork]*2[+2]
  <animania:entity_egg_pig_random> * 4 : [
    <harvestcraft:groundporkitem>, # Ground Pork
    <tconstruct:edible>,           # Bacon
    <ore:nuggetPigiron>,           # Pigiron Nugget
  ],

  # [Random Chicken] from [Ground Chicken]*2[+2]
  <animania:entity_egg_chicken_random> * 4 : [
    <harvestcraft:groundchickenitem>, # Ground Chicken
    <tconstruct:edible:12>,           # Chicken Jerky
    <ore:blockMeatChicken>,           # Single Compressed Chicken
  ],

  # [Random Goat] from [Ground Venison]*2[+2]
  <animania:entity_egg_goat_random> * 4 : [
    <harvestcraft:groundvenisonitem>, # Ground Venison
    <ore:boneWither>,                 # Necrotic Bone
    <endreborn:food_ender_flesh>,     # Mysical Flesh
  ],

  # [Random Sheep] from [Ground Mutton]*2[+2]
  <animania:entity_egg_sheep_random> * 4 : [
    <harvestcraft:groundmuttonitem>,    # Ground Mutton
    <ore:wool>,                         # White Wool
    <harvestcraft:hardenedleatheritem>, # Hardened Leather
  ],

  # Hamster
  <animania:entity_egg_hamster> * 4 : [
    <ore:foodGroundnutmeg>,
    <animania:hamster_food>,
    <animania:hamster_ball_clear>,
  ],
} as IIngredient[][IItemStack] {
  mods.rustic.Condenser.addRecipe(output, ingrs, <scalinghealth:heartdust>, <tconstruct:edible:33>, <fluid:wine> * 1000, 40);
}

# Advanced cheese recipe
scripts.processUtils.avdRockXmlRecipe("Crystallizer", [<ore:itemSalt>], [<fluid:milk_sheep>    * 500], [<animania:sheep_cheese_wheel>], null);
scripts.processUtils.avdRockXmlRecipe("Crystallizer", [<ore:itemSalt>], [<fluid:milk_goat>     * 500], [<animania:goat_cheese_wheel>], null);
scripts.processUtils.avdRockXmlRecipe("Crystallizer", [<ore:itemSalt>], [<fluid:milk_jersey>   * 500], [<animania:jersey_cheese_wheel>], null);
scripts.processUtils.avdRockXmlRecipe("Crystallizer", [<ore:itemSalt>], [<fluid:milk_holstein> * 500], [<animania:holstein_cheese_wheel>], null);
scripts.processUtils.avdRockXmlRecipe("Crystallizer", [<ore:itemSalt>], [<fluid:milk_friesian> * 500], [<animania:friesian_cheese_wheel>], null);

# New cross-mod drops
<entity:animania:bull_mooshroom>.addDrop(<thaumicwonders:vishroom_spore>, 2, 6);
<entity:animania:calf_mooshroom>.addDrop(<thaumicwonders:vishroom_spore>, 2, 6);
<entity:animania:cow_mooshroom>.addDrop(<thaumicwonders:vishroom_spore>, 2, 6);
<entity:animania:bull_mooshroom>.addDrop(<nuclearcraft:glowing_mushroom>, 2, 12);
<entity:animania:calf_mooshroom>.addPlayerOnlyDrop(<toolprogression:magic_mushroom>, 1, 1);
<entity:animania:cow_mooshroom>.addPlayerOnlyDrop(<ic2:crop_seed_bag>.withTag({owner: "ic2", scan: 4 as byte, growth: 20 as byte, id: "red_mushroom", resistance: 20 as byte, gain: 20 as byte}), 1, 1);
<entity:animania:ferret_grey>.addDrop(<actuallyadditions:item_hairy_ball>,  1, 5);
<entity:animania:ferret_white>.addDrop(<actuallyadditions:item_hairy_ball>, 1, 5);
<entity:animania:hamster>.addDrop(<actuallyadditions:item_hairy_ball>, 2, 3);
<entity:animania:hedgehog>.addDrop(<exnihilocreatio:item_material:2>, 1, 3);
<entity:animania:hedgehog>.addPlayerOnlyDrop(<actuallyadditions:item_worm>, 1, 3);
<entity:animania:hedgehog_albino>.addDrop(<exnihilocreatio:item_material:2>, 1, 3);
<entity:animania:hedgehog_albino>.addPlayerOnlyDrop(<actuallyadditions:item_worm>, 1, 3);
