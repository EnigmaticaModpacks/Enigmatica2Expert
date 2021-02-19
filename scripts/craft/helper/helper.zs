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
  var merged as bool = false;

  function reset() {
    inventories = {};
    merged = false;
  }

  function workOn(block as IBlock, itemsList as IData, inventoryPos as string) as string {
    val blockFullId = block.definition.id ~ ":" ~ block.meta;
    val ri = RecipeInventory(blockFullId, itemsList);
    val acCount = ri.countActualRecipes();
    if(acCount <= 0) return "Inventory has §nno recipes§r.";

    val rewritten = !isNull(inventories[inventoryPos]);
    inventories[inventoryPos] = ri;

    return "Inventory with §n" ~ acCount ~ "§r grid" ~ (acCount > 1 ? "s" : "") ~
      (rewritten ? " rewritten." : " memored.");
  }

  function flagMerged() { merged = true;}

  function getMergedMap() as IIngredient[string] {
    if(!merged) return null;

    val map_weight as int[IIngredient] = {};
    for pos, recipeInventory in inventories {
      for gridRecipe in recipeInventory.gridRecipes {
        gridRecipe.gridBuilder.writeToMap(map_weight);
      }
    }

    var mergedMap = CharacterManager().getMap(map_weight);

    for pos, recipeInventory in inventories {
      for gridRecipe in recipeInventory.gridRecipes {
        gridRecipe.gridBuilder.useMergedMap(mergedMap);
      }
    }

    return mergedMap;
  }

  
  function logOutput(style as string[], player as IPlayer) as string {
    
    # Gather information and
    # set output items based on hotbar
    val inventoriesCount = inventories.length;
    var acCount = 0;
    var i = 0;
    for pos, recipeInventory in inventories {
      for gr in recipeInventory.gridRecipes {
        if(gr.haveData()) acCount += 1;
        if(isNull(gr.output)) {
          val out = player.getInventoryStack(min(i, player.inventorySize));
          gr.setOutput(out);
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
    val newStyle = merged ? (style + "merged") : style;
    var str as string[] = [];
    for pos, recipeInventory in inventories {
      str = str + recipeInventory.toString(newStyle);
    }
    var result = utils.join(str, style has "noFancy" ? "\n" : "\n\n");

    if(merged) result = "val ingrs = {\n" ~
      serialize.IIngredient_string_(getMergedMap(), style) ~ "\n" ~ 
      "} as IIngredient[string];\n\n" ~ result;
    
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

  /*
    Create new map entry
  */
  if(isNull(recipeWorks[player])) recipeWorks[player] = RecipeWork();
  var recipeWork = recipeWorks[player];

  /*
    Iterate items in inventory
  */
  val inventoryPos = e.x ~":"~ e.y ~":"~ e.z;
  val workResult = recipeWork.workOn(block, itemsList, inventoryPos);

  if(player.isSneaking) {
    player.sendChat(workResult);
    recipeWork.flagMerged();
  } else {
    val style = (!isNull(currentItem.tag) && !isNull(currentItem.tag.style))
      ? currentItem.tag.style.asString().split(" ")
      : [] as string[];

    val playerMessage = recipeWork.logOutput(style, player);
    player.sendChat(playerMessage);
    recipeWork.reset();
  }

  e.cancel();
});