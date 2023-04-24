#modloaded animania

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.jaopca.JAOPCA;
import mods.jaopca.OreEntry;
import crafttweaker.entity.IEntityDefinition;

// Animania Random Animal Spawn Egg
scripts.mods.forestry.Carpenter.addRecipe(<animania:entity_egg_random>,
  [[null, <cyclicmagic:sprout_seed>, null],
    [<ore:egg>, <ore:egg>, <ore:egg>],
    [null, <cyclicmagic:sprout_seed>, null]],
  40, <liquid:meat> * 500);

scripts.mods.forestry.Carpenter.addRecipe(<animania:entity_egg_random>,
  [[null, <cyclicmagic:sprout_seed>, null],
    [<ore:egg>, <ore:egg>, <ore:egg>],
    [null, <cyclicmagic:sprout_seed>, null]],
  40, <liquid:liquiddna> * 250);

// Mud conversion
recipes.remove(<animania:block_mud>);
recipes.addShapeless('BoP Mud', <biomesoplenty:mud>, [<animania:block_mud>]);
recipes.addShapeless('Animania Mud', <animania:block_mud>, [<biomesoplenty:mud>]);


// ---------------------------------------------------------------
// Mob drops
// ---------------------------------------------------------------

# Add 2-3 more Rabbit Legs to Animania's rabbits
for entity in [
  <entity:animania:buck_chinchilla>,
  <entity:animania:buck_cottontail>,
  <entity:animania:buck_dutch>,
  <entity:animania:buck_havana>,
  <entity:animania:buck_jack>,
  <entity:animania:buck_lop>,
  <entity:animania:buck_new_zealand>,
  <entity:animania:buck_rex>,
  <entity:animania:doe_chinchilla>,
  <entity:animania:doe_cottontail>,
  <entity:animania:doe_dutch>,
  <entity:animania:doe_havana>,
  <entity:animania:doe_jack>,
  <entity:animania:doe_lop>,
  <entity:animania:doe_new_zealand>,
  <entity:animania:doe_rex>,
  <entity:animania:kit_chinchilla>,
  <entity:animania:kit_cottontail>,
  <entity:animania:kit_dutch>,
  <entity:animania:kit_havana>,
  <entity:animania:kit_jack>,
  <entity:animania:kit_lop>,
  <entity:animania:kit_new_zealand>,
  <entity:animania:kit_rex>,
] as IEntityDefinition[] {
  entity.addPlayerOnlyDrop(<minecraft:rabbit_foot>, 2, 3);
}

// ---------------------------------------------------------------

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
	scripts.lib.tooltip.desc.jei(cheese, "cheese_in_mold");
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
