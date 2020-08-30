#priority 2000

import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeFunction;


zenClass Utils {
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
  function graph(map as string[], keys as string[][string]) as string[][double[string]] {
    if (isNull(map) || map.length <= 0) {
      logger.logWarning("utils.graph() first argument should be non-empty string[].");
      return {};
    }

    # Determine max dimensions
    var maxY = map.length;
    var maxX = 0;
    for line in map {
      maxX = max(maxX, line.length);
    }

    if (maxX <= 0) {
      logger.logWarning("utils.graph() first argument should content at least one non-empty string");
      return {};
    }

    # Determine doulbe steps
    var stepX = 1.0d / (max(1, maxX - 1) as double);
    var stepY = 1.0d / (max(1, maxY - 1) as double);

    # Write result
    var result as string[][double[string]] = {};
    var resultLen = 0;
    for y in 0 to map.length {
      for x in 0 to map[y].length {
        var c = map[y][x];
        if (c != " " && !isNull(keys[c])) {
          result[{x: stepX*x, y: stepY*y} as double[string]] = keys[c];
          resultLen += 1;
        }
      }
    }

    if (resultLen <= 0) logger.logWarning("utils.graph() graph cant find any valid key");

    return result;
  }
}
global utils as Utils = Utils();
