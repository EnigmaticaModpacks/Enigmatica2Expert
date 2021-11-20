import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.item.IIngredient;
import scripts.craft.grid.Grid;

#priority -1

# Buff Elythra durability (was 432)
<minecraft:elytra>.maxDamage = 1200;
<colytra:elytra_bauble>.maxDamage = 1200;

# Quark Marble Wall Oredicted version
	recipes.remove(<quark:marble_wall>);
	recipes.addShaped("Quark Marble Wall", 
	<quark:marble_wall> * 6, 
	[[<ore:stoneMarble>, <ore:stoneMarble>, <ore:stoneMarble>],
	[<ore:stoneMarble>, <ore:stoneMarble>, <ore:stoneMarble>]]);

# MOAR BAITS
	recipes.addShapeless("Polar Bear Bait", 
	<excompressum:bait:10>, 
	[<ore:fish>,<minecraft:snowball>]);
	recipes.addShapeless("Llama Bait", 
	<excompressum:bait:11>, 
	[<ore:listAllgrain>,<ore:listAllsugar>]);
	
# NuclearCraft -> Random Things Glowing Mushroom
	recipes.removeShapeless(<minecraft:brown_mushroom>, [<nuclearcraft:glowing_mushroom>]);
	recipes.addShapeless("Random Things Glowing Mushroom", 
	<randomthings:glowingmushroom>, [<nuclearcraft:glowing_mushroom>]);

# Bookshelf > Oak Bookshelf
	recipes.addShapeless("Bookshelf Conversion", <minecraft:bookshelf>, [<ore:bookshelf>]);
	
# Uranium Block
	recipes.addShaped("UraniumBlock", 
	<immersiveengineering:storage:5>, 
	[[<ore:ingotUranium>, <ore:ingotUranium>, <ore:ingotUranium>],
	[<ore:ingotUranium>, <ore:ingotUranium>, <ore:ingotUranium>], 
	[<ore:ingotUranium>, <ore:ingotUranium>, <ore:ingotUranium>]]);
	# Block -> Ingots
	recipes.addShapeless("UraniumIngots", 
	<immersiveengineering:metal:5> * 9, 
	[<ore:blockUranium>]);
	
# Amber Conversion
	recipes.addShapeless("BoP Amber", <biomesoplenty:gem:7> * 2, [<thaumcraft:amber>,<thaumcraft:amber>]);
	recipes.addShapeless("Thaumcraft Amber", <thaumcraft:amber> * 2, [<biomesoplenty:gem:7>,<biomesoplenty:gem:7>]);

# End Crystal
	recipes.remove(<minecraft:end_crystal>);
	recipes.addShaped("End Crystal", 
	<minecraft:end_crystal>, 
	[[<ore:blockGlassHardened>, <ore:blockGlassHardened>, <ore:blockGlassHardened>],
	[<ore:blockGlassHardened>, <ore:netherStar>, <ore:blockGlassHardened>],
	[<ore:blockGlassHardened>, <ore:itemGhastTear>, <ore:blockGlassHardened>]]);
	
# Cyclic Guide
	recipes.addShapeless("Cyclic Guide", 
	<guideapi:cyclicmagic-guide>, 
	[<minecraft:book>,<cyclicmagic:carbon_paper>]);
	
# Blood Magic Guide
	recipes.addShapeless("Blood Magic Guide", 
	<guideapi:bloodmagic-guide>, 
	[<minecraft:book>,<bloodmagic:soul_snare>]);
	
# Animania Random Animal Spawn Egg
	scripts.wrap.forestry.Carpenter.addRecipe(<animania:entity_egg_random>, 
	[[null , <cyclicmagic:sprout_seed>, null],
	[<ore:egg>,<ore:egg>,<ore:egg>],
	[null, <cyclicmagic:sprout_seed>, null]], 
	40, <liquid:meat> * 500);
	
	scripts.wrap.forestry.Carpenter.addRecipe(<animania:entity_egg_random>, 
	[[null , <cyclicmagic:sprout_seed>, null],
	[<ore:egg>,<ore:egg>,<ore:egg>],
	[null, <cyclicmagic:sprout_seed>, null]], 
	40, <liquid:liquiddna> * 250);
	
