#modloaded darkutils


	recipes.remove(<darkutils:trap_tile:7>);
	recipes.addShapedMirrored("Dark Utils Trap", 
	<darkutils:trap_tile:7>, 
	[[null, <ore:itemSkull>, null],
	[<ore:gemQuartzBlack>, <ore:itemCompressedDiamond>, <ore:gemQuartzBlack>], 
	[<ore:gemQuartzBlack>, <ore:gemQuartzBlack>, <actuallyadditions:item_misc:5>]]);

# Cheaper. Work too slow and short radius
# [Ender Hopper] from [Hopper][+2]
craft.remake(<darkutils:ender_hopper>, ["pretty",
  "  ▲  ",
  "V □ V"], {
  "□": <ore:blockHopper>, # Hopper
  "▲": <ore:dustWither>,  # Wither Dust
  "V": <chisel:voidstone:*> # Voidstone
});


# [Pearled Ender Hopper] from [Shulker_Pearl][+1]
craft.reshapeless(<darkutils:ender_pearl_hopper>, "E◊", {
  "E": <darkutils:ender_hopper>, # Ender Hopper
  "◊": <ore:gemPearl>            # Shulker Pearl
});