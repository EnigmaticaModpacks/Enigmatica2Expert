/*

Craft.zs

Wrapper of grid.zs for fancy working with Crafting Table recipes.

Author: https://github.com/Krutoy242


Example
  craft.remake(<minecraft:piston> * 2, ["pretty",
    "# # #",
    "░ I ░",
    "░ ♥ ░"], {
    "░": <ore:compressed1xCobblestone>, # Compressed Cobblestone
    "#": <ore:plankTreatedWood>,        # Treated Wood Planks
    "♥": <ore:dustRedstone>,            # Redstone
    "I": <ore:plateIron>,               # Iron Plate
  });

*/

#priority 2000

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.recipes.IRecipeFunction;
import scripts.craft.grid.Grid;
import scripts.craft.craft_extension.Extension;


zenClass Craft {
  # Private fields
  # Store names that already was used to prevent same retcipe names
  var registeredNames as int[string] = {};

  # Extensions of default Crafting Table capabilities.
  # For example, Craft.zs can be extended with Extended Crafting
  # recipe adding function.
  var extensions as Extension = null;

	zenConstructor() {}

  #------------------------------------------------------------------
  # Public Methods
  #------------------------------------------------------------------

  # Create new Crafting Table recipe
  function shapeless(output as IItemStack, gridLine as string , options as IIngredient[string]                        ) as void {make(output,[gridLine],options, null, true);}
  function shapeless(output as IItemStack, gridLine as string , options as IIngredient[string], fnc as IRecipeFunction) as void {make(output,[gridLine],options,  fnc, true);}
  function    shaped(output as IItemStack, gridStr as string[], options as IIngredient[string]                        ) as void {make(output, gridStr,  options, null, false);}
  function    shaped(output as IItemStack, gridStr as string[], options as IIngredient[string], fnc as IRecipeFunction) as void {make(output, gridStr,  options,  fnc, false);}
  function      make(output as IItemStack, gridStr as string[], options as IIngredient[string])                         as void {make(output, gridStr,  options, null, false);}
  function      make(output as IItemStack, gridStr as string[], options as IIngredient[string], fnc as IRecipeFunction) as void {make(output, gridStr,  options,  fnc, false);}
  function      make(output as IItemStack, gridStr as string[], options as IIngredient[string], fnc as IRecipeFunction, isShapeless as bool) as void {
    var grid = Grid(gridStr, options);
    if (!isNull(grid.error)) {
      logger.logWarning("craft.make Grid error: " ~ grid.error ~ "\nGrid:\n" ~ grid.toString());
      return;
    }

    val rName = uniqueRecipeName(output, grid);

    # Iterate over all extensions
    var ext = extensions;
    while(!isNull(ext)) {
      if(ext.tryCraft(output, rName, grid, fnc, null, isShapeless)) return;
      ext = ext.next;
    }

    # No extensions matches, use vanilla crafting table
    if (isShapeless) {
      var ingrs = grid.shapeless();
      if (ingrs.length > 9) {
        logger.logWarning("craft.make error: ingredients count is "~ingrs.length~
          ". Its more than vanilla table can handle.\nGrid:\n" ~ grid.toString());
        return;
      } else {
        recipes.addShapeless(rName, output, ingrs, fnc, null);
      }
    } else {
      var grd = grid.shaped();
      if (max(grid.X, grid.Y) > 3) {
        logger.logWarning("craft.make error: ingredients size is "~grid.X~":"~grid.Y~
          ". Its more than vanilla table can handle.\nGrid:\n" ~ grid.toString());
        return;
      } else {
        recipes.addShaped(rName, output, grd, fnc, null);
      }

    }
  }

  # Create new Crafting Table recipe, but would remove old recipe first
  function reshapeless(output as IItemStack, gridLine as string , options as IIngredient[string]                        ) as void {remake(output,[gridLine],options, null, true );}
  function reshapeless(output as IItemStack, gridLine as string , options as IIngredient[string], fnc as IRecipeFunction) as void {remake(output,[gridLine],options,  fnc, true );}
  function    reshaped(output as IItemStack, gridStr as string[], options as IIngredient[string]                        ) as void {remake(output, gridStr,  options, null, false);}
  function    reshaped(output as IItemStack, gridStr as string[], options as IIngredient[string], fnc as IRecipeFunction) as void {remake(output, gridStr,  options,  fnc, false);}
  function      remake(output as IItemStack, gridStr as string[], options as IIngredient[string])                         as void {remake(output, gridStr,  options, null, false);}
  function      remake(output as IItemStack, gridStr as string[], options as IIngredient[string], fnc as IRecipeFunction) as void {remake(output, gridStr,  options,  fnc, false);}
  function      remake(output as IItemStack, gridStr as string[], options as IIngredient[string], fnc as IRecipeFunction, isShapeless as bool) as void  {
    # Automatically remove previous recipe, or recipe tagged "remove" in options
    if (!isNull(options.remove)) {
      for item in options.remove.items {
        recipes.remove(item.anyAmount());
      }
    } else {
      recipes.remove(output.anyAmount());
    }

    make(output, gridStr, options, fnc, isShapeless);
  }


  #------------------------------------------------------------------
  # Private Methods
  #------------------------------------------------------------------

  function itemName(item as IIngredient) as string {
    if(isNull(item)
      || isNull(item.itemArray)
      || item.itemArray.length < 1
      || isNull(item.itemArray[0]))
      return "null";

    return item.itemArray[0].displayName.replaceAll(":", "_").replaceAll('§.|"', "");
  }

  function itemCount(item as IIngredient) as string {
    return isNull(item) ? ""
      : item.amount > 1 ? ("*"~item.amount as string) : "";
  }

  function itemSerialize(item as IIngredient) as string {
    return "["~itemName(item)~"]"~itemCount(item);
  }

  function recipeName(output as IItemStack, gridStr as string[], options as IIngredient[string]) as string { return recipeName(output, Grid(gridStr, options)); }
  function recipeName(output as IItemStack, grid as Grid) as string {return recipeName(grid.getMainIngredient(), output, grid.uniqueIngredientsCount);}
  function recipeName(mainInput as IIngredient, output as IItemStack, adsCount as int) as string {
    var ads = adsCount >= 2 ? ("[+"~(adsCount - 1)~"]") : "";
    return itemSerialize(output) ~ " from "~itemSerialize(mainInput) ~ ads;
  }

  function uniqueRecipeName(output as IItemStack, grid as Grid = null) as string {
    var name = isNull(grid)
      ? itemSerialize(output)
      : recipeName(output, grid);

    if (!isNull(registeredNames[name])) {
      val count = registeredNames[name];
      registeredNames[name] = count + 1;
      name ~= " _"~count;
    } else {
      registeredNames[name] = 1;
    }

    return name;
  }

  function pushExtension(ext as Extension) as void {
    if (isNull(extensions)) extensions = ext;
    else {
      var lastExt = extensions;
      while(!isNull(lastExt.next)) lastExt = lastExt.next;
      lastExt.next = ext;
    }
  }
}
global craft as Craft = Craft();