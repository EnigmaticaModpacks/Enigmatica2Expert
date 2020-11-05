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
// Uses of this mod: 24


//####################################################
// Uses of this class: 1
zenClass Class_chemical_dissolution { zenConstructor() {}

	// Uses of this method: 1
	function addRecipe(inputStack as IIngredient, outputGas as IGasStack) as void {
		print('Recipe wrapped: mods.mekanism.chemical.dissolution.addRecipe'~
			serializeArguments([serialize_IIngredient(inputStack), serializeGas(outputGas)]));
		mods.mekanism.chemical.dissolution.addRecipe(inputStack, outputGas);
	}

}
static chemical_dissolution as Class_chemical_dissolution = Class_chemical_dissolution() as Class_chemical_dissolution;

//####################################################
// Uses of this class: 1
zenClass Class_chemical_injection { zenConstructor() {}

	// Uses of this method: 1
	function addRecipe(inputStack as IIngredient, inputGas as IGasStack, outputStack as IItemStack) as void {
		print('Recipe wrapped: mods.mekanism.chemical.injection.addRecipe'~
			serializeArguments([serialize_IIngredient(inputStack), serializeGas(inputGas), serialize_IItemStack(outputStack)]));
		mods.mekanism.chemical.injection.addRecipe(inputStack, inputGas, outputStack);
	}

}
static chemical_injection as Class_chemical_injection = Class_chemical_injection() as Class_chemical_injection;

//####################################################
// Uses of this class: 4
zenClass Class_crusher { zenConstructor() {}

	// Uses of this method: 4
	function addRecipe(inputStack as IIngredient, outputStack as IItemStack) as void {
		print('Recipe wrapped: mods.mekanism.crusher.addRecipe'~
			serializeArguments([serialize_IIngredient(inputStack), serialize_IItemStack(outputStack)]));
		mods.mekanism.crusher.addRecipe(inputStack, outputStack);
	}

}
static crusher as Class_crusher = Class_crusher() as Class_crusher;

//####################################################
// Uses of this class: 2
zenClass Class_smelter { zenConstructor() {}

	// Uses of this method: 2
	function addRecipe(inputStack as IIngredient, outputStack as IItemStack) as void {
		print('Recipe wrapped: mods.mekanism.smelter.addRecipe'~
			serializeArguments([serialize_IIngredient(inputStack), serialize_IItemStack(outputStack)]));
		mods.mekanism.smelter.addRecipe(inputStack, outputStack);
	}

}
static smelter as Class_smelter = Class_smelter() as Class_smelter;

//####################################################
// Uses of this class: 5
zenClass Class_enrichment { zenConstructor() {}

	// Uses of this method: 5
	function addRecipe(inputStack as IIngredient, outputStack as IItemStack) as void {
		print('Recipe wrapped: mods.mekanism.enrichment.addRecipe'~
			serializeArguments([serialize_IIngredient(inputStack), serialize_IItemStack(outputStack)]));
		mods.mekanism.enrichment.addRecipe(inputStack, outputStack);
	}

}
static enrichment as Class_enrichment = Class_enrichment() as Class_enrichment;

//####################################################
// Uses of this class: 7
zenClass Class_infuser { zenConstructor() {}

	// Uses of this method: 7
	function addRecipe(infusionType as string, infusionConsumed as int, inputStack as IIngredient, outputStack as IItemStack) as void {
		print('Recipe wrapped: mods.mekanism.infuser.addRecipe'~
			serializeArguments([wrapS(infusionType), infusionConsumed, serialize_IIngredient(inputStack), serialize_IItemStack(outputStack)]));
		mods.mekanism.infuser.addRecipe(infusionType, infusionConsumed, inputStack, outputStack);
	}

}
static infuser as Class_infuser = Class_infuser() as Class_infuser;

//####################################################
// Uses of this class: 1
zenClass Class_compressor { zenConstructor() {}

	// Uses of this method: 1
	function addRecipe(inputStack as IIngredient, outputStack as IItemStack) as void {
		print('Recipe wrapped: mods.mekanism.compressor.addRecipe'~
			serializeArguments([serialize_IIngredient(inputStack), serialize_IItemStack(outputStack)]));
		mods.mekanism.compressor.addRecipe(inputStack, outputStack);
	}

}
static compressor as Class_compressor = Class_compressor() as Class_compressor;

//####################################################
// Uses of this class: 2
zenClass Class_sawmill { zenConstructor() {}

	// Uses of this method: 2
	function addRecipe(inputStack as IIngredient, outputStack as IItemStack) as void {
		print('Recipe wrapped: mods.mekanism.sawmill.addRecipe'~
			serializeArguments([serialize_IIngredient(inputStack), serialize_IItemStack(outputStack)]));
		mods.mekanism.sawmill.addRecipe(inputStack, outputStack);
	}

	function addRecipe(inputStack as IIngredient, outputStack as IItemStack, bonusOutput as IItemStack) as void {
		print('Recipe wrapped: mods.mekanism.sawmill.addRecipe'~
			serializeArguments([serialize_IIngredient(inputStack), serialize_IItemStack(outputStack), serialize_IItemStack(bonusOutput)]));
		mods.mekanism.sawmill.addRecipe(inputStack, outputStack, bonusOutput);
	}

	function addRecipe(inputStack as IIngredient, outputStack as IItemStack, bonusOutput as IItemStack, bonusChance as double) as void {
		print('Recipe wrapped: mods.mekanism.sawmill.addRecipe'~
			serializeArguments([serialize_IIngredient(inputStack), serialize_IItemStack(outputStack), serialize_IItemStack(bonusOutput), bonusChance]));
		mods.mekanism.sawmill.addRecipe(inputStack, outputStack, bonusOutput, bonusChance);
	}

}
static sawmill as Class_sawmill = Class_sawmill() as Class_sawmill;

//####################################################
// Uses of this class: 1
zenClass Class_purification { zenConstructor() {}

	// Uses of this method: 1
	function addRecipe(itemInput as IIngredient, itemOutput as IItemStack) as void {
		print('Recipe wrapped: mods.mekanism.purification.addRecipe'~
			serializeArguments([serialize_IIngredient(itemInput), serialize_IItemStack(itemOutput)]));
		mods.mekanism.purification.addRecipe(itemInput, itemOutput);
	}

}
static purification as Class_purification = Class_purification() as Class_purification;
