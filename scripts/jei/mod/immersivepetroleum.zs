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

function getLittleSphere(block as IItemStack) as IItemStack {
  return <littletiles:multitiles>.withTag({tiles: [{
    boxes: [
      [0,2,3,1,3,5] as int[],[0,3,2,1,5,6] as int[],[0,5,3,1,6,5] as int[],[1,1,2,2,2,6] as int[],
      [1,2,1,2,6,7] as int[],[1,6,2,2,7,6] as int[],[2,0,3,3,1,5] as int[],[2,1,1,3,3,7] as int[],
      [2,3,0,3,5,8] as int[],[2,5,1,3,7,7] as int[],[2,7,3,3,8,5] as int[],[3,0,2,5,1,6] as int[],
      [3,1,1,6,2,7] as int[],[3,2,0,5,6,8] as int[],[3,6,1,6,7,7] as int[],[3,7,2,5,8,6] as int[],
      [5,0,3,6,1,5] as int[],[5,2,1,7,3,7] as int[],[5,3,0,6,5,8] as int[],[5,5,1,7,6,7] as int[],
      [5,7,3,6,8,5] as int[],[6,1,2,7,2,6] as int[],[6,3,1,7,5,7] as int[],[6,6,2,7,7,6] as int[],
      [7,2,3,8,3,5] as int[],[7,3,2,8,5,6] as int[],[7,5,3,8,6,5] as int[]
    ],tile: {block: block.definition.id + (block.damage==0 ? '' : ':'+block.damage)}}],
    min: [0,0,0] as int[],size: [8,8,8] as int[],grid: 8,count: 27,structure: {blocks: [] as int[],id: "fixed"}}
  );
}

function getArchSphere(block as IItemStack) as IItemStack {
  return <architecturecraft:shape>.withTag({Shape: 33, BaseName: block.definition.id, BaseData: block.damage});
}

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

  val represent = scripts.category.dims.represent[dimWhitelist[0]];
  val representItem = !isNull(represent) ? getLittleSphere(represent) : <biomesoplenty:earth>;

  <assembly:fluid_reservoir>.addJEIRecipe(AssemblyRecipe.create(function(c) {
    c.addFluidOutput('fluid0', liqud * ((minSize as double + maxSize as double) / 2.0d) as int);
    c.addFluidOutput('fluid1', liqud * pumpSpeed);
    c.addFluidOutput('fluid2', liqud * replenishRate);
  })
  .requireEnergy('energy_in', rft)
  .requireItem("input0", representItem.updateTag({display:{Name:"§6"~name}}).withLore(["Dimensions: "~dimensions]))
  .requireItem("input1", <minecraft:heavy_weighted_pressure_plate> * weight)
  .requireItem("input2", <immersivetech:metal_barrel:1>.withTag({display:{Name:"§6AVERAGE SIZE"}}))
  .requireItem("input3", <immersiveengineering:metal_device1:6>.withTag({display:{Name:"§6PUMP SPEED"}}))
  .requireItem("input4", <immersiveengineering:metal_device0:5>.withTag({display:{Name:"§6REPLENISH RATE"}}))
  );
}