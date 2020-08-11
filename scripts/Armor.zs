import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import mods.jei.JEI.removeAndHide as rh;


# ######################################################################
#
# Remove completely
#
# ######################################################################

# Remove all armor that can be replaced with Conarm
for item in [
<immersiveengineering:steel_armor_head>,
<immersiveengineering:steel_armor_chest>,
<immersiveengineering:steel_armor_legs>,
<immersiveengineering:steel_armor_feet>,
<immersiveengineering:faraday_suit_head>,
<immersiveengineering:faraday_suit_chest>,
<immersiveengineering:faraday_suit_legs>,
<immersiveengineering:faraday_suit_feet>,
<tcomplement:knightslime_helmet>,
<tcomplement:knightslime_chestplate>,
<tcomplement:knightslime_leggings>,
<tcomplement:knightslime_boots>,
<harvestcraft:hardenedleatherhelmitem>,
<harvestcraft:hardenedleatherchestitem>,
<harvestcraft:hardenedleatherleggingsitem>,
<harvestcraft:hardenedleatherbootsitem>,
<tcomplement:manyullyn_helmet>,
<tcomplement:manyullyn_chestplate>,
<tcomplement:manyullyn_leggings>,
<tcomplement:manyullyn_boots>,
<minecraft:iron_helmet>,
<minecraft:iron_chestplate>,
<minecraft:iron_leggings>,
<minecraft:iron_boots>,
<minecraft:golden_boots>,
<minecraft:golden_leggings>,
<minecraft:golden_chestplate>,
<minecraft:golden_helmet>,
<minecraft:diamond_helmet>,
<minecraft:diamond_chestplate>,
<minecraft:diamond_leggings>,
<minecraft:diamond_boots>,
<ic2:alloy_chestplate>,
<tcomplement:steel_helmet>,
<tcomplement:steel_chestplate>,
<tcomplement:steel_leggings>,
<tcomplement:steel_boots>,

<twilightforest:fiery_helmet>,
<twilightforest:fiery_chestplate>,
<twilightforest:fiery_leggings>,
<twilightforest:fiery_boots>,

<twilightforest:knightmetal_helmet>,
<twilightforest:knightmetal_chestplate>,
<twilightforest:knightmetal_leggings>,
<twilightforest:knightmetal_boots>,

<twilightforest:steeleaf_helmet>,
<twilightforest:steeleaf_chestplate>,
<twilightforest:steeleaf_leggings>,
<twilightforest:steeleaf_boots>,
] as IItemStack[] { rh(item); }


#------------
# Iron
#------------

# Replace recipes that used items
for item in [
	<ic2:solar_helmet>,
	<openblocks:sonic_glasses>,
	<plethora:module:6>,
	<actuallyadditions:item_player_probe>,
	<compactsolars:solar_hat_low_voltage>,
	<compactsolars:solar_hat_medium_voltage>,
	<compactsolars:solar_hat_high_voltage>,
] as IItemStack[] {
	recipes.replaceAllOccurences(<minecraft:iron_helmet>, 	<conarm:helmet_core>.withTag({Material: "iron"}), item);
	recipes.replaceAllOccurences(<minecraft:iron_helmet:*>, <conarm:helmet_core>.withTag({Material: "iron"}), item);
}

recipes.replaceAllOccurences(<minecraft:iron_boots>, <conarm:boots_core>.withTag({Material: "iron"}), <randomthings:superlubricentboots>);

//mods.bloodmagic.AlchemyArray.removeRecipe(IItemStack input, IItemStack catalyst);
val BRT = <bloodmagic:component:8>;
mods.bloodmagic.AlchemyArray.removeRecipe(BRT, <minecraft:iron_helmet>);
mods.bloodmagic.AlchemyArray.removeRecipe(BRT, <minecraft:iron_chestplate>);
mods.bloodmagic.AlchemyArray.removeRecipe(BRT, <minecraft:iron_leggings>);
mods.bloodmagic.AlchemyArray.removeRecipe(BRT, <minecraft:iron_boots>);

