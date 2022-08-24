#priority 5

#loader crafttweaker reloadableevents

#modloaded thaumcraft

import crafttweaker.item.IItemStack;
import scripts.craft.helper.styler.styler;
import scripts.craft.grid.Grid;

val fnc as function(IItemStack,Grid,string[])string = function(output as IItemStack, grid as Grid, style as string[]) as string {
  if(!(
    style has 'thaumcraft:infusion_matrix' 
    || style has 'thaumcraft:crucible' 
    || style has 'thaumcraft:arcane_workbench')
  ) return null;

  val output_s_anyAmount = isNull(output) ? "null" : serialize.IIngredient(output.anyAmount());

  val removedRecipeNames = styler.get(style, {
    removeByRecipeName: { 
        'thaumcraft:infusion_matrix' : 'mods.thaumcraft.Infusion.removeRecipe("insert_recipe_name_here");\n',
        'thaumcraft:crucible' : 'mods.thaumcraft.Crucible.removeRecipe("insert_recipe_name_here");\n',
        'thaumcraft:arcane_workbench': 'mods.thaumcraft.ArcaneWorkbench.removeRecipe("insert_recipe_name_here");\n',
      },
    _ : { 
        'thaumcraft:infusion_matrix' : "mods.thaumcraft.Infusion.removeRecipe("~output_s_anyAmount~");\n",
        'thaumcraft:crucible' : "mods.thaumcraft.Crucible.removeRecipe("~output_s_anyAmount~");\n",
        'thaumcraft:arcane_workbench': "mods.thaumcraft.ArcaneWorkbench.removeRecipe("~output_s_anyAmount~");\n",
      }
    }
  );

  var calledMethod = styler.get(style, {
    'thaumcraft:infusion_matrix': "mods.thaumcraft.Infusion.registerRecipe",
    'thaumcraft:crucible': "mods.thaumcraft.Crucible.registerRecipe",
    'thaumcraft:arcane_workbench':{
      shapeless: "mods.thaumcraft.ArcaneWorkbench.registerShapelessRecipe",
              _: "mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe",
    },
  });

  val output_s = serialize.IIngredient(output);
  val block = 
      (style has "thaumcraft:infusion_matrix" ) ? serializeTCInfusion(style, output_s, grid)
    : (style has "thaumcraft:crucible" ) ? serializeTCCrucible(style, output_s, grid)
    : serializeTCWorkbench(style, output_s, grid)
  ;

  return removedRecipeNames
    ~ calledMethod
    ~ "(" ~ block ~ ");";
};

styler.template(fnc);


function serializeTCInfusion(style as string[], output_s as string, grid as Grid) as string {
  var centralItem = grid.remove(grid.getCentralX(), grid.getCentralY());

  return  '\n'~
      '  "'~getThaumRecipeName(output_s)~'", # Name\n'~
      '  "INFUSION", # Research\n'~
      '  '~output_s~', # Output\n'~
      '  '~grid.extractItem('thaumcraft:taint_fibre', 3)~', # Instability\n'~
      '  '~extractGridAspects(grid)~',\n'~
      '  '~serialize.IIngredient(centralItem) ~ ', # Central Item\n'~
      '  scripts.craft.grid.Grid('~grid.trim().toString(style)~').spiral(1)';
}

function serializeTCWorkbench(style as string[], output_s as string, grid as Grid) as string {
  var aspects = extractGridAspects(grid);
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
      '  scripts.craft.grid.Grid('~grid.trim().toString(style)~').'~
      (style has 'shapeless' ? 'shapeless' : 'shaped')
      ~'()';
}

function serializeTCCrucible(style as string[], output_s as string, grid as Grid) as string {
  val list = grid.trim().shapeless();
  val input = (!isNull(list) && list.length > 0) ? list[0] : null;
  return  '\n'~
      '  "'~getThaumRecipeName(output_s)~'", # Name\n'~
      '  "BASEALCHEMY", # Research\n'~
      '  '~output_s~', # Output\n'~
      '  '~serialize.IIngredient(input, style)~', # Input\n'~
      '  '~extractGridAspects(grid)~'\n';
}

function getThaumRecipeName(output_s as string) as string {
  return output_s
    .replaceAll("^<", "").replaceAll("(:\\d+)?>.*", "") # Remove CraftTweaker's brackets
    .replaceAll("thaumcraft:", ""); # Remove mod it its Thaumcraft
}

function extractGridAspects(grid as Grid) as string {
  return grid.extractByTagSerialize('Aspects[0].key', 'Aspects[0].amount',
    function(aspectName as string, amount as int) as string {
      return '<aspect:'~aspectName~'>' ~ (amount>1 ? " * " ~ amount : "");
    }
  );
}