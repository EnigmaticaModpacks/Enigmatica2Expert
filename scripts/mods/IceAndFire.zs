import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded iceandfire

# *======= Recipes =======*

# Cockatrice Scepter
	recipes.addShaped("Cockatrice Scepter", 
	<iceandfire:cockatrice_scepter>, 
	[[<ore:boneWither>], 
	[<iceandfire:cockatrice_eye>], 
	[<ore:boneWither>]]);

# Bone Conversion 
	recipes.addShapeless("Dragon Bone Conversion", <minecraft:bone> * 9, [<iceandfire:dragonbone>]);
	
# Dragon Heart -> Draconic Dragon Heart
	recipes.addShapeless("Dragon Heart Conversion1", 
	<draconicevolution:dragon_heart>, 
	[<iceandfire:ice_dragon_heart>]);
	
	recipes.addShapeless("Dragon Heart Conversion2", 
	<draconicevolution:dragon_heart>, 
	[<iceandfire:fire_dragon_heart>]);

# Witherbone conversion
	recipes.addShapeless("Witherbone Conversion1", 
	<tconstruct:materials:17>, 
	[<iceandfire:witherbone>]);
	
	recipes.addShapeless("Witherbone Conversion2", 
	<iceandfire:witherbone>, 
	[<tconstruct:materials:17>]);
	
# Remove existing Ash -> Charcoal recipe (Credit TheShadoWZYE)
	recipes.removeShaped(<minecraft:coal:1>, 
	[[<iceandfire:ash>, <iceandfire:ash>, <iceandfire:ash>],
	[<iceandfire:ash>, <iceandfire:ash>, <iceandfire:ash>], 
	[<iceandfire:ash>, <iceandfire:ash>, <iceandfire:ash>]]);
# Ash -> Coal Coke
	recipes.addShaped("Ash To Coal Coke", 
	<immersiveengineering:stone_decoration:3>, 
	[[<iceandfire:ash>, <iceandfire:ash>, <iceandfire:ash>],
	[<iceandfire:ash>, <iceandfire:ash>, <iceandfire:ash>], 
	[<iceandfire:ash>, <iceandfire:ash>, <iceandfire:ash>]]);