//mods.bloodmagic.AlchemyArray.addRecipe(IItemStack output, IItemStack input, IItemStack catalyst, @Optional string textureLocation);
mods.bloodmagic.AlchemyArray.addRecipe(<bloodmagic:living_armour_helmet>,  BRT, <conarm:helmet_core>.withTag({Material: "iron"}),  "bloodmagic:textures/models/AlchemyArrays/bindingarray.png");
mods.bloodmagic.AlchemyArray.addRecipe(<bloodmagic:living_armour_chest>,   BRT, <conarm:chest_core>.withTag({Material: "iron"}),   "bloodmagic:textures/models/AlchemyArrays/bindingarray.png");
mods.bloodmagic.AlchemyArray.addRecipe(<bloodmagic:living_armour_leggings>,BRT, <conarm:leggings_core>.withTag({Material: "iron"}),"bloodmagic:textures/models/AlchemyArrays/bindingarray.png");
mods.bloodmagic.AlchemyArray.addRecipe(<bloodmagic:living_armour_boots>,   BRT, <conarm:boots_core>.withTag({Material: "iron"}),   "bloodmagic:textures/models/AlchemyArrays/bindingarray.png");

#------------
# Gold
#------------
recipes.replaceAllOccurences(<minecraft:golden_chestplate:*>, <conarm:chest_core>.withTag({Material: "electrum"}), <draconicevolution:tool_upgrade:9>);
recipes.replaceAllOccurences(<minecraft:golden_boots:*>, <conarm:boots_core>.withTag({Material: "electrum"}), <draconicevolution:tool_upgrade:10>);
recipes.replaceAllOccurences(<minecraft:golden_boots:*>, <conarm:boots_core>.withTag({Material: "electrum"}), <draconicevolution:tool_upgrade:11>);

#------------
# Diamond
#------------
recipes.replaceAllOccurences(<minecraft:diamond_helmet>, <conarm:helmet_core>.withTag({Material: "diamantine_crystal"}), <plethora:module>);
recipes.replaceAllOccurences(<minecraft:diamond_chestplate:*>, <conarm:chest_core>.withTag({Material: "diamantine_crystal"}), <draconicevolution:tool_upgrade:8>);
recipes.replaceAllOccurences(<minecraft:diamond_boots>, <conarm:boots_core>.withTag({Material: "diamantine_crystal"}), <environmentaltech:modifier_jump_boost>);



# ######################################################################
#
# Generate recipes
#
# ######################################################################


static armorStaged as IData[string] = scripts.DataTables.armorStaged;

function getSetPiece(setData as IData, pieceN as int) as IItemStack {

	if (!isNull(setData)) {
		val idStr = setData.list[pieceN].id.asString();
		if (!isNull(idStr)) { 
			val piece = getIngredientFromString(idStr);
			if (!isNull(piece)) {
				return piece.itemArray[0];
			} else {
				logger.logWarning("Armor.zs Error. No armor item <"~idStr~">");
			}
		}
	}
	
	return null;
}

static setNames as string[] = ["Helmet", "Chestplate", "Leggins", "Boots"] as string[];

function createRecipe(setData as IData, setId as string, pieceN as int, list as IIngredient[][]) {
	val item = getSetPiece(setData, pieceN);
	if (!isNull(item)) {
		remakeEx(item, list);
	} else {
		logger.logWarning("Armor.zs Error. No armor for set {"~setId~"} for piece: "~setNames[pieceN]);
	}
}

function armGridExtra(n as int, mat as IIngredient, extra as IIngredient, prev as IData) as IIngredient[][] {
	val prevReal = getSetPiece(prev, n);
	val prevAny = !isNull(prevReal) ? prevReal.anyDamage() : null;
	if        (n == 0) { return [[mat, extra, mat], [mat, prevAny, mat], [null, null, null]] as IIngredient[][];
	} else if (n == 1) { return [[mat, prevAny, mat], [mat, extra, mat], [mat, mat, mat]] as IIngredient[][];
	} else if (n == 2) { return [[mat, extra, mat], [mat, prevAny, mat], [mat, null, mat]] as IIngredient[][];
	} else if (n == 3) { return [[null, null,null], [mat, extra, mat],   [mat, prevAny, mat]] as IIngredient[][];
	}
	return null;
}
function armGridNormal(n as int, mat as IIngredient, prev as IData) as IIngredient[][] {
	return armGridExtra(n, mat, mat, prev);
}

