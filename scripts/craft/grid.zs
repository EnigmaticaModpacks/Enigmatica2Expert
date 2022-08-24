/*

Grid.zs

Grid is wrapper for recipe 2d array.
Its receive an 2d list of string with 1 letter keys and
  map of key-Ingredient pairs

Author: https://github.com/Krutoy242

---------------------------------------------------------

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


  # Create an 2d array to use in shaped recipes
  recipes.addShaped(output, grid.shaped());

*/

import crafttweaker.item.IIngredient;
#priority 2005

#loader crafttweaker reloadableevents

zenClass Grid {

  # Public fields
  var error as string; // Error description if Grid can't be initialized
  var X as int; var Y as int; # Size of grid

  # Private fields
  var mapRaw as string[]; // Grid string map from constructor (but without tags)
  var map as string[]; // Actually parsed Grid string map
  var opts as IIngredient[string]; // Constructor options
  var usesMap as int[string]; // How much this character was used
  var uniqueIngredientsCount as int = 0;

  # Hashed data
  var shapedList as IIngredient[][];
  var shapelessList as IIngredient[];
  var shapelessList_wNulls as IIngredient[];
  var mainIngredient as IIngredient;

  #------------------------------------------------------------------
  # Public Methods
  #------------------------------------------------------------------

  /*
    Compute grid pamameters

    gridStr: array in form
    [
      "ABA",
      "BCB",
      "ABA"
    ]

    options: map in form
    {
      A: <minecraft:gunpowder>,
      B: <minecraft:tnt>,
      C: <ore:sand>
    }
   */
	zenConstructor(gridStr as string[], options as IIngredient[string]) {
    if(isNull(gridStr))     { error = "Grid string is not provided"; return; }
    if(gridStr.length == 0) { error = "Grid string have no elements"; return; }
    if(isNull(options))     { error = "Options is not provided"; return; }

    # parse input if "pretty" tag provided
    if (gridStr[0] == "pretty" || gridStr[0] == "𝓹") {
      if(gridStr.length == 1) {
        error = 'First parameter have "pretty" tag, '~
                'but no other mapping letters found';
        return;
      }
      mapRaw = [];
      for i in 1 to gridStr.length {
        mapRaw += gridStr[i].replaceAll("(.).", "$1");
      }
    } else {
      mapRaw = gridStr;
    }

    opts = options;
    usesMap = {};
    map = [];
    X = 0;
    Y = mapRaw.length;

    # Find size X
    for y, row in mapRaw {
      if(isNull(row)) continue;
      if(row.length > X) X = row.length;
    }

    # Normalize map to remove command characters
    for y, row in mapRaw {
      if(isNull(row)) continue;
      map += "";

      if(row.length==0) continue;
      for x in 0 to row.length {
        var c = getRaw(x,y);
        c = !isNull(c) ? c : " ";
        push(y, c);
      }
    }

    if (uniqueIngredientsCount <= 0) error = "No actual ingredients found";
  }

  #  Return 2d list of ingredients to use in shaped recipe
  function shaped() as IIngredient[][] {
    if (!isNull(shapedList)) return shapedList;

    # Make ingredients list from string grid
    shapedList = [[]];
    for y, row in map {
      if(row.length==0) continue;
      for x in 0 to row.length {
        if (shapedList.length <= y) shapedList += [] as IIngredient[];
        shapedList[y] = shapedList[y] + opts[row[x]];
      }
    }
    return shapedList;
  }


  # Return flatten list of ingredients to use in shapeless recipe
  function shapeless(includeNulls as bool = false) as IIngredient[] {
    var cached = includeNulls ? shapelessList_wNulls : shapelessList;
    if (!isNull(cached)) return cached;

    # Make ingredients list from string grid
    if(includeNulls) shapelessList_wNulls = []; else shapelessList = [];
    for y, row in map {
      if(row.length==0) continue;
      for x in 0 to row.length {
        # Add ingredient in list
        var ingr = opts[row[x]];
        if (includeNulls || !isNull(ingr)) {
          if(includeNulls) shapelessList_wNulls += ingr; else shapelessList += ingr;
        }
      }
    }
    return includeNulls ? shapelessList_wNulls : shapelessList;
  }

  # Return flatten list of ingredients but go for spiral from top ingredient
  # ↗ 🠾 ↘
  # ↑   ↓
  # ↖ ← ↙
  function spiral(rotateLeft as int = 0) as IIngredient[] {
    var result = [] as IIngredient[];

    # Start point
    val sx = X / 2;
    val sy = 0;

    # End point
    val ex = getCentralX();
    val ey = getCentralY();

    # One horisontal line
    if(Y == 1 || X == 1) {
      return shapeless();
    }

    var x = sx;
    var y = sy;

    # Direction of move
    val vectors = [[1,0],[0,1],[-1,0],[0,-1]] as int[][];
    var dir = 0;

    # Level of circle. 0 - outer, 1 deeper inside and so on
    var lvl = 0;

    var i = 0;
    while(true) {
      # Error ward
      i += 1;
      if(i > 99) {
        logger.logWarning('Grid.zs spiral() error!\n'~this.toString());
        return null;
      }

      var ingr = opts[get(x,y)];
      if(!isNull(ingr)) result += ingr;

      # Test move
      var v = vectors[dir];
      var nx = x + v[0];
      var ny = y + v[1];

      # Turn if out of bounds
      if(ny<lvl || nx<lvl || ny > Y - 1 - lvl || nx > X - 1 - lvl) {
        dir = (dir + 1) % 4;
        v = vectors[dir];
        nx = x + v[0];
        ny = y + v[1];
      }

      # Move if need to advance next level
      if((nx == sx) && (ny == sy + lvl)) {
        x = nx;
        y = ny + 1;
        lvl += 1;
      } else {
        x = nx;
        y = ny;
      }
      # End of Cycle
      if(x==ex && y==ey) {
        if(rotateLeft == 0) return result;

        # Rotate output if needed
        var newResult = [] as IIngredient[];
        val len = result.length;
        for i in 0 .. len {
          var index = (i + rotateLeft) % len;
          newResult += result[index >= 0 ? index : len + index];
        }
        return newResult;
      }
    }
    return null;
  }


  # Determine what ingredient is most important in this grid
  # Usually its a item in center of 2d grid
  function getMainIngredient() as IIngredient {
    if (!isNull(mainIngredient)) return mainIngredient;

    var sorted as string[] = [];

    # Spirally from center find list of ingredients
    /*
      ↙ ← ← ↖ ↑
      ↓ ↙ ↖ ↑ ↑
      ↓ ↓ ⇫ ↑ ↑
      ↓ ↘ → ↗ ↑
      ↘ → → → ↗
    */

    var x = 0;
    var y = 0;
    var dx = 1;
    var dy = 0;
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

    if(sorted.length <= 0) return null;

    var minUses = 999999;
    var minKey = sorted[0];
    for i,c in sorted {
      if (usesMap[c] < minUses) {
        minUses = usesMap[c] as int;
        minKey = c;
      }
    }
    return opts[minKey];
  }

  # Get joined grid string.
  # In other words - sequence of characters in appearing order
  function getOrder() as string {
    if(isNull(map) || isMapEmpty()) return '';
    var order = '';
    for y, row in map { order += row; }
    return order;
  }

  # Return string representation of grid
  function toString(_style as string[] = null) as string {
    val style as string[] = isNull(_style) ? [] : _style;

    val isDense     =  (style has "dense");
    val isShapeless =  (style has "shapeless");
    val isPretty    = !isShapeless && !isDense && !(style has "noPretty") && (X > 1 && Y > 1);
    val ln   = isDense ? "" : "\n";
    val dlim = (isDense ? ", " : ",") ~ ln;

    # "pretty" prefix
    var s = isShapeless?'"':"[";
    if(isPretty) s +='"pretty"' ~ dlim;
    else if(!isShapeless) s += ln;

    # 2d Grid
    if(isNull(map))
      s += "<no grid map>";
    else if(isMapEmpty())
      s += "<no grid letters match options>";
    else
      for y, row in map {
        if(isShapeless) {
          s += isNull(opts[" "]) ? row.replaceAll(" ", "") : row;
        } else {
          var l = "";
          if(y!=0) l = dlim;
          if(!isDense) l += "  ";
          l += serialize._string(isPretty
            ? row.replaceAll("(.)(?!$)", "$1 ")
            : row);
          s += l;
        }
      }
    s += isShapeless?'"':"]";

    # Add Ingredients Table
    if(!(style has "noMap") && !(style has "merged")) {
      val opts_s = isNull(opts)
        ? "<options is not provided>"
        : serialize.IIngredient_string_(opts, style, getOrder());
      s += ", {"~ln~ opts_s ~ln~ "}";
    }

    return s;
  }


  # Cut pre and leading nulls in map
  function trim() as Grid {
    var top = 0;
    var bottom = 0;
    var left = X;
    var right = X;
    val last = Y - 1;
    for y, row in map {
      if(y == top    &&           row.trim() == '') top += 1;
      if(y == bottom && map[last - y].trim() == '') bottom += 1;

      left  = min( left, row.length - row.replaceAll('^ +', '').length);
      right = min(right, row.length - row.replaceAll(' +$', '').length);
    }

    var newMap = [] as string[];
    for y in top .. (Y - bottom) {
      newMap += map[y].substring(left, X - right);
    }
    map = newMap;

    X = X - right - left;
    Y = Y - bottom - top;

    return this;
  }

  # Remove item from grid and count its amount
  function extractItem(id as string, default as int = 0) as int {
    var result = 0;

    for y in 0 .. Y {
      for x in 0 .. X {
        val ingr = getIngr(x, y);
        if(isNull(ingr)) continue;

        for item in ingr.itemArray {
          if(item.definition.id != id) continue;
          result += ingr.amount;
          remove(x, y);
        }
      }
    }

    return result != 0 ? result : default;
  }

  function extractByTag(keyPath as string, valuePath as string) as int[string] {
    var result as int[string] = {};
    for y in 0 .. Y {
      for x in 0 .. X {
        val ingr = getIngr(x, y);
        if(isNull(ingr)) continue;

        for item in ingr.itemArray {
          val d = D(item.tag);
          if(!d.check(keyPath)) continue;

          val key = d.getString(keyPath, '');
          if(key.length == 0) continue;

          val amount = ingr.amount * d.getInt(valuePath, 1);
          result[key] = amount;
          remove(x, y);
          break;
        }
      }
    }

    return result;
  }

  function extractByTagSerialize(keyPath as string, valuePath as string, serFn as function(string,int)string) as string {
    var result = '';
    var first = true;
    for k, v in extractByTag(keyPath, valuePath) {
      result ~= (first ? '' : ', ') ~ serFn(k, v);
      first = false;
    }
    return '['~result~']';
  }

  #------------------------------------------------------------------
  # Private Methods
  #------------------------------------------------------------------

  # Check if options have this key
  function hasOpt(c as string) as bool { return !isNull(opts) && !isNull(c) && !isNull(opts[c]); }


  # Get normalized grid character at [x,y]
  function get(x as int, y as int) as string {
    if(map.length > y && map[y].length > x) {
      return map[y][x];
    }
    return null;
  }

  function getIngr(x as int, y as int) as IIngredient {
    val c = get(x, y);
    if(isNull(c)) return null;
    return opts[c];
  }

  function getCentralX() as int { return X / 2;}
  function getCentralY() as int { return ((Y as float - 0.5f) / 2.0f) as int;}

  function getCentral() as IIngredient {
    return getIngr(getCentralX(), getCentralY());
  }

  # Set normalized grid character at [x,y]
  function set(x as int, y as int, c as string) as void {
    while(map.length - 1 < y) map += "";
    val row = map[y];
    if(x >= row.length) {
      while(map[y].length < x) map[y] = map[y] + " ";
      push(y, c);
      return;
    }
    map[y] =
      map[y].substring(0, x) ~ c ~
      map[y].substring(x + 1, map[y].length);
  }

  # Remove element (set to " ") and return it
  function remove(x as int, y as int) as IIngredient {
    val result = getIngr(x, y);
    if(!isNull(result)) set(x, y, ' ');
    return result;
  }

  # Push symbol at end of map in specified y
  function push(y as int, c as string) as void {
    map[y] = map[y] + c;

    if (hasOpt(c)) {
      if (isNull(usesMap[c])) uniqueIngredientsCount += 1;
      usesMap[c] = isNull(usesMap[c]) ? 1 : usesMap[c] + 1;
    }
  }

  # Get grid character at [x,y], recursively searching if command characters found
  function getRaw(x as int, y as int) as string { return getRaw(x, y, {}); }
  function getRaw(x as int, y as int, antiloop as bool[string]) as string {
    var c as string = get(x,y);

    if(!isNull(c) || mapRaw.length <= y || mapRaw[y].length <= x) return c;

    c = mapRaw[y][x];

    # Return if this letter used as key - it can't be command character
    if(hasOpt(c)) return c;

    # Check antiloop
    var key = x~"_"~y;
    if (!isNull(antiloop[key])) return null;
    antiloop[key] = true;

    # Mirror ingredient
    if (c == ".") {
      var mx = X - 1 - x;
      var my = Y - 1 - y;
      c = null;

      if (x!=mx)                       c = getRaw(mx,   y, antiloop);
      if (isNull(c) && y!=my)          c = getRaw( x,  my, antiloop);
      if (isNull(c) && y!=my && x!=mx) c = getRaw(mx,  my, antiloop);

    } else

    # Mirror diagonal ingredient
    if (c == "╲" || c == ",") {
      c = null;
      if (x!=y) c = getRaw(y, x, antiloop);
    }

    return c;
  }

  # Check if at last 1 character have mapped data
  function isMapEmpty() as bool {
    if (isNull(map)) return true;
    for y, row in map {
      if(row.length > 0) {
        for i in 0 to row.length {
          if(!isNull(opts[row[i]])) {
            return false;
          }
        }
      }
    }
    return true;
  }
}