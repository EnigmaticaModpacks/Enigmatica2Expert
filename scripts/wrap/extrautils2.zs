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
#modloaded extrautils2
// Uses of this mod: 6


//####################################################
// Uses of this class: 5
zenClass Class_Crusher { zenConstructor() {}

	// Uses of this method: 5
	function add(output as IItemStack, input as IItemStack) as void {
		print('Recipe wrapped: mods.extrautils2.Crusher.add'~
			serializeArguments([serialize_IItemStack(output), serialize_IItemStack(input)]));
		mods.extrautils2.Crusher.add(output, input);
	}

	function add(output as IItemStack, input as IItemStack, secondaryOutput as IItemStack) as void {
		print('Recipe wrapped: mods.extrautils2.Crusher.add'~
			serializeArguments([serialize_IItemStack(output), serialize_IItemStack(input), serialize_IItemStack(secondaryOutput)]));
		mods.extrautils2.Crusher.add(output, input, secondaryOutput);
	}

	function add(output as IItemStack, input as IItemStack, secondaryOutput as IItemStack, secondaryChance as float) as void {
		print('Recipe wrapped: mods.extrautils2.Crusher.add'~
			serializeArguments([serialize_IItemStack(output), serialize_IItemStack(input), serialize_IItemStack(secondaryOutput), secondaryChance]));
		mods.extrautils2.Crusher.add(output, input, secondaryOutput, secondaryChance);
	}

}
static Crusher as Class_Crusher = Class_Crusher() as Class_Crusher;

//####################################################
// Uses of this class: 1
zenClass Class_Resonator { zenConstructor() {}

	// Uses of this method: 1
	function add(output as IItemStack, input as IItemStack, energy as int) as void {
		print('Recipe wrapped: mods.extrautils2.Resonator.add'~
			serializeArguments([serialize_IItemStack(output), serialize_IItemStack(input), energy]));
		mods.extrautils2.Resonator.add(output, input, energy);
	}

	function add(output as IItemStack, input as IItemStack, energy as int, addOwnerTag as bool) as void {
		print('Recipe wrapped: mods.extrautils2.Resonator.add'~
			serializeArguments([serialize_IItemStack(output), serialize_IItemStack(input), energy, addOwnerTag]));
		mods.extrautils2.Resonator.add(output, input, energy, addOwnerTag);
	}

}
static Resonator as Class_Resonator = Class_Resonator() as Class_Resonator;
