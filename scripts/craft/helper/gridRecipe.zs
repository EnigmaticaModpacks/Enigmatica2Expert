#priority 2

import crafttweaker.item.IItemStack;
import scripts.craft.helper.gridBuilder.GridBuilder;
import scripts.craft.helper.styler.styler;


zenClass GridRecipe {
  var gridBuilder as GridBuilder = null;
  var output as IItemStack = null;

  zenConstructor(style as string[]) {
    gridBuilder = GridBuilder(style);
  }

  function setOutput(out as IItemStack) {
    output = out;
  }

  function haveData() as bool {
    return gridBuilder.haveData;
  }

  function toString(global_style as string[]) as string {

    # Calculate grid, length and other stuff
    # Return if grid is empty
    if(!gridBuilder.build()) return null;

    # local style for grid stringifying
    var style = global_style;

    # Merge style with Grid Builder local style (may changed with catalysts)
    for tag in gridBuilder.localStyle { if(!(style has tag)) style += tag; }

    val removedRecipeNames = style has "removeByRecipeName" ? toString_outputRecipesNames(style) : "";
    if(style has "removeByRecipeName" || removedRecipeNames.length > 0) style += "noRemake";
    
    # Determine called method
    var calledMethod = styler.get(style, {
      shapeless: { noRemake: "craft.shapeless", _: "craft.reshapeless"},
              _: { noRemake: "craft.make"     , _: "craft.remake"     }}
    );

    var plainLength = (calledMethod ~ "(, );").length;
    val output_s = serialize.IIngredient(output);
    val isDense = style has "dense" || (output_s.length + gridBuilder.length + plainLength) <= 60;
    if (isDense) style += "dense";

    # Add Ingredients Table
    var map_s = (style has "merged") ? ", ingrs" ~ (isDense?"":"\n") : "";

    if(  style has "merged"  ) style += "noMap";
    if(!(style has "noPretty") && (gridBuilder.maxX <= 1 || gridBuilder.maxY <= 1)) style += "noPretty";
    val grid_s = gridBuilder.grid.toString(style) ~ map_s;

    return
        (style has "noFancy" ? "" : "# "~craft.recipeName(output, gridBuilder.grid) ~ "\n")
      ~ removedRecipeNames
      ~ calledMethod ~ "("~output_s~", "~grid_s~");";
  }

  function toString_outputRecipesNames(style as string[]) as string {
    if(isNull(output)) return "";

    var str = '';
    for rec in recipes.getRecipesFor(output) {
      str += 'recipes.removeByRecipeName("'~rec.resourceDomain~":"~rec.name~'");\n';
    }

    return str;
  }
}
