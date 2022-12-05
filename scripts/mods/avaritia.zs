import crafttweaker.item.IItemStack as IItemStack;
#modloaded avaritia

# *======= Recipes =======*

# Neutronium Ingots with Neutron Fluid
	mods.nuclearcraft.infuser.addRecipe(<advancedrocketry:productingot:1>, <liquid:neutron> * 1000, <avaritia:resource:4>, 4500);
	mods.thermalexpansion.Transposer.addFillRecipe(<avaritia:resource:4>, <advancedrocketry:productingot:1>, <liquid:neutron> * 1000, 250000);

# Neutron block fix
	recipes.remove(<avaritia:resource:4>);
	recipes.addShaped("Neutron Ingots from Nuggets",
	<avaritia:resource:4>, 
	[[<avaritia:resource:3>, <avaritia:resource:3>, <avaritia:resource:3>],
	[<avaritia:resource:3>, <avaritia:resource:3>, <avaritia:resource:3>], 
	[<avaritia:resource:3>, <avaritia:resource:3>, <avaritia:resource:3>]]);
	recipes.addShapeless("Neutron Ingots from Block", <avaritia:resource:4> * 9, [<avaritia:block_resource>]);

	mods.avaritia.ExtremeCrafting.remove(<avaritia:ultimate_stew>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:cosmic_meatballs>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_helmet>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_chestplate>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_pants>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_boots>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_sword>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_bow>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_pickaxe>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_shovel>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_axe>);
	mods.avaritia.ExtremeCrafting.remove(<avaritia:infinity_hoe>);

# Infinity Ingot
	mods.avaritia.ExtremeCrafting.remove(<avaritia:resource:6>);
	mods.extendedcrafting.TableCrafting.addShaped(0, <avaritia:resource:6>, [
	[<ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>], 
	[<ore:ingotCosmicNeutronium>, <ore:ingotCrystalMatrix>, <avaritia:resource:5>, <avaritia:resource:5>, <extendedcrafting:singularity_ultimate>, <avaritia:resource:5>, <avaritia:resource:5>, <ore:ingotCrystalMatrix>, <ore:ingotCosmicNeutronium>], 
	[<ore:ingotCosmicNeutronium>, <avaritia:resource:5>, <ore:ingotCrystalMatrix>, <ore:ingotCrystalMatrix>, <avaritia:resource:5>, <ore:ingotCrystalMatrix>, <ore:ingotCrystalMatrix>, <avaritia:resource:5>, <ore:ingotCosmicNeutronium>], 
	[<ore:ingotCosmicNeutronium>, <ore:ingotCrystalMatrix>, <avaritia:resource:5>, <avaritia:resource:5>, <extendedcrafting:singularity_ultimate>, <avaritia:resource:5>, <avaritia:resource:5>, <ore:ingotCrystalMatrix>, <ore:ingotCosmicNeutronium>], 
	[<ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>], 
	[null, null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null, null], 
	[null, null, null, null, null, null, null, null, null]
	]);

# [Neutron Collector] from [Glitch Infused Ingot][+4]
mods.avaritia.ExtremeCrafting.remove(<avaritia:neutron_collector>);
craft.make(<avaritia:neutron_collector>, ["pretty",
  "⌃ U U U ⌃",
  "U C T C U",
  "U T ▬ T U",
  "U C T C U",
  "⌃ U U U ⌃"], {
  "C": <advgenerators:controller>,        # Control Circuit
  "⌃": <extrautils2:decorativesolid:6>,   # Blue Quartz
  "T": <draconicevolution:chaos_shard:3>, # Tiny Chaos Fragment
  "U": <ore:circuitUltimate>,             # Ultimate Control Circuit
  "▬": <ore:ingotGlitch>,                 # Glitch Infused Ingot
});

# Neutronium Compressor isn't used
	mods.avaritia.ExtremeCrafting.remove(<avaritia:neutronium_compressor>);

