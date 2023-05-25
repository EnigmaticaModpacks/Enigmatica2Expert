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
#                      chance blockOutput fluidId inputId
static burntRecipes as double[IBlockState][string][string]
               = {} as double[IBlockState][string][string];

function add(inputId as string, blockOutput as IBlockState, fluidId as string = 'stone', chance as double = 1.0) as void {
  if(blockOutput.block.definition.id == 'minecraft:air') {
    logger.logWarning("[Burn In Fluid] Failed to add recipe since block is Air. inputId: " ~ inputId
      ~ " blockOutput: " ~ blockOutput.commandString
      ~ " fluidId: " ~ fluidId
      ~ " chance: " ~ chance
    );
    return;
  }

  if (isNull(burntRecipes[inputId])) burntRecipes[inputId] = {};
  if (isNull(burntRecipes[inputId][fluidId])) burntRecipes[inputId][fluidId] = {};
  burntRecipes[inputId][fluidId][blockOutput] = chance;
}

// This function should be called once
// warding `/ct reload`
function postInit() as void {
  for inputId, tuple in burntRecipes {
    val item = itemUtils.getItem(inputId);
    if(isNull(item)) {
      logger.logWarning("[Burn In Fluid] Cannot find item for input: " ~ inputId);
      continue;
    }
    for fluidId, stateChance in tuple {
      for state, chance in stateChance {
        val f = game.getLiquid(fluidId);
        scripts.lib.tooltip.desc.both(
          item,
          chance >= 1.0 ? 'burn_in_fluid' : 'burn_in_fluid_chance',
          item.displayName,
          f.displayName
        );

        val blockAsItem = itemUtils.getItem(state.block.definition.id, state.meta);
        if(isNull(blockAsItem)) {
          logger.logWarning("[Burn In Fluid] Cannot convert block to item <" ~ state.block.definition.id ~ ":" ~ state.meta ~ ">");
          continue;
        }
        scripts.jei.crafting_hints.fill(
          item * ((1.0 / chance + 0.00001) as int),
          f * 1000,
          blockAsItem
        );
      }
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

    for fluid, stateChance in result {
      for state, chance in stateChance {
        if(blockState.block.definition.id != fluidToBlock[fluid]) continue;

        val total = chance * entityItem.item.amount as double;
        if(total < 1.0 && total < world.random.nextDouble()) {
          // Conversion failure
          utils.spawnParticles(e.entity, 'fallingdust', e.entity.x, e.entity.y+0.5, e.entity.z, 0.1, 0.4, 0.1,0, 6);
          continue;
        }

        // Replace block
        world.destroyBlock(blockPos, false);
        world.setBlockState(state, blockPos);
        return;
      }
    }
  }
});