/*

Dot means reflected from 1) opposite horisontal, 2) opposite vertical

[ "AA." ,
  "A ." ,
  "..." ], 
{ A: <minecraft:stone>})
=> [
[<minecraft:stone>, <minecraft:stone>, <minecraft:stone>],
[<minecraft:stone>,        null,       <minecraft:stone>],
[<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]]

*/

#priority 2000

import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeFunction;
import scripts.craft.grid.Grid;


zenClass Craft {
  var registeredNames as int[string];

	zenConstructor() { 
    registeredNames = {};
  }

  function itemName(item as IItemStack) as string  {
    return item.displayName.replaceAll("[: ]", "_").replaceAll("§.", "");
  }

  function recipeName(output as IItemStack, gridStr as string[], options as IIngredient[string]) as string { return recipeName(output, Grid(gridStr, options)); }
  function recipeName(output as IItemStack, grid as Grid) as string {return recipeName(grid.getMainIngredient(), output, grid.uniqueIngredientsCount);}
  function recipeName(mainInput as IIngredient, output as IItemStack, adsCount as int) as string {
    var ads = adsCount >= 2 ? ("[+"~(adsCount - 1)~"]") : "";
    var inName = itemName(mainInput.itemArray[0]);
    var inCount = mainInput.amount > 1 ? ("*"~mainInput.amount as string) : "";
    var outCount= output.amount > 1 ? ("*"~output.amount as string) : "";
    var name = "["~inName~inCount~"]" ~ ads ~ "->["~itemName(output)~outCount~"]";

    if (!isNull(registeredNames[name])) {
      var count = registeredNames[name];
      registeredNames[name] = count + 1;
      name ~= "_#"~count;
    } else {
      registeredNames[name] = 1;
    }

    return name;
  }

  function grid(gridStr as string[], options as IIngredient[string]) as IIngredient[][]  {
    return Grid(gridStr, options).shaped();
  }

  function shapeless(output as IItemStack, gridStr as string  , options as IIngredient[string]) as void {make(output,[gridStr],options, null, true);}
  function    shaped(output as IItemStack, gridStr as string[], options as IIngredient[string]) as void {make(output, gridStr, options, null, false);}
  function      make(output as IItemStack, gridStr as string[], options as IIngredient[string]) as void {make(output, gridStr, options, null, false);}
  function      make(output as IItemStack, gridStr as string[], options as IIngredient[string], fnc as IRecipeFunction) as void {make(output, gridStr, options, fnc, false);}
  function      make(output as IItemStack, gridStr as string[], options as IIngredient[string], fnc as IRecipeFunction, isShapeless as bool) as void {
    var grid = Grid(gridStr, options);
    if (!isNull(grid.error)) {
      logger.logWarning("craft.make Grid error: " ~ grid.error ~ "\nRaw grid:\n" ~ grid.toString());
      return;
    }

    val rName = recipeName(output, grid);

    # Add crafting table recipe
    if (isShapeless) {
      var ingrs = grid.shapeless();
      if (ingrs.length > 9) {
        scripts.wrap.extendedcrafting.TableCrafting.addShapeless(output, ingrs); 
      } else {
        recipes.addShapeless(rName, output, ingrs, fnc, null);
      }
    } else {
      # Find grid sides size
      var grd = grid.shaped();
      if (max(grid.X, grid.Y) > 3) {
        scripts.wrap.extendedcrafting.TableCrafting.addShaped(output, grd);
        print("Adding shaped Extended Crafting Table recipe " ~ rName);
        if (!isNull(fnc)) { logger.logWarning("Cant add recipe function to Extended Crafting table, recipe: " ~ rName); }
      } else {
        recipes.addShaped(rName, output, grd, fnc, null);
      }

    }
  }

  function reshapeless(output as IItemStack, gridStr as string  , options as IIngredient[string]) as void  {remake(output,[gridStr],options, null, true );}
  function    reshaped(output as IItemStack, gridStr as string[], options as IIngredient[string]) as void  {remake(output, gridStr, options, null, false);}
  function      remake(output as IItemStack, gridStr as string[], options as IIngredient[string]) as void  {remake(output, gridStr, options, null, false);}
  function      remake(output as IItemStack, gridStr as string[], options as IIngredient[string], fnc as IRecipeFunction) as void  {remake(output, gridStr, options, fnc, false);}
  function      remake(output as IItemStack, gridStr as string[], options as IIngredient[string], fnc as IRecipeFunction, isShapeless as bool) as void  {
    # Automatically remove previous recipe, or recipe tagged "remove" in options
    if (!isNull(options.remove)) {
      recipes.remove(options.remove);
    } else {
      recipes.remove(output);
    }

    make(output, gridStr, options, fnc, isShapeless);
  }

}
global craft as Craft = Craft();