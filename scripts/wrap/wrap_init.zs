import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

#priority 3000

global serializeArguments as function(string[])string = function (arr as string[]) as string {
	var s = '(';
	for k,v in arr {
		s += (k!=0?', ':'')~v;
	}
	return s~')';
};

global serializeIngredients1d as function(IIngredient[])string = function (ingredients as IIngredient[]) as string {
	var s = '[';
	for k,v in ingredients {
		s += (k!=0?', ':'') ~ (!isNull(v) ? v.commandString : 'null');
	}
	return s~']';
};

global serializeIngredients2d as function(IIngredient[][])string = function (ingredients as IIngredient[][]) as string {
	var s = '[';
	for k,v in ingredients {
		s += (k!=0?', ':'')~serializeIngredients1d(v);
	}
	return s~']';
};


global wrapS as function(string)string = function(s as string) as string { return '"'~s~'"'; };