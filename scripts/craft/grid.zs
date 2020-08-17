/* 

Grid class

Grid is wrapper for recipe 2d array.
Its receive an 2d list of string with 1 char keys and
map of key-Ingredient pairs

Usage:

# Providing instance of grid class
var grid = Grid([
  "ABA",
  "BCB",
  "ABA"], {
    A: <minecraft:gunpowder>,
    B: <minecraft:tnt>,
    C: <ore:sand>,
  });

# String array can contain special characters that mirror
# ingredients in different axes

# " " in string array means null

# "." try to find ingredients by mirroring:
1. By vertical axis
"   "    "   "
"A ." => "A A"
"   "    "   "
2. By horisontal axis
" A "    " A "
"   " => "   "
" . "    " A "
3. Both axis
"A  "    "A  "
"   " => "   "
"  ."    "  A"

# "╲" or "," try to find ingredients by mirroring around
  x=y axis:
1. By vertical axis
"   "    "   "
"A ." => "A A"
"   "    "   "
2. By horisontal axis
" A "    " A "
"   " => "   "
" . "    " A "
3. Both axis
"A  "    "A  "
"   " => "   "
"  ."    "  A"

# Create an 2d array to use in shaped recipes
recipes.addShaped(output, grid.shaped() );

# Create an 1d array to use in shapeless recipes
recipes.addShapeless(output, grid.shapeless() );

*/

#priority 2010

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

