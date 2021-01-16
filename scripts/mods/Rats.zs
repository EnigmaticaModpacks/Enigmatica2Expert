import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.jei.JEI.removeAndHide as rh;
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
ratUpgrade("rat_upgrade_basic_0", <rats:rat_upgrade_basic>,   gemDiamondRat);
ratUpgrade("rat_upgrade_basic_2", <rats:rat_upgrade_basic>*3, <mekanism:compresseddiamond>);
val fragment = <rats:rat_upgrade_fragment>;
recipes.addShaped("rat_upgrade_from_fragment", <rats:rat_upgrade_basic>, [
	[fragment, fragment, fragment],
	[fragment, fragment, fragment],
	[fragment, fragment, fragment]]);


# [Rat_Upgrade__Gemcutter] from [Rat_Upgrade__Basic][+3]
craft.remake(<rats:rat_upgrade_gemcutter>, ["pretty",
  "P M P",
  "▬ R ▬",
  "P M P"], {
  "P": <randomthings:ingredient:9>,      # Precious Emerald
  "R": <rats:rat_upgrade_basic>,         # Rat Upgrade: Basic
  "▬": <ore:ingotCarbon>,                # Carbon Brick
  "M": <extrautils2:decorativesolidwood> # Magical Planks
});


# [Rat_Upgrade__Chef] from [Rat_Upgrade__Basic][+5]
craft.remake(<rats:rat_upgrade_chef>, ["pretty",
  "e C e",
  "A R A",
  "L H L"], {
  "A": <cyclicmagic:food_step>,         # Apple of Lofty Stature
  "R": <rats:rat_upgrade_basic>,        # Rat Upgrade: Basic
  "C": <rats:chef_toque>.anyDamage(),   # Chef Toque
  "e": <ore:foodLemondrizzlecake>,      # Lemon Drizzle Cake
  "H": <forestry:honey_pot>,            # Honey Pot
  "L": <rats:little_black_squash_balls> # Little Black Squash Balls
});


# [Rat_Upgrade__Aristoc-Rat] from [Rat_Upgrade__Basic][+4]
craft.remake(<rats:rat_upgrade_aristocrat>, ["pretty",
  "S T S",
  "M R M",
  "S § S"], {
  "R": <rats:rat_upgrade_basic>, # Rat Upgrade: Basic
  "S": <ore:coinSignalum>,       # Signalum Coin
  "T": <rats:top_hat>.anyDamage(),# Top Hat
  "§": <randomthings:slimecube>, # Slime Cube
  "M": <tconstruct:materials:19> # Mending Moss
});


# [Rat_Upgrade__Ore_Doubling] from [Rat_Upgrade__Basic][+3]
craft.remake(<rats:rat_upgrade_ore_doubling>, ["pretty",
  "P T P",
  "T R T",
  "P G P"], {
  "P": <rats:rat_nugget>,             # Rat "Nugget"
  "R": <rats:rat_upgrade_basic>,      # Rat Upgrade: Basic
  "T": <ic2:forge_hammer>.anyDamage().noReturn(),
  "G": <randomthings:ingredient:11>   # Golden Egg
});


# Gem of ratlantis
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
	[<rats:marbled_cheese_raw>, <ore:hatArcheologist>, <rats:marbled_cheese_raw>], 
	[<ore:boneDragon>, <rats:rat_upgrade_basic_ratlantean>, <ore:boneDragon>], 
	[<randomthings:spectrepickaxe>.anyDamage(), <ore:tokenOrIdolFlag>, <randomthings:spectreshovel>.anyDamage()]
]);

# Rat flowers
scripts.process.grow(<rats:ratglove_flower>, <rats:ratglove_flower> * 9, "No exceptions", null, 0);


var csandwich = <culinaryconstruct:sandwich>.withTag({Size: 5, Saturation: 1.1549999 as float, Ingredients: {Items: [{Slot: 0 as byte, id: "animania:sheep_cheese_wedge", Count: 1 as byte, Damage: 0 as short}, {Slot: 1 as byte, id: "animania:goat_cheese_wedge", Count: 1 as byte, Damage: 0 as short}, {Slot: 2 as byte, id: "animania:friesian_cheese_wedge", Count: 1 as byte, Damage: 0 as short}, {Slot: 3 as byte, id: "animania:holstein_cheese_wedge", Count: 1 as byte, Damage: 0 as short}, {Slot: 4 as byte, id: "animania:jersey_cheese_wedge", Count: 1 as byte, Damage: 0 as short}, {Slot: 5 as byte, id: "minecraft:bread", Count: 1 as byte, Damage: 0 as short}]}, Bonus: 2, Depth: 0, Food: 10});
var cplate = <tconstruct:large_plate>.withTag({Material: "cheese"});
scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, <rats:creative_cheese>, [
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
scripts.process.squeeze([<rats:plastic_waste>], <liquid:dirt> * 100, null, <rats:raw_plastic>);

# Polyethene from rat plastic
scripts.wrap.mekanism.enrichment.addRecipe(<rats:raw_plastic>*16, <mekanism:polyethene>);

# Rat tube from HDPE
recipes.remove(<rats:rat_tube_white>);
scripts.wrap.immersiveengineering.MetalPress.addRecipe(<mekanism:polyethene:1>, <mekanism:polyethene>*2, <immersiveengineering:mold:2>, 4000, 1);
furnace.addRecipe(<rats:rat_tube_white>, <mekanism:polyethene:1>);


# Alternative rat diamond uses
val compressed_D = <mekanism:compresseddiamond>;
scripts.wrap.mekanism.enrichment.addRecipe(<rats:rat_diamond>, compressed_D);

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
    mods.rats.recipes.addGemcutterRatRecipe(allCoinsConversions[k+1], allCoinsConversions[k] * 4);
    k += 2;
}

