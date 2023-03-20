#priority 2001

#loader crafttweaker reloadableevents

import crafttweaker.item.IItemStack;
import crafttweaker.recipes.IRecipeFunction;
import crafttweaker.recipes.IRecipeAction;
import scripts.craft.grid.Grid;

# Class for creating linked list
zenClass Extension {
  # Next extension in list if have
  var next as Extension;

  # Predicate function, preforming adding recipe if able.
  var tryCraft as function(IItemStack,string,Grid,IRecipeFunction,IRecipeAction,bool)bool;

	zenConstructor(_tryCraft as function(IItemStack,string,Grid,IRecipeFunction,IRecipeAction,bool)bool) {
    tryCraft = _tryCraft;
  }
}