function createArmorSet(setData as IData, setId as string) {
	if ((!isNull(setData.recipe) && !isNull(setData.recipe.manual)) || isNull(setData.material)) { return null; }

	# Material armor made from
	val matStr = setData.material.asString();
	val mat = getIngredientFromString(matStr);
	if (isNull(mat)) { 
		logger.logWarning("Armor.zs Error. No material {"~matStr~"}");
		return null; 
	}

	# prev set
	val prev = armorStaged[!isNull(setData.prev) ? setData.prev : "undefined"];
	
	# Extra ingredient. Recipe is chained but have additional item
	if (!isNull(setData.recipe) && !isNull(setData.recipe.extra)) {
		val extraStr = setData.recipe.extra.asString();
		val extra = getIngredientFromString(extraStr);
		if (isNull(extra)) { 
			logger.logWarning("Armor.zs Error. No ingredient <"~extraStr~">");
			return null;
		}

		for i in 0 to 4 {
			createRecipe(setData, setId, i, armGridExtra(i, mat, extra, prev));
		}
		return null;
	}

	# Simple chained (or not) recipe
	for i in 0 to 4 {
		createRecipe(setData, setId, i, armGridNormal(i, mat, prev));
	}
}

for setId, setData in armorStaged {
	createArmorSet(setData, setId);
}

# ######################################################################
#
# Manual recipes
#
# ######################################################################

remakeEx(<botania:terrasteelboots>, [[<ore:dreamwoodTwig>, <ore:runeWinterB>, <ore:dreamwoodTwig>],[<ore:ingotTerrasteel>, <botania:elementiumboots>.anyDamage(), <ore:ingotTerrasteel>], [null, <ore:ingotTerrasteel>, null]]);
remakeEx(<botania:terrasteellegs>, [[<ore:dreamwoodTwig>, <ore:runeAutumnB>, <ore:dreamwoodTwig>],[<ore:ingotTerrasteel>, <botania:elementiumlegs>.anyDamage(), <ore:ingotTerrasteel>], [null, <ore:ingotTerrasteel>, null]]);
remakeEx(<botania:terrasteelchest>, [[<ore:dreamwoodTwig>, <ore:runeSummerB>, <ore:dreamwoodTwig>],[<ore:ingotTerrasteel>, <botania:elementiumchest>.anyDamage(), <ore:ingotTerrasteel>], [<ore:ingotTerrasteel>, <ore:ingotTerrasteel>, <ore:ingotTerrasteel>]]);
remakeEx(<botania:terrasteelhelm>, [[<ore:dreamwoodTwig>, <ore:runeSpringB>, <ore:dreamwoodTwig>],[<ore:ingotTerrasteel>, <botania:elementiumhelm>.anyDamage(), <ore:ingotTerrasteel>], [null, <ore:ingotTerrasteel>, null]]);
recipes.addShapeless(<botania:terrasteelhelmreveal>, [<botania:terrasteelhelm>.anyDamage(),<thaumcraft:goggles>.anyDamage()]);

remakeEx(<ic2:nano_helmet:26>, [[<ic2:crafting:15>, <ic2:energy_crystal:26>.anyDamage(), <ic2:crafting:15>],[<ic2:crafting:15>, <ic2:nightvision_goggles:26>.anyDamage(), <ic2:crafting:15>], [null, <conarm:helmet_core>.withTag({Material: "energetic_metal"}), null]]);
remakeEx(<ic2:nano_chestplate:26>, [[<ic2:crafting:15>, <conarm:chest_core>.withTag({Material: "energetic_metal"}), <ic2:crafting:15>],[<ic2:crafting:15>, <ic2:energy_crystal:26>.anyDamage(), <ic2:crafting:15>], [<ic2:crafting:15>, <ic2:crafting:15>, <ic2:crafting:15>]]);
remakeEx(<ic2:nano_leggings:26>, [[<ic2:crafting:15>, <ic2:energy_crystal:26>.anyDamage(), <ic2:crafting:15>],[<ic2:crafting:15>, <conarm:leggings_core>.withTag({Material: "energetic_metal"}), <ic2:crafting:15>], [<ic2:crafting:15>, null, <ic2:crafting:15>]]);
remakeEx(<ic2:nano_boots:26>, [[<ic2:crafting:15>, <ic2:energy_crystal:26>.anyDamage(), <ic2:crafting:15>],[<ic2:crafting:15>, <conarm:boots_core>.withTag({Material: "energetic_metal"}), <ic2:crafting:15>], [null, null, null]]);

