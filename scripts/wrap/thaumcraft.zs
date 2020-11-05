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
// Uses of this class: 2
zenClass Class_Crucible { zenConstructor() {}

	// Uses of this method: 2
	function registerRecipe(name as string, researchKey as string, output as IItemStack, input as IIngredient, aspects as CTAspectStack[]) as void {
		print('Recipe wrapped: mods.thaumcraft.Crucible.registerRecipe'~
			serializeArguments([wrapS(name), wrapS(researchKey), serialize_IItemStack(output), serialize_IIngredient(input), serialize_CTAspectStack_1d(aspects)]));
		mods.thaumcraft.Crucible.registerRecipe(name, researchKey, output, input, aspects);
	}

}
static Crucible as Class_Crucible = Class_Crucible() as Class_Crucible;

//####################################################
// Uses of this class: 4
zenClass Class_Infusion { zenConstructor() {}

	// Uses of this method: 4
	function registerRecipe(name as string, research as string, output as IItemStack, instability as int, aspects as CTAspectStack[], centralItem as IIngredient, recipe as IIngredient[]) as void {
		print('Recipe wrapped: mods.thaumcraft.Infusion.registerRecipe'~
			serializeArguments([wrapS(name), wrapS(research), serialize_IItemStack(output), instability, serialize_CTAspectStack_1d(aspects), serialize_IIngredient(centralItem), serializeIngredients1d(recipe)]));
		mods.thaumcraft.Infusion.registerRecipe(name, research, output, instability, aspects, centralItem, recipe);
	}

}
static Infusion as Class_Infusion = Class_Infusion() as Class_Infusion;

//####################################################
// Uses of this class: 4
zenClass Class_SmeltingBonus { zenConstructor() {}

	// Uses of this method: 4
	function addSmeltingBonus(input as IIngredient, stack as WeightedItemStack) as void {
		print('Recipe wrapped: mods.thaumcraft.SmeltingBonus.addSmeltingBonus'~
			serializeArguments([serialize_IIngredient(input), serializeWeightedItemStack(stack)]));
		mods.thaumcraft.SmeltingBonus.addSmeltingBonus(input, stack);
	}

}
static SmeltingBonus as Class_SmeltingBonus = Class_SmeltingBonus() as Class_SmeltingBonus;
