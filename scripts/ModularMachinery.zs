import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded modularmachinery


# Arcane Crafting Engine
    recipes.addShapedMirrored("Arcane Crafting Engine", 
    <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:arcane_crafting_engine"}), 
    [[<ore:ingotModularium>, <thaumcraft:mechanism_complex>, <ore:ingotModularium>],
    [<thaumcraft:salis_mundus>, <immersiveengineering:blueprint>.anyDamage(), <thaumcraft:salis_mundus>], 
    [<ore:ingotModularium>, <thaumcraft:salis_mundus>, <ore:ingotModularium>]]);

# Advanced Thermionic Fabricator
	recipes.addShapedMirrored("Advanced Thermionic Fabricator", 
	<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:advanced_thermionic_fabricator"}), 
	[[<modularmachinery:blockcasing>, <extracells:storage.component:8>, <modularmachinery:blockcasing>],
	[<forestry:fabricator>, <immersiveengineering:blueprint>.anyDamage(), <forestry:fabricator>], 
	[<modularmachinery:blockcasing>, <extracells:fluidcrafter>, <modularmachinery:blockcasing>]]);

# Starlight Crafting Engine
	recipes.addShapedMirrored("Starlight Crafting Engine", 
	<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:starlight_crafting_engine"}), 
	[[<ore:ingotModularium>, <astralsorcery:itemshiftingstar>, <ore:ingotModularium>],
	[<ore:ingotModularium>, <immersiveengineering:blueprint>.anyDamage(), <ore:ingotModularium>], 
	[<ore:ingotModularium>, <astralsorcery:itemcraftingcomponent:4>, <ore:ingotModularium>]]);

# Advanced Carpenter
    recipes.addShapedMirrored("Advanced Carpenter", 
    <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:advanced_carpenter"}), 
    [[<modularmachinery:blockcasing>, <appliedenergistics2:material:57>, <modularmachinery:blockcasing>],
    [<forestry:carpenter>, <immersiveengineering:blueprint>.anyDamage(), <forestry:carpenter>], 
    [<modularmachinery:blockcasing>, <extracells:fluidcrafter>, <modularmachinery:blockcasing>]]);
    
# Advanced Metallurgic Fabricator
	recipes.addShapedMirrored("Advanced Metallurgic Fabricator", 
	<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:advanced_metallurgic_fabricator"}), 
	[[<ore:ingotModularium>, <ore:circuitAdvanced>, <ore:ingotModularium>],
	[<ore:circuitAdvanced>, <immersiveengineering:blueprint>.anyDamage(), <ore:circuitAdvanced>], 
	[<ore:ingotModularium>, <ore:circuitAdvanced>, <ore:ingotModularium>]]);

# Machine Vent
    recipes.remove(<modularmachinery:blockcasing:1>);
    recipes.addShapedMirrored("Machine Vent", 
    <modularmachinery:blockcasing:1> * 2, 
    [[<ic2:overclocked_heat_vent>, <advancedrocketry:pipesealer>, <ic2:overclocked_heat_vent>],
    [<modularmachinery:blockcasing>, <mekanismgenerators:generator:12>, <modularmachinery:blockcasing>], 
    [<ic2:overclocked_heat_vent>, <modularmachinery:blockcasing>, <ic2:overclocked_heat_vent>]]);

# Machine Controller
    if (!isNull(itemUtils.getItem("appliedenergistics2:controller"))) {
      recipes.remove(<modularmachinery:blockcontroller>);
      recipes.addShaped("Modular Controller", 
      <modularmachinery:blockcontroller>, 
      [[<forestry:chipsets:1>.withTag({}), <rftools:screen>, <forestry:chipsets:1>.withTag({})],
      [<modularmachinery:blockcasing>, itemUtils.getItem("appliedenergistics2:controller"), <modularmachinery:blockcasing>], 
      [null, <modularmachinery:blockcasing>, null]]);
    } else {
      recipes.remove(<modularmachinery:blockcontroller>);
      recipes.addShaped("Modular Controller",
      <modularmachinery:blockcontroller>,
      [[<forestry:chipsets:1>.withTag({}), <rftools:screen>, <forestry:chipsets:1>.withTag({})],
      [<modularmachinery:blockcasing>, <appliedenergistics2:energy_acceptor>, <modularmachinery:blockcasing>],
      [null, <modularmachinery:blockcasing>, null]]);
    }