remakeEx(<ic2:quantum_boots:26>, [[null, null, null],[<ic2:crafting:4>, <redstonearsenal:armor.boots_flux>.anyDamage(), <ic2:crafting:4>], [<ic2:rubber_boots>, <ic2:lapotron_crystal>.anyDamage(), <ic2:rubber_boots>]]);
remakeEx(<ic2:quantum_leggings:26>, [[<ic2:crafting:3>, <ic2:lapotron_crystal>.anyDamage(), <ic2:crafting:3>],[<ic2:crafting:4>, <redstonearsenal:armor.legs_flux>.anyDamage(), <ic2:crafting:4>], [null, <ic2:lapotron_crystal>.anyDamage(), null]]);
remakeEx(<ic2:quantum_chestplate:26>, [[<ic2:crafting:3>, <ic2:lapotron_crystal>.anyDamage(), <ic2:crafting:3>],[<ic2:crafting:4>, <redstonearsenal:armor.plate_flux>.anyDamage(), <ic2:crafting:4>], [<ic2:crafting:3>, <ic2:jetpack_electric>.anyDamage(), <ic2:crafting:3>]]);
remakeEx(<ic2:quantum_helmet:26>, [[<ic2:crafting:3>, null, <ic2:crafting:3>],[<ic2:crafting:4>, <redstonearsenal:armor.helmet_flux>.anyDamage(), <ic2:crafting:4>], [null, <ic2:lapotron_crystal>.anyDamage(), null]]);

# *======= Draconic Armor =======*

	recipes.remove(<draconicevolution:wyvern_helm>);
	recipes.remove(<draconicevolution:wyvern_boots>);
	recipes.remove(<draconicevolution:wyvern_legs>);
	recipes.remove(<draconicevolution:wyvern_chest>);

