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
# Craft Changes
#
# ######################################################################

# Remove cheese recipe from milk
mods.tconstruct.Casting.removeBasinRecipe(<rats:block_of_cheese>);

for item in [
	<rats:auto_curdler>,
	<rats:cauldron_milk>,
	<rats:cauldron_cheese>
] as IItemStack[] {
	rh(item);
}

# Cage
remake("rats_rat_cage", <rats:rat_cage>, [
	[<ore:stickIron>, <ore:stickIron>, <ore:stickIron>], 
	[<ore:stickIron>, <ore:stickIron>, <ore:stickIron>], 
	[<mekanism:polyethene:2>, <animania:wool:*>, <mekanism:polyethene:2>]
]);

# Breeding Lantern
remake("rat_breeding_lantern", <rats:rat_breeding_lantern>, [
	[null, <randomthings:escaperope>.anyDamage(), null], 
	[<scalinghealth:heartdust>, <minecraft:potion>.withTag({Potion: "extrautils2:xu2.love"}), <scalinghealth:heartdust>], 
	[null, <scalinghealth:heartdust>, null]
]);

# Gemcutter upgrade
remake("rat_upgrade_gemcutter", <rats:rat_upgrade_gemcutter>, [
	[<randomthings:ingredient:9>, <ore:crystalFluix>, <randomthings:ingredient:9>], 
	[<ore:crystalFluix>, <rats:rat_upgrade_basic>, <ore:crystalFluix>], 
	[<randomthings:ingredient:9>, <ore:crystalFluix>, <randomthings:ingredient:9>]
]);

# Rat upgrade function
function ratUpgrade(name as string, result as IItemStack, mat as IIngredient){
	recipes.addShaped(name, result, [
		[mat, <ore:cheeseWheels>, mat], 
		[<ore:cheeseWheels>, null, <ore:cheeseWheels>], 
		[mat, <ore:cheeseWheels>, mat]
	]);
}

# Overpowered food
recipes.remove(<rats:little_black_worm>);
val lsballs = <rats:little_black_squash_balls>;
recipes.addShaped("little_black_worm", <rats:little_black_worm>, [
[lsballs, <rats:potato_pancake>, 	   lsballs], 
[lsballs, <avaritia:cosmic_meatballs>, lsballs], 
[lsballs, <rats:potato_pancake>,       lsballs]]);

mods.rats.recipes.removeChefRatRecipe(<rats:confit_byaldi>);
mods.rats.recipes.addChefRatRecipe(<avaritia:ultimate_stew>, <rats:confit_byaldi>);


# Base Upgrade
recipes.remove(<rats:rat_upgrade_basic>);
ratUpgrade("rat_upgrade_basic_0", <rats:rat_upgrade_basic>,   <ore:gemDiamond>);
ratUpgrade("rat_upgrade_basic_1", <rats:rat_upgrade_basic>,   <rats:rat_diamond>);
ratUpgrade("rat_upgrade_basic_2", <rats:rat_upgrade_basic>*3, <mekanism:compresseddiamond>);

# Chef upgrade
remake("rat_upgrade_chef", <rats:rat_upgrade_chef>, [
	[<ore:foodLemondrizzlecake>, <rats:chef_toque>.anyDamage(), <ore:foodLemondrizzlecake>], 
	[<ore:foodLemondrizzlecake>, <rats:rat_upgrade_basic>, <ore:foodLemondrizzlecake>], 
	[<rats:little_black_squash_balls>, <mysticalagriculture:intermedium_apple>, <rats:little_black_squash_balls>]
]);

# Ore Dubling rat
remakeEx(<rats:rat_upgrade_ore_doubling>, [
	[<ore:ratPoop>, <ore:craftingToolForgeHammer>, <ore:ratPoop>], 
	[<ore:craftingToolForgeHammer>, <rats:rat_upgrade_basic>, <ore:craftingToolForgeHammer>], 
	[<ore:ratPoop>, <randomthings:ingredient:11>, <ore:ratPoop>]
]);

