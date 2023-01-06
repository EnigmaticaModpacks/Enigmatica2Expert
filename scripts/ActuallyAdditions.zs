import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
import mods.actuallyadditions.BallOfFur.addReturn as addBallReturn;

#modloaded actuallyadditions
	
# Black Quartz Block recipe remakes
	# Black Quartz Pillar
	recipes.remove(<actuallyadditions:block_misc>);
	recipes.addShaped("Black Quartz Pillar remake", <actuallyadditions:block_misc> * 2, 
	[[<ore:blockBlackQuartz>],[<ore:blockBlackQuartz>]]);

	# Chiseled Black Quartz Block
	recipes.remove(<actuallyadditions:block_misc:1>);
	recipes.addShaped("Chiseled Black Quartz Block remake", <actuallyadditions:block_misc:1> * 4, 
	[[<ore:blockBlackQuartz>, <ore:blockBlackQuartz>],
	[<ore:blockBlackQuartz>, <ore:blockBlackQuartz>]]);

# Oil Generator Removal
	rh(<actuallyadditions:block_oil_generator>);

#Black Quartz Block to Black Quartz
	recipes.addShapeless("Black Quartz Block to Black Quartz", 
	<actuallyadditions:item_misc:5> * 4, [<ore:blockBlackQuartz>]);
		
# Drill Speed Augment I oredict compat
	recipes.remove(<actuallyadditions:item_drill_upgrade_speed>);
	recipes.addShaped("Drill Speed Augment I", 
	<actuallyadditions:item_drill_upgrade_speed>, 
	[[<actuallyadditions:item_crystal:5>, <ore:listAllsugar>, <actuallyadditions:item_crystal:5>],
	[<ore:listAllsugar>, <actuallyadditions:block_crystal>, <ore:listAllsugar>], 
	[<actuallyadditions:item_crystal:5>, <ore:listAllsugar>, <actuallyadditions:item_crystal:5>]]);

# Drill Speed Augment II oredict compat
	recipes.remove(<actuallyadditions:item_drill_upgrade_speed_ii>);
	recipes.addShapedMirrored("Drill Speed Augment II", 
	<actuallyadditions:item_drill_upgrade_speed_ii>, 
	[[<actuallyadditions:item_crystal:5>, <ore:listAllsugar>, <actuallyadditions:item_crystal:5>],
	[<ore:listAllsugar>, <ore:foodCake>, <ore:listAllsugar>], 
	[<actuallyadditions:item_crystal:5>, <ore:listAllsugar>, <actuallyadditions:item_crystal:5>]]);

# Drill Speed Augment III oredict compat
	recipes.remove(<actuallyadditions:item_drill_upgrade_speed_iii>);
	recipes.addShapedMirrored("Drill Speed Augment III",
	<actuallyadditions:item_drill_upgrade_speed_iii>, 
	[[<actuallyadditions:item_crystal_empowered:5>, <ore:foodCake>, <actuallyadditions:item_crystal_empowered:5>],
	[<ore:foodCake>, <actuallyadditions:item_crystal_empowered:2>, <ore:foodCake>], 
	[<actuallyadditions:item_crystal_empowered:5>, <ore:foodCake>, <actuallyadditions:item_crystal_empowered:5>]]);

# Lens of the Miner
	recipes.remove(<actuallyadditions:item_mining_lens>);
	recipes.addShapedMirrored("Lens of the Miner", 
	<actuallyadditions:item_mining_lens>, 
	[[<ore:oreRedstone>, <ore:oreEmerald>, <ore:oreLapis>],
	[<ore:blockBlackQuartz>, <botania:lens:21>, <ore:blockBlackQuartz>], 
	[<ore:blockBlackQuartz>, <actuallyadditions:item_color_lens>, <ore:blockBlackQuartz>]]);

# Experience Solidifier
	recipes.remove(<actuallyadditions:block_xp_solidifier>);
	
	recipes.addShapedMirrored("XP Bucket Cyclic", 
	<actuallyadditions:block_xp_solidifier>, 
	[[null, <forge:bucketfilled>.withTag({FluidName: "xpjuice", Amount: 1000}), null],
	[<actuallyadditions:block_crystal_empowered:2>, <actuallyadditions:item_misc:8>, <actuallyadditions:block_crystal_empowered:2>], 
	[null, <forge:bucketfilled>.withTag({FluidName: "xpjuice", Amount: 1000}), null]]);
	
	recipes.addShapedMirrored("XP Bucket TE", 
	<actuallyadditions:block_xp_solidifier>, 
	[[null, <forge:bucketfilled>.withTag({FluidName: "experience", Amount: 1000}), null],
	[<actuallyadditions:block_crystal_empowered:2>, <actuallyadditions:item_misc:8>, <actuallyadditions:block_crystal_empowered:2>], 
	[null, <forge:bucketfilled>.withTag({FluidName: "experience", Amount: 1000}), null]]);