# Machine Casing
    recipes.remove(<modularmachinery:blockcasing>);
    recipes.addShapedMirrored("Modular Machinery Machine Casing", 
    <modularmachinery:blockcasing> * 2, 
    [[null, <ore:ingotModularium>, null],
    [<ore:ingotModularium>, <immersiveengineering:metal_decoration0:3>, <ore:ingotModularium>], 
    [null, <ore:ingotModularium>, null]]);

# Machine Gearbox
    recipes.remove(<modularmachinery:blockcasing:3>);
    recipes.addShapedMirrored("Machine Gearbox", 
    <modularmachinery:blockcasing:3>, 
    [[null, <ore:stickIridium>, null],
    [<modularmachinery:blockcasing>, <ore:gearVibrant>, <modularmachinery:blockcasing>], 
    [null, <modularmachinery:blockcasing>, null]]);

# Machine Circuitry
    recipes.remove(<modularmachinery:blockcasing:5>);
    recipes.addShapedMirrored("Machine Circuitry", 
    <modularmachinery:blockcasing:5>, 
    [[null, <immersiveengineering:wirecoil:5>, null],
    [<modularmachinery:blockcasing>, <forestry:chipsets:3>.withTag({T: 3 as short}, false), <modularmachinery:blockcasing>], 
    [null, <modularmachinery:blockcasing>, null]]);

# Modularium
    recipes.remove(<modularmachinery:itemmodularium>);
    recipes.addShapedMirrored("Modularium", 
    <modularmachinery:itemmodularium> * 2, 
    [[<ore:ingotElectricalSteel>, <ore:ingotPlatinum>, <ore:ingotElectricalSteel>],
    [<actuallyadditions:item_crystal_empowered:1>, <ore:itemPulsatingCrystal>, <actuallyadditions:item_crystal_empowered:1>], 
    [<ore:ingotElectricalSteel>, <ore:ingotPlatinum>, <ore:ingotElectricalSteel>]]);


    recipes.addShaped("EnergyOutHatch2", <modularmachinery:blockenergyoutputhatch:2>, [[null, <modularmachinery:blockcasing>, null],[<modularmachinery:blockcasing>, <enderio:block_buffer:1>, <modularmachinery:blockcasing>], [null, <actuallyadditions:block_laser_relay>, null]]);

    recipes.addShaped("EnergyInHatch2", <modularmachinery:blockenergyinputhatch:2>, [[null, <actuallyadditions:block_laser_relay>, null],[<modularmachinery:blockcasing>, <enderio:block_buffer:1>, <modularmachinery:blockcasing>], [null, <modularmachinery:blockcasing>, null]]);

    recipes.addShaped("FluidOutHatch2", <modularmachinery:blockfluidoutputhatch:2>, [[null, <modularmachinery:blockcasing>, null],[<modularmachinery:blockcasing>, <nuclearcraft:buffer>, <modularmachinery:blockcasing>], [null, <advgenerators:fluid_output_select>, null]]);

    recipes.addShaped("FluidInHatch2", <modularmachinery:blockfluidinputhatch:2>, [[null, <advgenerators:fluid_input>, null],[<modularmachinery:blockcasing>, <nuclearcraft:buffer>, <modularmachinery:blockcasing>], [null, <modularmachinery:blockcasing>, null]]);
    recipes.addShaped("FluidInHatch3", <modularmachinery:blockfluidinputhatch:3>, [[null, <actuallyadditions:block_laser_relay_fluids>, null],[<modularmachinery:blockcasing>, <modularmachinery:blockfluidinputhatch:2>, <modularmachinery:blockcasing>], [null, <modularmachinery:blockcasing>, null]]);
    recipes.addShaped("FluidInHatch4", <modularmachinery:blockfluidinputhatch:4>, [[null, <actuallyadditions:block_laser_relay_fluids>, null],[<modularmachinery:blockcasing>, <modularmachinery:blockfluidinputhatch:3>, <modularmachinery:blockcasing>], [null, <modularmachinery:blockcasing>, null]]);
    recipes.addShaped("FluidInHatch5", <modularmachinery:blockfluidinputhatch:5>, [[null, <actuallyadditions:block_laser_relay_fluids>, null],[<modularmachinery:blockcasing>, <modularmachinery:blockfluidinputhatch:4>, <modularmachinery:blockcasing>], [null, <modularmachinery:blockcasing>, null]]);
   
    recipes.addShaped("ItemOutHatch2", <modularmachinery:blockoutputbus:2>, [[null, <advgenerators:item_output>, null],[<modularmachinery:blockcasing>, <enderio:block_buffer>, <modularmachinery:blockcasing>], [null, <modularmachinery:blockcasing>, null]]);
    recipes.addShaped("ItemOutHatch3", <modularmachinery:blockoutputbus:3>, [[null, <modularmachinery:blockcasing>, null],[<modularmachinery:blockcasing>, <modularmachinery:blockoutputbus:2>, <modularmachinery:blockcasing>], [null, <actuallyadditions:block_laser_relay_item>, null]]);
    recipes.addShaped("ItemOutHatch4", <modularmachinery:blockoutputbus:4>, [[null, <modularmachinery:blockcasing>, null],[<modularmachinery:blockcasing>, <modularmachinery:blockoutputbus:3>, <modularmachinery:blockcasing>], [null, <actuallyadditions:block_laser_relay_item>, null]]);
    recipes.addShaped("ItemOutHatch5", <modularmachinery:blockoutputbus:5>, [[null, <modularmachinery:blockcasing>, null],[<modularmachinery:blockcasing>, <modularmachinery:blockoutputbus:4>, <modularmachinery:blockcasing>], [null, <actuallyadditions:block_laser_relay_item_whitelist>, null]]);

    recipes.addShaped("ItemInHatch2", <modularmachinery:blockinputbus:2>, [[null, <advgenerators:item_input>, null],[<modularmachinery:blockcasing>, <enderio:block_buffer>, <modularmachinery:blockcasing>], [null, <modularmachinery:blockcasing>, null]]);
    recipes.addShaped("ItemInHatch3", <modularmachinery:blockinputbus:3>, [[null, <actuallyadditions:block_laser_relay_item>, null],[<modularmachinery:blockcasing>, <modularmachinery:blockinputbus:2>, <modularmachinery:blockcasing>], [null, <modularmachinery:blockcasing>, null]]);
    recipes.addShaped("ItemInHatch4", <modularmachinery:blockinputbus:4>, [[null, <actuallyadditions:block_laser_relay_item>, null],[<modularmachinery:blockcasing>, <modularmachinery:blockinputbus:3>, <modularmachinery:blockcasing>], [null, <modularmachinery:blockcasing>, null]]);
    recipes.addShaped("ItemInHatch5", <modularmachinery:blockinputbus:5>, [[null, <actuallyadditions:block_laser_relay_item_whitelist>, null],[<modularmachinery:blockcasing>, <modularmachinery:blockinputbus:4>, <modularmachinery:blockcasing>], [null, <modularmachinery:blockcasing>, null]]);