# Aristocrat 
remakeEx(<rats:rat_upgrade_aristocrat>, [
	[<ore:coinPlatinum>, <rats:top_hat>.anyDamage(), <ore:coinPlatinum>], 
	[<randomthings:ingredient:9>, <rats:rat_upgrade_basic>, <randomthings:ingredient:9>], 
	[<ore:coinPlatinum>, <extrautils2:opinium:2>, <ore:coinPlatinum>]
]);

# Gem of ratlantis
//mods.botania.RuneAltar.addRecipe(IItemStack output, IIngredient[] input, int mana);
recipes.remove(<rats:gem_of_ratlantis>);
mods.botania.RuneAltar.addRecipe(<rats:gem_of_ratlantis>, [
    <rats:ratglove_petals>, <rats:ratglove_petals>, <rats:ratglove_petals>, <ore:gemEmerald>, <ore:gemEmerald>, <ore:gemEmerald>
], 20000);

# Ratlanean upgrade
remake("rat_upgrade_basic_ratlantean", <rats:rat_upgrade_basic_ratlantean>, [
	[<randomthings:ingredient:9>, <rats:marbled_cheese>, <randomthings:ingredient:9>], 
	[<rats:marbled_cheese>, <rats:rat_upgrade_basic>, <rats:marbled_cheese>], 
	[<randomthings:ingredient:9>, <rats:marbled_cheese>, <randomthings:ingredient:9>]
]);

# Archeologist upgrade
remake("rat_upgrade_archeologist", <rats:rat_upgrade_archeologist>, [
	[<rats:marbled_cheese_raw>, <rats:archeologist_hat>, <rats:marbled_cheese_raw>], 
	[<ore:boneDragon>, <rats:rat_upgrade_basic_ratlantean>, <ore:boneDragon>], 
	[<bloodmagic:sentient_pickaxe>, <ore:tokenOrIdolFlag>, <bloodmagic:sentient_shovel>]
]);

# Change rat petals combine crafting
recipes.remove(<rats:ratglove_petals>);
remakeFluidToItem(<rats:ratglove_petals>, <fluid:blueslime>, <rats:ratglove_flower>*9);
remakeFluidToItem(<rats:compressed_rat>, <fluid:blueslime>, <rats:ratglove_flower>*9);

#Creative upgrades
mods.extendedcrafting.TableCrafting.addShaped(0, <rats:rat_upgrade_creative>, [
	[<ore:ingotUltimate>, <ore:ingotUltimate>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:ingotUltimate>, <ore:ingotUltimate>], 
	[<ore:ingotUltimate>, <ore:ingotUltimate>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:ingotUltimate>, <ore:ingotUltimate>], 
	[<ore:cheeseWheels>, <ore:cheeseWheels>, <botania:brewflask>.withTag({brewKey: "overload"}), <rats:chunky_cheese_token>, <rats:chunky_cheese_token>, <rats:chunky_cheese_token>, <botania:brewflask>.withTag({brewKey: "overload"}), <ore:cheeseWheels>, <ore:cheeseWheels>], 
	[<ore:cheeseWheels>, <ore:cheeseWheels>, <rats:chunky_cheese_token>, <scalinghealth:difficultychanger>, <scalinghealth:heartcontainer>, <scalinghealth:difficultychanger>, <rats:chunky_cheese_token>, <ore:cheeseWheels>, <ore:cheeseWheels>], 
	[<ore:cheeseWheels>, <ore:cheeseWheels>, <rats:chunky_cheese_token>, <scalinghealth:heartcontainer>, <rats:rat_upgrade_nonbeliever>, <scalinghealth:heartcontainer>, <rats:chunky_cheese_token>, <ore:cheeseWheels>, <ore:cheeseWheels>], 
	[<ore:cheeseWheels>, <ore:cheeseWheels>, <rats:chunky_cheese_token>, <scalinghealth:difficultychanger>, <scalinghealth:heartcontainer>, <scalinghealth:difficultychanger>, <rats:chunky_cheese_token>, <ore:cheeseWheels>, <ore:cheeseWheels>], 
	[<ore:cheeseWheels>, <ore:cheeseWheels>, <botania:brewflask>.withTag({brewKey: "overload"}), <rats:chunky_cheese_token>, <rats:chunky_cheese_token>, <rats:chunky_cheese_token>, <botania:brewflask>.withTag({brewKey: "overload"}), <ore:cheeseWheels>, <ore:cheeseWheels>], 
	[<ore:ingotUltimate>, <ore:ingotUltimate>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:ingotUltimate>, <ore:ingotUltimate>], 
	[<ore:ingotUltimate>, <ore:ingotUltimate>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:cheeseWheels>, <ore:ingotUltimate>, <ore:ingotUltimate>]
]);

