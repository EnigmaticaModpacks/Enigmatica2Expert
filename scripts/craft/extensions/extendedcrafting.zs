/*

Craft.zs extension.

Working example of capability extension for Extended Crafting mod.

if Extended Crafting installed, all recipes that cant fit
vanilla Crafting Table would be added to Extended Table Crafting.

You can add additional custom extensions.

*/



# Priority should be lower than craft.zs and grid.zs
#priority 1999

# Mod that add new craft capabilities
#modloaded extendedcrafting

# Add new extension to craft.zs
# Function would be executed each time craft.make() called,
# but only if all previous extensions returned false.
#
# Return false if action can't be performed
# Return true if recipe added
craft.pushExtension(scripts.craft.craft_extension.Extension(
function (
  output         as crafttweaker.item.IItemStack,
  recipeName     as string,
  grid           as scripts.craft.grid.Grid,
  recipeFunction as crafttweaker.recipes.IRecipeFunction,
  recipeAction   as crafttweaker.recipes.IRecipeAction,
  isShapeless    as bool
) as bool {

  if (isShapeless) {
    var ingrs = grid.shapeless();
    if (ingrs.length <= 9) return false;
    mods.extendedcrafting.TableCrafting.addShapeless(output, ingrs);
  } else {
    var grd = grid.shaped();
    if (max(grid.X, grid.Y) <= 3) return false;
    mods.extendedcrafting.TableCrafting.addShaped(output, grd);
  }

  if (!isNull(recipeFunction) || !isNull(recipeAction)) {
    logger.logWarning("Cant add Recipe Function/Action to Extended Crafting table, recipe: " ~ recipeName);
  }

  return true;
}));