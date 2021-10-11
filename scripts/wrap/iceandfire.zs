/*
	This File generated automatically with wrapper.js
	Its wrap functions to print additional information
		into crafttweaker.log
*/
import crafttweaker.block.IBlock;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import mod.mekanism.gas.IGasStack;
import thaumcraft.aspect.CTAspectStack;

#priority 2900
#modloaded iceandfire
// Uses of this mod: 13


//####################################################
// Uses of this class: 13
zenClass Class_recipes { zenConstructor() {}

	// Uses of this method: 6
	function addFireDragonForgeRecipe(input as IItemStack, bloodInput as IItemStack, output as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.iceandfire.recipes.addFireDragonForgeRecipe'~
			serialize.args([serialize.IItemStack(input), serialize.IItemStack(bloodInput), serialize.IItemStack(output)]));
		mods.iceandfire.recipes.addFireDragonForgeRecipe(input, bloodInput, output);
	}

	function addIceDragonForgeRecipe(input as IItemStack, bloodInput as IItemStack, output as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.iceandfire.recipes.addIceDragonForgeRecipe'~
			serialize.args([serialize.IItemStack(input), serialize.IItemStack(bloodInput), serialize.IItemStack(output)]));
		mods.iceandfire.recipes.addIceDragonForgeRecipe(input, bloodInput, output);
	}

}
static recipes as Class_recipes = Class_recipes();
