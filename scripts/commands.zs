import mods.zenutils.command.ZenCommand;
import mods.zenutils.command.CommandUtils;
import mods.zenutils.command.IGetTabCompletion;
import mods.zenutils.StringList;
import mods.zenutils.I18n;
import mods.zenutils.ZenUtils;

######################################################
# Helper commands for localization
######################################################

val lang as ZenCommand = ZenCommand.create("lang");
lang.getCommandUsage = function(sender) {
  return "commands.lang.usage"; // return localization key
};

val tabCompletion as IGetTabCompletion = function(server, sender, pos) {
  return StringList.create([
    "hand"
  ]);
};

lang.requiredPermissionLevel = 0; // require no permission, everyone can execute the command.
lang.tabCompletionGetters = [tabCompletion];
lang.execute = function(command, server, sender, args) {
  val pl = CommandUtils.getCommandSenderAsPlayer(sender);

  if (args.length == 0) {
    val invLength = pl.inventorySize;
    var s = "Lang keys and translations:";
    var s_len = 0;
    for i in 0 to invLength {
      val it = pl.getInventoryStack(i);
      if (!isNull(it)) {
        s += "\n" ~ it.definition.name ~ "=" ~ it.displayName;
        s_len += 1;
      }
    }
    if(s_len>0) {
      print(s);
      pl.sendChat(I18n.format(game.localize("commands.lang.output"), s_len~""));
    } else {
      pl.sendChat(game.localize("commands.lang.empty"));
    }
  } else if (args[0] == "hand") {
    val it = pl.currentItem;
    if (!isNull(it)) {
      print(
        "Lang key and translation:" ~ "\n" ~ 
        it.definition.name ~ "=" ~ game.localize(it.definition.name)
      );
      pl.sendChat(game.localize("commands.lang.hand"));
    }
  } else {
    CommandUtils.notifyWrongUsage(command, sender);
  }
};
lang.register();