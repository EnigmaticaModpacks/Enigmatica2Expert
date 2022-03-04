import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.block.IBlock;
import crafttweaker.world.IWorld;

import scripts.craft.grid.Grid;
import scripts.craft.helper.recipeInventory.RecipeInventory;
import scripts.craft.helper.characterManager.CharacterManager;

#------------------------------------------------------------------
# Statics
#------------------------------------------------------------------

# ID of item, right clicking with will cause helper triggers
static toolItemID as string = "minecraft:bone";

# Set this to "false" if you dont want tool item caused recipe
# printings in crafttweaker.log.
# When set to "false", only item with NBT tag would cause triggers
static isToolNoTag as bool = true;


#------------------------------------------------------------------
# Handlers
#------------------------------------------------------------------
zenClass RecipeWork { zenConstructor() {}

  var inventories as RecipeInventory[string] = {};
  var inventories_order as string[] = [];
  var merged as bool = false;

  function reset() {
    inventories = {};
    inventories_order = [];
    merged = false;
  }

  # Add inventory to list, update order
  # Return true if old inventory was rewritten for same position
  function pushInventory(inventoryPos as string, recipeInventory as RecipeInventory) as bool {
    val rewritten = !isNull(inventories[inventoryPos]);
    inventories[inventoryPos] = recipeInventory;
    if(!rewritten) inventories_order += inventoryPos;
    return rewritten;
  }

  function workOn(block as IBlock, itemsList as IData, inventoryPos as string, style as string[]) as string {
    val blockFullId = block.definition.id ~ ":" ~ block.meta;
    val recipeInventory = RecipeInventory(blockFullId, itemsList, style);
    val acCount = recipeInventory.countActualRecipes();
    if(acCount <= 0) return "Inventory has §nno recipes§r.";

    val rewritten = pushInventory(inventoryPos, recipeInventory);
    return "Inventory with §n" ~ acCount ~ "§r grid" ~ (acCount > 1 ? "s" : "") ~
      (rewritten ? " rewritten." : " memored.");
  }

  function flagMerged() { merged = true;}

  # Important!
  # If "merged" mode used, this function should be called
  # BEFORE any gridRecipe serialization
  function merged_updateAndSerialize(style as string[]) as string {
    if(!merged) return null;

    val map_weight as int[IIngredient] = {};
    for pos in inventories_order {
      for gridRecipe in inventories[pos].gridRecipes {
        gridRecipe.gridBuilder.writeToMap(map_weight);
      }
    }

    var mergedMap = CharacterManager().getMap(map_weight);
    var order = '';
    for pos in inventories_order {
      for gridRecipe in inventories[pos].gridRecipes {
        gridRecipe.gridBuilder.useMergedMap(mergedMap);
        order += gridRecipe.gridBuilder.getOrder();
      }
    }

    return serialize.IIngredient_string_(mergedMap, style, order);
  }


  function logOutput(style as string[], player as IPlayer) as string {

    # Gather information and
    # set output items based on hotbar
    val inventoriesCount = inventories.length;
    var acCount = 0;
    var i = 0;
    for pos in inventories_order {
      for gridRecipe in inventories[pos].gridRecipes {
        if(gridRecipe.haveData()) acCount += 1;
        if(isNull(gridRecipe.output)) {
          val out = player.getInventoryStack(min(i, player.inventorySize));
          gridRecipe.setOutput(out);
          i += 1;
        }
      }
    }

    if(acCount <= 0) return "Inventory has §nno recipes§r.";

    print(
      "🛠 craft.zs recipes:\n" ~
      toString(style)
    );


    return
      (inventoriesCount>1 ? "§6"~inventoriesCount~"§r Inventories" : "Inventory") ~
      " with §n" ~ acCount ~ "§r grid" ~ (acCount > 1 ? "s" : "") ~
      " printed into §acrafttweaker.log";
  }

  function toString(style as string[]) as string {
    var result = '';

    if(merged) result = "val ingrs = {\n" ~
      merged_updateAndSerialize(style) ~ "\n" ~
      "} as IIngredient[string];\n\n";

    var str as string[] = [];
    for pos in inventories_order {
      str += inventories[pos].toString(merged ? (style + "merged") : style);
    }

    result += serialize.join(str, style has "noFancy" ? "\n" : "\n\n");

    if(!(style has "noBucket")) return result.replaceAll(
      '<forge:bucketfilled>\\.withTag\\(\\{FluidName: ("[^"]+?"), Amount: 1000\\}\\)',
      'Bucket($1)'
    );

    return result;
  }
}
static recipeWorks as RecipeWork[IPlayer] = {};

#------------------------------------------------------------------
# Event
#------------------------------------------------------------------
events.onPlayerInteractBlock(function(e as PlayerInteractBlockEvent) {
  /*
    Check requirments
  */

  val world as IWorld = e.world;
  if(isNull(world) || world.remote) return;

  val player as IPlayer = e.player;
  if (isNull(player) || !player.creative) return;

  val currentItem = e.item;
  if (isNull(currentItem)) return;
  if(currentItem.definition.id != toolItemID) return;
  if(!isToolNoTag && isNull(currentItem.tag)) return;

  val block as IBlock = world.getBlock(e.x, e.y, e.z);
  if (isNull(block)) return;

  val data as IData = block.data;
  if (isNull(data)) return;

  val itemsList = data.Items;
  if (isNull(itemsList) || isNull(itemsList.asList()) || itemsList.length <= 0) return;

  val style as string[] = (!isNull(currentItem.tag) && !isNull(currentItem.tag.style))
    ? currentItem.tag.style.asString().split(" ") : [];

  /*
    Create new map entry
  */
  if(isNull(recipeWorks[player])) recipeWorks[player] = RecipeWork();
  var recipeWork = recipeWorks[player];

  /*
    Iterate items in inventory
  */
  val inventoryPos = e.x ~":"~ e.y ~":"~ e.z;
  val workResult = recipeWork.workOn(block, itemsList, inventoryPos, style);

  if(player.isSneaking) {
    player.sendChat(workResult);
    recipeWork.flagMerged();
  } else {
    val playerMessage = recipeWork.logOutput(style, player);
    player.sendChat(playerMessage);
    recipeWork.reset();
  }

  e.cancel();
});