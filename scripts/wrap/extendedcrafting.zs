import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

#priority 2900

//##############################################################
//
// Recipe dump wrappers
//
//##############################################################

zenClass Class_CombinationCrafting { zenConstructor() {}
	function addRecipe(output as IItemStack, rf as long, rf_t as int, centerItem as IItemStack, ingredients as IIngredient[]) as void {
		print('Recipe wrapped:\nmods.extendedcrafting.CombinationCrafting.addRecipe'~
			serializeArguments([output.commandString, rf, rf_t, centerItem.commandString, serializeIngredients1d(ingredients)]));
		mods.extendedcrafting.CombinationCrafting.addRecipe(output, rf, rf_t, centerItem, ingredients);
	}
}

zenClass Class_CompressionCrafting { zenConstructor() {}
	function addRecipe(catalyst as IItemStack, input as IIngredient, count as int, output as IItemStack, rf as int, rf_t as int) as void {
		print('Recipe wrapped:\nmods.extendedcrafting.CompressionCrafting.addRecipe'~
			serializeArguments([catalyst.commandString, input.commandString, count, output.commandString, rf, rf_t]));
		mods.extendedcrafting.CompressionCrafting.addRecipe(catalyst, input, count, output, rf, rf_t);
	}
	function remove(output as IItemStack) as void {
		mods.extendedcrafting.CompressionCrafting.remove(output);
	}
}

zenClass Class_EnderCrafting { zenConstructor() {}
	function addShaped(output as IItemStack, input2d as IIngredient[][]) as void {
		print('Recipe wrapped:\nmods.extendedcrafting.EnderCrafting.addShaped'~
			serializeArguments([output.commandString, serializeIngredients2d(input2d)]));
		mods.extendedcrafting.EnderCrafting.addShaped(output, input2d);
	}
}

zenClass Class_TableCrafting { zenConstructor() {}
	function addShaped(output as IItemStack, inputs as IIngredient[][]) as void { return addShaped(0, output,inputs); }
	function addShaped(level as int, output as IItemStack, inputs as IIngredient[][]) as void {
		print('Recipe wrapped:\nmods.extendedcrafting.TableCrafting.addShaped'~
			serializeArguments([level, output.commandString, serializeIngredients2d(inputs)]));
		mods.extendedcrafting.TableCrafting.addShaped(level, output, inputs);
	}

	function addShapeless(output as IItemStack, inputs as IIngredient[]) as void { return addShapeless(0, output,inputs); }
	function addShapeless(level as int, output as IItemStack, inputs as IIngredient[]) as void {
		print('Recipe wrapped:\nmods.extendedcrafting.TableCrafting.addShapeless'~
			serializeArguments([level, output.commandString, serializeIngredients1d(inputs)]));
		mods.extendedcrafting.TableCrafting.addShapeless(level, output, inputs);
	}
}

static CombinationCrafting as Class_CombinationCrafting = Class_CombinationCrafting() as Class_CombinationCrafting;
static CompressionCrafting as Class_CompressionCrafting = Class_CompressionCrafting() as Class_CompressionCrafting;
static EnderCrafting as Class_EnderCrafting = Class_EnderCrafting() as Class_EnderCrafting;
static TableCrafting as Class_TableCrafting = Class_TableCrafting() as Class_TableCrafting;
