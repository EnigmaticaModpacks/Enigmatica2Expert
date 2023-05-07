import crafttweaker.item.IItemStack;
#modloaded avaritia

# *======= Recipes =======*

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
	[<avaritia:ultimate_stew>, <avaritia:endest_pearl>, <ore:gemBenitoite>, 
	<ore:tokenOrIdolFlag>, 	<ore:gemAnglesite>, <darkutils:shulker_pearl>, <avaritia:cosmic_meatballs>, 
	<quark:soul_bead>, 	<ore:slimecrystalPink>, <ore:plateElite>, <bloodmagic:demon_crystal>, 
	<ore:dragonEgg>, 	<scalinghealth:heartcontainer>, 
	<rustic:fluid_bottle>.withTag({Fluid: {FluidName: "wine", Amount: 1000, Tag: {Quality: 1 as float}}}),
	<ore:blockWither>, <ore:blockAethium>, 	<ore:blockCosmicNeutronium>, <extendedcrafting:storage:7>, 
	<ore:blockEvilMetal>, <ore:blockCoalCoke>, 	<ore:compressed3xDustBedrock>, <tconstruct:firewood:1>, 
	<ore:blockVividAlloy>, <ore:blockAmethyst>, 	<randomthings:spectreilluminator>, 
	<twilightforest:block_storage:4>, <ore:blockSupremium>, <ore:blockDilithium>, 	
	<ore:blockCrystalMatrix>, <ore:blockEnderium>, <deepmoblearning:infused_ingot_block>, 	
	<contenttweaker:terrestrial_artifact_block>, <extrautils2:decorativesolid:6>, <appliedenergistics2:fluix_block>,
	<draconicevolution:draconium_block:1>, <ore:blockMyrmexResin>, 
	<advancedrocketry:hotturf>, <forestry:bee_combs_0>, <ore:blockBoundMetal>,
	<ore:blockAstralStarmetal>, <ore:blockOsgloglas>, <ore:blockMirion>, <ore:blockTrinitite>]);
	
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
  "E": <darkutils:monolith>,
  "▬": <ore:ingotEndorium>,                        # Endorium Ingot
  "-": <ore:ingotEndSteel>,                        # End Steel Ingot
});
	
# [Skullfire Sword] from [Obsidian Skull][+6]
mods.avaritia.ExtremeCrafting.remove(<avaritia:skullfire_sword>);
craft.make(<avaritia:skullfire_sword>, ["pretty",
  "        *",
  "      R  ",
  "D ■ O    ",
  "  ▄ ■    ",
  "S   D    "], {
  "*": <bloodmagic:lava_crystal>,      # Lava Crystal
  "R": <rats:ratlantean_flame>,        # Ratlantean Spirit Flame
  "D": <ore:boneDragon>,               # Dragon Bone
  "■": <ore:blockBone>,                # Bone Block
  "O": <randomthings:obsidianskull>,   # Obsidian Skull
  "▄": <iceandfire:dragon_bone_block>, # Block of Dragon Bones
  "S": <cyclicmagic:soulstone>,        # Soulstone
});

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
    <twilightforest:raw_meef>,
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

# Oredicting recipe
# [Compressed Crafting Table] from [Crafting Table]
recipes.removeByRecipeName("avaritia:blocks/crafting/compressed_crafting_table");
craft.shapeless(<avaritia:compressed_crafting_table>, "wwwwwwwww", {
  "w": <ore:workbench>, # Crafting Table
});

// -------------------------------------------------------------------
# Burn singularity
// -------------------------------------------------------------------

# [Empty Singularity] from [Block of Black Iron][+2]
craft.remake(<avaritia:singularity>, ["pretty",
  "    ▬ ▬  ",
  "▬ ▲ ▲ ▲  ",
  "▬ ▲ ■ ▲ ▬",
  "  ▲ ▲ ▲ ▬",
  "  ▬ ▬    "], {
  "▬": <ore:ingotHeavy>,              # Heavy Ingot
  "▲": <ore:compressed1xDustBedrock>, # Infinity Dust Block
  "■": <ore:blockBlackIron>,          # Block of Black Iron
});

val A = <*>.only(function(item) { return item.burnTime > 0; });
val E = <avaritia:singularity>; // Empty Singularity
val F = <avaritia:singularity:9>; // Filling Singularity
val R = <avaritia:singularity:12>; // Result Singularity

F.addAdvancedTooltip(function(item) {
	val charge = isNull(item.tag.charge) ? 0.0 : item.tag.charge.asDouble();
  return "§fCharge: §6" ~ charge as int ~ '§r';
});

val needCharge = pow(10.0, 9.0);
val maxBonus = 10.0;
val factor = pow(1.0 / maxBonus, 1.0 / 28.0) + 0.0000000000000001; // about 0.92

furnace.setFuel(R, needCharge);
scripts.lib.tooltip.desc.jei(F, "singularity.heat", maxBonus * 100.0 as int, needCharge as int);
scripts.lib.tooltip.desc.jei(R, "singularity.burn", maxBonus * 100.0 as int, needCharge as int);

// Fake recipe
val a = <contenttweaker:any_burnable>;
recipes.addShaped("any burnable", R, [[(E|F),a,a],[a,a,a],[a,a,a]]);

// Actual recipe
recipes.addHiddenShaped('Burn Singularity', R, [
	[(E | F).marked('g0'),A.marked('g1'),A.marked('g2')],
	[A.marked('g3'),A.marked('g4'),A.marked('g5')],
	[A.marked('g6'),A.marked('g7'),A.marked('g8')],
],
function(out, ins, cInfo) {
	var burnTotal = 0.0d;
	for i in 1 to 9 {
		burnTotal += ins["g"~i].burnTime;
	}

	// Calculate bonus.
	var bonus = 1.0d;
	for i in 1 to 8 {
		for j in (i+1) to 9 {
			val a = ins["g"~i];
			val b = ins["g"~j];
			if (a.burnTime == b.burnTime) {
				bonus *= factor;
			}
		}
	}

	// Calculate result
	val charge = D(ins.g0.tag).getDouble('charge', 0.0d) + burnTotal * bonus * maxBonus;

	return charge >= needCharge ? R
		: charge > 0
		? F
			.withLore(["§fLatest efficiency: §b" ~ ((bonus * maxBonus * 100.0) as int) ~ "%"])
			.updateTag({charge: charge})
		: E;
}, null);
// -------------------------------------------------------------------
