#priority 950
#modloaded immersiveengineering

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;
import scripts.jei.requious.add as addRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:garden_cloche>;
x.addJEICatalyst(<immersiveengineering:metal_device1:13>);
x.setJEIFluidSlot(0, 0, 'fluid_in');
x.setJEIDurationSlot(2,0,"duration", SlotVisual.arrowRight());
scripts.jei.requious.addInsOuts(x, [[1,0]], [[3,0]]);

function addGardenClocheFluid(fluid as ILiquidStack, mult as float) as void {
  <assembly:garden_cloche>.addJEIRecipe(AssemblyRecipe.create(function(c) {
    c.addItemOutput('output0', <minecraft:potato> * 2);
  })
  .requireFluid('fluid_in', fluid * 100)
  .requireItem("input0", <minecraft:potato>)
  .requireDuration("duration", 40.0f * (1.0f / mult))
  );
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:chemthrower>;
x.addJEICatalyst(<immersiveengineering:chemthrower>);
x.addJEICatalyst(<immersiveengineering:metal_device1:10>);
x.setJEIFluidSlot(0, 0, 'fluid_in');
x.setJEIDurationSlot(2,0,"duration", SlotVisual.arrowRight());
scripts.jei.requious.addInsOuts(x, [[1,0]], [[3,0]]);

function addChemthrower(fluid as ILiquidStack, blockInput as IIngredient, output as IItemStack) as void {
  val rec = AssemblyRecipe.create(function(c) {
    c.addItemOutput('output0', output);
  });
  rec.requireFluid("fluid_in", fluid);
  if(!isNull(blockInput)) rec.requireItem("input0", blockInput);
  
  <assembly:chemthrower>.addJEIRecipe(rec);
}

addChemthrower(<fluid:concrete>, null, <immersiveengineering:stone_decoration:9>);
