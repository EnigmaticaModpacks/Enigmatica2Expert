import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
#modloaded iceandfire

# *======= Recipes =======*

# Remove too powerful aspects
<iceandfire:podium>.removeAspects(<aspect:desiderium>);
<iceandfire:podium:1>.removeAspects(<aspect:desiderium>);
<iceandfire:podium:2>.removeAspects(<aspect:desiderium>);
<iceandfire:podium:3>.removeAspects(<aspect:desiderium>);
<iceandfire:podium:4>.removeAspects(<aspect:desiderium>);
<iceandfire:podium:5>.removeAspects(<aspect:desiderium>);

// Disk Platter / Iron Chain Link
craft.remake(<iceandfire:chain_link> * 2, ['AAA', 'A A', 'AAA'], {
  A: <ore:nuggetFakeIron>,
});

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

# Wither Shard remake to prevent conflict
	recipes.remove(<iceandfire:wither_shard>);
	recipes.addShapeless("Witherbone shard", 
	<iceandfire:wither_shard> * 3, 
	[<ore:boneWither>, scripts.category.plates_and_casings.anyHammer]);
	
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
<iceandfire:silver_block>,

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
		utils.rh(item);
	}



for item in [
	<iceandfire:silver_nugget>,
] as IItemStack[] {
	utils.rh(item, false);
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
	
# Dragons Breath from Dragon Forges
	mods.iceandfire.recipes.addFireDragonForgeRecipe(<integrateddynamics:crystalized_chorus_chunk>, <botania:manaresource:15>, <minecraft:dragon_breath>); 
	mods.iceandfire.recipes.addIceDragonForgeRecipe(<integrateddynamics:crystalized_chorus_chunk>, <botania:manaresource:15>, <minecraft:dragon_breath>);
	
	

# ######################################################################
#
# Oredict
#
# ######################################################################

# Ore dragonsteel ingot
<ore:dragonsteelIngot>.add([
	<iceandfire:dragonsteel_fire_ingot>, 
	<iceandfire:dragonsteel_ice_ingot>]);

<ore:blockDragonsteel>.add([
	<iceandfire:dragonsteel_fire_block>, 
	<iceandfire:dragonsteel_ice_block>]);

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

# Compressed ice variant
utils.compact(<mctsmelteryio:iceball>, <iceandfire:dragon_ice>);

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
recipes.remove(<iceandfire:dragon_meal>);
mods.inworldcrafting.FluidToItem.transform(<iceandfire:dragon_meal> * 4, <fluid:blood>, [
	<harvestcraft:groundporkitem> * 4,
	<harvestcraft:groundrabbititem> * 4,
	<harvestcraft:groundfishitem> * 4,
], true);

# Remove craft table dragon recipes
recipes.remove(<iceandfire:dragonforge_fire_core_disabled>);
recipes.remove(<iceandfire:dragonforge_ice_core_disabled>);

# Spring water recipe
mods.iceandfire.recipes.addIceDragonForgeRecipe( 
    <biomesoplenty:jar_filled:1>, 
    <minecraft:water_bucket>, 
    Bucket("hot_spring_water"));

# Remove craft from shards
recipes.remove(<scalinghealth:heartcontainer>);

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
    <plustic:osgloglasingot>,
    <scalinghealth:heartcontainer>,
    <scalinghealth:difficultychanger:1>);
mods.iceandfire.recipes.addIceDragonForgeRecipe(
    <plustic:osgloglasingot>,
    <scalinghealth:heartcontainer>,
    <scalinghealth:difficultychanger>);


# Alt for non-dragon players
scripts.processUtils.avdRockXmlRecipeEx("Crystallizer", [<cyclicmagic:heart_toxic>], [<fluid:lifeessence> * 1000], [<scalinghealth:heartcontainer>], null, {power: 100000, timeRequired: 20});

# [Crystal Matrix Ingot] from [Diamond Lattice][+1]
scripts.processUtils.avdRockXmlRecipeEx("PrecisionLaserEtcher", [<ore:netherStar>, <ore:gemDilithium>], null, [<avaritia:resource:1>], null, {power: 100000, timeRequired: 20});

# [Fire Dragonsteel Ingot] from [Fire Dragon Blood][+1]
scripts.process.alloy([
	<ore:ingotThermoconducting>,    # Thermoconducting Alloy
	<iceandfire:fire_dragon_blood>, # Fire Dragon Blood
], <iceandfire:dragonsteel_fire_ingot>, 'Only: AdvRockArc');

# [Ice Dragonsteel Ingot] from [Ice Dragon Blood][+1]
scripts.process.alloy([
  <ore:ingotThermoconducting>,   # Thermoconducting Alloy
  <iceandfire:ice_dragon_blood>, # Ice Dragon Blood
], <iceandfire:dragonsteel_ice_ingot>, 'Only: AdvRockArc');

# Lily crafts
mods.inworldcrafting.FluidToItem.transform(<iceandfire:fire_lily>, <liquid:pyrotheum>, [<extrautils2:enderlilly>]);
mods.inworldcrafting.FluidToItem.transform(<iceandfire:frost_lily>, <liquid:cryotheum>, [<extrautils2:enderlilly>]);

recipes.addShapeless(<iceandfire:dragonforge_ice_core_disabled>, [<iceandfire:dragonforge_ice_core>]);
recipes.addShapeless(<iceandfire:dragonforge_fire_core_disabled>, [<iceandfire:dragonforge_fire_core>]);

