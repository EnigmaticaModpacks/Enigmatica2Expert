import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

#modloaded openblocks

scripts.category.tooltip_utils.desc.tooltip(<openblocks:tank>);
scripts.category.tooltip_utils.desc.tooltip(<openblocks:builder_guide>, 'redstone.need');
scripts.category.tooltip_utils.desc.tooltip(<openblocks:guide>, 'redstone.need');

val o = <ore:ingotAlubrass>;

for i in 0 to 16 {
  val elevator = itemUtils.getItem("openblocks:elevator", i);
  val wool = <minecraft:wool>.definition.makeStack(i);
  if (!isNull(elevator)) {
    recipes.remove(elevator);
    recipes.addShaped(elevator, [
      [wool  , wool  , wool],
      [wool  , o     , wool],
      [wool  , wool  , wool]]);
    recipes.addShapeless('elevator coloring '~i, elevator, [
      <openblocks:elevator:*>, scripts.vars.oreDye[i]
    ]);
  }

  val rotating = itemUtils.getItem("openblocks:elevator_rotating", i);
  if (!isNull(rotating)) {
    recipes.remove(rotating);
    recipes.addShaped(rotating, [
      [wool  , <ore:ingotFakeIron>  , wool],
      [wool  , o     , wool],
      [wool  , wool  , wool]]);
    recipes.addShapeless('rotating coloring '~i, rotating, [
      <openblocks:elevator_rotating:*>, scripts.vars.oreDye[i]
    ]);
  }
}

# Tank recipe
recipes.removeShaped(<openblocks:tank>);
mods.inworldcrafting.ExplosionCrafting.explodeBlockRecipe(<openblocks:tank>, <enderio:block_omni_reservoir>);

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

# [Healer] from [Heart Crystal Shard][+1]
craft.remake(<openblocks:heal>, ["pretty",
  "  q  ",
  "q * q",
  "  q  "], {
  "q": <ore:quicksilver>,            # Quicksilver
  "*": <scalinghealth:crystalshard>, # Heart Crystal Shard
});

# [XP Drain] from [Aluminium Rod]
craft.remake(<openblocks:xp_drain>, ["pretty",
  "╱ ╱ ╱",
  "╱ ╱ ╱",
  "╱ ╱ ╱"], {
  "╱": <ore:stickAluminium>, # Aluminium Rod
});


# [Auto Anvil] from [Anvil][+2]
craft.remake(<openblocks:auto_anvil>, ["pretty",
  "▬ T ▬",
  "▬ A ▬"], {
  "▬": <ore:ingotFakeIron>, # Iron Alloy Ingot
  "T": <openblocks:tank>, # Tank
  "A": <minecraft:anvil>, # Anvil
});

# [XP Shower] from [Tempered Glass][+1]
craft.remake(<openblocks:xp_shower>, ["pretty",
  "▬ ▬ ▬",
  "T    "], {
  "▬": <ore:ingotFakeIron>, # Iron Alloy Ingot
  "T": <cyclicmagic:glass_strong>, # Tempered Glass
});

# [Crane Backpack] from [Hemp Rope Coil][+2]
craft.remake(<openblocks:crane_backpack>, [
  "▄",
  "H",
  "■"], {
  "▄": <chisel:factory:6>,                # Factory Block
  "H": <immersiveengineering:wirecoil:3>, # Hemp Rope Coil
  "■": <ore:blockFakeIron>, # Iron Alloy Block
});

<entity:openblocks:mini_me>.addDrop(<scalinghealth:crystalshard>, 4, 8);
