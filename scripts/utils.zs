#priority 4000

import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeFunction;
import mods.jei.JEI.removeAndHide as removeAndHide;


zenClass Utils {
  var DEBUG as bool = false;

  static modPreference as string[] = [
    "minecraft",
    "thermalfoundation",
    "immersiveengineering",
    "ic2",
    "mekanism",
    "appliedenergistics2",
    "actuallyadditions",
    "tconstruct",
    "chisel",
  ] as string[];

	zenConstructor() { }

  function getSomething(oreName as string, entryNames as string[]) as IItemStack { return getSomething(oreName, entryNames, 1); }
  function getSomething(oreName as string, entryNames as string[], amount as int) as IItemStack {
    if (isNull(oreName)) return null;

    // Find with JAOPCA
    val JOREoutput = mods.jaopca.JAOPCA.getOre(oreName);
    var something as IItemStack = null;
    if (!isNull(JOREoutput)) {
      var k = 0;
      while k < entryNames.length && isNull(something) {
        something = JOREoutput.getItemStack(entryNames[k]);
        k += 1;
      }
    }

    // Find with Oredict
    if (isNull(something)) {
      for str in entryNames {
        val oreItems = oreDict[str~oreName].items;
        if (oreItems.length>0) {
          for preffer in modPreference {
            for item in oreItems {
              if(item.definition.id.startsWith(preffer))
                return countOutput(item * amount, oreName);
            }
          }
          return countOutput(oreDict[str~oreName].firstItem * amount, oreName);
        }
      }
    }

    // Find with smelting
    if (isNull(something) && entryNames has "any") {
      val oreItems = oreDict['ore'~oreName].items;
      if (oreItems.length>0) {
        something = smelt(oreDict['ore'~oreName]);
      }
    }

    return isNull(something) ? null : countOutput(something * amount, oreName);
  }

  # Return result of smelting in vanilla furnace
  function smelt(input as IIngredient) as IItemStack {
    for r in furnace.all {
      if (r.input has input || input has r.input) return r.output;
    }
    return null;
  }

  function compact(a as IIngredient, b as IIngredient) as void {
    recipes.addShapeless(b.itemArray[0] * 1, [a,a,a,a,a,a,a,a,a]);
    recipes.addShapeless(a.itemArray[0] * 9, [b]);
  }

  function ingredientFromArrayByRegex(regex as string) as IIngredient {
    var items = itemUtils.getItemsByRegexRegistryName(regex);
    if (!isNull(items) && items.length > 0) {
      if (items.length == 1) return items[0];

      var result = items[0] as IIngredient;
      for i in 1 to items.length {
        result = result | items[i];
      }
      return result;
    }

    return null;
  }

  # ########################
  # Removing item everywhere
  # ########################
  function rh(ingr as IIngredient) as void { rh(ingr, true); }
  function rh(ingr as IIngredient, removeOredict as bool) as void {
    if (isNull(ingr)) return;

    for item in ingr.items {
      if(removeOredict) {
        for ore in item.ores {
          ore.remove(item);
        }
      }
      furnace.remove(<*>, item);
      recipes.remove(item);
      // removeAndHide(item);
      log('purged: ' ~ item.commandString);
    }
  }


  # ########################
  # Conditional Loging
  # ########################
  function log(a as string) as void {log(a,null,null);}
  function log(a as string, b as string) as void {log(a,b,null);}
  function log(a as string, b as string, c as string) as void {
    if (DEBUG) print(
      (!isNull(a) ? a : "") ~
      (!isNull(b) ? " " ~ b : "") ~
      (!isNull(c) ? " " ~ c : ""));
  }
  function log(arr as string[]) as void {
    if (DEBUG) {
      if (isNull(arr) || arr.length <=0) {
        print("");
        return;
      }
      var s = "";
      for str in arr {
        s = s ~ " " ~ str;
      }
      print(s);
    }
  }


  # ########################
  # Graph
  # ########################
  function graph(map as string[], keys as string[][string]) as string[][double[string]] { return graph(map, null, keys); }
  function graph(map as string[], options as IData, keys as string[][string]) as string[][double[string]] {
    if (isNull(map) || map.length <= 0) {
      logger.logWarning("utils.graph() first argument should be non-empty string[].");
      return {};
    }

    # Determine max dimensions
    var height = map.length;
    var width  = 0;
    for line in map {
      width = max(width, line.length);
    }

    if (width <= 0) {
      logger.logWarning("utils.graph() first argument should content at least one non-empty string");
      return {};
    }

    # Compute min-max for each dimension
    val dopt = D(options);
    var minX = dopt.getDouble("x.min" , 0.0d);
    var maxX = dopt.getDouble("x.max" , 1.0d);
    var minY = dopt.getDouble("y.min" , 0.0d);
    var maxY = dopt.getDouble("y.max" , 1.0d);
    var stepX= dopt.get("x.step");
    var stepY= dopt.get("y.step");

    # Determine doulbe steps
    var intervalX = (maxX - minX) / (max(1, width  - 1) as double);
    var intervalY = (maxY - minY) / (max(1, height - 1) as double);

    # Write result
    var result as string[][double[string]] = {};
    var resultLen = 0;
    for y in 0 to map.length {
      for x in 0 to map[y].length {
        var c = map[y][x];
        if (c != " " && !isNull(keys[c])) {
          var X = intervalX * x + minX;
          var Y = maxY - intervalY * y;
          if(!isNull(stepX)) X = ((X / stepX.asDouble()) as int) as double * stepX.asDouble();
          if(!isNull(stepY)) Y = ((Y / stepY.asDouble()) as int) as double * stepY.asDouble();
          result[{x: X, y: Y} as double[string]] = keys[c];
          resultLen += 1;
        }
      }
    }

    if (resultLen <= 0) logger.logWarning("utils.graph() graph cant find any valid key");

    return result;
  }


  static defaultEmount as double[string] = {
    "Amber"               : 2.0d,
    "Amethyst"            : 2.0d,
    "Apatite"             : 10.0d,
    "Aquamarine"          : 4.0d,
    "CertusQuartz"        : 3.0d,
    "ChargedCertusQuartz" : 2.0d,
    "Coal"                : 5.0d,
    "Diamond"             : 2.0d,
    "DimensionalShard"    : 3.0d,
    "Emerald"             : 2.0d,
    "Glowstone"           : 4.0d,
    "Lapis"               : 10.0d,
    "Malachite"           : 2.0d,
    "Peridot"             : 2.0d,
    "Quartz"              : 3.0d,
    "QuartzBlack"         : 2.0d,
    "quicksilver"         : 2.0d,
    "Redstone"            : 10.0d,
    "Ruby"                : 2.0d,
    "Sapphire"            : 2.0d,
    "Tanzanite"           : 2.0d,
    "Topaz"               : 2.0d,
  } as double[string];

  function countOutput(item as IItemStack, oreName as string) as IItemStack {
    val def = defaultEmount[oreName];
    if(isNull(def)) return item;

    val d = def as double;
    if (d != 0.0d) {
      return item * min(64, (((item.amount as double - 1.0d) * (d*0.75d) + d) as int));
    }
    return item;
  }


  # Turn one item into another but keep all tags
  var upgradeFnc as IRecipeFunction = function(out, ins, cInfo){
    if(ins has "marked" && !isNull(ins.marked) && ins.marked.hasTag) {
      var tag = ins.marked.tag;
      return out.withTag(tag);
    }
    return out;
  };


  # Clear Fluid tag on item preserving other tags
  function clearFluid(input as IItemStack) as void  {
    clearFluid(input, "Fluid Clearing " ~ input.definition.id.replaceAll(":", "_") ~ "_" ~ input.damage);
  }
  function clearFluid(input as IItemStack, recipeName as string) as void  {
    recipes.addShapeless(recipeName, 
      input, [input.marked("marked")],
      function(out, ins, cInfo) {
        if(ins has "marked" && !isNull(ins.marked) && ins.marked.hasTag) {
          var tag = ins.marked.tag;
          if (!isNull(tag.Fluid)) {
            # Usual tanks
            tag = tag - "Fluid";
          } else
          if (!isNull(tag.tank)) {
            # Open Blocks
            tag = tag - "tank";
          } else
          if (!isNull(tag.FluidName) && !isNull(tag.Amount)) {
            # Black hole or other
            tag = tag - "FluidName" - "Amount";
          }

          if(tag == {} as IData) return out;
          return out.withTag(tag);
        }
        return out;
    }, null);
  }

  function sortInt(list as int[]) as int[] {
    if(isNull(list)) return null;
    if(list.length == 1) return [0];

    var sorted = [] as int[];
    for i in 0 to list.length {
      var g_v = 0;
      var g_i = i;
      for j in 0 to list.length {
        if(list[j] >= g_v && !(sorted has j)) {
          g_v = list[j];
          g_i = j;
        }
      }
      sorted += g_i;
    }
    return sorted;
  }


  function repeat(n as int) as string {return repeat(" ", n);}
  function repeat(s as string, n as int) as string {
    if(n<=0) return "";
    var str = "";
    for i in 0 to n {
      str += s;
    }
    return str;
  }

  function join(arr as string[]) as string { return join(arr, "\n"); }
  function join(arr as string[], delimiter as string) as string {
    var first = true;
    var s = "";
    for str in arr {
      val d = !first ? delimiter: "";
      first = false;
      s += d ~ str;
    }
    return s;
  }
}
global utils as Utils = Utils();



# ########################
# Gets a Bucket Item from a Liquid String
# ########################
global Bucket as function(string)IItemStack = function (name as string) as IItemStack {
	//Unique Buckets
	if (isNull(name)) return <minecraft:bucket>;
	if (name == "lava")  return <minecraft:lava_bucket>;
	if (name == "water") return <minecraft:water_bucket>;
	if (name == "milk")  return <minecraft:milk_bucket>;

	return <forge:bucketfilled>.withTag({FluidName: name, Amount: 1000});
};

# Apply tag to bucket (in case we use TE potions or such)
global BucketTag as function(string,IData)IItemStack = function (name as string, tag as IData) as IItemStack {
	val b = Bucket(name as string);
	if (!isNull(b) && !isNull(tag)) { return b.updateTag({Tag: tag}); }
	return b;
};


# ########################
# Get mob soul by its name
# ########################
global Soul as function(string)IItemStack = function (name as string) as IItemStack {
  val soul = itemUtils.getItem("draconicevolution:mob_soul");
  if (!isNull(soul)) {
    return soul.withTag({EntityName: name});
  }
	return null;
};