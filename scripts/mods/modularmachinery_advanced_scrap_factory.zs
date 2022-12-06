var machineName = "advanced_scrap_factory";

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_scrap", machineName, 10)
	.addEnergyPerTickInput(16000)
	.addItemOutput(<ic2:crafting:23> * 32)
	.addFluidInput(<liquid:water> * 1000)
	.build();