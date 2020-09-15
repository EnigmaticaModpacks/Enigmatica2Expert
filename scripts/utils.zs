#priority 2000

import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeFunction;


zenClass Utils {
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

  function getSomething(oreName as string, entryNames as string[]) as IItemStack {
    if (isNull(oreName)) return null;

    val JOREoutput = mods.jaopca.JAOPCA.getOre(oreName);
    var something as IItemStack = null;
    if (!isNull(JOREoutput)) {
      var k = 0;
      while k < entryNames.length && isNull(something) {
        something = JOREoutput.getItemStack(entryNames[k]);
        k += 1;
      }
    }
    if (isNull(something)) {
      for str in entryNames {
        if (oreDict has (str~oreName)) {
          var oreItems = oreDict[str~oreName].items;
          for preffer in modPreference {
            for item in oreItems {
              if(item.definition.id.startsWith(preffer)) return item;
            }
          }
          return oreDict[str~oreName].firstItem;
        }
      }
    }

    return something;
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
    var minX = Dd(options, "x.min" , {d:0.0d}).asDouble();
    var maxX = Dd(options, "x.max" , {d:1.0d}).asDouble();
    var minY = Dd(options, "y.min" , {d:0.0d}).asDouble();
    var maxY = Dd(options, "y.max" , {d:1.0d}).asDouble();
    var stepX= D(options, "x.step");
    var stepY= D(options, "y.step");

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
}
global utils as Utils = Utils();
