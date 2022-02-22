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
#modloaded mekanism
// Uses of this mod: 54


//####################################################
// Uses of this class: 1
zenClass Class_chemical_dissolution { zenConstructor() {}

	// Uses of this method: 1
	function addRecipe(inputStack as IIngredient, outputGas as IGasStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.mekanism.chemical.dissolution.addRecipe'~
			serialize.args([serialize.IIngredient(inputStack), serialize.IGasStack(outputGas)]));
		mods.mekanism.chemical.dissolution.addRecipe(inputStack, outputGas);
	}

}
static chemical_dissolution as Class_chemical_dissolution = Class_chemical_dissolution();

//####################################################
// Uses of this class: 1
zenClass Class_chemical_injection { zenConstructor() {}

	// Uses of this method: 1
	function addRecipe(inputStack as IIngredient, inputGas as IGasStack, outputStack as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.mekanism.chemical.injection.addRecipe'~
			serialize.args([serialize.IIngredient(inputStack), serialize.IGasStack(inputGas), serialize.IItemStack(outputStack)]));
		mods.mekanism.chemical.injection.addRecipe(inputStack, inputGas, outputStack);
	}

}
static chemical_injection as Class_chemical_injection = Class_chemical_injection();

//####################################################
// Uses of this class: 22
zenClass Class_combiner { zenConstructor() {}

	// Uses of this method: 22
	function addRecipe(itemInput as IIngredient, itemOutput as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.mekanism.combiner.addRecipe'~
			serialize.args([serialize.IIngredient(itemInput), serialize.IItemStack(itemOutput)]));
		mods.mekanism.combiner.addRecipe(itemInput, itemOutput);
	}

}
static combiner as Class_combiner = Class_combiner();

//####################################################
// Uses of this class: 5
zenClass Class_crusher { zenConstructor() {}

	// Uses of this method: 5
	function addRecipe(inputStack as IIngredient, outputStack as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.mekanism.crusher.addRecipe'~
			serialize.args([serialize.IIngredient(inputStack), serialize.IItemStack(outputStack)]));
		mods.mekanism.crusher.addRecipe(inputStack, outputStack);
	}

}
static crusher as Class_crusher = Class_crusher();

//####################################################
// Uses of this class: 1
zenClass Class_separator { zenConstructor() {}

	// Uses of this method: 1
	function addRecipe(inputFluid as ILiquidStack, inputRF as double, outputGas1 as IGasStack, outputGas2 as IGasStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.mekanism.separator.addRecipe'~
			serialize.args([serialize.ILiquidStack(inputFluid), inputRF, serialize.IGasStack(outputGas1), serialize.IGasStack(outputGas2)]));
		mods.mekanism.separator.addRecipe(inputFluid, inputRF, outputGas1, outputGas2);
	}

}
static separator as Class_separator = Class_separator();

//####################################################
// Uses of this class: 6
zenClass Class_enrichment { zenConstructor() {}

	// Uses of this method: 6
	function addRecipe(inputStack as IIngredient, outputStack as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.mekanism.enrichment.addRecipe'~
			serialize.args([serialize.IIngredient(inputStack), serialize.IItemStack(outputStack)]));
		mods.mekanism.enrichment.addRecipe(inputStack, outputStack);
	}

}
static enrichment as Class_enrichment = Class_enrichment();

//####################################################
// Uses of this class: 11
zenClass Class_infuser { zenConstructor() {}

	// Uses of this method: 11
	function addRecipe(infusionType as string, infusionConsumed as int, inputStack as IIngredient, outputStack as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.mekanism.infuser.addRecipe'~
			serialize.args([serialize._string(infusionType), infusionConsumed, serialize.IIngredient(inputStack), serialize.IItemStack(outputStack)]));
		mods.mekanism.infuser.addRecipe(infusionType, infusionConsumed, inputStack, outputStack);
	}

}
static infuser as Class_infuser = Class_infuser();

//####################################################
// Uses of this class: 1
zenClass Class_compressor { zenConstructor() {}

	// Uses of this method: 1
	function addRecipe(inputStack as IIngredient, outputStack as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.mekanism.compressor.addRecipe'~
			serialize.args([serialize.IIngredient(inputStack), serialize.IItemStack(outputStack)]));
		mods.mekanism.compressor.addRecipe(inputStack, outputStack);
	}

}
static compressor as Class_compressor = Class_compressor();

//####################################################
// Uses of this class: 5
zenClass Class_sawmill { zenConstructor() {}

	// Uses of this method: 5
	function addRecipe(inputStack as IIngredient, outputStack as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.mekanism.sawmill.addRecipe'~
			serialize.args([serialize.IIngredient(inputStack), serialize.IItemStack(outputStack)]));
		mods.mekanism.sawmill.addRecipe(inputStack, outputStack);
	}

	function addRecipe(inputStack as IIngredient, outputStack as IItemStack, bonusOutput as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.mekanism.sawmill.addRecipe'~
			serialize.args([serialize.IIngredient(inputStack), serialize.IItemStack(outputStack), serialize.IItemStack(bonusOutput)]));
		mods.mekanism.sawmill.addRecipe(inputStack, outputStack, bonusOutput);
	}

	function addRecipe(inputStack as IIngredient, outputStack as IItemStack, bonusOutput as IItemStack, bonusChance as double) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.mekanism.sawmill.addRecipe'~
			serialize.args([serialize.IIngredient(inputStack), serialize.IItemStack(outputStack), serialize.IItemStack(bonusOutput), bonusChance]));
		mods.mekanism.sawmill.addRecipe(inputStack, outputStack, bonusOutput, bonusChance);
	}

}
static sawmill as Class_sawmill = Class_sawmill();

//####################################################
// Uses of this class: 1
zenClass Class_purification { zenConstructor() {}

	// Uses of this method: 1
	function addRecipe(itemInput as IIngredient, itemOutput as IItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.mekanism.purification.addRecipe'~
			serialize.args([serialize.IIngredient(itemInput), serialize.IItemStack(itemOutput)]));
		mods.mekanism.purification.addRecipe(itemInput, itemOutput);
	}

}
static purification as Class_purification = Class_purification();
