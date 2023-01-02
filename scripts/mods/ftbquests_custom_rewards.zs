#modloaded ftbquests
#loader crafttweaker reloadable

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

events.onCustomReward(function(e as mods.zenutils.ftbq.CustomRewardEvent) {
  /**
  * Endorse player with message to whole server as its finished chapter
  */
  if(e.reward.quest.tags has 'chapcomplete') {
    server.commandManager.executeCommand(server,
      '/say §l' ~ e.player.name ~
      '§r has fully completed the §n' ~ e.reward.quest.chapter.title ~
      '§r chapter after §l' ~ formatPlayTime(e.player) ~
      '§r of play!§r ```Congrats!```'
    );
  }

  /**
  * Conflux rewards
  */
  for k in 'i ii iii iv'.split(' ') {
    if(e.reward.tags has 'conflux_' ~ k) server.commandManager.executeCommand(server,
      '/ranks add ' ~ e.player.name ~ ' conflux_' ~ k
    );
  }
});

