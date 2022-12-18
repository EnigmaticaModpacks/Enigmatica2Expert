
#loader crafttweaker reloadableevents

events.onBlockHarvestDrops(function(e as crafttweaker.event.BlockHarvestDropsEvent) {
  if(isNull(e.player) || isNull(e.player.world) || e.player.world.remote) return;
  if(isNull(e.player.currentItem)) return;
  if(e.silkTouch || e.dropChance <= 0 || isNull(e.drops) || e.drops.length != 1) return;

  if(<ore:stickWood> has e.player.currentItem && <ore:slabWood> has e.drops[0].stack) {
    val blockPos = crafttweaker.util.Position3f.create(e.x, e.y, e.z).asBlockPos();
    e.world.setBlockState(<blockstate:minecraft:fire>, blockPos);
    e.player.currentItem.mutable().shrink(1);
    e.drops = [];
    return;
  }
});

events.onPlayerBreakSpeed(function(e as crafttweaker.event.PlayerBreakSpeedEvent) {
  if(isNull(e.player) || isNull(e.player.world) || e.player.world.remote) return;
  if(isNull(e.player.currentItem)) return;

  if(e.player.currentItem.definition.id != 'minecraft:stick') return;

  val blockItem = itemUtils.getItem(e.block.definition.id);
  if(isNull(blockItem) || isNull(blockItem.ores) || blockItem.ores.length <= 0 || !(blockItem.ores has <ore:slabWood>)) return;

  utils.spawnParticles(e.player.world, 'smoke', 0.5+e.x, 0.5+e.y, 0.5+e.z, 0.2, 0.1, 0.2, 0.01, 2);
  e.player.currentItem.mutable().shrink(1);
});
