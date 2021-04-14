#priority 3999

import mods.ctintegration.data.DataUtil;
import mods.ctintegration.util.RawLogger.logRaw as logRaw;
import crafttweaker.data.IData;

utils.DEBUG = true;


function serialize(str as string) as string {
  return str.replaceAll('"','\"');
}

function logDebugData() {
  logRaw("~~ All items list");
  logRaw("{");
  for mod in loadedMods {
    val haveItems = mod.items.length > 0;
    
    if(haveItems) logRaw('"'~mod.name~'": [');
    
    val last = mod.items.length - 1;
    for i, item in mod.items {
      val sNbt = isNull(item.tag) ? "" : serialize(DataUtil.toNBTString(item.tag));
      logRaw(
        '["'~serialize(item.displayName)~'","'~
        item.definition.id ~ '",' ~ item.damage ~ 
        (sNbt=="{}"?'':',"'~sNbt~'"') ~ ']' ~ (i==last ? '' : ',')
      );
    }

    if(haveItems) logRaw("],");
  }
  logRaw("}");
  logRaw("~~ End of All items list");

  logRaw("");
  logRaw("~ Furnace Recipes:");
  for rec in furnace.all {
    logRaw(
      rec.input .commandString ~ "~~" ~ 
      rec.output.commandString ~ "~~" ~ 
      rec.xp
    );
  }
}

static playerLogged as bool[string] = {} as bool[string];

events.onPlayerLoggedIn(function(e as crafttweaker.event.PlayerLoggedInEvent){
  if(e.player.world.isRemote()) return;
  if(!isNull(playerLogged["yes"])) return;

  playerLogged["yes"] = true;
  logDebugData();
});