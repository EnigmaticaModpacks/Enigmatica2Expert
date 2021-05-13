import crafttweaker.item.IItemStack as IItemStack;
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
	scripts.wrap.immersiveengineering.Mixer.addRecipe(<liquid:rocketfuel> * 250, <liquid:oxygen> * 500, [<thermalfoundation:material:833>, <ore:bitumen>], 25000);

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
	<libvulpes:ore0:10>,
	<libvulpes:productrod:1>,
	<libvulpes:productrod:6>

	] as IItemStack[];
	
	for item in removals {
		utils.rh(item);
	}
	
	val recipesToRemove = [
	
	<advancedrocketry:productrod>,
	<advancedrocketry:productrod:1>,
	<libvulpes:productrod:4>,
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


# [Pressurized Tank] from [Tank][+2]
craft.remake(<advancedrocketry:liquidtank>, ["pretty",
  "T ◊ T",
  "T a T",
  "T ◊ T"], {
  "a": <openblocks:tank>,   # Tank
  "T": <ore:sheetTitanium>, # Titanium Sheet
  "◊": <ore:gemDilithium>,  # Dilithium Crystal
});
recipes.addShapeless("Clearing AdvRock Tank", <advancedrocketry:liquidtank>, [<advancedrocketry:liquidtank>]);

# Mushrooms as energy providers
mods.thermalexpansion.EnervationDynamo.addFuel(<advancedrocketry:electricmushroom>, 60000000);

# Crystalls recycling
val CLN = <ore:nuggetCrystaltine>.firstItem;
val crtlExcps = "except: manufactory Macerator ThermalCentrifuge mekCrusher";
scripts.process.crush(<advancedrocketry:crystal:3>, <jaopca:item_crystalardite>,  crtlExcps, [<actuallyadditions:item_crystal_empowered>,   <environmentaltech:kyronite_crystal>, CLN], [0.6f, 0.3f, 0.05f]);
scripts.process.crush(<advancedrocketry:crystal:1>, <jaopca:item_crystalcobalt>,  crtlExcps, [<actuallyadditions:item_crystal_empowered:1>, <environmentaltech:pladium_crystal>,  CLN], [0.6f, 0.3f, 0.05f]);
scripts.process.crush(<advancedrocketry:crystal>,   <jaopca:item_crystalplatinum>,crtlExcps, [<actuallyadditions:item_crystal_empowered:2>, <environmentaltech:ionite_crystal>,   CLN], [0.6f, 0.3f, 0.05f]);
scripts.process.crush(<advancedrocketry:crystal:5>, <jaopca:item_crystalthorium>, crtlExcps, [<actuallyadditions:item_crystal_empowered:3>, <environmentaltech:aethium_crystal>,  CLN], [0.6f, 0.3f, 0.05f]);
scripts.process.crush(<advancedrocketry:crystal:2>, <jaopca:item_crystaluranium>, crtlExcps, [<actuallyadditions:item_crystal_empowered:4>, <environmentaltech:litherite_crystal>,CLN], [0.6f, 0.3f, 0.05f]);
scripts.process.crush(<advancedrocketry:crystal:4>, <jaopca:item_crystaliridium>, crtlExcps, [<actuallyadditions:item_crystal_empowered:5>, <environmentaltech:erodium_crystal>,  CLN], [0.6f, 0.3f, 0.05f]);

# Special case for thermal centrifuge - it have no chances for secondary outputs
val ic2Cent = ["ThermalCentrifuge"] as string[];
scripts.process.work(ic2Cent, null , [<advancedrocketry:crystal:3> * 4] , null , [<jaopca:item_crystalardite>  * 3 , <actuallyadditions:item_crystal_empowered>  * 2 , <environmentaltech:kyronite_crystal> ] , null , null , null);
scripts.process.work(ic2Cent, null , [<advancedrocketry:crystal:1> * 4] , null , [<jaopca:item_crystalcobalt>  * 3 , <actuallyadditions:item_crystal_empowered:1>* 2 , <environmentaltech:pladium_crystal>  ] , null , null , null);
scripts.process.work(ic2Cent, null , [<advancedrocketry:crystal>   * 4] , null , [<jaopca:item_crystalplatinum>* 3 , <actuallyadditions:item_crystal_empowered:2>* 2 , <environmentaltech:ionite_crystal>   ] , null , null , null);
scripts.process.work(ic2Cent, null , [<advancedrocketry:crystal:5> * 4] , null , [<jaopca:item_crystalthorium> * 3 , <actuallyadditions:item_crystal_empowered:3>* 2 , <environmentaltech:aethium_crystal>  ] , null , null , null);
scripts.process.work(ic2Cent, null , [<advancedrocketry:crystal:2> * 4] , null , [<jaopca:item_crystaluranium> * 3 , <actuallyadditions:item_crystal_empowered:4>* 2 , <environmentaltech:litherite_crystal>] , null , null , null);
scripts.process.work(ic2Cent, null , [<advancedrocketry:crystal:4> * 4] , null , [<jaopca:item_crystaliridium> * 3 , <actuallyadditions:item_crystal_empowered:5>* 2 , <environmentaltech:erodium_crystal>  ] , null , null , null);

scripts.process.compress(<ore:blockCharcoal>, <advancedrocketry:misc:1>, "No Exceptions");

# Generator was too cheap compared to other coal gens
# [Coal Generator] from [Furnace][+2]
craft.remake(<libvulpes:coalgenerator>, [
  "B",
  "F",
  "□"], {
  "□": <ore:plateTitanium>, # Titanium Plate
  "B": <ore:itemBattery>,   # Small Battery
  "F": <minecraft:furnace>, # Furnace
});
