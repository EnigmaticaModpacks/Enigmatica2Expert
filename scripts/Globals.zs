import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;
import mods.jei.JEI.removeAndHide as rh;

#priority 3005

global DEBUG as bool = true;

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

# Create recipe with one item inside
#   and 8 items around it
global remakeEnvelop as function(IItemStack, IIngredient, IIngredient)void = 
    function (result as IItemStack, itemCenter as IIngredient, itemAround as IIngredient) as void  {

	recipes.remove(result);
	recipes.addShaped(result, [
			[itemAround, itemAround, itemAround], 
			[itemAround, itemCenter, itemAround], 
			[itemAround, itemAround, itemAround]
		]);
};


# ########################
# Make recipe by string grid
# Inspired by Omnifactory code:
# https://github.com/OmnifactoryDevs/Omnifactory/blob/fc4dca3b32bc768578ef8855285b576ccc7ef32f/overrides/scripts/CommonVars.zs#L98-L129
# ########################
/*
	Remake(output, options, grid)

	Example:
(	<minecraft:furnace>
	[ "AAA" ,
    "A A" ,
    "AAA" ], 
	{ A: <minecraft:stone>, remove: <minecraft:furnace>*8 })
  =>
	recipes.remove(<minecraft:furnace>*8);
	recipes.addShaped("Furnance from Stone", <minecraft:furnace>,
[ [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>],
  [<minecraft:stone>,        null,       <minecraft:stone>],
  [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>] ]
*/

global Grid as function(string[],            IIngredient[string])IIngredient[][] = 
			function (grid as string[], options as IIngredient[string]) as IIngredient[][]  {

	# Make ingredients list from string grid
	var ingrs = [[]] as IIngredient[][];
	for i, str in grid {
		for j in 0 to str.length {
			if (ingrs.length <= i) ingrs = ingrs + [] as IIngredient[];
			var k = str[j];
			ingrs[i] = ingrs[i] + options[k];
		}
	}
	return ingrs;
};

global Remake as function(IItemStack,         string[],            IIngredient[string])void = 
			function (output as IItemStack, grid as string[], options as IIngredient[string]) as void  {

	# Automatically remove previous recipe, or recipe tagged "remove" in options
	if (!isNull(options.remove)) {
		recipes.remove(options.remove);
	} else {
		recipes.remove(output);
	}

	# Generate recipe name
	var firstIngr as IIngredient = null;
	var ingrCount = 0;
	for k, v in options {
		if (k != "remove") {
			if (isNull(firstIngr)) firstIngr = v;
			ingrCount += 1;
		}
	}

	var ads = ingrCount >= 2 ? (" [+"~(ingrCount - 1)~"]") : "";
	val recipeName = getItemName(output) ~ " from " ~ getItemName(firstIngr.itemArray[0]) ~ ads;


	# Add crafting table recipe
	if (isNull(grid)) {
		# No grid means shapeless recipe
		var ingrs = [] as IIngredient[];
		for k, v in options { if (k != "remove") ingrs = ingrs + v; }
		recipes.addShapeless(recipeName, output, ingrs);
	} else {
		# Shaped recipe
		recipes.addShaped(recipeName, output, Grid(grid, options));
	}
};


# ########################
# Clear Fluid tag on item
#  preserving other tags
# ########################
global clearFluid as function(IItemStack)void = 
    function (input as IItemStack) as void  {

	recipes.addShapeless("Fluid Clearing " ~ getItemName(input), 
		input, [input.marked("marked")],
		function(out, ins, cInfo) {
			if(ins has "marked" && !isNull(ins.marked) && ins.marked.hasTag) {
				var tag = ins.marked.tag;
				if (!isNull(tag.Fluid)) {
					# Usual tanks
					tag = tag - "Fluid";
				} else
				if (!isNull(tag.FluidName) && !isNull(tag.Amount)) {
					# Black hole or other
					tag = tag - "FluidName" - "Amount";
				}
				return out.withTag(tag);
			}
			return out;
	}, null);
};


# ########################
# Safe get NBT tag by string keys
# Example:
#   D( {Fluid:{FluidName:"water"}} ,"Fluid.FluidName" ) => "water" as IData
#   D( {A:[ {B:1}, {C:2} ]}        ,"A[1].C" )          => 2 as IData
#   D( {A:[0,1,2]}                 ,"A[4].C" )          => null
# ########################
global D as function(IData, string)IData = 
    function (data as IData, field as string) as IData  {
	// Return same data if field is null
	if (isNull(field)) return data;

	if (!isNull(data)) {
		var descend = data;
		for tag in field.split("[\\.\\[\\]]") {
			if (tag != "") {
				var member as IData = null;
				if (tag.matches("^\\d+$")) {
					var num = tag as int;
					if (descend.length > num) {
						member = descend[num];
					}
				} else {
					member = descend.memberGet(tag);
				}
				if (!isNull(member)) {
					descend = member;
				} else {
					return null;
				}
			}
		}
		return descend;
	}
	return null;
};

# Safe get NBT tag by string key
# Return {third parameter}.d if null
global Dd as function(IData, string, IData)IData = 
    function (data as IData, field as string, default as IData) as IData  {
  val d = D(data, field);
	if (!isNull(d)) return d;
	return default.d;
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