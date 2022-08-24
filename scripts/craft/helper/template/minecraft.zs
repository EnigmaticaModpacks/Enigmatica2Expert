# Vanilla template priority should be always lower then any other
#priority 4

#loader crafttweaker reloadableevents

import crafttweaker.item.IItemStack;
import scripts.craft.grid.Grid;
import scripts.craft.helper.styler.styler;

function toString_outputRecipesNames(style as string[], output as IItemStack) as string {
  if(isNull(output)) return "";
  var str = '';
  for rec in recipes.getRecipesFor(output.anyAmount()) {
    str += 'recipes.removeByRecipeName("'~rec.resourceDomain~":"~rec.name~'");\n';
  }
  return str;
}

function serializeTableRecipe(style as string[], output_s as string, grid as Grid) as string {
  var map_s = (style has "merged") ? ", ingrs" ~ (style has "dense" ? "" : "\n") : "";
  val grid_s = grid.toString(style) ~ map_s;
  return output_s~", "~grid_s;
}


styler.catalyst('minecraft:glass_pane', 'shapeless');
styler.catalyst('minecraft:iron_nugget', 'removeByRecipeName');

val fnc as function(IItemStack,Grid,string[])string = function(output as IItemStack, grid as Grid, oldStyle as string[]) as string {
  var style = oldStyle;
  val removedRecipeNames = style has 'removeByRecipeName'
    ? toString_outputRecipesNames(style, output) : '';
  
  if(style has "removeByRecipeName" || removedRecipeNames.length > 0) style += "noRemake";

  var calledMethod = styler.get(style, {
    shapeless : {noRemake: "craft.shapeless", _: "craft.reshapeless"},
            _ : {noRemake: "craft.make",      _: "craft.remake"},
  });

  var plainLength = (calledMethod ~ "(, );").length;
  val output_s = serialize.IIngredient(output);
  if (!(style has "dense") && (
    output_s.length
    + grid.toString(style + 'dense').length
    + plainLength
  ) <= 60) style += "dense";

  return removedRecipeNames
    ~ calledMethod
    ~ "(" ~ serializeTableRecipe(style, output_s, grid) ~ ");";
};

// We forced to define function before calling template()
// because in other case only first call of template() would added
styler.template(fnc);