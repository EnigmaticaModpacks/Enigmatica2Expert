import mods.jei.JEI.removeAndHide as rh;
#modloaded computercraft
print("--- loading ComputerCraft.zs ---");

	rh(<computercraft:turtle:1>);
	rh(<computercraft:turtle_advanced>.withTag({leftUpgrade: 5 as short}));

# Wired Modem
	recipes.remove(<computercraft:cable:1>);
	recipes.addShapedMirrored("Wired Modem", 
	<computercraft:cable:1>, 
	[[<ore:stone>, <ore:dustRedstone>, <ore:stone>],
	[<ore:stone>, <computercraft:cable>, <ore:stone>], 
	[<ore:stone>, <ore:dustRedstone>, <ore:stone>]]);

# Computer
	recipes.remove(<computercraft:computer>);
	recipes.addShapedMirrored("Computer", 
	<computercraft:computer>, 
	[[null, <opencomputers:screen1>, null],
	[<opencomputers:component>, <opencomputers:storage:2>, <opencomputers:component:6>], 
	[null, <opencomputers:case1>, null]]);

	
# Advanced Computers
	recipes.remove(<computercraft:computer:16384>);
	recipes.addShapedMirrored("Advanced Computer", 
	<computercraft:computer:16384>, 
	[[null, <opencomputers:screen2>, null],
	[<opencomputers:component:1>, <opencomputers:storage:3>, <opencomputers:component:8>], 
	[null, <opencomputers:case2>, null]]);

	
		print("--- ComputerCraft.zs initialized ---");