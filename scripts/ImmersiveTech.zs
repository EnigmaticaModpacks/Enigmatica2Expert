import mods.immersivetechnology.SteamTurbine;
import mods.jei.JEI.removeAndHide as rh;

#Steam Turbine steam consumption
# mods.immersivetechnology.SteamTurbine.addFuel(ILiquidStack output, ILiquidStack input, int time);

SteamTurbine.addFuel(<liquid:exhauststeam> * 4000, <liquid:steam> * 4000, 1);

rh(<immersivetech:wooden_crate>);
rh(<immersivetech:metal_barrel:0>);