# Magic bean
mods.rats.recipes.addChefRatRecipe(<randomthings:beans:1>, <randomthings:beans:2>);

# addArcheologistRatRecipe(IItemStack iinput, IItemStack ioutput)
mods.rats.recipes.addArcheologistRatRecipe(<minecraft:skull:3>, <iceandfire:gorgon_head>);
mods.rats.recipes.addArcheologistRatRecipe(<minecraft:ghast_tear>, <iceandfire:siren_tear>);
mods.rats.recipes.addArcheologistRatRecipe(<iceandfire:dragonbone>, <iceandfire:troll_tusk>);
mods.rats.recipes.addArcheologistRatRecipe(<twilightforest:raven_feather>, <iceandfire:stymphalian_bird_feather>);
mods.rats.recipes.addArcheologistRatRecipe(<rats:rat_pelt>, <iceandfire:troll_leather_forest>);
mods.rats.recipes.addArcheologistRatRecipe(<harvestcraft:hardenedleatheritem>, <iceandfire:troll_leather_frost>);




##################
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

var j as int = 0;
while (j < listConversionScales.length) {
    mods.rats.recipes.addArcheologistRatRecipe(listConversionScales[j], listConversionScales[j+1]);
    j += 2;
}

# Casting sawblade
scripts.wrap.tconstruct.Casting.addTableRecipe(<rats:ancient_sawblade>, <ic2:block_cutting_blade:2>, <fluid:knightmetal>, (144*12), true, (30*20));

# Ratlanean spirit flame
recipes.addShaped("Ratlanean Flame", <rats:ratlantean_flame>, [
	[null, <randomthings:ingredient:2>, null],
	[<randomthings:ingredient:2>, <rats:raw_rat>, <randomthings:ingredient:2>],
	[null, <forestry:crafting_material:1>, null]
]);

# Psionic rat brain
scripts.wrap.thaumcraft.Infusion.registerRecipe("psionic_rat_brain", "INFUSION", <rats:psionic_rat_brain>, 40, 
	[<aspect:cognitio> * 150, <aspect:alienis> * 40, <aspect:rattus> * 80], <thaumcraft:brain>, 
	[<rats:charged_creeper_chunk>, <rats:chunky_cheese_token>, <rats:charged_creeper_chunk>, <cd4017be_lib:m:402>, 
	 <rats:charged_creeper_chunk>, <cd4017be_lib:m:402>, <draconicevolution:draconium_block:1>, <rats:charged_creeper_chunk>]
);

# Oredict pirate hat recipe
remake("rats rat_upgrade_buccaneer", <rats:rat_upgrade_buccaneer>, [
	[<rats:cheese_cannonball>, <ore:hatPirate>, <rats:cheese_cannonball>], 
	[<rats:cheese_cannonball>, <rats:rat_upgrade_basic_ratlantean>, <rats:cheese_cannonball>], 
	[<rats:cheese_cannonball>, <rats:pirat_cutlass>, <rats:cheese_cannonball>]]);
remake("rats idol_of_ratlantis", <rats:idol_of_ratlantis>, [
	[<rats:arcane_technology>, <ore:hatPirate>, <rats:psionic_rat_brain>], 
	[<rats:rat_toga>, <rats:gem_of_ratlantis>, <rats:marbled_cheese_rat_head>], 
	[<rats:ratglove_petals>, <rats:feral_rat_claw>, <rats:ratlantean_flame>]]);


# Rat diamond melting
scripts.process.melt(<rats:rat_diamond>, <liquid:diamond> * 165, "No Exceptions");

# Harder little balls recipe (was from coal)
mods.rats.recipes.removeGemcutterRatRecipe(<rats:little_black_squash_balls>);
mods.rats.recipes.addGemcutterRatRecipe(<advancedrocketry:misc:1>, <rats:little_black_squash_balls> * 3);

# Red Coal alternative
mods.rt.RandomThingsTweaker.addImbuingRecipe(
<rustic:fluid_bottle>.withTag({Fluid: {FluidName: "wildberryjuice", Amount: 1000}}), 
<actuallyadditions:item_misc:22>, 
<deepmoblearning:soot_covered_redstone>, 
<rats:little_black_squash_balls>, 
<extrautils2:ingredients:4> * 3);