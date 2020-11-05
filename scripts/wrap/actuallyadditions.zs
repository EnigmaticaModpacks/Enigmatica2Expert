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
#modloaded actuallyadditions
// Uses of this mod: 33


//####################################################
// Uses of this class: 5
zenClass Class_AtomicReconstructor { zenConstructor() {}

	// Uses of this method: 5
	function addRecipe(output as IItemStack, input as IItemStack, energyUsed as int) as void {
		print('Recipe wrapped: mods.actuallyadditions.AtomicReconstructor.addRecipe'~
			serializeArguments([serialize_IItemStack(output), serialize_IItemStack(input), energyUsed]));
		mods.actuallyadditions.AtomicReconstructor.addRecipe(output, input, energyUsed);
	}

}
static AtomicReconstructor as Class_AtomicReconstructor = Class_AtomicReconstructor() as Class_AtomicReconstructor;

//####################################################
// Uses of this class: 12
zenClass Class_Crusher { zenConstructor() {}

	// Uses of this method: 12
	function addRecipe(output as IItemStack, input as IItemStack) as void {
		print('Recipe wrapped: mods.actuallyadditions.Crusher.addRecipe'~
			serializeArguments([serialize_IItemStack(output), serialize_IItemStack(input)]));
		mods.actuallyadditions.Crusher.addRecipe(output, input);
	}

	function addRecipe(output as IItemStack, input as IItemStack, outputSecondary as IItemStack) as void {
		print('Recipe wrapped: mods.actuallyadditions.Crusher.addRecipe'~
			serializeArguments([serialize_IItemStack(output), serialize_IItemStack(input), serialize_IItemStack(outputSecondary)]));
		mods.actuallyadditions.Crusher.addRecipe(output, input, outputSecondary);
	}

	function addRecipe(output as IItemStack, input as IItemStack, outputSecondary as IItemStack, outputSecondaryChance as int) as void {
		print('Recipe wrapped: mods.actuallyadditions.Crusher.addRecipe'~
			serializeArguments([serialize_IItemStack(output), serialize_IItemStack(input), serialize_IItemStack(outputSecondary), outputSecondaryChance]));
		mods.actuallyadditions.Crusher.addRecipe(output, input, outputSecondary, outputSecondaryChance);
	}

}
static Crusher as Class_Crusher = Class_Crusher() as Class_Crusher;

//####################################################
// Uses of this class: 16
zenClass Class_Empowerer { zenConstructor() {}

	// Uses of this method: 16
	function addRecipe(output as IItemStack, input as IItemStack, modifier1 as IItemStack, modifier2 as IItemStack, modifier3 as IItemStack, modifier4 as IItemStack, energyPerStand as int, time as int) as void {
		print('Recipe wrapped: mods.actuallyadditions.Empowerer.addRecipe'~
			serializeArguments([serialize_IItemStack(output), serialize_IItemStack(input), serialize_IItemStack(modifier1), serialize_IItemStack(modifier2), serialize_IItemStack(modifier3), serialize_IItemStack(modifier4), energyPerStand, time]));
		mods.actuallyadditions.Empowerer.addRecipe(output, input, modifier1, modifier2, modifier3, modifier4, energyPerStand, time);
	}

	function addRecipe(output as IItemStack, input as IItemStack, modifier1 as IItemStack, modifier2 as IItemStack, modifier3 as IItemStack, modifier4 as IItemStack, energyPerStand as int, time as int, particleColourArray as float[]) as void {
		print('Recipe wrapped: mods.actuallyadditions.Empowerer.addRecipe'~
			serializeArguments([serialize_IItemStack(output), serialize_IItemStack(input), serialize_IItemStack(modifier1), serialize_IItemStack(modifier2), serialize_IItemStack(modifier3), serialize_IItemStack(modifier4), energyPerStand, time, serializeArray(particleColourArray, "[]")]));
		mods.actuallyadditions.Empowerer.addRecipe(output, input, modifier1, modifier2, modifier3, modifier4, energyPerStand, time, particleColourArray);
	}

}
static Empowerer as Class_Empowerer = Class_Empowerer() as Class_Empowerer;
