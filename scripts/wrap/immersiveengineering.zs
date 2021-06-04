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
#modloaded immersiveengineering
// Uses of this mod: 50


//####################################################
// Uses of this class: 1
zenClass Class_AlloySmelter { zenConstructor() {}

	// Uses of this method: 1
	function addRecipe(output as IItemStack, first as IIngredient, second as IIngredient, time as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.immersiveengineering.AlloySmelter.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(first), serialize.IIngredient(second), time]));
		mods.immersiveengineering.AlloySmelter.addRecipe(output, first, second, time);
	}

}
static AlloySmelter as Class_AlloySmelter = Class_AlloySmelter();

//####################################################
// Uses of this class: 4
zenClass Class_ArcFurnace { zenConstructor() {}

	// Uses of this method: 4
	function addRecipe(output as IItemStack, input as IIngredient, slag as IItemStack, time as int, energyPerTick as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.immersiveengineering.ArcFurnace.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(input), serialize.IItemStack(slag), time, energyPerTick]));
		mods.immersiveengineering.ArcFurnace.addRecipe(output, input, slag, time, energyPerTick);
	}

	function addRecipe(output as IItemStack, input as IIngredient, slag as IItemStack, time as int, energyPerTick as int, additives as IIngredient[]) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.immersiveengineering.ArcFurnace.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(input), serialize.IItemStack(slag), time, energyPerTick, serialize.IIngredient__(additives)]));
		mods.immersiveengineering.ArcFurnace.addRecipe(output, input, slag, time, energyPerTick, additives);
	}

	function addRecipe(output as IItemStack, input as IIngredient, slag as IItemStack, time as int, energyPerTick as int, additives as IIngredient[], specialRecipeType as string) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.immersiveengineering.ArcFurnace.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(input), serialize.IItemStack(slag), time, energyPerTick, serialize.IIngredient__(additives), serialize._string(specialRecipeType)]));
		mods.immersiveengineering.ArcFurnace.addRecipe(output, input, slag, time, energyPerTick, additives, specialRecipeType);
	}

}
static ArcFurnace as Class_ArcFurnace = Class_ArcFurnace();

//####################################################
// Uses of this class: 27
zenClass Class_Crusher { zenConstructor() {}

	// Uses of this method: 27
	function addRecipe(output as IItemStack, input as IIngredient, energy as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.immersiveengineering.Crusher.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(input), energy]));
		mods.immersiveengineering.Crusher.addRecipe(output, input, energy);
	}

	function addRecipe(output as IItemStack, input as IIngredient, energy as int, secondaryOutput as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.immersiveengineering.Crusher.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(input), energy, serialize.IItemStack(secondaryOutput)]));
		mods.immersiveengineering.Crusher.addRecipe(output, input, energy, secondaryOutput);
	}

	function addRecipe(output as IItemStack, input as IIngredient, energy as int, secondaryOutput as IItemStack, secondaryChance as double) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.immersiveengineering.Crusher.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(input), energy, serialize.IItemStack(secondaryOutput), secondaryChance]));
		mods.immersiveengineering.Crusher.addRecipe(output, input, energy, secondaryOutput, secondaryChance);
	}

}
static Crusher as Class_Crusher = Class_Crusher();

//####################################################
// Uses of this class: 3
zenClass Class_Fermenter { zenConstructor() {}

	// Uses of this method: 3
	function addRecipe(output as IItemStack, fluid as ILiquidStack, input as IIngredient, energy as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.immersiveengineering.Fermenter.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.ILiquidStack(fluid), serialize.IIngredient(input), energy]));
		mods.immersiveengineering.Fermenter.addRecipe(output, fluid, input, energy);
	}

}
static Fermenter as Class_Fermenter = Class_Fermenter();

//####################################################
// Uses of this class: 11
zenClass Class_MetalPress { zenConstructor() {}

	// Uses of this method: 11
	function addRecipe(output as IItemStack, input as IIngredient, mold as IItemStack, energy as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.immersiveengineering.MetalPress.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(input), serialize.IItemStack(mold), energy]));
		mods.immersiveengineering.MetalPress.addRecipe(output, input, mold, energy);
	}

	function addRecipe(output as IItemStack, input as IIngredient, mold as IItemStack, energy as int, inputSize as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.immersiveengineering.MetalPress.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(input), serialize.IItemStack(mold), energy, inputSize]));
		mods.immersiveengineering.MetalPress.addRecipe(output, input, mold, energy, inputSize);
	}

}
static MetalPress as Class_MetalPress = Class_MetalPress();

//####################################################
// Uses of this class: 2
zenClass Class_Mixer { zenConstructor() {}

	// Uses of this method: 2
	function addRecipe(output as ILiquidStack, fluidInput as ILiquidStack, itemInputs as IIngredient[], energy as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.immersiveengineering.Mixer.addRecipe'~
			serialize.args([serialize.ILiquidStack(output), serialize.ILiquidStack(fluidInput), serialize.IIngredient__(itemInputs), energy]));
		mods.immersiveengineering.Mixer.addRecipe(output, fluidInput, itemInputs, energy);
	}

}
static Mixer as Class_Mixer = Class_Mixer();

//####################################################
// Uses of this class: 2
zenClass Class_Squeezer { zenConstructor() {}

	// Uses of this method: 2
	function addRecipe(output as IItemStack, fluid as ILiquidStack, input as IIngredient, energy as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.immersiveengineering.Squeezer.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.ILiquidStack(fluid), serialize.IIngredient(input), energy]));
		mods.immersiveengineering.Squeezer.addRecipe(output, fluid, input, energy);
	}

}
static Squeezer as Class_Squeezer = Class_Squeezer();
