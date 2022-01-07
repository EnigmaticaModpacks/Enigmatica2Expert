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
#modloaded integrateddynamics
// Uses of this mod: 11


//####################################################
// Uses of this class: 2
zenClass Class_DryingBasin { zenConstructor() {}

	// Uses of this method: 2
	function addRecipe(inputStack as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.integrateddynamics.DryingBasin.addRecipe'~
			serialize.args([serialize.IItemStack(inputStack)]));
		mods.integrateddynamics.DryingBasin.addRecipe(inputStack);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.integrateddynamics.DryingBasin.addRecipe'~
			serialize.args([serialize.IItemStack(inputStack), serialize.ILiquidStack(inputFluid)]));
		mods.integrateddynamics.DryingBasin.addRecipe(inputStack, inputFluid);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack, outputStack as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.integrateddynamics.DryingBasin.addRecipe'~
			serialize.args([serialize.IItemStack(inputStack), serialize.ILiquidStack(inputFluid), serialize.IItemStack(outputStack)]));
		mods.integrateddynamics.DryingBasin.addRecipe(inputStack, inputFluid, outputStack);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack, outputStack as IItemStack, outputFluid as ILiquidStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.integrateddynamics.DryingBasin.addRecipe'~
			serialize.args([serialize.IItemStack(inputStack), serialize.ILiquidStack(inputFluid), serialize.IItemStack(outputStack), serialize.ILiquidStack(outputFluid)]));
		mods.integrateddynamics.DryingBasin.addRecipe(inputStack, inputFluid, outputStack, outputFluid);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack, outputStack as IItemStack, outputFluid as ILiquidStack, duration as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.integrateddynamics.DryingBasin.addRecipe'~
			serialize.args([serialize.IItemStack(inputStack), serialize.ILiquidStack(inputFluid), serialize.IItemStack(outputStack), serialize.ILiquidStack(outputFluid), duration]));
		mods.integrateddynamics.DryingBasin.addRecipe(inputStack, inputFluid, outputStack, outputFluid, duration);
	}

}
static DryingBasin as Class_DryingBasin = Class_DryingBasin();

//####################################################
// Uses of this class: 2
zenClass Class_MechanicalDryingBasin { zenConstructor() {}

	// Uses of this method: 2
	function addRecipe(inputStack as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.integrateddynamics.MechanicalDryingBasin.addRecipe'~
			serialize.args([serialize.IItemStack(inputStack)]));
		mods.integrateddynamics.MechanicalDryingBasin.addRecipe(inputStack);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.integrateddynamics.MechanicalDryingBasin.addRecipe'~
			serialize.args([serialize.IItemStack(inputStack), serialize.ILiquidStack(inputFluid)]));
		mods.integrateddynamics.MechanicalDryingBasin.addRecipe(inputStack, inputFluid);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack, outputStack as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.integrateddynamics.MechanicalDryingBasin.addRecipe'~
			serialize.args([serialize.IItemStack(inputStack), serialize.ILiquidStack(inputFluid), serialize.IItemStack(outputStack)]));
		mods.integrateddynamics.MechanicalDryingBasin.addRecipe(inputStack, inputFluid, outputStack);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack, outputStack as IItemStack, outputFluid as ILiquidStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.integrateddynamics.MechanicalDryingBasin.addRecipe'~
			serialize.args([serialize.IItemStack(inputStack), serialize.ILiquidStack(inputFluid), serialize.IItemStack(outputStack), serialize.ILiquidStack(outputFluid)]));
		mods.integrateddynamics.MechanicalDryingBasin.addRecipe(inputStack, inputFluid, outputStack, outputFluid);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack, outputStack as IItemStack, outputFluid as ILiquidStack, duration as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.integrateddynamics.MechanicalDryingBasin.addRecipe'~
			serialize.args([serialize.IItemStack(inputStack), serialize.ILiquidStack(inputFluid), serialize.IItemStack(outputStack), serialize.ILiquidStack(outputFluid), duration]));
		mods.integrateddynamics.MechanicalDryingBasin.addRecipe(inputStack, inputFluid, outputStack, outputFluid, duration);
	}

}
static MechanicalDryingBasin as Class_MechanicalDryingBasin = Class_MechanicalDryingBasin();

//####################################################
// Uses of this class: 3
zenClass Class_MechanicalSqueezer { zenConstructor() {}

	// Uses of this method: 3
	function addRecipe(arg0 as IItemStack, arg1 as IItemStack, arg2 as float, arg3 as IItemStack, arg4 as float, arg5 as ILiquidStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.integrateddynamics.MechanicalSqueezer.addRecipe'~
			serialize.args([serialize.IItemStack(arg0), serialize.IItemStack(arg1), arg2, serialize.IItemStack(arg3), arg4, serialize.ILiquidStack(arg5)]));
		mods.integrateddynamics.MechanicalSqueezer.addRecipe(arg0, arg1, arg2, arg3, arg4, arg5);
	}

	function addRecipe(arg0 as IItemStack, arg1 as IItemStack, arg2 as float, arg3 as IItemStack, arg4 as float, arg5 as IItemStack, arg6 as float, arg7 as ILiquidStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.integrateddynamics.MechanicalSqueezer.addRecipe'~
			serialize.args([serialize.IItemStack(arg0), serialize.IItemStack(arg1), arg2, serialize.IItemStack(arg3), arg4, serialize.IItemStack(arg5), arg6, serialize.ILiquidStack(arg7)]));
		mods.integrateddynamics.MechanicalSqueezer.addRecipe(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
	}

}
static MechanicalSqueezer as Class_MechanicalSqueezer = Class_MechanicalSqueezer();

//####################################################
// Uses of this class: 4
zenClass Class_Squeezer { zenConstructor() {}

	// Uses of this method: 4
	function addRecipe(arg0 as IItemStack, arg1 as IItemStack, arg2 as float, arg3 as IItemStack, arg4 as float, arg5 as ILiquidStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.integrateddynamics.Squeezer.addRecipe'~
			serialize.args([serialize.IItemStack(arg0), serialize.IItemStack(arg1), arg2, serialize.IItemStack(arg3), arg4, serialize.ILiquidStack(arg5)]));
		mods.integrateddynamics.Squeezer.addRecipe(arg0, arg1, arg2, arg3, arg4, arg5);
	}

	function addRecipe(arg0 as IItemStack, arg1 as IItemStack, arg2 as float, arg3 as IItemStack, arg4 as float, arg5 as IItemStack, arg6 as float, arg7 as ILiquidStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.integrateddynamics.Squeezer.addRecipe'~
			serialize.args([serialize.IItemStack(arg0), serialize.IItemStack(arg1), arg2, serialize.IItemStack(arg3), arg4, serialize.IItemStack(arg5), arg6, serialize.ILiquidStack(arg7)]));
		mods.integrateddynamics.Squeezer.addRecipe(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
	}

}
static Squeezer as Class_Squeezer = Class_Squeezer();
