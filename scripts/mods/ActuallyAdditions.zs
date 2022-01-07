import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.item.IIngredient;

#modloaded actuallyadditions
	
# Black Quartz Block recipe remakes
	# Black Quartz Pillar
	recipes.remove(<actuallyadditions:block_misc>);
	recipes.addShaped("Black Quartz Pillar remake", <actuallyadditions:block_misc> * 2, 
	[[<ore:blockQuartzBlack>],[<ore:blockQuartzBlack>]]);

	# Chiseled Black Quartz Block
	recipes.remove(<actuallyadditions:block_misc:1>);
	recipes.addShaped("Chiseled Black Quartz Block remake", <actuallyadditions:block_misc:1> * 4, 
	[[<ore:blockQuartzBlack>, <ore:blockQuartzBlack>],
	[<ore:blockQuartzBlack>, <ore:blockQuartzBlack>]]);

#Black Quartz Block to Black Quartz
recipes.removeShaped(<actuallyadditions:block_misc:2>);
utils.compact(<ore:gemQuartzBlack>, <ore:blockQuartzBlack>);
		
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

# [Lens of the Miner] from [Lens of Color][+7]
craft.remake(<actuallyadditions:item_mining_lens>, ["pretty",
  "N E ⌃",
  "E L E",
  "e V ♥"], {
  "⌃": <ore:oreNetherChargedCertusQuartz>,  # Nether Charged Certus Quartz Ore
  "E": <cyclicmagic:exp_pylon>,             # Experience Pylon
  "♥": <ore:oreNetherRedstone>,             # Nether Redstone Ore
  "e": <ore:oreNetherDiamond>,              # Nether Diamond Ore
  "V": <actuallyadditions:block_miner>,     # Vertical Digger
  "L": <actuallyadditions:item_color_lens>, # Lens of Color
  "N": <ore:oreNetherEmerald>,              # Nether Emerald Ore
});

# [Experience_Solidifier] from [Advanced_Coil][+2]
	craft.remake(<actuallyadditions:block_xp_solidifier>, ["pretty",
		"  ~  ",
		"☼ A ☼",
		"  ~  "], {
		"A": <actuallyadditions:item_misc:8>,     # Advanced Coil
		"☼": <actuallyadditions:block_crystal:2>, # Diamatine Crystal Block
		"~": Bucket("xpjuice") | Bucket("experience") | Bucket("essence")
	});

# Wood Casing
	recipes.remove(<actuallyadditions:block_misc:4>);
	recipes.addShapedMirrored("Wood Casing", 
	<actuallyadditions:block_misc:4> * 2, 
	[[<ore:plankTreatedWood>, <forestry:oak_stick>, <ore:plankTreatedWood>],
	[<forestry:oak_stick>, <ore:logWood>, <forestry:oak_stick>], 
	[<ore:plankTreatedWood>, <forestry:oak_stick>, <ore:plankTreatedWood>]]);

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
	[<ore:dustRedstone>, <actuallyadditions:block_misc:9>, null], 
	[<ore:plateSteel>, <forestry:thermionic_tubes:4>, <ore:plateSteel>]]);

# Removing Recipes
	var recipesToRemove = [
	<actuallyadditions:item_dust>,
	<actuallyadditions:item_dust:1>,
	<actuallyadditions:item_dust:2>,
	<actuallyadditions:item_dust:4>,
	<actuallyadditions:item_dust:6>,
	<actuallyadditions:block_misc:5>,
	] as IItemStack[];
	
	for items in recipesToRemove {
		utils.rh(items);
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
	scripts.wrap.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:3>, <actuallyadditions:block_crystal:3>, <randomthings:ingredient:13>, <extendedcrafting:storage>, <chisel:basalt2:*>, <appliedenergistics2:sky_stone_block>, 2500000, 200, [0.1, 0.0, 0.0]);

# Emeradic
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:4>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:4>);
	scripts.wrap.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:4>, <actuallyadditions:block_crystal:4>, <minecraft:dye:2>, <minecraft:emerald>, <nuclearcraft:dust:9>, <actuallyadditions:block_testifi_bucks_green_wall>, 500000, 400, [0.0, 1.0, 0.498039]);

# Enori
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:5>);
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:5>);
	scripts.wrap.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:5>, <actuallyadditions:block_crystal:5>, <minecraft:quartz_block>, <minecraft:bone_block>, <mekanism:ingot:1>, <nuclearcraft:gem:2>, 250000, 200, [1.0, 1.0, 1.0]);


