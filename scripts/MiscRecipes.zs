import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.item.IIngredient;
import mods.jei.JEI.removeAndHide as rh;
import scripts.craft.grid.Grid;

#priority -1

# Eclipsed Clock
	recipes.remove(<randomthings:eclipsedclock>);
	recipes.addShapedMirrored("Eclipsed Clock", 
	<randomthings:eclipsedclock>, 
	[[<mekanism:otherdust:5>, <minecraft:clock>, <mekanism:otherdust:5>],
	[<minecraft:clock>, <ore:netherStar>, <minecraft:clock>], 
	[<mekanism:otherdust:5>, <minecraft:clock>, <mekanism:otherdust:5>]]);

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
	recipes.addShapeless("BoP Amber", 
	<biomesoplenty:gem:7>, [<thaumcraft:amber>]);
	recipes.addShapeless("Thaumcraft Amber", 
	<thaumcraft:amber>, [<biomesoplenty:gem:7>]);

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

# OpenBlocks Glider
	recipes.remove(<openblocks:generic>);
	recipes.remove(<openblocks:hang_glider>);
	
	recipes.addShapedMirrored("Glider Wings", 
	<openblocks:generic>, 
	[[<harvestcraft:hardenedleatheritem>, <forestry:oak_stick>, null],
	[<harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>, <forestry:oak_stick>], 
	[<harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>]]);
	
	recipes.addShapedMirrored("Hang Glider", 
	<openblocks:hang_glider>, 
	[[null, null, null],
	[<openblocks:generic>, <forestry:oak_stick>, <openblocks:generic>], 
	[null, null, null]]);
	
# Mud conversion
	recipes.remove(<animania:block_mud>);
	recipes.addShapeless("BoP Mud", <biomesoplenty:mud>, [<animania:block_mud>]);
	recipes.addShapeless("Animania Mud", <animania:block_mud>, [<biomesoplenty:mud>]);

# Iridium conversion
	recipes.addShapeless(<thermalfoundation:material:135>, [<ic2:misc_resource:1>]);
	recipes.addShapeless(<ic2:misc_resource:1>, [<thermalfoundation:material:135>]);
	
# Graphite conversion 
	recipes.addShapeless("Graphite Conversion 1", <bigreactors:ingotgraphite>, [<nuclearcraft:ingot:8>]);
	recipes.addShapeless("Graphite Conversion 2", <nuclearcraft:ingot:8>, [<bigreactors:ingotgraphite>]);
	
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
	recipes.addShapedMirrored("Piston1", <minecraft:piston> * 2, [[<ore:plankTreatedWood>, <ore:plankTreatedWood>, <ore:plankTreatedWood>],[<ore:compressed1xCobblestone>, <ore:plateIron>, <ore:compressed1xCobblestone>], [<ore:compressed1xCobblestone>, <ore:alloyBasic>, <ore:compressed1xCobblestone>]]);
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
	
# Elytra
	recipes.addShaped("Elytra", 
	<minecraft:elytra>, 
	[[<minecraft:banner:15>, <minecraft:leather_chestplate>.anyDamage(), <minecraft:banner:15>],
	[<minecraft:banner:15>, <minecraft:chorus_fruit_popped>, <minecraft:banner:15>], 
	[<actuallyadditions:item_crystal:2>, null, <actuallyadditions:item_crystal:2>]]);

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

# EnderStorage Ender Chest
	recipes.remove(<enderstorage:ender_storage>);
	recipes.addShapedMirrored("Ender Chest", 
	<enderstorage:ender_storage>, 
	[[<ore:rodBlaze>, <darkutils:material>, <ore:rodBlaze>],
	[<ore:obsidian>, <minecraft:ender_chest>, <ore:obsidian>], 
	[<ore:ingotArdite>, <ore:enderpearl>, <ore:ingotArdite>]]);

# EnderStorage Ender Tank
	recipes.remove(<enderstorage:ender_storage:1>);
	recipes.addShapedMirrored("Ender Tank",
	<enderstorage:ender_storage:1>, 
	[[<ore:ingotArdite>, <darkutils:material>, <ore:ingotArdite>],
	[<ore:obsidian>, <minecraft:cauldron>, <ore:obsidian>], 
	[<ore:rodBlaze>, <ore:enderpearl>, <ore:rodBlaze>]]);

# Ender Pouch
	recipes.remove(<enderstorage:ender_pouch>);
	recipes.addShapedMirrored("Ender Pouch", 
	<enderstorage:ender_pouch>, 
	[[<ore:powderBlaze>, <harvestcraft:hardenedleatheritem>, <ore:powderBlaze>],
	[<harvestcraft:hardenedleatheritem>, <ore:enderpearl>, <harvestcraft:hardenedleatheritem>], 
	[<ore:ingotArdite>, <darkutils:material>, <ore:ingotArdite>]]);

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

