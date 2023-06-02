#modloaded endreborn
#reloadable
#norun

import crafttweaker.world.IFacing;

events.onPlayerInteract(function(e as crafttweaker.event.PlayerInteractEvent){
  server.commandManager.executeCommand(server, '/say §aEnter event');
  val world = e.world;
  if(world.remote) return;
  server.commandManager.executeCommand(server, '/say §aDef:'~e.block.definition.id);
  if(isNull(e.block) || !(e.block.definition.id == "endreborn:dragon_essence")) return;
  val pos = crafttweaker.util.Position3f.create(e.x, e.y, e.z).asBlockPos();
  val state = world.getBlockState(pos);
  server.commandManager.executeCommand(server, '/say §aMeta:'~state.meta);
  if(state.meta < 3) return;

  world.spawnEntity(<endreborn:death_essence>.createEntityItem(world, pos));
  world.setBlockState(<blockstate:endreborn:dragon_essence>, pos);
});