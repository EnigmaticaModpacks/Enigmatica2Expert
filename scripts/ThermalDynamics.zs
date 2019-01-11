#modloaded thermaldynamics
print("--- loading ThermalDynamics.zs ---");

# Leadstone Fluxduct
	recipes.remove(<thermaldynamics:duct_0>);
	recipes.addShapedMirrored("Leadstone Fluxduct", 
	<thermaldynamics:duct_0> * 12, 
	[[<ore:alloyBasic>, <ore:alloyBasic>, <ore:alloyBasic>],
	[<xnet:netcable:*>, <ore:blockGlass>, <xnet:netcable:*>], 
	[<ore:alloyBasic>, <ore:alloyBasic>, <ore:alloyBasic>]]);

# Redstone Energy Fluxduct Empty
	recipes.remove(<thermaldynamics:duct_0:6>);
	recipes.addShapedMirrored("Redstone Energy Fluxduct Empty",
	<thermaldynamics:duct_0:6> * 16, 
	[[<ore:plateElectrum>, <ore:plateElectrum>, <ore:plateElectrum>],
	[<thermaldynamics:duct_0:1>, <ore:blockGlassHardened>, <thermaldynamics:duct_0:1>], 
	[<ore:plateElectrum>, <ore:plateElectrum>, <ore:plateElectrum>]]);

# Itemduct Opaque
	recipes.remove(<thermaldynamics:duct_32:1>);
	recipes.addShapedMirrored("Itemduct Opaque",
	<thermaldynamics:duct_32:1> * 12, 
	[[null, null, null],
	[<ore:plateTin>, <xnet:netcable:*>, <ore:plateTin>], 
	[null, null, null]]);


# Fluiduct Opaque
	recipes.remove(<thermaldynamics:duct_16:1>);
	recipes.addShapedMirrored("Fluiduct Opaque", 
	<thermaldynamics:duct_16:1> * 12, 
	[[null, null, null],
	[<ore:plateCopper>, <xnet:netcable:*>, <ore:plateCopper>], 
	[null, null, null]]);

# Hardened Fluiduct Opaque
	recipes.remove(<thermaldynamics:duct_16:3>);
	recipes.addShapedMirrored("Hardened Fluiduct Opaque",
	<thermaldynamics:duct_16:3> * 12, 
	[[null, null, null],
	[<ore:plateInvar>, <xnet:netcable:*>, <ore:plateInvar>], 
	[null, null, null]]);

	
		print("--- ThermalDynamics.zs initialized ---");