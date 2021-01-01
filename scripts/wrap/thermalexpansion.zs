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
#modloaded thermalexpansion
// Uses of this mod: 65


//####################################################
// Uses of this class: 6
zenClass Class_Centrifuge { zenConstructor() {}

	// Uses of this method: 6
	function addRecipe(outputs as WeightedItemStack[], input as IItemStack, fluid as ILiquidStack, energy as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.Centrifuge.addRecipe'~
			serialize.args([serialize.WeightedItemStack__(outputs), serialize.IItemStack(input), serialize.ILiquidStack(fluid), energy]));
		mods.thermalexpansion.Centrifuge.addRecipe(outputs, input, fluid, energy);
	}

}
static Centrifuge as Class_Centrifuge = Class_Centrifuge();

//####################################################
// Uses of this class: 9
zenClass Class_Compactor { zenConstructor() {}

	// Uses of this method: 1
	function addMintRecipe(output as IItemStack, input as IItemStack, energy as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.Compactor.addMintRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), energy]));
		mods.thermalexpansion.Compactor.addMintRecipe(output, input, energy);
	}

	function addPressRecipe(output as IItemStack, input as IItemStack, energy as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.Compactor.addPressRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), energy]));
		mods.thermalexpansion.Compactor.addPressRecipe(output, input, energy);
	}

	function addGearRecipe(output as IItemStack, input as IItemStack, energy as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.Compactor.addGearRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), energy]));
		mods.thermalexpansion.Compactor.addGearRecipe(output, input, energy);
	}

}
static Compactor as Class_Compactor = Class_Compactor();

//####################################################
// Uses of this class: 7
zenClass Class_Crucible { zenConstructor() {}

	// Uses of this method: 7
	function addRecipe(output as ILiquidStack, input as IItemStack, energy as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.Crucible.addRecipe'~
			serialize.args([serialize.ILiquidStack(output), serialize.IItemStack(input), energy]));
		mods.thermalexpansion.Crucible.addRecipe(output, input, energy);
	}

}
static Crucible as Class_Crucible = Class_Crucible();

//####################################################
// Uses of this class: 1
zenClass Class_Infuser { zenConstructor() {}

	// Uses of this method: 1
	function addRecipe(output as IItemStack, input as IItemStack, energy as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.Infuser.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), energy]));
		mods.thermalexpansion.Infuser.addRecipe(output, input, energy);
	}

}
static Infuser as Class_Infuser = Class_Infuser();

//####################################################
// Uses of this class: 7
zenClass Class_Transposer { zenConstructor() {}

	// Uses of this method: 7
	function addFillRecipe(output as IItemStack, input as IItemStack, fluid as ILiquidStack, energy as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.Transposer.addFillRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), serialize.ILiquidStack(fluid), energy]));
		mods.thermalexpansion.Transposer.addFillRecipe(output, input, fluid, energy);
	}

}
static Transposer as Class_Transposer = Class_Transposer();

//####################################################
// Uses of this class: 15
zenClass Class_InductionSmelter { zenConstructor() {}

	// Uses of this method: 15
	function addRecipe(primaryOutput as IItemStack, primaryInput as IItemStack, secondaryInput as IItemStack, energy as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.InductionSmelter.addRecipe'~
			serialize.args([serialize.IItemStack(primaryOutput), serialize.IItemStack(primaryInput), serialize.IItemStack(secondaryInput), energy]));
		mods.thermalexpansion.InductionSmelter.addRecipe(primaryOutput, primaryInput, secondaryInput, energy);
	}

	function addRecipe(primaryOutput as IItemStack, primaryInput as IItemStack, secondaryInput as IItemStack, energy as int, secondaryOutput as IItemStack) as void {
		print('Recipe wrapped: mods.thermalexpansion.InductionSmelter.addRecipe'~
			serialize.args([serialize.IItemStack(primaryOutput), serialize.IItemStack(primaryInput), serialize.IItemStack(secondaryInput), energy, serialize.IItemStack(secondaryOutput)]));
		mods.thermalexpansion.InductionSmelter.addRecipe(primaryOutput, primaryInput, secondaryInput, energy, secondaryOutput);
	}

	function addRecipe(primaryOutput as IItemStack, primaryInput as IItemStack, secondaryInput as IItemStack, energy as int, secondaryOutput as IItemStack, secondaryChance as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.InductionSmelter.addRecipe'~
			serialize.args([serialize.IItemStack(primaryOutput), serialize.IItemStack(primaryInput), serialize.IItemStack(secondaryInput), energy, serialize.IItemStack(secondaryOutput), secondaryChance]));
		mods.thermalexpansion.InductionSmelter.addRecipe(primaryOutput, primaryInput, secondaryInput, energy, secondaryOutput, secondaryChance);
	}

}
static InductionSmelter as Class_InductionSmelter = Class_InductionSmelter();

