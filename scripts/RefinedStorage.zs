#modloaded refinedstorage
print("--- loading RefinedStorage.zs ---");

	recipes.remove(<refinedstorage:controller>);
	recipes.addShaped("RS Controller", 
	<refinedstorage:controller>, 
	[[<appliedenergistics2:smooth_sky_stone_block>, <advancedrocketry:ic:3>, <appliedenergistics2:smooth_sky_stone_block>],
	[<appliedenergistics2:fluix_block>, <appliedenergistics2:energy_acceptor>, <appliedenergistics2:fluix_block>], 
	[<teslacorelib:machine_case>, <ore:pearlFluix>, <teslacorelib:machine_case>]]);
		
print("--- RefinedStorage.zs initialized ---");