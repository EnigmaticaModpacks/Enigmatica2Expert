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
	[[null, Bucket("xpjuice"), null],
	[<actuallyadditions:block_crystal_empowered:2>, <actuallyadditions:item_misc:8>, <actuallyadditions:block_crystal_empowered:2>], 
	[null, Bucket("xpjuice"), null]]);
	
	recipes.addShapedMirrored("XP Bucket TE", 
	<actuallyadditions:block_xp_solidifier>, 
	[[null, Bucket("experience"), null],
	[<actuallyadditions:block_crystal_empowered:2>, <actuallyadditions:item_misc:8>, <actuallyadditions:block_crystal_empowered:2>], 
	[null, Bucket("experience"), null]]);

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
	[[<immersiveengineering:wooden_device0:5>, <ore:plankTreatedWood>, <immersiveengineering:wooden_device0:5>],
	[<ore:plankTreatedWood>, <actuallyadditions:block_misc:4>, <ore:plankTreatedWood>], 
	[<immersiveengineering:wooden_device0:5>, <ore:plankTreatedWood>, <immersiveengineering:wooden_device0:5>]]);

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
	scripts.wrap.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered>, <actuallyadditions:block_crystal>, <nuclearcraft:gem>, <thermalfoundation:material:513>, <tconstruct:tool_rod>.withTag({Material: "ardite"}), <minecraft:red_nether_brick>, 250000, 200, [1.0, 0.0, 0.0]);

# Palis
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:1>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:1>);
	scripts.wrap.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:1>, <actuallyadditions:block_crystal:1>, <tconstruct:ingots>, <ic2:plate:13>, <biomesoplenty:gem:6>, <tconstruct:slime_congealed:1>, 250000, 200, [0.0, 0.0, 1.0]);

# Diamantine
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:2>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:2>);
	scripts.wrap.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:2>, <actuallyadditions:block_crystal:2>, <nuclearcraft:dust:10>, <botania:manaresource:2>, <tconstruct:ingots:2>, <biomesoplenty:gem:5>, 500000, 400, [0.0, 1.0, 1.0]);

# Void
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:3>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:3>);

for item in <ore:stoneBasalt>.items {
	scripts.wrap.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:3>, <actuallyadditions:block_crystal:3>, <minecraft:dye>, <extendedcrafting:storage>, item, <actuallyadditions:block_misc:2>, 2500000, 200, [0.1, 0.0, 0.0]);
}

# Emeradic
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:4>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:4>);
	scripts.wrap.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:4>, <actuallyadditions:block_crystal:4>, <minecraft:dye:2>, <minecraft:emerald>, <nuclearcraft:dust:9>, <actuallyadditions:block_testifi_bucks_green_wall>, 500000, 400, [0.0, 1.0, 0.498039]);

# Enori
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:5>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:5>);
	scripts.wrap.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:5>, <actuallyadditions:block_crystal:5>, <minecraft:quartz_block>, <minecraft:bone_block>, <mekanism:ingot:1>, <nuclearcraft:gem:2>, 250000, 200, [1.0, 1.0, 1.0]);


# *======= Grinder =======*
	#OutputStack, InputStack, (Optional)Output2Stack, (Optional)Output2Chance
	#mods.actuallyadditions.Crusher.addRecipe(<minecraft:iron_ore>, <minecraft:iron_ingot>, <minecraft:stone>, 50);
	
	#BoP Gems -> Dyes
	scripts.wrap.actuallyadditions.Crusher.addRecipe(<minecraft:dye:9> * 2, <biomesoplenty:gem_block:1>, <minecraft:dye:9> * 2, 50);
	scripts.wrap.actuallyadditions.Crusher.addRecipe(<minecraft:dye:2> * 2, <biomesoplenty:gem_block:2>, <minecraft:dye:2> * 2, 50);
	scripts.wrap.actuallyadditions.Crusher.addRecipe(<minecraft:dye:14> * 2, <biomesoplenty:gem_block:3>, <minecraft:dye:14> * 2, 50);
	scripts.wrap.actuallyadditions.Crusher.addRecipe(<minecraft:dye:10> * 2, <biomesoplenty:gem_block:5>, <minecraft:dye:10> * 2, 50);
	scripts.wrap.actuallyadditions.Crusher.addRecipe(<minecraft:dye:12> * 2, <biomesoplenty:gem_block:6>, <minecraft:dye:6> * 2, 50);
	
	# Certus Quartz compatibility
	scripts.wrap.actuallyadditions.Crusher.addRecipe(<appliedenergistics2:material:1> * 2, <appliedenergistics2:charged_quartz_ore>);
	scripts.wrap.actuallyadditions.Crusher.addRecipe(<appliedenergistics2:material:2>, <appliedenergistics2:material:1>);
	scripts.wrap.actuallyadditions.Crusher.addRecipe(<appliedenergistics2:material:2>, <appliedenergistics2:material>);