# Mud conversion
	recipes.remove(<animania:block_mud>);
	recipes.addShapeless("BoP Mud", <biomesoplenty:mud>, [<animania:block_mud>]);
	recipes.addShapeless("Animania Mud", <animania:block_mud>, [<biomesoplenty:mud>]);

# Iridium conversion
	recipes.addShapeless(<thermalfoundation:material:135> * 2, [<ic2:misc_resource:1>, <ic2:misc_resource:1>]);
	recipes.addShapeless(<ic2:misc_resource:1> * 2, [<thermalfoundation:material:135>, <thermalfoundation:material:135>]);
	
# Graphite conversion 	
	recipes.addShapeless("Graphite Conversion 3", <bigreactors:blockgraphite> * 2, [<nuclearcraft:ingot_block:8>, <nuclearcraft:ingot_block:8>]);
	recipes.addShapeless("Graphite Conversion 4", <nuclearcraft:ingot_block:8> * 2, [<bigreactors:blockgraphite>, <bigreactors:blockgraphite>]);

# Rustic Slate
	recipes.addShapeless("slate", 
	<rustic:slate> * 4, 
	[<ore:stoneBasalt>, <ore:stoneBasalt>, <ore:stoneBasalt>, <ore:stoneLimestone>]);
	
# String recipes
	var wool = <minecraft:wool:*>;
	recipes.removeShapeless(<minecraft:string> * 4, [wool]);
	recipes.removeShaped(<minecraft:string> * 4, 
	[[wool, null, null],
	[null, null, null], 
	[null, null, null]]);	

# Piston
	recipes.remove(<minecraft:piston>);
	recipes.addShapedMirrored("Piston1", <minecraft:piston> * 2, [[<ore:plankTreatedWood>, <ore:plankTreatedWood>, <ore:plankTreatedWood>],[<ore:compressed1xCobblestone>, <ore:plateIron>, <ore:compressed1xCobblestone>], [<ore:compressed1xCobblestone>, <ore:dustRedstone>, <ore:compressed1xCobblestone>]]);
	recipes.addShapedMirrored("Piston2", <minecraft:piston> * 2, [[<ore:plankTreatedWood>, <ore:plankTreatedWood>, <ore:plankTreatedWood>],[<ore:compressed1xCobblestone>, <ore:plateNickel>, <ore:compressed1xCobblestone>], [<ore:compressed1xCobblestone>, <ore:dustRedstone>, <ore:compressed1xCobblestone>]]);
	recipes.addShapedMirrored("Piston3", <minecraft:piston> * 2, [[<ore:plankTreatedWood>, <ore:plankTreatedWood>, <ore:plankTreatedWood>],[<ore:compressed1xCobblestone>, <ore:plateAluminum>, <ore:compressed1xCobblestone>], [<ore:compressed1xCobblestone>, <ore:dustRedstone>, <ore:compressed1xCobblestone>]]);
	recipes.addShapedMirrored("Piston4", <minecraft:piston> * 2, [[<ore:plankTreatedWood>, <ore:plankTreatedWood>, <ore:plankTreatedWood>],[<ore:compressed1xCobblestone>, <ore:plateLead>, <ore:compressed1xCobblestone>], [<ore:compressed1xCobblestone>, <ore:dustRedstone>, <ore:compressed1xCobblestone>]]);
	recipes.addShapedMirrored("Piston5", <minecraft:piston> * 2, [[<ore:plankTreatedWood>, <ore:plankTreatedWood>, <ore:plankTreatedWood>],[<ore:compressed1xCobblestone>, <ore:plateSilver>, <ore:compressed1xCobblestone>], [<ore:compressed1xCobblestone>, <ore:dustRedstone>, <ore:compressed1xCobblestone>]]);
	recipes.addShapedMirrored("Piston6", <minecraft:piston> * 2, [[<ore:plankTreatedWood>, <ore:plankTreatedWood>, <ore:plankTreatedWood>],[<ore:compressed1xCobblestone>, <ore:plateTin>, <ore:compressed1xCobblestone>], [<ore:compressed1xCobblestone>, <ore:dustRedstone>, <ore:compressed1xCobblestone>]]);
	recipes.addShapedMirrored("Piston7", <minecraft:piston> * 2, [[<ore:plankTreatedWood>, <ore:plankTreatedWood>, <ore:plankTreatedWood>],[<ore:compressed1xCobblestone>, <ore:plateCopper>, <ore:compressed1xCobblestone>], [<ore:compressed1xCobblestone>, <ore:dustRedstone>, <ore:compressed1xCobblestone>]]);

	
