#modloaded tombmanygraves

/*

Idea taken from DJ2 modpack

*/

// Remove the TMG Death List from the inventory and drop it on the ground. This prevents a nested NBT issue.
scripts.lib.tooltip.desc.both(<tombmanygraves:death_list>, "dropper_into_world");

// Doesnt get called if keepInventory is true, so we dont have to factor that possibility in.
events.onPlayerDeathDrops(function(e as crafttweaker.event.PlayerDeathDropsEvent) {
  var drops = [] as crafttweaker.entity.IEntityItem[];
  for item in e.items {
    // If its a Death List, spawn the item as an entity in-world. Otherwise, keep it in the droplist.
    if (item.item.definition.id == "tombmanygraves:death_list") e.player.world.spawnEntity(item);
    else drops += item;
  }
  e.items = drops;
});