# *======= Grinder =======*
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
"twilightforest:alpha_fur"       , "0"    , "3",
"twilightforest:arctic_fur"      , "0"    , "15",
"animania:wool"                  , "3"    , "55",

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
"iceandfire:deathworm_chitin"        ,"0" ,"5" ,
"iceandfire:deathworm_chitin"        ,"1" ,"5" ,
"iceandfire:deathworm_chitin"        ,"2" ,"5" ,
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
			scripts.wrap.actuallyadditions.BallOfFur.addReturn(item, listCatFur[i+2]);
			val chance = (mods.ctutils.utils.Math.floor((listCatFur[i+2] as float) / weight * 10000) as double) / 100;
			item.addTooltip(format.darkGray("Drops from ") ~ format.bold("Ball Of Fur") ~
				format.darkGray(" with chance ") ~ format.gray(chance ~ "%"));
		}
	}
}

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
scripts.process.crush(<ore:blockQuartzBlack>, <actuallyadditions:item_dust:7> * 9, crushExceptions ~ " Manufactory", null, null);

# Missed Crushed Emerald recipe
scripts.process.crush(<ore:gemEmerald>, <actuallyadditions:item_dust:3>, "Only: Grindstone AEGrinder", null, null);

# Recycle Quark crystals
function recycleCrystal(input as IItemStack, output as IItemStack) {
	scripts.process.crush(input, output, "Macerator Grindstone AEGrinder ThermalCentrifuge mekCrusher MekEnrichment SagMill", null, null);
	scripts.processWork.workEx("SagMill", null, [input], null, [output], null, null, null, {bonusType: "MULTIPLY_OUTPUT"});
}
recycleCrystal(<quark:crystal:1>, <actuallyadditions:item_crystal_shard>   * 3);
recycleCrystal(<quark:crystal:6>, <actuallyadditions:item_crystal_shard:1> * 3);
recycleCrystal(<quark:crystal:5>, <actuallyadditions:item_crystal_shard:2> * 3);
recycleCrystal(<quark:crystal:8>, <actuallyadditions:item_crystal_shard:3> * 3);
recycleCrystal(<quark:crystal:4>, <actuallyadditions:item_crystal_shard:4> * 3);
recycleCrystal(<quark:crystal>  , <actuallyadditions:item_crystal_shard:5> * 3);

# Other better ways to make Bio-mash and other food
scripts.process.mash(<ore:listAllseed>*4,   <actuallyadditions:item_misc:1>*4, "no exceptions");
scripts.process.mash(<ore:listAllveggie>*4, <actuallyadditions:item_misc:1>*4, "no exceptions");
scripts.process.mash(<ore:listAllfruit>*4,  <actuallyadditions:item_misc:1>*5, "no exceptions");
scripts.process.mash(<ore:listAllberry>*4,  <actuallyadditions:item_misc:1>*4, "no exceptions");
scripts.process.mash(<minecraft:baked_potato>,  <actuallyadditions:item_food:5>*4, "no exceptions");
scripts.process.mash(<minecraft:cooked_porkchop>,  <actuallyadditions:item_food:20>*5, "no exceptions");

# Canola unify
scripts.process.squeeze([<actuallyadditions:item_misc:13>], <liquid:canolaoil> * 80, "except: ForestrySqueezer IndustrialSqueezer", null);

# -----------------------------------------
# Storage crate remake

# [Storage_Crate_Keeper] from [Black_Quartz][+1]
craft.remake(<actuallyadditions:item_crate_keeper>, ["pretty",
  "  #  ",
  "# • #",
  "  #  "], {
  "•": <ore:gemQuartzBlack>, # Black Quartz
  "#": <ore:plankWood>       # Oak Wood Planks
});

var crateIngrs = {
  "R": <immersiveengineering:wooden_device0:5>, # Reinforced Storage Crate
  "≢": <actuallyadditions:block_misc:4>,        # Wood Casing
  "#": <ore:plankWood>,                         # Oak Wood Planks
  "e": <enderio:item_material:49>,              # Refractory Wax
  "*": <actuallyadditions:block_crystal:3>,     # Void Crystal Block
  "☼": <actuallyadditions:block_crystal_empowered:3> # Empowered Void Crystal Block
} as IIngredient[string];

# [Small_Storage_Crate] from [Wood_Casing][+2]
craft.remake(<actuallyadditions:block_giant_chest>, ["pretty",
  "R e R",
  "e ≢ e",
  "R e R"],
crateIngrs);