# Wyvern
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:wyvern_helm>,
	1000000000, 1000000, <draconicevolution:wyvern_energy_core>, [
		<twilightforest:arctic_helmet>.anyDamage(),
		<twilightforest:yeti_helmet>.anyDamage(),
		<twilightforest:knightmetal_helmet>.anyDamage(),
		<twilightforest:steeleaf_helmet>.anyDamage(),
		<twilightforest:fiery_helmet>.anyDamage(),
		<twilightforest:ironwood_helmet>.anyDamage(),
		<minecraft:chainmail_helmet>.anyDamage(),
		<botania:terrasteelhelm>.anyDamage(),
		<tcomplement:manyullyn_helmet>.anyDamage(),
		<draconicevolution:wyvern_core>,
		<ic2:quantum_helmet>.anyDamage(),
		<draconicevolution:draconium_block:1>,
		<draconicevolution:draconium_block:1>,
		<draconicevolution:draconium_block:1>,
		<draconicevolution:draconium_block:1>]);
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:wyvern_chest>,
	1000000000, 1000000, <draconicevolution:wyvern_energy_core>, [
		<twilightforest:arctic_chestplate>.anyDamage(),
		<twilightforest:yeti_chestplate>.anyDamage(),
		<twilightforest:knightmetal_chestplate>.anyDamage(),
		<twilightforest:steeleaf_chestplate>.anyDamage(),
		<twilightforest:fiery_chestplate>.anyDamage(),
		<twilightforest:ironwood_chestplate>.anyDamage(),
		<minecraft:chainmail_chestplate>.anyDamage(),
		<botania:terrasteelchest>.anyDamage(),
		<tcomplement:manyullyn_chestplate>.anyDamage(),
		<draconicevolution:wyvern_core>,
		<ic2:quantum_chestplate>.anyDamage(),
		<draconicevolution:draconium_block:1>,
		<draconicevolution:draconium_block:1>,
		<draconicevolution:draconium_block:1>,
		<draconicevolution:draconium_block:1>]);
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:wyvern_legs>,
	1000000000, 1000000, <draconicevolution:wyvern_energy_core>, [
		<twilightforest:arctic_leggings>.anyDamage(),
		<twilightforest:yeti_leggings>.anyDamage(),
		<twilightforest:knightmetal_leggings>.anyDamage(),
		<twilightforest:steeleaf_leggings>.anyDamage(),
		<twilightforest:fiery_leggings>.anyDamage(),
		<twilightforest:ironwood_leggings>.anyDamage(),
		<minecraft:chainmail_leggings>.anyDamage(),
		<botania:terrasteellegs>.anyDamage(),
		<tcomplement:manyullyn_leggings>.anyDamage(),
		<draconicevolution:wyvern_core>,
		<ic2:quantum_leggings>.anyDamage(),
		<draconicevolution:draconium_block:1>,
		<draconicevolution:draconium_block:1>,
		<draconicevolution:draconium_block:1>,
		<draconicevolution:draconium_block:1>]);
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:wyvern_boots>,
	1000000000, 1000000, <draconicevolution:wyvern_energy_core>, [
		<twilightforest:arctic_boots>.anyDamage(),
		<twilightforest:yeti_boots>.anyDamage(),
		<twilightforest:knightmetal_boots>.anyDamage(),
		<twilightforest:steeleaf_boots>.anyDamage(),
		<twilightforest:fiery_boots>.anyDamage(),
		<twilightforest:ironwood_boots>.anyDamage(),
		<minecraft:chainmail_boots>.anyDamage(),
		<botania:terrasteelboots>.anyDamage(),
		<tcomplement:manyullyn_boots>.anyDamage(),
		<draconicevolution:wyvern_core>,
		<ic2:quantum_boots>.anyDamage(),
		<draconicevolution:draconium_block:1>,
		<draconicevolution:draconium_block:1>,
		<draconicevolution:draconium_block:1>,
		<draconicevolution:draconium_block:1>]);

# Draconic
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:draconic_helm>,
	2147483647, 1000000, <avaritia:block_resource:2>, [
		<draconicevolution:wyvern_helm>.anyDamage(),
		<extrautils2:angelring>.anyDamage(),
		<draconicevolution:awakened_core>,
		<draconicevolution:awakened_core>,
		<draconicevolution:draconic_block>,
		<draconicevolution:draconic_block>,
		<draconicevolution:draconic_energy_core>,
		<draconicevolution:draconic_energy_core>,
		<thermalexpansion:frame:148>,
		<extendedcrafting:material:32>,
		<astralsorcery:itemcape>.anyDamage()]);
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:draconic_chest>,
	2147483647, 1000000, <avaritia:block_resource:2>, [
		<draconicevolution:wyvern_chest>.anyDamage(),
		<extrautils2:angelring>.anyDamage(),
		<draconicevolution:awakened_core>,
		<draconicevolution:awakened_core>,
		<draconicevolution:draconic_block>,
		<draconicevolution:draconic_block>,
		<draconicevolution:draconic_energy_core>,
		<draconicevolution:draconic_energy_core>,
		<thermalexpansion:frame:148>,
		<extendedcrafting:material:32>,
		<astralsorcery:itemcape>.anyDamage()]);
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:draconic_legs>,
	2147483647, 1000000, <avaritia:block_resource:2>, [
		<draconicevolution:wyvern_legs>.anyDamage(),
		<extrautils2:angelring>.anyDamage(),
		<draconicevolution:awakened_core>,
		<draconicevolution:awakened_core>,
		<draconicevolution:draconic_block>,
		<draconicevolution:draconic_block>,
		<draconicevolution:draconic_energy_core>,
		<draconicevolution:draconic_energy_core>,
		<thermalexpansion:frame:148>,
		<extendedcrafting:material:32>,
		<astralsorcery:itemcape>.anyDamage()]);
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:draconic_boots>,
	2147483647, 1000000, <avaritia:block_resource:2>, [
		<draconicevolution:wyvern_boots>.anyDamage(),
		<extrautils2:angelring>.anyDamage(),
		<draconicevolution:awakened_core>,
		<draconicevolution:awakened_core>,
		<draconicevolution:draconic_block>,
		<draconicevolution:draconic_block>,
		<draconicevolution:draconic_energy_core>,
		<draconicevolution:draconic_energy_core>,
		<thermalexpansion:frame:148>,
		<extendedcrafting:material:32>,
		<astralsorcery:itemcape>.anyDamage()]);


