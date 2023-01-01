#modloaded requious

#priority 975

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.requious.AssemblyRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:expire_in_block>;
x.addJEICatalyst(<biomesoplenty:blue_fire>);
x.addJEICatalyst(<cyclicmagic:fire_frost>);
x.addJEICatalyst(<cyclicmagic:fire_dark>);
x.addJEICatalyst(<enderio:item_cold_fire_igniter>.withTag({"enderio:famount": 1000}));
x.addJEICatalyst(<cyclicmagic:fire_starter>);
x.addJEICatalyst(<cyclicmagic:ender_blaze>);
x.setJEIDurationSlot(2,0,"duration", scripts.jei.requious.getVisSlots(5,1));
scripts.jei.requious.addInsOuts(x, [[0,0],[1,0]], [[3,0]]);

function add(input as IIngredient, block as IItemStack, output as IItemStack) as void {
  <assembly:expire_in_block>.addJEIRecipe(AssemblyRecipe.create(function(c) {
      c.addItemOutput('output0', output);
    })
    .requireItem("input0", input)
    .requireItem("input1", block)
    .requireDuration("duration", 20*60*5)
  );
}
