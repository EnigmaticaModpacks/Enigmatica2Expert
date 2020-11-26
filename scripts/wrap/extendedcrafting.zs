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
#modloaded extendedcrafting
// Uses of this mod: 76


//####################################################
// Uses of this class: 6
zenClass Class_CompressionCrafting { zenConstructor() {}

	// Uses of this method: 6
	function addRecipe(output as IItemStack, input as IItemStack, inputCount as int, catalyst as IItemStack, rfCost as int, rfRate as int) as void {
		print('Recipe wrapped: mods.extendedcrafting.CompressionCrafting.addRecipe'~
			serializeArguments([serialize_IItemStack(output), serialize_IItemStack(input), inputCount, serialize_IItemStack(catalyst), rfCost, rfRate]));
		mods.extendedcrafting.CompressionCrafting.addRecipe(output, input, inputCount, catalyst, rfCost, rfRate);
	}

}
static CompressionCrafting as Class_CompressionCrafting = Class_CompressionCrafting() as Class_CompressionCrafting;

//####################################################
// Uses of this class: 35
zenClass Class_CombinationCrafting { zenConstructor() {}

	// Uses of this method: 35
	function addRecipe(output as IItemStack, rf as long, rf_t as int, centerItem as IItemStack, ingredients as IIngredient[]) as void {
		print('Recipe wrapped: mods.extendedcrafting.CombinationCrafting.addRecipe'~
			serializeArguments([serialize_IItemStack(output), rf, rf_t, serialize_IItemStack(centerItem), serializeIngredients1d(ingredients)]));
		mods.extendedcrafting.CombinationCrafting.addRecipe(output, rf, rf_t, centerItem, ingredients);
	}

}
static CombinationCrafting as Class_CombinationCrafting = Class_CombinationCrafting() as Class_CombinationCrafting;

//####################################################
// Uses of this class: 1
zenClass Class_EnderCrafting { zenConstructor() {}

	// Uses of this method: 1
	function addShaped(output as IItemStack, input2d as IIngredient[][]) as void {
		print('Recipe wrapped: mods.extendedcrafting.EnderCrafting.addShaped'~
			serializeArguments([serialize_IItemStack(output), serializeIngredients2d(input2d)]));
		mods.extendedcrafting.EnderCrafting.addShaped(output, input2d);
	}

}
static EnderCrafting as Class_EnderCrafting = Class_EnderCrafting() as Class_EnderCrafting;

//####################################################
// Uses of this class: 34
zenClass Class_TableCrafting { zenConstructor() {}

	// Uses of this method: 29
	function addShaped(level as int, output as IItemStack, inputs as IIngredient[][]) as void {
		print('Recipe wrapped: mods.extendedcrafting.TableCrafting.addShaped'~
			serializeArguments([level, serialize_IItemStack(output), serializeIngredients2d(inputs)]));
		mods.extendedcrafting.TableCrafting.addShaped(level, output, inputs);
	}

	function addShaped(output as IItemStack, inputs as IIngredient[][]) as void {
		print('Recipe wrapped: mods.extendedcrafting.TableCrafting.addShaped'~
			serializeArguments([serialize_IItemStack(output), serializeIngredients2d(inputs)]));
		mods.extendedcrafting.TableCrafting.addShaped(output, inputs);
	}

	function addShapeless(level as int, output as IItemStack, inputs as IIngredient[]) as void {
		print('Recipe wrapped: mods.extendedcrafting.TableCrafting.addShapeless'~
			serializeArguments([level, serialize_IItemStack(output), serializeIngredients1d(inputs)]));
		mods.extendedcrafting.TableCrafting.addShapeless(level, output, inputs);
	}

	function addShapeless(output as IItemStack, inputs as IIngredient[]) as void {
		print('Recipe wrapped: mods.extendedcrafting.TableCrafting.addShapeless'~
			serializeArguments([serialize_IItemStack(output), serializeIngredients1d(inputs)]));
		mods.extendedcrafting.TableCrafting.addShapeless(output, inputs);
	}

}
static TableCrafting as Class_TableCrafting = Class_TableCrafting() as Class_TableCrafting;