# ######################################################################
#
# Recycling armor and related items
#
# ######################################################################

val DKS = "enderio:item_alloy_ingot:6";
val ENS = "enderio:item_alloy_ingot:8";
val FLE = "redstonearsenal:material:32";
val PSI = "psi:material:1";
val IRN = "minecraft:iron_ingot";
val SLR = "enderio:item_alloy_endergy_ingot:3";

# Recycling armor and items list
val itemsToRecycle as string[] = [
# Item name                             |amount| recycle output ore  | recycled metal OR other recycle method
"enderio:item_dark_steel_treetap"        , "6"   , DKS                               , "dark_steel"       ,
"enderio:item_dark_steel_crook"          , "2"   , DKS                               , "dark_steel"       ,
"enderio:item_dark_steel_hand"           , "5"   , DKS                               , "dark_steel"       ,
"enderio:item_dark_steel_shield"         , "5"   , DKS                               , "dark_steel"       ,
"enderio:item_dark_steel_helmet"         , "5"   , DKS                               , "dark_steel"       ,
"enderio:item_dark_steel_chestplate"     , "8"   , DKS                               , "dark_steel"       ,
"enderio:item_dark_steel_leggings"       , "7"   , DKS                               , "dark_steel"       ,
"enderio:item_dark_steel_boots"          , "4"   , DKS                               , "dark_steel"       ,
"enderio:item_end_steel_sword"           , "2"   , ENS                               , "end_steel"        ,
"enderio:item_end_steel_pickaxe"         , "3"   , ENS                               , "end_steel"        ,
"enderio:item_end_steel_axe"             , "3"   , ENS                               , "end_steel"        ,
"enderio:item_end_steel_helmet"          , "5"   , ENS                               , "end_steel"        ,
"enderio:item_end_steel_chestplate"      , "8"   , ENS                               , "end_steel"        ,
"enderio:item_end_steel_leggings"        , "7"   , ENS                               , "end_steel"        ,
"enderio:item_end_steel_boots"           , "4"   , ENS                               , "end_steel"        ,
"enderio:item_end_steel_shield"          , "5"   , ENS                               , "end_steel"        ,
"redstonearsenal:armor.helmet_flux"      , "20"  , FLE                               , "fluxed_electrum"  ,
"redstonearsenal:armor.plate_flux"       , "32"  , FLE                               , "fluxed_electrum"  ,
"redstonearsenal:armor.legs_flux"        , "28"  , FLE                               , "fluxed_electrum"  ,
"redstonearsenal:armor.boots_flux"       , "16"  , FLE                               , "fluxed_electrum"  ,
"redstonearsenal:tool.wrench_flux"       , "3"   , FLE                               , "fluxed_electrum"  ,
"redstonearsenal:tool.bow_flux"          , "9"   , FLE                               , "fluxed_electrum"  ,
"redstonearsenal:tool.fishing_rod_flux"  , "2"   , FLE                               , "fluxed_electrum"  ,
"redstonearsenal:tool.shield_flux"       , "6"   , FLE                               , "fluxed_electrum"  ,
"psi:psimetal_shovel"                    , "1"   , PSI                               , "psimetal"         ,
"psi:psimetal_pickaxe"                   , "2"   , PSI                               , "psimetal"         ,
"psi:psimetal_axe"                       , "2"   , PSI                               , "psimetal"         ,
"psi:psimetal_sword"                     , "1"   , PSI                               , "psimetal"         ,
"psi:psimetal_exosuit_helmet"            , "4"   , PSI                               , "psimetal"         ,
"psi:psimetal_exosuit_chestplate"        , "6"   , PSI                               , "psimetal"         ,
"psi:psimetal_exosuit_leggings"          , "5"   , PSI                               , "psimetal"         ,
"psi:psimetal_exosuit_boots"             , "2"   , PSI                               , "psimetal"         ,
"iceandfire:troll_weapon.axe"            , "8"   , IRN                               , "iron"             ,
"bloodmagic:living_armour_helmet"        , "5"   , IRN                               , "iron"             ,
"bloodmagic:living_armour_chest"         , "8"   , IRN                               , "iron"             ,
"bloodmagic:living_armour_leggings"      , "7"   , IRN                               , "iron"             ,
"bloodmagic:living_armour_boots"         , "4"   , IRN                               , "iron"             ,
"enderio:item_stellar_alloy_sword"       , "2"   , SLR                               , "stellar_alloy"    ,
"enderio:item_stellar_alloy_pickaxe"     , "3"   , SLR                               , "stellar_alloy"    ,
"enderio:item_stellar_alloy_axe"         , "3"   , SLR                               , "stellar_alloy"    ,
"enderio:item_stellar_alloy_helmet"      , "5"   , SLR                               , "stellar_alloy"    ,
"enderio:item_stellar_alloy_boots"       , "4"   , SLR                               , "stellar_alloy"    ,
"enderio:item_stellar_alloy_chestplate"  , "8"   , SLR                               , "stellar_alloy"    ,
"enderio:item_stellar_alloy_leggings"    , "7"   , SLR                               , "stellar_alloy"    ,
"ic2:quantum_boots"                      , "8"   , "thermalfoundation:material:135"  , "iridium"          ,
"ic2:quantum_chestplate"                 , "8"   , "thermalfoundation:material:135"  , "iridium"          ,
"ic2:quantum_helmet"                     , "8"   , "thermalfoundation:material:135"  , "iridium"          ,
"ic2:quantum_leggings"                   , "8"   , "thermalfoundation:material:135"  , "iridium"          ,
"iceandfire:troll_weapon.hammer"         , "8"   , "mechanics:heavy_ingot"           , "heavy_metal"      ,
"animus:kama_diamond"                    , "8"   , "minecraft:diamond"               , ""                 ,
"botania:manaweavehelm"                  , "20"  , "botania:manaresource:16"         , "!saw"             ,
"botania:manaweavechest"                 , "32"  , "botania:manaresource:16"         , "!saw"             ,
"botania:manaweavelegs"                  , "28"  , "botania:manaresource:16"         , "!saw"             ,
"botania:manaweaveboots"                 , "16"  , "botania:manaresource:16"         , "!saw"             ,
"twilightforest:arctic_boots"            , "4"   , "twilightforest:arctic_fur"       , "!saw"             ,
"twilightforest:arctic_leggings"         , "7"   , "twilightforest:arctic_fur"       , "!saw"             ,
"twilightforest:arctic_chestplate"       , "8"   , "twilightforest:arctic_fur"       , "!saw"             ,
"twilightforest:arctic_helmet"           , "5"   , "twilightforest:arctic_fur"       , "!saw"             ,
"twilightforest:yeti_boots"              , "4"   , "twilightforest:alpha_fur"        , "!saw"             ,
"twilightforest:yeti_leggings"           , "7"   , "twilightforest:alpha_fur"        , "!saw"             ,
"twilightforest:yeti_chestplate"         , "8"   , "twilightforest:alpha_fur"        , "!saw"             ,
"twilightforest:yeti_helmet"             , "5"   , "twilightforest:alpha_fur"        , "!saw"             ,
"twilightforest:naga_leggings"           , "7"   , "twilightforest:naga_scale"       , "!saw"             ,
"twilightforest:naga_chestplate"         , "8"   , "twilightforest:naga_scale"       , "!saw"             ,
"rats:archeologist_hat"                  , "4"   , "thermalfoundation:material:801"  ,""                  ,
"quark:archaeologist_hat"                , "4"   , "thermalfoundation:material:801"  ,""                  ,
"rats:pirat_cutlass"                     , "4"   , "thermalfoundation:material:133"  ,"nickel"            ,
"rats:piper_hat"                         , "10"  , "minecraft:paper"                 ,"!saw"              ,
"rats:pirat_hat"                         , "5"   , "minecraft:wool:15"               ,"!saw"              ,
"quark:pirate_hat"                       , "5"   , "minecraft:wool:15"               ,"!saw"              ,
];

