import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import mods.jei.JEI.removeAndHide as rh;

#priority 100


# Generate item name
global getItemName as function(IItemStack)string = 
    function (item as IItemStack) as string  {
	return item.definition.id.replaceAll(":", "_") ~ "_" ~ item.damage;
};

global getRecipeName as function(IItemStack, IItemStack)string = 
    function (input as IItemStack, output as IItemStack) as string  {
	return getItemName(input) ~ " from " ~ getItemName(output);
};

# Remake any recipe
global remake as function(string, IItemStack, IIngredient[][])void = 
    function (name as string, item as IItemStack, input as IIngredient[][]) as void  {

	recipes.remove(item);
	recipes.addShaped(name, item, input);
};

# Add recipe but generate name
global makeEx as function(IItemStack, IIngredient[][])void = 
    function (item as IItemStack, input as IIngredient[][]) as void  {
		
	recipes.addShaped(getItemName(item), item, input);
};

# Remake any recipe automaticly generate name
global remakeEx as function(IItemStack, IIngredient[][])void = 
    function (item as IItemStack, input as IIngredient[][]) as void  {

	recipes.remove(item);
	makeEx(item, input);
};

# ######################################################################
#
# Global Functions
#
# ######################################################################

# ########################
# Clear Fluid tag on item
#  preserving other tags
# ########################
global clearFluid as function(IItemStack)void = 
    function (input as IItemStack) as void  {

	recipes.addShapeless("Fluid Clearing " ~ getItemName(input), 
		input, [input.marked("marked")],
		function(out, ins, cInfo) {
			var tag = {} as crafttweaker.data.IData;
			if(ins has "marked" && !isNull(ins.marked) && ins.marked.hasTag) {
				tag = ins.marked.tag;
				if (!isNull(tag.Fluid)) {
					tag = tag - "Fluid";
				}
			}
			return out.withTag(tag);
	}, null);
};