# Wool dyeing
	recipes.addShaped("wool", <minecraft:wool> * 8, [[wool, wool, wool],[wool, <ore:dyeWhite>, wool], [wool, wool, wool]]);
	recipes.addShaped("wool1", <minecraft:wool:1> * 8, [[wool, wool, wool],[wool, <ore:dyeOrange>, wool], [wool, wool, wool]]);
	recipes.addShaped("wool2", <minecraft:wool:2> * 8, [[wool, wool, wool],[wool, <ore:dyeMagenta>, wool], [wool, wool, wool]]);
	recipes.addShaped("wool3", <minecraft:wool:3> * 8, [[wool, wool, wool],[wool, <ore:dyeLightBlue>, wool], [wool, wool, wool]]);
	recipes.addShaped("wool4", <minecraft:wool:4> * 8, [[wool, wool, wool],[wool, <ore:dyeYellow>, wool], [wool, wool, wool]]);
	recipes.addShaped("wool5", <minecraft:wool:5> * 8, [[wool, wool, wool],[wool, <ore:dyeLime>, wool], [wool, wool, wool]]);
	recipes.addShaped("wool6", <minecraft:wool:6> * 8, [[wool, wool, wool],[wool, <ore:dyePink>, wool], [wool, wool, wool]]);
	recipes.addShaped("wool7", <minecraft:wool:7> * 8, [[wool, wool, wool],[wool, <ore:dyeGray>, wool], [wool, wool, wool]]);
	recipes.addShaped("wool8", <minecraft:wool:8> * 8, [[wool, wool, wool],[wool, <ore:dyeLightGray>, wool], [wool, wool, wool]]);
	recipes.addShaped("wool9", <minecraft:wool:9> * 8, [[wool, wool, wool],[wool, <ore:dyeCyan>, wool], [wool, wool, wool]]);
	recipes.addShaped("wool10", <minecraft:wool:10> * 8, [[wool, wool, wool],[wool, <ore:dyePurple>, wool], [wool, wool, wool]]);
	recipes.addShaped("wool11", <minecraft:wool:11> * 8, [[wool, wool, wool],[wool, <ore:dyeBlue>, wool], [wool, wool, wool]]);
	recipes.addShaped("wool12", <minecraft:wool:12> * 8, [[wool, wool, wool],[wool, <ore:dyeBrown>, wool], [wool, wool, wool]]);
	recipes.addShaped("wool13", <minecraft:wool:13> * 8, [[wool, wool, wool],[wool, <ore:dyeGreen>, wool], [wool, wool, wool]]);
	recipes.addShaped("wool14", <minecraft:wool:14> * 8, [[wool, wool, wool],[wool, <ore:dyeRed>, wool], [wool, wool, wool]]);
	recipes.addShaped("wool15", <minecraft:wool:15> * 8, [[wool, wool, wool],[wool, <ore:dyeBlack>, wool], [wool, wool, wool]]);
	
# Nametag
	recipes.addShaped("Nametag", 
	<minecraft:name_tag>, 
	[[null, <ore:paper>, <ore:cropFlax>],
	[<ore:paper>, <ore:dyeBlack>, <ore:paper>], 
	[<ore:paper>, <ore:paper>, null]]);

# Remove extraneous (and OP) Paper recipes
  recipes.removeByRecipeName("minecraft:paper"); # Removed because EnderCore adds a shapeless one
  recipes.removeByRecipeName("mekanism:paper"); # Removed because CHEATS
	
# [Elytra] from [Purpur Shards][+3]
recipes.removeShaped(<minecraft:elytra>);
craft.make(<minecraft:elytra>, ["pretty",
  "A   A",
  "A C A",
  "X   X"], {
  "A": <endreborn:item_angel_feather>, # Angel Feather
  "C": <minecraft:web>,                # Cobweb
  "X": <endreborn:death_essence>,      # Xorcite Shard
});

