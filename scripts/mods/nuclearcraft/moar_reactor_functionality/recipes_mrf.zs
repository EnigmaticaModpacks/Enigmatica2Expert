/*
Copyright Bob Bartsch, 2023

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

import crafttweaker.liquid.ILiquidStack;

mods.nuclearcraft.FissionHeating.addRecipe(<fluid:carbon_dioxide> * 3, <fluid:hot_carbon_dioxide>, 5);
mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_carbon_dioxide>, <fluid:carbon_dioxide> * 3, 17.00, 3.00, 1.00);

/* -=-=-=-=-=-=-=-=- SC CO2 Recipes -=-=-=-=-=-=-=-=- */
mods.nuclearcraft.Enricher.addRecipe(<ic2:dynamite>, <fluid:hot_carbon_dioxide> * 16000, <fluid:compr_carbon_dioxide> * 4000, 0.1, 0.0, 0.0);
mods.nuclearcraft.FissionHeating.addRecipe(<fluid:compr_carbon_dioxide>, <fluid:supercritical_carbon_dioxide>, 8);
mods.nuclearcraft.Turbine.addRecipe(<fluid:supercritical_carbon_dioxide>, <fluid:critical_exhaust_carbon_dioxide> * 8, 24.0, 8.0, 1.00);
mods.nuclearcraft.FissionHeating.addRecipe(<fluid:critical_exhaust_carbon_dioxide> * 8, <fluid:compr_carbon_dioxide>, 1);

/* -=-=-=-=-=-=-=-=- Pseudo-Decay Pool System -=-=-=-=-=-=-=-=- */
val radioHeat = {
  <fluid:strontium_90>  : <fluid:samarium> * 61,
  <fluid:ruthenium_106> : <fluid:silver> * 102,
//<fluid:caesium_137>   : <fluid:samarium> * 204, Managed by Trinity
  <fluid:promethium_147>: <fluid:samarium> * 244,
  <fluid:europium_155>  : <fluid:samarium> * 367,
} as ILiquidStack[ILiquidStack];

for input, output in radioHeat {
  mods.immersivetechnology.HeatExchanger.addRecipe(
    <fluid:preheated_water> * (100 * output.amount), output * 1,
    <fluid:condensate_water> * (100 * output.amount), input * 1,
    64, 4
  );
}