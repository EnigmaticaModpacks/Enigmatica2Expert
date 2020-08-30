import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;

#modloaded tconevo

for item in loadedMods["tconevo"].items {
  for ore in item.ores {
    if (ore.name.startsWith("gear")) recipes.remove(item);
  }
}