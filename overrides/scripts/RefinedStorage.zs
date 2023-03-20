#modloaded refinedstorage


# Controller
	recipes.remove(<refinedstorage:controller>);
	recipes.addShaped("RS Controller", 
	<refinedstorage:controller>, 
	[[<appliedenergistics2:smooth_sky_stone_block>, <advancedrocketry:ic:3>, <appliedenergistics2:smooth_sky_stone_block>],
	[<appliedenergistics2:fluix_block>, <appliedenergistics2:energy_acceptor>, <appliedenergistics2:fluix_block>], 
	[<refinedstorage:interface>, <ore:pearlFluix>, <refinedstorage:interface>]]);

# Crafter
	recipes.remove(<refinedstorage:crafter>);
	recipes.addShapedMirrored("RS Crafter", 
	<refinedstorage:crafter>, 
	[[<ore:blockSheetmetalIron>, <appliedenergistics2:quartz_glass>, <ore:blockSheetmetalIron>],
	[<refinedstorage:processor:5>, <rftools:crafter3>, <refinedstorage:processor:5>], 
	[<ore:blockSheetmetalIron>, <appliedenergistics2:quartz_glass>, <ore:blockSheetmetalIron>]]);
	
# Drive
	recipes.remove(<refinedstorage:disk_drive>);
	recipes.addShaped("RS Drive", 
	<refinedstorage:disk_drive>, 
	[[<ic2:casing:3>, <refinedstorage:processor:5>, <ic2:casing:3>],
	[<actuallyadditions:block_misc:9>, <opencomputers:diskdrive>, <actuallyadditions:block_misc:9>], 
	[<ic2:casing:3>, <refinedstorage:processor:5>, <ic2:casing:3>]]);

