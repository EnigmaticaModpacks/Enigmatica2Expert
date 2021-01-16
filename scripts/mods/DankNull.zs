import crafttweaker.item.IIngredient;

#modloaded danknull

recipes.remove(<danknull:danknull_dock>);


# Removing non-chained recipes
for i in 1 to 6 {
	recipes.removeByRecipeName("danknull:dank_null_" ~ i);
}

# Change panel recipes
function dankPanelCraft(index as int, matPrimary as IIngredient, matSecondary as IIngredient){
	val recipeName = "danknull:dank_null_panel_" ~ index;
	val item = itemUtils.getItem(recipeName);
	val cb = <minecraft:coal_block>;

	recipes.removeByRecipeName(recipeName);
	scripts.wrap.extendedcrafting.EnderCrafting.addShaped(item, [
		[matSecondary, cb, matSecondary], 
		[cb, matPrimary, cb], 
		[matSecondary, cb, matSecondary]
		] as IIngredient[][]);
}

# dankPanelCraft(0, <ore:paneGlassRed>,	<ore:blockRedstone>);
# dankPanelCraft(1, <ic2:te:111>, 			<ore:blockLapis>);
dankPanelCraft(2, <ic2:te:112>, 			<ore:blockFakeIron>);
dankPanelCraft(3, <ic2:te:113>,				<ore:blockGold>);
dankPanelCraft(4, <ic2:te:114>,				<ore:blockDiamond>);
dankPanelCraft(5, <ic2:te:115>,				<ore:blockEmerald>);