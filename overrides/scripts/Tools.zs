import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;

	
# *======= Recipes =======*
	
	val toolsToRemove = [
	<botania:glasspick>,
	<forestry:bronze_pickaxe>,
	<mysticalagriculture:inferium_pickaxe>,
	<mysticalagriculture:prudentium_pickaxe>,
	<mysticalagriculture:intermedium_pickaxe>,
	<mysticalagriculture:superium_pickaxe>,
	<thermalfoundation:tool.pickaxe_copper>,
	<thermalfoundation:tool.pickaxe_tin>,
	<thermalfoundation:tool.pickaxe_silver>,
	<thermalfoundation:tool.pickaxe_lead>,
	<thermalfoundation:tool.pickaxe_aluminum>,
	<thermalfoundation:tool.pickaxe_nickel>,
	<thermalfoundation:tool.pickaxe_platinum>,
	<thermalfoundation:tool.pickaxe_steel>,
	<thermalfoundation:tool.pickaxe_electrum>,
	<thermalfoundation:tool.pickaxe_invar>,
	<thermalfoundation:tool.pickaxe_bronze>,
	<thermalfoundation:tool.pickaxe_constantan>,
	
	<immersiveengineering:pickaxe_steel>,
	<immersiveengineering:shovel_steel>,
	<immersiveengineering:axe_steel>,
	<immersiveengineering:sword_steel>,
	
	<twilightforest:fiery_pickaxe>,
	<twilightforest:steeleaf_pickaxe>.withTag({ench: [{lvl: 2 as short, id: 35 as short}]}),
	<twilightforest:ironwood_pickaxe>.withTag({ench: [{lvl: 1 as short, id: 32 as short}]}),
	
	<mysticalagradditions:inferium_paxel>,
	<mysticalagradditions:prudentium_paxel>,
	<mysticalagradditions:intermedium_paxel>,
	<mysticalagradditions:superium_paxel>,
	<mysticalagradditions:supremium_paxel>
		] as IItemStack[];
		
	for tool in toolsToRemove {
		rh(tool);
	}
	
# Vanilla tool nerfs

	val toolsToNerf = [
	
	<minecraft:golden_axe>,
	<minecraft:golden_shovel>,
	<minecraft:golden_hoe>,
	<minecraft:golden_pickaxe>,
	<minecraft:golden_sword>,
	
	<minecraft:diamond_shovel>,
	<minecraft:diamond_axe>,
	<minecraft:diamond_pickaxe>,
	<minecraft:diamond_hoe>,
	
	<minecraft:iron_shovel>,
	<minecraft:iron_axe>,
	<minecraft:iron_pickaxe>,
	<minecraft:iron_hoe>,
		
	<minecraft:wooden_pickaxe>,
	<minecraft:wooden_sword>,
	<minecraft:wooden_hoe>,
	<minecraft:wooden_shovel>,
	<minecraft:wooden_axe>,
	
	<minecraft:stone_pickaxe>,
	<minecraft:stone_hoe>,
	<minecraft:stone_axe>,
	<minecraft:stone_shovel>
	
		] as IItemStack[];
		
	for tool in toolsToNerf {
		tool.maxDamage = 1;
	}
	
	<minecraft:stone_sword>.maxDamage = 2;
	<minecraft:iron_sword>.maxDamage = 10;
	<minecraft:diamond_sword>.maxDamage = 20;
	
# Thermal Foundation Hammers
		val toolRecipesToEdit = [
	<thermalfoundation:tool.hammer_invar>,
	<thermalfoundation:tool.hammer_bronze>,
	<thermalfoundation:tool.hammer_constantan>,
	<thermalfoundation:tool.hammer_iron>,
	<thermalfoundation:tool.hammer_diamond>,
	<thermalfoundation:tool.hammer_gold>,
	<thermalfoundation:tool.hammer_copper>,
	<thermalfoundation:tool.hammer_silver>,
	<thermalfoundation:tool.hammer_tin>,
	<thermalfoundation:tool.hammer_electrum>,
	<thermalfoundation:tool.hammer_steel>,
	<thermalfoundation:tool.hammer_platinum>,
	<thermalfoundation:tool.hammer_nickel>,
	<thermalfoundation:tool.hammer_aluminum>,
	<thermalfoundation:tool.hammer_lead>
	] as IItemStack[];
	
	for tool in toolRecipesToEdit {
		recipes.remove(tool);
	}
	
