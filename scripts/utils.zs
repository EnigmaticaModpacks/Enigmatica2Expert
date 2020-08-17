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

}
global utils as Utils = Utils();
