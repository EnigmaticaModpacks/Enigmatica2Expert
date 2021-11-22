#priority -1
#loader crafttweaker reloadableevents

import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import crafttweaker.world.IWorld;


function loadBowl(e as crafttweaker.event.PlayerInteractBlockEvent) as void {
  val blockState = e.world.getBlockState(e.position);
  if(blockState != <blockstate:exnihilocreatio:block_barrel0>) return;
  val data = e.world.getBlock(e.position).data;
  if(
    isNull(data)
    || isNull(data.FluidName)
    || data.FluidName != "water"
    || isNull(data.Amount)
    || data.Amount != 1000
  ) return;

  val newData = data
    - "FluidName"
    - "Amount"
    - "mode"
    + {Empty: ""} as IData;

  e.world.setBlockState(blockState, newData, e.position);
  e.player.currentItem.mutable().shrink(1);
  e.player.give(<actuallyadditions:item_water_bowl>.withTag({lastY: e.player.y as int, lastX: e.player.x as int}));
}

function unloadBowl(e as crafttweaker.event.PlayerInteractBlockEvent) as void {
  val blockState = e.world.getBlockState(e.position);
  if(blockState != <blockstate:exnihilocreatio:block_barrel0>) return;
  val data = e.world.getBlock(e.position).data;
  if(
    isNull(data)
    ||!isNull(data.FluidName)
    ||!isNull(data.Amount)
    ||isNull(data.Empty)
  ) return;

  val newData = data
    - "Empty"
    + {FluidName: "water", Amount: 1000, mode: {name: "fluid"}} as IData;

  e.world.setBlockState(blockState, newData, e.position);
  e.player.currentItem.mutable().shrink(1);
  e.player.give(<minecraft:bowl>);
}

events.onPlayerInteractBlock(function(e as crafttweaker.event.PlayerInteractBlockEvent) {
  if(e.world.remote) return;

  if(<minecraft:bowl>.matches(e.player.currentItem)) return loadBowl(e);

  // Somehow, unloading barrel wont work, block state wont set
  // if(<actuallyadditions:item_water_bowl>.matches(e.player.currentItem)) return unloadBowl(e);
});