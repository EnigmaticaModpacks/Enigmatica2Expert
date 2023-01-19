import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.ctutils.utils.Math.log;
import mods.ctutils.utils.Math.sqrt;
import mods.ctutils.utils.Math.max;
import mods.ctutils.utils.Math.min;

#modloaded rats

# Garbage Pile recipe based on various item parameters
val ph = <contenttweaker:any_different_item>.withLore([game.localize("e2ee.garbage.affect_output_amount")]);
recipes.addShapeless("Garbage_placeholder", <rats:garbage_pile> * 6, [<rats:contaminated_food>,ph,ph,ph,ph,ph,ph,ph,ph,]);

# Dirt       - 0.5 = 0
# Obsidian   - 50 = 0.6
# Maze Stone - 100 = 0.9
function getValue_hardness    (a as IItemStack) as double { return max(0.0d, (sqrt(a.hardness as double + 1.0d) - 1.0d) / 3.0d); }

function getValue_harvestLevel(a as IItemStack) as double { return !isNull(a.asBlock()) && !isNull(a.asBlock().definition) ? a.asBlock().definition.harvestLevel as double / 10.0d : 0.0d; }

# Wood Log     - 300    = 0.05
# Coal Block   - 16000  = 0.25
# Blasted Coal - 120000 = 0.5
# Trpl. Chrc   - 256000 = 0.65
function getValue_burnTime    (a as IItemStack) as double { return max(0.0d, sqrt(sqrt(1.0d + a.burnTime as double / 80.0d)) - 1.0d) / 10.0d; }

# 1 = 0.2
# 3 = 0.8
# 5 = 3.2
function getValue_enchantments(a as IItemStack) as double { return (!isNull(a.enchantments) && a.enchantments.length > 0 ? pow(2, a.enchantments.length) as double : 0.0d) / 5.0d; }

function getValue_toolClasses (a as IItemStack) as double { return (!isNull(a.toolClasses)  && a.toolClasses.length  > 0 ? a.toolClasses.length as double : 0.0d) / 10.0d; }

# Get input item multiplication value
# Maximum value would be `x^8 = 64, x= 2^(3/4) ~~ 1.68`, about 0.168 each property
function getItemMults(a as IItemStack) as double {
  var v = 1.0d;

  v += getValue_hardness(a);
  v += getValue_harvestLevel(a);
  v += getValue_burnTime(a);
  v += getValue_enchantments(a);
  v += getValue_toolClasses(a);
  if(a.maxStackSize != 64 || !a.isStackable) v+=0.2d;
  if(a.hasTag)                               v+=0.2d;
  if(a.isDamageable)                         v+=0.3d;
  if(a.definition.owner == "minecraft")      v-=0.1d;
  if(a.isItemBlock)                          v-=0.1d;

  return v;
}

recipes.addHiddenShapeless("Garbage_function", <rats:garbage_pile>, [
  <rats:contaminated_food>.marked("m8"),
  <*>.marked("m0"),
  <*>.marked("m1"),
  <*>.marked("m2"),
  <*>.marked("m3"),
  <*>.marked("m4"),
  <*>.marked("m5"),
  <*>.marked("m6"),
  <*>.marked("m7")
], function(out, ins, cInfo) {

  # Check unique
  for i in 0 to 8 {
    val a = ins["m"~i];
    if(isNull(a)) return null;
    for j in (i+1) to 9 {
      val b = ins["m"~j];
      if(isNull(b)) return null;
      if (a has b || b has a) {
        return null; # Ingredient duplicate
      }
    }
  }

  # Calculate how much garbage
  var amount = 1.0d;
  for i in 0 to 9 {
    val item = ins["m"~i];
    if (<rats:contaminated_food> has item) continue;
    amount *= getItemMults(item);
  }

  return amount > 64
    ? <contenttweaker:compressed_garbage_pile> * min(64, (amount as double / 9.0d) as int)
    : out * max(1, min(64, amount as int));
}, null);