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
#modloaded industrialforegoing
// Uses of this mod: 6


//####################################################
// Uses of this class: 5
zenClass Class_SludgeRefiner { zenConstructor() {}

	// Uses of this method: 5
	function add(output as IItemStack, ItemWeight as int) as void {
		print('Recipe wrapped: mods.industrialforegoing.SludgeRefiner.add'~
			serializeArguments([serialize_IItemStack(output), ItemWeight]));
		mods.industrialforegoing.SludgeRefiner.add(output, ItemWeight);
	}

}
static SludgeRefiner as Class_SludgeRefiner = Class_SludgeRefiner() as Class_SludgeRefiner;

//####################################################
// Uses of this class: 1
zenClass Class_Extractor { zenConstructor() {}

	// Uses of this method: 1
	function add(output as IItemStack, fluid as ILiquidStack) as void {
		print('Recipe wrapped: mods.industrialforegoing.Extractor.add'~
			serializeArguments([serialize_IItemStack(output), serializeFluid(fluid)]));
		mods.industrialforegoing.Extractor.add(output, fluid);
	}

}
static Extractor as Class_Extractor = Class_Extractor() as Class_Extractor;
