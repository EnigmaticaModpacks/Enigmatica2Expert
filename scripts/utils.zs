#priority 2000

import crafttweaker.data.IData;
import crafttweaker.enchantments.IEnchantment;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeFunction;


static cast as IItemStack[string] = {
  ingot: <tconstruct:cast_custom:0>,
  gear:  <tconstruct:cast_custom:4>,
  plate: <tconstruct:cast_custom:3>,
  nugget:<tconstruct:cast_custom:1>,
} as IItemStack[string];

static mold as IItemStack[string] = {
  plate: <immersiveengineering:mold:0>,
  gear:  <immersiveengineering:mold:1>,
  rod:   <immersiveengineering:mold:2>,
  unpack:<immersiveengineering:mold:7>,
} as IItemStack[string];


zenClass Utils {

	zenConstructor() { }

  function getSomething(oreName as string, entryNames as string[]) as IItemStack {
    val JOREoutput = mods.jaopca.JAOPCA.getOre(oreName);
    var something as IItemStack = null;
    if (!isNull(JOREoutput)) {
      if (entryNames.length == 2) {
        something = JOREoutput.getItemStack(entryNames[0], entryNames[1]);
      } else if (entryNames.length >= 1) {
        something = JOREoutput.getItemStack(entryNames[0]);
      }
    }
    if (isNull(something)) {
      for str in entryNames {
        if (oreDict has (str~oreName)) return oreDict[str~oreName].firstItem;
      }
    }

    return null;
  }

}

global utils as Utils = Utils();