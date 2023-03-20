import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import scripts.craft.grid.Grid;
import scripts.craft.helper.characterManager.CharacterManager;
#priority 3


zenClass GridBuilder {

  # This items in catalyst slot would add this styles
  val catalystsStyles as string[IIngredient] = {
    <minecraft:glass_pane>  : "shapeless",
    <minecraft:iron_nugget> : "removeByRecipeName",
  } as string[IIngredient];

  var grid2d as IIngredient[][] = [];
  var haveData as bool = false;
  var maxX as int = 0;
  var maxY as int = 0;
  var mergedMap as IIngredient[string] = null;
  var localStyle as string[] = null;

  # Calculated fields
  var map as IIngredient[string] = null;
  var length as int = 0;
  var grid as Grid = null;
  var isBuilt as bool = false;


  zenConstructor(style as string[]) {
    localStyle = style;
  }

  function insert(ingr as IIngredient, slot as int, w as int) {
    val x = slot % w;
    val y = (slot / w) as int;
    maxX = max(maxX, x+1);
    maxY = max(maxY, y+1);

    for i in 0 to maxY {
      if(grid2d.length < i+1) grid2d += [] as IIngredient[];
      while(grid2d[i].length < maxX) {
        grid2d[i] = grid2d[i] + null as IIngredient;
      }
    }

    if(isNull(ingr)) {
      grid2d[y][x] = null;
    } else {
      val itemStack = ingr.itemArray[0];
      if(
        localStyle has "noForceAmount" 
        || ingr.amount == 1
        || (serialize.IIngredient(ingr, localStyle) != serialize.IIngredient(itemStack.anyAmount(), localStyle))
      ) grid2d[y][x] = ingr;
      else {
        grid2d[y][x] = ingr.amount == 2 ? itemStack.anyAmount() as IIngredient
                    : (ingr.amount == 3 ? itemStack.anyAmount().withTag(null).withDamage(32767) as IIngredient
                    : ingr);
      }
      haveData = true;
    }
  }

  function insertCatalyst(ingr as IIngredient) as void {
    if(isNull(ingr)) return;

    for catl, newStyle in catalystsStyles {
      if(catl has ingr || ingr has catl) {
        localStyle += newStyle;
        return;
      }
    }
  }

  function writeToMap(map_weight as int[IIngredient]) {
    for line in grid2d {
      for it in line {
        if(!isNull(it))
          map_weight[it] = isNull(map_weight[it]) ? 1 : map_weight[it] + 1;
      }
    }
  }

  function useMergedMap(newMap as IIngredient[string]) {
    mergedMap = newMap;
    isBuilt = false;
  }

  function getOrder() as string {
    if(build()) return grid.getOrder();
    return '';
  }

  # Build Grid using known ingredient map `grid2d`
  # Return false if grid has no items in it
  function build() as bool {
    if(!haveData) return false;
    if(isBuilt) return true;

    # Make ingredients map
    val isMerged = !isNull(mergedMap);
    if(isMerged) {
      map = mergedMap;
    } else {
      val map_weight as int[IIngredient] = {};
      writeToMap(map_weight);
      map = CharacterManager().getMap(map_weight);
    }

    # Calculate minimum length of serialized form
    length = (maxX + 3) * (maxY - 1) - 2; # Char Grid size
    if(isMerged) {
      length += 5;
    } else {
      for c, ingr in map {
        length += serialize.IIngredient(ingr).length + 5;
      }
      length -= 2; # trail
    }

    # Flipped map
    val map_flipped as string[IIngredient] = {};
    for c, it in map { map_flipped[it] = c; }

    # Build Grid
    var gridStr as string[] = [];
    for line in grid2d {
      var s = "";
      for it in line {
        val c = map_flipped[it];
        s += !isNull(c) ? c : " ";
      }
      gridStr += s;
    }
    grid = Grid(gridStr, map);

    isBuilt = true;
    return true;
  }
}
