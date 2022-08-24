#priority 2

#loader crafttweaker reloadableevents

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.craft.helper.gridBuilder.GridBuilder;
import scripts.craft.helper.styler.styler;
import scripts.craft.grid.Grid;


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
    if(!(style has "noPretty") && (gridBuilder.maxX <= 1 || gridBuilder.maxY <= 1)) style += "noPretty";

    # Comment
    val prefixComment = style has "noFancy"
      ? ""
      : "# "~craft.recipeName(output, gridBuilder.grid) ~ "\n";

    return prefixComment
      ~ styler.pickTemplate(output, gridBuilder.grid, style);
  }
}
