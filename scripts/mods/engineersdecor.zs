#modloaded engineersdecor

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

# Oredicting recipe
# [Treated Wood Crafting Table] from [Treated Wood Planks]
craft.remake(<engineersdecor:treated_wood_crafting_table>, ["pretty",
  "# #",
  "# #"], {
  "#": <ore:plankTreatedWood>, # Treated Wood Planks
});