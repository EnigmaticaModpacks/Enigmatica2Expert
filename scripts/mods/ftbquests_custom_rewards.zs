#modloaded ftbquests
#reloadable

import crafttweaker.player.IPlayer;

function formatPlayTime(player as IPlayer) as string {
  val t = player.readStat(mods.zenutils.PlayerStat.getBasicStat("stat.playOneMinute")) as double;
  val days = t / (20.0 * 60.0 * 60.0 * 24.0);
  val hours= days * 24.0 - (days as int * 24);
  val mins = hours * 60.0 - (hours as int * 60);
  val secs = mins * 60.0 - (mins as int * 60);
  return(
    (days>=1?' '~days as int~'d':'')~
    (hours>=1?' '~hours as int~'h':'')~
    (mins>=1&&days<1?' '~mins as int~'m':'')~
    (secs>=1&&hours<1?' '~secs as int~'s':'')
  ).trim();
}

function notifyEveryone(player as IPlayer, langCode as string, title as string) as string {
  server.commandManager.executeCommand(server,
    '/say ' ~ mods.zenutils.I18n.format(
      game.localize(langCode),
      player.name,
      title,
      formatPlayTime(player)
    )
  );
}

events.onCustomReward(function(e as mods.zenutils.ftbq.CustomRewardEvent) {
  /**
  * Endorse player with message to whole server as its finished chapter
  */
  if(e.reward.tags has 'chapcomplete') {
    notifyEveryone(e.player, 'e2ee.chapter_complete', e.reward.quest.chapter.title);
  }

  /**
  * Conflux rewards
  */
  for k in 'i ii iii iv'.split(' ') {
    if(e.reward.tags has 'conflux_' ~ k) {
      server.commandManager.executeCommand(server,
        '/ranks add ' ~ e.player.name ~ ' conflux_' ~ k
      );

      notifyEveryone(e.player, 'e2ee.player_achieved', e.reward.quest.title);
    }
  }
});

events.onCustomTask(function(e as mods.zenutils.ftbq.CustomTaskEvent) {
  if (e.task.hasTag("skyblock")) {
    e.checker = function(player, currentProgress) {
      return player.hasGameStage("skyblock") ? 1 : 0;
    };
  }
});
