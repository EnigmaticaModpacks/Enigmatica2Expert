#loader crafttweaker reloadableevents

import mods.ctintegration.data.DataUtil;
import mods.ctintegration.util.RawLogger.logRaw as logRaw;

function serialize(str as string) as string {
  return str.replaceAll('"','\\\\"');
}

function str(s as string) as string {
  return '"'~serialize(s)~'"';
}

function key(s as string) as string {
  return str(s)~': ';
}

function logDebugData() {
  // server.commandManager.executeCommand(server, '/say §8Logging item names into §2crafttweaker_raw.log');
  logRaw("{");

  // Count mods
  var modCount = 0;
  for i, mod in loadedMods { modCount += 1; }

  // Dump Mod name aliases
  logRaw('  "modNames": {');
  for i, mod in loadedMods {
    logRaw('    ' ~ key(mod.id) ~ str(mod.name) ~ (i == modCount - 1 ? '' : ','));
  }
  logRaw("  }");
  logRaw("}");
  // server.commandManager.executeCommand(server, '/say §aDone!');
}

logDebugData();