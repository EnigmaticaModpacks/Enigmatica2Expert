#priority 1

import crafttweaker.entity.IEntityItem;
import crafttweaker.world.IFacing;
import crafttweaker.block.IBlockState;

#loader crafttweaker reloadable

// Manually add this when adding new liquids
static fluidToBlock as string[string] = {
  stone: 'tconstruct:molten_stone',
  base_essence: 'mysticalagradditions:molten_base_essence',
} as string[string];

# Item and respective block
static burntRecipes as IBlockState[string][string] = {} as IBlockState[string][string];

function add(inputId as string, fluidInput as string, blockOutput as IBlockState) as void {
  if (isNull(burntRecipes[inputId])) burntRecipes[inputId] = {};
  burntRecipes[inputId][fluidInput] = blockOutput;
}

function postInit() as void {
  for itemId, tuple in burntRecipes {
    val item = itemUtils.getItem(itemId);
    for fluid, state in tuple {
      val f = game.getLiquid(fluid);
      scripts.lib.tooltip.desc.both(
        item,
        "burn_in_fluid",
        item.displayName,
        f.displayName
      );
      scripts.jei.crafting_hints.fill(
        item,
        f * 1000,
        itemUtils.getItem(state.block.definition.id, state.meta)
      );
    }
  }
}

events.onEntityRemove(function(e as mods.zenutils.event.EntityRemoveEvent){
  val world = e.world;
  if(world.remote) return;
  if(!(e.entity instanceof IEntityItem)) return;

  if(!e.entity.isBurning) return;

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
    if(blockState.meta != 0) continue;

    for fluid, state in result {
      if(blockState.block.definition.id != fluidToBlock[fluid]) continue;

      // Replace block
      world.destroyBlock(blockPos, false);
      world.setBlockState(state, blockPos);
      return;
    }
  }
});