# Farming for Blockheads Market
	recipes.remove(<farmingforblockheads:market>);
	recipes.remove(<harvestcraft:market>);
	recipes.addShaped("Farming for Blockheads Market", 
	<farmingforblockheads:market>, 
	[[<ore:plankWood>, <ore:blockWool>, <ore:plankWood>],
	[<ore:logWood>, <ore:blockEmerald>, <ore:logWood>], 
	[<ore:logWood>, <ore:logWood>, <ore:logWood>]]);
	
# Pam's Lavender Shortbread
	recipes.remove(<harvestcraft:lavendershortbreaditem>);
	recipes.addShapeless("Pam's Harvestcraft Lavender Shortbread",
	<harvestcraft:lavendershortbreaditem>, 
	[<ore:toolBakeware>, <ore:foodDough>, <ore:flowerLavender>]);
	
# Dragon Egg
	recipes.addShaped("Dragon Egg", 
	<minecraft:dragon_egg>, 
	[[<ore:elvenDragonstone>, <ore:egg>, <ore:elvenDragonstone>],
	[<draconicevolution:dragon_heart>, <mysticalagradditions:stuff:3>, <draconicevolution:dragon_heart>], 
	[<ore:elvenDragonstone>, <ore:egg>, <ore:elvenDragonstone>]]);
	
# Minecraft Boats from oreDict planks
	recipes.addShaped("Boat", 
	<minecraft:boat>, 
	[[<ore:plankWood>, null, <ore:plankWood>], 
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]]);
		
# Wither Dust
	recipes.remove(<darkutils:material>);
	recipes.addShapeless("Wither Dust1", <darkutils:material> * 6, [<ore:boneWither>, <ore:boneWither>]);
	recipes.addShapeless("Wither Dust2", <darkutils:material> * 9, [<minecraft:skull:1>]);
	recipes.addShapeless("Wither Dust3", <darkutils:material> * 4, [<ore:blockWither>]);

# Chest

	# Logs defined by Quark
	val excludeLogs as IItemStack[] = [
		<minecraft:log>,
		<minecraft:log:1>,
		<minecraft:log:2>,
		<minecraft:log:3>,
		<minecraft:log2>,
		<minecraft:log2:1>
	];

	# Ingredient of all possible logs except listed above
	var logsFiltered as IIngredient = <minecraft:log>;
	for log in <ore:logWood>.items{
		var isAdd = true;
		for i in 0 to excludeLogs.length{
			if((log has excludeLogs[i]) || (excludeLogs[i] has log)){
				isAdd = false;
			}
		}
		if (isAdd){
			logsFiltered = logsFiltered.or(log);
		}
	}

	function remakeChest(name as string, chest as IItemStack, log as IIngredient) {

		recipes.remove(chest);

		recipes.addShapedMirrored(name, chest * 2, 
		[[log, <ore:plankTreatedWood>, log],
		[<ore:plankTreatedWood>, <minecraft:stone_button>, <ore:plankTreatedWood>], 
		[log, <ore:plankTreatedWood>, log]]);
		
		val toolRod = <tconstruct:tough_tool_rod>.withTag({Material: "wood"});
		recipes.addShaped("Cheap " ~ name, chest,
		[[log, toolRod, log],
		[toolRod, <minecraft:stone_button>, toolRod], 
		[log, toolRod, log]]);
	}

# Quark chests
  remakeChest("Spruce Chest"  , <quark:custom_chest>  , <minecraft:log:1>);
  remakeChest("Birch Chest"   , <quark:custom_chest:1>, <minecraft:log:2>);
  remakeChest("Jungle Chest"  , <quark:custom_chest:2>, <minecraft:log:3>);
  remakeChest("Acacia Chest"  , <quark:custom_chest:3>, <minecraft:log2>);
  remakeChest("Dark Oak Chest", <quark:custom_chest:4>, <minecraft:log2:1>);

# Chest from any log
	remakeChest("Any Chest", <minecraft:chest>, logsFiltered);

	
	recipes.addShaped("Mini Chest To Chest",
	<minecraft:chest>, 
	[[<extrautils2:minichest>, <extrautils2:minichest>, <extrautils2:minichest>],
	[<extrautils2:minichest>, <extrautils2:minichest>, <extrautils2:minichest>], 
	[<extrautils2:minichest>, <extrautils2:minichest>, <extrautils2:minichest>]]);
	
# Chest to chest
	recipes.addShapeless("Chest Conversion", <minecraft:chest> * 2, [<ore:chest>, <ore:chest>]);

