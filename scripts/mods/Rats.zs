import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.jaopca.JAOPCA;
import mods.jaopca.OreEntry;
import mods.ctutils.utils.Math.sqrt;

# Untamed tagged rats still despawns.
# Deny this by costom event
events.onAllowDespawn(function(e as crafttweaker.event.EntityLivingSpawnEvent) {
  if(
    e.world.isRemote()
    || !(e.entity instanceof crafttweaker.entity.IEntityAnimal)
    || e.entityLivingBase.definition.id != 'rats:rat'
  ) return;

  if(
    !isNull(e.entity.customName)
    && e.entity.customName != ''
    && !e.entity.customName.endsWith('Compressed Rat')
    && !e.entity.customName.endsWith('Compressed Plague Rat')
  ) {
    return e.deny();
  }

  e.allow();
});

# ######################################################################
#
# Craft Changes
#
# ######################################################################

# Remove cheese recipe from milk and from regular cheese
recipes.remove(<rats:block_of_cheese>);
mods.tconstruct.Casting.removeBasinRecipe(<rats:block_of_cheese>);

for item in [
	<rats:auto_curdler>,
	<rats:cauldron_milk>,
	<rats:cauldron_cheese>
] as IItemStack[] {
	utils.rh(item);
}

# [Rat Cage] from [Wool (Suffolk, Brown)][+2]
craft.remake(<rats:rat_cage>, ["pretty",
  "╱ ╱ ╱",
  "╱ ╱ ╱",
  "O w O"], {
  "╱": <ore:stickIron>, # Iron Rod
  "O": <ore:plastic>, # Raw Plastic
  "w": <ore:woolPrime>, # Wool (Suffolk, Brown)
});

# [Rat Breeding Lantern] from [Heart Dust][+1]
craft.reshapeless(<rats:rat_breeding_lantern>, "E▲", {
  "E": <randomthings:escaperope>.anyDamage(), # Escape Rope
  "▲": <scalinghealth:heartdust>,             # Heart Dust
});

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
ratUpgrade("rat_upgrade_basic_0", <rats:rat_upgrade_basic>,   <ore:gemDiamondRat>);
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
  "e": <ore:foodCake>,
  "H": <forestry:honey_pot>,            # Honey Pot
  "L": <rats:little_black_squash_balls> # Little Black Squash Balls
});


