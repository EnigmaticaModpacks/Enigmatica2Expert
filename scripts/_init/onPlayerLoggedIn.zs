
static alreadyRealoaded as string[string] = {};

events.onPlayerLoggedIn(function(e as crafttweaker.event.PlayerLoggedInEvent){
  if(utils.DEBUG) return;
  if(e.player.world.isRemote()) return;
  if(!isNull(alreadyRealoaded['defaults'])) return;

  server.commandManager.executeCommand(server, "/bq_admin default load");
  server.commandManager.executeCommand(server, "/bqs_loot default load");
  alreadyRealoaded['defaults'] = 'true';
});