# [Ender Chest] from [Ender Chest][+5]
craft.remake(<enderstorage:ender_storage>, ["pretty",
  "C E C",
  "M n M",
  "▬ ▲ ▬"], {
  "▲": <ore:dustWither>,          # Wither Ash
  "C": <minecraft:web>,           # Cobweb
  "E": <ore:nuggetEnderium>,      # Enderium Nugget
  "▬": <ore:ingotArdite>,         # Ardite Ingot
  "M": <tconstruct:materials:19>, # Mending Moss
  "n": <ore:chestEnder>,          # Ender Chest
});

# [Ender Tank] from [Crucible][+5]
craft.remake(<enderstorage:ender_storage:1>, ["pretty",
  "C E C",
  "M r M",
  "▬ ▲ ▬"], {
  "▲": <ore:dustWither>,          # Wither Ash
  "r": <thaumcraft:crucible>,     # Crucible
  "C": <minecraft:web>,           # Cobweb
  "E": <ore:nuggetEnderium>,      # Enderium Nugget
  "▬": <ore:ingotArdite>,         # Ardite Ingot
  "M": <tconstruct:materials:19>, # Mending Moss
});

# [Ender Pouch] from [Mending Moss][+5]
craft.remake(<enderstorage:ender_pouch>, ["pretty",
  "C E C",
  "H M H",
  "▬ ▲ ▬"], {
  "▲": <ore:dustWither>,                   # Wither Ash
  "C": <minecraft:web>,                    # Cobweb
  "E": <extendedcrafting:material:37>,     # Ender Nugget
  "H": <harvestcraft:hardenedleatheritem>, # Hardened Leather
  "▬": <ore:ingotArdite>,                  # Ardite Ingot
  "M": <tconstruct:materials:19>,          # Mending Moss
});

# Cauldron
	recipes.remove(<minecraft:cauldron>);
	recipes.addShapedMirrored("Iron Cauldron", 
	<minecraft:cauldron>, 
	[[<ore:plateIron>, null, <ore:plateIron>],
	[<ore:plateIron>, null, <ore:plateIron>], 
	[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>]]);

	recipes.addShapedMirrored("Aluminum Cauldron", 
	<minecraft:cauldron>, 
	[[<ore:plateAluminum>, null, <ore:plateAluminum>],
	[<ore:plateAluminum>, null, <ore:plateAluminum>], 
	[<ore:plateAluminum>, <ore:plateAluminum>, <ore:plateAluminum>]]);

# [Furnace] from [Coal][+2]
	craft.remake(<minecraft:furnace>, ["pretty",
		"░ ░ ░",
		"S ☺ S",
		"░ ░ ░"], {
		"░": <ore:cobblestone>, # Cobblestone
		"S": <ore:gearStone>,   # Stone Gear
		"☺": <minecraft:coal:*>|<actuallyadditions:item_misc:22>, # Coal
	});

# Hopper
	recipes.remove(<minecraft:hopper>);
	recipes.addShaped("Hopper Aluminum",
	<minecraft:hopper>, 
	[[<ore:plateAluminum>, null, <ore:plateAluminum>],
	[<ore:plateAluminum>, <ore:chest>, <ore:plateAluminum>], 
	[null, <ore:plateAluminum>, null]]);
	
	recipes.addShaped("Hopper Iron",
	<minecraft:hopper>, 
	[[<ore:plateIron>, null, <ore:plateIron>],
	[<ore:plateIron>, <ore:chest>, <ore:plateIron>], 
	[null, <ore:plateIron>, null]]);

# Sticks
	recipes.remove(<minecraft:stick>);
	recipes.addShapedMirrored("Sticks", 
	<minecraft:stick> * 2, 
	[[<ore:plankWood>], 
	[<ore:plankWood>]]);
	
	recipes.addShapedMirrored("Sticks from logs", 
	<minecraft:stick> * 4, 
	[[<ore:logWood>],
	[<ore:logWood>]]);
	
# Bucket
	recipes.remove(<minecraft:bucket>);
	recipes.addShaped("Bucket", 
	<minecraft:bucket>, 
	[[<ore:plateIron>, null, <ore:plateIron>], 
	[null, <ore:plateIron>, null]]);
					