# [Rat_Upgrade__Aristoc-Rat] from [Rat_Upgrade__Basic][+4]
craft.remake(<rats:rat_upgrade_aristocrat>, ["pretty",
  "S T S",
  "M R M",
  "S § S"], {
  "R": <rats:rat_upgrade_basic>, # Rat Upgrade: Basic
  "S": <ore:coinGold>,
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
mods.rt.RandomThingsTweaker.addImbuingRecipe(
	<randomthings:ingredient:2>, 
	<rats:string_cheese>, 
	<rats:ratglove_petals>, 
	<minecraft:emerald>, 
	<rats:gem_of_ratlantis>
);

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
	[
    utils.tryCatch('littletiles:hammer', <redstonearsenal:tool.pickaxe_flux>).anyDamage(),
    <ore:tokenOrIdolFlag>,
    utils.tryCatch('littletiles:saw', <redstonearsenal:tool.hammer_flux>).anyDamage()
  ]
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

# [Raw Marbled Cheese]*9 from [Raw Marbled Cheese][+1]
craft.remake(<rats:marbled_cheese_raw> * 9, ["pretty",
  "M M M",
  "M R M",
  "M M M"], {
  "M": <ore:stoneMarble>, # Marble
  "R": <rats:marbled_cheese_raw>, # Raw Marbled Cheese
});

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
	[<rats:charged_creeper_chunk>, <rats:chunky_cheese_token>, <rats:charged_creeper_chunk>, <ore:dustDimensional>, 
	 <rats:charged_creeper_chunk>, <ore:dustDimensional>, <draconicevolution:draconium_block:1>, <rats:charged_creeper_chunk>]
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


# ################################################################################
# Rat diamond usages
scripts.process.melt(<rats:rat_diamond>, <liquid:diamond> * 165, "Except: Melter");
scripts.process.alloy([<ore:ingotGraphite> * 2, <rats:rat_diamond>], <nuclearcraft:alloy:2> * 2, "only: Kiln AlloySmelter");
scripts.wrap.appliedenergistics2.Inscriber.addRecipe(<appliedenergistics2:material:17>, <rats:rat_diamond>, true, <appliedenergistics2:material:14>);
scripts.wrap.thermalexpansion.Compactor.addGearRecipe(<thermalfoundation:material:26>, <rats:rat_diamond> * 4, 36000);
scripts.wrap.immersiveengineering.MetalPress.addRecipe(<thermalfoundation:material:26>, <rats:rat_diamond>, <immersiveengineering:mold:1>, 16000, 4);
recipes.addShapeless("gem_crystal_flux from rat", <redstonearsenal:material:160> * 2, [<rats:rat_diamond>, <rats:rat_diamond>, Bucket('redstone')]);
scripts.wrap.thermalexpansion.Transposer.addFillRecipe(<redstonearsenal:material:160>, <rats:rat_diamond>, <fluid:redstone> * 500, 2000);
# ################################################################################

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

# Black Death Mask Recycle
scripts.process.crush(<rats:black_death_mask>, <botania:petalblock:15>, "only: Grindstone SagMill eu2Crusher AACrusher IECrusher", 
	[<botania:petalblock>, <botania:petalblock:14>, <botania:petalblock:7>], [0.9, 0.8, 0.7]);

# Conflict
# [Assorted Vegetables] from [Potato][+2]
craft.reshapeless(<rats:assorted_vegetables>, "BPCBPCBPC", {
  "P": <ore:cropPotato>, # Potato
  "B": <ore:cropBeetroot>, # Beetroot
  "C": <ore:cropCarrot>, # Carrot
});

#--------------------------------------------------------------------------------------
# Garbage Pile recipe based on various item parameters
val ph = <betterquesting:placeholder>.withTag({display:{Name:game.localize("e2ee.garbage.any_different_item")}}).withLore([game.localize("e2ee.garbage.affect_output_amount")]);
recipes.addShapeless("Garbage_placeholder", <rats:garbage_pile> * 6, [<rats:contaminated_food>,ph,ph,ph,ph,ph,ph,ph,ph,]);

recipes.addHiddenShapeless("Garbage_function", <rats:garbage_pile>, [
  <rats:contaminated_food>.marked("m8"),
  <*>.marked("m0"),
  <*>.marked("m1"),
  <*>.marked("m2"),
  <*>.marked("m3"),
  <*>.marked("m4"),
  <*>.marked("m5"),
  <*>.marked("m6"),
  <*>.marked("m7")
], function(out, ins, cInfo) {

  # Check unique
  for i in 0 to 8 {
    val a = ins["m"~i];
    if(isNull(a)) return null;
    for j in (i+1) to 9 {
      val b = ins["m"~j];
      if(isNull(b)) return null;
      if (a has b) {
        return null; # Ingredient duplicate
      }
    }
  }

  # Calculate how much garbage
  var amount = 0.0d;
  for i in 0 to 9 {
    val a = ins["m"~i];
    if (<rats:contaminated_food> has a) continue;

    var v = 1.0d;

    v += max(0, sqrt(a.hardness + 1) - 1);
    v += !isNull(a.toolClasses)  && a.toolClasses.length  > 0 ? a.toolClasses.length  : 0;
    v += !isNull(a.enchantments) && a.enchantments.length > 0 ? pow(3, a.enchantments.length) : 0;
    v += max(0, sqrt(sqrt(a.burnTime / 10)) - 1);
    if(a.maxStackSize != 64)              v+=0.5d;
    if(!a.isStackable)                    v+=0.5d;
    if(a.hasTag)                          v+=0.5d;
    if(a.isDamageable)                    v+=0.5d;
    if(a.definition.owner != "minecraft") v+=0.5d;
    if(a.isItemBlock)                     v-=0.75d;

    amount += v;
  }

  return out * max(1, min(64, amount as int));
}, null);
#--------------------------------------------------------------------------------------
# [Mysterious Token Fragment]*2 from [Cheese][+1]
craft.remake(<rats:token_fragment> * 2, ["pretty",
  "T T T",
  "T C T",
  "T T T"], {
  "T": <rats:tiny_coin>, # Tiny Coin
  "C": <ore:foodCheese>, # Cheese
});

# [Mysterious Token Chunk] from [Block of Cheese][+1]
craft.remake(<rats:token_piece>, ["pretty",
  "M M M",
  "M ■ M",
  "M M M"], {
  "M": <rats:token_fragment>, # Mysterious Token Fragment
  "■": <ore:blockCheese>,     # Block of Cheese
});

# [Chunky Cheese Token] from [Cheese Wheel (Friesian)][+1]
craft.remake(<rats:chunky_cheese_token>, ["pretty",
  "∩ ∩ ∩",
  "∩ W ∩",
  "∩ ∩ ∩"], {
  "∩": <rats:token_piece>, # Mysterious Token Chunk
  "W": <ore:cheeseWheels>, # Cheese Wheel (Friesian)
});

#--------------------------------------------------------------------------------------
# Add additional gemcutter recipes as alternatives

val gemcutterList = [
  <quark:jasper>                 , <scalingfeast:exhaustingnugget> * 2, # [Exhausting Nugget] from [Jasper]
  
  <minecraft:redstone>           , <actuallyadditions:item_crystal>   , # [Restonia Crystal] from [Redstone]
  <minecraft:dye:4>              , <actuallyadditions:item_crystal:1> , # [Palis Crystal] from [Lapis Lazuli]
  <minecraft:diamond>            , <actuallyadditions:item_crystal:2> , # [Diamatine Crystal] from [Diamond]
  <minecraft:emerald>            , <actuallyadditions:item_crystal:4> , # [Emeradic Crystal] from [Emerald]
  <minecraft:iron_ingot>         , <actuallyadditions:item_crystal:5> , # [Enori Crystal] from [Iron Ingot]
  <actuallyadditions:item_misc:5>, <actuallyadditions:item_crystal:3> , # [Void Crystal] from [Black Quartz]
] as IItemStack[];

for i, input in gemcutterList {
  if (i%2!=0) continue;
  mods.rats.recipes.addGemcutterRatRecipe(input, gemcutterList[i+1]);
}

# Add Rat on Arrow
mods.rustic.Condenser.addRecipe(<rats:rat_arrow>,[
  <scalinghealth:heartdust>,
  <rats:rat_pelt>,
], null, <minecraft:arrow>, <fluid:water> * 50, 40);

#---------------------------------
# Rat Alts
#---------------------------------
# [Lunar Reactive Dust] from [Lapis Lazuli]
mods.rats.recipes.addChefRatRecipe(<minecraft:dye:4>, <extrautils2:ingredients:3>);

# [Liveroots] from [Roots]
mods.rats.recipes.addChefRatRecipe(<twilightforest:root>, <twilightforest:root:1>);
#---------------------------------