# Recycling myrmex resin
function addResinRecycle(input as IItemStack, amount as int, isDesert as bool) as void {
	val output = (isDesert ? <iceandfire:myrmex_desert_resin> : <iceandfire:myrmex_jungle_resin>) % (2 * amount);
	mods.thermalexpansion.Centrifuge.addRecipe([output], input, <liquid:resin> * (120 * amount), 2000);
	mods.forestry.Squeezer.addRecipe(<liquid:resin> * (100 * amount), [input], 10, output);
}
addResinRecycle(<iceandfire:myrmex_resin>         , 1, true);
addResinRecycle(<iceandfire:myrmex_resin:1>       , 1, false);
addResinRecycle(<iceandfire:myrmex_resin_sticky>  , 2, true);
addResinRecycle(<iceandfire:myrmex_resin_sticky:1>, 2, false);
addResinRecycle(<iceandfire:desert_myrmex_cocoon> , 8, true);
addResinRecycle(<iceandfire:jungle_myrmex_cocoon> , 8, false);

# StackSize was 1
<iceandfire:ambrosia>.maxStackSize = 64;

# Add recipe because snow villages is disabled
# [Fishing Spear] from [Steel Arrow Head][+2]
craft.remake(<iceandfire:fishing_spear>, ["pretty",
  "S    ",
  "  M  ",
  "    M"], {
  "S": <tconstruct:arrow_head>.withTag({Material: "steel"}), # Steel Arrow Head
  "M": <extrautils2:decorativesolidwood>, # Magical Planks
});

# Add obtaining
# [Dreadwood Log]*8 from [Dread Shard][+1]
craft.make(<iceandfire:dreadwood_log> * 8, ["pretty",
  "# # #",
  "# D #",
  "# # #"], {
  "#": <randomthings:spectrelog>, # Spectre Wood
  "D": <iceandfire:dread_shard>,  # Dread Shard
});

# Alternative instead using machines
mods.iceandfire.recipes.addFireDragonForgeRecipe(<ore:ingotPigiron>.firstItem, <darkutils:material>, <extrautils2:ingredients:17>); 
mods.iceandfire.recipes.addIceDragonForgeRecipe(<ore:ingotPigiron>.firstItem, <darkutils:material>, <extrautils2:ingredients:17>);
mods.iceandfire.recipes.addFireDragonForgeRecipe(<ore:blockPigiron>.firstItem, <darkutils:wither_block>, <extrautils2:simpledecorative:2>); 
mods.iceandfire.recipes.addIceDragonForgeRecipe(<ore:blockPigiron>.firstItem, <darkutils:wither_block>, <extrautils2:simpledecorative:2>);

# Skyblock alt for dragon scales
scripts.lib.tooltip.desc.both(<mysticalagradditions:stuff:3>, "kill.slime.by.cockatrice");
scripts.do.entity_kill_entity.add("minecraft:slime", "iceandfire:if_cockatrice", <mysticalagradditions:stuff:3>);

# Dragon Scales
var listConversionScales as IItemStack[] = [
    <ic2:plate:10>,  <iceandfire:dragonscales_red>,
    <ic2:plate:14>,  <iceandfire:dragonscales_green>,
    <ic2:plate:9>,   <iceandfire:dragonscales_bronze>,
    <ic2:plate:15>,  <iceandfire:dragonscales_gray>,
    <ic2:plate:16>,  <iceandfire:dragonscales_blue>,
    <ic2:plate:17>,  <iceandfire:dragonscales_white>,
    <ic2:plate:13>,  <iceandfire:dragonscales_sapphire>,
    <ic2:plate:12>,  <iceandfire:dragonscales_silver>
];

for i, input in listConversionScales {
	if(i%2!=0) continue;
	val output = listConversionScales[i+1];
	mods.rats.recipes.addArcheologistRatRecipe(input, output);

	# [Dragon Scales] from [Dragon Scale]
	recipes.addShapeless(output, [<mysticalagradditions:stuff:3>, input]);
}

# Peaceful Skyblock alt
# [Fire Dragon Blood]*8 from [Imbued Slate][+1]
craft.shapeless(<iceandfire:fire_dragon_blood> * 8, "BBBBIBBBB", {
  "B": <rustic:fluid_bottle>.withTag({Fluid: {FluidName: "wine", Amount: 1000, Tag: {Quality: 1.0 as float}}}).noReturn(), # Bottle of Wine
  "I": <bloodmagic:slate:2>, # Imbued Slate
});

# [Ice Dragon Blood]*8 from [Imbued Slate][+1]
craft.shapeless(<iceandfire:ice_dragon_blood> * 8, "BBBBIBBBB", {
  "B": <rustic:fluid_bottle>.withTag({Fluid: {FluidName: "ale", Amount: 1000, Tag: {Quality: 1.0 as float}}}).noReturn(), # Bottle of Ale
  "I": <bloodmagic:slate:2>, # Imbued Slate
});

recipes.addShapeless('Heart Fire', <iceandfire:fire_dragon_heart>, [<cyclicmagic:heart_toxic>, <iceandfire:fire_dragon_blood>]);
recipes.addShapeless('Heart Ice', <iceandfire:ice_dragon_heart>, [<cyclicmagic:heart_toxic>, <iceandfire:ice_dragon_blood>]);