# [Chest_To_Storage_Crate_Upgrade] from [Refractory_Wax][+1]
craft.remake(<actuallyadditions:item_chest_to_crate_upgrade>, ["pretty",
  "R e R",
  "e   e",
  "R e R"],
crateIngrs);

# [Small_To_Medium_Storage_Crate_Upgrade] from [Oak_Wood_Planks][+1]
craft.remake(<actuallyadditions:item_small_to_medium_crate_upgrade>, ["pretty",
  "* # *",
  "#   #",
  "* # *"],
crateIngrs);

# [Medium_To_Large_Storage_Crate_Upgrade] from [Oak_Wood_Planks][+1]
craft.remake(<actuallyadditions:item_medium_to_large_crate_upgrade>, ["pretty",
  "☼ # ☼",
  "#   #",
  "☼ # ☼"],
crateIngrs);

# Original dripp was too pricy comparint to TCon tools
# [Drill] from [Drill_Core][+2]
craft.remake(<actuallyadditions:item_drill:3>, ["pretty",
  "  D ╱",
  "D ╱ D",
  "r D  "], {
  "╱": <ore:stickSteel>,                 # Steel Rod
  "r": <actuallyadditions:item_misc:16>, # Drill Core
  "D": <ore:nuggetDiamond>               # Diamond Nugget
});

# [Ring_of_Growth] from [Ring][+2]
craft.remake(<actuallyadditions:item_growth_ring>, ["pretty",
  "W ☼ W",
  "☼ R ☼",
  "W ☼ W"], {
  "R": <actuallyadditions:item_misc:6>, # Ring
  "W": <ore:seedWheat>,                 # Seeds
  "☼": <ore:crystalEnori>               # Enori Crystal
});

# [Ring_of_Liquid_Banning] from [Ring][+2]
craft.remake(<actuallyadditions:item_water_removal_ring>, ["pretty",
  "S ☼ S",
  "☼ R ☼",
  "S ☼ S"], {
  "R": <actuallyadditions:item_misc:6>, # Ring
  "S": utils.tryCatch("openblocks:sponge", <minecraft:sponge>),             # Sponge
  "☼": <ore:crystalPalis>               # Palis Crystal
});

for i in 0 to 10 {
	recipes.removeByRecipeName("actuallybaubles:bauble_to_potion_ring_"~i);
}

val ringsIngredients = [
	<ore:listAllsugar>,
	<minecraft:repeater>,
	<ore:dustBlaze>,
	<ore:craftingPiston>,
	utils.tryCatch("animania:plain_omelette", <minecraft:egg>),
	<ore:slimeball>,
	<minecraft:magma_cream>,
	<ore:fish>,
	<minecraft:fermented_spider_eye>,
	<minecraft:golden_carrot>,
] as IIngredient[];

for i in 0 to 10 {
	val ring         = <actuallyadditions:item_potion_ring>.definition.makeStack(i);
	val ringAdvanced = <actuallyadditions:item_potion_ring_advanced>.definition.makeStack(i);

	craft.reshapeless(ring, "ABC", {
		A: <actuallyadditions:item_misc:6>,
		B: <ore:crystalDiamantine>,
		C: ringsIngredients[i],
	});

	craft.reshapeless(ringAdvanced, "AB", {
		A: ring,
		B: <actuallyadditions:item_crystal_empowered:2>
	});
}

# Simplify because it produce only max 256 RF/T
# [Bio_Reactor] from [Iron_Casing][+2]
craft.remake(<actuallyadditions:block_bio_reactor>, ["pretty",
  "S S S",
  "☼ I ☼",
  "S S S"], {
  "S": <ore:treeSapling>,                # Oak Sapling
  "I": <actuallyadditions:block_misc:9>, # Iron Casing
  "☼": <ore:crystalEnori>                # Enori Crystal
});

<actuallyadditions:block_tiny_torch>.asBlock().definition.lightLevel = 0.65f;

# [Fluid Collector] from [Auto-Breaker][+1]
recipes.removeByRecipeName("actuallyadditions:recipes142");
craft.make(<actuallyadditions:block_fluid_collector>, [
  "FAF"], {
  "A": <actuallyadditions:block_breaker>, # Auto-Breaker
  "F": <flopper:flopper>,                 # Flopper
});

# [Fluid Placer] from [Auto-Placer][+1]
recipes.removeByRecipeName("actuallyadditions:recipes141");
craft.make(<actuallyadditions:block_fluid_placer>, [
  "FAF"], {
  "A": <actuallyadditions:block_placer>, # Auto-Placer
  "F": <flopper:flopper>,                # Flopper
});

