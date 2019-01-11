var machineName = "advanced_metallurgic_fabricator";

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_modularium_alloy", machineName, 50)
	.addEnergyPerTickInput(25000)
	.addItemOutput(<ore:ingotModularium>, 2)
	.addItemInput(<ore:ingotElectricalSteel>, 2)
	.addItemInput(<ore:ingotPlatinum>)
	.addItemInput(<actuallyadditions:item_crystal_empowered:1>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_titanium_ingot", machineName, 10)
	.addEnergyPerTickInput(100000)
	.addItemOutput(<ore:ingotTitanium>, 2)
	.addItemInput(<ore:oreMagnesium>, 2)
	.addItemInput(<ore:itemSalt>, 4)
	.addItemInput(<ic2:crafting:15>)
	.addFluidInput(<liquid:liquidchlorine> * 500)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_manasteel_ingot", machineName, 10)
	.addEnergyPerTickInput(50000)
	.addItemOutput(<ore:ingotMithril>, 6)
	.addItemInput(<ore:ingotManasteel>, 4)
	.addItemInput(<ore:gemDiamond>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_osgloglas_ingot", machineName, 10)
	.addEnergyPerTickInput(100000)
	.addItemOutput(<ore:ingotOsgloglas>, 2)
	.addItemInput(<ore:ingotRefinedObsidian>)
	.addItemInput(<ore:ingotOsmium>)
	.addItemInput(<ore:ingotRefinedGlowstone>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_mirion_ingot", machineName, 10)
	.addEnergyPerTickInput(100000)
	.addItemOutput(<ore:ingotMirion>, 6)
	.addItemInput(<ore:ingotManasteel>)
	.addItemInput(<ore:ingotElvenElementium>)
	.addItemInput(<ore:ingotTerrasteel>)
	.addItemInput(<ore:blockGlass>, 10)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_osmiridium_ingot", machineName, 10)
	.addEnergyPerTickInput(100000)
	.addItemOutput(<ore:ingotOsmiridium>, 4)
	.addItemInput(<ore:ingotIridium>)
	.addItemInput(<ore:ingotOsmium>)
	.build();
	
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_flux_crystal", machineName, 5)
	.addEnergyPerTickInput(100000)
	.addItemOutput(<ore:blockCrystalFlux>)
	.addItemInput(<ore:blockDiamond>)
	.addFluidInput(<liquid:redstone> * 5000)
	.build();
	
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_magnesium_diboride_ingot", machineName, 5)
	.addEnergyPerTickInput(100000)
	.addItemOutput(<ore:ingotMagnesiumDiboride>, 9)
	.addItemInput(<ore:ingotMagnesium>, 3)
	.addItemInput(<ore:ingotBoron>, 6)
	.build();