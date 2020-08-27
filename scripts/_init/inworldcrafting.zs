import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

#priority 3000
#modloaded inworldcrafting

# Remake any recipe with Fluid crafting
global remakeFluidToItem as function(IItemStack, ILiquidStack, IIngredient)void = 
    function (output as IItemStack, fluid as ILiquidStack, input as IIngredient) as void  {

	recipes.remove(output);
	mods.inworldcrafting.FluidToItem.transform(output, fluid, [input]);
};