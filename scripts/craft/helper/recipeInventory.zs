import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.craft.helper.gridRecipe.GridRecipe;
#priority 1


zenClass RecipeInventory {
  # Two values in array means recipes should be
  #   considering as bunch of recipes in one invernoty
  # String is RegExp. trailing ":0" is optional
  static blockSizes as int[][string] = {
    "extendedcrafting:table_advanced":            [5],
    "extendedcrafting:table_elite":               [7],
    "extendedcrafting:table_ultimate":            [9],
    "ironchest:iron_chest":                       [ 9, 6],
    "ironchest:iron_chest:1":                     [ 9, 9],
    "ironchest:iron_chest:(2|5|6)":               [12, 9],
    "draconicevolution:draconium_chest":          [26,10],
    "minecraft:chest.*":                          [ 9, 3],
    "rustic:vase.*":                              [ 9, 3],
    "rustic:cabinet.*":                           [ 9, 3],
    "bibliocraft:framedchest.*":                  [ 9, 3],
    "extrautils2:largishchest:3":                 [ 9, 3],
    "actuallyadditions:block_giant_chest":        [13, 9],
    "actuallyadditions:block_giant_chest_medium": [13,18],
    "actuallyadditions:block_giant_chest_large":  [13,27],
  } as int[][string];

  var W as int = 3; # Width  of current recipe inventory
  var H as int = 0; # Height of current recipe inventory
  var gridRecipes as GridRecipe[] = [];

  zenConstructor(id as string, itemsList as IData, style as string[]) {
    # Find chest
    var sizeWH as int[] = null;
    for name, arr in blockSizes {
      if(id.matches(name ~ "(:0)?")) {
        sizeWH = arr;
        break;
      }
    }

    if(!isNull(sizeWH)) {
      W = sizeWH[0];
      if(sizeWH.length > 1) {
        # Init complex inventory with multiple recipes
        H = sizeWH[1];
      }
    }

    for i, it in itemsList.asList() {
      processInventoryItem(i, it, style);
    }
  }

  function processInventoryItem(
    index as int,     # Current inventory slot index
    it as IData,      # Item in NBT form
    style as string[] # Helper style
  ) as void {

    # Item is not nbtMap or have no id data
    if(isNull(it.asMap()) || isNull(it.id)) return;
    
    val slot = isNull(it.Slot) ? index : it.Slot.asInt();
    val slotData = getSlotData(slot);

    # This slot is out of recipes space
    if(isNull(slotData)) return;

    # Get values fro NBT
    val id     = it.id.asString();
    val count  = isNull(it.Count) ? 1 : it.Count.asInt();
    val damage = isNull(it.Damage) ? 0 : it.Damage.asInt();

    # Create ItemStack
    var itemStack = itemUtils.getItem(id, damage);
    if (isNull(itemStack)) return;
    if (count != 1)        itemStack *= count;
    if (!isNull(it.tag))   itemStack  = itemStack.withTag(it.tag);

    # Add empty GridRecipes if needed
    val gridIndex = isNull(slotData.gridIndex) ? 0 : slotData.gridIndex.asInt();
    while(gridRecipes.length <= gridIndex) { gridRecipes += GridRecipe(style); }
    val gridRecipe = gridRecipes[gridIndex];

    if      (!isNull(slotData.isOutput  )) { gridRecipe.setOutput(itemStack); }
    else if (!isNull(slotData.isCatalyst)) { gridRecipe.gridBuilder.insertCatalyst(itemStack); }
    else {
      val localSlot = isNull(slotData.slot) ? slot : slotData.slot.asInt();
      gridRecipe.gridBuilder.insert(itemStack, localSlot, H>0?3:W);
    }
  }

  # Return type of this slot
  function getSlotData(slot as int) as IData {
    if(H==0) return {}; # This is unknown inventory

    val _x = slot % W;
    if(_x >= W - (W%4)) return null; # Out of recipes space

    val _y = (slot / W) as int;
    val netX = (_x/4) as int;
    val netY = (_y/3) as int;
    val gridWidth = (W / 4) as int;
    val gridIndex = netY * gridWidth + netX;

    val x = _x % 4;
    val y = _y % 3;
    if(x == 3) {
      if(y == 1) return {gridIndex: gridIndex,   isOutput:true};
      else       return {gridIndex: gridIndex, isCatalyst:true};
    }
    return {gridIndex: gridIndex, slot: y*3+x};
  }

  function countActualRecipes() as int {
    var n = 0;
    for gridRecipe in gridRecipes {
      if(gridRecipe.haveData()) n += 1;
    }
    return n;
  }

  function toString(style as string[]) as string {
    var str as string[] = [];
    for gridRecipe in gridRecipes {
      val s = gridRecipe.toString(style);
      if(!isNull(s)) str += s;
    }

    return serialize.join(str, style has "noFancy" ? "\n" : "\n\n");
  }
}
