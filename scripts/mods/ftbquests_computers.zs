#modloaded ftbquests opencomputers
#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;

static playersTasks as bool[string][string] = {} as bool[string][string];

events.onCustomTask(function(e as mods.zenutils.ftbq.CustomTaskEvent) {
  for tag in ['robotuse', 'robotswing'] as string[] {
    if (e.task.hasTag(tag)) {
      e.checkTimer = 20;
      if (isNull(playersTasks[tag])) playersTasks[tag] = {} as bool[string];
      e.checker = function(player, currentProgress) {
        if (
          isNull(playersTasks[tag])
          || isNull(playersTasks[tag][player.name])
          || !(playersTasks[tag][player.name] as bool)
        ) return 0;

        playersTasks[tag][player.name] = false;
        for name, exist in playersTasks[tag] { if(exist as bool) return 1;}
        playersTasks[tag] = null;
        return 1;
      };
    }
  }
});

function getOwnerName(robotName as string) as string {
  return robotName.replaceAll('\\.robot$', '');
}

function isHavePlayer(playerName as string) as bool {
  for p in server.players {
    if(p.name == playerName) return true;
  }
  return false;
}

function checkEvent(robot as IPlayer, tag as string) as void {
  if(robot.world.remote) return;
  if(!robot.name.endsWith('.robot')) return;
  if(!isNull(playersTasks[tag])) {
    val ownerName = getOwnerName(robot.name);
    if(isHavePlayer(ownerName)) {
      playersTasks[tag][ownerName] = true;
    }
  }
}

events.onPlayerInteract(function(e as crafttweaker.event.PlayerInteractEvent) {
  checkEvent(e.player, 'robotuse');
});

events.onPlayerAttackEntity(function(e as crafttweaker.event.PlayerAttackEntityEvent) {
  checkEvent(e.player, 'robotswing');
});

events.onPlayerBreakSpeed(function(e as crafttweaker.event.PlayerBreakSpeedEvent) {
  checkEvent(e.player, 'robotswing');
});
