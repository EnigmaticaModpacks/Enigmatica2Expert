import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded ironchest


# *======= Recipes =======*

# Iron Chest
	recipes.remove(<ironchest:iron_chest>);
	recipes.addShaped("Iron Chest", 
	<ironchest:iron_chest>, 
	[[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>],
	[<ore:plateIron>, <ore:chest>, <ore:plateIron>], 
	[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>]]);

# Gold Chest
	recipes.remove(<ironchest:iron_chest:1>);
	recipes.addShaped("Gold Chest", 
	<ironchest:iron_chest:1>, 
	[[<ore:plateGold>, <ore:plateGold>, <ore:plateGold>],
	[<ore:plateGold>, <ironchest:iron_chest>, <ore:plateGold>], 
	[<ore:plateGold>, <ore:plateGold>, <ore:plateGold>]]);

# Diamond Chest
	recipes.remove(<ironchest:iron_chest:2>);
	recipes.addShaped("Diamond Chest", 
	<ironchest:iron_chest:2>, 
	[[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>],
	[<ore:gemDiamond>, <ironchest:iron_chest:1>, <ore:gemDiamond>], 
	[<ore:blockGlass>, <ore:gearDiamond>, <ore:blockGlass>]]);

# Wood -> Iron
	recipes.remove(<ironchest:wood_iron_chest_upgrade>);
	recipes.addShaped("WoodToIron", 
	<ironchest:wood_iron_chest_upgrade>, 
	[[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>],
	[<ore:plateIron>, <ore:plankWood>, <ore:plateIron>], 
	[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>]]);

# Iron -> Gold
	recipes.remove(<ironchest:iron_gold_chest_upgrade>);
	recipes.addShaped("IronToGold", 
	<ironchest:iron_gold_chest_upgrade>, 
	[[<ore:plateGold>, <ore:plateGold>, <ore:plateGold>],
	[<ore:plateGold>, <ore:plateIron>, <ore:plateGold>], 
	[<ore:plateGold>, <ore:plateGold>, <ore:plateGold>]]);

# Gold -> Diamond
	recipes.remove(<ironchest:gold_diamond_chest_upgrade>);
	recipes.addShaped("GoldToDiamond", 
	<ironchest:gold_diamond_chest_upgrade>, 
	[[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>],
	[<ore:gemDiamond>, <ore:plateGold>, <ore:gemDiamond>], 
	[<ore:blockGlass>, <ore:gearDiamond>, <ore:blockGlass>]]);

# Shulker Wood -> Iron
	recipes.remove(<ironchest:vanilla_iron_shulker_upgrade>);
	recipes.addShaped("ShulkerWoodToIron",
	<ironchest:vanilla_iron_shulker_upgrade>, 
	[[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>],
	[<ore:plateIron>, <ore:shulkerShell>, <ore:plateIron>],
	[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>]]);

# Shulker Iron -> Gold
	recipes.remove(<ironchest:iron_gold_shulker_upgrade>);
	recipes.addShaped("ShulkerIronToGold", 
	<ironchest:iron_gold_shulker_upgrade>, 
	[[<ore:plateGold>, <ore:plateGold>, <ore:plateGold>],
	[<ore:plateGold>, <ore:plateDenseIron>, <ore:plateGold>], 
	[<ore:plateGold>, <ore:plateGold>, <ore:plateGold>]]);

# Shulker Gold -> Diamond
	recipes.remove(<ironchest:gold_diamond_shulker_upgrade>);
	recipes.addShaped("ShulkerGoldToDiamond", 
	<ironchest:gold_diamond_shulker_upgrade>, 
	[[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>],
	[<ore:gemDiamond>, <ore:plateDenseGold>, <ore:gemDiamond>], 
	[<ore:blockGlass>, <ore:gearDiamond>, <ore:blockGlass>]]);

# Shulker Diamond -> Crystal
	recipes.remove(<ironchest:diamond_crystal_shulker_upgrade>);
	recipes.addShaped("Shulker Diamond -> Crystal", 
	<ironchest:diamond_crystal_shulker_upgrade>, 
	[[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>],
	[<ore:blockGlass>, <ore:gemQuartz>, <ore:blockGlass>], 
	[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>]]);

# Shulker Diamond -> Obsidian
	recipes.remove(<ironchest:diamond_obsidian_shulker_upgrade>);
	recipes.addShaped("Shulker Diamond -> Obsidian", 
	<ironchest:diamond_obsidian_shulker_upgrade>, 
	[[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>],
	[<ore:blockGlass>, <ore:plateObsidian>, <ore:blockGlass>], 
	[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>]]);

	
# *======= Remove & Hide =======*

	val chestsToHide = [
	
	<ironchest:copper_silver_chest_upgrade>,
	<ironchest:silver_gold_chest_upgrade>,
	<ironchest:copper_iron_chest_upgrade>,
	<ironchest:wood_copper_chest_upgrade>,
	<ironchest:copper_silver_shulker_upgrade>,
	<ironchest:silver_gold_shulker_upgrade>,
	<ironchest:copper_iron_shulker_upgrade>,
	<ironchest:vanilla_copper_shulker_upgrade>,
	<ironchest:iron_chest:3>,
	<ironchest:iron_chest:4>,
	<ironchest:iron_shulker_box_white:3>,
	<ironchest:iron_shulker_box_white:4>,
	<ironchest:iron_shulker_box_orange:3>,
	<ironchest:iron_shulker_box_orange:4>,
	<ironchest:iron_shulker_box_magenta:3>,
	<ironchest:iron_shulker_box_magenta:4>,
	<ironchest:iron_shulker_box_light_blue:3>,
	<ironchest:iron_shulker_box_light_blue:4>,
	<ironchest:iron_shulker_box_yellow:3>,
	<ironchest:iron_shulker_box_yellow:4>,
	<ironchest:iron_shulker_box_lime:3>,
	<ironchest:iron_shulker_box_lime:4>,
	<ironchest:iron_shulker_box_pink:3>,
	<ironchest:iron_shulker_box_pink:4>,
	<ironchest:iron_shulker_box_gray:3>,
	<ironchest:iron_shulker_box_gray:4>,
	<ironchest:iron_shulker_box_silver:3>,
	<ironchest:iron_shulker_box_silver:4>,
	<ironchest:iron_shulker_box_cyan:3>,
	<ironchest:iron_shulker_box_cyan:4>,
	<ironchest:iron_shulker_box_purple:3>,
	<ironchest:iron_shulker_box_purple:4>,
	<ironchest:iron_shulker_box_blue:3>,
	<ironchest:iron_shulker_box_blue:4>,
	<ironchest:iron_shulker_box_brown:3>,
	<ironchest:iron_shulker_box_brown:4>,
	<ironchest:iron_shulker_box_green:3>,
	<ironchest:iron_shulker_box_green:4>,
	<ironchest:iron_shulker_box_red:3>,
	<ironchest:iron_shulker_box_red:4>,
	<ironchest:iron_shulker_box_black:3>,
	<ironchest:iron_shulker_box_black:4>
	
		] as IItemStack[];
	
	for item in chestsToHide {
		rh(item);
	}
		