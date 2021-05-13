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
#modloaded astralsorcery
// Uses of this mod: 21


//####################################################
// Uses of this class: 17
zenClass Class_Altar { zenConstructor() {}

	// Uses of this method: 3
	function addAttunementAltarRecipe(recipeLocation as string, output as IItemStack, starlight as int, craftTickTime as int, inputs as IIngredient[]) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.astralsorcery.Altar.addAttunementAltarRecipe'~
			serialize.args([serialize._string(recipeLocation), serialize.IItemStack(output), starlight, craftTickTime, serialize.IIngredient__(inputs)]));
		mods.astralsorcery.Altar.addAttunementAltarRecipe(recipeLocation, output, starlight, craftTickTime, inputs);
	}

	function addConstellationAltarRecipe(recipeLocation as string, output as IItemStack, starlight as int, craftTickTime as int, inputs as IIngredient[]) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.astralsorcery.Altar.addConstellationAltarRecipe'~
			serialize.args([serialize._string(recipeLocation), serialize.IItemStack(output), starlight, craftTickTime, serialize.IIngredient__(inputs)]));
		mods.astralsorcery.Altar.addConstellationAltarRecipe(recipeLocation, output, starlight, craftTickTime, inputs);
	}

	function addDiscoveryAltarRecipe(recipeLocation as string, output as IItemStack, starlight as int, craftTickTime as int, inputs as IIngredient[]) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.astralsorcery.Altar.addDiscoveryAltarRecipe'~
			serialize.args([serialize._string(recipeLocation), serialize.IItemStack(output), starlight, craftTickTime, serialize.IIngredient__(inputs)]));
		mods.astralsorcery.Altar.addDiscoveryAltarRecipe(recipeLocation, output, starlight, craftTickTime, inputs);
	}

	function addTraitAltarRecipe(recipeLocation as string, output as IItemStack, starlight as int, craftTickTime as int, inputs as IIngredient[]) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.astralsorcery.Altar.addTraitAltarRecipe'~
			serialize.args([serialize._string(recipeLocation), serialize.IItemStack(output), starlight, craftTickTime, serialize.IIngredient__(inputs)]));
		mods.astralsorcery.Altar.addTraitAltarRecipe(recipeLocation, output, starlight, craftTickTime, inputs);
	}

	function addTraitAltarRecipe(recipeLocation as string, output as IItemStack, starlight as int, craftTickTime as int, inputs as IIngredient[], iRequiredConstellationFocusName as string) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.astralsorcery.Altar.addTraitAltarRecipe'~
			serialize.args([serialize._string(recipeLocation), serialize.IItemStack(output), starlight, craftTickTime, serialize.IIngredient__(inputs), serialize._string(iRequiredConstellationFocusName)]));
		mods.astralsorcery.Altar.addTraitAltarRecipe(recipeLocation, output, starlight, craftTickTime, inputs, iRequiredConstellationFocusName);
	}

}
static Altar as Class_Altar = Class_Altar();

//####################################################
// Uses of this class: 1
zenClass Class_Grindstone { zenConstructor() {}

	// Uses of this method: 1
	function addRecipe(input as IItemStack, output as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.astralsorcery.Grindstone.addRecipe'~
			serialize.args([serialize.IItemStack(input), serialize.IItemStack(output)]));
		mods.astralsorcery.Grindstone.addRecipe(input, output);
	}

	function addRecipe(input as IItemStack, output as IItemStack, doubleChance as float) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.astralsorcery.Grindstone.addRecipe'~
			serialize.args([serialize.IItemStack(input), serialize.IItemStack(output), doubleChance]));
		mods.astralsorcery.Grindstone.addRecipe(input, output, doubleChance);
	}

}
static Grindstone as Class_Grindstone = Class_Grindstone();

//####################################################
// Uses of this class: 2
zenClass Class_StarlightInfusion { zenConstructor() {}

	// Uses of this method: 2
	function addInfusion(input as IItemStack, output as IItemStack, consumeMultiple as bool, consumptionChance as float, craftingTickTime as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.astralsorcery.StarlightInfusion.addInfusion'~
			serialize.args([serialize.IItemStack(input), serialize.IItemStack(output), consumeMultiple, consumptionChance, craftingTickTime]));
		mods.astralsorcery.StarlightInfusion.addInfusion(input, output, consumeMultiple, consumptionChance, craftingTickTime);
	}

}
static StarlightInfusion as Class_StarlightInfusion = Class_StarlightInfusion();

//####################################################
// Uses of this class: 1
zenClass Class_LightTransmutation { zenConstructor() {}

	// Uses of this method: 1
	function addTransmutation(stackIn as IItemStack, stackOut as IItemStack, cost as double) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.astralsorcery.LightTransmutation.addTransmutation'~
			serialize.args([serialize.IItemStack(stackIn), serialize.IItemStack(stackOut), cost]));
		mods.astralsorcery.LightTransmutation.addTransmutation(stackIn, stackOut, cost);
	}

}
static LightTransmutation as Class_LightTransmutation = Class_LightTransmutation();