# Infinity Catalyst
	mods.avaritia.ExtremeCrafting.remove(<avaritia:resource:5>);
	mods.extendedcrafting.TableCrafting.addShapeless(0, <avaritia:resource:5>, 
	[<avaritia:ultimate_stew>, <avaritia:endest_pearl>, <bigreactors:mineralbenitoite>, 
	<ore:tokenOrIdolFlag>, 	<bigreactors:mineralanglesite>, <darkutils:shulker_pearl>, <avaritia:cosmic_meatballs>, 
	<quark:soul_bead>, 	<ore:slimecrystalPink>, <ore:plateElite>, <bloodmagic:demon_crystal>, 
	<ore:dragonEgg>, 	<scalinghealth:heartcontainer>, 
	<rustic:fluid_bottle>.withTag({Fluid: {FluidName: "wine", Amount: 1000, Tag: {Quality: 1 as float}}}),
	<ore:blockWither>, <ore:blockAethium>, 	<ore:blockCosmicNeutronium>, <extendedcrafting:storage:7>, 
	<ore:blockEvilMetal>, <ore:blockCoalCoke>, 	<ore:compressed3xDustBedrock>, <tconstruct:firewood:1>, 
	<ore:blockLudicrite>, <ore:blockAmethyst>, 	<randomthings:spectreilluminator>, 
	<twilightforest:block_storage:4>, <ore:blockSupremium>, <ore:blockDilithium>, 	
	<ore:blockCrystalMatrix>, <ore:blockEnderium>, <deepmoblearning:infused_ingot_block>, 	
	<contenttweaker:terrestrial_artifact_block>, <extrautils2:decorativesolid:6>, <appliedenergistics2:fluix_block>,
	<draconicevolution:draconium_block:1>, <ore:blockMyrmexResin>, 
	<advancedrocketry:hotturf>, <forestry:bee_combs_0>, <ore:blockBoundMetal>,
	<ore:blockAstralStarmetal>, <ore:blockOsgloglas>, <ore:blockMirion>]);
	
# [Endest Pearl] from [Pristine Enderman Matter][+5]
mods.avaritia.ExtremeCrafting.remove(<avaritia:endest_pearl>);
craft.make(<avaritia:endest_pearl>, ["pretty",
  "    - D -    ",
  "  - ▬ ▬ ▬ -  ",
  "- ▬ E ⌂ E ▬ -",
  "D ▬ ⌂ P ⌂ ▬ D",
  "- ▬ E ⌂ E ▬ -",
  "  - ▬ ▬ ▬ -  ",
  "    - D -    "], {
  "P": <deepmoblearning:pristine_matter_enderman>, # Pristine Enderman Matter
  "⌂": <actuallyadditions:block_misc:8>,           # Ender Casing
  "D": <minecraft:dragon_breath>,                  # Dragon's Breath
  "E": <cyclicmagic:exp_pylon>,                    # Experience Pylon
  "▬": <ore:ingotEndorium>,                        # Endorium Ingot
  "-": <ore:ingotEndSteel>,                        # End Steel Ingot
});
	
# Skullfire Sword
 	mods.avaritia.ExtremeCrafting.remove(<avaritia:skullfire_sword>);
	mods.extendedcrafting.TableCrafting.addShaped(0, <avaritia:skullfire_sword>, [
	[null, <minecraft:enchanted_book>, null, null, <bloodmagic:lava_crystal>], 
	[null, null, null, <randomthings:obsidianskull>, null], 
	[null, <tconstruct:wide_guard>.withTag({Material: "dragonbone"}), <tconstruct:cleaver:*>, null, null], 
	[null, <tconstruct:tough_tool_rod>.withTag({Material: "dragonbone"}), <tconstruct:wide_guard>.withTag({Material: "dragonbone"}), null, <minecraft:enchanted_book>], 
	[<ore:netherStar>, null, null, null, null]
]);

# [Ultimate Stew]*9 from [Cosmic Meatballs][+6]
craft.make(<avaritia:ultimate_stew> * 9, ["pretty",
  "  ■       ■  ",
  "■ F B C B F ■",
  "■ G G G G G ■",
  "■ G G G G G ■",
  "■ ( ( ( ( ( ■",
  "  ■ ■ ■ ■ ■  ",
  "  ▲ ▲ ▲ ▲ ▲  "], {
  "■": <ore:blockDilithium>,        # Block of Dilithium
  "▲": <ore:dustMana>,              # Mana Dust
  "B": <rustic:fluid_bottle>.withTag({Fluid: {FluidName: "wine", Amount: 1000, Tag: {Quality: 1.0 as float}}}), # Bottle of Wine
  "C": <avaritia:cosmic_meatballs>, # Cosmic Meatballs
  "F": <nuclearcraft:foursmore>,    # FourS'more QuadS'mingot
  "G": <ore:foodNutrients5>,        # Golden Apple
  "(": <ic2:filled_tin_can>,        # (Filled) Tin Can
});

