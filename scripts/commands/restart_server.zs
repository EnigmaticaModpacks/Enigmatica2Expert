
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import mods.zenutils.command.CommandUtils;
import mods.zenutils.command.IGetTabCompletion;
import mods.zenutils.command.ZenCommand;
import mods.zenutils.I18n;
import mods.zenutils.StringList;

static playerPending as StringList = StringList.empty();
static inProcess as string[string] = {};

val cmd as ZenCommand = ZenCommand.create("restart_server");
cmd.getCommandUsage = function(sender) {return "commands.restart_server.usage";};

function sendSingle(player as IPlayer, key as string, substr as string = null) as void {
  val langKey = game.localize("commands.restart_server."~key);
  if (isNull(substr)) return player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation(langKey));
  player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation(langKey, substr));
}

function send(key as string, mode as string = 'everyone', substr as string = null) as void {
  for player in server.players {
    if (mode=='pending'   && !playerPending.contains(player.uuid)) continue;
    if (mode=='unpending' &&  playerPending.contains(player.uuid)) continue;
    sendSingle(player, key, substr);
  }
}

function stopWithDelay(world as IWorld) as void {
  inProcess['restart'] = 'true';
  send('delay');

  world.catenation().sleep(60).then(function(world, ctx) {
    // send('stopping');
    server.commandManager.executeCommand(server, '/say §8[§6ø§8]§r §4Server stopping by vote...');
    server.commandManager.executeCommand(server, '/stop');
  }).start();
}

function getPlayersList(isVoted as bool = false) as string {
  var list = '';
  for p in server.players {
    if(playerPending.contains(p.uuid) == isVoted)
      list ~= (list!=''?', ':'') ~ '§5'~ p.name ~'§r';
  }
  return list;
}

function cancelVoting() as void {
  if(!isNull(inProcess.restart)) return;
  send('failed', 'pending', getPlayersList());
  send('cancelled', 'unpending');
  playerPending.clear();
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
  if (server.playerCount == 1) return stopWithDelay(player.world);

  if (playerPending.size() == 0) {
    // We are first player who activated
    playerPending.add(player.uuid);
    sendSingle(player, 'you_want', 300 / 20);
    send('query', 'unpending', player.name);
    
    player.world.catenation().sleep(300).then(function(world, ctx) { cancelVoting(); }).start();
  } else if (playerPending.contains(player.uuid)) {
    // We are already waiting for vote
    sendSingle(player, 'already_voted', getPlayersList());
  } else {
    playerPending.add(player.uuid);
    if (checkComplete()) {
      // Everyone voted
      stopWithDelay(player.world);
    } else {
      // New player added in vote list
      send('awaiting', 'pending', getPlayersList(false));
      send('query', 'unpending', getPlayersList(true));
    }
  }
};
cmd.register();