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
// Uses of this mod: 32


//####################################################
// Uses of this class: 8
zenClass Class_AtomicReconstructor { zenConstructor() {}

	// Uses of this method: 8
	function addRecipe(output as IItemStack, input as IItemStack, energyUsed as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.actuallyadditions.AtomicReconstructor.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), energyUsed]));
		mods.actuallyadditions.AtomicReconstructor.addRecipe(output, input, energyUsed);
	}

}
static AtomicReconstructor as Class_AtomicReconstructor = Class_AtomicReconstructor();

//####################################################
// Uses of this class: 1
zenClass Class_BallOfFur { zenConstructor() {}

	// Uses of this method: 1
	function addReturn(output as IItemStack, chance as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.actuallyadditions.BallOfFur.addReturn'~
			serialize.args([serialize.IItemStack(output), chance]));
		mods.actuallyadditions.BallOfFur.addReturn(output, chance);
	}

}
static BallOfFur as Class_BallOfFur = Class_BallOfFur();

//####################################################
// Uses of this class: 1
zenClass Class_Compost { zenConstructor() {}

	// Uses of this method: 1
	function addRecipe(output as IItemStack, outputDisplay as IItemStack, input as IItemStack, inputDisplay as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.actuallyadditions.Compost.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(outputDisplay), serialize.IItemStack(input), serialize.IItemStack(inputDisplay)]));
		mods.actuallyadditions.Compost.addRecipe(output, outputDisplay, input, inputDisplay);
	}

}
static Compost as Class_Compost = Class_Compost();

//####################################################
// Uses of this class: 12
zenClass Class_Crusher { zenConstructor() {}

	// Uses of this method: 12
	function addRecipe(output as IItemStack, input as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.actuallyadditions.Crusher.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input)]));
		mods.actuallyadditions.Crusher.addRecipe(output, input);
	}

	function addRecipe(output as IItemStack, input as IItemStack, outputSecondary as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.actuallyadditions.Crusher.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), serialize.IItemStack(outputSecondary)]));
		mods.actuallyadditions.Crusher.addRecipe(output, input, outputSecondary);
	}

	function addRecipe(output as IItemStack, input as IItemStack, outputSecondary as IItemStack, outputSecondaryChance as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.actuallyadditions.Crusher.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), serialize.IItemStack(outputSecondary), outputSecondaryChance]));
		mods.actuallyadditions.Crusher.addRecipe(output, input, outputSecondary, outputSecondaryChance);
	}

}
static Crusher as Class_Crusher = Class_Crusher();

//####################################################
// Uses of this class: 10
zenClass Class_Empowerer { zenConstructor() {}

	// Uses of this method: 10
	function addRecipe(output as IItemStack, input as IItemStack, modifier1 as IItemStack, modifier2 as IItemStack, modifier3 as IItemStack, modifier4 as IItemStack, energyPerStand as int, time as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.actuallyadditions.Empowerer.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), serialize.IItemStack(modifier1), serialize.IItemStack(modifier2), serialize.IItemStack(modifier3), serialize.IItemStack(modifier4), energyPerStand, time]));
		mods.actuallyadditions.Empowerer.addRecipe(output, input, modifier1, modifier2, modifier3, modifier4, energyPerStand, time);
	}

	function addRecipe(output as IItemStack, input as IItemStack, modifier1 as IItemStack, modifier2 as IItemStack, modifier3 as IItemStack, modifier4 as IItemStack, energyPerStand as int, time as int, particleColourArray as float[]) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.actuallyadditions.Empowerer.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), serialize.IItemStack(modifier1), serialize.IItemStack(modifier2), serialize.IItemStack(modifier3), serialize.IItemStack(modifier4), energyPerStand, time, serialize.string__(particleColourArray)]));
		mods.actuallyadditions.Empowerer.addRecipe(output, input, modifier1, modifier2, modifier3, modifier4, energyPerStand, time, particleColourArray);
	}

}
static Empowerer as Class_Empowerer = Class_Empowerer();
