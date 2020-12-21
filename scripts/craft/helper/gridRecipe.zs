import crafttweaker.item.IItemStack;
import scripts.craft.helper.gridBuilder.GridBuilder;
#priority 2

zenClass GridRecipe { zenConstructor() {}
  var gridBuilder as GridBuilder = GridBuilder();
  var output as IItemStack = null;

  function setOutput(out as IItemStack) {
    output = out;
  }

  function haveData() as bool {
    return gridBuilder.haveData;
  }

  function toString(style as string[]) as string {

    # Output
    val output_s = serialize.IIngredient(output);

    # Calculate grid, length and other stuff
    # Return if grid is empty
    if(!gridBuilder.build()) return null;

    var plainLength = "craft.remake(, );".length;
    val isDense = (output_s.length + gridBuilder.length + plainLength) <= 60;
    val isPretty = !isDense && (style has "pretty");

    # Add Ingredients Table
    var map_s      = (style has "merged") ? ", ingrs" ~ (isDense?"":"\n") : "";

    var grid_style = style;
    if(isDense)            grid_style += "dense";
    if(style has "merged") grid_style += "no_map";
    val grid_s = gridBuilder.grid.toString(grid_style) ~ map_s;

    return (!(style has "fancy") ? "" :
      "# "~craft.recipeName(output, gridBuilder.grid) ~ "\n") ~
      "craft.remake("~output_s~", "~grid_s~");";
  }
}
