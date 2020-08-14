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
      print("    JOREoutput not null: " ~ oreName ~" " ~ entryNames.length);
      var k = 0;
      while k < entryNames.length && isNull(something) {
        print("    checking: " ~ entryNames[k]);
        something = JOREoutput.getItemStack(entryNames[k]);
        k += 1;
      }
    }
    if (isNull(something)) {
      for str in entryNames {
        print("    getSomething Checking: "~ oreName ~" "~(str~oreName));
        if (oreDict has (str~oreName)) {
          print("    getSomething found!");
          return oreDict[str~oreName].firstItem;
        }
      }
    }

    return something;
  }

  function compact(a as IIngredient, b as IIngredient) as void {
    recipes.addShapeless(b.itemArray[0] * 1, [a,a,a,a,a,a,a,a,a]);
    recipes.addShapeless(a.itemArray[0] * 9, [b]);
  }

}
global utils as Utils = Utils();


zenClass Craft {
	zenConstructor() { }

  function itemName(item as IItemStack) as string  {
    return item.displayName.replaceAll("[: ]", "_").replaceAll("§.", "");
  }

  function recipeName(output as IItemStack, gridStr as string[], options as IIngredient[string]) as string {

    # Predefine map of used grid letters
    # Sometimes options can contain more keys that actually used in craft
    var gridMap as int[string] = {};
    for i, str in gridStr {
      for j in 0 to str.length {
        var c = str[j];
        if (options[c]) gridMap[c] = !isNull(gridMap[c]) ? gridMap[c] + 1 : 1;
      }
    }
    
    # How often each ingredient used
    var minUses = 999999;
    var minKey as string = null;
    var ingrCount = 0;
    for c, v in options {
      if (c != "remove" && !isNull(gridMap[c])) {
        # Calculate index of less used item in craft
        if (gridMap[c] < minUses) {
          minUses = gridMap[c] as int; # WARN: must excplicitely cast type
          minKey = c;
        }
        ingrCount += 1;
      }
    }

    # Main ingredient - most important
    # Probably ingredient that less used in craft
    var mainIngr as IIngredient = options[minKey];

    var ads = ingrCount >= 2 ? ("][+"~(ingrCount - 1)~"]") : "]";
    val recipeName = "[" ~ itemName(mainIngr.itemArray[0]) ~ "]->[" ~ itemName(output) ~ ads;

    return recipeName;
  }

  function grid(gridStr as string[], options as IIngredient[string]) as IIngredient[][]  {

    # Make ingredients list from string grid
    var ingrs = [[]] as IIngredient[][];
    for i, str in gridStr {
      for j in 0 to str.length {
        if (ingrs.length <= i) ingrs = ingrs + [] as IIngredient[];
        var k = str[j];
        ingrs[i] = ingrs[i] + options[k];
      }
    }
    return ingrs;
  }

  function make(output as IItemStack, gridStr as string[], options as IIngredient[string], fnc as IRecipeFunction) as void {
    
    val recipeName = recipeName(output, gridStr, options);

    # Add crafting table recipe
    if (isNull(gridStr)) {
      # No grid means shapeless recipe
      var ingrs = [] as IIngredient[];
      for k, v in options { if (k != "remove") ingrs = ingrs + v; }
      recipes.addShapeless(recipeName, output, ingrs, fnc, null);
    } else {
      # Shaped recipe
      recipes.addShaped(recipeName, output, grid(gridStr, options), fnc, null);
    }
  }

  function remake(output as IItemStack, gridStr as string[], options as IIngredient[string], fnc as IRecipeFunction) as void  {

    # Automatically remove previous recipe, or recipe tagged "remove" in options
    if (!isNull(options.remove)) {
      recipes.remove(options.remove);
    } else {
      recipes.remove(output);
    }

    make(output, gridStr, options, fnc);
  }
}
global craft as Craft = Craft();