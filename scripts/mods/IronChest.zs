import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
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
	[<ore:gemDiamondRat>, <ironchest:iron_chest:1>, <ore:gemDiamondRat>], 
	[<ore:blockGlass>, <ore:gearDiamond>, <ore:blockGlass>]]);

# Remove unused chests recipes
recipes.removeByRecipeName("ironchest:shulker/purple/iron/copper_iron_shulker_box");
recipes.removeByRecipeName("ironchest:shulker/purple/gold/silver_gold_shulker_box");
recipes.removeByRecipeName("ironchest:shulker/purple/diamond/silver_diamond_shulker_box");

for output, ingrs in {
	<ironchest:wood_iron_chest_upgrade>          : [<ore:plateIron>],
	<ironchest:iron_gold_chest_upgrade>          : [<ore:plateGold>],
	<ironchest:gold_diamond_chest_upgrade>       : [<ore:gemDiamondRat>, <ore:gearDiamond>, <ore:blockGlass>],
	<ironchest:diamond_crystal_chest_upgrade>    : [<ore:blockGlass>],
	<ironchest:diamond_obsidian_chest_upgrade>   : [<ore:obsidian>],

	<ironchest:vanilla_iron_shulker_upgrade>     : [<ic2:casing:3>/* Iron Item Casing */],
	<ironchest:iron_gold_shulker_upgrade>        : [<ic2:casing:2>/* Gold Item Casing */],
	<ironchest:gold_diamond_shulker_upgrade>     : [<ore:gemDiamondRat>, <ore:gemDiamondRat>, <ore:paneGlass>],
	<ironchest:diamond_crystal_shulker_upgrade>  : [<ore:paneGlass>],
	<ironchest:diamond_obsidian_shulker_upgrade> : [<ore:obsidian>, null],
} as IIngredient[][IItemStack] {
	craft.remake(output, ["pretty",
		"  ■  ",
		"◊ ‚ ◊",
		"■ ¤ ■"], {
		"¤": ingrs.length > 1 ? ingrs[1] : ingrs[0],
		"■": ingrs.length > 2 ? ingrs[2] : ingrs[0],
		"◊": ingrs[0],
		"‚": <ore:nuggetFakeIron>, # Iron Alloy Nugget
	});
}
	
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
		utils.rh(item);
	}