# Wood Casing
	recipes.remove(<actuallyadditions:block_misc:4>);
	recipes.addShapedMirrored("Wood Casing", 
	<actuallyadditions:block_misc:4> * 2, 
	[[<ore:plankTreatedWood>, <forestry:oak_stick>, <ore:plankTreatedWood>],
	[<forestry:oak_stick>, <ore:logWood>, <forestry:oak_stick>], 
	[<ore:plankTreatedWood>, <forestry:oak_stick>, <ore:plankTreatedWood>]]);

# "Small" Storage Crate
	recipes.remove(<actuallyadditions:block_giant_chest>);
	recipes.addShapedMirrored("Small Storage Crate", 
	<actuallyadditions:block_giant_chest>, 
	[[<ore:chest>, <ore:plankTreatedWood>, <ore:chest>],
	[<ore:plankTreatedWood>, <actuallyadditions:block_misc:4>, <ore:plankTreatedWood>], 
	[<ore:chest>, <ore:plankTreatedWood>, <ore:chest>]]);

# Emerald Dust
	recipes.remove(<actuallyadditions:item_dust:3>);
	
# Black Quartz Dust
	recipes.remove(<actuallyadditions:item_dust:7>);
	
# Iron Casing
	recipes.remove(<actuallyadditions:block_misc:9>);
	recipes.addShapedMirrored("Iron Casing", 
	<actuallyadditions:block_misc:9> * 2, 
	[[<ore:blockSheetmetalIron>, <forestry:thermionic_tubes:1>, <ore:blockSheetmetalIron>],
	[<forestry:thermionic_tubes:1>, <forestry:hardened_machine>, <forestry:thermionic_tubes:1>], 
	[<ore:blockSheetmetalIron>, <forestry:thermionic_tubes:1>, <ore:blockSheetmetalIron>]]);

# Basic Coil
	recipes.remove(<actuallyadditions:item_misc:7>);
	recipes.addShapedMirrored("Basic Coil", 
	<actuallyadditions:item_misc:7>, 
	[[<actuallyadditions:item_crystal:5>, <ore:wireAluminum>, <forestry:oak_stick>],
	[<ore:wireAluminum>, <forestry:oak_stick>, <ore:wireAluminum>], 
	[<forestry:oak_stick>, <ore:wireAluminum>, <actuallyadditions:item_crystal:5>]]);

# Advanced Coil
	recipes.remove(<actuallyadditions:item_misc:8>);
	recipes.addShapedMirrored("Advanced Coil", 
	<actuallyadditions:item_misc:8>, 
	[[null, <ic2:cable:2>.withTag({type: 2 as byte, insulation: 0 as byte}), <forestry:oak_stick>],
	[<ic2:cable:2>.withTag({type: 2 as byte, insulation: 0 as byte}), <actuallyadditions:item_misc:7>, <ic2:cable:2>.withTag({type: 2 as byte, insulation: 0 as byte})], 
	[<forestry:oak_stick>, <ic2:cable:2>.withTag({type: 2 as byte, insulation: 0 as byte}), null]]);

# Atomic Reconstructor
	recipes.remove(<actuallyadditions:block_atomic_reconstructor>);
	recipes.addShaped("Atomic Reconstructor", 
	<actuallyadditions:block_atomic_reconstructor>, 
	[[<ore:plateSteel>, <forestry:thermionic_tubes:4>, <ore:plateSteel>],
	[<ore:dustRedstone>, <actuallyadditions:block_misc:9>, <industrialforegoing:laser_lens_inverted:14>], 
	[<ore:plateSteel>, <forestry:thermionic_tubes:4>, <ore:plateSteel>]]);

# Removing Recipes
	var recipesToRemove = [
	<actuallyadditions:item_dust>,
	<actuallyadditions:item_dust:1>,
	<actuallyadditions:item_dust:2>,
	<actuallyadditions:item_dust:4>,
	<actuallyadditions:item_dust:6>,
	<actuallyadditions:block_misc:5>
	] as IItemStack[];
	
	for items in recipesToRemove {
		rh(items);
	}
	
# *======= Empowerer =======*
	
	#mods.actuallyadditions.Empowerer.addRecipe(IItemStack output, IItemStack input, IItemStack modifier1, IItemStack modifier2, IItemStack modifier3, IItemStack modifier4, int energyPerStand, int time, @Optional float[] particleColourArray);