# Exceptions for machines that can saw
val sawExcs = "except: shapeless BlockCutter manufactory AdvRockCutter";

# Iterate list and call appropriate functions
for i in 0 to itemsToRecycle.length {
	if (i%4==0) {
		val item = itemUtils.getItem(itemsToRecycle[i]);
		val count = itemsToRecycle[i+1] as int;
		val resclItem = getItemstackFromString(itemsToRecycle[i+2]);
		val resclLiqd = game.getLiquid(itemsToRecycle[i+3]);

		if (!isNull(item) && !isNull(resclItem)) {
			if (!isNull(resclLiqd)) {
				scripts.process.recycleMetal(item, resclItem * count, resclLiqd * (count * 144), "no exceptions");
			} else if (itemsToRecycle[i+3] == "!saw") {
				scripts.process.saw(item, resclItem * count, sawExcs);
			} else {
				scripts.process.crush(item, resclItem * count, "no exceptions", null, null);
			}
		} else {
			logger.logWarning("Cant recycle [" ~ itemsToRecycle[i] ~ "]" ~ (isNull(item) ? "NULL" : "") ~" -> [" ~ itemsToRecycle[i+2] ~ "]" ~ (isNull(resclItem) ? "NULL" : ""));
		}
	}
}


# Extract binding reagent from armor and Khopesh
# mods.bloodmagic.AlchemyTable.addRecipe(IItemStack output, IItemStack[] inputs, int syphon, int ticks, int minTier);
mods.bloodmagic.AlchemyTable.addRecipe(<bloodmagic:component:8> , [<bloodmagic:living_armour_helmet>]   , 300 , 40 , 3);
mods.bloodmagic.AlchemyTable.addRecipe(<bloodmagic:component:8> , [<bloodmagic:living_armour_chest>]    , 300 , 40 , 3);
mods.bloodmagic.AlchemyTable.addRecipe(<bloodmagic:component:8> , [<bloodmagic:living_armour_leggings>] , 300 , 40 , 3);
mods.bloodmagic.AlchemyTable.addRecipe(<bloodmagic:component:8> , [<bloodmagic:living_armour_boots>]    , 300 , 40 , 3);
mods.bloodmagic.AlchemyTable.addRecipe(<bloodmagic:component:8> , [<animus:kama_bound>]                 , 300 , 40 , 3);


# Some troll items can be disassembled on crafting table
# Using public function compressIt() to make Preston's blocks
recipes.addShapeless("Disassemble troll column"       , <extrautils2:compressedcobblestone> * 4               , [<iceandfire:troll_weapon.column>]);
recipes.addShapeless("Disassemble troll column_forest", compressIt(<minecraft:mossy_cobblestone>      , 1) * 4, [<iceandfire:troll_weapon.column_forest>]);
recipes.addShapeless("Disassemble troll column_frost" , compressIt(<quark:biome_cobblestone:1>        , 1) * 4, [<iceandfire:troll_weapon.column_frost>]);
recipes.addShapeless("Disassemble troll trunk"        , compressIt(<rustic:log:1>                     , 1) * 4, [<iceandfire:troll_weapon.trunk>]);
recipes.addShapeless("Disassemble troll trunk_frost"  , compressIt(<integrateddynamics:menril_log>    , 1) * 4, [<iceandfire:troll_weapon.trunk_frost>]);