var itemsToRemove = [
    <modularmachinery:blockcasing:4>,
    <modularmachinery:blockinputbus>,
    <modularmachinery:blockinputbus:1>,
    <modularmachinery:blockinputbus:6>,
	
    <modularmachinery:blockoutputbus>,
    <modularmachinery:blockoutputbus:1>,
    <modularmachinery:blockoutputbus:6>,
	
    <modularmachinery:blockfluidinputhatch>,
    <modularmachinery:blockfluidinputhatch:1>,
    <modularmachinery:blockfluidinputhatch:6>,
    <modularmachinery:blockfluidinputhatch:7>,
	
    <modularmachinery:blockfluidoutputhatch>,
    <modularmachinery:blockfluidoutputhatch:1>,
    <modularmachinery:blockfluidoutputhatch:6>,
    <modularmachinery:blockfluidoutputhatch:7>,
	
    <modularmachinery:blockenergyinputhatch>,
    <modularmachinery:blockenergyinputhatch:1>,
	<modularmachinery:blockenergyinputhatch:3>,
	<modularmachinery:blockenergyinputhatch:4>,
	<modularmachinery:blockenergyinputhatch:5>,
    <modularmachinery:blockenergyinputhatch:6>,
    <modularmachinery:blockenergyinputhatch:7>,
	
    <modularmachinery:blockenergyoutputhatch>,
    <modularmachinery:blockenergyoutputhatch:1>,
	<modularmachinery:blockenergyoutputhatch:3>,
    <modularmachinery:blockenergyoutputhatch:4>,
    <modularmachinery:blockenergyoutputhatch:5>,
    <modularmachinery:blockenergyoutputhatch:6>,
    <modularmachinery:blockenergyoutputhatch:7>
	
] as IItemStack[];

for item in itemsToRemove {
    rh(item);
}