# [Cosmic Meatballs]
mods.extendedcrafting.TableCrafting.addShapeless(
	<avaritia:cosmic_meatballs> * 9, [
/*Inject_js(
  getCSV('config/tellme/items-csv.csv')
  .filter(o=>o['Ore Dict keys'].split(',').includes('listAllmeatraw'))
  .map(o=>itemize(o['Registry name'], o['Meta/dmg']))
	.sort(naturalSort)
  .map(o=>`    ${isJEIBlacklisted(o)?'#':''}<${o}>,`)
)*/
    <animania:raw_chevon>,
    <animania:raw_frog_legs>,
    <animania:raw_horse>,
    <animania:raw_peacock>,
    <animania:raw_prime_beef>,
    <animania:raw_prime_chevon>,
    <animania:raw_prime_chicken>,
    <animania:raw_prime_mutton>,
    <animania:raw_prime_peacock>,
    <animania:raw_prime_pork>,
    <animania:raw_prime_rabbit>,
    <animania:raw_prime_steak>,
    <betteranimalsplus:pheasantraw>,
    <betteranimalsplus:turkey_leg_raw>,
    <betteranimalsplus:turkey_raw>,
    <betteranimalsplus:venisonraw>,
    <harvestcraft:duckrawitem>,
    <harvestcraft:groundbeefitem>,
    <harvestcraft:groundchickenitem>,
    <harvestcraft:groundduckitem>,
    <harvestcraft:groundfishitem>,
    <harvestcraft:groundmuttonitem>,
    <harvestcraft:groundporkitem>,
    <harvestcraft:groundrabbititem>,
    <harvestcraft:groundturkeyitem>,
    <harvestcraft:groundvenisonitem>,
    <harvestcraft:grubitem>,
    <harvestcraft:rawtofabbititem>,
    <harvestcraft:rawtofaconitem>,
    <harvestcraft:rawtofeakitem>,
    <harvestcraft:rawtofenisonitem>,
    <harvestcraft:rawtofickenitem>,
    <harvestcraft:rawtofuduckitem>,
    <harvestcraft:rawtofurkeyitem>,
    <harvestcraft:rawtofuttonitem>,
    <harvestcraft:turkeyrawitem>,
    <harvestcraft:venisonrawitem>,
    <minecraft:beef>,
    <minecraft:chicken>,
    <minecraft:mutton>,
    <minecraft:porkchop>,
    <minecraft:rabbit>,
    <rats:raw_rat>,
    <tconevo:edible>,
/**/
]);
		
# Neutronium Ingot
	var ni = <ore:ingotCosmicNeutronium>;
# Infinity Catalyst
	var ic = <avaritia:resource:5>;
# Infinity Ingot
	var ii = <ore:ingotInfinity>;
# Crystal Matrix
	var cm = <ore:blockCrystalMatrix>;
	
