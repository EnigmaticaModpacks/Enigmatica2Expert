import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import mods.jei.JEI.removeAndHide as rh;

#priority 100

# ######################################################################
#
# Global recipe ingredients
#
# ######################################################################

global gemDiamondRat as IIngredient = <ore:gemDiamond> | <rats:rat_diamond>;

# ######################################################################
#
# 
#
# ######################################################################


# ########################
# 
# ########################

global getOredictFromString as function(string)IOreDictEntry = 
    function (cmd as string) as IOreDictEntry  {

	# Oredict entry
	val ore = cmd.replaceAll("^ore:", "");
	return oreDict.get(ore);
};

global getItemstackFromString as function(string)IItemStack = 
    function (cmd as string) as IItemStack  {

	if (cmd.matches("^[^:]+:[^:]+:[0-9]+")){
		# Itemstack with meta
		val id = cmd.replaceAll(":[0-9]+$", "");
		val meta = cmd.replaceAll("^[^:]+:[^:]+:", "");
		return itemUtils.getItem(id, meta);
	}else{
		# Simple mod:name
		return itemUtils.getItem(cmd);
	}
};

global getIngredientFromString as function(string)IIngredient = 
    function (cmd as string) as IIngredient  {

	if (cmd.matches("^ore:.*")) {
		# Oredict entry
		return getOredictFromString(cmd);
	}else{
		# Simple mod:name or mod:name:meta
		return getItemstackFromString(cmd);
	}
};

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

global remakeEnvelop as function(IItemStack, IIngredient, IIngredient)void = 
    function (result as IItemStack, itemCenter as IIngredient, itemAround as IIngredient) as void  {

	recipes.remove(result);
	recipes.addShaped(result, [
			[itemAround, itemAround, itemAround], 
			[itemAround, itemCenter, itemAround], 
			[itemAround, itemAround, itemAround]
		]);
};


/////////////////////////////////////
// 
/////////////////////////////////////

# Remake any recipe with Fluid crafting
global remakeFluidToItem as function(IItemStack, ILiquidStack, IIngredient)void = 
    function (output as IItemStack, fluid as ILiquidStack, input as IIngredient) as void  {

	recipes.remove(output);
	mods.inworldcrafting.FluidToItem.transform(output, fluid, input);
};


/////////////////////////////////////
// 
/////////////////////////////////////
global clearFluid as function(IItemStack)void = 
    function (input as IItemStack) as void  {

	recipes.addShapeless("Fluid Clearing " ~ getItemName(input), 
		input, [input.marked("marked")],
		function(out, ins, cInfo) {
			var tag = {} as crafttweaker.data.IData;
			if(ins has "marked" && !isNull(ins.marked) && ins.marked.hasTag) {
				tag = ins.marked.tag;
				if (!isNull(tag.Fluid)) {
					# Usual tanks
					tag = tag - "Fluid";
				}
			}
			return out.withTag(tag);
	}, null);
};

# Make shapeless crafts for specified block up to level for Preston mod
global compressIt as function(IItemStack, int)IItemStack = 
    function (item as IItemStack, maxLevel as int) as IItemStack  {
  var o = item;
  val meta = item.damage as short;
  for i in 1 to maxLevel {
    val compressed = <preston:compressed_block>.withTag({
      stack: {id: item.definition.id, Count: 1 as byte, Damage: meta}, level: i
    });
    mods.jei.JEI.addItem(compressed);
    recipes.addShapeless(compressed, [o, o, o, o, o, o, o, o, o]);
    recipes.addShapeless(o * 9, [compressed]);
    o = compressed;
  }
	return o;
};


// # Make a recipe with time in bottle
// global timecraft as function(IItemStack, IIngredient[], int, string)void = 
//     function (output as IItemStack, input as IIngredient[], seconds as int, tooltip as string) as void  {

// 	var name = output.name.replaceAll(":", "_") ~ "_" ~ output.damage;

// 	var inputWithBottle as IIngredient[] = 
// 		input + <randomthings:timeinabottle>
// 			.marked("timeinabottle")
// 			.transformNew(function(item) {
// 				return item.updateTag({timeData: {storedTime: item.tag.timeData.storedTime - seconds*20}});
// 			});

// 	recipes.addShapeless(name, (
// 		output).withLore(["Consume " ~ tooltip ~" from bottle"]), inputWithBottle, 
// 			function(out, ins, cInfo) {
// 					if(ins.timeinabottle.tag.timeData.storedTime >= seconds*20) {
// 							return output;
// 					}
// 					return null;
// 			},
// 			null);
// };