# Removals
	val removals = [
<iceandfire:sapphire_ore>,
<iceandfire:sapphire_block>,
<iceandfire:sapphire_gem>,
<iceandfire:armor_silver_metal_helmet>,
<iceandfire:armor_silver_metal_chestplate>,
<iceandfire:armor_silver_metal_leggings>,
<iceandfire:armor_silver_metal_boots>,
<iceandfire:silver_pickaxe>,
<iceandfire:silver_sword>,
<iceandfire:silver_shovel>,
<iceandfire:silver_axe>,
<iceandfire:silver_hoe>,
<iceandfire:dragonbone_bow>,
<iceandfire:dragonbone_arrow>,
<iceandfire:dragonbone_hoe>,
<iceandfire:dragonbone_axe>,
<iceandfire:dragonbone_pickaxe>,
<iceandfire:dragonbone_shovel>,
<iceandfire:dragonsteel_fire_axe>,
<iceandfire:dragonsteel_fire_hoe>,
<iceandfire:dragonsteel_fire_pickaxe>,
<iceandfire:dragonsteel_fire_shovel>,
<iceandfire:dragonsteel_ice_axe>,
<iceandfire:dragonsteel_ice_hoe>,
<iceandfire:dragonsteel_ice_pickaxe>,
<iceandfire:dragonsteel_ice_shovel>,
<iceandfire:myrmex_desert_axe>,
<iceandfire:myrmex_desert_hoe>,
<iceandfire:myrmex_desert_pickaxe>,
<iceandfire:myrmex_desert_shovel>,
<iceandfire:myrmex_desert_sword>,
<iceandfire:myrmex_jungle_axe>,
<iceandfire:myrmex_jungle_hoe>,
<iceandfire:myrmex_jungle_pickaxe>,
<iceandfire:myrmex_jungle_shovel>,
<iceandfire:myrmex_jungle_sword>,
<iceandfire:silver_ore>,

<iceandfire:dragonbone_sword>,
<iceandfire:deathworm_yellow_helmet>,
<iceandfire:deathworm_yellow_chestplate>,
<iceandfire:deathworm_yellow_leggings>,
<iceandfire:deathworm_yellow_boots>,
<iceandfire:deathworm_white_helmet>,
<iceandfire:deathworm_white_chestplate>,
<iceandfire:dragonbone_sword_fire>,
<iceandfire:dragonbone_sword_ice>,
<iceandfire:deathworm_white_leggings>,
<iceandfire:deathworm_white_boots>,
<iceandfire:deathworm_red_helmet>,
<iceandfire:deathworm_red_chestplate>,
<iceandfire:deathworm_red_leggings>,
<iceandfire:deathworm_red_boots>,
<iceandfire:myrmex_desert_helmet>,
<iceandfire:myrmex_desert_chestplate>,
<iceandfire:myrmex_desert_leggings>,
<iceandfire:myrmex_desert_boots>,
<iceandfire:myrmex_jungle_helmet>,
<iceandfire:myrmex_jungle_chestplate>,
<iceandfire:myrmex_jungle_leggings>,
<iceandfire:myrmex_jungle_boots>,
<iceandfire:dragonsteel_fire_helmet>,
<iceandfire:dragonsteel_fire_chestplate>,
<iceandfire:dragonsteel_fire_leggings>,
<iceandfire:dragonsteel_fire_boots>,
<iceandfire:dragonsteel_fire_sword>,
<iceandfire:dragonsteel_ice_sword>,
<iceandfire:dragonsteel_ice_helmet>,
<iceandfire:dragonsteel_ice_chestplate>,
<iceandfire:dragonsteel_ice_leggings>,
<iceandfire:dragonsteel_ice_boots>,
<iceandfire:armor_red_helmet>,
<iceandfire:armor_red_chestplate>,
<iceandfire:armor_red_leggings>,
<iceandfire:armor_red_boots>,
<iceandfire:armor_bronze_helmet>,
<iceandfire:armor_bronze_chestplate>,
<iceandfire:armor_bronze_leggings>,
<iceandfire:armor_bronze_boots>,
<iceandfire:armor_green_helmet>,
<iceandfire:armor_green_chestplate>,
<iceandfire:armor_green_leggings>,
<iceandfire:armor_green_boots>,
<iceandfire:armor_gray_helmet>,
<iceandfire:armor_gray_chestplate>,
<iceandfire:armor_gray_leggings>,
<iceandfire:armor_gray_boots>,
<iceandfire:armor_blue_helmet>,
<iceandfire:armor_blue_chestplate>,
<iceandfire:armor_blue_leggings>,
<iceandfire:armor_blue_boots>,
<iceandfire:armor_white_helmet>,
<iceandfire:armor_white_chestplate>,
<iceandfire:armor_white_leggings>,
<iceandfire:armor_white_boots>,
<iceandfire:armor_sapphire_helmet>,
<iceandfire:armor_sapphire_chestplate>,
<iceandfire:armor_sapphire_leggings>,
<iceandfire:armor_sapphire_boots>,
<iceandfire:armor_silver_helmet>,
<iceandfire:armor_silver_chestplate>,
<iceandfire:armor_silver_leggings>,
<iceandfire:armor_silver_boots>,
<iceandfire:tide_blue_helmet>,
<iceandfire:tide_blue_chestplate>,
<iceandfire:tide_blue_leggings>,
<iceandfire:tide_blue_boots>,
<iceandfire:tide_bronze_helmet>,
<iceandfire:tide_bronze_chestplate>,
<iceandfire:tide_bronze_leggings>,
<iceandfire:tide_bronze_boots>,
<iceandfire:tide_deepblue_helmet>,
<iceandfire:tide_deepblue_chestplate>,
<iceandfire:tide_deepblue_leggings>,
<iceandfire:tide_deepblue_boots>,
<iceandfire:tide_green_helmet>,
<iceandfire:tide_green_chestplate>,
<iceandfire:tide_green_leggings>,
<iceandfire:tide_green_boots>,
<iceandfire:tide_purple_helmet>,
<iceandfire:tide_purple_chestplate>,
<iceandfire:tide_purple_leggings>,
<iceandfire:tide_purple_boots>,
<iceandfire:tide_red_helmet>,
<iceandfire:tide_red_chestplate>,
<iceandfire:tide_red_leggings>,
<iceandfire:tide_red_boots>,
<iceandfire:tide_teal_helmet>,
<iceandfire:tide_teal_chestplate>,
<iceandfire:tide_teal_leggings>,
<iceandfire:tide_teal_boots>,
<iceandfire:forest_troll_leather_helmet>,
<iceandfire:forest_troll_leather_chestplate>,
<iceandfire:forest_troll_leather_leggings>,
<iceandfire:forest_troll_leather_boots>,
<iceandfire:frost_troll_leather_helmet>,
<iceandfire:frost_troll_leather_chestplate>,
<iceandfire:frost_troll_leather_leggings>,
<iceandfire:frost_troll_leather_boots>,
<iceandfire:mountain_troll_leather_helmet>,
<iceandfire:mountain_troll_leather_chestplate>,
<iceandfire:mountain_troll_leather_leggings>,
<iceandfire:mountain_troll_leather_boots>,
	] as IItemStack[];
	
	for item in removals {
		rh(item);
	}

	# Dragon Armor
	val dragonArmor = [
		<iceandfire:armor_red_helmet>,
		<iceandfire:armor_red_chestplate>,
		<iceandfire:armor_red_leggings>,
		<iceandfire:armor_red_boots>,
		<iceandfire:armor_bronze_helmet>,
		<iceandfire:armor_bronze_chestplate>,
		<iceandfire:armor_bronze_leggings>,
		<iceandfire:armor_bronze_boots>,
		<iceandfire:armor_green_helmet>,
		<iceandfire:armor_green_chestplate>,
		<iceandfire:armor_green_leggings>,
		<iceandfire:armor_green_boots>,
		<iceandfire:armor_gray_helmet>,
		<iceandfire:armor_gray_chestplate>,
		<iceandfire:armor_gray_leggings>,
		<iceandfire:armor_gray_boots>,
		<iceandfire:armor_blue_helmet>,
		<iceandfire:armor_blue_chestplate>,
		<iceandfire:armor_blue_leggings>,
		<iceandfire:armor_blue_boots>,
		<iceandfire:armor_white_helmet>,
		<iceandfire:armor_white_chestplate>,
		<iceandfire:armor_white_leggings>,
		<iceandfire:armor_white_boots>,
		<iceandfire:armor_sapphire_helmet>,
		<iceandfire:armor_sapphire_chestplate>,
		<iceandfire:armor_sapphire_leggings>,
		<iceandfire:armor_sapphire_boots>,
		<iceandfire:armor_silver_helmet>,
		<iceandfire:armor_silver_chestplate>,
		<iceandfire:armor_silver_leggings>,
		<iceandfire:armor_silver_boots>
	] as IItemStack[];
	
	for armor in dragonArmor {
	<ore:armorDragon>.add(armor);
	}
	