# Restonia
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered>);
	
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:item_crystal_empowered>, <actuallyadditions:item_crystal>, <nuclearcraft:gem>, <thermalfoundation:material:513>, <tconstruct:tool_rod>.withTag({Material: "ardite"}), <minecraft:red_nether_brick>, 25000, 100, [1.0, 0.0, 0.0]);
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered>, <actuallyadditions:block_crystal>, <nuclearcraft:gem>, <thermalfoundation:material:513>, <tconstruct:tool_rod>.withTag({Material: "ardite"}), <minecraft:red_nether_brick>, 250000, 200, [1.0, 0.0, 0.0]);

# Palis
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:1>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:1>);

	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:item_crystal_empowered:1>, <actuallyadditions:item_crystal:1>, <tconstruct:ingots>, <ic2:plate:13>, <biomesoplenty:gem:6>, <tconstruct:slime_congealed:1>, 25000, 100, [0.0, 0.0, 1.0]);
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:1>, <actuallyadditions:block_crystal:1>, <tconstruct:ingots>, <ic2:plate:13>, <biomesoplenty:gem:6>, <tconstruct:slime_congealed:1>, 250000, 200, [0.0, 0.0, 1.0]);

# Diamantine
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:2>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:2>);
	
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:item_crystal_empowered:2>, <actuallyadditions:item_crystal:2>, <nuclearcraft:dust:10>, <botania:manaresource:2>, <tconstruct:ingots:2>, <biomesoplenty:gem:5>, 50000, 200, [0.0, 1.0, 1.0]);
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:2>, <actuallyadditions:block_crystal:2>, <nuclearcraft:dust:10>, <botania:manaresource:2>, <tconstruct:ingots:2>, <biomesoplenty:gem:5>, 500000, 400, [0.0, 1.0, 1.0]);

# Void
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:3>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:3>);

for item in <ore:stoneBasalt>.items {
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:item_crystal_empowered:3>, <actuallyadditions:item_crystal:3>, <minecraft:dye>, <extendedcrafting:storage>, item, <actuallyadditions:block_misc:2>, 250000, 100, [0.1, 0.0, 0.0]);
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:3>, <actuallyadditions:block_crystal:3>, <minecraft:dye>, <extendedcrafting:storage>, item, <actuallyadditions:block_misc:2>, 2500000, 200, [0.1, 0.0, 0.0]);
}

# Emeradic
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:4>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:4>);

	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:item_crystal_empowered:4>, <actuallyadditions:item_crystal:4>, <minecraft:dye:2>, <minecraft:emerald>, <nuclearcraft:dust:9>, <actuallyadditions:block_testifi_bucks_green_wall>, 50000, 200, [0.0, 1.0, 0.498039]);
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:4>, <actuallyadditions:block_crystal:4>, <minecraft:dye:2>, <minecraft:emerald>, <nuclearcraft:dust:9>, <actuallyadditions:block_testifi_bucks_green_wall>, 500000, 400, [0.0, 1.0, 0.498039]);

# Enori
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:5>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:5>);

	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:item_crystal_empowered:5>, <actuallyadditions:item_crystal:5>, <minecraft:quartz_block>, <minecraft:bone_block>, <mekanism:ingot:1>, <nuclearcraft:gem:2>, 25000, 100, [1.0, 1.0, 1.0]);
	mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:5>, <actuallyadditions:block_crystal:5>, <minecraft:quartz_block>, <minecraft:bone_block>, <mekanism:ingot:1>, <nuclearcraft:gem:2>, 250000, 200, [1.0, 1.0, 1.0]);


# *======= Grinder =======*
	#OutputStack, InputStack, (Optional)Output2Stack, (Optional)Output2Chance
	#mods.actuallyadditions.Crusher.addRecipe(<minecraft:iron_ore>, <minecraft:iron_ingot>, <minecraft:stone>, 50);
	
	#BoP Gems -> Dyes
	mods.actuallyadditions.Crusher.addRecipe(<minecraft:dye:9> * 2, <biomesoplenty:gem_block:1>, <minecraft:dye:9> * 2, 50);
	mods.actuallyadditions.Crusher.addRecipe(<minecraft:dye:2> * 2, <biomesoplenty:gem_block:2>, <minecraft:dye:2> * 2, 50);
	mods.actuallyadditions.Crusher.addRecipe(<minecraft:dye:14> * 2, <biomesoplenty:gem_block:3>, <minecraft:dye:14> * 2, 50);
	mods.actuallyadditions.Crusher.addRecipe(<minecraft:dye:10> * 2, <biomesoplenty:gem_block:5>, <minecraft:dye:10> * 2, 50);
	mods.actuallyadditions.Crusher.addRecipe(<minecraft:dye:12> * 2, <biomesoplenty:gem_block:6>, <minecraft:dye:6> * 2, 50);
	
	# Certus Quartz compatibility
	mods.actuallyadditions.Crusher.addRecipe(<appliedenergistics2:material:1> * 2, <appliedenergistics2:charged_quartz_ore>);
	mods.actuallyadditions.Crusher.addRecipe(<appliedenergistics2:material:2>, <appliedenergistics2:material:1>);
	mods.actuallyadditions.Crusher.addRecipe(<appliedenergistics2:material:2>, <appliedenergistics2:material>);
	