# *======= Metal Nuggets =======*

	utils.rh(<immersiveengineering:metal:29>);
	utils.rh(<immersiveengineering:metal:20>);
	utils.rh(<immersiveengineering:metal:21>);
	utils.rh(<immersiveengineering:metal:22>);
	utils.rh(<immersiveengineering:metal:23>);
	utils.rh(<immersiveengineering:metal:24>);
	utils.rh(<immersiveengineering:metal:26>);
	utils.rh(<immersiveengineering:metal:27>);
	utils.rh(<immersiveengineering:metal:28>);
	utils.rh(<extendedcrafting:material:128>);
	utils.rh(<extendedcrafting:material:129>);
	

# *======= Recycles =======*

# Arrows recycle
scripts.process.crush(<minecraft:arrow>, <minecraft:flint>, "no exceptions", [<ore:dustWood>.firstItem], [0.2f]);


# Ore Excavation
craft.remake(<oeintegration:excavatemodifier>, ["pretty",
	"D D D",
	"A B C",
	"E E E"], {
	A: <ore:compressed3xDirt>,
	B: <ore:compressed3xCobblestone>,
	C: <ore:compressed3xNetherrack>,
	D: <tconstruct:excavator_head>.withTag({Material: "bronze"}),
	E: <tconstruct:sharpening_kit>.withTag({Material: "stone"}),
});

# Remove Refined storage cables
if(isNull(loadedMods["refinedstorage"])) {
	utils.rh(<immersivecables:coil_block:3>);
	utils.rh(<immersivecables:wire_coil:3>);
}

# Make Quicksand
scripts.wrap.inworldcrafting.FluidToFluid.transform(<liquid:sand>, <liquid:blueslime>, [<ore:soulSand>]);
scripts.process.solution([<ore:soulSand>], [<liquid:blueslime>*1000], [<liquid:sand>*1000], null, "except: highoven");

# Bedrock Ore Miner
craft.remake(<bedrockores:bedrock_miner>, [
	"ABA", 
	"CDC", 
	"ADA"], {
	A: <ore:dustBedrock>,
	B: <immersiveengineering:metal_decoration0:5>,
	C: <ore:blockRedstone>,
	D: <immersiveengineering:metal_device1:7>});

# [Sandwich_Station] from [Cooking_Table][+3]
recipes.remove(<culinaryconstruct:sandwich_station>);
scripts.wrap.extendedcrafting.TableCrafting.addShaped(0,
<culinaryconstruct:sandwich_station>, Grid(["pretty",
  "  T  ",
  "F C F",
  "K K K"], {
  "C": <cookingforblockheads:cooking_table>, # Cooking Table
  "T": <rats:tiny_coin>,                     # Tiny Coin
  "F": <nuclearcraft:foursmore>,             # FourS'more QuadS'mingot
  "K": <cookingforblockheads:counter>        # Kitchen Counter
}).shaped());

# Peacock fan
recipes.addShaped(<twilightforest:peacock_fan>, [
	[<ore:peacockFeathers>, <ore:peacockFeathers>, null], 
	[<forestry:oak_stick>, <forestry:oak_stick>, <ore:peacockFeathers>], 
	[<ore:slimecrystalBlue>, <forestry:oak_stick>, <ore:peacockFeathers>]
]);

# Lesser blaze powder
recipes.removeShapeless(<minecraft:blaze_powder>, [<minecraft:blaze_rod>]);
recipes.addShapeless("harder_blaze_dust", <minecraft:blaze_powder>, [<minecraft:blaze_rod>]);

# Harder vanilla recipe
recipes.remove(<minecraft:flint_and_steel>);
recipes.addShapeless(<minecraft:flint_and_steel>, [<ore:ingotSteel>, <ore:itemFlint>]);

# ------ Silicon unification ------

var trueSilicon = <appliedenergistics2:material:5>;
<ore:itemSilicon>.remove([<nuclearcraft:gem:6>, <libvulpes:productingot:3>, <enderio:item_material:5>]);
<ore:ingotSilicon>.add(trueSilicon);

# Removing
furnace.remove(<appliedenergistics2:material:5>); # Furnance quartz dusts -> AE silicon
mods.nuclearcraft.manufactory.removeRecipeWithOutput(<appliedenergistics2:material:5>); # Ingot->AE
mods.mekanism.crusher.removeRecipe(<nuclearcraft:gem:6>); # Sand -> silicon


