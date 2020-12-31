import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

#modloaded openblocks

val o = <actuallyadditions:block_misc:8>;

for i in 0 to 16 {
  val item1 = itemUtils.getItem("openblocks:elevator", i);
  val wool = <minecraft:wool>.definition.makeStack(i);
  if (!isNull(item1)) {
    recipes.remove(item1);
    recipes.addShaped(item1 * 4, [
      [wool  , wool  , wool],
      [wool  , o     , wool],
      [wool  , wool  , wool]]);
  }

  val item2 = itemUtils.getItem("openblocks:elevator_rotating", i);
  if (!isNull(item2)) {
    recipes.remove(item2);
    recipes.addShaped(item2 * 4, [
      [wool  , <ore:ingotFakeIron>  , wool],
      [wool  , o     , wool],
      [wool  , <ore:ingotFakeIron>  , wool]]);
  }
}

# Clear tanks
clearFluid(<openblocks:tank>);