var csandwich = <culinaryconstruct:sandwich>.withTag({Size: 5, Saturation: 1.1549999 as float, Ingredients: {Items: [{Slot: 0 as byte, id: "animania:friesian_cheese_wedge", Count: 1 as byte, Damage: 0 as short}, {Slot: 1 as byte, id: "animania:holstein_cheese_wedge", Count: 1 as byte, Damage: 0 as short}, {Slot: 2 as byte, id: "animania:goat_cheese_wedge", Count: 1 as byte, Damage: 0 as short}, {Slot: 3 as byte, id: "animania:sheep_cheese_wedge", Count: 1 as byte, Damage: 0 as short}, {Slot: 4 as byte, id: "animania:jersey_cheese_wedge", Count: 1 as byte, Damage: 0 as short}, {Slot: 5 as byte, id: "minecraft:bread", Count: 1 as byte, Damage: 0 as short}]}, Bonus: 2, Depth: 0, Food: 10});
var cplate = <tconstruct:large_plate>.withTag({Material: "cheese"});
mods.extendedcrafting.TableCrafting.addShaped(0, <rats:creative_cheese>, [
	[cplate, cplate, csandwich, csandwich, csandwich, cplate, cplate], 
	[cplate, <harvestcraft:cheesesteakitem>, <harvestcraft:cheesesteakitem>, <actuallyadditions:item_food>, <harvestcraft:cheesesteakitem>, <harvestcraft:cheesesteakitem>, cplate], 
	[csandwich, <harvestcraft:cheesesteakitem>, <ore:blockLuminessence>, <mekanism:tierinstaller:3>, <ore:blockLuminessence>, <harvestcraft:cheesesteakitem>, csandwich], 
	[csandwich, <actuallyadditions:item_food>, <mekanism:tierinstaller:3>, <ore:ingotCosmicNeutronium>, <mekanism:tierinstaller:3>, <actuallyadditions:item_food>, csandwich], 
	[csandwich, <harvestcraft:cheesesteakitem>, <ore:blockLuminessence>, <mekanism:tierinstaller:3>, <ore:blockLuminessence>, <harvestcraft:cheesesteakitem>, csandwich], 
	[cplate, <harvestcraft:cheesesteakitem>, <harvestcraft:cheesesteakitem>, <actuallyadditions:item_food>, <harvestcraft:cheesesteakitem>, <harvestcraft:cheesesteakitem>, cplate], 
	[cplate, cplate, csandwich, csandwich, csandwich, cplate, cplate]
]);

# ######################################################################
#
# Compat material using
#
# ######################################################################

# Remove original marbled cheese recipe
recipes.remove(<rats:marbled_cheese_raw>);

# Raw Plastic from squeeser
furnace.remove(<rats:raw_plastic>);
mods.integrateddynamics.Squeezer.addRecipe(
    <rats:plastic_waste>*16, <rats:raw_plastic>, <liquid:dirt> * 100);
mods.integrateddynamics.MechanicalSqueezer.addRecipe(
    <rats:plastic_waste>*12, <rats:raw_plastic>, <liquid:dirt> * 100);

# Polyethene from rat plastic
mods.mekanism.enrichment.addRecipe(<rats:raw_plastic>*8, <mekanism:polyethene>);

# Rat tube from HDPE
recipes.remove(<rats:rat_tube_white>);
mods.immersiveengineering.MetalPress.addRecipe(<mekanism:polyethene:1>, <mekanism:polyethene>*2, <immersiveengineering:mold:2>, 4000, 1);
furnace.addRecipe(<rats:rat_tube_white>, <mekanism:polyethene:1>);


# Alternative rat diamond uses
val compressed_D = <mekanism:compresseddiamond>;
mods.mekanism.enrichment.addRecipe(<rats:rat_diamond>, compressed_D);

