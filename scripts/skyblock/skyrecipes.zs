import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeFunction;
import crafttweaker.world.IVector3d;
import scripts.craft.grid.Grid;

#priority 900

static canSeeAbyssFnc as IRecipeFunction = function(out, ins, cInfo) {
  val player = cInfo.player;
  if(isNull(player)) return null;
  if(player.y <= 1.0) return out;

  val pos = IVector3d.create(player.x, player.y, player.z);
  val rayTraceResult = player.world.rayTraceBlocks(pos, IVector3d.create(pos.x, pos.y - (pos.y as int), pos.z),
    false, // stopOnLiquid,
    true,  // ignoreBlockWithoutBoundingBox,
    false  // returnLastUncollidableBlock
  );

  if(isNull(rayTraceResult)) return out;
  if(!rayTraceResult.isMiss || rayTraceResult.isBlock) return null;

  return out;
} as IRecipeFunction;

function add(output as IItemStack, gridStr as string[], options as IIngredient[string]) as void {
  var grid = Grid(gridStr, options);
  recipes.addHiddenShaped(craft.uniqueRecipeName(output, grid), output, grid.shaped(), canSeeAbyssFnc, null);
  scripts.jei.crafting_hints.special(output, grid.shaped(), "Crafter must see the void");
}