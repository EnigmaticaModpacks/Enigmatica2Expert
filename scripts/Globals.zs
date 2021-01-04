import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;
import mods.jei.JEI.removeAndHide as rh;

#priority 5000

# ######################################################################
#
# Global Functions
#
# ######################################################################


# ########################
# Get IOreDictEntry or IItemStack from string
#   as "ore:name" or "mod:name:meta"
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


# ########################
# Generate item name
# Warning: when used to create recipes
#   can cause name diplicates
# ########################

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


# ########################
# Gets a Bucket Item from a Liquid String
# ########################
global Bucket as function(string)IItemStack = function (name as string) as IItemStack {
	//Unique Buckets
	if (name == "lava")  return <minecraft:lava_bucket>;
	if (name == "water") return <minecraft:water_bucket>;
	if (name == "milk")  return <minecraft:milk_bucket>;
	
	if (!isNull(name)) {
		return <forge:bucketfilled>.withTag({FluidName: name, Amount: 1000});
	} else {
		return <minecraft:bucket>;
	}
};

# Apply tag to bucket (in case we use TE potions or such)
global BucketTag as function(string,IData)IItemStack = function (name as string, tag as IData) as IItemStack {
	val b = Bucket(name as string);
	if (!isNull(b) && !isNull(tag)) { return b.updateTag({Tag: tag}); }
	return b;
};