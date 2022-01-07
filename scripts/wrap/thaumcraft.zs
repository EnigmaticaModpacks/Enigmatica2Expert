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
#modloaded thaumcraft
// Uses of this mod: 10


//####################################################
// Uses of this class: 4
zenClass Class_Crucible { zenConstructor() {}

	// Uses of this method: 4
	function registerRecipe(name as string, researchKey as string, output as IItemStack, input as IIngredient, aspects as CTAspectStack[]) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.thaumcraft.Crucible.registerRecipe'~
			serialize.args([serialize._string(name), serialize._string(researchKey), serialize.IItemStack(output), serialize.IIngredient(input), serialize.CTAspectStack__(aspects)]));
		mods.thaumcraft.Crucible.registerRecipe(name, researchKey, output, input, aspects);
	}

}
static Crucible as Class_Crucible = Class_Crucible();

//####################################################
// Uses of this class: 4
zenClass Class_Infusion { zenConstructor() {}

	// Uses of this method: 4
	function registerRecipe(name as string, research as string, output as IItemStack, instability as int, aspects as CTAspectStack[], centralItem as IIngredient, recipe as IIngredient[]) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.thaumcraft.Infusion.registerRecipe'~
			serialize.args([serialize._string(name), serialize._string(research), serialize.IItemStack(output), instability, serialize.CTAspectStack__(aspects), serialize.IIngredient(centralItem), serialize.IIngredient__(recipe)]));
		mods.thaumcraft.Infusion.registerRecipe(name, research, output, instability, aspects, centralItem, recipe);
	}

}
static Infusion as Class_Infusion = Class_Infusion();

//####################################################
// Uses of this class: 2
zenClass Class_SmeltingBonus { zenConstructor() {}

	// Uses of this method: 2
	function addSmeltingBonus(input as IIngredient, stack as WeightedItemStack) as void {
		if(utils.DEBUG) print('Recipe wrapped: mods.thaumcraft.SmeltingBonus.addSmeltingBonus'~
			serialize.args([serialize.IIngredient(input), serialize.WeightedItemStack(stack)]));
		mods.thaumcraft.SmeltingBonus.addSmeltingBonus(input, stack);
	}

}
static SmeltingBonus as Class_SmeltingBonus = Class_SmeltingBonus();
