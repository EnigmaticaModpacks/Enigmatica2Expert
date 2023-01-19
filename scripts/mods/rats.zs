import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.jaopca.JAOPCA;
import mods.jaopca.OreEntry;

#modloaded rats

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
  "A": <cyclicmagic:apple_emerald>,
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
  "S": <ore:ingotAlubrass>,
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
mods.mekanism.enrichment.addRecipe(<rats:raw_plastic>*16, <mekanism:polyethene>);

# Rat tube from HDPE
recipes.remove(<rats:rat_tube_white>);
mods.immersiveengineering.MetalPress.addRecipe(<mekanism:polyethene:1>, <mekanism:polyethene>*2, <immersiveengineering:mold:2>, 4000, 1);
furnace.addRecipe(<rats:rat_tube_white>, <mekanism:polyethene:1>);


# Alternative rat diamond uses
val compressed_D = <mekanism:compresseddiamond>;
mods.mekanism.enrichment.addRecipe(<rats:rat_diamond>, compressed_D);

# Magic bean
mods.rats.recipes.addChefRatRecipe(<randomthings:beans:1>, <randomthings:beans:2>);

# addArcheologistRatRecipe(IItemStack iinput, IItemStack ioutput)
mods.rats.recipes.addArcheologistRatRecipe(<minecraft:skull:3>, <iceandfire:gorgon_head>);
mods.rats.recipes.addArcheologistRatRecipe(<minecraft:ghast_tear>, <iceandfire:siren_tear>);
mods.rats.recipes.addArcheologistRatRecipe(<iceandfire:dragonbone>, <iceandfire:troll_tusk>);
mods.rats.recipes.addArcheologistRatRecipe(<twilightforest:raven_feather>, <iceandfire:stymphalian_bird_feather>);
mods.rats.recipes.addArcheologistRatRecipe(<rats:rat_pelt>, <iceandfire:troll_leather_forest>);
mods.rats.recipes.addArcheologistRatRecipe(<harvestcraft:hardenedleatheritem>, <iceandfire:troll_leather_frost>);
mods.rats.recipes.addArcheologistRatRecipe(<redstonerepository:tool.sword_gelid>, <endreborn:sword_shard>);
mods.rats.recipes.addArcheologistRatRecipe(<mysticalagradditions:stuff:1>, <iceandfire:dread_shard> * 3);

##################

# Casting sawblade
mods.tconstruct.Casting.addTableRecipe(<rats:ancient_sawblade>, <ic2:block_cutting_blade:2>, <fluid:knightmetal>, (144*12), true, (30*20));

# Ratlanean spirit flame
recipes.addShaped("Ratlanean Flame", <rats:ratlantean_flame>, [
	[null, <randomthings:ingredient:2>, null],
	[<randomthings:ingredient:2>, <rats:raw_rat>, <randomthings:ingredient:2>],
	[null, <forestry:crafting_material:1>, null]
]);
recipes.addShaped("Ratlanean Flame 2", <rats:ratlantean_flame>, [
	[null, <randomthings:ingredient:2>, null],
	[<randomthings:ingredient:2>, <rats:raw_rat>, <randomthings:ingredient:2>],
	[null, <ore:ingotEndorium>, null]
]);

# Peaceful alt
mods.thermalexpansion.Infuser.addRecipe(<rats:charged_creeper_chunk>, <harvestcraft:creeperwingsitem>, 100000);

