#priority 5

#loader crafttweaker reloadableevents

#modloaded thaumcraft

import crafttweaker.item.IItemStack;
import scripts.craft.helper.styler.styler;
import scripts.craft.grid.Grid;

// server.commandManager.executeCommand(server, '/say '~catl~' '~name);

val fnc as function(IItemStack,Grid,string[])string = function(output as IItemStack, grid as Grid, style as string[]) as string {
  val classMap = {
    "forestry:fabricator": "ThermionicFabricator",
    "forestry:carpenter": "Carpenter",
    // "forestry:centrifuge": "Centrifuge",
    // "forestry:fermenter": "Fermenter",
    // "forestry:squeezer": "Squeezer",
  } as string[string];

  var className as string = null;
  for catl, name in classMap {
    if(style has catl) {
      className = name;
      break;
    }
  }
  if(isNull(className)) return null;

  val output_s_one = isNull(output) ? "null" : serialize.IIngredient(output.anyAmount());
  val removed = "mods.forestry."~className~".removeRecipe("~output_s_one~");\n";

  var calledMethod = "mods.forestry." ~ className ~ (
    style has "forestry:fabricator" ? ".addCast" : ".addRecipe"
  );

  val output_s = serialize.IIngredient(output);
  val executionTime = grid.extractItem('minecraft:clock', 4) * 10;
  val liquid = extractLiquids(grid, style has "forestry:carpenter" ? '<fluid:water> * 1000' : '<fluid:glass> * 1000');
  val block = output_s
    ~ ', scripts.craft.grid.Grid('~grid.trim().toString(style)~').shaped()'
    ~ (style has "forestry:carpenter" ? ', ' ~ executionTime : '')
    ~ ', ' ~ liquid
    ~ (style has "forestry:wax_cast" ? ', <forestry:wax_cast:*>' : '')
  ;

  return removed ~ calledMethod ~ "(" ~ block ~ ");";
};

styler.template(fnc);


function extractLiquids(grid as Grid, default as string) as string {
  for k, v in grid.extractByTag('FluidName', 'Amount')             { return '<fluid:'~k~'> * '~v; }
  for k, v in grid.extractByTag('Fluid.FluidName', 'Fluid.Amount') { return '<fluid:'~k~'> * '~v; }
  return default;
}