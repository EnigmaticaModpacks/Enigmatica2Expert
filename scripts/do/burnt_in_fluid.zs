import crafttweaker.entity.IEntityItem;
import crafttweaker.world.IFacing;
import crafttweaker.block.IBlockState;

#loader crafttweaker reloadable

# Item and respective block
static burntRecipes as IBlockState[string] = {
  'mysticalagriculture:apatite_essence'     : <blockstate:forestry:resources>,
  'mysticalagriculture:black_quartz_essence': <blockstate:actuallyadditions:block_misc:type=ore_black_quartz>,
  'mysticalagriculture:redstone_essence'    : <blockstate:minecraft:redstone_ore>,
} as IBlockState[string];

// Dont forget to remove old recipes manually here
recipes.removeByRecipeName("mysticalagriculture:gemquartzblack");
recipes.removeByRecipeName("mysticalagriculture:gemapatite");
recipes.removeByRecipeName("mysticalagriculture:redstone");

for itemId, state in burntRecipes {
  val item = itemUtils.getItem(itemId);
  scripts.category.tooltip_utils.desc.both(
    item,
    "tooltips.lang.burn_in_fluid",
    item.displayName,
    <fluid:stone>.displayName
  );
  scripts.jei.crafting_hints.fill(
    item,
    <fluid:stone> * 1000,
    itemUtils.getItem(state.block.definition.id, state.meta)
  );
}

events.onEntityRemove(function(e as mods.zenutils.event.EntityRemoveEvent){
  val world = e.world;
  if(world.remote) return;
  if(!(e.entity instanceof IEntityItem)) return;

  val entityItem as IEntityItem = e.entity;
  if(isNull(entityItem.item)) return;

  val result = burntRecipes[entityItem.item.definition.id];
  if(isNull(result)) return;

  // Iterate block essence inside and under it (item can jump)
  for i in 0 .. 2 {
    // Get state
    val blockPos = entityItem.position.getOffset(IFacing.down(), i);
    val blockState = e.world.getBlockState(blockPos);

    // Check appropriate liquid
    if(blockState.block.definition.id != 'tconstruct:molten_stone') continue;
    if(blockState.meta != 0) continue;

    // Replace block
    world.destroyBlock(blockPos, false);
    world.setBlockState(result, blockPos);
    return;
  }
});