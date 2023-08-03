import mods.jei.JEI.removeAndHide as rh;
import mods.astralsorcery.Utils;
import crafttweaker.liquid.ILiquidDefinition;
import mods.nuclearcraft.melter;

print("--- loading Endergy.zs ---");

# Remove Conduits and unused alloys
	rh(<enderio:item_endergy_conduit:0>);
	rh(<enderio:item_endergy_conduit:1>);
	rh(<enderio:item_endergy_conduit:2>);
	rh(<enderio:item_endergy_conduit:3>);
	rh(<enderio:item_endergy_conduit:4>);
	rh(<enderio:item_endergy_conduit:5>);
	rh(<enderio:item_endergy_conduit:6>);
	rh(<enderio:item_endergy_conduit:7>);
	rh(<enderio:item_endergy_conduit:8>);
	rh(<enderio:item_endergy_conduit:9>);
	rh(<enderio:item_capacitor_silver>);
	rh(<enderio:item_capacitor_energetic_silver>);
	rh(<enderio:item_capacitor_vivid>);
	rh(<enderio:item_capacitor_stellar>);
	rh(<enderio:item_capacitor_grainy>);
	rh(<enderio:item_alloy_endergy_ingot:0>);
	rh(<enderio:item_alloy_endergy_ingot:1>);
	rh(<enderio:item_alloy_endergy_ingot:4>);
	rh(<enderio:item_alloy_endergy_ingot:5>);
	rh(<enderio:item_alloy_endergy_ingot:6>);
	rh(<enderio:item_alloy_endergy_nugget:0>);
	rh(<enderio:item_alloy_endergy_nugget:1>);
	rh(<enderio:item_alloy_endergy_nugget:4>);
	rh(<enderio:item_alloy_endergy_nugget:5>);
	rh(<enderio:item_alloy_endergy_nugget:6>);
	rh(<enderio:block_alloy_endergy:0>);
	rh(<enderio:block_alloy_endergy:1>);
	rh(<enderio:block_alloy_endergy:4>);
	rh(<enderio:block_alloy_endergy:5>);
	rh(<enderio:block_alloy_endergy:6>);
	rh(<enderio:item_alloy_endergy_ball:0>);
	rh(<enderio:item_alloy_endergy_ball:1>);
	rh(<enderio:item_alloy_endergy_ball:4>);
	rh(<enderio:item_alloy_endergy_ball:5>);
	rh(<enderio:item_alloy_endergy_ball:6>);

# Remove liquids of removed alloys
	mods.tconstruct.Melting.removeRecipe(<liquid:crude_steel>);
	mods.tconstruct.Melting.removeRecipe(<liquid:crystalline_alloy>);
	mods.tconstruct.Melting.removeRecipe(<liquid:crystalline_pink_slime>);
	mods.tconstruct.Melting.removeRecipe(<liquid:energetic_silver>);
	mods.tconstruct.Melting.removeRecipe(<liquid:vivid_alloy>);

	mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:crude_steel>);
	mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:crystalline_alloy>);
	mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:crystalline_pink_slime>);
	mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:energetic_silver>);
	mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:vivid_alloy>);

# Crystalline Capacitor
	recipes.remove(<enderio:item_capacitor_crystalline>);
	recipes.addShapedMirrored("Crystaltine Capacitor",
	<enderio:item_capacitor_crystalline>,
	[[null,<ore:ingotCrystaltine>, null],
	[<enderio:item_basic_capacitor:2>,<ore:dustPrismarine>,<enderio:item_basic_capacitor:2>],
	[null,<ore:ingotCrystaltine>,null]]);

# Anglesite - Crystal made of ThermalExpansion/EnvironmentalTech/Ender IO/AE2 materials
	mods.extendedcrafting.CombinationCrafting.addRecipe(<contenttweaker:anglesite>, 100000000, 1000000, 
	<appliedenergistics2:material:48>, [<thermalfoundation:material:894>,
	<thermalfoundation:material:893>,  <thermalfoundation:material:895>, 
	<thermalfoundation:material:865>,
	<environmentaltech:litherite_crystal>, <environmentaltech:erodium_crystal>, 
	<environmentaltech:kyronite_crystal>, <environmentaltech:pladium_crystal>, 
	<environmentaltech:ionite_crystal>, <environmentaltech:aethium_crystal>,
	<enderio:item_material:44>, <enderio:item_basic_capacitor:2>, 
	<enderio:item_material:17>,  <enderio:item_material:18>, <enderio:item_material:19>]);	

# Benitoite - Crystal made of Botania/AstralSorcery/BloodMagic/Thaumcraft materials
#	recipes.remove(<biomesoplenty:crystal>);
	mods.extendedcrafting.CombinationCrafting.addRecipe(<contenttweaker:benitoite>, 100000000, 1000000, <botania:manaresource:5>, 
	[<botania:manaresource:9>, <botania:manaresource:1>, <botania:manaresource:7>, 
	<botania:pylon:1>, <botania:manaresource:2>, <botania:manaresource:8>, 
	<astralsorcery:itemcraftingcomponent:2>, <extendedcrafting:material:40>, 
	<astralsorcery:itemcraftingcomponent:4>, <astralsorcery:itemcoloredlens:6>, 
	<bloodmagic:blood_rune:9>, <bloodmagic:blood_rune:10>, <bloodmagic:points_upgrade>,
	<bloodmagic:slate:4>, <thaumcraft:mechanism_complex>]);
	
	
# Blutonium Block // Melodic Block
	recipes.addShapedMirrored("Melodic Block", 
	<enderio:block_alloy_endergy:2>, 
	[[<ore:blockMithril>, <ore:blockCobalt>, <ore:blockMithril>],
	[<ic2:nuclear:7>, <ic2:nuclear:7>, <ic2:nuclear:7>], 
	[<ore:depletedFuelLEU235>, <actuallyadditions:block_crystal_empowered:1>, <ore:depletedFuelLEU235>]]);

# Ludicrite Block // Stellar Block
	mods.forestry.Carpenter.addRecipe(<enderio:block_alloy_endergy:3>, 
	[[<ore:gemAmethyst>, <ore:blockBlaze>, <ore:gemAmethyst>],
	[<ore:ingotAlumite>, <enderio:block_alloy_endergy:2>, <ore:ingotAlumite>], 
	[<ore:blockEnderium>, <botania:storage:2>, <ore:blockEnderium>]], 
	40, <liquid:liquiddna> * 1000);