# [Phantom Liquiface] from [Phantomface][+1]
craft.remake(<actuallyadditions:block_phantom_liquiface>, [
  "FPF"], {
  "P": <actuallyadditions:block_phantomface>, # Phantomface
  "F": <flopper:flopper>,                     # Flopper
});

# Harder to require more exploration
# [Spawner Changer] from [Terrestrial Artifact][+3]
recipes.removeShaped(<actuallyadditions:item_spawner_changer>);
craft.make(<actuallyadditions:item_spawner_changer>, ["pretty",
  "R S ▲",
  "S T S",
  "▲ S ▲"], {
  "▲": <scalinghealth:heartdust>,            # Heart Dust
  "R": <iceandfire:rotten_egg>,              # Rotten Egg
  "S": <actuallyadditions:item_misc:20>,     # Spawner Shards
  "T": <biomesoplenty:terrestrial_artifact>, # Terrestrial Artifact
});

# [Vertical Digger] from [Empowered Void Crystal Block][+3]
craft.remake(<actuallyadditions:block_miner>, ["pretty",
  "⌃ ⌂ ⌃",
  "⌂ * ⌂",
  "⌃ D ⌃"], {
  "⌂": <actuallyadditions:block_misc:9>, # Iron Casing
  "⌃": <ore:blockQuartzBlack>, # Block of Black Quartz
  "D": <actuallyadditions:item_drill:*>, # Drill
  "*": <actuallyadditions:block_crystal_empowered:3>, # Empowered Void Crystal Block
});

# [Casing*4] from [Iron Casing][+1]
craft.remake(<actuallyadditions:block_misc:7> * 4, ["pretty",
  "  ⌃  ",
  "⌃ ⌂ ⌃",
  "  ⌃  "], {
  "⌂": <actuallyadditions:block_misc:9>, # Iron Casing
  "⌃": <ore:blockQuartzBlack>, # Block of Black Quartz
});

# [Ender Casing] from [Empowered Diamatine Crystal][+2]
# Cheaper because used in many crafts
craft.remake(<actuallyadditions:block_misc:8>, ["pretty",
  "⌂ ▬ ⌂",
  "▬ * ▬",
  "⌂ ▬ ⌂"], {
  "⌂": <actuallyadditions:block_misc:7>, # Casing
  "*": <actuallyadditions:item_crystal_empowered:2>, # Empowered Diamatine Crystal
  "▬": <extendedcrafting:material:36>,   # Ender Ingot
});

# [Basic Coil] from [Aluminum Ingot*2][+2]
scripts.processUtils.avdRockXmlRecipeEx("PrecisionAssembler",
	[<ore:stickWood> * 36,<ore:ingotAluminium> * 24,<ore:ingotFakeIron> * 24], null,
	[<actuallyadditions:item_misc:7> * 12], null, {power: 70000, timeRequired: 20}
);

# [Advanced Coil] from [Aluminum Ingot*2][+3]
scripts.processUtils.avdRockXmlRecipeEx("PrecisionAssembler",
	[<ore:stickWood> * 60, <ore:ingotGold> * 12, <ore:ingotAluminium> * 24, <ore:ingotFakeIron> * 24,], null,
	[<actuallyadditions:item_misc:8> * 12], null, {power: 140000, timeRequired: 40}
);

# New dough mechanic
recipes.remove(<actuallyadditions:item_misc:4>);
mods.rustic.CrushingTub.addRecipe(<liquid:water>, <actuallyadditions:item_misc:4> * 2, <harvestcraft:doughitem>);

# Toast from baguette
recipes.remove(<actuallyadditions:item_food:10>);
recipes.addShapeless("Toast from baguette", <actuallyadditions:item_food:10>, [<actuallyadditions:item_food:15>]);
scripts.process.mash(<actuallyadditions:item_food:15>, <actuallyadditions:item_food:10>*4, "no exceptions");

# [Pizza] from [Carrot][+5]
craft.remake(<actuallyadditions:item_food:14>, ["pretty",
  "C K C",
  "A a l",
  "  D  "], {
  "A": <ore:mushroomAny>, # Mushroom
  "a": <ore:cropCarrot>, # Carrot
  "C": <ore:foodCheese>, # Cheese
  "D": <ore:foodDough>,  # Dough
  "K": <actuallyadditions:item_knife>.anyDamage(), # Knife
  "l": <ore:listAllfishcooked>, # Cooked Salmon
});

