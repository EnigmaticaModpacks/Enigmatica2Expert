import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded advancedrocketry
print("--- loading AdvancedRocketry.zs ---");

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

# Energy Pipe
	recipes.remove(<advancedrocketry:energypipe>);
	recipes.addShapedMirrored("Advanced Rocketry Energy Pipe", 
	<advancedrocketry:energypipe> * 16, 
	[[<ore:sheetCopper>, <minecraft:clay_ball>, <ore:sheetCopper>],
	[<minecraft:clay_ball>, <thermaldynamics:duct_0>, <minecraft:clay_ball>], 
	[<ore:sheetCopper>, <minecraft:clay_ball>, <ore:sheetCopper>]]);

# Elite Motor
	recipes.remove(<libvulpes:elitemotor>);
	recipes.addShapedMirrored("Elite Motor", 
	<libvulpes:elitemotor>, 
	[[<ore:crystalDilithium>, <ore:coilTitanium>, <ore:plateIridium>],
	[<ore:crystalDilithium>, <ore:gearDiamond>, <ore:plateIridium>], 
	[<ore:crystalDilithium>, <ore:coilTitanium>, <ore:plateIridium>]]);

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
	[[<appliedenergistics2:material:54>, <forestry:chipsets:2>.withTag({}), <appliedenergistics2:material:54>],
	[<appliedenergistics2:material:54>, <immersiveengineering:material:27>, <appliedenergistics2:material:54>], 
	[<appliedenergistics2:material:54>, <forestry:chipsets:2>.withTag({}), <appliedenergistics2:material:54>]]);

# Item IO Circuit Board
	recipes.remove(<advancedrocketry:ic:4>);
	recipes.addShapedMirrored("Item IO Circuit Board", 
	<advancedrocketry:ic:4>, 
	[[<appliedenergistics2:material:18>, <forestry:chipsets:1>.withTag({}), <appliedenergistics2:material:18>],
	[<appliedenergistics2:material:18>, <immersiveengineering:material:27>, <appliedenergistics2:material:18>], 
	[<appliedenergistics2:material:18>, <forestry:chipsets:1>.withTag({}), <appliedenergistics2:material:18>]]);

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

		print("--- AdvancedRocketry.zs initialized ---");