# *======= BallOfFur =======*

# Weight of vanilla AA drops used to calculate weight
# numbers taken from wiki
var weight = 100+2+1+80+60+10+40+60+30+70+40+40+10+6+30+2+20+10+3+40+50+30+4+20;

# List of items to balls of fur
# mod:name | meta | weight
var listCatFur as string[] = [
"appliedenergistics2:material"        ,"3"   , "30" , # Nether Quartz Dust
"appliedenergistics2:material"        ,"45"  , "40" , # Sky Stone Dust
"astralsorcery:itemusabledust"        ,"0"   , "25" , # Illumination Powder
"biomesoplenty:gem"                   ,"1"   , "30" , # Ruby
"biomesoplenty:plant_0"               ,"1"   , "30" , # Medium Grass
"botania:manaresource"                ,"12"  , "1"  , # Red String
"botania:manaresource"                ,"16"  , "5"  , # Mana Infused String
"enderio:item_power_conduit"          ,"2"   , "40" , # Ender Energy Conduit
"extendedcrafting:material"           ,"0"   , "5"  , # Black Iron Ingot
"extrautils2:endershard"              ,"0"   , "35" , # Ender Shard
"iceandfire:amphithere_feather"       ,"0"   , "40" , # Amphithere Feather
"iceandfire:dragonbone"               ,"0"   , "8"  , # Dragon Bone
"iceandfire:myrmex_desert_chitin"     ,"0"   , "8"  , # Desert Myrmex Chitin
"iceandfire:myrmex_jungle_chitin"     ,"0"   , "8"  , # Jungle Myrmex Chitin
"iceandfire:deathworm_chitin"         ,"0"   , "5"  , # Tan Death Worm Chitin
"iceandfire:deathworm_chitin"         ,"1"   , "5"  , # White Death Worm Chitin
"iceandfire:deathworm_chitin"         ,"2"   , "5"  , # Red Death Worm Chitin
"iceandfire:stymphalian_bird_feather" ,"0"   , "40" , # Stymphalian Bird Feather
"iceandfire:witherbone"               ,"0"   , "8"  , # Witherbone
"immersiveengineering:bullet"         ,"0"   , "15" , # Empty Casing
"immersiveengineering:material"       ,"8"   , "60" , # Iron Mechanical Component
"immersiveengineering:material"       ,"9"   , "5"  , # Steel Mechanical Component
"industrialforegoing:tinydryrubber"   ,"0"   , "10" , # Tiny Dry Rubber
"minecraft:bone"                      ,"0"   , "30" , # Bone
"minecraft:feather"                   ,"0"   , "30" , # Feather
"minecraft:rabbit_foot"               ,"0"   , "30" , # Rabbit's Foot
"minecraft:rabbit_hide"               ,"0"   , "30" , # Rabbit Hide
"minecraft:skull"                     ,"0"   , "10" , # Skeleton Skull
"minecraft:tallgrass"                 ,"1"   , "30" , # Grass
"mysticalagriculture:crafting"        ,"23"  , "10" , # Mystical String
"mysticalagriculture:crafting"        ,"24"  , "10" , # Mystical Feather
"openblocks:sponge"                   ,"0"   , "40" , # Sponge
"plustic:alumiteingot"                ,"0"   , "5"  , # Alumite Ingot
"quark:crab_leg"                      ,"0"   , "40" , # Crab Leg
"quark:frog_leg"                      ,"0"   , "40" , # Frog Leg
"quark:rope"                          ,"0"   , "40" , # Rope Coil
"quark:soul_bead"                     ,"0"   , "3"  , # Soul Bead
"quark:tallow"                        ,"0"   , "40" , # Tallow
"rustic:bee"                          ,"0"   , "20" , # Bee
"rustic:wind_thistle"                 ,"0"   , "40" , # Wind Thistle
"tconstruct:materials"                ,"17"  , "10" , # Necrotic Bone
"tconstruct:slime_grass_tall"         ,"0"   , "40" , # Tall Slimy Grass
"tconstruct:slime_grass_tall"         ,"4"   , "40" , # Tall Slimy Grass
"tconstruct:slime_grass_tall"         ,"8"   , "40" , # Tall Slimy Grass
"thaumcraft:salis_mundus"             ,"0"   , "5"  , # Salis Mundus
"thermalfoundation:material"          ,"160" , "15" , # Steel Ingot
"twilightforest:alpha_fur"            ,"0"   , "3"  , # Alpha Yeti Fur
"twilightforest:arctic_fur"           ,"0"   , "15" , # Arctic Fur
"twilightforest:cicada"               ,"0"   , "50" , # Cicada
"twilightforest:firefly"              ,"0"   , "50" , # Firefly
"twilightforest:raven_feather"        ,"0"   , "50" , # Raven Feather
"twilightforest:twilight_plant"       ,"5"   , "50" , # Forest Grass
] as string[];

