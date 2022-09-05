
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
  if(logCount == 2 && e.player.hasGameStage("skyblock")) {
    showWithDelay(e.player, "tooltips.dim_stages.remind_skyblock");
  }
}

function showWithDelay(player as IPlayer, lang as string) {
  player.world.catenation().sleep(20 * 10).then(function(world, ctx) {
    player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation(lang));
  }).start();
}