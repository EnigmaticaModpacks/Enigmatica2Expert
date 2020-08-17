
# Grid zenClass

**Grid** is wrapper for recipe 2d array.
Its receive an 2d list of string with 1 char keys and
map of key-Ingredient pairs

## Usage:

#### `Grid(gridStr as string[], options as IIngredient[string])`
Providing instance of grid class. `gridStr` can be any size, not just 3x3.
```zs
var grid = Grid([
  "ABA",
  "BCB",
  "ABA"], {
    A: <minecraft:gunpowder>,
    B: <minecraft:tnt>,
    C: <ore:sand>,
  });
```

#### `grid.shaped()`
Create an 2d array to use in shaped recipes
```zs
recipes.addShaped(output, grid.shaped() );
```

#### `grid.shapeless()`
Create an 1d array to use in shapeless recipes
```zs
recipes.addShapeless(output, grid.shapeless() );
```

#### `grid.getMainIngredient()`
Return `IIngredient` that grid think most important in craft. Usually, its less used item, closest to center of grid.

#### `grid.error`
Return error string if something wrong (for example if grid options have no keys listed in grid string array)
```zs
if (!isNull(grid.error))
  logger.logWarning("Grid error: " ~grid.error);
```

#### `grid.toString(pretty as bool = true, normalized as bool = false)`
Return string representation of grid.
- If `pretty == true` (default) add space between each collumn
- If `normalized == true` shows normalized map with swapped control characters (see below)
```zs
var grid = Grid([
  "ABA",
  "╲C."], null);

print(grid.toString());
/* output:
A B A
╲ C .
*/

print(grid.toString(false));
/* output:
ABA
╲C.
*/

print(grid.toString(true, true));
/* output:
A B A
B C B
*/
```


## Advanced usage:

String array can contain special characters that mirror ingredients in different axes

- `" "` in string array means null
- `"."` try to find ingredients by mirroring:
  1. By vertical axis
  ```zs
  "   "    "   "
  "A ." => "A A"
  "   "    "   "
  ```
  2. By horisontal axis
  ```zs
  " A "    " A "
  "   " => "   "
  " . "    " A "
  ```
  3. Both axis
  ```zs
  " A  "    " A  "
  "B   " => "B   "
  "   ."    "   B"
  "  . "    "  A "
  ```
- `"╲"` or `","` try to find ingredients by mirroring around `x=y` axis:
  ```zs
  " A "    " A "
  "╲ ╲" => "A B"
  " B "    " B "
  ```