# Calculate total weight
for i in 0 to listCatFur.length {
	if (i%3==2) {
		weight += listCatFur[i] as int;
	}
}

# Iterate list and add drops
for i in 0 to listCatFur.length {
	if (i%3==0) {
		var item = itemUtils.getItem(listCatFur[i], listCatFur[i+1]);
		if (!isNull(item)) {
			addBallReturn(item, listCatFur[i+2]);
			val chance = ((((listCatFur[i+2] as float) / weight * 10000) as int) as double) / 100.0d;
			item.addTooltip(format.darkGray("Drops from ") ~ format.bold("Ball Of Fur") ~
				format.darkGray(" with chance ") ~ format.gray(chance ~ "%"));
		}
	}
}


# *======= Ore for Laser =======*
	mods.actuallyadditions.MiningLens.addStoneOre(<ore:oreBoron>, 250);
	mods.actuallyadditions.MiningLens.addStoneOre(<ore:oreLithium>, 250);
	mods.actuallyadditions.MiningLens.addStoneOre(<ore:oreMagnesium>, 250);
	mods.actuallyadditions.MiningLens.addStoneOre(<ore:oreThorium>, 250);
	mods.actuallyadditions.MiningLens.addStoneOre(<ore:oreCinnabar>, 250);

# Black quartz
val crushExceptions = "except: IECrusher SagMill Pulverizer AACrusher MekCrusher";
scripts.process.crush(<ore:gemQuartzBlack>, <actuallyadditions:item_dust:7>, crushExceptions, null, null);
scripts.process.crush(<ore:blockBlackQuartz>, <actuallyadditions:item_dust:7> * 4, crushExceptions ~ " Manufactory", null, null);

# Recycle Quark crystals
var crystalCrushExcept = "Macerator Grindstone AEGrinder ThermalCentrifuge mekCrusher MekEnrichment";
scripts.process.crush(<quark:crystal:1>, <actuallyadditions:item_crystal_shard>   * 3, crystalCrushExcept, null, null);
scripts.process.crush(<quark:crystal:6>, <actuallyadditions:item_crystal_shard:1> * 3, crystalCrushExcept, null, null);
scripts.process.crush(<quark:crystal:5>, <actuallyadditions:item_crystal_shard:2> * 3, crystalCrushExcept, null, null);
scripts.process.crush(<quark:crystal:8>, <actuallyadditions:item_crystal_shard:3> * 3, crystalCrushExcept, null, null);
scripts.process.crush(<quark:crystal:4>, <actuallyadditions:item_crystal_shard:4> * 3, crystalCrushExcept, null, null);
scripts.process.crush(<quark:crystal>  , <actuallyadditions:item_crystal_shard:5> * 3, crystalCrushExcept, null, null);

# Other better ways to make Bio-mash and other food
scripts.process.mash(<ore:listAllseed>*4,   <actuallyadditions:item_misc:1>*4, "no exceptions");
scripts.process.mash(<ore:listAllveggie>*4, <actuallyadditions:item_misc:1>*4, "no exceptions");
scripts.process.mash(<ore:listAllfruit>*4,  <actuallyadditions:item_misc:1>*5, "no exceptions");
scripts.process.mash(<ore:listAllberry>*4,  <actuallyadditions:item_misc:1>*4, "no exceptions");
scripts.process.mash(<minecraft:baked_potato>,  <actuallyadditions:item_food:5>*4, "no exceptions");
scripts.process.mash(<minecraft:cooked_porkchop>,  <actuallyadditions:item_food:20>*5, "no exceptions");