# Addition
furnace.addRecipe(trueSilicon, <ore:dustCertusQuartz>, 4.0d);
furnace.addRecipe(trueSilicon, <ore:dustNetherQuartz>, 4.0d);
scripts.wrap.thermalexpansion.Compactor.addMintRecipe(trueSilicon * 2, <minecraft:sand>, 4000);

# Tallow into biomass
scripts.process.melt(<ore:tallow>, <liquid:biomass> * 10, "No Exceptions");

# Molten Cheese
scripts.process.melt(<ore:cheeseWheels>|<ore:blockCheese>, <liquid:cheese> * 1000, "No Exceptions");
scripts.process.melt(<ore:foodCheese>, <liquid:cheese> * 250, "No Exceptions");
scripts.wrap.tconstruct.Casting.addBasinRecipe(<rats:block_of_cheese>, null, <liquid:cheese>, 1000);

# Hardened Ice Unification
craft.make(<biomesoplenty:hard_ice> * 8, ["AAA","A A","AAA"], {A: <mysticalagriculture:ice_essence>});
scripts.process.compress(<minecraft:packed_ice> * 2, <biomesoplenty:hard_ice>, "No Exceptions");

# Remove Glass pane non-oredict recipe
recipes.removeByRecipeName("minecraft:glass_pane");

# Nerf torches from Light level 14
<minecraft:torch>.asBlock().definition.lightLevel = 0.7f;

# Prevent melting dupe
craft.remake(<quark:obsidian_pressure_plate>, ["AA","AA"], {A: <ore:obsidian>});

# Conflict recipes
recipes.removeByRecipeName("quark:basalt_1");

<minecraft:cake>.maxStackSize = 64;

# Compressed chest
recipes.remove(<extrautils2:largishchest>);
utils.compact(<ore:chest>, <extrautils2:largishchest>);

# Sunshine from Sun conglomerate
mods.mechanics.addTubeRecipe([<contenttweaker:conglomerate_of_sun>], <liquid:liquid_sunshine> * 1000);

# Life Essence from Sun conglomerate
mods.mechanics.addTubeRecipe([<contenttweaker:conglomerate_of_life>], <liquid:lifeessence> * 1000);
	
# Silicon Block
craft.shapeless(<contenttweaker:silicon_block>, "AAAAAAAAA", {A: <ore:ingotSilicon>});
craft.shapeless(<libvulpes:productingot:3> * 9,   "A", {A: <contenttweaker:silicon_block>});

# [Conglomerate_Of_Life*4] from [Soul_Vial][+4]
var lambNames as string[] = [
  "animania:lamb_dorper",
  "animania:lamb_dorset",
  "animania:lamb_friesian",
  "animania:lamb_jacob",
  "animania:lamb_merino",
  "animania:lamb_suffolk"
];
var anyLambIngredient = <enderio:item_soul_vial:1>.withTag({entityId: lambNames[0]});
for i in 1 to lambNames.length {
	anyLambIngredient = anyLambIngredient.or(<enderio:item_soul_vial:1>.withTag({entityId: lambNames[i]}));
}
craft.make(<contenttweaker:conglomerate_of_life> * 4, ["pretty",
  "D B D",
  "▲ S ▲",
  "D C D"], {
  "▲": <iceandfire:pixie_dust>,             # Pixie Dust
  "B": <randomthings:rezstone>,             # Blood Stone
  "S": anyLambIngredient, # Soul Vial
  "C": <cyclicmagic:crystallized_obsidian>, # Crystallized Obsidian
  "D": <iceandfire:dragon_meal>             # Dragon Meal
});

# [Conglomerate_Of_Sun*8] from [Totem_of_Undying][+3]
craft.make(<contenttweaker:conglomerate_of_sun> * 8, ["pretty",
  "R o R",
  "C T C",
  "R o R"], {
  "R": <ore:myrmexResin>,                # Desert Myrmex Resin Chunk
  "C": <cyclicmagic:crystallized_amber>, # Crystallized Amber
  "T": <minecraft:totem_of_undying>,     # Totem of Undying
  "o": <ore:dropRoyalJelly>              # Royal Jelly
});

# Saturate Phosphor
scripts.process.fill(<contenttweaker:empowered_phosphor>, <fluid:syngas> * 1000, <contenttweaker:saturated_phosphor>, "only: MechanicalDryingBasin NCInfuser Transposer");