# ######################################################################
#
# Oredict
#
# ######################################################################

# Ore dragonsteel ingot
<ore:dragonsteelIngot>.add([
	<iceandfire:dragonsteel_fire_ingot>, 
	<iceandfire:dragonsteel_ice_ingot>]);

# Ore 
<ore:chitinMyrmex>.add([
	<iceandfire:myrmex_desert_chitin>,
	<iceandfire:myrmex_jungle_chitin>]);

# Ore Dragon scales blocks
<ore:dragonscaleBlock>.add([
	<iceandfire:dragonscale_blue>,
	<iceandfire:dragonscale_bronze>,
	<iceandfire:dragonscale_gray>,
	<iceandfire:dragonscale_green>,
	<iceandfire:dragonscale_red>,
	<iceandfire:dragonscale_sapphire>,
	<iceandfire:dragonscale_silver>,
	<iceandfire:dragonscale_white>
]);

# Ore dragonscales
<ore:dragonscales>.add([
    <iceandfire:dragonscales_red>,
    <iceandfire:dragonscales_green>,
    <iceandfire:dragonscales_bronze>,
    <iceandfire:dragonscales_gray>,
    <iceandfire:dragonscales_blue>,
    <iceandfire:dragonscales_white>,
    <iceandfire:dragonscales_sapphire>,
    <iceandfire:dragonscales_silver>
]);

<ore:dragonFireScales>.add([
	<iceandfire:dragonscales_red>,
	<iceandfire:dragonscales_green>,
	<iceandfire:dragonscales_bronze>,
	<iceandfire:dragonscales_gray>,
]);

<ore:dragonIceScales>.add([
	<iceandfire:dragonscales_blue>,
	<iceandfire:dragonscales_white>,
	<iceandfire:dragonscales_sapphire>,
	<iceandfire:dragonscales_silver>,
]);


# Ore Myrmex Glass
<ore:myrmexResinGlass>.add([
	<iceandfire:myrmex_desert_resin_glass>,
	<iceandfire:myrmex_jungle_resin_glass>
]);

