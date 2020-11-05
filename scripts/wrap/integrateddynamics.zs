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
// Uses of this mod: 12


//####################################################
// Uses of this class: 2
zenClass Class_DryingBasin { zenConstructor() {}

	// Uses of this method: 2
	function addRecipe(inputStack as IItemStack) as void {
		print('Recipe wrapped: mods.integrateddynamics.DryingBasin.addRecipe'~
			serializeArguments([serialize_IItemStack(inputStack)]));
		mods.integrateddynamics.DryingBasin.addRecipe(inputStack);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack) as void {
		print('Recipe wrapped: mods.integrateddynamics.DryingBasin.addRecipe'~
			serializeArguments([serialize_IItemStack(inputStack), serializeFluid(inputFluid)]));
		mods.integrateddynamics.DryingBasin.addRecipe(inputStack, inputFluid);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack, outputStack as IItemStack) as void {
		print('Recipe wrapped: mods.integrateddynamics.DryingBasin.addRecipe'~
			serializeArguments([serialize_IItemStack(inputStack), serializeFluid(inputFluid), serialize_IItemStack(outputStack)]));
		mods.integrateddynamics.DryingBasin.addRecipe(inputStack, inputFluid, outputStack);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack, outputStack as IItemStack, outputFluid as ILiquidStack) as void {
		print('Recipe wrapped: mods.integrateddynamics.DryingBasin.addRecipe'~
			serializeArguments([serialize_IItemStack(inputStack), serializeFluid(inputFluid), serialize_IItemStack(outputStack), serializeFluid(outputFluid)]));
		mods.integrateddynamics.DryingBasin.addRecipe(inputStack, inputFluid, outputStack, outputFluid);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack, outputStack as IItemStack, outputFluid as ILiquidStack, duration as int) as void {
		print('Recipe wrapped: mods.integrateddynamics.DryingBasin.addRecipe'~
			serializeArguments([serialize_IItemStack(inputStack), serializeFluid(inputFluid), serialize_IItemStack(outputStack), serializeFluid(outputFluid), duration]));
		mods.integrateddynamics.DryingBasin.addRecipe(inputStack, inputFluid, outputStack, outputFluid, duration);
	}

}
static DryingBasin as Class_DryingBasin = Class_DryingBasin() as Class_DryingBasin;

//####################################################
// Uses of this class: 2
zenClass Class_MechanicalDryingBasin { zenConstructor() {}

	// Uses of this method: 2
	function addRecipe(inputStack as IItemStack) as void {
		print('Recipe wrapped: mods.integrateddynamics.MechanicalDryingBasin.addRecipe'~
			serializeArguments([serialize_IItemStack(inputStack)]));
		mods.integrateddynamics.MechanicalDryingBasin.addRecipe(inputStack);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack) as void {
		print('Recipe wrapped: mods.integrateddynamics.MechanicalDryingBasin.addRecipe'~
			serializeArguments([serialize_IItemStack(inputStack), serializeFluid(inputFluid)]));
		mods.integrateddynamics.MechanicalDryingBasin.addRecipe(inputStack, inputFluid);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack, outputStack as IItemStack) as void {
		print('Recipe wrapped: mods.integrateddynamics.MechanicalDryingBasin.addRecipe'~
			serializeArguments([serialize_IItemStack(inputStack), serializeFluid(inputFluid), serialize_IItemStack(outputStack)]));
		mods.integrateddynamics.MechanicalDryingBasin.addRecipe(inputStack, inputFluid, outputStack);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack, outputStack as IItemStack, outputFluid as ILiquidStack) as void {
		print('Recipe wrapped: mods.integrateddynamics.MechanicalDryingBasin.addRecipe'~
			serializeArguments([serialize_IItemStack(inputStack), serializeFluid(inputFluid), serialize_IItemStack(outputStack), serializeFluid(outputFluid)]));
		mods.integrateddynamics.MechanicalDryingBasin.addRecipe(inputStack, inputFluid, outputStack, outputFluid);
	}

	function addRecipe(inputStack as IItemStack, inputFluid as ILiquidStack, outputStack as IItemStack, outputFluid as ILiquidStack, duration as int) as void {
		print('Recipe wrapped: mods.integrateddynamics.MechanicalDryingBasin.addRecipe'~
			serializeArguments([serialize_IItemStack(inputStack), serializeFluid(inputFluid), serialize_IItemStack(outputStack), serializeFluid(outputFluid), duration]));
		mods.integrateddynamics.MechanicalDryingBasin.addRecipe(inputStack, inputFluid, outputStack, outputFluid, duration);
	}

}
static MechanicalDryingBasin as Class_MechanicalDryingBasin = Class_MechanicalDryingBasin() as Class_MechanicalDryingBasin;

//####################################################
// Uses of this class: 4
zenClass Class_MechanicalSqueezer { zenConstructor() {}

	// Uses of this method: 4
	function addRecipe(arg0 as IItemStack, arg1 as IItemStack, arg2 as float, arg3 as IItemStack, arg4 as float, arg5 as ILiquidStack) as void {
		print('Recipe wrapped: mods.integrateddynamics.MechanicalSqueezer.addRecipe'~
			serializeArguments([serialize_IItemStack(arg0), serialize_IItemStack(arg1), arg2, serialize_IItemStack(arg3), arg4, serializeFluid(arg5)]));
		mods.integrateddynamics.MechanicalSqueezer.addRecipe(arg0, arg1, arg2, arg3, arg4, arg5);
	}

	function addRecipe(arg0 as IItemStack, arg1 as IItemStack, arg2 as float, arg3 as IItemStack, arg4 as float, arg5 as IItemStack, arg6 as float, arg7 as ILiquidStack) as void {
		print('Recipe wrapped: mods.integrateddynamics.MechanicalSqueezer.addRecipe'~
			serializeArguments([serialize_IItemStack(arg0), serialize_IItemStack(arg1), arg2, serialize_IItemStack(arg3), arg4, serialize_IItemStack(arg5), arg6, serializeFluid(arg7)]));
		mods.integrateddynamics.MechanicalSqueezer.addRecipe(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
	}

}
static MechanicalSqueezer as Class_MechanicalSqueezer = Class_MechanicalSqueezer() as Class_MechanicalSqueezer;

//####################################################
// Uses of this class: 4
zenClass Class_Squeezer { zenConstructor() {}

	// Uses of this method: 4
	function addRecipe(arg0 as IItemStack, arg1 as IItemStack, arg2 as float, arg3 as IItemStack, arg4 as float, arg5 as ILiquidStack) as void {
		print('Recipe wrapped: mods.integrateddynamics.Squeezer.addRecipe'~
			serializeArguments([serialize_IItemStack(arg0), serialize_IItemStack(arg1), arg2, serialize_IItemStack(arg3), arg4, serializeFluid(arg5)]));
		mods.integrateddynamics.Squeezer.addRecipe(arg0, arg1, arg2, arg3, arg4, arg5);
	}

	function addRecipe(arg0 as IItemStack, arg1 as IItemStack, arg2 as float, arg3 as IItemStack, arg4 as float, arg5 as IItemStack, arg6 as float, arg7 as ILiquidStack) as void {
		print('Recipe wrapped: mods.integrateddynamics.Squeezer.addRecipe'~
			serializeArguments([serialize_IItemStack(arg0), serialize_IItemStack(arg1), arg2, serialize_IItemStack(arg3), arg4, serialize_IItemStack(arg5), arg6, serializeFluid(arg7)]));
		mods.integrateddynamics.Squeezer.addRecipe(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
	}

}
static Squeezer as Class_Squeezer = Class_Squeezer() as Class_Squeezer;
