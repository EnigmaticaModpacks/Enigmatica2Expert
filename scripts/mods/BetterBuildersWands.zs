#modloaded betterbuilderswands


	recipes.remove(<betterbuilderswands:wanddiamond>);
	recipes.remove(<betterbuilderswands:wandiron>);
	
	recipes.addShapedMirrored("Diamond Wand", 
	<betterbuilderswands:wanddiamond>, 
	[[null, null, <mekanism:compresseddiamond>],
	[null, <botania:manaresource:3>, null], 
	[<botania:manaresource:3>, null, null]]);
	
	recipes.addShapedMirrored("Iron Wand", 
	<betterbuilderswands:wandiron>, 
	[[null, null, <ore:plateIron>],
	[null, <immersiveengineering:material>, null], 
	[<immersiveengineering:material>, null, null]]);