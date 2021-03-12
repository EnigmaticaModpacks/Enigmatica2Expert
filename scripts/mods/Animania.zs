import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.jei.JEI.removeAndHide as rh;
import mods.jaopca.JAOPCA;
import mods.jaopca.OreEntry;


# ######################################################################
#
# Animania
#
# ######################################################################

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
	mods.inworldcrafting.FireCrafting.addRecipe(meat, primeMeatRaw[i], 20);
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
