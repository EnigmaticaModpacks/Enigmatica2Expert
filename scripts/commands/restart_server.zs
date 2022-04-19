
import mods.zenutils.command.CommandUtils;
import mods.zenutils.command.IGetTabCompletion;
import mods.zenutils.command.ZenCommand;
import mods.zenutils.StringList;
import crafttweaker.player.IPlayer;
import mods.zenutils.DelayManager.addDelayWork;
import mods.zenutils.I18n;

static playerPending as StringList = StringList.empty();
static inProcess as string[string] = {};

val cmd as ZenCommand = ZenCommand.create("restart_server");
cmd.getCommandUsage = function(sender) {return "commands.restart_server.usage";};

function sendSingle(player as IPlayer, key as string, substr as string = null) as void {
  val line = game.localize("commands.restart_server."~key);
  if (isNull(substr)) return player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation(line));
  player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation(line, substr));
}

function send(key as string, mode as string = 'everyone', substr as string = null) as void {
  for player in server.players {
    if (mode=='pending'   && !playerPending.contains(player.uuid)) continue;
    if (mode=='unpending' &&  playerPending.contains(player.uuid)) continue;
    sendSingle(player, key, substr);
  }
}

function stopWithDelay() as void {
  inProcess['restart'] = 'true';
  send('delay');

  addDelayWork(function() {
    send('stopping');
    server.commandManager.executeCommand(server, '/stop');
  }, 60);
}

function pendingCount() as int {
  var k = 0;
  for s in playerPending {
    k += 1;
  }
  return k;
}

function getPlayersList(isVoted as bool = false) as string {
  var list = '';
  for p in server.players {
    if(playerPending.contains(p.uuid) == isVoted)
      list ~= (list!=''?', ':'') ~ '§5'~ p.name ~'§r';
  }
  return list;
}

function clearPending() as void {
  for s in playerPending { playerPending.remove(s); }
}

function cancelVoting() as void {
  if(!isNull(inProcess.restart)) return;
  send('failed', 'pending', getPlayersList());
  send('cancelled', 'unpending');
  clearPending();
}

function checkComplete() as bool {
  for p in server.players {
    if (!playerPending.contains(p.uuid)) return false;
  }
  return true;
}

cmd.requiredPermissionLevel = 0; // require no permission, everyone can execute the command.
cmd.execute = function(command, server, sender, args) {
  val player = CommandUtils.getCommandSenderAsPlayer(sender);

  // Server already restarting
  if(!isNull(inProcess.restart)) return sendSingle(player, 'in_process');

  // Only one player - stop right now
  if (server.playerCount == 1) return stopWithDelay();

  if (pendingCount() == 0) {
    // We are first player who activated
    playerPending.add(player.uuid);
    send('query', 'unpending', player.name);
    
    addDelayWork(function() { cancelVoting(); }, 300);
  } else if (playerPending.contains(player.uuid)) {
    // We are already waiting for vote
    sendSingle(player, 'already_voted', getPlayersList());
  } else {
    playerPending.add(player.uuid);
    if (checkComplete()) {
      // Everyone voted
      stopWithDelay();
    } else {
      // New player added in vote list
      send('awaiting', 'pending', getPlayersList(false));
      send('query', 'unpending', getPlayersList(true));
    }
  }
};
cmd.register();