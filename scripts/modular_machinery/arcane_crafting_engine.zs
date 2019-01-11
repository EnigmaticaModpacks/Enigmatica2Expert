var machineName = "arcane_crafting_engine";

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_complex_arcane_mechanism", machineName, 100)
	.addItemOutput(<thaumcraft:mechanism_complex>)
	.addItemInput(<ore:plateThaumium>, 2)
	.addItemInput(<ore:craftingPiston>)
	.addItemInput(<thaumcraft:mechanism_simple> * 2)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_simple_arcane_mechanism", machineName, 50)
	.addItemOutput(<thaumcraft:mechanism_simple>)
	.addItemInput(<ore:plateBrass>, 2)
	.addItemInput(<ore:plateIron>, 2)
	.addItemInput(<ore:stickWood>)
	.build();
	
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_mirrored_glass", machineName, 50)
	.addItemOutput(<thaumcraft:mirrored_glass>)
	.addItemInput(<ore:quicksilver>)
	.addItemInput(<ore:paneGlass>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_vis_resonator", machineName, 100)
	.addItemOutput(<thaumcraft:vis_resonator>)
	.addItemInput(<ore:plateIron>)
	.addItemInput(<ore:gemQuartz>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_fabric", machineName, 20)
	.addItemOutput(<thaumcraft:fabric>)
	.addItemInput(<ore:string>, 4)
	.addItemInput(<ore:wool>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_blank_seal", machineName, 100)
	.addItemOutput(<thaumcraft:seal>)
	.addItemInput(<ore:dyeRed>)
	.addItemInput(<ore:itemClay>)
	.addItemInput(<ore:nitor>)
	.addItemInput(<thaumcraft:tallow>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_tube", machineName, 20)
	.addItemOutput(<thaumcraft:tube> * 8)
	.addItemInput(<ore:nuggetQuicksilver>)
	.addItemInput(<ore:blockGlass>)
	.addItemInput(<ore:nuggetBrass>)
	.addItemInput(<ore:plateIron>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_essentia_valve", machineName, 60)
	.addItemOutput(<thaumcraft:tube_valve>)
	.addItemInput(<thaumcraft:tube>)
	.addItemInput(<minecraft:lever>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_tube_filter", machineName, 60)
	.addItemOutput(<thaumcraft:tube_filter>)
	.addItemInput(<thaumcraft:tube>)
	.addItemInput(<thaumcraft:filter>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_tube_restrict", machineName, 60)
	.addItemOutput(<thaumcraft:tube_restrict>)
	.addItemInput(<thaumcraft:tube>)
	.addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]}))
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_tube_oneway", machineName, 60)
	.addItemOutput(<thaumcraft:tube_oneway>)
	.addItemInput(<thaumcraft:tube>)
	.addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]}))
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_jar_normal", machineName, 40)
	.addItemOutput(<thaumcraft:jar_normal>)
	.addItemInput(<ore:slabWood>)
	.addItemInput(<ore:paneGlass>, 7)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_jar_void", machineName, 60)
	.addItemOutput(<thaumcraft:jar_void>)
	.addItemInput(<thaumcraft:jar_normal>)
	.addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]}))
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_paving_stone_barrier", machineName, 10)
	.addItemOutput(<thaumcraft:paving_stone_barrier> * 4)
	.addItemInput(<thaumcraft:stone_arcane_brick> * 4)
	.addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]}))
	.addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]}))
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_paving_stone_travel", machineName, 10)
	.addItemOutput(<thaumcraft:paving_stone_travel> * 4)
	.addItemInput(<thaumcraft:stone_arcane_brick> * 4)
	.addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]}))
	.addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]}))
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_lamp_arcane", machineName, 40)
	.addItemOutput(<thaumcraft:lamp_arcane>)
	.addItemInput(<ore:plateIron>, 4)
	.addItemInput(<ore:blockAmber>)
	.addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]}))
	.addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]}))
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_arcane_pedestal", machineName, 20)
	.addItemOutput(<thaumcraft:pedestal_arcane>)
	.addItemInput(<thaumcraft:slab_arcane_stone> * 6)
	.addItemInput(<thaumcraft:stone_arcane>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_ancient_pedestal", machineName, 20)
	.addItemOutput(<thaumcraft:pedestal_ancient>)
	.addItemInput(<thaumcraft:slab_ancient> * 6)
	.addItemInput(<thaumcraft:stone_ancient>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_eldritch_pedestal", machineName, 20)
	.addItemOutput(<thaumcraft:pedestal_eldritch>)
	.addItemInput(<thaumcraft:slab_eldritch> * 6)
	.addItemInput(<thaumcraft:stone_eldritch_tile>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_hungry_chest", machineName, 20)
	.addItemOutput(<thaumcraft:hungry_chest>)
	.addItemInput(<thaumcraft:plank_greatwood> * 7)
	.addItemInput(<ore:trapdoorWood>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_essentia_filter", machineName, 20)
	.addItemOutput(<thaumcraft:filter> * 2)
	.addItemInput(<thaumcraft:plank_silverwood>)
	.addItemInput(<ore:ingotGold>, 2)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_morphic_resonator", machineName, 20)
	.addItemOutput(<thaumcraft:morphic_resonator>)
	.addItemInput(<thaumcraft:nugget:10>)
	.addItemInput(<ore:paneGlass>, 2)
	.addItemInput(<ore:plateBrass>, 2)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_arcane_alembic", machineName, 60)
	.addItemOutput(<thaumcraft:alembic>)
	.addItemInput(<thaumcraft:plank_greatwood> * 4)
	.addItemInput(<ore:plateBrass>, 2)
	.addItemInput(<thaumcraft:filter> * 2)
	.addItemInput(<minecraft:bucket>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_alchemical_construct", machineName, 60)
	.addItemOutput(<thaumcraft:metal_alchemical> * 2)
	.addItemInput(<thaumcraft:plank_greatwood>)
	.addItemInput(<ore:plateIron>, 4)
	.addItemInput(<thaumcraft:tube> * 2)
	.addItemInput(<thaumcraft:tube_valve> * 2)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_arcane_bellows", machineName, 60)
	.addItemOutput(<thaumcraft:bellows>)
	.addItemInput(<ore:leather>, 2)
	.addItemInput(<ore:plankWood>, 4)
	.addItemInput(<ore:ingotIron>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_clockwork_mind", machineName, 60)
	.addItemOutput(<thaumcraft:mind>)
	.addItemInput(<thaumcraft:mechanism_simple>)
	.addItemInput(<ore:paneGlass>, 3)
	.addItemInput(<ore:plateBrass>, 2)
	.addItemInput(<minecraft:comparator>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_vis_battery", machineName, 40)
	.addItemOutput(<thaumcraft:vis_battery>)
	.addItemInput(<thaumcraft:slab_arcane_stone> * 8)
	.addItemInput(<thaumcraft:vis_resonator>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_stabilizer", machineName, 60)
	.addItemOutput(<thaumcraft:stabilizer>)
	.addItemInput(<thaumcraft:mechanism_complex>)
	.addItemInput(<thaumcraft:vis_resonator>)
	.addItemInput(<thaumcraft:inlay> * 2)
	.addItemInput(<thaumcraft:slab_arcane_stone> * 2)
	.addItemInput(<thaumcraft:stone_arcane> * 2)
	.addItemInput(<ore:blockRedstone>)
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_redstone_inlay", machineName, 20)
	.addItemOutput(<thaumcraft:inlay> * 2)
	.addItemInput(<ore:dustRedstone>)
	.addItemInput(<ore:ingotGold>)
	.addItemInput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]}))
	.build();

mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_essentia_funnel", machineName, 20)
	.addItemOutput(<thaumictinkerer:funnel>)
	.addItemInput(<minecraft:stone:*>)
	.addItemInput(<ore:ingotThaumium>)
	.build();