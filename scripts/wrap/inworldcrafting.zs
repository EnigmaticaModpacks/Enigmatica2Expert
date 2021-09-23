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
#modloaded inworldcrafting
// Uses of this mod: 16


//####################################################
// Uses of this class: 9
zenClass Class_FluidToItem { zenConstructor() {}

	// Uses of this method: 9
	function transform(output as IItemStack, inputFluid as ILiquidStack, inputItems as IIngredient[]) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.inworldcrafting.FluidToItem.transform'~
			serialize.args([serialize.IItemStack(output), serialize.ILiquidStack(inputFluid), serialize.IIngredient__(inputItems)]));
		mods.inworldcrafting.FluidToItem.transform(output, inputFluid, inputItems);
	}

	function transform(output as IItemStack, inputFluid as ILiquidStack, inputItems as IIngredient[], consume as bool) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.inworldcrafting.FluidToItem.transform'~
			serialize.args([serialize.IItemStack(output), serialize.ILiquidStack(inputFluid), serialize.IIngredient__(inputItems), consume]));
		mods.inworldcrafting.FluidToItem.transform(output, inputFluid, inputItems, consume);
	}

}
static FluidToItem as Class_FluidToItem = Class_FluidToItem();

//####################################################
// Uses of this class: 1
zenClass Class_FluidToFluid { zenConstructor() {}

	// Uses of this method: 1
	function transform(output as ILiquidStack, inputFluid as ILiquidStack, inputItems as IIngredient[]) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.inworldcrafting.FluidToFluid.transform'~
			serialize.args([serialize.ILiquidStack(output), serialize.ILiquidStack(inputFluid), serialize.IIngredient__(inputItems)]));
		mods.inworldcrafting.FluidToFluid.transform(output, inputFluid, inputItems);
	}

	function transform(output as ILiquidStack, inputFluid as ILiquidStack, inputItems as IIngredient[], consume as bool) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.inworldcrafting.FluidToFluid.transform'~
			serialize.args([serialize.ILiquidStack(output), serialize.ILiquidStack(inputFluid), serialize.IIngredient__(inputItems), consume]));
		mods.inworldcrafting.FluidToFluid.transform(output, inputFluid, inputItems, consume);
	}

}
static FluidToFluid as Class_FluidToFluid = Class_FluidToFluid();

//####################################################
// Uses of this class: 2
zenClass Class_FireCrafting { zenConstructor() {}

	// Uses of this method: 2
	function addRecipe(output as IItemStack, inputItem as IIngredient) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.inworldcrafting.FireCrafting.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(inputItem)]));
		mods.inworldcrafting.FireCrafting.addRecipe(output, inputItem);
	}

	function addRecipe(output as IItemStack, inputItem as IIngredient, ticks as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.inworldcrafting.FireCrafting.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IIngredient(inputItem), ticks]));
		mods.inworldcrafting.FireCrafting.addRecipe(output, inputItem, ticks);
	}

}
static FireCrafting as Class_FireCrafting = Class_FireCrafting();

//####################################################
// Uses of this class: 4
zenClass Class_ExplosionCrafting { zenConstructor() {}

	// Uses of this method: 4
	function explodeBlockRecipe(output as IItemStack, blockStack as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.inworldcrafting.ExplosionCrafting.explodeBlockRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(blockStack)]));
		mods.inworldcrafting.ExplosionCrafting.explodeBlockRecipe(output, blockStack);
	}

	function explodeBlockRecipe(output as IItemStack, blockStack as IItemStack, itemSpawnChance as int) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.inworldcrafting.ExplosionCrafting.explodeBlockRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(blockStack), itemSpawnChance]));
		mods.inworldcrafting.ExplosionCrafting.explodeBlockRecipe(output, blockStack, itemSpawnChance);
	}

}
static ExplosionCrafting as Class_ExplosionCrafting = Class_ExplosionCrafting();
