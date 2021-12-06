
#priority -1
#loader crafttweaker reloadableevents

import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import mods.ctintegration.advancement.AdvancementHelper;

events.onPlayerLoggedIn(function(e as crafttweaker.event.PlayerLoggedInEvent){
  if(e.player.world.isRemote()) return;

  val data as IData = e.player.data.enigmatica;
  val logCount = (!isNull(data) && !isNull(data.logCount)) ? data.logCount.asInt() + 1 : 1;

  # First login ever
  if(logCount == 1) onFirstLogin(e);

  # Other logins
  e.player.update({enigmatica: {logCount: logCount}});
  onEachLogin(e, logCount);
  
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
});

function onFirstLogin(e as crafttweaker.event.PlayerLoggedInEvent) as void {
  if(e.player.world.getWorldType() == "voidworld" && !e.player.hasGameStage("skyblock")) {
    e.player.addGameStage("skyblock");
    showWithDelay(e.player, "tooltips.dim_stages.enter_skyblock");

    // Add Haste when player join Skyblock world for the first time
    e.player.addPotionEffect(<potion:minecraft:haste>.makePotionEffect(20*60*60*3, 3));
  } else {
    // e.player.addGameStage("normal_world");
  }
}

function onEachLogin(e as crafttweaker.event.PlayerLoggedInEvent, logCount as int) as void {
  # This methods wont be called in debug invironment:
  if(!utils.DEBUG) {
    server.commandManager.executeCommand(server, "/bq_admin default load");
    server.commandManager.executeCommand(server, "/bqs_loot default load");
  }

  if(logCount == 2 && e.player.hasGameStage("skyblock")) {
    showWithDelay(e.player, "tooltips.dim_stages.remind_skyblock");
  }
}

function showWithDelay(player as IPlayer, lang as string) {
  mods.zenutils.DelayManager.addDelayWork(function() {
    player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation(lang));
  }, 20 * 10);
}