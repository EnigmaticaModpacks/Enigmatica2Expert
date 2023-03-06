import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;

var creativeTank = <thermalexpansion:tank>.withTag({RSControl: 0 as byte, Creative: 1 as byte, Level: 4 as byte});

# Arcane Crafting Engine
    recipes.addShapedMirrored("Arcane Crafting Engine", 
    <mbd:arcane>, 
    [[<contenttweaker:modularium>, <thaumcraft:mechanism_complex>, <contenttweaker:modularium>],
    [<thaumcraft:salis_mundus>, <mbd:base_casing>, <thaumcraft:salis_mundus>], 
    [<contenttweaker:modularium>, <thaumcraft:salis_mundus>, <contenttweaker:modularium>]]);

# Advanced Thermionic Fabricator
	recipes.addShapedMirrored("Advanced Thermionic Fabricator", 
	<mbd:atf>, 
	[[<mbd:base_casing>, <extracells:storage.component:8>, <mbd:base_casing>],
	[<forestry:fabricator>, <mbd:base_casing>, <forestry:fabricator>], 
	[<mbd:base_casing>, <extracells:fluidcrafter>, <mbd:base_casing>]]);

# Advanced Carpenter
    recipes.addShapedMirrored("Advanced Carpenter", 
    <mbd:acarp>, 
    [[<mbd:base_casing>, <appliedenergistics2:material:57>, <mbd:base_casing>],
    [<forestry:carpenter>, <mbd:base_casing>, <forestry:carpenter>], 
    [<mbd:base_casing>, <extracells:fluidcrafter>, <mbd:base_casing>]]);
    
# Advanced Metallurgic Fabricator
	recipes.addShapedMirrored("Advanced Metallurgic Fabricator", 
	<mbd:amf>, 
	[[<contenttweaker:modularium>, <ore:circuitAdvanced>, <contenttweaker:modularium>],
	[<ore:circuitAdvanced>, <mbd:base_casing>, <ore:circuitAdvanced>], 
	[<contenttweaker:modularium>, <ore:circuitAdvanced>, <contenttweaker:modularium>]]);
	
# Creative Tank Replicator 
	recipes.addShapedMirrored("Creative Tank Replicator", 
	<mbd:ctr>, 
	[[<mbd:base_casing>, <thermalexpansion:frame:148>, <mbd:base_casing>],
	[<thermalexpansion:frame:148>, creativeTank, <thermalexpansion:frame:148>], 
	[<mbd:base_casing>, <thermalexpansion:frame:148>, <mbd:base_casing>]]);

# Base Casing
    recipes.addShapedMirrored("Base Casing", 
    <mbd:base_casing> * 2, 
    [[null, <contenttweaker:modularium>, null],
    [<contenttweaker:modularium>, <immersiveengineering:metal_decoration0:3>, <contenttweaker:modularium>], 
    [null, <contenttweaker:modularium>, null]]);

# Modularium
    recipes.addShapedMirrored("Modularium", 
    <contenttweaker:modularium> * 2, 
    [[<ore:ingotElectricalSteel>, <ore:ingotPlatinum>, <ore:ingotElectricalSteel>],
    [<actuallyadditions:item_crystal_empowered:1>, <ore:itemPulsatingCrystal>, <actuallyadditions:item_crystal_empowered:1>], 
    [<ore:ingotElectricalSteel>, <ore:ingotPlatinum>, <ore:ingotElectricalSteel>]]);

# Item Busses

      recipes.addShaped("Inputbus", 
      <mbd:item_bus_input>, 
      [[<ore:chest>, null, null],
      [<mbd:base_casing>, null, null], 
      [null, null, null]]);

      recipes.addShaped("Outputbus", 
      <mbd:item_bus_output>, 
      [[<mbd:base_casing>, null, null],
      [<ore:chest>, null, null], 
      [null, null, null]]);

recipes.addShapeless("Inputbusconvert",<mbd:item_bus_output>,[<mbd:item_bus_input>]);
recipes.addShapeless("Outputbusconvert",<mbd:item_bus_input>,[<mbd:item_bus_output>]);

# Fluid hatch
      recipes.addShaped("Fluidhatch", 
      <mbd:fluid_hatch>, 
      [[<ore:blockGlass>, null, null],
      [<mbd:base_casing>, null, null], 
      [null, null, null]]);
	  
# Energy hatch
      recipes.addShaped("Energyhatch", 
      <mbd:energy_hatch>, 
      [[<actuallyadditions:item_battery>, null, null],
      [<mbd:base_casing>, null, null], 
      [null, null, null]]);
