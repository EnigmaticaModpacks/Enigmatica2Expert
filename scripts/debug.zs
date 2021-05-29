#priority 3999

import mods.ctintegration.data.DataUtil;
import mods.ctintegration.util.RawLogger.logRaw as logRaw;
import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;

utils.DEBUG = true;


function serialize(str as string) as string {
  return str.replaceAll('"','\\\\"');
}

function logDebugData() {
  logRaw("{");
  logRaw('"all_items": {');
  for j, mod in loadedMods {
    if(mod.items.length == 0) continue;

    if(j!=0) logRaw("  ],");
    logRaw('  "'~mod.name~'": [');
    
    val last = mod.items.length - 1;
    for i, item in mod.items {
      val sNbt = isNull(item.tag) ? "" : DataUtil.toNBTString(item.tag);
      logRaw(
        '    ["'~serialize(item.displayName)~'","'
        ~ item.definition.id ~ (item.damage!=0 ? ':'~item.damage : '') ~ '"'
        ~ ',"'~serialize(sNbt)~'"'
        ~ "," ~ item.burnTime
        ~ ']' ~ (i==last ? '' : ',')
      );
    }
  }
  logRaw("  ]");
  logRaw("}");
  
  logRaw("}");
}


function logAdditionalDebugData(p as IPlayer) {
  val commandsToRun = [
    "/ct botania apothecary",
    "/ct botania brews",
    "/ct botania trades",
    "/ct botania infusions",
    "/ct botania daisy",
    "/ct botania altar",
    "/ct thaumcraftDump",
    // "/tellme dump-csv all",
    "/ct loottables all",
    "/ct oredict",
    "/ct recipes furnace",
    "/ct recipes",
    // "/ct names burntime",
  ] as string[];

  for cmd in commandsToRun {
    server.commandManager.executeCommand(server, cmd);
  }
}

zenClass DebugUtils {
  var once as bool = false;
  var second as bool = false;
  var timeMark as long = 0 as long;
	zenConstructor() { }

  function firstTime(time as long) as bool {
    if(once) return false;
    once = true;
    timeMark = time + 200 as long;
    return true;
  }

  function secondTime(time as long) as bool {
    if(second || timeMark > time) return false;
    second = true;
    return true;
  }
}
static debugUtils as DebugUtils = DebugUtils();

events.onPlayerLoggedIn(function(e as crafttweaker.event.PlayerLoggedInEvent){
  if(e.player.world.isRemote()) return;
  if(!debugUtils.firstTime(e.player.world.time)) return;
  logDebugData();
});

events.onPlayerTick(function(e as crafttweaker.event.PlayerTickEvent){
  if(e.player.world.isRemote()) return;
  if(!debugUtils.secondTime(e.player.world.time)) return;
  logAdditionalDebugData(e.player);
});