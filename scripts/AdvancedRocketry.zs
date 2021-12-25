import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded advancedrocketry

# Vulpes Library Silicon dust Manufactory* Recipe Removal (Credit TheShadoWZYE2)
	mods.nuclearcraft.manufactory.removeRecipeWithOutput(<libvulpes:productdust:3>);
	
# Airtight Seal Enchant
	recipes.addShapedMirrored("Airtight Seal Enchant", 
	<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: (<enchantment:advancedrocketry:spacebreathing>.id) as short}]}), 
	[[<ore:plateTitaniumAluminide>, <advancedrocketry:liquidtank>, <ore:plateTitaniumAluminide>],
	[<ore:ingotCarbon>, <advancedrocketry:blocklens>, <ore:ingotCarbon>], 
	[<ore:plateTitaniumAluminide>, <advancedrocketry:liquidtank>, <ore:plateTitaniumAluminide>]]);

# Rocket Fuel
	mods.immersiveengineering.Mixer.addRecipe(<liquid:rocketfuel> * 250, <liquid:oxygen> * 500, [<thermalfoundation:material:833>, <immersivepetroleum:material>], 25000);

# HeatProof Brick
	recipes.remove(<advancedrocketry:blastbrick>);
	recipes.addShaped("HeatProof Brick", 
	<advancedrocketry:blastbrick> * 6, 
	[[<minecraft:brick_block>, <immersiveengineering:stone_decoration:2>, <minecraft:brick_block>],
	[<minecraft:brick_block>, <ore:slimecrystalMagma>, <minecraft:brick_block>], 
	[<minecraft:brick_block>, <minecraft:nether_brick>, <minecraft:brick_block>]]);

# Elite Motor
	recipes.remove(<libvulpes:elitemotor>);
	recipes.addShapedMirrored("Elite Motor", 
	<libvulpes:elitemotor>, 
	[[<ore:gemDilithium>, <ore:coilTitanium>, <ore:plateIridium>],
	[<ore:gemDilithium>, <ore:gearDiamond>, <ore:plateIridium>], 
	[<ore:gemDilithium>, <ore:coilTitanium>, <ore:plateIridium>]]);

# Machine Structure
	recipes.remove(<libvulpes:structuremachine>);
	recipes.addShapedMirrored("Lib Vulpes Machine Structure", 
	<libvulpes:structuremachine> * 6, 
	[[<ic2:crafting:29>, <ore:plateElite>, <ic2:crafting:29>],
	[<ore:plateElite>, <thermalexpansion:frame:147>, <ore:plateElite>], 
	[<ic2:crafting:29>, <ore:plateElite>, <ic2:crafting:29>]]);

# Liquid IO Circuit Board
	recipes.remove(<advancedrocketry:ic:5>);
	recipes.addShapedMirrored("Liquid IO Circuit Board", 
	<advancedrocketry:ic:5>, 
	[[<appliedenergistics2:material:54>, <forestry:chipsets:2>.withTag({T:2 as short},false), <appliedenergistics2:material:54>],
	[<appliedenergistics2:material:54>, <immersiveengineering:material:27>, <appliedenergistics2:material:54>], 
	[<appliedenergistics2:material:54>, <forestry:chipsets:2>.withTag({T:2 as short},false), <appliedenergistics2:material:54>]]);

# Item IO Circuit Board
	recipes.remove(<advancedrocketry:ic:4>);
	recipes.addShapedMirrored("Item IO Circuit Board", 
	<advancedrocketry:ic:4>, 
	[[<appliedenergistics2:material:18>, <forestry:chipsets:1>.withTag({T:1 as short},false), <appliedenergistics2:material:18>],
	[<appliedenergistics2:material:18>, <immersiveengineering:material:27>, <appliedenergistics2:material:18>], 
	[<appliedenergistics2:material:18>, <forestry:chipsets:1>.withTag({T:1 as short},false), <appliedenergistics2:material:18>]]);

# Control Circuit Board
	recipes.remove(<advancedrocketry:ic:3>);
	recipes.addShapedMirrored("Control Circuit Board", 
	<advancedrocketry:ic:3>, 
	[[<ore:circuitElite>, <immersiveengineering:metal_decoration0>, <ore:circuitElite>],
	[<ore:bioplastic>, <immersiveengineering:material:27>, <ore:bioplastic>], 
	[<ore:circuitElite>, <immersiveengineering:metal_decoration0>, <ore:circuitElite>]]);
	

# *======= Remove & Hide =======*

	val removals = [
	<libvulpes:productdust:1>,
	<libvulpes:productdust:2>,
	<libvulpes:productdust:3>,
	<libvulpes:productdust:4>,
	<libvulpes:productdust:5>,
	<libvulpes:productdust:6>,
	<libvulpes:productdust:9>,
	<libvulpes:productdust:10>,
	<libvulpes:productingot:4>,
	<libvulpes:productingot:5>,
	<libvulpes:productingot:6>,
	<libvulpes:productingot:9>,
	<libvulpes:productingot:10>,
	<libvulpes:productnugget:4>,
	<libvulpes:productnugget:5>,
	<libvulpes:productnugget:6>,
	<libvulpes:productnugget:9>,
	<libvulpes:productnugget:10>,
	<libvulpes:ore0:4>,
	<libvulpes:ore0:5>,
	<libvulpes:ore0:9>,
	<libvulpes:ore0:10>

	] as IItemStack[];
	
	for item in removals {
		rh(item);
	}
	
	val recipesToRemove = [
	
	<advancedrocketry:productrod>,
	<advancedrocketry:productrod:1>,
	<libvulpes:productrod:4>,
	<libvulpes:productrod:6>,
	<libvulpes:productrod:7>,
	<libvulpes:productrod:10>,
	<immersiveengineering:material:3>,
	<advancedrocketry:productgear:*>,
	<libvulpes:productgear:*>
	
	] as IItemStack[];

	for item in recipesToRemove {
		recipes.remove(item);
	}

	<ore:stickIron>.remove(<advancedrocketry:productrod:1>);

# Simplify tank
recipes.remove(<advancedrocketry:liquidtank>);
recipes.addShaped(<advancedrocketry:liquidtank>, [
	[<ore:plateTitanium>, <ore:paneGlass>, <ore:plateTitanium>],
	[<ore:plateTitanium>, <ore:paneGlass>, <ore:plateTitanium>],
	[<ore:plateTitanium>, <ore:paneGlass>, <ore:plateTitanium>]]);
recipes.addShapeless("Clearing AdvRock Tank", <advancedrocketry:liquidtank>, [<advancedrocketry:liquidtank>]);

# Mushrooms as energy providers
mods.thermalexpansion.EnervationDynamo.addFuel(<advancedrocketry:electricmushroom>, 90000000);