# Ore Deathworm Chitin
<ore:deathwormChitin>.add([
	<iceandfire:deathworm_chitin:1>,
	<iceandfire:deathworm_chitin:2>,
	<iceandfire:deathworm_chitin>
]);

# Ore Sea Serpent Scale Block
<ore:seaSerpentScaleBlock>.add([
	<iceandfire:sea_serpent_scale_block_blue>,
	<iceandfire:sea_serpent_scale_block_bronze>,
	<iceandfire:sea_serpent_scale_block_deepblue>,
	<iceandfire:sea_serpent_scale_block_green>,
	<iceandfire:sea_serpent_scale_block_purple>,
	<iceandfire:sea_serpent_scale_block_red>,
	<iceandfire:sea_serpent_scale_block_teal>
]);

# Ore Sea Serpent Scale
<ore:seaSerpentScaleBlock>.add([
	<iceandfire:sea_serpent_scale_block_blue>,
	<iceandfire:sea_serpent_scale_block_bronze>,
	<iceandfire:sea_serpent_scale_block_deepblue>,
	<iceandfire:sea_serpent_scale_block_green>,
	<iceandfire:sea_serpent_scale_block_purple>,
	<iceandfire:sea_serpent_scale_block_red>,
	<iceandfire:sea_serpent_scale_block_teal>
]);

# Ore Sea Serpent Scales
<ore:dragonscales>.add([
    <iceandfire:sea_serpent_scales_blue>,
    <iceandfire:sea_serpent_scales_bronze>,
    <iceandfire:sea_serpent_scales_deepblue>,
    <iceandfire:sea_serpent_scales_green>,
    <iceandfire:sea_serpent_scales_purple>,
    <iceandfire:sea_serpent_scales_red>,
    <iceandfire:sea_serpent_scales_teal>
]);

<ore:iceandfireLily>.add([
    <iceandfire:fire_lily>,
    <iceandfire:frost_lily>
]);
<ore:myrmexResin>.add([
    <iceandfire:myrmex_desert_resin>,
    <iceandfire:myrmex_jungle_resin>
]);



# ######################################################################
#
# Crafts
#
# ######################################################################

# Simplify bricks for less grind
remakeEx(<iceandfire:dragonforge_fire_brick> * 2, [
	[<ore:dragonFireScales>, <ore:bricksStone>, <ore:dragonFireScales>],
	[<ore:bricksStone>, <ore:dragonFireScales>, <ore:bricksStone>],
	[<ore:dragonFireScales>, <ore:bricksStone>, <ore:dragonFireScales>]]);

remakeEx(<iceandfire:dragonforge_ice_brick> * 2, [
	[<ore:dragonIceScales>, <ore:bricksStone>, <ore:dragonIceScales>],
	[<ore:bricksStone>, <ore:dragonIceScales>, <ore:bricksStone>],
	[<ore:dragonIceScales>, <ore:bricksStone>, <ore:dragonIceScales>]]);

# Dragon meal
remakeFluidToItem(<iceandfire:dragon_meal>, <fluid:lifeessence>, <ore:primeMeatCooked>*8);

# Remove craft table dragon recipes
recipes.remove(<iceandfire:dragonforge_fire_core_disabled>);
recipes.remove(<iceandfire:dragonforge_ice_core_disabled>);


function envelopCheese(name as string, result as IItemStack, mat as IIngredient){
	recipes.addShaped(name, result, [
		[mat, mat, mat], 
		[mat, <rats:chunky_cheese_token>, mat], 
		[mat, mat, mat]
	]);
}

##################
# DRAGONS
val dragonCrafIngredients as IItemStack[] = [
	<iceandfire:dragonscales_red>,
	<iceandfire:dragonscales_green>,
	<iceandfire:dragonscales_bronze>,
	<iceandfire:dragonscales_gray>,
	<iceandfire:dragonscales_blue>,
	<iceandfire:dragonscales_white>,
	<iceandfire:dragonscales_sapphire>,
	<iceandfire:dragonscales_silver>,
];
val dragonCraftEggs as IItemStack[] = [
	<iceandfire:dragonegg_red>,
	<iceandfire:dragonegg_green>,
	<iceandfire:dragonegg_bronze>,
	<iceandfire:dragonegg_gray>,
	<iceandfire:dragonegg_blue>,
	<iceandfire:dragonegg_white>,
	<iceandfire:dragonegg_sapphire>,
	<iceandfire:dragonegg_silver>,
];
<ore:dragonEgg>.add(dragonCraftEggs);