zenClass Grid {

  var mapRaw as string[];
  var map as string[];
  var opts as IIngredient[string];
  var shapedList as IIngredient[][];
  var shapelessList as IIngredient[];
  var usesMap as int[string];
  var sorted as string[];
  var uniqueIngredientsCount as int;
  var error as string;
  var X as int; var Y as int; # Size of grid

  # Compute grid pamameters
  # gridStr: array in form
  # ["ABA",
  #  "BCB",
  #  "ABA"]
  # options: map in form 
  # {A: <minecraft:gunpowder>,
  #  B: <minecraft:tnt>,
  #  C: <ore:sand> }
	zenConstructor(gridStr as string[], options as IIngredient[string]) {
    uniqueIngredientsCount = 0;

    # Skip each uneven character in grid (usually pretty spaces)
    if (!isNull(gridStr) && gridStr.length > 0 && (gridStr[0] == "pretty" || gridStr[0] == "𝓹")) {
      if (gridStr.length > 1) {
        mapRaw = [];
        for y, row in gridStr {
          if (y!=0) {
            mapRaw += row.replaceAll("(.).", "$1");
          }
        }
      }
    } else {
      mapRaw = gridStr;
    }

    opts = options;

    if (isNull(mapRaw) || mapRaw.length <= 0) {
      error = "No Grid string array in parameters";
      return;
    }

    usesMap = {};
    map = [];
    X = 0;
    Y = mapRaw.length;

    # Find size X
    for y, row in mapRaw {
      X = max(X, row.length);
    }

    # Normalize map to remove command characters
    for y, row in mapRaw {
      map += "";

      for x in 0 to row.length {
        var c = getRaw(x,y);
        c = !isNull(c) ? c : " ";
        map[y] = map[y] + c;

        if (hasOpt(c)) {
          if (!isNull(usesMap[c])) {
            usesMap[c] = usesMap[c] + 1;
          } else {
            usesMap[c] = 1;
            uniqueIngredientsCount += 1;
          }
        }
      }
    }

    if (uniqueIngredientsCount <= 0) error = "No ingredients found";
  }

  # Grid map as string
  function toString() as string { return toString(true, false); }
  function toString(pretty as bool) as string { return toString(pretty, false); }
  function toString(pretty as bool, normalized as bool) as string {
    var mapToPrint = normalized ? map : mapRaw;
    if (isNull(mapToPrint)) return "[no grid map]";
    var s = "";
    var isMapEmpty = true;
    for y, row in mapToPrint {
      if (pretty) {
        for x in 0 to row.length {
          if (row.length > x) {
            if (x != 0) s ~= " ";
            s ~= row[x];
            isMapEmpty = false;
          }
        }
      } else {
        s ~= row;
      }
      if (y + 1 < mapToPrint.length) s ~= "\n";
    }
    if (isMapEmpty) return "[grid map is empty]";
    return s;
  }

  # Return 2d list of ingredients to use in shaped recipe
  function shaped() as IIngredient[][] {
    if (!isNull(shapedList)) return shapedList;

    # Make ingredients list from string grid
    shapedList = [[]];
    for y, row in map {
      for x in 0 to row.length {
        # Add ingredient in list
        if (shapedList.length <= y) shapedList = shapedList + [] as IIngredient[];
        shapedList[y] = shapedList[y] + opts[row[x]];
      }
    }
    return shapedList;
  }

  # Return flatten list of ingredients to use in shapeless recipe
  function shapeless() as IIngredient[] {
    if (!isNull(shapelessList)) return shapelessList;

    # Make ingredients list from string grid
    shapelessList = [];
    for y, row in map {
      for x in 0 to row.length {
        # Add ingredient in list
        var ingr = opts[row[x]];
        if (!isNull(ingr)) {
          shapelessList = shapelessList + ingr;
        }
      }
    }
    return shapelessList;
  }

  # Check if options have this key
  function hasOpt(c as string) as bool { return !isNull(opts) && !isNull(c) && !isNull(opts[c]); }

  # Get normalized grid character at [x,y]
  function get(x as int, y as int) as string { 
    if(map.length > y && map[y].length > x) {
      return map[y][x];
    }
    return null;
  }

  # Get grid character at [x,y], recursively searching if mirror characters found
  function getRaw(x as int, y as int) as string { return getRaw(x, y, {}); }
  function getRaw(x as int, y as int, antiloop as bool[string]) as string {
    var c as string = get(x,y);

    if(isNull(c) && mapRaw.length > y && mapRaw[y].length > x) {
      c = mapRaw[y][x];

      var key = x~"_"~y;
      if (!isNull(antiloop[key])) {
        return null;
      } else {
        antiloop[key] = true;
      }

      # Mirror ingredient
      if ((c == ".") && !hasOpt(c)) {
        var mx = X - 1 - x;
        var my = Y - 1 - y;
        c = null;

        if (x!=mx)
          c = getRaw(mx,   y, antiloop);

        if (isNull(c) && y!=my)
          c = getRaw( x,  my, antiloop);
        
        if (isNull(c) && y!=my && x!=mx)
          c = getRaw(mx,  my, antiloop);


      } else

      # Mirror diagonal ingredient
      if ((c == "╲" || c == ",") && !hasOpt(c)) {
        c = null;
        if (x!=y)
          c = getRaw(y, x, antiloop);
      }
    }

    return c;
  }

  

  # Determine what ingredient is most important in this grid
  # Usually its a item in center of 2d grid
  function getMainIngredient() as IIngredient {

    # Spirally from center find list of ingredients
    if (isNull(sorted)) {
      sorted = [];

      /* 
        ↙ ← ← ↖ ↑
        ↓ ↙ ↖ ↑ ↑
        ↓ ↓ ⇫ ↑ ↑
        ↓ ↘ → ↗ ↑
        ↘ → → → ↗
      */

      var x = 0;
      var y = 0;
      var dx = 1 as int; # Cast, yes. Because -1 is not int 🤦‍♂️
      var dy = 0 as int;
      for i in 0 .. pow(max(X, Y), 2) {
        if ((-X/2 <= x && x <= X/2) && (-Y/2 <= y && y <= Y/2)) {
          var c = get(X/2 + x, Y/2 + y);
          if ( hasOpt(c) && !(sorted has c)) sorted += c;
        }
        if (x == y || (x < 0 && x == -y) || (x >= 0 && -x == 1 + y)) {
          var tdx = dx;
          dx =   dy;
          dy = -tdx;
        }
        x += dx;
        y += dy;
      }
    }

    # Calculate uses map if wasn't
    if (sorted.length > 0) {
      var minUses = 999999;
      var minKey = sorted[0];
      for i,c in sorted {
        if (usesMap[c] < minUses) {
          minUses = usesMap[c] as int; # WARN: must excplicitely cast type
          minKey = c;
        }
      }
      return opts[minKey];

    } else {
      return null;
    }
  }

}