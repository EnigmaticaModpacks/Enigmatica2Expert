import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.jei.JEI.removeAndHide as rh;
import mods.inworldcrafting.FluidToItem.transform as fti;
import mods.jaopca.JAOPCA;
import mods.jaopca.OreEntry;



# ######################################################################
#
# Oredict
#
# ######################################################################

# Ore dragonsteel ingot
<ore:dragonsteelIngot>.add([
	<iceandfire:dragonsteel_fire_ingot>, 
	<iceandfire:dragonsteel_ice_ingot>]);

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

////////////////////////////////////
// DRAGONS
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

////////////////////////////////////
// Hippogryphs
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


////////////////////////////////////
// WORMS
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
fti(<iceandfire:iceandfire.deathworm_egg:1>, <liquid:sand>, <iceandfire:iceandfire.deathworm_egg>);

////////////////////////////////////
// MYRMEX
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

////////////////////////////////////
// Pixies
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


////////////////////////////////////
// Hearts craft

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
    <minecraft:water_bucket>, 
    <forge:bucketfilled>.withTag({FluidName: "hot_spring_water", Amount: 1000}));

# Heart container recipe
mods.iceandfire.recipes.addFireDragonForgeRecipe(
    <cyclicmagic:heart_toxic>, 
    <forge:bucketfilled>.withTag({FluidName: "lifeessence", Amount: 1000}), 
    <scalinghealth:heartcontainer>);
mods.iceandfire.recipes.addIceDragonForgeRecipe(
    <cyclicmagic:heart_toxic>, 
    <forge:bucketfilled>.withTag({FluidName: "lifeessence", Amount: 1000}), 
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


////////////////////////////////////
// Other
envelopCheese("amphithereMorb",  <thermalexpansion:morb>.withTag({Generic: 1 as byte, id: "iceandfire:amphithere"}) * 3, <minecraft:cookie>);
envelopCheese("hippocampusMorb", <thermalexpansion:morb>.withTag({Generic: 1 as byte, id: "iceandfire:hippocampus"}) * 3, <minecraft:prismarine_shard>);
envelopCheese("serpentMorb",     <thermalexpansion:morb>.withTag({Generic: 1 as byte, id: "iceandfire:seaserpent"}), <iceandfire:shiny_scales>);

# Lily crafts
fti(<iceandfire:fire_lily>, <liquid:pyrotheum>, <extrautils2:enderlilly>);
fti(<iceandfire:frost_lily>, <liquid:cryotheum>, <extrautils2:enderlilly>);

recipes.addShapeless(<iceandfire:dragonforge_ice_core_disabled>, [<iceandfire:dragonforge_ice_core>]);
recipes.addShapeless(<iceandfire:dragonforge_fire_core_disabled>, [<iceandfire:dragonforge_fire_core>]);