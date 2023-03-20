import mods.jei.JEI.removeAndHide as rh;
import mods.astralsorcery.Utils;
#modloaded bigreactors

	
# *======= Recipes =======*

# Cyanite in NuclearCraft Fission Reactor
	mods.nuclearcraft.fission.addRecipe([<immersiveengineering:metal:5>, <bigreactors:ingotmetals:1>, 4800.0, 100.0, 40.0, "URANIUM"]);

# Reactor Controller
	recipes.remove(<bigreactors:reactorcontroller>);
	mods.extendedcrafting.TableCrafting.addShaped(0, 
	<bigreactors:reactorcontroller>, 
	[[<nuclearcraft:fission_block>, <tconstruct:large_plate>.withTag({Material: "lead"}), <nuclearcraft:fission_block>],
	[<ore:plateUranium>, <ic2:te:22>, <ore:plateUranium>], 
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

# Reactor Fuel Rod
	recipes.remove(<bigreactors:reactorfuelrod>);
	recipes.addShapedMirrored("ER Reactor Fuel Rod", 
	<bigreactors:reactorfuelrod>, 
	[[<ore:ingotGraphite>, <ore:blockGlassHardened>, <ore:ingotGraphite>],
	[<ore:ingotUranium>, <ore:blockGlassHardened>, <ore:ingotUranium>], 
	[<ore:ingotGraphite>, <ore:blockGlassHardened>, <ore:ingotGraphite>]]);

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

# Blutonium Block
	recipes.remove(<bigreactors:blockmetals:3>);
	recipes.addShapedMirrored("Blutonium Block", 
	<bigreactors:blockmetals:3>, 
	[[<ore:blockMithril>, <ore:blockCobalt>, <ore:blockMithril>],
	[<ic2:nuclear:7>, <ic2:nuclear:7>, <ic2:nuclear:7>], 
	[<ore:blockCyanite>, <actuallyadditions:block_crystal_empowered:1>, <ore:blockCyanite>]]);
# Blutonium Ingot	
	recipes.remove(<bigreactors:ingotmetals:3>);
	recipes.addShapeless("Blutonium Ingot from Block", 
	<bigreactors:ingotmetals:3> * 9, 
	[<bigreactors:blockmetals:3>]);
# Blutonium Ingot -> Block
	recipes.addShaped("Blutonium Ingots to Block", 
	<bigreactors:blockmetals:3>, 
	[[<ore:ingotBlutonium>, <ore:ingotBlutonium>, <ore:ingotBlutonium>],
	[<ore:ingotBlutonium>, <ore:ingotBlutonium>, <ore:ingotBlutonium>], 
	[<ore:ingotBlutonium>, <ore:ingotBlutonium>, <ore:ingotBlutonium>]]);

# Ludicrite Block
	recipes.remove(<bigreactors:blockmetals:4>);
	mods.forestry.Carpenter.addRecipe(<bigreactors:blockmetals:4>, 
	[[<ore:gemAmethyst>, <ore:blockBlaze>, <ore:gemAmethyst>],
	[<ore:ingotAlumite>, <ore:blockBlutonium>, <ore:ingotAlumite>], 
	[<ore:blockEnderium>, <botania:storage:2>, <ore:blockEnderium>]], 
	40, <liquid:liquiddna> * 1000);
	
	recipes.addShaped("Ludicrite Block From Ingots", 
	<bigreactors:blockmetals:4>, 
	[[<ore:ingotLudicrite>, <ore:ingotLudicrite>, <ore:ingotLudicrite>],
	[<ore:ingotLudicrite>, <ore:ingotLudicrite>, <ore:ingotLudicrite>], 
	[<ore:ingotLudicrite>, <ore:ingotLudicrite>, <ore:ingotLudicrite>]]);

# Yellorite Block
	recipes.remove(<bigreactors:blockmetals>);
	
# Anglesite - Crystal made of ThermalExpansion/EnvironmentalTech/Ender IO/AE2 materials
	mods.extendedcrafting.CombinationCrafting.addRecipe(<bigreactors:minerals>, 100000000, 1000000, 
	<appliedenergistics2:material:48>, [<thermalfoundation:material:894>,
	<thermalfoundation:material:893>,  <thermalfoundation:material:895>, 
	<thermalfoundation:material:865>,
	<environmentaltech:litherite_crystal>, <environmentaltech:erodium_crystal>, 
	<environmentaltech:kyronite_crystal>, <environmentaltech:pladium_crystal>, 
	<environmentaltech:ionite_crystal>, <environmentaltech:aethium_crystal>,
	<enderio:item_material:44>, <enderio:item_basic_capacitor:2>, 
	<enderio:item_material:17>,  <enderio:item_material:18>, <enderio:item_material:19>]);	  

# Benitoite - Crystal made of Botania/AstralSorcery/BloodMagic/Thaumcraft materials
	mods.extendedcrafting.CombinationCrafting.addRecipe(<bigreactors:minerals:1>, 100000000, 1000000, <botania:manaresource:5>, 
	[<botania:manaresource:9>, <botania:manaresource:1>, <botania:manaresource:7>, 
	<botania:pylon:1>, <botania:manaresource:2>, <botania:manaresource:8>, 
	<astralsorcery:itemcraftingcomponent:2>, #<astralsorcery:itemshiftingstar>.withTag({}), 
	<astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcoloredlens:6>, 
	<bloodmagic:blood_rune:9>, <bloodmagic:blood_rune:10>, <bloodmagic:points_upgrade>,
	<bloodmagic:slate:4>, #<astralsorcery:itemcelestialcrystal>.withTag({}),
	#<thaumcraft:phial:1>.withTag({Aspects: [{amount: 10, key: "vitium"}]}), 
	<thaumcraft:mechanism_complex>]);
	
