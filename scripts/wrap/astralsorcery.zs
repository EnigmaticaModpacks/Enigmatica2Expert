import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

#priority 2900

//##############################################################
//
// Recipe dump wrappers
//
//##############################################################

//####################################################
zenClass Class_Altar { zenConstructor() {}
	function addAttunementAltarRecipe(name as string, out as IItemStack, n1 as int, n2 as int, ingr1d as IIngredient[]) as void {
		print('Recipe wrapped:\nmods.astralsorcery.Altar.addAttunementAltarRecipe'~
			serializeArguments([wrapS(name), out.commandString, n1, n2, serializeIngredients1d(ingr1d)]));
		mods.astralsorcery.Altar.addAttunementAltarRecipe(name, out, n1, n2, ingr1d);
	}
	function addConstellationAltarRecipe(name as string, out as IItemStack, n1 as int, n2 as int, ingr1d as IIngredient[]) as void {
		print('Recipe wrapped:\nmods.astralsorcery.Altar.addConstellationAltarRecipe'~
			serializeArguments([wrapS(name), out.commandString, n1, n2, serializeIngredients1d(ingr1d)]));
		mods.astralsorcery.Altar.addConstellationAltarRecipe(name, out, n1, n2, ingr1d);
	}
	function addDiscoveryAltarRecipe(name as string, out as IItemStack, n1 as int, n2 as int, ingr1d as IIngredient[]) as void {
		print('Recipe wrapped:\nmods.astralsorcery.Altar.addDiscoveryAltarRecipe'~
			serializeArguments([wrapS(name), out.commandString, n1, n2, serializeIngredients1d(ingr1d)]));
		mods.astralsorcery.Altar.addDiscoveryAltarRecipe(name, out, n1, n2, ingr1d);
	}
	function addTraitAltarRecipe(name as string, out as IItemStack, n1 as int, n2 as int, ingr1d as IIngredient[], name2 as string) as void {
		print('Recipe wrapped:\nmods.astralsorcery.Altar.addTraitAltarRecipe'~
			serializeArguments([wrapS(name), out.commandString, n1, n2, serializeIngredients1d(ingr1d), wrapS(name2)]));
		mods.astralsorcery.Altar.addTraitAltarRecipe(name, out, n1, n2, ingr1d, name2);
	}
	function removeAltarRecipe(name as string) as void {
		// print('Recipe wrapped:\nmods.astralsorcery.Altar.removeAltarRecipe'~
		// 	serializeArguments([wrapS(name)]));
		mods.astralsorcery.Altar.removeAltarRecipe(name);
	}
}
static Altar as Class_Altar = Class_Altar() as Class_Altar;

//####################################################
zenClass Class_Grindstone { zenConstructor() {}
	function addRecipe(input as IItemStack, out as IItemStack, f1 as float) as void {
		print('Recipe wrapped:\nmods.astralsorcery.Grindstone.addRecipe'~
			serializeArguments([input.commandString, out.commandString, f1]));
		mods.astralsorcery.Grindstone.addRecipe(input, out, f1);
	}
}
static Grindstone as Class_Grindstone = Class_Grindstone() as Class_Grindstone;

//####################################################
zenClass Class_LightTransmutation { zenConstructor() {}
	function addTransmutation(inp as IItemStack, out as IItemStack, cost as double) as void {
		print('Recipe wrapped:\nmods.astralsorcery.LightTransmutation.addTransmutation'~
			serializeArguments([inp.commandString, out.commandString, cost]));
		mods.astralsorcery.LightTransmutation.addTransmutation(inp, out, cost);
	}
}
static LightTransmutation as Class_LightTransmutation = Class_LightTransmutation() as Class_LightTransmutation;

//####################################################
zenClass Class_LiquidInteraction { zenConstructor() {}
	function addInteraction(liquidIn1 as ILiquidStack, chanceConsumption1 as float, liquidIn2 as ILiquidStack, chanceConsumption2 as float, weight as int, output as IItemStack) as void {
		// print('Recipe wrapped:\nmods.astralsorcery.LiquidInteraction.addInteraction'~
		// 	serializeArguments([liquidIn1.commandString, chanceConsumption1, liquidIn2.commandString, chanceConsumption2, weight, output.commandString]));
		mods.astralsorcery.LiquidInteraction.addInteraction(liquidIn1, chanceConsumption1, liquidIn2, chanceConsumption2, weight, output);
	}
}
static LiquidInteraction as Class_LiquidInteraction = Class_LiquidInteraction() as Class_LiquidInteraction;

//####################################################
zenClass Class_StarlightInfusion { zenConstructor() {}
	function addInfusion(input as IItemStack, output as IItemStack, consumeMultiple as bool, consumptionChance as float, craftingTickTime as int) as void {
		print('Recipe wrapped:\nmods.astralsorcery.StarlightInfusion.addInfusion'~
			serializeArguments([input.commandString, output.commandString, consumeMultiple, consumptionChance, craftingTickTime]));
		mods.astralsorcery.StarlightInfusion.addInfusion(input, output, consumeMultiple, consumptionChance, craftingTickTime);
	}
}
static StarlightInfusion as Class_StarlightInfusion = Class_StarlightInfusion() as Class_StarlightInfusion;

