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
#modloaded appliedenergistics2
// Uses of this mod: 4


//####################################################
// Uses of this class: 4
zenClass Class_Grinder { zenConstructor() {}

	// Uses of this method: 4
	function addRecipe(output as IItemStack, input as IItemStack, turns as int) as void {
		print('Recipe wrapped: mods.appliedenergistics2.Grinder.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), turns]));
		mods.appliedenergistics2.Grinder.addRecipe(output, input, turns);
	}

	function addRecipe(output as IItemStack, input as IItemStack, turns as int, secondary1Output as IItemStack) as void {
		print('Recipe wrapped: mods.appliedenergistics2.Grinder.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), turns, serialize.IItemStack(secondary1Output)]));
		mods.appliedenergistics2.Grinder.addRecipe(output, input, turns, secondary1Output);
	}

	function addRecipe(output as IItemStack, input as IItemStack, turns as int, secondary1Output as IItemStack, secondary1Chance as float) as void {
		print('Recipe wrapped: mods.appliedenergistics2.Grinder.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), turns, serialize.IItemStack(secondary1Output), secondary1Chance]));
		mods.appliedenergistics2.Grinder.addRecipe(output, input, turns, secondary1Output, secondary1Chance);
	}

	function addRecipe(output as IItemStack, input as IItemStack, turns as int, secondary1Output as IItemStack, secondary1Chance as float, secondary2Output as IItemStack) as void {
		print('Recipe wrapped: mods.appliedenergistics2.Grinder.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), turns, serialize.IItemStack(secondary1Output), secondary1Chance, serialize.IItemStack(secondary2Output)]));
		mods.appliedenergistics2.Grinder.addRecipe(output, input, turns, secondary1Output, secondary1Chance, secondary2Output);
	}

	function addRecipe(output as IItemStack, input as IItemStack, turns as int, secondary1Output as IItemStack, secondary1Chance as float, secondary2Output as IItemStack, secondary2Chance as float) as void {
		print('Recipe wrapped: mods.appliedenergistics2.Grinder.addRecipe'~
			serialize.args([serialize.IItemStack(output), serialize.IItemStack(input), turns, serialize.IItemStack(secondary1Output), secondary1Chance, serialize.IItemStack(secondary2Output), secondary2Chance]));
		mods.appliedenergistics2.Grinder.addRecipe(output, input, turns, secondary1Output, secondary1Chance, secondary2Output, secondary2Chance);
	}

}
static Grinder as Class_Grinder = Class_Grinder();
