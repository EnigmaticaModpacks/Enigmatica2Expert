/*

This file create debug environment for developing of modpack.
It should not exist in release version.

*/

#modloaded ctintegration

#priority 3999

import crafttweaker.block.IBlock;
import crafttweaker.player.IPlayer;
import mods.ctintegration.data.DataUtil;
import mods.ctintegration.util.RawLogger.logRaw as logRaw;
import mods.zenutils.ZenUtils;

function logAdditionalDebugData(player as IPlayer) {
  val commandsToRun = [
    "/ct thaumcraftDump",
    "/ct loottables all",
    "/ct oredict",
    "/ct recipes furnace",
    "/ct recipes",
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
      // Blacklist because crashing otherwise
      item.id.startsWith("avaritiafurnace:")
      || item.id.startsWith("bithop:screwhop")
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

// function exportAllTools() as void {
//   print('##################################################');
//   print('#                   Tools                        #');
//   for def in game.items {
//     var lastDef = '';
//     for item in def.subItems {
//       if(!(item.isDamageable && item.maxStackSize==1 && item.maxDamage > 1)) continue;

//       if (lastDef == item.definition.id) continue;
//       lastDef = item.definition.id;
      
//       print(item.maxDamage ~' '~ item.definition.id);
//     }
//   }
//   print('##################################################');
// }

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

static skipped as bool[] = [false] as bool[];
function runAutomation(player as IPlayer) as void {
  player.world.catenation().sleep(20).then(function(world, ctx) {
    player.sendMessage('Developing: §c/logAdditionalDebugData()');
    logAdditionalDebugData(player);
  })
  
  .sleep(100).then(function(world, ctx) {
    player.sendMessage('Developing: Starting §c/ct conflict');
    server.commandManager.executeCommand(server, '/ct conflict');
  })
  
  .sleep(100).then(function(world, ctx) {
    player.sendMessage('Developing: Starting §c/tellme dump-csv');
    val csvList = [
    //'players',                          # 132
      'musictypes',                       # 487
      'worldtypes',                       # 721
      'villagerprofessions',              # 993
      'dimensions',                       # 3043
      'biomes-id-to-name',                # 3500
      'enchantments',                     # 6068
      'mod-list',                         # 15616
      'creativetabs',                     # 18904
      'potions',                          # 19782
      'villagertrades',                   # 19866
      'biomes',                           # 22654
      'biomes-with-colors',               # 36765
      'items-plantable',                  # 39931
      'spawneggs',                        # 40757
      'soundevents',                      # 45314
      'commands',                         # 48369
      'entities',                         # 51703
      'potiontypes',                      # 55441
      'fluids',                           # 57399
      'player-nbt',                       # 79889
      'entities-with-class',              # 82107
      'food-items',                       # 140805
    //'advancements-simple',              # 176687
      'tileentities',                     # 203766
    //'blocks-id-to-registryname',        # 231595
      'biomes-with-mob-spawns',           # 370535
      'block-props',                      # 374464
      'oredictionary-by-item',            # 586969
      'oredictionary-by-key-individual',  # 703570
    //'oredictionary-by-key',             # 753746
    //'blockstates-by-block',             # 1198074
      'blocks',                           # 1336943
    //'blocks-with-nbt',                  # 1429923
    //'items-craftable',                  # 2138773
      'items',                            # 3569125
    //'items-with-tool-classes',          # 3811572
    //'items-with-nbt',                   # 5024895
    //'blockstates-by-state',             # 32959606
    ] as string[];
    for csvcode in csvList {
      server.commandManager.executeCommand(server, '/tellme dump-csv ' ~ csvcode);
    }
  })
  
  .sleep(100).then(function(world, ctx) {
    player.sendMessage('Developing: Starting §cexport to crafttweaker.log');
    exportAllBlocks();
    // exportAllTools();
  })
  
  .sleep(100).then(function(world, ctx) {
    player.sendMessage('Developing: §aFinished!');
  }).start();
}

events.onPlayerLoggedIn(function(e as crafttweaker.event.PlayerLoggedInEvent){
  if(e.player.world.isRemote()) return;
  if(!debugUtils.firstTime(e.player.world.time)) return;

  e.player.world.catenation().sleep(100).then(function(world, ctx) {
    e.player.sendMessage('§cDebug environment activated!');
    e.player.sendMessage('§8If you want to disable DEBUG mode, remove §7scripts/debug§8 directory');
    e.player.sendMessage('§8Write §7/skip_automation§8 to skip automatic executions, write §7/run_automation§8 to run manually');
  })
  
  .sleep(300).then(function(world, ctx) {
    if(!skipped[0]) runAutomation(e.player);
  }).start();
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

# Command to cancel automation
var cmd = mods.zenutils.command.ZenCommand.create("skip_automation");
cmd.requiredPermissionLevel = 0;
cmd.execute = function(command, server, sender, args) { skipped[0] = true; };
cmd.register();

cmd = mods.zenutils.command.ZenCommand.create("run_automation");
cmd.requiredPermissionLevel = 0;
cmd.execute = function(command, server, sender, args) {
  runAutomation(mods.zenutils.command.CommandUtils.getCommandSenderAsPlayer(sender));
};
cmd.register();