# [Empowered Phosphor] from [Phosphor][+1]
scripts.process.alloy([<contenttweaker:blasted_coal>, <forestry:phosphor>], <contenttweaker:empowered_phosphor>, "Only: Kiln Induction");


scripts.wrap.inworldcrafting.ExplosionCrafting.explodeBlockRecipe(<contenttweaker:blasted_coal> * 2, <contenttweaker:conglomerate_of_coal>);
craft.make(<contenttweaker:conglomerate_of_coal>, ["pretty",
  "L B L",
  "▲ i ▲",
  "L B L"], {
  "▲": <mechanics:fuel_dust_tiny>,      # Tiny Pile of Heavy Fuel Dust
  "B": <randomthings:ingredient:13>,    # Blackout Powder
  "i": <forestry:bituminous_peat>,      # Bituminous Peat
  "L": <rats:little_black_squash_balls> # Little Black Squash Balls
});

# Red sand harder (for sieves)
mods.tconstruct.Casting.removeBasinRecipe(<minecraft:sand:1>);
scripts.wrap.tconstruct.Casting.addBasinRecipe(<minecraft:sand:1>, <exnihilocreatio:block_granite_crushed>, <liquid:blood>, 10, true);

/* 
# Knowledge absorber craft
# [Golden eye] from [Ender Orb Translocator][+3]
craft.make(<contenttweaker:knowledge_absorber>, ["pretty",
  "  *  ",
  "L E L",
  "  R  "], {
  "*": <extrautils2:suncrystal>,  # Sun Crystal
  "L": <ore:shardLormyte>,        # Lormyte Crystal
  "E": <cyclicmagic:ender_pearl_mounted>.anyDamage(), # Ender Orb Translocator
  "R": <ore:itemResin>, # Sticky Resin
});

# Oh my gold, this hack!
# I cant use random() function, because it would return different values
# on client and server, that would result ingredient being
# dissapearing on one side and persist on another.
# This code not perfect any way - it would give different values
# when playing on server. But it would be happen stable amount of times.
static absorber_crafts_count as long[crafttweaker.world.IWorld] = {} as long[crafttweaker.world.IWorld];

val transformedAbsorber = <contenttweaker:knowledge_absorber>.anyDamage().transform(function(item, player) {
	absorber_crafts_count[player.world] =
		!isNull(absorber_crafts_count[player.world]) ? absorber_crafts_count[player.world] as long + 1 : 1;

	val damaged = (item.damage) < item.maxDamage
		? item.withDamage(item.damage + 1)
		: null;

	if(!item.isEnchanted || item.enchantments.length < 1) return damaged;

	for ench in item.enchantments {
		if(ench.definition != <enchantment:minecraft:unbreaking>) continue;
		return (
			(player.world.time + absorber_crafts_count[player.world] as long) % ((ench.level + 1) as long) != 0
		) ? item : damaged;
	}
	return damaged;
});

# Create "Void Miner" recipes by animals
for mobName, arr in {
	Cow     : [<ore:endstone>, <netherendingores:ore_end_modded_1:11>],
	Pig     : [<ore:endstone>, <netherendingores:ore_end_vanilla:3>],
	Cat     : [<ore:endstone>, <endreborn:block_wolframium_ore>],
	Enderman: [<ore:endstone>, <endreborn:dragon_essence>],
	Chicken : [<ore:endstone>, <netherendingores:ore_end_vanilla:6>],
	Dog     : [<ore:stone>,    <actuallyadditions:block_misc:3>],
	Sheep   : [<ore:stone>,    <forestry:resources>],
	Creeper : [<ore:endstone>, <netherendingores:ore_end_vanilla:1>],
	Zombie  : [<ore:endstone>, <netherendingores:ore_end_modded_1:12>],
} as IIngredient[][string] {
	val book = scripts._init.variables.bookWrittenBy_ingr[mobName];
	if(arr.length < 2 || isNull(arr[0]) || isNull(arr[1]) || isNull(book)) continue;
	val input = arr[0];
	val output = arr[1].itemArray[0];
	recipes.addShapeless("knowledge_absorber_"~mobName, output * 7, [
		input, book, input,
		input, transformedAbsorber, input, 
		input, input, input,
	]);
}
 */