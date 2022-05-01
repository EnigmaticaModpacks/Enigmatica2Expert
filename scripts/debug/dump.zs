/*

This file create debug environment for developing of modpack.
It should not exist in release version.

*/

#priority 3999

import crafttweaker.block.IBlock;
import crafttweaker.player.IPlayer;
import mods.ctintegration.data.DataUtil;
import mods.ctintegration.util.RawLogger.logRaw as logRaw;
import mods.zenutils.ZenUtils;
import mods.zenutils.DelayManager.addDelayWork as addDelayWork;


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
  ] as string[];

  for cmd in commandsToRun {
    server.commandManager.executeCommand(server, cmd);
  }
}

function exportAllBlocks() as void {
  print('##################################################');
  print('#          Harvest tool and level                #');
  for item in game.items {
    if(
      item.id.startsWith("avaritiafurnace:") // Blacklist because crashing otherwise
    ) continue;
    
    var lastMeta = -1 as int; // Remember, -1 is not integer by default
    for sub in item.subItems {
      if (lastMeta == sub.damage) continue;
      lastMeta = sub.damage;
      val block = sub.asBlock();
      if(isNull(block)) continue;

      val def = block.definition;
      val state = def.getStateFromMeta(block.meta);
      val tool = def.getHarvestTool(state);
      val harvLevel = def.getHarvestLevel(state);
      if(tool=="" && harvLevel == -1 as int) continue;
      print("<"~def.id~":"~block.meta~"> = "~def.hardness~":"~tool~":"~harvLevel);
    }
  }
  print('##################################################');
}

function exportAllTools() as void {
  print('##################################################');
  print('#                   Tools                        #');
  for def in game.items {
    var lastDef = '';
    for item in def.subItems {
      if(!(item.isDamageable && item.maxStackSize==1 && item.maxDamage > 1)) continue;

      if (lastDef == item.definition.id) continue;
      lastDef = item.definition.id;
      
      print(item.maxDamage ~' '~ item.definition.id);
    }
  }
  print('##################################################');
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

  addDelayWork(function() {
    e.player.sendMessage('§cDebug environment activated!');
    e.player.sendMessage('§8If you want to disable DEBUG mode, remove §7scripts/debug§8 directory');
  }, 20);

  addDelayWork(function() {
    e.player.sendMessage('Developing: §cCreating crafttweaker_raw.log');
    logDebugData();
  }, 20 * 10);

  addDelayWork(function() {
    e.player.sendMessage('Developing: §c/logAdditionalDebugData()');
    logAdditionalDebugData(e.player);
  }, 20 * 20);

  addDelayWork(function() {
    e.player.sendMessage('Developing: Starting §c/ct conflict');
    server.commandManager.executeCommand(server, '/ct conflict');
  }, 20 * 40);

  addDelayWork(function() {
    e.player.sendMessage('Developing: Starting §c/tellme dump-csv all');
    server.commandManager.executeCommand(server, '/tellme dump-csv all');
  }, 20 * 80);

  addDelayWork(function() {
    e.player.sendMessage('Developing: Starting §c/ct loottables all');
    server.commandManager.executeCommand(server, '/ct loottables all');
  }, 20 * 100);

  addDelayWork(function() {
    e.player.sendMessage('Developing: Starting §cexport to crafttweaker.log');
    exportAllBlocks();
    exportAllTools();
  }, 20 * 120);

  addDelayWork(function() {
    e.player.sendMessage('Developing: §aFinished!');
  }, 20 * 130);
});




print('##################################################');
print('#       Unchanged Crafting Table recipes         #');
for i,r in recipes.all {
  if(isNull(r.name) || isNull(r.output)) continue;
  print(r.commandString);
}
print('##################################################');

// Every Furnace recipe before any changes
print('##################################################');
print('#         Unchanged furnace recipes dump         #');
for r in furnace.all {
  print(r.commandString);
}
print('##################################################');


