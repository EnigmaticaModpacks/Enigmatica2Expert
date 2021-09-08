
import mods.industrialforegoing.FluidDictionary;

# [Cloud Seed] harder (also BoP Hotspring water as extra)
mods.enderio.Vat.removeRecipe(<liquid:cloud_seed>);
mods.immersivetechnology.CoolingTower.addRecipe(<liquid:cloud_seed> * 500, <liquid:hot_spring_water> * 10, <liquid:ice> * 200, <liquid:ice> * 200, <liquid:ic2hot_water> * 1000, 20);

# Rplace wrong salt
utils.rh(<immersivetech:material>);
mods.immersivetechnology.Distiller.removeRecipe(<liquid:water>);
mods.immersivetechnology.Distiller.addRecipe(<liquid:water> * 1000, <liquid:distwater> * 500, <mekanism:salt>, 2000, 20, 1.0f);

#------------------------------------------------------------------------
# Harder Electolyze
mods.nuclearcraft.electrolyser.removeRecipeWithInput([<fluid:water> * 1000]);
mods.mekanism.separator.removeRecipe(<liquid:water>);
scripts.wrap.mekanism.separator.addRecipe(<liquid:water> * 10, 800, <gas:hydrogen> * 2, <gas:oxygen>);
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
mods.immersivetechnology.MeltingCrucible.addRecipe(<liquid:diamond> *  666, <ore:gemDiamond>, 9600, 40);
mods.immersivetechnology.MeltingCrucible.addRecipe(<liquid:diamond> *  666, <ore:dustDiamond>, 9600, 40);
mods.immersivetechnology.MeltingCrucible.addRecipe(<liquid:diamond> * 5994, <ore:blockDiamond>, 96000, 400);

#------------------------------------------------------------------------