for i in 0 to dragonCrafIngredients.length {
	envelopCheese("dragonEgg_"~i, dragonCraftEggs[i], dragonCrafIngredients[i]);
}

##################
# Hippogryphs
val hippCrafIngredients as IItemStack[] = [
	<animania:wool:1>,
	<animania:wool>,
	<animania:wool:2>,
	<animania:wool:4>,
	<animania:wool:3>,
	<animania:wool:6>,
	<animania:wool:5>,
];
val hippCraftEggs as IItemStack[] = [
	<iceandfire:hippogryph_egg>,
	<iceandfire:hippogryph_egg:1>,
	<iceandfire:hippogryph_egg:2>,
	<iceandfire:hippogryph_egg:3>,
	<iceandfire:hippogryph_egg:4>,
	<iceandfire:hippogryph_egg:5>,
	<iceandfire:hippogryph_egg:6>,
];
<ore:hippogryphEgg>.add(hippCraftEggs);

for i in 0 to hippCrafIngredients.length {
	envelopCheese("hippEgg_"~i, hippCraftEggs[i], hippCrafIngredients[i]);
}


##################
# WORMS
# Twilight worm
recipes.addShaped("twilightforest_moonworm", <twilightforest:moonworm>, [
	[<ore:animaniaEggs>, <tconstruct:slime_channel>, <ore:animaniaEggs>], 
	[<tconstruct:slime_channel>, null, null], 
	[<ore:animaniaEggs>, <tconstruct:slime_channel>, <exnihilocreatio:item_material:2>]
]);

# Small worm
recipes.addShaped("iceandfire_deathworm_egg", <iceandfire:iceandfire.deathworm_egg>*3, [
	[<ore:animaniaEggs>, <twilightforest:moonworm>, <ore:animaniaEggs>], 
	[<ore:animaniaEggs>, <rats:chunky_cheese_token>, <ore:animaniaEggs>], 
	[<ore:animaniaEggs>, <twilightforest:moonworm>, <ore:animaniaEggs>]
]);

# Big Worm
mods.inworldcrafting.FluidToItem.transform(<iceandfire:iceandfire.deathworm_egg:1>, <liquid:blueslime>, [<iceandfire:iceandfire.deathworm_egg>]);

##################
# MYRMEX
<ore:myrmexEgg>.add(<iceandfire:myrmex_desert_egg:4>, <iceandfire:myrmex_jungle_egg:4>);
var desertIng = <minecraft:stained_hardened_clay:1>;
recipes.addShaped("myrmexDesertEgg", <iceandfire:myrmex_desert_egg:4>, [
	[desertIng, <twilightforest:cicada>, desertIng], 
	[desertIng, <rats:chunky_cheese_token>, desertIng], 
	[desertIng, <twilightforest:cicada>, desertIng]
]);
var jungleIng = <minecraft:stained_hardened_clay:11>;
recipes.addShaped("myrmexJungleEgg", <iceandfire:myrmex_jungle_egg:4>, [
	[jungleIng, <twilightforest:cicada>, jungleIng], 
	[jungleIng, <rats:chunky_cheese_token>, jungleIng], 
	[jungleIng, <twilightforest:cicada>, jungleIng]
]);

##################
# Pixies
var pixieJars as IItemStack[] = [
    <iceandfire:jar_pixie>,
    <iceandfire:jar_pixie:1>,
    <iceandfire:jar_pixie:2>,
    <iceandfire:jar_pixie:3>,
    <iceandfire:jar_pixie:4>
];
var pixieDyes as IIngredient[] = [
    <ore:dyeRed>,
    <ore:dyeMagenta>,
    <ore:dyeLightBlue>,
    <ore:dyeLime>,
    <ore:dyeOrange>
];

function makePixieJar(name as string, result as IItemStack, mat as IIngredient){
	recipes.addShaped(name, result, [
        [<ore:peacockFeathers>, mat, <ore:peacockFeathers>], 
        [<ore:peacockFeathers>, <rats:chunky_cheese_token>, <ore:peacockFeathers>], 
        [<ore:peacockFeathers>, <iceandfire:jar_empty>, <ore:peacockFeathers>]
	]);
}

for i, jar in pixieJars {
    makePixieJar("pixie_jar_"~i, jar, pixieDyes[i]);
}


##################
# Hearts craft

# Remove craft from shards
recipes.remove(<scalinghealth:heartcontainer>);

# Heart shard recipe
mods.rats.recipes.addGemcutterRatRecipe(<actuallyadditions:item_crystal_empowered>, <scalinghealth:crystalshard>);

