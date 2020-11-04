import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.liquid.ILiquidDefinition;
import mod.mekanism.gas.IGasStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.block.IBlock;
import thaumcraft.aspect.CTAspectStack;

#priority 3000


global serialize_IIngredient as function(IIngredient)string = function (a as IIngredient) as string {
	return !isNull(a) ? a.commandString : 'null';
};
global serialize_IItemStack as function(IItemStack)string = function (a as IItemStack) as string {
	return !isNull(a) ? a.commandString : 'null';
};

global serializeArray as function(string[], string)string = function (arr as string[], parens as string) as string {
	var s = parens[0];
	for k,v in arr {
		s += (k!=0?', ':'')~v;
	}
	return s~parens[1];
};

global serializeArguments as function(string[])string = function (arr as string[]) as string {
	return serializeArray(arr, '()');
};

global serializeIngredients1d as function(IIngredient[])string = function (ingredients as IIngredient[]) as string {
	var s = [] as string[];
	for k,v in ingredients {
		s = s + serialize_IIngredient(v);
	}
	return serializeArray(s, '[]');
};

global serializeIngredients2d as function(IIngredient[][])string = function (ingredients as IIngredient[][]) as string {
	var s = [] as string[];
	for k,v in ingredients {
		s = s + serializeIngredients1d(v);
	}
	return serializeArray(s, '[]');
};

global serializeFluid as function(ILiquidStack)string = function (a as ILiquidStack) as string {
	return !isNull(a) ? ("<fluid:"~a.name~">" ~ (a.amount>1 ? " * " ~ a.amount : "")) : 'null';
};

global serializeFluids1d as function(ILiquidStack[])string = function (fluids as ILiquidStack[]) as string {
	var s = [] as string[];
	for k,v in fluids {
		s = s + (!isNull(v) ? serializeFluid(v) : 'null');
	}
	return serializeArray(s, '[]');
};


global serializeFluidDefinition as function(ILiquidDefinition)string = function (a as ILiquidDefinition) as string {
	return !isNull(a) ? ("<fluid:"~a.name~">") : 'null';
};

global wrapS as function(string)string = function(s as string) as string { return '"'~s~'"'; };

global serializeString1d as function(string[])string = function (ss as string[]) as string {
	var s = [] as string[];
	for k,v in ss {
		s = s + wrapS(v);
	}
	return serializeArray(s, '[]');
};

global serializeGas as function(IGasStack)string = function (a as IGasStack) as string {
	return !isNull(a) ? ("<gas:"~a.NAME~">" ~ (a.amount>1 ? " * " ~ a.amount : "")) : 'null';
};

global serializeWeightedItemStack as function(WeightedItemStack)string = function (a as WeightedItemStack) as string {
	return !isNull(a) ? (a.stack.commandString~'.weight('~a.percent~')') : 'null';
};

global serializeWeightedItemStack1d as function(WeightedItemStack[])string = function (ss as WeightedItemStack[]) as string {
	var s = [] as string[];
	for k,v in ss {
		s = s + serializeWeightedItemStack(v);
	}
	return serializeArray(s, '[]');
};

global serialize_IOreDictEntry as function(IOreDictEntry)string = function (a as IOreDictEntry) as string {
	return !isNull(a) ? ("<ore:"~a.name~">") : 'null';
};

global serialize_IBlock as function(IBlock)string = function (a as IBlock) as string {
	return !isNull(a) ? (a.definition.defaultState.commandString) : 'null';
};

global serialize_CTAspectStack as function(CTAspectStack)string = function (a as CTAspectStack) as string {
	return !isNull(a) ? ("<aspect:"~a.internal.name~">" ~ (a.amount>1 ? " * " ~ a.amount : "")) : 'null';
};

global serialize_CTAspectStack_1d as function(CTAspectStack[])string = function (a as CTAspectStack[]) as string {
	var s = [] as string[];
	for k,v in a {
		s = s + serialize_CTAspectStack(v);
	}
	return serializeArray(s, '[]');
};