# [Big Cookie] from [Cocoa Beans][+1]
craft.remake(<actuallyadditions:item_food:12>, ["pretty",
  "D d D",
  "d D d",
  "D d D"], {
  "D": <ore:foodDough>,            # Dough
  "d": <minecraft:dye:3>, # Cocoa Beans
});

# [Chocolate Cake] from [Egg][+4]
craft.remake(<actuallyadditions:item_food:8>, ["pretty",
  "A A A",
  "d d d",
  "e D l"], {
  "A": <ore:listAllmilk>, # Fresh Milk
  "d": <minecraft:dye:3>, # Cocoa Beans
  "D": <ore:foodDough>, # Dough
  "e": <ore:listAllegg>, # Egg
  "l": <ore:listAllsugar>, # Sugar
});

# Harder Void Stone (was from coal)
mods.actuallyadditions.AtomicReconstructor.removeRecipe(<actuallyadditions:block_crystal:3>);
mods.actuallyadditions.AtomicReconstructor.removeRecipe(<actuallyadditions:item_crystal:3>);
scripts.wrap.actuallyadditions.AtomicReconstructor.addRecipe(<actuallyadditions:block_crystal:3>, <actuallyadditions:block_misc:2>, 1000);
scripts.wrap.actuallyadditions.AtomicReconstructor.addRecipe(<actuallyadditions:item_crystal:3>, <actuallyadditions:item_misc:5>, 100);

# [Solar Panel]*4 from [Casing][+2]
craft.remake(<actuallyadditions:block_furnace_solar> * 4, ["pretty",
  "* * *",
  "B ⌂ B"], {
  "*": <ore:crystalPalis>,               # Palis Crystal
  "B": <actuallyadditions:item_misc:7>,  # Basic Coil
  "⌂": <actuallyadditions:block_misc:7>, # Casing
});

# [Resonant Rice]*6 from [Ender Shard][+2]
craft.reshapeless(<actuallyadditions:item_resonant_rice> * 6, "REg", {
  "R": <actuallyadditions:item_food:16>, # Rice
  "E": <extrautils2:endershard>,         # Ender Shard
  "g": <ore:gunpowder>,                  # Gunpowder
});

# [Shock Absorber] from [Advanced Coil][+2]
craft.remake(<actuallyadditions:block_shock_suppressor>, ["pretty",
  "■ * ■",
  "* A *",
  "■ * ■"], {
  "■": <ore:blockSkyStone>,             # Sky Stone
  "*": <ore:crystalVoid>,               # Void Crystal
  "A": <ore:crystalEnori>,
});

###################################################
# Buff knife - add more durability recipes
<actuallyadditions:item_knife>.maxDamage = 2000;
recipes.remove(<actuallyadditions:item_knife>);
val knife_ingrs = {
  "S": <tconstruct:knife_blade>.withTag({Material: "steel"}), # Steel Knife Blade
  "R": <tconstruct:knife_blade>.withTag({Material: "refined_obsidian"}), # Refined Obsidian Knife Blade
  "K": <actuallyadditions:item_misc:3>, # Knife Handle
  "n": <actuallyadditions:item_misc:2>, # Knife Blade
} as IIngredient[string];
craft.make(<actuallyadditions:item_knife:1900>, [" n", "K "], knife_ingrs); # [Knife] from [Knife Blade][+1]
craft.make(<actuallyadditions:item_knife:1600>, [" S", "K "], knife_ingrs); # [Knife] from [Steel Knife Blade][+1]
craft.make(<actuallyadditions:item_knife>, [" R", "K "], knife_ingrs); # [Knife] from [Refined Obsidian Knife Blade][+1]

###################################################

# Cheaper to use more in building
# [White Lamp]*32 from [Black Quartz][+3]
for i, dye in scripts.category.dye.oreDye {
	craft.remake(<actuallyadditions:block_colored_lamp>.definition.makeStack(i) * 32, ["pretty",
		"g * g",
		"d ⌃ d",
		"g * g"], {
		"d": dye,
		"g": <ore:glowstone>,      # Glowstone
		"*": <ore:crystalPalis>,   # Palis Crystal
		"⌃": <ore:gemQuartzBlack>, # Black Quartz
	});
}

# Cheaper, because Void Stone ingredient too pricy
# [Traveler's Sack] from [Oak Chest][+2]
craft.remake(<actuallyadditions:item_bag>, ["pretty",
  "  s  ",
  "H c H",
  "  H  "], {
  "s": <ore:string>, # String
  "H": <ore:fabricHemp>, # Tough Fabric
  "c": <ore:chest>, # Oak Chest
});
