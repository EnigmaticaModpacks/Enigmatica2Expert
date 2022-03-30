
import mods.zenutils.command.CommandUtils;
import mods.zenutils.command.IGetTabCompletion;
import mods.zenutils.command.ZenCommand;

val addtooltip as ZenCommand = ZenCommand.create("addtooltip");
addtooltip.getCommandUsage = function(sender) {
  return "commands.addtooltip.usage";
};

addtooltip.requiredPermissionLevel = 0; // require no permission, everyone can execute the command.
addtooltip.execute = function(command, server, sender, args) {
  val player = CommandUtils.getCommandSenderAsPlayer(sender);

  if (isNull(player.currentItem) || player.currentItem.isEmpty)
    return player.sendChat(game.localize("commands.addtooltip.needitem"));

  if (args.length == 0 || args[0].matches('^\\s*$'))
    return player.sendChat(game.localize("commands.addtooltip.needtext"));
  
  val item = player.currentItem;
  val meta = item.isDamageable ? 0 : item.damage;
  val str = serialize.join(args, ' ');
  print("tooltips.lang."~item.definition.id~":"~meta~"="~str);

  if (item.hasTag) player.sendChat(game.localize("commands.addtooltip.notag"));
  
  player.sendChat(game.localize("commands.addtooltip.succes"));
};
addtooltip.register();