# Furnace
	recipes.remove(<minecraft:furnace>);
	recipes.addShapedMirrored("Furnace", 
	<minecraft:furnace>, 
	[[<ore:compressed1xCobblestone>, <ore:cobblestone>, <ore:compressed1xCobblestone>],
	[<ore:gearStone>, <minecraft:coal:*>, <ore:gearStone>], 
	[<ore:compressed1xCobblestone>, <ore:cobblestone>, <ore:compressed1xCobblestone>]]);

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

	rh(<immersiveengineering:metal:29>);
	rh(<immersiveengineering:metal:20>);
	rh(<immersiveengineering:metal:21>);
	rh(<immersiveengineering:metal:22>);
	rh(<immersiveengineering:metal:23>);
	rh(<immersiveengineering:metal:24>);
	rh(<immersiveengineering:metal:26>);
	rh(<immersiveengineering:metal:27>);
	rh(<immersiveengineering:metal:28>);
	rh(<extendedcrafting:material:128>);
	rh(<extendedcrafting:material:129>);
	


# *======= Traveler's Backpacks =======*
recipes.remove(<travelersbackpack:hose>);
recipes.addShaped(<travelersbackpack:hose>, [
	[<travelersbackpack:hose_nozzle>, <ore:itemRubber>, <ore:itemRubber>],
	[null, null, <ore:itemRubber>],
	[null, null, <ore:dyeGreen>]]);

recipes.remove(<travelersbackpack:backpack_tank>);
recipes.addShaped(<travelersbackpack:backpack_tank>, [
	[<ic2:casing:3>],
	[<openblocks:tank>],
	[<ic2:casing:3>]]);

# Remake Sleeping bag (prevent conflict)
remakeEx(<travelersbackpack:sleeping_bag_bottom>, [[<quark:quilted_wool:14>, <quark:quilted_wool:14>, <quark:quilted_wool>]]);


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
rh(<immersivecables:coil_block:3>);
rh(<immersivecables:wire_coil:3>);

# Make Quicksand
mods.inworldcrafting.FluidToFluid.transform(<liquid:sand>, <liquid:blueslime>, [<ore:soulSand>]);
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

# Tool pouch
craft.remake(<toolbelt:pouch>, ["ABA", "CDC", "CCC"], {
	A: <ore:string>,
	B: <quark:gold_button>,
	C: <harvestcraft:hardenedleatheritem>,
	D: <immersiveengineering:wooden_device0>});

# Tool Belts
craft.remake(<toolbelt:belt>, [" A ", "CBC", "C C"], {
	A: <conarm:travel_belt_base>,
	B: <quark:iron_button>,
	C: <harvestcraft:hardenedleatheritem>});

# Lesser blaze powder
craft.reshapeless(<minecraft:blaze_powder>, "A", { A: <minecraft:blaze_rod>, remove: <minecraft:blaze_powder>*2});

# Harder vanilla recipe
recipes.remove(<minecraft:flint_and_steel>);
recipes.addShapeless(<minecraft:flint_and_steel>, [<ore:ingotSteel>, <ore:itemFlint>]);

# *=======  =======*

# More meats from traps
mods.harvestcrafttweaker.HarvestCraftTweaker.addGroundTrap(<ore:foodCheese>, [<rats:raw_rat>, <rats:rat_pelt>]);
mods.harvestcrafttweaker.HarvestCraftTweaker.addGroundTrap(<animania:block_straw>, [
	<twilightforest:raw_venison>,
	<betteranimalsplus:venisonraw>,
	<betteranimalsplus:pheasantraw>,
	<betteranimalsplus:pheasant_egg>,
	<betteranimalsplus:turkey_egg>,
	<betteranimalsplus:goose_egg>,
	<betteranimalsplus:turkey_leg_raw>,
]);

# More traps
mods.harvestcrafttweaker.HarvestCraftTweaker.addWaterTrap(<thermalfoundation:bait>,   [<betteranimalsplus:crab_meat_raw>, <betteranimalsplus:eel_meat_raw>]);
mods.harvestcrafttweaker.HarvestCraftTweaker.addWaterTrap(<thermalfoundation:bait:1>, [<iceandfire:shiny_scales>, <betteranimalsplus:blubber>]);
mods.harvestcrafttweaker.HarvestCraftTweaker.addWaterTrap(<thermalfoundation:bait:2>, [
	<iceandfire:sea_serpent_scales_blue>,
	<iceandfire:sea_serpent_scales_bronze>,
	<iceandfire:sea_serpent_scales_deepblue>,
	<iceandfire:sea_serpent_scales_purple>,
	<iceandfire:sea_serpent_scales_red>,
	<iceandfire:sea_serpent_scales_teal>,
	<iceandfire:sea_serpent_scales_green>,
]);


