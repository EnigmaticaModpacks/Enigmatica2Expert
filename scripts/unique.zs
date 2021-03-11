import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

#priority 3000

zenClass Unique {
  // Public fields
  var index as int = 0;

  // Static Fields
  var inputs as IIngredient[] = [];
  var positions as int[] = [];

  zenConstructor(_inputs as IIngredient[]) {
    inputs = _inputs;
    for i in 0 .. inputs.length { positions += i; }
  }

  // Public Function
  function next() as IIngredient[][] {

    index += 1;

    val map = [
      [null, null, null],
      [null, null, null],
      [null, null, null]
    ] as IIngredient[][];

    for i, pos in positions {
      val x as int = pos % 3;
      val y = (pos / 3) as int;
      map[y][x] = inputs[i];
    }
    shiftGroup(positions, inputs.length - 1);

    return map;
  }

  // Private Function
  function shiftGroup(a as int[], n as int) as void {
    a[n] = a[n] + 1;
    if(a[n] <= (9 - inputs.length) + n) return;

    if(n == 0) {
      a[0] = 0;
      return;
    }
    shiftGroup(a, n - 1);
    a[n] = a[n - 1] + 1;
  }
}