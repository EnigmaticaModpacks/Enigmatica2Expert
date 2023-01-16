#import scripts.modular_machinery.utility.createRecipeName;

var machineName = "advanced_carpenter";

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_wyvern_core", machineName, 10)
	.addEnergyPerTickInput(50000)
	.addItemOutput(<draconicevolution:wyvern_core>)
	.addItemInput(<ore:shulkerShell>)
	.addItemInput(<ore:ingotStellarAlloy>, 2)
	.addItemInput(<environmentaltech:pladium>)
	.addItemInput(<minecraft:nether_star>)
	.addItemInput(<draconicevolution:draconic_core> * 3)
	.addFluidInput(<liquid:mana> * 500)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_draconic_energy_core", machineName, 20)
	.addEnergyPerTickInput(50000)
	.addItemOutput(<draconicevolution:draconic_energy_core>)
	.addItemInput(<ore:ingotDraconiumAwakened>, 2)
	.addItemInput(<draconicevolution:wyvern_energy_core> * 4)
	.addItemInput( <draconicevolution:wyvern_core>)
	.addFluidInput(<liquid:mana> * 500)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_crafting_core", machineName, 20)
	.addEnergyPerTickInput(50000)
	.addItemOutput(<extendedcrafting:crafting_core>)
	.addItemInput(<extendedcrafting:material:18> * 3)
	.addItemInput(<extendedcrafting:pedestal> * 2)
	.addItemInput(<plustic:osmiridiumingot> * 2)
	.addFluidInput(<liquid:coal> * 2500)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_pedestal", machineName, 10)
	.addEnergyPerTickInput(25000)
	.addItemOutput(<extendedcrafting:pedestal>)
	.addItemInput(<extendedcrafting:material:2>)
	.addItemInput(<extendedcrafting:storage>)
	.addItemInput(<ore:ingotBlackIron>, 2)
	.addFluidInput(<liquid:coal> * 500)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_stellar_block", machineName, 10)
	.addEnergyPerTickInput(25000)
	.addItemOutput(<enderio:block_alloy_endergy:3>)
	.addItemInput(<ore:gemAmethyst>)
	.addItemInput(<ore:blockMelodicAlloy>)
	.addItemInput(<ore:ingotAlumite>)
	.addItemInput(<ore:blockBlaze>)
	.addItemInput(<botania:storage:2>)
	.addItemInput(<ore:blockEnderium>, 2)
	.addFluidInput(<liquid:liquiddna> * 500)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_overclocker_upgrade", machineName, 10)
	.addEnergyPerTickInput(5000)
	.addItemOutput(<ic2:upgrade> * 2)
	.addItemInput(<ore:plateTin>, 3)
	.addItemInput(<ore:circuitBasic>)
	.addItemInput(<ic2:cable> * 1)
	.addFluidInput(<liquid:ic2coolant> * 1500)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_tier_6_crafting_seed", machineName, 20)
	.addEnergyPerTickInput(25000)
	.addItemOutput(<mysticalagradditions:insanium:1>)
	.addItemInput(<ore:listAllseed>, 4)
	.addItemInput(<mysticalagradditions:insanium> * 2)
	.addItemInput(<mysticalagriculture:crafting:21>)
	.addFluidInput(<liquid:sewage> * 500)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_intricate_circuit_board", machineName, 5)
	.addEnergyPerTickInput(50000)
	.addItemOutput(<forestry:chipsets:3>.withTag({T: 3 as short}))
	.addItemInput(<forestry:chipsets>.withTag({}))
	.addItemInput(<forestry:chipsets:1>.withTag({}))
	.addItemInput(<forestry:chipsets:2>.withTag({}))
	.addItemInput(<appliedenergistics2:material:17> * 2)
	.addItemInput(<ore:circuitUltimate>)
	.addFluidInput(<liquid:water> * 5000)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_basic_circuit_board", machineName, 5)
	.addEnergyPerTickInput(50000)
	.addItemOutput(<forestry:chipsets>.withTag({T: 0 as short}))
	.addItemInput(<ore:ingotTin>)
	.addItemInput(<ore:dustRedstone>, 2)
	.addFluidInput(<liquid:water> * 5000)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_enhanced_circuit_board", machineName, 5)
	.addEnergyPerTickInput(50000)
	.addItemOutput(<forestry:chipsets:1>.withTag({T: 1 as short}))
	.addItemInput(<ore:ingotBronze>)
	.addItemInput(<ore:dustRedstone>, 2)
	.addFluidInput(<liquid:water> * 5000)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_refined_circuit_board", machineName, 5)
	.addEnergyPerTickInput(50000)
	.addItemOutput(<forestry:chipsets:2>.withTag({T: 2 as short}))
	.addItemInput(<ore:ingotIron>)
	.addItemInput(<ore:dustRedstone>, 2)
	.addFluidInput(<liquid:water> * 5000)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_humus", machineName, 10)
	.addEnergyPerTickInput(5000)
	.addItemOutput(<forestry:humus> * 18)
	.addItemInput(<forestry:mulch>)
	.addItemInput(<ore:dirt>, 8)
	.addFluidInput(<liquid:water> * 5000)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_hardened_machine", machineName, 10)
	.addEnergyPerTickInput(50000)
	.addItemOutput(<forestry:hardened_machine>)
	.addItemInput(<forestry:sturdy_machine>)
	.addItemInput(<ore:gemDiamond>, 4)
	.addFluidInput(<liquid:water> * 5000)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_impregnated_casing1", machineName, 10)
	.addEnergyPerTickInput(12500)
	.addItemOutput(<forestry:impregnated_casing>)
	.addItemInput(<ore:logWood>, 4)
	.addFluidInput(<liquid:seed.oil> * 125)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_impregnated_casing2", machineName, 10)
	.addEnergyPerTickInput(12500)
	.addItemOutput(<forestry:impregnated_casing>)
	.addItemInput(<ore:logWood>, 4)
	.addFluidInput(<liquid:oliveoil> * 125)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_impregnated_stick1", machineName, 5)
	.addEnergyPerTickInput(25000)
	.addItemOutput(<forestry:oak_stick>)
	.addItemInput(<ore:plankWood>, 2)
	.addFluidInput(<liquid:seed.oil> * 50)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_impregnated_stick2", machineName, 5)
	.addEnergyPerTickInput(25000)
	.addItemOutput(<forestry:oak_stick>)
	.addItemInput(<ore:plankWood>, 2)
	.addFluidInput(<liquid:oliveoil> * 50)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "bog_earth", machineName, 5)
	.addEnergyPerTickInput(25000)
	.addItemOutput(<forestry:bog_earth> * 16)
	.addItemInput(<forestry:mulch>)
	.addItemInput(<ore:dirt>, 2)
	.addItemInput(<ore:sand>, 2)
	.addFluidInput(<liquid:water> * 2000)
	.build();
	
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_wyvern_energy_core", machineName, 10)
	.addEnergyPerTickInput(50000)
	.addItemOutput(<draconicevolution:wyvern_energy_core>)
	.addItemInput(<draconicevolution:draconic_core>)
	.addFluidInput(<liquid:redstone> * 10000)
	.build();