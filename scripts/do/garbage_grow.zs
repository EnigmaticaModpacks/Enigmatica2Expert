/*

Garbage piles should grow when you drop items on top of them

Ideas:
- Drop items on top of garbage multiblock pile
- Multiblocks grows up and wide randomly
- Growth depends on dropped item value
- Dropping same item over and over descrease efficiency
  > maybe by turning Garbage into Gravel

*/

#modloaded zenutils
#reloadable
#norun

events.onEntityItemFall(function(e as mods.zenutils.event.EntityItemFallEvent) {
  val entity = e.item;
  if(entity.world.remote) return;
  val pos = entity.position;
  server.commandManager.executeCommand(
    server,
    '/say §8onEntityItemFall §6' ~ 
    e.blockState.block.commandString()
  );
});
