#modloaded bigreactors
	
# *======= Recipes =======*

# Cyanite in NuclearCraft Fission Reactor
	mods.nuclearcraft.fission.addRecipe([<immersiveengineering:metal:5>, <bigreactors:ingotcyanite>, 4800.0, 100.0, 40.0, "URANIUM"]);

# Reactor Controller
	recipes.remove(<bigreactors:reactorcontroller>);
	scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, 
	<bigreactors:reactorcontroller>, 
	[[<nuclearcraft:fission_block>, <tconstruct:large_plate>.withTag({Material: "lead"}), <nuclearcraft:fission_block>],
	[<opencomputers:print>, <ic2:te:22>, <opencomputers:print>], 
	[<nuclearcraft:fission_block>, <nuclearcraft:fission_controller_new_fixed>, <nuclearcraft:fission_block>]]);

# Reactor Casing
	recipes.remove(<bigreactors:reactorcasing>);
	recipes.addShapedMirrored("ER Reactor Casing", 
	<bigreactors:reactorcasing> * 4, 
	[[<ore:ingotSteel>, <ore:ingotGraphite>, <ore:ingotSteel>],
	[<ore:ingotGraphite>, <bigreactors:reactorcasingcores>, <ore:ingotGraphite>], 
	[<ore:ingotSteel>, <ore:ingotGraphite>, <ore:ingotSteel>]]);

# Reactor Casing Core
	recipes.remove(<bigreactors:reactorcasingcores>);
	recipes.addShapedMirrored("ER Reactor Casing Core", 
	<bigreactors:reactorcasingcores> * 2, 
	[[<ore:ingotFerroboron>, <ore:ingotHardCarbon>, <ore:ingotFerroboron>],
	[<ore:plateGold>, <ore:blockRedstone>, <ore:plateGold>], 
	[<ore:ingotFerroboron>, <ore:ingotHardCarbon>, <ore:ingotFerroboron>]]);

# Turbine Housing
	recipes.remove(<bigreactors:turbinehousing>);
	recipes.addShaped("ER Turbine Housing", 
	<bigreactors:turbinehousing> * 4, 
	[[<ore:ingotSteel>, <ore:ingotGraphite>, <ore:ingotSteel>],
	[<ore:ingotGraphite>, <bigreactors:turbinehousingcores>, <ore:ingotGraphite>], 
	[<ore:ingotSteel>, <ore:ingotGraphite>, <ore:ingotSteel>]]);

# Turbine Housing Core
	recipes.remove(<bigreactors:turbinehousingcores>);
	recipes.addShapedMirrored("ER Turbine Housing Core", 
	<bigreactors:turbinehousingcores> * 2, 
	[[<ic2:casing:2>, <ore:dustHOPGraphite>, <ic2:casing:2>],
	[<ore:plateDenseObsidian>, <bigreactors:reactorcasingcores>, <ore:plateDenseObsidian>], 
	[<ic2:casing:2>, <ore:dustHOPGraphite>, <ic2:casing:2>]]);

# [Reactor Fuel Rod (Legacy)] from [Copper Plate][+1]
craft.remake(<bigreactors:reactorfuelrod>, ["pretty",
  "□   □",
  "п   п",
  "□   □"], {
  "□": <ore:plateIron>,   # Iron Plate
  "п": <ore:plateCopper>, # Copper Plate
});

# Reactor Control Rod
	recipes.remove(<bigreactors:reactorcontrolrod>);
	recipes.addShapedMirrored("ER Reactor Control Rod", 
	<bigreactors:reactorcontrolrod>, 
	[[<bigreactors:reactorcasing>, <ore:circuitUltimate>, <bigreactors:reactorcasing>],
	[<bigreactors:reactorcasing>, <rftoolscontrol:cpu_core_500>, <bigreactors:reactorcasing>], 
	[<bigreactors:reactorcasing>, <ore:dustRedstone>, <bigreactors:reactorcasing>]]);

# Turbine Controller
	recipes.remove(<bigreactors:turbinecontroller>);
	recipes.addShapedMirrored("ER Turbine Controller", 
	<bigreactors:turbinecontroller>, 
	[[<bigreactors:turbinehousing>, <rftoolscontrol:cpu_core_2000>, <bigreactors:turbinehousing>],
	[<bigreactors:turbinehousing>, <ic2:te:18>, <bigreactors:turbinehousing>], 
	[<bigreactors:turbinehousing>, <ic2:crafting:36>, <bigreactors:turbinehousing>]]);


# Blutonium Ingot	
	recipes.removeShaped(<bigreactors:ingotblutonium>);

# Ludicrite Block
	recipes.remove(<bigreactors:blockludicrite>);
	scripts.wrap.forestry.Carpenter.addRecipe(<bigreactors:blockludicrite>, 
	[[<ore:gemAmethyst>, <ore:blockBlaze>, <ore:gemAmethyst>],
	[<ore:ingotAlumite>, <ore:blockBlutonium>, <ore:ingotAlumite>], 
	[<ore:blockEnderium>, <botania:storage:2>, <ore:blockEnderium>]], 
	40, <liquid:liquiddna> * 1000);
	
	recipes.addShaped("Ludicrite Block From Ingots", 
	<bigreactors:blockludicrite>, 
	[[<ore:ingotLudicrite>, <ore:ingotLudicrite>, <ore:ingotLudicrite>],
	[<ore:ingotLudicrite>, <ore:ingotLudicrite>, <ore:ingotLudicrite>], 
	[<ore:ingotLudicrite>, <ore:ingotLudicrite>, <ore:ingotLudicrite>]]);

# Yellorite Block
	recipes.remove(<bigreactors:blockyellorium>);
	
# Anglesite - Crystal made of ThermalExpansion/EnvironmentalTech/Ender IO/AE2 materials
	scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<bigreactors:mineralanglesite>, 100000000, 1000000, 
	<appliedenergistics2:material:48>, [<thermalfoundation:material:894>,
	<thermalfoundation:material:893>,  <thermalfoundation:material:895>, 
	<thermalfoundation:material:865>,
	<environmentaltech:litherite_crystal>, <environmentaltech:erodium_crystal>, 
	<environmentaltech:kyronite_crystal>, <environmentaltech:pladium_crystal>, 
	<environmentaltech:ionite_crystal>, <environmentaltech:aethium_crystal>,
	<enderio:item_material:44>, <enderio:item_basic_capacitor:2>, 
	<enderio:item_material:17>,  <enderio:item_material:18>, <enderio:item_material:19>]);	  

# Benitoite - Crystal made of Botania/AstralSorcery/BloodMagic/Thaumcraft materials
	scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<bigreactors:mineralbenitoite>, 100000000, 1000000, <botania:manaresource:5>, 
	[<botania:manaresource:9>, <botania:manaresource:1>, <botania:manaresource:7>, 
	<botania:pylon:1>, <botania:manaresource:2>, <botania:manaresource:8>, 
	<astralsorcery:itemcraftingcomponent:2>, #<astralsorcery:itemshiftingstar>.withTag({}), 
	<astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcoloredlens:6>, 
	<bloodmagic:blood_rune:9>, <bloodmagic:blood_rune:10>, <bloodmagic:points_upgrade>,
	<bloodmagic:slate:4>, #<astralsorcery:itemcelestialcrystal>.withTag({}),
	#<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "vitium"}]}), 
	<thaumcraft:mechanism_complex>]);
	
# Conflicts
utils.rh(<bigreactors:ingotgraphite>);
recipes.removeByRecipeName("bigreactors:block_graphite");
recipes.removeByRecipeName("nuclearcraft:tile.nuclearcraft.ingot_block.graphite_1");