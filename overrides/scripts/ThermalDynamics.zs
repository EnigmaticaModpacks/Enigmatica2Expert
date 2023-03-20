#modloaded thermaldynamics


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
	recipes.removeShaped(<thermaldynamics:duct_32:1> * 6, [[<ore:ingotTin>, <ore:ingotLead>, <ore:ingotTin>]]);
	recipes.addShapedMirrored("Itemduct Opaque",
	<thermaldynamics:duct_32:1> * 12, 
	[[<ore:plateTin>, <xnet:netcable:*>, <ore:plateTin>]]);

# Fluiduct
	recipes.remove(<thermaldynamics:duct_16>);
	recipes.addShapedMirrored("Fluiduct", 
	<thermaldynamics:duct_16> * 12, 
	[[<ore:plateCopper>, <ore:blockGlass>, <ore:plateCopper>]]);

# Fluiduct Opaque
	recipes.remove(<thermaldynamics:duct_16:1>);
	recipes.addShapedMirrored("Fluiduct Opaque", 
	<thermaldynamics:duct_16:1> * 12, 
	[[<ore:plateCopper>, <xnet:netcable:*>, <ore:plateCopper>]]);

# Hardened Fluiduct Opaque
	recipes.remove(<thermaldynamics:duct_16:3>);
	recipes.addShapedMirrored("Hardened Fluiduct Opaque",
	<thermaldynamics:duct_16:3> * 12, 
	[[<ore:plateInvar>, <xnet:netcable:*>, <ore:plateInvar>]]);

	
		