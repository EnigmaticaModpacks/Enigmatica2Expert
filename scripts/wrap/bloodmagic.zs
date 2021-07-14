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
#modloaded bloodmagic
// Uses of this mod: 27


//####################################################
// Uses of this class: 4
zenClass Class_AlchemyArray { zenConstructor() {}

	// Uses of this method: 4
	function addRecipe(output as IItemStack, input as IItemStack, catalyst as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.bloodmagic.AlchemyArray.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), serialize.IItemStack(catalyst)]));
		mods.bloodmagic.AlchemyArray.addRecipe(output, input, catalyst);
	}

	function addRecipe(output as IItemStack, input as IItemStack, catalyst as IItemStack, textureLocation as string) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.bloodmagic.AlchemyArray.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), serialize.IItemStack(catalyst), serialize._string(textureLocation)]));
		mods.bloodmagic.AlchemyArray.addRecipe(output, input, catalyst, textureLocation);
	}

}
static AlchemyArray as Class_AlchemyArray = Class_AlchemyArray();

//####################################################
// Uses of this class: 8
zenClass Class_AlchemyTable { zenConstructor() {}

	// Uses of this method: 8
	function addRecipe(output as IItemStack, inputs as IItemStack[], syphon as int, ticks as int, minTier as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.bloodmagic.AlchemyTable.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack__(inputs), syphon, ticks, minTier]));
		mods.bloodmagic.AlchemyTable.addRecipe(output, inputs, syphon, ticks, minTier);
	}

}
static AlchemyTable as Class_AlchemyTable = Class_AlchemyTable();

//####################################################
// Uses of this class: 7
zenClass Class_BloodAltar { zenConstructor() {}

	// Uses of this method: 7
	function addRecipe(output as IItemStack, input as IItemStack, minimumTier as int, syphon as int, consumeRate as int, drainRate as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.bloodmagic.BloodAltar.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), minimumTier, syphon, consumeRate, drainRate]));
		mods.bloodmagic.BloodAltar.addRecipe(output, input, minimumTier, syphon, consumeRate, drainRate);
	}

}
static BloodAltar as Class_BloodAltar = Class_BloodAltar();

//####################################################
// Uses of this class: 8
zenClass Class_TartaricForge { zenConstructor() {}

	// Uses of this method: 8
	function addRecipe(output as IItemStack, inputs as IIngredient[], minSouls as double, soulDrain as double) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.bloodmagic.TartaricForge.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient__(inputs), minSouls, soulDrain]));
		mods.bloodmagic.TartaricForge.addRecipe(output, inputs, minSouls, soulDrain);
	}

}
static TartaricForge as Class_TartaricForge = Class_TartaricForge();
