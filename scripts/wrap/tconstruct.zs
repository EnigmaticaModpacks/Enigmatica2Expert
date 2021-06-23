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
#modloaded tconstruct
// Uses of this mod: 60


//####################################################
// Uses of this class: 13
zenClass Class_Alloy { zenConstructor() {}

	// Uses of this method: 13
	function addRecipe(output as ILiquidStack, inputs as ILiquidStack[]) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.tconstruct.Alloy.addRecipe'~
			serialize.args([serialize.ILiquidStack(output), serialize.ILiquidStack__(inputs)]));
		mods.tconstruct.Alloy.addRecipe(output, inputs);
	}

}
static Alloy as Class_Alloy = Class_Alloy();

//####################################################
// Uses of this class: 35
zenClass Class_Casting { zenConstructor() {}

	// Uses of this method: 23
	function addTableRecipe(output as IItemStack, cast as IIngredient, fluid as ILiquidStack, amount as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.tconstruct.Casting.addTableRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(cast), serialize.ILiquidStack(fluid), amount]));
		mods.tconstruct.Casting.addTableRecipe(output, cast, fluid, amount);
	}

	function addTableRecipe(output as IItemStack, cast as IIngredient, fluid as ILiquidStack, amount as int, consumeCast as bool) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.tconstruct.Casting.addTableRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(cast), serialize.ILiquidStack(fluid), amount, consumeCast]));
		mods.tconstruct.Casting.addTableRecipe(output, cast, fluid, amount, consumeCast);
	}

	function addTableRecipe(output as IItemStack, cast as IIngredient, fluid as ILiquidStack, amount as int, consumeCast as bool, time as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.tconstruct.Casting.addTableRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(cast), serialize.ILiquidStack(fluid), amount, consumeCast, time]));
		mods.tconstruct.Casting.addTableRecipe(output, cast, fluid, amount, consumeCast, time);
	}

	function addBasinRecipe(output as IItemStack, cast as IIngredient, fluid as ILiquidStack, amount as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.tconstruct.Casting.addBasinRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(cast), serialize.ILiquidStack(fluid), amount]));
		mods.tconstruct.Casting.addBasinRecipe(output, cast, fluid, amount);
	}

	function addBasinRecipe(output as IItemStack, cast as IIngredient, fluid as ILiquidStack, amount as int, consumeCast as bool) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.tconstruct.Casting.addBasinRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(cast), serialize.ILiquidStack(fluid), amount, consumeCast]));
		mods.tconstruct.Casting.addBasinRecipe(output, cast, fluid, amount, consumeCast);
	}

	function addBasinRecipe(output as IItemStack, cast as IIngredient, fluid as ILiquidStack, amount as int, consumeCast as bool, time as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.tconstruct.Casting.addBasinRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(cast), serialize.ILiquidStack(fluid), amount, consumeCast, time]));
		mods.tconstruct.Casting.addBasinRecipe(output, cast, fluid, amount, consumeCast, time);
	}

}
static Casting as Class_Casting = Class_Casting();

//####################################################
// Uses of this class: 12
zenClass Class_Melting { zenConstructor() {}

	// Uses of this method: 12
	function addRecipe(output as ILiquidStack, input as IIngredient) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.tconstruct.Melting.addRecipe'~
			serialize.args([serialize.ILiquidStack(output), serialize.IIngredient(input)]));
		mods.tconstruct.Melting.addRecipe(output, input);
	}

	function addRecipe(output as ILiquidStack, input as IIngredient, temp as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.tconstruct.Melting.addRecipe'~
			serialize.args([serialize.ILiquidStack(output), serialize.IIngredient(input), temp]));
		mods.tconstruct.Melting.addRecipe(output, input, temp);
	}

}
static Melting as Class_Melting = Class_Melting();