# Infinity Armor
	mods.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_helmet>, 
	[
	[null, null, ni, ni, ni, ni, ni, null, null],
	[null, ni, ii, ii, ii, ii, ii, ni, null],
	[null, ni, null, ic, ii, ic, null, ni, null],
	[null, ni, ii, ii, <draconicevolution:draconic_helm>.anyDamage(), ii, ii, ni, null],
	[null, ni, ii, ii, ii, ii, ii, ni, null],
	[null, ni, ii, null, ii, null, ii, ni, null],
	[null, null, null, null, null, null, null, null, null],
	[null, null, null, null, null, null, null, null, null],
	[null, null, null, null, null, null, null, null, null]
	]);

	mods.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_chestplate>, 
	[
	[null, ni, ni, null, null, null, ni, ni, null],
	[ni, ni, ni, null, null, null, ni, ni, ni],
	[ni, ni, ni, null, null, null, ni, ni, ni],
	[null, ni, ii, ii, ii, ii, ii, ni, null],
	[null, ni, ii, ii, ii, ii, ii, ni, null],
	[null, ni, ii, ii, <draconicevolution:draconic_chest>.anyDamage(), ii, ii, ni, null],
	[null, ni, ii, ii, ii, ii, ii, ni, null],
	[null, ni, ii, ii, ii, ii, ii, ni, null],
	[null, null, ni, ni, ni, ni, ni, null, null]
	]);

	mods.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_pants>, 
	[
	[ni, ni, ni, ni, ni, ni, ni, ni, ni],
	[ni, ii, ii, ii, <draconicevolution:draconic_legs>.anyDamage(), ii, ii, ii, ni],
	[ni, ii, ni, ni, ni, ni, ni, ii, ni],
	[ni, ii, ni, null, null, null, ni, ii, ni],
	[ni, ic, ni, null, null, null, ni, ic, ni],
	[ni, ii, ni, null, null, null, ni, ii, ni],
	[ni, ii, ni, null, null, null, ni, ii, ni],
	[ni, ii, ni, null, null, null, ni, ii, ni],
	[ni, ni, ni, null, null, null, ni, ni, ni]
	]);

	mods.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_boots>, 
	[
	[null, ni, ni, ni, null, ni, ni, ni, null],
	[null, ni, ii, ni, null, ni, ii, ni, null],
	[null, ni, ii, ni, null, ni, ii, ni, null],
	[ni, ni, ii, ni, null, ni, ii, ni, ni],
	[ni, ii, ii, ni, null, ni, ii, ii, ni],
	[ni, ni, ni, ni, <draconicevolution:draconic_boots>.anyDamage(), ni, ni, ni, ni],
	[null, null, null, null, null, null, null, null, null],
	[null, null, null, null, null, null, null, null, null],
	[null, null, null, null, null, null, null, null, null]
	]);

# Infinity Sword
	mods.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_sword>, 
	[
	[null, null, null, null, null, null, null, ii, ii],
	[null, null, null, null, null, null, ii, ii, ii],
	[null, null, null, null, null, ii, ii, ii, null],
	[null, null, null, null, ii, ii, ii, null, null],
	[null, cm, null, ii, ii, ii, null, null, null],
	[null, null, cm, <draconicevolution:draconic_staff_of_power>.anyDamage(), ii, null, null, null, null],
	[null, null, ni, cm, null, null, null, null, null],
	[null, ni, null, null, cm, null, null, null, null],
	[ic, null, null, null, null, null, null, null, null]
	]);
	
# Infinity Bow
	mods.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_bow>, 
	[
	[null, null, null, ii, ii, null, null, null, null],
	[null, null, ii, null, <ore:blockRockwool>, null, null, null, null],
	[null, ii, null, null, <ore:blockRockwool>, null, null, null, null],
	[ii, null, null, null, <ore:blockRockwool>, null, null, null, null],
	[<draconicevolution:draconic_bow>.anyDamage(), null, null, null, <ore:blockRockwool>, null, null, null, null],
	[ii, null, null, null, <ore:blockRockwool>, null, null, null, null],
	[null, ii, null, null, <ore:blockRockwool>, null, null, null, null],
	[null, null, ii, null, <ore:blockRockwool>, null, null, null, null],
	[null, null, null, ii, ii, null, null, null, null]
	]);
	
# Infinity Pickaxe
	mods.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_pickaxe>.withTag({ench: [{lvl: 10 as short, id: 35 as short}]}), 
	[
	[null, ii, ii, ii, ii, ii, ii, ii, null],
	[ii, ii, ii, ii, cm, ii, ii, ii, ii],
	[ii, ii, null, null, <draconicevolution:draconic_pick>.anyDamage(), null, null, ii, ii],
	[null, null, null, null, ni, null, null, null, null],
	[null, null, null, null, ni, null, null, null, null],
	[null, null, null, null, ni, null, null, null, null],
	[null, null, null, null, ni, null, null, null, null],
	[null, null, null, null, ni, null, null, null, null],
	[null, null, null, null, ni, null, null, null, null]
	]);
	
