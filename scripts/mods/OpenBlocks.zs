import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

#modloaded openblocks

scripts.category.tooltip_utils.desc.tooltip(<openblocks:tank>);
scripts.category.tooltip_utils.desc.tooltip(<openblocks:builder_guide>, 'redstone.need');
scripts.category.tooltip_utils.desc.tooltip(<openblocks:guide>, 'redstone.need');

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

# Tank recipe
recipes.removeShaped(<openblocks:tank>);
scripts.wrap.inworldcrafting.ExplosionCrafting.explodeBlockRecipe(<openblocks:tank>, <enderio:block_omni_reservoir>);

# Clear tanks
utils.clearFluid(<openblocks:tank>);

# OpenBlocks Glider
recipes.remove(<openblocks:generic>);
recipes.remove(<openblocks:hang_glider>);

recipes.addShapedMirrored("Glider Wings", 
<openblocks:generic>, 
[[<harvestcraft:hardenedleatheritem>, <forestry:oak_stick>, null],
[<harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>, <forestry:oak_stick>], 
[<harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>]]);

recipes.addShapedMirrored("Hang Glider", 
<openblocks:hang_glider>, 
[[null, null, null],
[<openblocks:generic>, <forestry:oak_stick>, <openblocks:generic>], 
[null, null, null]]);