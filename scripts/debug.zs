/*

This file create debug environment for developing of modpack.
It should not exist in release version.

*/

#priority 3999
#loader crafttweaker reloadableevents

import crafttweaker.item.IItemStack;
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


function logAdditionalDebugData(player as IPlayer) {
  val commandsToRun = [
    "/ct botania apothecary",
    "/ct botania brews",
    "/ct botania trades",
    "/ct botania infusions",
    "/ct botania daisy",
    "/ct botania altar",
    "/ct thaumcraftDump",
    "/ct loottables all",
    "/ct oredict",
    "/ct recipes furnace",
    "/ct recipes",
    // "/ct names burntime",
    "/defaultoptions saveKeys",
    "/defaultoptions saveOptions",
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
}
static debugUtils as DebugUtils = DebugUtils();

events.onPlayerLoggedIn(function(e as crafttweaker.event.PlayerLoggedInEvent){
  if(e.player.world.isRemote()) return;
  if(!debugUtils.firstTime(e.player.world.time)) return;
  logDebugData();

  # Delayed call to not overload joining world
  mods.zenutils.DelayManager.addDelayWork(function() {
    e.player.sendMessage('Developing: §cCreating crafttweaker_raw.log');
    logDebugData();
  }, 20 * 10);

  mods.zenutils.DelayManager.addDelayWork(function() {
    e.player.sendMessage('Developing: §c/logAdditionalDebugData()');
    logAdditionalDebugData(e.player);
  }, 20 * 20);

  mods.zenutils.DelayManager.addDelayWork(function() {
    e.player.sendMessage('Developing: Starting §c/ct conflict');
    server.commandManager.executeCommand(server, '/ct conflict');
  }, 20 * 40);

  mods.zenutils.DelayManager.addDelayWork(function() {
    e.player.sendMessage('Developing: Starting §c/tellme dump-csv all');
    server.commandManager.executeCommand(server, '/tellme dump-csv all');
  }, 20 * 80);
});


function giveChest(player as IPlayer, items as IItemStack[]) as void {
  var tag = {
    BCTileData: {
      Items: []
    },
  } as IData;
  for i, item in items {
    tag = tag + {BCTileData: {Items: [item as IData + {Slot: i as short} as IData]}} as IData;
  }
  player.give(<draconicevolution:draconium_chest>.withTag(tag));
}

// events.onPlayerInteractBlock(function(e as crafttweaker.event.PlayerInteractBlockEvent){
//   if(e.player.world.isRemote()) return;
//   if(isNull(e.player.currentItem) || !(<minecraft:stick> has e.player.currentItem)) return;

  // var items = [] as IItemStack[];
  // for i,block in game.blocks {
  //   val ll = block.lightLevel;
  //   if(ll <= 0) continue;
  //   utils.log(ll, block.id);

  //   if(ll == 13) {
  //     val item = itemUtils.getItem(block.id);
  //     if(!isNull(item)) items += item;
  //   }
  // }
  // giveChest(e.player, items);
// });


// Every Furnace recipe before any changes
print('##################################################');
print('#         Unchanged furnace recipes dump         #');
for r in furnace.all {
  print(r.commandString);
}
print('##################################################');