# ------ Silicon unification ------

var trueSilicon = <appliedenergistics2:material:5>;
<ore:itemSilicon>.remove([<nuclearcraft:gem:6>, <libvulpes:productingot:3>, <enderio:item_material:5>]);
<ore:ingotSilicon>.add(trueSilicon);

# Removing
furnace.remove(<appliedenergistics2:material:5>); # Furnance quartz dusts -> AE silicon
mods.nuclearcraft.manufactory.removeRecipeWithOutput(<appliedenergistics2:material:5>); # Ingot->AE
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, <libvulpes:productplate:3>); # Plate -> ingot (prevent dupe)
mods.mekanism.crusher.removeRecipe(<nuclearcraft:gem:6>); # Sand -> silicon


# Addition
furnace.addRecipe(trueSilicon, <ore:dustCertusQuartz>, 4.0d);
furnace.addRecipe(trueSilicon, <ore:dustNetherQuartz>, 4.0d);
scripts.wrap.thermalexpansion.Compactor.addMintRecipe(trueSilicon * 2, <minecraft:sand>, 4000);

# Quest Book -> Patchouli book
recipes.addShapeless("Patchouli book", <patchouli:guide_book>.withTag({"patchouli:book": "patchouli:e2e_e"}), [<questbook:itemquestbook>]);

# Tallow into biomass
scripts.process.melt(<ore:tallow>, <liquid:biomass> * 200, "No Exceptions");

# Molten Cheese
scripts.process.melt(<ore:cheeseWheels>|<ore:blockCheese>, <liquid:cheese> * 1000, "No Exceptions");
scripts.process.melt(<ore:foodCheese>|<actuallyadditions:item_food>, <liquid:cheese> * 250, "No Exceptions");
scripts.wrap.tconstruct.Casting.addBasinRecipe(<rats:block_of_cheese>, null, <liquid:cheese>, 1000);

# Hardened Ice Unification
craft.make(<biomesoplenty:hard_ice> * 8, ["AAA","A A","AAA"], {A: <mysticalagriculture:ice_essence>});
scripts.process.compress(<minecraft:packed_ice> * 2, <biomesoplenty:hard_ice>, "No Exceptions");

# Ice balls
scripts.process.mash(<biomesoplenty:hard_ice>, <mctsmelteryio:iceball> * 8, "No Exceptions");

# Remove wrong grinding recipe
mods.appliedenergistics2.Grinder.removeRecipe(<minecraft:ender_pearl>);
mods.appliedenergistics2.Grinder.removeRecipe(<thermalfoundation:material:895>);
scripts.process.crush(<ore:enderpearl>, <appliedenergistics2:material:46>, "Except: Pulverizer PulseCentrifuge", null, null);

# Milk Powder
scripts.process.evaporate(<fluid:milk> * 250, <ic2:dust:33>, "No exceptions");
scripts.process.solution([<ic2:dust:33>], [<fluid:water> * 250], [<fluid:milk> * 250], null, "Except: highoven");

# Remove Glass pane non-oredict recipe
recipes.removeByRecipeName("minecraft:glass_pane");

# Quarts dust wrong recipes
val qwrong = <nuclearcraft:gem_dust:2>;
val qdust = <appliedenergistics2:material:3>;
recipes.removeByRecipeName("thermalfoundation:gem_dust");
craft.shapeless(qdust, "AB", {
	A: <ore:oreQuartz>,
	B: <ore:dustPetrotheum>,
});
mods.bloodmagic.AlchemyTable.removeRecipe([<minecraft:quartz_ore>, <bloodmagic:cutting_fluid>]);
mods.appliedenergistics2.Grinder.removeRecipe(<minecraft:quartz_ore>);
mods.immersiveengineering.Crusher.removeRecipesForInput(<minecraft:quartz>);
mods.mekanism.crusher.removeRecipe(qwrong);
mods.appliedenergistics2.Grinder.removeRecipe(<minecraft:quartz>);
scripts.process.crush(<ore:gemQuartz>, qdust, "only: iecrusher aegrinder mekcrusher", null, null);

# Nerf torches from Light level 14
<minecraft:torch>.asBlock().definition.lightLevel = 0.7f;