var allCoinsConversions as IItemStack[] = [
    <jaopca:item_coinardite>,           <tconstruct:ingots:1>,
    <jaopca:item_coinastralstarmetal>,  <astralsorcery:itemcraftingcomponent:1>,
    <jaopca:item_coinboron>,            <nuclearcraft:ingot:5>,
    <jaopca:item_coincobalt>,           <tconstruct:ingots>,
    <jaopca:item_coindraconium>,        <draconicevolution:draconium_ingot>,
    <jaopca:item_coinlithium>,          <nuclearcraft:ingot:6>,
    <jaopca:item_coinmagnesium>,        <nuclearcraft:ingot:7>,
    <jaopca:item_coinosmium>,           <mekanism:ingot:1>,
    <jaopca:item_cointhorium>,          <nuclearcraft:ingot:3>,
    <jaopca:item_cointitanium>,         <libvulpes:productingot:7>,
    <jaopca:item_coinuranium>,          <immersiveengineering:metal:5>,
    <thermalfoundation:coin>,           <minecraft:iron_ingot>,
    <thermalfoundation:coin:1>,         <minecraft:gold_ingot>,
    <thermalfoundation:coin:64>,        <thermalfoundation:material:128>,
    <thermalfoundation:coin:65>,        <thermalfoundation:material:129>,
    <thermalfoundation:coin:66>,        <thermalfoundation:material:130>,
    <thermalfoundation:coin:67>,        <thermalfoundation:material:131>,
    <thermalfoundation:coin:68>,        <thermalfoundation:material:132>,
    <thermalfoundation:coin:69>,        <thermalfoundation:material:133>,
    <thermalfoundation:coin:70>,        <thermalfoundation:material:134>,
    <thermalfoundation:coin:71>,        <thermalfoundation:material:135>,
    <thermalfoundation:coin:72>,        <thermalfoundation:material:136>,
    <thermalfoundation:coin:96>,        <thermalfoundation:material:160>,
    <thermalfoundation:coin:97>,        <thermalfoundation:material:161>,
    <thermalfoundation:coin:98>,        <thermalfoundation:material:162>,
    <thermalfoundation:coin:99>,        <thermalfoundation:material:163>,
    <thermalfoundation:coin:100>,       <thermalfoundation:material:164>,
    <thermalfoundation:coin:101>,       <thermalfoundation:material:165>,
    <thermalfoundation:coin:102>,       <thermalfoundation:material:166>,
    <thermalfoundation:coin:103>,       <thermalfoundation:material:167>
];

var k as int = 0;
while (k < allCoinsConversions.length) {
    mods.rats.recipes.addGemcutterRatRecipe(allCoinsConversions[k+1], allCoinsConversions[k]);
    k += 2;
}

# Magic bean
mods.rats.recipes.addChefRatRecipe(<randomthings:beans:1>, <randomthings:beans:2>);

# addArcheologistRatRecipe(IItemStack iinput, IItemStack ioutput)
mods.rats.recipes.addArcheologistRatRecipe(<minecraft:skull:3>, <iceandfire:gorgon_head>);
mods.rats.recipes.addArcheologistRatRecipe(<minecraft:ghast_tear>, <iceandfire:siren_tear>);
mods.rats.recipes.addArcheologistRatRecipe(<iceandfire:dragonbone>, <iceandfire:troll_tusk>);
mods.rats.recipes.addArcheologistRatRecipe(<twilightforest:raven_feather>, <iceandfire:stymphalian_bird_feather>);
mods.rats.recipes.addArcheologistRatRecipe(<backpack:tanned_leather>, <iceandfire:troll_leather_forest>);
mods.rats.recipes.addArcheologistRatRecipe(<harvestcraft:hardenedleatheritem>, <iceandfire:troll_leather_frost>);




////////////////////////////////////
// Dragon Scales
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

var j as int = 0;
while (j < listConversionScales.length) {
    mods.rats.recipes.addArcheologistRatRecipe(listConversionScales[j], listConversionScales[j+1]);
    j += 2;
}