# *======= TreasureChest =======*
	#mods.actuallyadditions.TreasureChest.addLoot(IItemStack returnItem, int chance, int minAmount, int maxAmount);
	#mods.actuallyadditions.TreasureChest.addLoot(<minecraft:dirt>, 50, 1, 64);


# *======= BallOfFur =======*

# Weight of standart AA drops
var weight = 100+2+1+80+60+10+40+60+30+70+40+40+10+6+30+2+20+10+3+40+50+30+4+20;

var listCatFur as string[] = [
"thermalfoundation:material"     , "160"  , "15",
"astralsorcery:itemusabledust"   , "0"    , "25",
"extendedcrafting:material"      , "0"    , "5",
"appliedenergistics2:material"   , "45"   , "40",
"appliedenergistics2:material"   , "3"    , "30",
"biomesoplenty:gem"              , "1"    , "30",
"immersiveengineering:material"  , "9"    , "5",
"immersiveengineering:material"  , "8"    , "60",
"plustic:alumiteingot"           , "0"    , "5",
"rats:raw_rat"                   , "0"    , "90",
"rats:rat_pelt"                  , "0"    , "65",
"rats:token_fragment"            , "0"    , "15",
"rats:little_black_worm"         , "0"    , "1",
"rats:feral_rat_claw"            , "0"    , "10",
"rats:marbled_cheese_rat_head"   , "0"    , "2",
"enderio:item_power_conduit"     , "2"    , "40",
"immersivecables:wire_coil"      , "1"    , "25",
"rs_ctr:wire"                    , "0"    , "45",
"twilightforest:alpha_fur"       , "0"    , "3",
"twilightforest:arctic_fur"      , "0"    , "15",
"animania:wool"                  , "3"    , "55",
"bigreactors:mineralanglesite"   , "0"    , "1",

"animania:blue_peacock_feather"      ,"0" ,"50",
"animania:charcoal_peacock_feather"  ,"0" ,"50",
"animania:opal_peacock_feather"      ,"0" ,"50",
"animania:peach_peacock_feather"     ,"0" ,"50",
"animania:purple_peacock_feather"    ,"0" ,"50",
"animania:taupe_peacock_feather"     ,"0" ,"50",
"animania:white_peacock_feather"     ,"0" ,"50",
"betteranimalsplus:bear_skin_black"  ,"0" ,"15",
"betteranimalsplus:bear_skin_brown"  ,"0" ,"15",
"betteranimalsplus:bear_skin_kermode","0" ,"15",
"betteranimalsplus:eel_meat_raw"     ,"0" ,"35",
"betteranimalsplus:wolf_pelt_arctic" ,"0" ,"25",
"betteranimalsplus:wolf_pelt_black"  ,"0" ,"25",
"betteranimalsplus:wolf_pelt_brown"  ,"0" ,"25",
"betteranimalsplus:wolf_pelt_red"    ,"0" ,"25",
"betteranimalsplus:wolf_pelt_snowy"  ,"0" ,"25",
"betteranimalsplus:wolf_pelt_timber" ,"0" ,"25",
"biomesoplenty:plant_"               ,"0" ,"30",
"biomesoplenty:plant_0"              ,"1" ,"30",
"botania:manaresource"               ,"12","1" ,
"botania:manaresource"               ,"16","5" ,
"extrautils2:endershard"             ,"0" ,"35",
"iceandfire:amphithere_feather"      ,"0" ,"40",
"iceandfire:dragonbone"              ,"0" ,"8" ,
"iceandfire:myrmex_desert_chitin"    ,"0" ,"8" ,
"iceandfire:myrmex_jungle_chitin"    ,"0" ,"8" ,
"iceandfire:stymphalian_bird_feather","0" ,"40",
"iceandfire:witherbone"              ,"0" ,"8" ,
"immersiveengineering:bullet"        ,"0" ,"15",
"industrialforegoing:tinydryrubber"  ,"0" ,"10",
"minecraft:bone"                     ,"0" ,"30",
"minecraft:feather"                  ,"0" ,"30",
"minecraft:rabbit_foot"              ,"0" ,"30",
"minecraft:rabbit_hide"              ,"0" ,"30",
"minecraft:skull"                    ,"0" ,"10",
"minecraft:tallgrass"                ,"1" ,"30",
"mysticalagriculture:crafting"       ,"23","10",
"mysticalagriculture:crafting"       ,"24","10",
"openblocks:sponge"                  ,"0" ,"40",
"quark:crab_leg"                     ,"0" ,"40",
"quark:frog_leg"                     ,"0" ,"40",
"quark:rope"                         ,"0" ,"40",
"quark:soul_bead"                    ,"0" ,"3",
"quark:tallow"                       ,"0" ,"40",
"rats:rat_nugget"                    ,"0" ,"20",
"rats:string_cheese"                 ,"0" ,"20",
"rustic:bee"                         ,"0" ,"20",
"rustic:wind_thistle"                ,"0" ,"40",
"tconstruct:materials"               ,"17","10",
"tconstruct:slime_grass_tall"        ,"0" ,"40",
"tconstruct:slime_grass_tall"        ,"4" ,"40",
"tconstruct:slime_grass_tall"        ,"8" ,"40",
"thaumcraft:salis_mundus"            ,"0" ,"5" ,
"twilightforest:cicada"              ,"0" ,"50",
"twilightforest:firefly"             ,"0" ,"50",
"twilightforest:raven_feather"       ,"0" ,"50",
"twilightforest:twilight_plant"      ,"5" ,"50",

] as string[];

