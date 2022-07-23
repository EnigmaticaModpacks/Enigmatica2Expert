#priority 950
#modloaded botania

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.requious.SlotVisual;
import mods.requious.AssemblyRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:petro_petunia>;
x.addJEICatalyst(<botania:specialflower>.withTag({type: "petro_petunia"}));
x.addJEICatalyst(<botania:floatingspecialflower>.withTag({type: "petro_petunia"}));
x.setJEIFluidSlot(0, 0, 'liquid_input');
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
x.setJEIItemSlot(2, 0, 'output0');

for fluid, arr in {
/*Inject_js(
Object.entries(
  config('config/acronym/floralchemy.cfg').fuelvalues
).map(([fluid, {burnTime, powerPreTick}]) => 
  [fluid, ((20*60) / burnTime * 1000) | 0, powerPreTick * burnTime]
).sort((a, b) => b[2] - a[2])
.map(([fluid, consumption, manaTotal]) =>
  `  ${('"'+fluid+'":').padEnd(16)}[${consumption}, ${manaTotal}],`
))*/
  "perfect_fuel": [12, 768000000],
  "rocketfuel":   [500, 480000],
  "empoweredoil": [1200, 100000],
  "refined_fuel": [1411, 85000],
  "diesel":       [3428, 17500],
  "crystaloil":   [3428, 17500],
  "biodiesel":    [4800, 12500],
  "biomass":      [4800, 12500],
  "canolaoil":    [8000, 7500],
  "oil":          [12000, 5000],
/**/
} as int[][string] {
  val consumption = arr[0];
  val manaTotal = arr[1];
  x.addJEIRecipe(AssemblyRecipe.create(function(container) {
    container.addItemOutput('output0',
      <botania:manatablet>.withTag({mana: min(500000, manaTotal), display:{Name:"§b"~manaTotal~" Mana"}})
      * (manaTotal / 500000 + 1)
    );
  })
  .requireFluid('liquid_input', game.getLiquid(fluid) * consumption)
  );
}