# Psionic rat brain
mods.thaumcraft.Infusion.registerRecipe("psionic_rat_brain", "INFUSION", <rats:psionic_rat_brain>, 40, 
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
scripts.process.melt(<rats:rat_diamond>, <liquid:diamond> * 165, "Except: Melter Crucible");
scripts.process.alloy([<ore:ingotGraphite> * 2, <rats:rat_diamond>], <nuclearcraft:alloy:2> * 2, "only: Kiln AlloySmelter");
mods.appliedenergistics2.Inscriber.addRecipe(<appliedenergistics2:material:17>, <rats:rat_diamond>, true, <appliedenergistics2:material:14>);
mods.thermalexpansion.Compactor.addGearRecipe(<thermalfoundation:material:26>, <rats:rat_diamond> * 4, 36000);
mods.immersiveengineering.MetalPress.addRecipe(<thermalfoundation:material:26>, <rats:rat_diamond>, <immersiveengineering:mold:1>, 16000, 4);
recipes.addShapeless("gem_crystal_flux from rat", <redstonearsenal:material:160> * 2, [<rats:rat_diamond>, <rats:rat_diamond>, Bucket('redstone')]);
mods.thermalexpansion.Transposer.addFillRecipe(<redstonearsenal:material:160>, <rats:rat_diamond>, <fluid:redstone> * 500, 2000);
mods.nuclearcraft.infuser.addRecipe(<ore:gemDiamondRat>, <fluid:redstone> * 500, <redstonearsenal:material:160>);
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
  <minecraft:redstone_block>      , <actuallyadditions:block_crystal_cluster_redstone> * 9,
  <minecraft:lapis_block>         , <actuallyadditions:block_crystal_cluster_lapis> * 9,
  <minecraft:diamond_block>       , <actuallyadditions:block_crystal_cluster_diamond> * 9,
  <minecraft:emerald_block>       , <actuallyadditions:block_crystal_cluster_emerald> * 9,
  <minecraft:iron_block>          , <actuallyadditions:block_crystal_cluster_iron> * 9,
  <actuallyadditions:block_misc:2>, <actuallyadditions:block_crystal_cluster_coal> * 9,
] as IItemStack[];

for i, input in gemcutterList {
  if (i%2!=0) continue;
  if (isNull(input) || isNull(gemcutterList[i+1])) continue;
  mods.rats.recipes.addGemcutterRatRecipe(input, gemcutterList[i+1]);
}

# Add Rat on Arrow
mods.rustic.Condenser.addRecipe(<rats:rat_arrow>,[
  <ore:foodCheese>,
  <ore:leather>,
], null, <minecraft:arrow>, <fluid:water> * 500, 40);

#---------------------------------
# Rat Alts
#---------------------------------
# [Lunar Reactive Dust] from [Lapis Lazuli]
mods.rats.recipes.addChefRatRecipe(<minecraft:dye:4>, <extrautils2:ingredients:3>);

# [Liveroots] from [Roots]
mods.rats.recipes.addChefRatRecipe(<twilightforest:root>, <twilightforest:root:1>);
#---------------------------------

# Additional usage
# [Crystallized Canola Seed] from [Canola Seeds][+1]
craft.shapeless(<actuallyadditions:item_misc:23>, "PPPPCPPPP", {
  "P": <ore:ratPoop>,    # Rat "Nugget"
  "C": <ore:seedCanola>, # Canola Seeds
});

# Make alt recipe for tokens
scripts.category.tooltip_utils.desc.both(<rats:token_piece>, "kill.slime.by.marbled_cheese_golem");
scripts.do.entity_kill_entity.add("minecraft:slime", "rats:marbled_cheese_golem", <rats:token_piece>);

# Bonus loot
scripts.do.entity_kill_entity.add("minecraft:slime", "rats:rat", <thermalfoundation:fertilizer> * 4);

# [Rat Lantern] from [Raw Rat][+2]
craft.remake(<rats:rat_lantern> * 8, [
  "‚",
  "A",
  "C"], {
  "‚": <ore:nuggetGold>, # Gold Nugget
  "A": <ore:foodRatraw>, # Raw Rat
  "C": <forestry:carton>,# Carton
});

# Skyblock alt
# [Plague Essence] from [Antler][+2]
craft.make(<rats:plague_essence>, ["pretty",
  "B C B",
  "C A C",
  "B C B"], {
  "B": <ore:paperBlack>,                         # Black Paper
  "C": <contenttweaker:compressed_garbage_pile>, # Compressed Garbage Pile
  "A": utils.tryCatch("betteranimalsplus:antler", <minecraft:rabbit_hide>), # Antler
});

# Peaceful alt
# [Rat Toga] from [Marbled Cheese][+1]
craft.make(<rats:rat_toga>, ["pretty",
  "S   S",
  "S M S",
  "S S S"], {
  "S": <thaumictinkerer:spellbinding_cloth>.noReturn(), # Spellbinding Cloth
  "M": <rats:marbled_cheese>, # Marbled Cheese
});


# Make string cheese with wire press
mods.immersiveengineering.MetalPress.addRecipe(<rats:string_cheese>, <ore:foodCheese>, <immersiveengineering:mold:4>, 100, 1);

<entity:rats:pirat_boat>.addPlayerOnlyDrop(<actuallyadditions:block_misc:4>, 1, 3);
<entity:rats:plague_cloud>.addDrop(<quark:soul_bead>, 1, 3);