# Calculate total weight
for i in 0 to listCatFur.length {
	if (i%3==2) {
		weight += listCatFur[i] as int;
	}
}

for i in 0 to listCatFur.length {
	if (i%3==0) {
		var item = itemUtils.getItem(listCatFur[i], listCatFur[i+1]);
		if (!isNull(item)) {
			addBallReturn(item, listCatFur[i+2]);
			val chance = (mods.ctutils.utils.Math.floor((listCatFur[i+2] as float) / weight * 10000) as double) / 100;
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


# *======= Ring Of The Flying Squid =======*
	remake("Ring Of The Flying Squid",
	<extrautils2:chickenring:1>, 
	[[<extrautils2:ineffableglass>, <minecraft:elytra>.anyDamage(), <extrautils2:ineffableglass>],
	[<ore:plateDenseGold>, <actuallyadditions:item_misc:19>, <ore:plateDenseGold>], 
	[<minecraft:golden_apple>, <extrautils2:chickenring>, <minecraft:golden_apple>]]);

# *======= Angel Ring =======*
for i in 0 to 6 {
	recipes.removeByRecipeName("extrautils2:angel_ring_" ~ i); # Remove shaped
}
recipes.addShaped("Angel Ring", 
	<extrautils2:angelring>, [
	[<ore:plateDenseGold>, <botania:flighttiara:*>, <ore:plateDenseGold>], 
	[<environmentaltech:modifier_creative_flight>, <extendedcrafting:material:40>, <environmentaltech:modifier_creative_flight>], 
	[<ore:plateDenseGold>, <extrautils2:chickenring:1>, <ore:plateDenseGold>]
]);

# Harder Phantom Face
remake("actuallyadditions Phantomface", <actuallyadditions:block_phantomface>, [
	[null, <ore:chestWood>, null], 
	[<actuallyadditions:item_crystal_empowered:2>, <capabilityproxy:capability_proxy>, <actuallyadditions:item_crystal_empowered:2>], 
	[null, <actuallyadditions:item_misc:8>, null]]);

# Harder greenhouse glass
recipes.remove(<actuallyadditions:block_greenhouse_glass> * 2);
recipes.addShaped(<actuallyadditions:block_greenhouse_glass> * 3, [
	[<actuallyadditions:item_fertilizer>, <actuallyadditions:item_crystal_empowered:1>, <actuallyadditions:item_fertilizer>],
	[<actuallyadditions:item_crystal_empowered:1>, <ore:ingotModularium>, <actuallyadditions:item_crystal_empowered:1>],
	[<actuallyadditions:item_fertilizer>, <liquid:crystal>, <actuallyadditions:item_fertilizer>]]);

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

# Other ways to make Bio-mash
scripts.process.mash(<ore:listAllseed>*4,   <actuallyadditions:item_misc:1>*4, "no exceptions");
scripts.process.mash(<ore:listAllveggie>*4, <actuallyadditions:item_misc:1>*4, "no exceptions");
scripts.process.mash(<ore:listAllfruit>*4,  <actuallyadditions:item_misc:1>*5, "no exceptions");
scripts.process.mash(<ore:listAllberry>*4,  <actuallyadditions:item_misc:1>*4, "no exceptions");
scripts.process.mash(<minecraft:baked_potato>,  <actuallyadditions:item_food:5>*2, "no exceptions");
scripts.process.mash(<minecraft:cooked_porkchop>,  <actuallyadditions:item_food:20>*3, "no exceptions");

# Canola unify
scripts.process.squeeze([<actuallyadditions:item_misc:13>], <liquid:canolaoil> * 80, "except: ForestrySqueezer IndustrialSqueezer", null);