# Animania lambs
var lambNames as string[] = [
    "animania:lamb_dorper", 
    "animania:lamb_dorset", 
    "animania:lamb_friesian", 
    "animania:lamb_jacob", 
    "animania:lamb_merino", 
    "animania:lamb_suffolk"
];

var cshard = <scalinghealth:crystalshard>;
recipes.remove(<cyclicmagic:heart_toxic>);
var anyLambIngredient = <enderio:item_soul_vial:1>.withTag({entityId: lambNames[0]});
for i in 1 to lambNames.length {
	anyLambIngredient = anyLambIngredient.or(<enderio:item_soul_vial:1>.withTag({entityId: lambNames[i]}));
}
# Toxic heart from shards
recipes.addShaped("cyclicmagic_heart_toxic", <cyclicmagic:heart_toxic>, [
		[cshard, cshard, cshard], 
		[cshard, anyLambIngredient, cshard], 
		[cshard, cshard, cshard]
]);
<cyclicmagic:heart_toxic>.addTooltip("Craft with any Lamb soul");


# Spring water recipe
mods.iceandfire.recipes.addIceDragonForgeRecipe( 
    <biomesoplenty:jar_filled:1>, 
    Bucket("ic2hot_water"), 
    Bucket("hot_spring_water"));

# Heart container recipe
mods.iceandfire.recipes.addFireDragonForgeRecipe(
    <cyclicmagic:heart_toxic>, 
    Bucket("lifeessence"), 
    <scalinghealth:heartcontainer>);
mods.iceandfire.recipes.addIceDragonForgeRecipe(
    <cyclicmagic:heart_toxic>, 
    Bucket("lifeessence"), 
    <scalinghealth:heartcontainer>);

# Cursed and Enchanced hearts recipes
mods.iceandfire.recipes.addFireDragonForgeRecipe(
    <extendedcrafting:material:32>, 
    <scalinghealth:heartcontainer>, 
    <scalinghealth:difficultychanger:1>);
mods.iceandfire.recipes.addIceDragonForgeRecipe(
    <extendedcrafting:material:32>, 
    <scalinghealth:heartcontainer>, 
    <scalinghealth:difficultychanger>);


##################
# Other
envelopCheese("amphithereMorb",  <thermalexpansion:morb>.withTag({Generic: 1 as byte, id: "iceandfire:amphithere"}) * 3, <minecraft:cookie>);
envelopCheese("hippocampusMorb", <thermalexpansion:morb>.withTag({Generic: 1 as byte, id: "iceandfire:hippocampus"}) * 3, <minecraft:prismarine_shard>);
envelopCheese("serpentMorb",     <thermalexpansion:morb>.withTag({Generic: 1 as byte, id: "iceandfire:seaserpent"}), <iceandfire:shiny_scales>);

# Lily crafts
mods.inworldcrafting.FluidToItem.transform(<iceandfire:fire_lily>, <liquid:pyrotheum>, [<extrautils2:enderlilly>]);
mods.inworldcrafting.FluidToItem.transform(<iceandfire:frost_lily>, <liquid:cryotheum>, [<extrautils2:enderlilly>]);

recipes.addShapeless(<iceandfire:dragonforge_ice_core_disabled>, [<iceandfire:dragonforge_ice_core>]);
recipes.addShapeless(<iceandfire:dragonforge_fire_core_disabled>, [<iceandfire:dragonforge_fire_core>]);

# Recycling myrmex resin
scripts.process.squeeze(<iceandfire:myrmex_resin>          , <liquid:resin>*120, null, <iceandfire:myrmex_desert_resin>);
scripts.process.squeeze(<iceandfire:myrmex_resin:1>        , <liquid:resin>*120, null, <iceandfire:myrmex_jungle_resin>);
scripts.process.squeeze(<iceandfire:myrmex_resin_sticky>   , <liquid:resin>*180, null, <iceandfire:myrmex_desert_resin> * 2);
scripts.process.squeeze(<iceandfire:myrmex_resin_sticky:1> , <liquid:resin>*180, null, <iceandfire:myrmex_jungle_resin> * 2);
scripts.process.squeeze(<iceandfire:desert_myrmex_cocoon>  , <liquid:resin>*480, null, <iceandfire:myrmex_desert_resin> * 8);
scripts.process.squeeze(<iceandfire:jungle_myrmex_cocoon>  , <liquid:resin>*480, null, <iceandfire:myrmex_jungle_resin> * 8);
