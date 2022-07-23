#priority 950
#modloaded immersivepetroleum

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;
import scripts.jei.requious.add as addRecipe;

val panel = scripts.jei.requious.getVisSlots(0,1);
var x = <assembly:fluid_reservoir>;
x.addJEICatalyst(<immersivepetroleum:metal_multiblock:2>);
x.setJEIItemSlot(0, 0, 'input0'); // World
x.setJEIEnergySlot(1, 0, 'energy_in', "rf"); // RF/t
x.setJEIItemSlot(2, 0, 'input1', panel); // Weight
scripts.jei.requious.arrow(x, 3, 0);
x.setJEIFluidSlot(4, 0, 'fluid0'); // 
x.setJEIFluidSlot(5, 0, 'fluid1'); // 
x.setJEIFluidSlot(6, 0, 'fluid2'); // 
x.setJEIItemSlot(4, 1, 'input2', panel); // Info
x.setJEIItemSlot(5, 1, 'input3', panel); // Info
x.setJEIItemSlot(6, 1, 'input4', panel); // Info

function add(
	name as string,
	liqud as ILiquidStack,
	minSize as int,
	maxSize as int,
	replenishRate as int,
	pumpSpeed as int,
	weight as int,
	rft as int,
	dimBlacklist as int[],
	dimWhitelist as int[],
	biomeBlacklist as string[],
	biomeWhitelist as string[]
) as void {
  var dimensions = dimWhitelist.length > 0 ? dimWhitelist[0] as string : "";
  for i, dim in dimWhitelist {
    if(i==0) continue;
    dimensions += ", "~dim;
  }
  <assembly:fluid_reservoir>.addJEIRecipe(AssemblyRecipe.create(function(c) {
    c.addFluidOutput('fluid0', liqud * ((minSize as double + maxSize as double) / 2.0d) as int);
    c.addFluidOutput('fluid1', liqud * pumpSpeed);
    c.addFluidOutput('fluid2', liqud * replenishRate);
  })
  .requireEnergy('energy_in', rft)
  .requireItem("input0", <biomesoplenty:earth>.withTag({display:{Name:"§6"~name}}).withLore(["Dimensions: "~dimensions]))
  .requireItem("input1", <minecraft:heavy_weighted_pressure_plate> * weight)
  .requireItem("input2", <immersivetech:metal_barrel:1>.withTag({display:{Name:"§6AVERAGE SIZE"}}))
  .requireItem("input3", <immersiveengineering:metal_device1:6>.withTag({display:{Name:"§6PUMP SPEED"}}))
  .requireItem("input4", <immersiveengineering:metal_device0:5>.withTag({display:{Name:"§6REPLENISH RATE"}}))
  );
}