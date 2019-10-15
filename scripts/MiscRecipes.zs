import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
print("--- loading MiscRecipes.zs ---");

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

# Twilight Forest Uncrafting Table
	rh(<twilightforest:uncrafting_table>);
	
# Cyclic Guide
	recipes.addShapeless("Cyclic Guide", 
	<guideapi:cyclicmagic-guide>, 
	[<minecraft:book>,<cyclicmagic:carbon_paper>]);
	
# Blood Magic Guide
	recipes.addShapeless("Blood Magic Guide", 
	<guideapi:bloodmagic-guide>, 
	[<minecraft:book>,<bloodmagic:soul_snare>]);
	
# Animania Random Animal Spawn Egg
	mods.forestry.Carpenter.addRecipe(<animania:entity_egg_random>, 
	[[null , <cyclicmagic:sprout_seed>, null],
	[<ore:egg>,<ore:egg>,<ore:egg>],
	[null, <cyclicmagic:sprout_seed>, null]], 
	40, <liquid:meat> * 500);
	
	mods.forestry.Carpenter.addRecipe(<animania:entity_egg_random>, 
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
	
# Silicon conversion
	recipes.addShapeless(<enderio:item_material:5> * 2, [<libvulpes:productingot:3>, <libvulpes:productingot:3>]);
	recipes.addShapeless(<libvulpes:productingot:3>, [<enderio:item_material:5>]);
	
# Iridium conversion
	recipes.addShapeless(<thermalfoundation:material:135>, [<ic2:misc_resource:1>]);
	recipes.addShapeless(<ic2:misc_resource:1>, [<thermalfoundation:material:135>]);
	
# Graphite conversion 
	recipes.addShapeless("Graphite Conversion 1", <bigreactors:ingotmetals:2>, [<nuclearcraft:ingot:8>]);
	recipes.addShapeless("Graphite Conversion 2", <nuclearcraft:ingot:8>, [<bigreactors:ingotmetals:2>]);
	
	recipes.addShapeless("Graphite Conversion 3", <bigreactors:blockmetals:2> * 2, [<nuclearcraft:ingot_block:8>, <nuclearcraft:ingot_block:8>]);
	recipes.addShapeless("Graphite Conversion 4", <nuclearcraft:ingot_block:8> * 2, [<bigreactors:blockmetals:2>, <bigreactors:blockmetals:2>]);

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
	recipes.remove(<minecraft:chest>);
	recipes.addShapedMirrored("Chest",
	<minecraft:chest> * 2, 
	[[<ore:logWood>, <ore:plankTreatedWood>, <ore:logWood>],
	[<ore:plankTreatedWood>, <minecraft:stone_button>, <ore:plankTreatedWood>], 
	[<ore:logWood>, <ore:plankTreatedWood>, <ore:logWood>]]);
	
	recipes.addShaped("Cheap Chest",
	<minecraft:chest>, 
	[[<ore:logWood>, <tconstruct:tough_tool_rod>.withTag({Material: "wood"}), <ore:logWood>],
	[<tconstruct:tough_tool_rod>.withTag({Material: "wood"}), <minecraft:stone_button>, <tconstruct:tough_tool_rod>.withTag({Material: "wood"})], 
	[<ore:logWood>, <tconstruct:tough_tool_rod>.withTag({Material: "wood"}), <ore:logWood>]]);

	
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
	[<ore:plateAluminum>, <minecraft:chest>, <ore:plateAluminum>], 
	[null, <ore:plateAluminum>, null]]);
	
	recipes.addShaped("Hopper Iron",
	<minecraft:hopper>, 
	[[<ore:plateIron>, null, <ore:plateIron>],
	[<ore:plateIron>, <minecraft:chest>, <ore:plateIron>], 
	[null, <ore:plateIron>, null]]);
	
# Planks
	recipes.remove(<ore:plankWood>);
	recipes.addShapeless("Planks", <minecraft:planks> * 2, [<minecraft:log>]);
	recipes.addShapeless("Planks1", <minecraft:planks:1> * 2, [<minecraft:log:1>]);
	recipes.addShapeless("Planks2", <minecraft:planks:2> * 2, [<minecraft:log:2>]);
	recipes.addShapeless("Planks3", <minecraft:planks:3> * 2, [<minecraft:log:3>]);
	recipes.addShapeless("Planks4", <minecraft:planks:4> * 2, [<minecraft:log2>]);
	recipes.addShapeless("Planks5", <minecraft:planks:5> * 2, [<minecraft:log2:1>]);
	recipes.addShapeless("Planks6", <rustic:planks> * 2,[<rustic:log>]);
	recipes.addShapeless("Planks7", <rustic:planks:1> * 2,[<rustic:log:1>]);
	recipes.addShapeless("Twilight Logs -> Planks1", <twilightforest:twilight_oak_planks> * 2, [<twilightforest:twilight_log>]);
	recipes.addShapeless("Twilight Logs -> Planks2", <twilightforest:canopy_planks> * 2, [<twilightforest:twilight_log:1>]);
	recipes.addShapeless("Twilight Logs -> Planks3", <twilightforest:mangrove_planks> * 2, [<twilightforest:twilight_log:2>]);
	recipes.addShapeless("Twilight Logs -> Planks8", <twilightforest:dark_planks> * 2, [<twilightforest:twilight_log:3>]);
	recipes.addShapeless("Twilight Logs -> Planks4", <twilightforest:time_planks> * 2, [<twilightforest:magic_log>]);
	recipes.addShapeless("Twilight Logs -> Planks5", <twilightforest:trans_planks> * 2, [<twilightforest:magic_log:1>]);
	recipes.addShapeless("Twilight Logs -> Planks6", <twilightforest:mine_planks> * 2, [<twilightforest:magic_log:2>]);
	recipes.addShapeless("Twilight Logs -> Planks7", <twilightforest:sort_planks> * 2, [<twilightforest:magic_log:3>]);
	recipes.addShapeless("integrateddynamics_menril_planks", <integrateddynamics:menril_planks> * 2, [<integrateddynamics:menril_log>]);

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
	rh(<plustic:invarnugget>);
	rh(<extendedcrafting:material:128>);
	rh(<extendedcrafting:material:129>);
	
print("--- MiscRecipes.zs initialized ---");
