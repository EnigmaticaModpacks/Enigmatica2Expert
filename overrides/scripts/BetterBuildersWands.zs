#modloaded betterbuilderswands



	recipes.remove(<betterbuilderswands:wanddiamond>);
	recipes.remove(<betterbuilderswands:wandiron>);
	recipes.remove(<betterbuilderswands:wandstone>);
	
	recipes.addShapedMirrored("Diamond Wand", 
	<betterbuilderswands:wanddiamond>, 
	[[null, null, <mekanism:compresseddiamond>],
	[null, <botania:manaresource:3>, null], 
	[<botania:manaresource:3>, null, null]]);
	
	recipes.addShapedMirrored("Iron Wand", 
	<betterbuilderswands:wandiron>, 
	[[null, null, <ore:plateIron>],
	[null, <botania:manaresource:3>, null], 
	[<botania:manaresource:3>, null, null]]);
	
	recipes.addShapedMirrored("Stone Wand", 
	<betterbuilderswands:wandstone>, 
	[[null, null, <minecraft:stone:*>],
	[null, <botania:manaresource:3>, null], 
	[<botania:manaresource:3>, null, null]]);

	