# Thermal Foundation Hammers
	recipes.addShaped(<thermalfoundation:tool.hammer_lead>, [[<ore:ingotLead>, <ore:blockLead>, <ore:ingotLead>],[<ore:ingotLead>, <forestry:oak_stick>, <ore:ingotLead>], [null, <forestry:oak_stick>, null]]);
	recipes.addShaped(<thermalfoundation:tool.hammer_aluminum>, [[<ore:ingotAluminium>, <ore:blockAluminium>, <ore:ingotAluminium>],[<ore:ingotAluminium>, <forestry:oak_stick>, <ore:ingotAluminium>], [null, <forestry:oak_stick>, null]]);
	recipes.addShaped(<thermalfoundation:tool.hammer_nickel>, [[<ore:ingotNickel>, <ore:blockNickel>, <ore:ingotNickel>],[<ore:ingotNickel>, <forestry:oak_stick>, <ore:ingotNickel>], [null, <forestry:oak_stick>, null]]);
	recipes.addShaped(<thermalfoundation:tool.hammer_platinum>, [[<ore:ingotPlatinum>, <ore:blockPlatinum>, <ore:ingotPlatinum>],[<ore:ingotPlatinum>, <forestry:oak_stick>, <ore:ingotPlatinum>], [null, <forestry:oak_stick>, null]]);
	recipes.addShaped(<thermalfoundation:tool.hammer_steel>, [[<ore:ingotSteel>, <ore:blockSteel>, <ore:ingotSteel>],[<ore:ingotSteel>, <forestry:oak_stick>, <ore:ingotSteel>], [null, <forestry:oak_stick>, null]]);
	recipes.addShaped(<thermalfoundation:tool.hammer_electrum>, [[<ore:ingotElectrum>, <ore:blockElectrum>, <ore:ingotElectrum>],[<ore:ingotElectrum>, <forestry:oak_stick>, <ore:ingotElectrum>], [null, <forestry:oak_stick>, null]]);
	recipes.addShaped(<thermalfoundation:tool.hammer_tin>, [[<ore:ingotTin>, <ore:blockTin>, <ore:ingotTin>],[<ore:ingotTin>, <forestry:oak_stick>, <ore:ingotTin>], [null, <forestry:oak_stick>, null]]);
	recipes.addShaped(<thermalfoundation:tool.hammer_silver>, [[<ore:ingotSilver>, <ore:blockSilver>, <ore:ingotSilver>],[<ore:ingotSilver>, <forestry:oak_stick>, <ore:ingotSilver>], [null, <forestry:oak_stick>, null]]);
	recipes.addShaped(<thermalfoundation:tool.hammer_copper>, [[<ore:ingotCopper>, <ore:blockCopper>, <ore:ingotCopper>],[<ore:ingotCopper>, <forestry:oak_stick>, <ore:ingotCopper>], [null, <forestry:oak_stick>, null]]);
	recipes.addShaped(<thermalfoundation:tool.hammer_gold>, [[<ore:ingotGold>, <ore:blockGold>, <ore:ingotGold>],[<ore:ingotGold>, <forestry:oak_stick>, <ore:ingotGold>], [null, <forestry:oak_stick>, null]]);
	recipes.addShaped(<thermalfoundation:tool.hammer_diamond>, [[<ore:gemDiamond>, <ore:blockDiamond>, <ore:gemDiamond>],[<ore:gemDiamond>, <forestry:oak_stick>, <ore:gemDiamond>], [null, <forestry:oak_stick>, null]]);
	recipes.addShaped(<thermalfoundation:tool.hammer_iron>, [[<ore:ingotIron>, <ore:blockIron>, <ore:ingotIron>],[<ore:ingotIron>, <forestry:oak_stick>, <ore:ingotIron>], [null, <forestry:oak_stick>, null]]);
	recipes.addShaped(<thermalfoundation:tool.hammer_constantan>, [[<ore:ingotConstantan>, <ore:blockConstantan>, <ore:ingotConstantan>],[<ore:ingotConstantan>, <forestry:oak_stick>, <ore:ingotConstantan>], [null, <forestry:oak_stick>, null]]);
	recipes.addShaped(<thermalfoundation:tool.hammer_bronze>, [[<ore:ingotBronze>, <ore:blockBronze>, <ore:ingotBronze>],[<ore:ingotBronze>, <forestry:oak_stick>, <ore:ingotBronze>], [null, <forestry:oak_stick>, null]]);
	recipes.addShaped(<thermalfoundation:tool.hammer_invar>, [[<ore:ingotInvar>, <ore:blockInvar>, <ore:ingotInvar>],[<ore:ingotInvar>, <forestry:oak_stick>, <ore:ingotInvar>], [null, <forestry:oak_stick>, null]]);

	