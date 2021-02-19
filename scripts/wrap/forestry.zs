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
#modloaded forestry
// Uses of this mod: 30


//####################################################
// Uses of this class: 16
zenClass Class_Carpenter { zenConstructor() {}

	// Uses of this method: 16
	function addRecipe(output as IItemStack, ingredients as IIngredient[][], packagingTime as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.forestry.Carpenter.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient____(ingredients), packagingTime]));
		mods.forestry.Carpenter.addRecipe(output, ingredients, packagingTime);
	}

	function addRecipe(output as IItemStack, ingredients as IIngredient[][], packagingTime as int, fluidInput as ILiquidStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.forestry.Carpenter.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient____(ingredients), packagingTime, serialize.ILiquidStack(fluidInput)]));
		mods.forestry.Carpenter.addRecipe(output, ingredients, packagingTime, fluidInput);
	}

	function addRecipe(output as IItemStack, ingredients as IIngredient[][], packagingTime as int, fluidInput as ILiquidStack, box as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.forestry.Carpenter.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient____(ingredients), packagingTime, serialize.ILiquidStack(fluidInput), serialize.IItemStack(box)]));
		mods.forestry.Carpenter.addRecipe(output, ingredients, packagingTime, fluidInput, box);
	}

}
static Carpenter as Class_Carpenter = Class_Carpenter();

//####################################################
// Uses of this class: 5
zenClass Class_Centrifuge { zenConstructor() {}

	// Uses of this method: 5
	function addRecipe(output as WeightedItemStack[], ingredients as IItemStack, packagingTime as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.forestry.Centrifuge.addRecipe'~
			serialize.args([serialize.WeightedItemStack__(output), serialize.IItemStack(ingredients), packagingTime]));
		mods.forestry.Centrifuge.addRecipe(output, ingredients, packagingTime);
	}

}
static Centrifuge as Class_Centrifuge = Class_Centrifuge();

//####################################################
// Uses of this class: 1
zenClass Class_Fermenter { zenConstructor() {}

	// Uses of this method: 1
	function addRecipe(fluidOutput as ILiquidStack, resource as IItemStack, fluidInput as ILiquidStack, fermentationValue as int, fluidOutputModifier as float) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.forestry.Fermenter.addRecipe'~
			serialize.args([serialize.ILiquidStack(fluidOutput), serialize.IItemStack(resource), serialize.ILiquidStack(fluidInput), fermentationValue, fluidOutputModifier]));
		mods.forestry.Fermenter.addRecipe(fluidOutput, resource, fluidInput, fermentationValue, fluidOutputModifier);
	}

}
static Fermenter as Class_Fermenter = Class_Fermenter();

//####################################################
// Uses of this class: 4
zenClass Class_Squeezer { zenConstructor() {}

	// Uses of this method: 4
	function addRecipe(fluidOutput as ILiquidStack, ingredients as IItemStack[], timePerItem as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.forestry.Squeezer.addRecipe'~
			serialize.args([serialize.ILiquidStack(fluidOutput), serialize.IItemStack__(ingredients), timePerItem]));
		mods.forestry.Squeezer.addRecipe(fluidOutput, ingredients, timePerItem);
	}

	function addRecipe(fluidOutput as ILiquidStack, ingredients as IItemStack[], timePerItem as int, itemOutput as WeightedItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.forestry.Squeezer.addRecipe'~
			serialize.args([serialize.ILiquidStack(fluidOutput), serialize.IItemStack__(ingredients), timePerItem, serialize.WeightedItemStack(itemOutput)]));
		mods.forestry.Squeezer.addRecipe(fluidOutput, ingredients, timePerItem, itemOutput);
	}

}
static Squeezer as Class_Squeezer = Class_Squeezer();

//####################################################
// Uses of this class: 4
zenClass Class_ThermionicFabricator { zenConstructor() {}

	// Uses of this method: 4
	function addCast(output as IItemStack, ingredients as IIngredient[][], liquidStack as ILiquidStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.forestry.ThermionicFabricator.addCast'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient____(ingredients), serialize.ILiquidStack(liquidStack)]));
		mods.forestry.ThermionicFabricator.addCast(output, ingredients, liquidStack);
	}

	function addCast(output as IItemStack, ingredients as IIngredient[][], liquidStack as ILiquidStack, plan as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.forestry.ThermionicFabricator.addCast'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient____(ingredients), serialize.ILiquidStack(liquidStack), serialize.IItemStack(plan)]));
		mods.forestry.ThermionicFabricator.addCast(output, ingredients, liquidStack, plan);
	}

}
static ThermionicFabricator as Class_ThermionicFabricator = Class_ThermionicFabricator();
