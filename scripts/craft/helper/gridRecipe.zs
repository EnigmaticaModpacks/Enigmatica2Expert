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

    val output_s_anyAmount = isNull(output) ? "null" : serialize.IIngredient(output.anyAmount());
    val removedRecipeNames = styler.get(style, {
      removeByRecipeName: { 
          tcInfusion : 'mods.thaumcraft.Infusion.removeRecipe("insert_recipe_name_here");\n',
          tcWorkbench: 'mods.thaumcraft.ArcaneWorkbench.removeRecipe("insert_recipe_name_here");\n',
          tcCrucible : 'mods.thaumcraft.Crucible.removeRecipe("insert_recipe_name_here");\n',
                    _: toString_outputRecipesNames(style)
        },
      _ : { 
          tcInfusion : "mods.thaumcraft.Infusion.removeRecipe("~output_s_anyAmount~");\n",
          tcWorkbench: "mods.thaumcraft.ArcaneWorkbench.removeRecipe("~output_s_anyAmount~");\n",
          tcCrucible : "mods.thaumcraft.Crucible.removeRecipe("~output_s_anyAmount~");\n",
        }
      }
    );
    if(style has "removeByRecipeName" || removedRecipeNames.length > 0) style += "noRemake";

    # Comment
    val prefixComment = style has "noFancy"
      ? ""
      : "# "~craft.recipeName(output, gridBuilder.grid) ~ "\n";
    
    # Determine called method
    var calledMethod = styler.get(style, {
      tcInfusion: { _: "mods.thaumcraft.Infusion.registerRecipe" },
      tcWorkbench:{
        shapeless: "mods.thaumcraft.ArcaneWorkbench.registerShapelessRecipe",
                _: "mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe",
      },
      tcCrucible: { _: "mods.thaumcraft.Crucible.registerRecipe" },
      shapeless : {noRemake: "craft.shapeless", _: "craft.reshapeless"},
              _ : {noRemake: "craft.make",      _: "craft.remake"},
    });

    var plainLength = (calledMethod ~ "(, );").length;
    val output_s = serialize.IIngredient(output);
    val isDense = style has "dense" || (output_s.length + gridBuilder.length + plainLength) <= 60;
    if (isDense) style += "dense";
    if(  style has "merged"  ) style += "noMap";
    if(!(style has "noPretty") && (gridBuilder.maxX <= 1 || gridBuilder.maxY <= 1)) style += "noPretty";

    # Determine parser
    val block = 
        (style has "tcInfusion" ) ? serializeTCInfusion(style, output_s)
      : (style has "tcWorkbench") ? serializeTCWorkbench(style, output_s)
      : (style has "tcCrucible" ) ? serializeTCCrucible(style, output_s)
      : serializeTableRecipe(style, output_s)
    ;

    return prefixComment
      ~ removedRecipeNames
      ~ calledMethod ~ "("~block~");";
  }

  function toString_outputRecipesNames(style as string[]) as string {
    if(isNull(output)) return "";

    var str = '';
    for rec in recipes.getRecipesFor(output) {
      str += 'recipes.removeByRecipeName("'~rec.resourceDomain~":"~rec.name~'");\n';
    }

    return str;
  }

  function serializeTableRecipe(style as string[], output_s as string) as string {
    var map_s = (style has "merged") ? ", ingrs" ~ (style has "dense" ? "" : "\n") : "";
    val grid_s = gridBuilder.grid.toString(style) ~ map_s;
    return output_s~", "~grid_s;
  }

  function serializeTCInfusion(style as string[], output_s as string) as string {
    val grid = gridBuilder.grid;
    var centralItem = grid.remove(grid.getCentralX(), grid.getCentralY());

    return  '\n'~
        '  "'~getThaumRecipeName(output_s)~'", # Name\n'~
        '  "INFUSION", # Research\n'~
        '  '~output_s~', # Output\n'~
        '  '~extractItem('thaumcraft:taint_fibre', 3)~', # Instability\n'~
        '  '~extractGridAspects()~',\n'~
        '  '~serialize.IIngredient(centralItem) ~ ', # Central Item\n'~
        '  scripts.craft.grid.Grid('~grid.trim().toString(style)~').spiral()';
  }

  function serializeTCWorkbench(style as string[], output_s as string) as string {
    var aspects = extractGridAspects();
    val lookup = '<aspect:potentia>';
    val i = aspects.indexOf(lookup);
    var visCost = 50;
    if(i >= 0) {
      val sub = aspects.substring(i + lookup.length);
      if(sub.startsWith(' * ')) visCost = sub.replaceAll(' \\* (\\d+)\\b.*', '$1') as int;
      else visCost = 1;
      aspects = aspects.replaceAll(lookup~"( \\* \\d+)?(, )?", "");
    }
    return  '\n'~
        '  "'~getThaumRecipeName(output_s)~'", # Name\n'~
        '  "TWOND_BASE", # Research\n'~
        '  '~visCost~', # Vis cost\n'~
        '  '~aspects~',\n'~
        '  '~output_s~', # Output\n'~
        '  scripts.craft.grid.Grid('~gridBuilder.grid.trim().toString(style)~').'~
        (style has 'shapeless' ? 'shapeless' : 'shaped')
        ~'()';
  }

  function serializeTCCrucible(style as string[], output_s as string) as string {
    val list = gridBuilder.grid.trim().shapeless();
    val input = (!isNull(list) && list.length > 0) ? list[0] : null;
    return  '\n'~
        '  "'~getThaumRecipeName(output_s)~'", # Name\n'~
        '  "BASEALCHEMY", # Research\n'~
        '  '~output_s~', # Output\n'~
        '  '~serialize.IIngredient(input, style)~', # Input\n'~
        '  '~extractGridAspects()~'\n';
  }

  function getThaumRecipeName(output_s as string) as string {
    return output_s
      .replaceAll("^<", "").replaceAll("(:\\d+)?>.*", "") # Remove CraftTweaker's brackets
      .replaceAll("thaumcraft:", ""); # Remove mod it its Thaumcraft
  }

  function extractGridAspects() as string {
    var result = '';
    val grid = gridBuilder.grid;
    var first = true;

    for y in 0 .. grid.Y {
      for x in 0 .. grid.X {
        val ingr = grid.getIngr(x, y);
        if(isNull(ingr)) continue;

        for item in ingr.itemArray {
          val d = D(item.tag);
          if(!d.check('Aspects[0].key')) continue;

          val aspectName = d.getString('Aspects[0].key', '');
          if(aspectName.length == 0) continue;

          val amount = ingr.amount * d.getInt('Aspects[0].amount', 1);
          result ~= (first ? '' : ', ') ~
            '<aspect:'~aspectName~'>'~
            (amount>1 ? " * " ~ amount : "");
          first = false;
          grid.remove(x, y);
          break;
        }
      }
    }

    return '['~result~']';
  }

  # Remove item from grid and count its amount
  function extractItem(id as string, default as int = 0) as int {
    var result = default;

    for y in 0 .. gridBuilder.grid.Y {
      for x in 0 .. gridBuilder.grid.X {
        val ingr = gridBuilder.grid.getIngr(x, y);
        if(isNull(ingr)) continue;

        for item in ingr.itemArray {
          if(item.definition.id != id) continue;
          result += ingr.amount;
          gridBuilder.grid.remove(x, y);
        }
      }
    }

    return result;
  }
}
