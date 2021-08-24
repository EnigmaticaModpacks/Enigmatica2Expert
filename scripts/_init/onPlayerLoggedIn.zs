
#priority -1
#loader crafttweaker reloadableevents

import crafttweaker.data.IData;
import mods.ctintegration.advancement.AdvancementHelper;

events.onPlayerLoggedIn(function(e as crafttweaker.event.PlayerLoggedInEvent){
  if(e.player.world.isRemote()) return;

  var data as IData = e.player.data.PlayerPersisted;
  if(!isNull(data) && !isNull(data.loggedIn)) return;
  e.player.update({PlayerPersisted : {loggedIn : true as bool}});
  
  // # Methods called always:
  // print("~~~ Player logged in event");
  // for adv_id in [
  //   "iceandfire:iceandfire/root",
  //   "rats:rats/root",
  //   "betteranimalsplus:root",
  // ] as string[] {
  //   val adv = AdvancementHelper.getAdvancementById(server, adv_id);
  //   if(isNull(adv)) continue;
    
  //   val adv_progress = e.player.getAdvancementProgress(adv);
  //   if(isNull(adv_progress)) continue;
  //   adv_progress.setCompleted();
  //   utils.log(["Advancement forcedly completed:", adv_id]);
  // }

  # For first login
  if(e.player.world.getWorldType() == "voidworld") {
    e.player.addGameStage("skyblock");
  } else {
    e.player.addGameStage("normal_world");
  }


  # This methods wont be called in debug invironment:
  if(utils.DEBUG) return;
  server.commandManager.executeCommand(server, "/bq_admin default load");
  server.commandManager.executeCommand(server, "/bqs_loot default load");
});