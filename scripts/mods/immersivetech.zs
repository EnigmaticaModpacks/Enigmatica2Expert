#modloaded immersivetech

import mods.industrialforegoing.FluidDictionary;

# [Cloud Seed] harder (also BoP Hotspring water as extra)
mods.enderio.Vat.removeRecipe(<liquid:cloud_seed>);
mods.immersivetechnology.CoolingTower.addRecipe(<liquid:cloud_seed> * 500, <liquid:hot_spring_water> * 10, <liquid:ice> * 200, <liquid:ice> * 200, <liquid:ic2hot_water> * 1000, 20);

# Rplace wrong salt
utils.rh(<immersivetech:material>);
mods.immersivetechnology.Distiller.removeRecipe(<liquid:water>);
mods.immersivetechnology.Distiller.addRecipe(<liquid:distwater> * 500, <liquid:water> * 1000, <mekanism:salt>, 2000, 20, 1.0f);

# Cheaper because only for decoration
# [Reinforced Coke Brick]*8 from [Steel Item Casing][+1]
recipes.removeByRecipeName("immersivetech:stone_decoration/reinforced_cokebrick");
craft.shapeless(<immersivetech:stone_decoration> * 8, "CCCC⌂CCCC", {
  "C": <immersiveengineering:stone_decoration>, # Coke Brick
  "⌂": <ic2:casing:5>,                          # Steel Item Casing
});


#------------------------------------------------------------------------
# Harder Electolyze
mods.nuclearcraft.electrolyser.removeRecipeWithInput([<fluid:water> * 1000]);
mods.mekanism.separator.removeRecipe(<liquid:water>);
mods.mekanism.separator.addRecipe(<liquid:water> * 10, 800, <gas:hydrogen> * 2, <gas:oxygen>);
mods.immersivetechnology.ElectrolyticCrucibleBattery.removeRecipe(<fluid:water> * 500);
mods.immersivetechnology.ElectrolyticCrucibleBattery.addRecipe(
  <liquid:hydrogen> * 1000, <liquid:oxygen> * 500, <liquid:deuterium> * 50,
  null, <fluid:water> * 500, 50000, 100
);

#------------------------------------------------------------------------
# Harder Chlorine and Sodium
mods.nuclearcraft.electrolyser.removeRecipeWithInput([<liquid:naoh> * 666]);
mods.mekanism.separator.removeRecipe(<liquid:brine>);
mods.immersivetechnology.ElectrolyticCrucibleBattery.addRecipe(
  <liquid:liquidchlorine> * 100, <liquid:liquidsodium> * 100, null,
  null, <liquid:brine> * 1000, 60000, 100
);

FluidDictionary.add("brine", "moltensalt", 6.6);
FluidDictionary.add("moltensalt", "brine", 0.15);

FluidDictionary.add("liquidchlorine", "chlorine", 6.6);
FluidDictionary.add("chlorine", "liquidchlorine", 0.15);
FluidDictionary.add("liquidsodium", "moltensodium", 6.6);
FluidDictionary.add("moltensodium", "liquidsodium", 0.15);

#------------------------------------------------------------------------
# Harder Diamond Melting
mods.tconstruct.Melting.removeRecipe(<liquid:diamond>);
mods.nuclearcraft.melter.removeRecipeWithOutput([<liquid:diamond> *   74]);
mods.nuclearcraft.melter.removeRecipeWithOutput([<liquid:diamond> *  666]);
mods.nuclearcraft.melter.removeRecipeWithOutput([<liquid:diamond> * 1665]);
mods.nuclearcraft.melter.removeRecipeWithOutput([<liquid:diamond> * 5994]);
mods.immersivetechnology.MeltingCrucible.addRecipe(<liquid:diamond> *   74, <ore:nuggetDiamond>, 960, 4);
mods.immersivetechnology.MeltingCrucible.addRecipe(<liquid:diamond> *  165, <rats:rat_diamond>, 2400, 10);
mods.immersivetechnology.MeltingCrucible.addRecipe(<liquid:diamond> *  666, <ore:gemDiamond>, 9600, 40);
mods.immersivetechnology.MeltingCrucible.addRecipe(<liquid:diamond> *  666, <ore:dustDiamond>, 9600, 40);
mods.immersivetechnology.MeltingCrucible.addRecipe(<liquid:diamond> * 5994, <ore:blockDiamond>, 96000, 400);

#------------------------------------------------------------------------
# Steam compat
# Immersive Tech has about x10-x20 times less steam usage.

# --------------
# Buff boiler output x50
# --------------

//mods.immersivetechnology.Boiler.removeFuel(ILiquidStack input);
mods.immersivetechnology.Boiler.removeFuel(<liquid:biodiesel>); # 10
mods.immersivetechnology.Boiler.removeFuel(<liquid:diesel>);    # 50
mods.immersivetechnology.Boiler.removeFuel(<liquid:gasoline>);  # 7

// mods.immersivetechnology.Boiler.addFuel(ILiquidStack input, int time, double heat);
# Default heat is 0.25
mods.immersivetechnology.Boiler.addFuel(<liquid:biodiesel> * 10, 1, 100);
mods.immersivetechnology.Boiler.addFuel(<liquid:diesel>    * 50, 1, 100);
mods.immersivetechnology.Boiler.addFuel(<liquid:gasoline>  *  7, 1, 100);

//mods.immersivetechnology.Boiler.removeRecipe(ILiquidStack input);
mods.immersivetechnology.Boiler.removeRecipe(<liquid:water>);
mods.immersivetechnology.Boiler.removeRecipe(<liquid:distwater>);

