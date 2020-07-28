#modloaded darkutils
print("--- loading DarkUtilities.zs ---");

	recipes.remove(<darkutils:trap_tile:7>);
	recipes.addShapedMirrored("Dark Utils Trap", 
	<darkutils:trap_tile:7>, 
	[[null, <ore:itemSkull>, null],
	[<ore:gemQuartzBlack>, <ore:itemCompressedDiamond>, <ore:gemQuartzBlack>], 
	[<ore:gemQuartzBlack>, <ore:gemQuartzBlack>, <actuallyadditions:item_misc:5>]]);

		print("--- DarkUtilities.zs initialized ---");