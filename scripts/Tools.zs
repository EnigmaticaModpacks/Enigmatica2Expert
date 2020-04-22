import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
print("--- loading Tools.zs ---");
	
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
	<minecraft:stone_shovel>,

	<minecraft:shears>
	
		] as IItemStack[];
		
	for tool in toolsToNerf {
		tool.maxDamage = 1;
	}
	
	<minecraft:stone_sword>.maxDamage = 2;
	<minecraft:iron_sword>.maxDamage = 10;
	<minecraft:diamond_sword>.maxDamage = 20;

# Harder vanilla recipe
recipes.remove(<minecraft:flint_and_steel>);
recipes.addShapeless(<minecraft:flint_and_steel>, [<ore:ingotSteel>, <ore:itemFlint>]);

	print("--- Tools.zs initialized ---");