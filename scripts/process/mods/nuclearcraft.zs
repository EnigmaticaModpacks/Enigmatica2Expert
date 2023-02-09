#modloaded nuclearcraft
#priority 1500
#norun

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;
import scripts.process.factory.Factory.register as registerFactory;

// work(tags as string, 
//     inputItems as IIngredient[], inputLiquids as ILiquidStack[],
//     outputItems as IItemStack[], outputLiquids as ILiquidStack[],
//     extra as IItemStack[], extraChance as float[], options as IData = null) as string

val fnc as function(IItemStack,Grid,string[])string =
function(output as IItemStack, grid as Grid, oldStyle as string[]) as string {

};
registerFactory(fnc);