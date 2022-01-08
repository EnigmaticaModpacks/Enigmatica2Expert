#modloaded modularmachinery

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.craft.grid.Grid;

val modIngrs = {

arcane_crafting_engine:
    [[<ore:ingotModularium>, <thaumcraft:mechanism_complex>, <ore:ingotModularium>],
    [<thaumcraft:salis_mundus>, <immersiveengineering:blueprint>.anyDamage(), <thaumcraft:salis_mundus>], 
    [<ore:ingotModularium>, <thaumcraft:salis_mundus>, <ore:ingotModularium>]],

advanced_thermionic_fabricator:
	[[<modularmachinery:blockcasing>, <aeadditions:storage.component:8>, <modularmachinery:blockcasing>],
	[<forestry:fabricator>, <immersiveengineering:blueprint>.anyDamage(), <forestry:fabricator>], 
	[<modularmachinery:blockcasing>, <aeadditions:fluidcrafter>, <modularmachinery:blockcasing>]],

starlight_crafting_engine:
	[[<ore:ingotModularium>, <astralsorcery:itemshiftingstar>, <ore:ingotModularium>],
	[<ore:ingotModularium>, <immersiveengineering:blueprint>.anyDamage(), <ore:ingotModularium>], 
	[<ore:ingotModularium>, <astralsorcery:itemcraftingcomponent:4>, <ore:ingotModularium>]],

advanced_carpenter:
    [[<modularmachinery:blockcasing>, <thermaldynamics:duct_16:6> | <thermaldynamics:duct_16:7>, <modularmachinery:blockcasing>],
    [<forestry:carpenter>, <immersiveengineering:blueprint>.anyDamage(), <forestry:carpenter>], 
    [<modularmachinery:blockcasing>, <aeadditions:fluidcrafter>, <modularmachinery:blockcasing>]],
    
advanced_scrap_factory:
	[[<modularmachinery:blockcasing>, <ore:gearVibrant>, <modularmachinery:blockcasing>],
	[<forge:bucketfilled>.withTag({FluidName: "ic2pahoehoe_lava", Amount: 1000}), <immersiveengineering:blueprint>.anyDamage(), <forge:bucketfilled>.withTag({FluidName: "ic2distilled_water", Amount: 1000})], 
	[<modularmachinery:blockcasing>, <ore:gearVibrant>, <modularmachinery:blockcasing>]],

hydroponics:
  Grid(["pretty",
    "▬ G ▬",
    "G E G",
    "▬ § ▬"], {
    "E": <immersiveengineering:blueprint:*>,         # Engineer's Blueprint
    "G": <actuallyadditions:block_greenhouse_glass>, # Greenhouse Glass
    "§": <appliedenergistics2:quartz_growth_accelerator>,
    "▬": <ore:ingotModularium>,                      # Modularium Alloy
  }).shaped(),

} as IIngredient[][][string];

for name, grid in modIngrs {
  val blueprint = <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:"~name});
	recipes.addShapedMirrored("modularmachinery " ~ name, blueprint, grid);

    val controller = itemUtils.getItem("modularcontroller:"~name~"_controller");
    if(isNull(controller)) continue;
	recipes.addShapeless("modularcontroller " ~ name, controller, [<modularmachinery:blockcontroller>, blueprint]);
}

# [Machine Vent] from [Machine Casing][+1]
craft.remake(<modularmachinery:blockcasing:1>, [
    "T⌂T"], {
    "⌂": <modularmachinery:blockcasing>,    # Machine Casing
    "T": <mekanismgenerators:turbineblade>, # Turbine Blade
});


# [Machine Controller] from [Machine Frame][+4]
craft.remake(<modularmachinery:blockcontroller>, ["pretty",
    "E S E",
    "M a M",
    "C M C"], {
    "a": <rftools:machine_frame>,        # Machine Frame
    "C": <advancedrocketry:ic:3>,        # Control Circuit Board
    "S": <rftools:screen>,               # Screen
    "E": <forestry:chipsets:1>.withTag({T: 1 as short}), # Enhanced Circuit Board
    "M": <modularmachinery:blockcasing>, # Machine Casing
});

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
scripts.wrap.forestry.Carpenter.addRecipe(<modularmachinery:blockcasing:5>, 
    scripts.craft.grid.Grid(["pretty",
    "P ▬ P",
    "U I U",
    "P ▬ P"], {
    "I": <forestry:chipsets:3>.withTag({T: 3 as short}, false), # Intricate Circuit Board
    "P": <appliedenergistics2:material:17>, # Printed Engineering Circuit
    "U": <ore:circuitUltimate>,             # Ultimate Control Circuit
    "▬": <ore:ingotModularium>,             # Modularium Alloy
    }).shaped(),
    40, <liquid:water> * 1000
);



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
    utils.rh(item);
}