// mods.immersivetechnology.Boiler.addRecipe(ILiquidStack output, ILiquidStack input, int time);
mods.immersivetechnology.Boiler.addRecipe(<liquid:steam> * 2500, <liquid:water>     * 1000, 10);
mods.immersivetechnology.Boiler.addRecipe(<liquid:steam> * 4000, <liquid:distwater> * 1000, 10);

# --------------
# Buff solar x5
# --------------
//mods.immersivetechnology.SolarTower.removeRecipe(ILiquidStack inputFluid);
mods.immersivetechnology.SolarTower.removeRecipe(<liquid:water>);
mods.immersivetechnology.SolarTower.removeRecipe(<liquid:distwater>);

// mods.immersivetechnology.SolarTower.addRecipe(ILiquidStack outputFluid, ILiquidStack inputFluid, int time);
mods.immersivetechnology.SolarTower.addRecipe(<liquid:steam> * 2500, <liquid:water>     * 1000, 20);
mods.immersivetechnology.SolarTower.addRecipe(<liquid:steam> * 4000, <liquid:distwater> * 1000, 20);

# --------------
# Steam turbine use more steam x5
# --------------
//mods.immersivetechnology.SteamTurbine.removeFuel(ILiquidStack input);
mods.immersivetechnology.SteamTurbine.removeFuel(<liquid:steam>);

// mods.immersivetechnology.SteamTurbine.addFuel(ILiquidStack output, ILiquidStack input, int time);
mods.immersivetechnology.SteamTurbine.addFuel(<liquid:exhauststeam> * 500, <liquid:steam> * 500, 1);

# --------------
# Cooling Tower x6
# --------------
// mods.immersivetechnology.CoolingTower.removeRecipe(ILiquidStack inputFluid1, ILiquidStack inputFluid2);
mods.immersivetechnology.CoolingTower.removeRecipe(<liquid:hot_spring_water>, <liquid:water>);

// mods.immersivetechnology.CoolingTower.addRecipe(ILiquidStack outputFluid1, ILiquidStack outputFluid2, ILiquidStack outputFluid3, ILiquidStack inputFluid1, ILiquidStack inputFluid2, int time);
mods.immersivetechnology.CoolingTower.addRecipe(<liquid:water> * 5850, <liquid:water> * 5850, <liquid:water> * 5850, <liquid:hot_spring_water> * 8100, <liquid:water> * 9900, 1);

# --------------
# Radiator buff x6
# --------------
mods.immersivetechnology.Radiator.removeRecipe(<liquid:exhauststeam>);
mods.immersivetechnology.Radiator.addRecipe(<liquid:exhauststeam> * 500, <liquid:steam> * 250, 13);

# --------------
# Heat Exchanger x5
# --------------
mods.immersivetechnology.HeatExchanger.removeRecipe(<liquid:water>       , <liquid:fluegas>);
mods.immersivetechnology.HeatExchanger.removeRecipe(<liquid:distwater>   , <liquid:fluegas>);
mods.immersivetechnology.HeatExchanger.removeRecipe(<liquid:water>       , <liquid:superheatedmoltensodium>);
mods.immersivetechnology.HeatExchanger.removeRecipe(<liquid:distwater>   , <liquid:superheatedmoltensodium>);
mods.immersivetechnology.HeatExchanger.removeRecipe(<liquid:exhauststeam>, <liquid:water>);
mods.immersivetechnology.HeatExchanger.addRecipe(<liquid:steam>     * 2250, null                            , <liquid:fluegas>                 * 1000, <liquid:water>        * 1250, 64, 4);
mods.immersivetechnology.HeatExchanger.addRecipe(<liquid:steam>     * 2500, null                            , <liquid:fluegas>                 * 1000, <liquid:distwater>    * 1250, 64, 4);
mods.immersivetechnology.HeatExchanger.addRecipe(<liquid:steam>     * 2250, <liquid:moltensodium>     *   80, <liquid:superheatedmoltensodium> *   80, <liquid:water>        * 1250, 64, 4);
mods.immersivetechnology.HeatExchanger.addRecipe(<liquid:steam>     * 2500, <liquid:moltensodium>     *   80, <liquid:superheatedmoltensodium> *   80, <liquid:distwater>    * 1250, 64, 4);
mods.immersivetechnology.HeatExchanger.addRecipe(<liquid:distwater> * 1250, <liquid:hot_spring_water> * 4500, <liquid:water>                   * 4500, <liquid:exhauststeam> * 2500, 32, 4);

# --------------
# Gas Turbine x5
# --------------
mods.immersivetechnology.GasTurbine.removeFuel(<liquid:biodiesel>);
mods.immersivetechnology.GasTurbine.removeFuel(<liquid:gasoline>);
mods.immersivetechnology.GasTurbine.removeFuel(<liquid:diesel>);
mods.immersivetechnology.GasTurbine.addFuel(<liquid:fluegas> * 5000, <liquid:biodiesel> * 160, 10);
mods.immersivetechnology.GasTurbine.addFuel(<liquid:fluegas> * 5000, <liquid:gasoline>  * 800, 10);
mods.immersivetechnology.GasTurbine.addFuel(<liquid:fluegas> * 5000, <liquid:diesel>    * 114, 10);

#------------------------------------------------------------------------

# Alt recipe for Pahoehoe
mods.immersivetechnology.Radiator.addRecipe(<liquid:ic2pahoehoe_lava> * 1, <liquid:lava> * 1000, 5);