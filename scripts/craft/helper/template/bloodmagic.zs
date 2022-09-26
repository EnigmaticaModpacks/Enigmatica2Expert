#priority 5

#loader crafttweaker reloadableevents

#modloaded bloodmagic

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.craft.helper.styler.styler;
import scripts.craft.grid.Grid;

val fnc as function(IItemStack,Grid,string[])string = function(output as IItemStack, grid as Grid, style as string[]) as string {
  if(!(
    style has 'bloodmagic:altar'
  )) return null;

  val output_s_anyAmount = isNull(output) ? "null" : serialize.IIngredient(output.anyAmount());

  val removedRecipeNames = styler.get(style, {
    _ : { 
        'bloodmagic:altar' : "mods.bloodmagic.BloodAltar.removeRecipe("~output_s_anyAmount~");\n",
      }
    }
  );

  var calledMethod = styler.get(style, {
    _: "mods.bloodmagic.BloodAltar.addRecipe",
  });

  val output_s = serialize.IIngredient(output);
  val block = serializeBM(style, output_s, grid);

  return removedRecipeNames
    ~ calledMethod
    ~ "(" ~ block ~ ");";
};

styler.template(fnc);


function serializeBM(style as string[], output_s as string, grid as Grid) as string {
  val essenceAmount = extractEssence(grid) as int;
  val input_s = serialize.IIngredient(grid.shapeless()[0], style);

  return  output_s ~ input_s ~ ', 0, '~essenceAmount~', '~essenceAmount/100~', '~essenceAmount/50;
}


function extractEssence(grid as Grid) as string {
  return grid.extractByTagSerialize('Fluid.FluidName', 'Fluid.Amount',
    function(name as string, amount as int) as string {return amount;}
  );
}