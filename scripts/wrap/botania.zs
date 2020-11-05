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
#modloaded botania
// Uses of this mod: 11


//####################################################
// Uses of this class: 11
zenClass Class_PureDaisy { zenConstructor() {}

	// Uses of this method: 11
	function addRecipe(blockInput as IIngredient, blockOutput as IItemStack) as void {
		print('Recipe wrapped: mods.botania.PureDaisy.addRecipe'~
			serializeArguments([serialize_IIngredient(blockInput), serialize_IItemStack(blockOutput)]));
		mods.botania.PureDaisy.addRecipe(blockInput, blockOutput);
	}

	function addRecipe(blockInput as IIngredient, blockOutput as IItemStack, time as int) as void {
		print('Recipe wrapped: mods.botania.PureDaisy.addRecipe'~
			serializeArguments([serialize_IIngredient(blockInput), serialize_IItemStack(blockOutput), time]));
		mods.botania.PureDaisy.addRecipe(blockInput, blockOutput, time);
	}

}
static PureDaisy as Class_PureDaisy = Class_PureDaisy() as Class_PureDaisy;
