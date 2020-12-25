import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;

#modloaded storagedrawers

# *======= Recipes =======*

# Drawer Controller
	recipes.remove(<storagedrawers:controller>);
	recipes.addShaped("Drawer Controller", 
	<storagedrawers:controller>, 
	[[<ic2:resource:11>, <ic2:resource:11>, <ic2:resource:11>],
	[<immersiveengineering:metal_decoration0:3>, <ore:drawerBasic>, <immersiveengineering:metal_decoration0:3>], 
	[<appliedenergistics2:smooth_sky_stone_block>, gemDiamondRat, <appliedenergistics2:smooth_sky_stone_block>]]);

# Drawer 1x1
	recipes.addShapedMirrored("Drawer 1x1",
	<storagedrawers:basicdrawers>, 
	[[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],
	[null, <ore:chest>, null], 
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]]);
	
# Drawer 1x2
	recipes.addShapedMirrored("Drawer 1x2",
	<storagedrawers:basicdrawers:1> * 2, 
	[[<ore:plankWood>, <ore:chest>, <ore:plankWood>],
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], 
	[<ore:plankWood>, <ore:chest>, <ore:plankWood>]]);

# Drawer 2x2
	recipes.addShapedMirrored("Drawer 2x2", 
	<storagedrawers:basicdrawers:2> * 4, 
	[[<ore:chest>, <ore:plankWood>, <ore:chest>],
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], 
	[<ore:chest>, <ore:plankWood>, <ore:chest>]]);

# Half Drawer 1x2
	recipes.addShapedMirrored("Half Drawer 1x2", 
	<storagedrawers:basicdrawers:3> * 2, 
	[[<ore:slabWood>, <ore:chest>, <ore:slabWood>],
	[<ore:slabWood>, <ore:slabWood>, <ore:slabWood>], 
	[<ore:slabWood>, <ore:chest>, <ore:slabWood>]]);

# Half Drawer 2x2
	recipes.addShapedMirrored("Half Drawer 2x2", 
	<storagedrawers:basicdrawers:4> * 4, 
	[[<ore:chest>, <ore:slabWood>, <ore:chest>],
	[<ore:slabWood>, <ore:slabWood>, <ore:slabWood>], 
	[<ore:chest>, <ore:slabWood>, <ore:chest>]]);

# Trim
	recipes.addShapedMirrored("Trim", 
	<storagedrawers:trim> * 4, 
	[[<ore:stickWood>, <ore:plankWood>, <ore:stickWood>],
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], 
	[<ore:stickWood>, <ore:plankWood>, <ore:stickWood>]]);

# Upgrades
function remakeDrawerUpgrade(item as IItemStack, primary as IIngredient){
	remakeEx(item, [
		[primary, <ore:stickWood>, primary],
		[<ore:stickWood>, <storagedrawers:upgrade_template>, <ore:stickWood>],
		[primary, <ore:stickWood>, primary]]);
}

remakeDrawerUpgrade(<storagedrawers:upgrade_storage:0>, <ore:nuggetLead>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:1>, <ore:nuggetEndSteel>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:2>, <ore:nuggetCrystallineAlloy>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:3>, <ore:nuggetUltimate>);
remakeDrawerUpgrade(<storagedrawers:upgrade_storage:4>, <ore:nuggetChaoticMetal>);

# Drawers clearing
function clearDrawer(inputs as IItemStack[]) as void  {
	for it in inputs {
		recipes.addShapeless("Clearing " ~ getItemName(it), it, [it]);
	}
}
// clearDrawer(<ore:drawerBasic>.items); # Somehow it still give oredict
clearDrawer([<storagedrawers:compdrawers>]);