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
#modloaded enderio
// Uses of this mod: 6


//####################################################
// Uses of this class: 4
zenClass Class_AlloySmelter { zenConstructor() {}

	// Uses of this method: 4
	function addRecipe(output as IItemStack, input as IIngredient[]) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.enderio.AlloySmelter.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient__(input)]));
		mods.enderio.AlloySmelter.addRecipe(output, input);
	}

	function addRecipe(output as IItemStack, input as IIngredient[], energyCost as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.enderio.AlloySmelter.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient__(input), energyCost]));
		mods.enderio.AlloySmelter.addRecipe(output, input, energyCost);
	}

	function addRecipe(output as IItemStack, input as IIngredient[], energyCost as int, xp as float) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.enderio.AlloySmelter.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient__(input), energyCost, xp]));
		mods.enderio.AlloySmelter.addRecipe(output, input, energyCost, xp);
	}

}
static AlloySmelter as Class_AlloySmelter = Class_AlloySmelter();

//####################################################
// Uses of this class: 2
zenClass Class_SagMill { zenConstructor() {}

	// Uses of this method: 2
	function addRecipe(output as IItemStack[], chances as float[], input as IIngredient) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.enderio.SagMill.addRecipe'~
			serialize.args([serialize.IItemStack__(output), serialize.string__(chances), serialize.IIngredient(input)]));
		mods.enderio.SagMill.addRecipe(output, chances, input);
	}

	function addRecipe(output as IItemStack[], chances as float[], input as IIngredient, bonusType as string) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.enderio.SagMill.addRecipe'~
			serialize.args([serialize.IItemStack__(output), serialize.string__(chances), serialize.IIngredient(input), serialize._string(bonusType)]));
		mods.enderio.SagMill.addRecipe(output, chances, input, bonusType);
	}

	function addRecipe(output as IItemStack[], chances as float[], input as IIngredient, bonusType as string, energyCost as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.enderio.SagMill.addRecipe'~
			serialize.args([serialize.IItemStack__(output), serialize.string__(chances), serialize.IIngredient(input), serialize._string(bonusType), energyCost]));
		mods.enderio.SagMill.addRecipe(output, chances, input, bonusType, energyCost);
	}

	function addRecipe(output as IItemStack[], chances as float[], input as IIngredient, bonusType as string, energyCost as int, xp as float[]) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.enderio.SagMill.addRecipe'~
			serialize.args([serialize.IItemStack__(output), serialize.string__(chances), serialize.IIngredient(input), serialize._string(bonusType), energyCost, serialize.string__(xp)]));
		mods.enderio.SagMill.addRecipe(output, chances, input, bonusType, energyCost, xp);
	}

}
static SagMill as Class_SagMill = Class_SagMill();