////////////////////////////////////
// Rat poop processing
/* 
var jaopcaAllOre = mods.jaopca.JAOPCA.getAllOres();

// for testJ in jaopcaAllOre{
// 	var s = "";
// 	s += "JAOPCA .oreName = " ~ testJ.oreName;
// 	if (!isNull(testJ.getItemStack("ingot"))) { s += ("\n ingot=" ~ testJ.getItemStack("ingot").name); }
// 	if (!isNull(testJ.getItemStack("gem"))) { s += ("\n gem=" ~ testJ.getItemStack("gem").name); }
// 	if (!isNull(testJ.getItemStack("dust"))) { s += ("\n dust=" ~ testJ.getItemStack("dust").name); }
// 	print(s);
// } 

function jGetDust(listAllOre as OreEntry[], id as string) as IItemStack{
	for testJ in listAllOre {
		var getDust = testJ.getItemStack("dust") as IItemStack;
		if (!isNull(getDust) && getDust.definition.id == id) {
				return getDust;
		}
	}
	return null;
}


for poop in scripts.DataTables.listRatPoop{
		print("Processing poop: " ~ poop.name);
    if (!isNull(poop.tag.OreItem) && !isNull(poop.tag.IngotItem)){
			print("Processing poop.tag.OreItem.id.asString(): " ~ poop.tag.OreItem.id.asString());

			var pOre = itemUtils.getItem(
				poop.tag.OreItem.id.asString(),
				poop.tag.OreItem.Damage.asString() as int)
				* poop.tag.OreItem.Count.asString() as int;
			var pIng = itemUtils.getItem(
				poop.tag.IngotItem.id.asString(),
				poop.tag.IngotItem.Damage.asString() as int)
				* poop.tag.IngotItem.Count.asString() as int;

			# Have dust output
			var pDust = jGetDust(jaopcaAllOre, pIng.definition.id);
			if(!isNull(pDust)){
				# ID Squeeser
				//Squeezer.addRecipe(IItemStack inputStack, @Optional IItemStack outputStack, @Optional ILiquidStack outputFluid);
				mods.integrateddynamics.Squeezer.addRecipe(poop, pDust*2, <liquid:dirt> * 100);
				mods.integrateddynamics.MechanicalSqueezer.addRecipe(poop, pDust*2, <liquid:dirt> * 100);
			}
			// for testJ in jaopcaAllOre {
			// 	var getDust = testJ.getItemStack("dust") as IItemStack;
			// 	if (!isNull(getDust) && getDust.definition.id == pIng.definition.id) {
			// 			print("JAOPCA dust found for: " ~ pOre.name);
			// 		}
			// 	}
				
				// if (testJ.getItemStack("ingot") == pIng || 
				// 	  testJ.getItemStack("gem") == pIng ||
				// 		testJ.getItemStack("dust") == pIng ) {
							
				// 		print("JAOPCA entry found for: " ~ pOre.name);
				// }
			// }

			# Induction Smelter
			// mods.thermalexpansion.InductionSmelter.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
			// mods.thermalexpansion.InductionSmelter.addRecipe(pIng*2, poop, <minecraft:sand>, 4000, <industrialforegoing:fertilizer>, 25);

			# Melting
			// mods.tconstruct.Melting.addRecipe(<liquid:molten_gold> * 144,<minecraft:gold_ingot>);		
	}
}


-<rats:rat_nugget>
-<rats:rat_nugget_ore>.withTag({OreItem: {id: "thermalfoundation:ore", Count: 1 as byte, Damage: 4 as short}, IngotItem: {id: "thermalfoundation:material", Count: 1 as byte, Damage: 132 as short}})
-<rats:rat_nugget_ore:1>.withTag({OreItem: {id: "biomesoplenty:gem_ore", Count: 1 as byte, Damage: 7 as short}, IngotItem: {id: "biomesoplenty:gem", Count: 1 as byte, Damage: 7 as short}})
-<rats:rat_nugget_ore:2>.withTag({OreItem: {id: "forestry:resources", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "forestry:apatite", Count: 1 as byte, Damage: 0 as short}})
-<rats:rat_nugget_ore:3>.withTag({OreItem: {id: "astralsorcery:blockcustomsandore", Count: 1 as byte, Damage: 0 as short}, IngotItem: {id: "astralsorcery:itemcraftingcomponent", Count: 3 as byte, Damage: 0 as short}})
*/