# Infinity Shovel
	mods.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_shovel>, 
	[
	[null, null, null, null, null, null, ii, ii, ii],
	[null, null, null, null, null, ii, ii, <ore:blockInfinity>, ii],
	[null, null, null, null, null, null, <draconicevolution:draconic_shovel>.anyDamage(), ii, ii],
	[null, null, null, null, null, ni, null, ii, null],
	[null, null, null, null, ni, null, null, null, null],
	[null, null, null, ni, null, null, null, null, null],
	[null, null, ni, null, null, null, null, null, null],
	[null, ni, null, null, null, null, null, null, null],
	[ni, null, null, null, null, null, null, null, null]
	]);
	
# Infinity Axe
	mods.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_axe>, 
	[
	[null, null, null, ii, null, null, null, null, null],
	[null, null, ii, ii, ii, ii, ii, null, null],
	[null, null, null, ii, ii, <draconicevolution:draconic_axe>.anyDamage(), ii, null, null],
	[null, null, null, null, null, ii, ni, null, null],
	[null, null, null, null, null, null, ni, null, null],
	[null, null, null, null, null, null, ni, null, null],
	[null, null, null, null, null, null, ni, null, null],
	[null, null, null, null, null, null, ni, null, null],
	[null, null, null, null, null, null, ni, null, null]
	]);
	
# Infinity Hoe
	mods.extendedcrafting.TableCrafting.addShaped(0, 
	<avaritia:infinity_hoe>, 
	[
	[null, null, null, null, null, ni, null, null, null],
	[null, ii, ii, ii, ii, ii, ii, null, null],
	[ii, ii, ii, ii, ii, <draconicevolution:draconic_hoe>.anyDamage(), ii, null, null],
	[ii, null, null, null, null, ii, ii, null, null],
	[null, null, null, null, null, ni, null, null, null],
	[null, null, null, null, null, ni, null, null, null],
	[null, null, null, null, null, ni, null, null, null],
	[null, null, null, null, null, ni, null, null, null],
	[null, null, null, null, null, ni, null, null, null]
	]);
	
	recipes.remove(<avaritia:extreme_crafting_table>);
	mods.extendedcrafting.CombinationCrafting.addRecipe(<avaritia:extreme_crafting_table>, 
	100000000, 1000000, <vaultopic:vice>, 
	[<avaritia:resource:1>, <avaritia:resource:1>, <extendedcrafting:material:12>, 
	<extendedcrafting:material:12>, <avaritia:resource:1>, <avaritia:resource:1>]);



# Using Dragon forge to harder recipes
function addDragonForgeRecipe(input1 as IItemStack, input2 as IItemStack, output as IItemStack) {
	mods.iceandfire.recipes.addFireDragonForgeRecipe(input1, input2, output);
	mods.iceandfire.recipes.addIceDragonForgeRecipe(input1, input2, output);
}

recipes.removeByRecipeName("avaritia:items/resource/crystal_matrix_ingot");
addDragonForgeRecipe(<minecraft:nether_star>, <avaritia:resource>, <avaritia:resource:1>);

# Lattice
var CD = <mekanism:compresseddiamond>;
recipes.remove(<avaritia:resource>);
mods.extendedcrafting.CombinationCrafting.addRecipe(<avaritia:resource>, 200000000, 2000000, CD, [CD, CD]);
# Somehow infuser craft item/tick after first item
# mods.thermalexpansion.Infuser.addRecipe(<avaritia:resource>, CD, 50000000);

# [Fuel_Compressor] from [Crushing_Block][+3]
craft.remake(<avaritiafurnace:fuelcompressor>, ["pretty",
  "# ▲ #",
  "▬ □ ▬",
  "# ▲ #"], {
  "□": <mechanics:crushing_block>,    # Crushing Block
  "▲": <ore:compressed3xDustBedrock>, # Double Compressed Infinity Dust Block
  "#": <forestry:logs.2:1>,           # Ebony Log
  "▬": <ore:ingotBlackIron>           # Black Iron Ingot
});

# Oredicting recipe
# [Compressed Crafting Table] from [Crafting Table]
recipes.removeByRecipeName("avaritia:blocks/crafting/compressed_crafting_table");
craft.shapeless(<avaritia:compressed_crafting_table>, "wwwwwwwww", {
  "w": <ore:workbench>, # Crafting Table
});
