var machineName = "advanced_thermionic_fabricator";

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_iron_electron_tube", machineName, 5)
	.addItemOutput(<forestry:thermionic_tubes:3> * 4)
	.addEnergyPerTickInput(25000)
	.addFluidInput(<liquid:glass> * 1000)
	.addItemInput(<ore:ingotIron>, 5)
	.addItemInput(<ore:dustRedstone>, 2)
	.build();
	
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_diamantine_electron_tube", machineName, 5)
	.addItemOutput(<forestry:thermionic_tubes:5> * 4)
	.addEnergyPerTickInput(25000)
	.addFluidInput(<liquid:glass> * 1000)
	.addItemInput(<ore:gemDiamond>, 5)
	.addItemInput(<ore:dustRedstone>, 2)
	.build();
	
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_tin_electron_tube", machineName, 5)
	.addItemOutput(<forestry:thermionic_tubes:1> * 4)
	.addEnergyPerTickInput(25000)
	.addFluidInput(<liquid:glass> * 1000)
	.addItemInput(<ore:ingotTin>, 5)
	.addItemInput(<ore:dustRedstone>, 2)
	.build();
	
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_bronze_electron_tube", machineName, 5)
	.addItemOutput(<forestry:thermionic_tubes:2> * 4)
	.addEnergyPerTickInput(25000)
	.addFluidInput(<liquid:glass> * 1000)
	.addItemInput(<ore:ingotBronze>, 5)
	.addItemInput(<ore:dustRedstone>, 2)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_orchid_electron_tube", machineName, 5)
	.addItemOutput(<forestry:thermionic_tubes:13> * 4)
	.addEnergyPerTickInput(25000)
	.addFluidInput(<liquid:glass> * 1000)
	.addItemInput(<minecraft:redstone_ore> * 5)
	.addItemInput(<minecraft:repeater> * 2)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_rubberised_electron_tube", machineName, 5)
	.addItemOutput(<forestry:thermionic_tubes:8> * 4)
	.addEnergyPerTickInput(25000)
	.addFluidInput(<liquid:glass> * 1000)
	.addItemInput(<ore:itemRubber>, 5)
	.addItemInput(<ore:dustRedstone>, 2)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_blazing_electron_tube", machineName, 5)
	.addItemOutput(<forestry:thermionic_tubes:7> * 4)
	.addEnergyPerTickInput(25000)
	.addFluidInput(<liquid:glass> * 1000)
	.addItemInput(<ore:dustBlaze>, 5)
	.addItemInput(<ore:dustRedstone>, 2)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_apatine_electron_tube", machineName, 5)
	.addItemOutput(<forestry:thermionic_tubes:10> * 4)
	.addEnergyPerTickInput(25000)
	.addFluidInput(<liquid:glass> * 1000)
	.addItemInput(<ore:gemApatite>, 5)
	.addItemInput(<ore:dustRedstone>, 2)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_ender_electron_tube", machineName, 5)
	.addItemOutput(<forestry:thermionic_tubes:12> * 4)
	.addEnergyPerTickInput(25000)
	.addFluidInput(<liquid:glass> * 1000)
	.addItemInput(<ore:endstone>, 5)
	.addItemInput(<ore:pearlEnderEye>, 2)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_emerald_electron_tube", machineName, 5)
	.addItemOutput(<forestry:thermionic_tubes:9> * 4)
	.addEnergyPerTickInput(25000)
	.addFluidInput(<liquid:glass> * 1000)
	.addItemInput(<ore:gemEmerald>, 5)
	.addItemInput(<ore:dustRedstone>, 2)
	.build();
	
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_golden_electron_tube", machineName, 5)
	.addItemOutput(<forestry:thermionic_tubes:4> * 4)
	.addEnergyPerTickInput(25000)
	.addFluidInput(<liquid:glass> * 1000)
	.addItemInput(<ore:ingotGold>, 5)
	.addItemInput(<ore:dustRedstone>, 2)
	.build();
	
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_lapis_electron_tube", machineName, 5)
	.addItemOutput(<forestry:thermionic_tubes:11> * 4)
	.addEnergyPerTickInput(25000)
	.addFluidInput(<liquid:glass> * 1000)
	.addItemInput(<ore:gemLapis>, 5)
	.addItemInput(<ore:dustRedstone>, 2)
	.build();
	
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_copper_electron_tube", machineName, 5)
	.addItemOutput(<forestry:thermionic_tubes:0> * 4)
	.addEnergyPerTickInput(25000)
	.addFluidInput(<liquid:glass> * 1000)
	.addItemInput(<ore:ingotCopper>, 5)
	.addItemInput(<ore:dustRedstone>, 2)
	.build();
	
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_obsidian_electron_tube", machineName, 5)
	.addItemOutput(<forestry:thermionic_tubes:6> * 4)
	.addEnergyPerTickInput(25000)
	.addFluidInput(<liquid:glass> * 1000)
	.addItemInput(<ore:obsidian>, 5)
	.addItemInput(<ore:dustRedstone>, 2)
	.build();
	
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_resonant_cell_frame", machineName, 40)
	.addItemOutput(<thermalexpansion:frame:132>)
	.addEnergyPerTickInput(100000)
	.addFluidInput(<liquid:glass> * 8000)
	.addItemInput(<ore:dustMana>, 3)
	.addItemInput(<ore:ingotLumium>, 2)
	.addItemInput(<thermalfoundation:glass_alloy:7> * 2)
	.addItemInput(<thermalexpansion:frame:147>)
	.addItemInput(<actuallyadditions:block_misc:8>)
	.build();
	
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_flexible_casing", machineName, 20)
	.addItemOutput(<forestry:flexible_casing>)
	.addEnergyPerTickInput(50000)
	.addFluidInput(<liquid:glass> * 1000)
	.addItemInput(<ore:ingotBronze>, 4)
	.addItemInput(<ore:gemEmerald>, 2)
	.addItemInput(<ore:slimeball>, 2)
	.build();
	
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_garden_cloche", machineName, 20)
	.addItemOutput(<immersiveengineering:metal_device1:13>)
	.addEnergyPerTickInput(50000)
	.addFluidInput(<liquid:glass> * 8000)
	.addItemInput(<ore:plankTreatedWood>, 2)
	.addItemInput(<immersiveengineering:connector>)
	.addItemInput(<ic2:upgrade:4>)
	.addItemInput(<immersiveengineering:metal_decoration0:5>)
	.build();
	
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_machine_frame", machineName, 30)
	.addItemOutput(<thermalexpansion:frame> * 2)
	.addEnergyPerTickInput(50000)
	.addFluidInput(<liquid:glass> * 12000)
	.addItemInput(<rftools:machine_frame>)
	.addItemInput(<immersiveengineering:metal_decoration0:5>)
	.addItemInput(<actuallyadditions:block_misc:9>)
	.addItemInput(<teslacorelib:machine_case>)
	.addItemInput(<actuallyadditions:item_crystal:5> * 4)
	.build();
	