//####################################################
// Uses of this class: 1
zenClass Class_Insolator { zenConstructor() {}

	// Uses of this method: 1
	function addRecipe(primaryOutput as IItemStack, primaryInput as IItemStack, secondaryInput as IItemStack, energy as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.Insolator.addRecipe'~
			serialize.args([serialize.IItemStack(primaryOutput), serialize.IItemStack(primaryInput), serialize.IItemStack(secondaryInput), energy]));
		mods.thermalexpansion.Insolator.addRecipe(primaryOutput, primaryInput, secondaryInput, energy);
	}

	function addRecipe(primaryOutput as IItemStack, primaryInput as IItemStack, secondaryInput as IItemStack, energy as int, secondaryOutput as IItemStack) as void {
		print('Recipe wrapped: mods.thermalexpansion.Insolator.addRecipe'~
			serialize.args([serialize.IItemStack(primaryOutput), serialize.IItemStack(primaryInput), serialize.IItemStack(secondaryInput), energy, serialize.IItemStack(secondaryOutput)]));
		mods.thermalexpansion.Insolator.addRecipe(primaryOutput, primaryInput, secondaryInput, energy, secondaryOutput);
	}

	function addRecipe(primaryOutput as IItemStack, primaryInput as IItemStack, secondaryInput as IItemStack, energy as int, secondaryOutput as IItemStack, secondaryChance as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.Insolator.addRecipe'~
			serialize.args([serialize.IItemStack(primaryOutput), serialize.IItemStack(primaryInput), serialize.IItemStack(secondaryInput), energy, serialize.IItemStack(secondaryOutput), secondaryChance]));
		mods.thermalexpansion.Insolator.addRecipe(primaryOutput, primaryInput, secondaryInput, energy, secondaryOutput, secondaryChance);
	}

}
static Insolator as Class_Insolator = Class_Insolator();

//####################################################
// Uses of this class: 13
zenClass Class_Pulverizer { zenConstructor() {}

	// Uses of this method: 13
	function addRecipe(output as IItemStack, input as IItemStack, energy as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.Pulverizer.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), energy]));
		mods.thermalexpansion.Pulverizer.addRecipe(output, input, energy);
	}

	function addRecipe(output as IItemStack, input as IItemStack, energy as int, secondaryOutput as IItemStack) as void {
		print('Recipe wrapped: mods.thermalexpansion.Pulverizer.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), energy, serialize.IItemStack(secondaryOutput)]));
		mods.thermalexpansion.Pulverizer.addRecipe(output, input, energy, secondaryOutput);
	}

	function addRecipe(output as IItemStack, input as IItemStack, energy as int, secondaryOutput as IItemStack, secondaryChance as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.Pulverizer.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), energy, serialize.IItemStack(secondaryOutput), secondaryChance]));
		mods.thermalexpansion.Pulverizer.addRecipe(output, input, energy, secondaryOutput, secondaryChance);
	}

}
static Pulverizer as Class_Pulverizer = Class_Pulverizer();

//####################################################
// Uses of this class: 2
zenClass Class_RedstoneFurnace { zenConstructor() {}

	// Uses of this method: 2
	function addPyrolysisRecipe(output as IItemStack, input as IItemStack, energy as int, creosote as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.RedstoneFurnace.addPyrolysisRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), energy, creosote]));
		mods.thermalexpansion.RedstoneFurnace.addPyrolysisRecipe(output, input, energy, creosote);
	}

}
static RedstoneFurnace as Class_RedstoneFurnace = Class_RedstoneFurnace();

//####################################################
// Uses of this class: 4
zenClass Class_Sawmill { zenConstructor() {}

	// Uses of this method: 4
	function addRecipe(output as IItemStack, input as IItemStack, energy as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.Sawmill.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), energy]));
		mods.thermalexpansion.Sawmill.addRecipe(output, input, energy);
	}

	function addRecipe(output as IItemStack, input as IItemStack, energy as int, secondaryOutput as IItemStack) as void {
		print('Recipe wrapped: mods.thermalexpansion.Sawmill.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), energy, serialize.IItemStack(secondaryOutput)]));
		mods.thermalexpansion.Sawmill.addRecipe(output, input, energy, secondaryOutput);
	}

	function addRecipe(output as IItemStack, input as IItemStack, energy as int, secondaryOutput as IItemStack, secondaryChance as int) as void {
		print('Recipe wrapped: mods.thermalexpansion.Sawmill.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), energy, serialize.IItemStack(secondaryOutput), secondaryChance]));
		mods.thermalexpansion.Sawmill.addRecipe(output, input, energy, secondaryOutput, secondaryChance);
	}

}
static Sawmill as Class_Sawmill = Class_Sawmill();
