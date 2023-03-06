import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;

val oreDictModularium = <ore:modularium>;
oreDictModularium.add(<contenttweaker:modularium>);

# Arcane Crafting Engine
    recipes.addShapedMirrored("Arcane Crafting Engine", 
    <mbd:arcane>, 
    [[<ore:modularium>, <thaumcraft:mechanism_complex>, <ore:modularium>],
    [<thaumcraft:salis_mundus>, <mbd:base_casing>, <thaumcraft:salis_mundus>], 
    [<ore:modularium>, <thaumcraft:salis_mundus>, <ore:modularium>]]);

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
	[[<ore:modularium>, <ore:circuitAdvanced>, <ore:modularium>],
	[<ore:circuitAdvanced>, <mbd:base_casing>, <ore:circuitAdvanced>], 
	[<ore:modularium>, <ore:circuitAdvanced>, <ore:modularium>]]);

# Base Casing
    recipes.addShapedMirrored("Base Casing", 
    <mbd:base_casing> * 2, 
    [[null, <ore:modularium>, null],
    [<ore:modularium>, <immersiveengineering:metal_decoration0:3>, <ore:modularium>], 
    [null, <ore:modularium>, null]]);

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
