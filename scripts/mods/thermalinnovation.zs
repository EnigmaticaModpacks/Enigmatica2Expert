import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#modloaded thermalinnovation

# Remove and hide creative innovation items
utils.rh(<thermalinnovation:quiver:32000>.withTag({}));
utils.rh(<thermalinnovation:injector:32000>.withTag({}));
utils.rh(<thermalinnovation:magnet:32000>.withTag({Energy: 600000}));

# Remake magnet
recipes.removeByRecipeName("thermalinnovation:magnet");
recipes.removeByRecipeName("thermalinnovation:magnet_1");
recipes.removeByRecipeName("thermalinnovation:magnet_2");
recipes.removeByRecipeName("thermalinnovation:magnet_3");
recipes.removeByRecipeName("thermalinnovation:magnet_4");

# First level magnet
recipes.addShaped(<thermalinnovation:magnet>, [
	[<ore:ingotConductiveIron>, null, <ore:ingotConductiveIron>],
	[<ore:ingotLead>, null, <ore:ingotLead>],
	[null, <ore:ingotHeavy>, null]]);

function remakeMagnet(meta as int, i1 as IIngredient, i2 as IIngredient){
	var item = itemUtils.getItem("thermalinnovation:magnet", meta);
	var prev = itemUtils.getItem("thermalinnovation:magnet", meta - 1);
	recipes.addShaped("TE Magnet  " ~ meta, item, [
		[null, i2, null],
		[i1, prev.marked("marked"), i1],
		[i2, null, i2]],
	utils.upgradeFnc, null);
}

remakeMagnet(1, <thermalfoundation:material:162>, <enderio:item_alloy_nugget:0>);
remakeMagnet(2, <thermalfoundation:material:161>, <enderio:item_alloy_nugget:3>);
remakeMagnet(3, <thermalfoundation:material:165>, <enderio:item_alloy_nugget:1>);
remakeMagnet(4, <thermalfoundation:material:167>, <enderio:item_alloy_nugget:2>);
