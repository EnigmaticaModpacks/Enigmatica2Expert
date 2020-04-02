import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import mods.jei.JEI.removeAndHide as rh;
import mods.inworldcrafting.FluidToItem.transform as fti;

#priority 100

# ######################################################################
#
# 
#
# ######################################################################


# ########################
# 
# ########################


# Remake any recipe
global remake as function(string, IItemStack, IIngredient[][])void = 
    function (name as string, item as IItemStack, input as IIngredient[][]) as void  {

	recipes.remove(item);
	recipes.addShaped(name, item, input);
};

# Add recipe but generate name
global makeEx as function(IItemStack, IIngredient[][])void = 
    function (item as IItemStack, input as IIngredient[][]) as void  {
		
	var name = item.name.replaceAll(":", "_") ~ "_" ~ item.damage;
	recipes.addShaped(name, item, input);
};

# Remake any recipe automaticly generate name
global remakeEx as function(IItemStack, IIngredient[][])void = 
    function (item as IItemStack, input as IIngredient[][]) as void  {

	recipes.remove(item);
	makeEx(item, input);
};

global remakeEnvelop as function(IItemStack, IIngredient, IIngredient)void = 
    function (result as IItemStack, itemCenter as IIngredient, itemAround as IIngredient) as void  {

	recipes.remove(result);
	recipes.addShaped(result, [
			[itemAround, itemAround, itemAround], 
			[itemAround, itemCenter, itemAround], 
			[itemAround, itemAround, itemAround]
		]);
};


/////////////////////////////////////
// 
/////////////////////////////////////

# Remake any recipe with Fluid crafting
global remakeFluidToItem as function(IItemStack, ILiquidStack, IIngredient)void = 
    function (output as IItemStack, fluid as ILiquidStack, input as IIngredient) as void  {

	recipes.remove(output);
	fti(output, fluid, input);
};


// # Make a recipe with time in bottle
// global timecraft as function(IItemStack, IIngredient[], int, string)void = 
//     function (output as IItemStack, input as IIngredient[], seconds as int, tooltip as string) as void  {

// 	var name = output.name.replaceAll(":", "_") ~ "_" ~ output.damage;

// 	var inputWithBottle as IIngredient[] = 
// 		input + <randomthings:timeinabottle>
// 			.marked("timeinabottle")
// 			.transformNew(function(item) {
// 				return item.updateTag({timeData: {storedTime: item.tag.timeData.storedTime - seconds*20}});
// 			});

// 	recipes.addShapeless(name, (
// 		output).withLore(["Consume " ~ tooltip ~" from bottle"]), inputWithBottle, 
// 			function(out, ins, cInfo) {
// 					if(ins.timeinabottle.tag.timeData.storedTime >= seconds*20) {
// 							return output;
// 					}
// 					return null;
// 			},
// 			null);
// };