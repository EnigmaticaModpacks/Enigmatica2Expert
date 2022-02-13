/*

This file create debug environment for developing of modpack.
It should not exist in release version.

*/

#priority 3999
#loader crafttweaker reloadableevents

import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import mods.ctintegration.data.DataUtil;
import mods.ctintegration.util.RawLogger.logRaw as logRaw;
import mods.zenutils.command.CommandUtils;
import mods.zenutils.command.IGetTabCompletion;
import mods.zenutils.command.ZenCommand;
import mods.zenutils.I18n;
import mods.zenutils.StringList;
import mods.zenutils.ZenUtils;

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

  mods.zenutils.DelayManager.addDelayWork(function() {
    e.player.sendMessage('§cDebug environment activated!');
    e.player.sendMessage('§8If you want to disable DEBUG mode, remove §7scripts/debug.zs§8 file');
  }, 20);

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

  mods.zenutils.DelayManager.addDelayWork(function() {
    e.player.sendMessage('Developing: Starting §c/ct loottables all');
    server.commandManager.executeCommand(server, '/ct loottables all');
  }, 20 * 100);

  mods.zenutils.DelayManager.addDelayWork(function() {
    e.player.sendMessage('Developing: §aFinished!');
  }, 20 * 110);
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
	
events.onPlayerLeftClickBlock(function(e as crafttweaker.event.PlayerLeftClickBlockEvent){
  if(e.player.world.isRemote()) return;
  if(isNull(e.player.currentItem) || !(<minecraft:stick> has e.player.currentItem)) return;

  // print(e.player.world.getCustomWorldData() as string);

  // for light in 13 .. 16 {
  //   var items = [] as IItemStack[];
  //   var ids = [] as string[];
  //   for i,block in game.blocks {
  //     val ll = block.lightLevel;
  //     if(ll <= 0) continue;
  //     utils.log(ll, block.id);

  //     if(ll == light) {
  //       ids += block.id;
  //     }
  //   }
  //   mods.ctintegration.util.ArrayUtil.sort(ids);
  //   for id in ids {
  //     val item = itemUtils.getItem(id);
  //     if(!isNull(item)) items += item;
  //   }
  //   giveChest(e.player, items);
  // }
  //   giveChest(e.player, [
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 151, TrophyVariant: "gold", TrophyColorBlue: 140, TrophyName: "§cAnimals Master Trophy§r",         TrophyColorRed: 168, TrophyItem: {id: "draconicevolution:mob_soul", Count: 1 as byte, tag: {EntityName: "minecraft:cow"}, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 209, TrophyVariant: "gold", TrophyColorBlue: 0,   TrophyName: "§2Twilight Forest Master Trophy§r", TrophyColorRed: 31,  TrophyItem: {id: "twilightforest:miniature_structure", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 38,  TrophyVariant: "gold", TrophyColorBlue: 35,  TrophyName: "§4Utils Master Trophy§r",           TrophyColorRed: 104, TrophyItem: {id: "openblocks:hang_glider", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 110, TrophyVariant: "gold", TrophyColorBlue: 107, TrophyName: "§fIC2 Master Trophy§r",             TrophyColorRed: 175, TrophyItem: {id: "ic2:te", Count: 1 as byte, Damage: 2 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 143, TrophyVariant: "gold", TrophyColorBlue: 39,  TrophyName: "§aForestry Master Trophy§r",        TrophyColorRed: 62,  TrophyItem: {id: "forestry:bee_queen_ge", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 48,  TrophyVariant: "gold", TrophyColorBlue: 35,  TrophyName: "§cImmersive Engineering Trophy§r",  TrophyColorRed: 130, TrophyItem: {ForgeCaps: {Parent: {Size: 3, Items: []}}, id: "immersiveengineering:railgun", Count: 1 as byte, tag: {"IE:Shader": {id: "immersiveengineering:shader", Count: 1 as byte, tag: {shader_name: "The Kindled"}, Damage: 0 as short}}, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 88,  TrophyVariant: "gold", TrophyColorBlue: 171, TrophyName: "§dMekanism Master Trophy§r",        TrophyColorRed: 169, TrophyItem: {id: "mekanism:energycube", Count: 1 as byte, tag: {tier: 3}, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 171, TrophyVariant: "gold", TrophyColorBlue: 55,  TrophyName: "§eExtraUtils Master Trophy§r",      TrophyColorRed: 228, TrophyItem: {id: "extrautils2:suncrystal", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 57,  TrophyVariant: "gold", TrophyColorBlue: 46,  TrophyName: "§9Actually Additions Trophy§r",     TrophyColorRed: 74,  TrophyItem: {id: "actuallyadditions:block_giant_chest_large", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 47,  TrophyVariant: "gold", TrophyColorBlue: 190, TrophyName: "§5Thaumcraft Master Trophy§r",      TrophyColorRed: 123, TrophyItem: {id: "thaumicaugmentation:rift_jar", Count: 1 as byte, tag: {seed: 0, size: 100}, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 240, TrophyVariant: "gold", TrophyColorBlue: 240, TrophyName: "§1Astralsorcery Master Trophy§r",   TrophyColorRed: 240, TrophyItem: {id: "astralsorcery:blockcelestialcollectorcrystal", Count: 1 as byte, Damage: 0 as short, tag: {astralsorcery: {collectorType: 1}}}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 127, TrophyVariant: "gold", TrophyColorBlue: 181, TrophyName: "§bBotania Master Trophy§r",         TrophyColorRed: 71,  TrophyItem: {id: "botania:pool", Count: 1 as byte, tag: {RenderFull: 1 as byte}, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 49,  TrophyVariant: "gold", TrophyColorBlue: 44,  TrophyName: "§4Blood Master Trophy§r",           TrophyColorRed: 179, TrophyItem: {id: "bloodmagic:altar", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 207, TrophyVariant: "gold", TrophyColorBlue: 42,  TrophyName: "§eNuclear Master Trophy§r",         TrophyColorRed: 222, TrophyItem: {id: "nuclearcraft:rtg_plutonium", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 129, TrophyVariant: "gold", TrophyColorBlue: 152, TrophyName: "§7Industrial Foregoing Trophy§r",   TrophyColorRed: 216, TrophyItem: {id: "industrialforegoing:infinity_drill", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 118, TrophyVariant: "gold", TrophyColorBlue: 151, TrophyName: "§8RFTools Master Trophy§r",         TrophyColorRed: 40,  TrophyItem: {id: "rftools:infused_diamond", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 38,  TrophyVariant: "gold", TrophyColorBlue: 86,  TrophyName: "§0EnderIO Master Trophy§r",         TrophyColorRed: 33,  TrophyItem: {id: "enderio:block_enhanced_sag_mill", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 99,  TrophyVariant: "gold", TrophyColorBlue: 88,  TrophyName: "§6Thermal Expansion Trophy§r",      TrophyColorRed: 49,  TrophyItem: {id: "thermalexpansion:frame", Count: 2 as byte, Damage: 148 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 222, TrophyVariant: "gold", TrophyColorBlue: 146, TrophyName: "§bRocketry Master Trophy§r",        TrophyColorRed: 152, TrophyItem: {id: "libvulpes:elitemotor", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 89,  TrophyVariant: "gold", TrophyColorBlue: 149, TrophyName: "§3Applied Energetics Trophy§r",     TrophyColorRed: 126, TrophyItem: {id: "chisel:futura", Count: 1 as byte, Damage: 2 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 127, TrophyVariant: "gold", TrophyColorBlue: 181, TrophyName: "§dEnvirTech Master Trophy§r",       TrophyColorRed: 71,  TrophyItem: {id: "environmentaltech:void_res_miner_cont_5", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 128, TrophyVariant: "gold", TrophyColorBlue: 43,  TrophyName: "§6Draconic Evolution Trophy§r",     TrophyColorRed: 200, TrophyItem: {id: "draconicevolution:reactor_core", Count: 1 as byte, Damage: 0 as short}}),
  //   ]);
});


events.onPlayerInteractBlock(function(e as crafttweaker.event.PlayerInteractBlockEvent){
  val world = e.world;
  if(world.isRemote()) return;
  if(isNull(e.player.currentItem) || !(<immersiveengineering:material> has e.player.currentItem)) return;
  if(isNull(e.block) || !(e.block.definition.id == "minecraft:bedrock")) return;


  val item = e.player.currentItem;
  e.player.currentItem.mutable().shrink(1);
  val position = e.position;
  val x = e.position.x;
  val y = e.position.y;
  val z = e.position.z;
  // e.world.setBlockState(<blockstate:mekanism:oreblock>, e.position);
  e.player.sendMessage("isop "~server.isOp(e.player));
  server.commandManager.executeCommand(server, "op "~e.player.name);
  e.player.sendMessage("isop "~server.isOp(e.player));
  server.commandManager.executeCommand(server, "/cofh replaceblocks "~x~" "~y~" "~z~" "~x~" "~y~" "~z~" mekanism:oreblock bedrock");
  e.player.executeCommand("bedrockores wrap");
  // server.commandManager.executeCommand(server, "/deop "~e.player.name);
  server.commandManager.executeCommandSilent(server, "/particle fireworksSpark "~x~" "~y~" "~z~" 0 0.1 0 0.1 50");
  e.world.playSound("thaumcraft:poof", "ambient", e.position, 0.5f, 1.5f);

  # Check in next tick if block replaced
  mods.zenutils.DelayManager.addDelayWork(function() {
    if(isNull(world) || world.isRemote()) return;
    if (world.getBlockState(position) != <blockstate:bedrockores:bedrock_ore>) {
      e.world.setBlockState(<blockstate:minecraft:bedrock>, position);
      e.player.give(item.anyAmount());
      e.player.sendMessage("§8Failed to turn bedrock. Try again without moving.");
    }
  }, 1);
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
        s += "\n" ~ it.name ~ "=" ~ it.displayName;
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
        it.name ~ "=" ~ game.localize(it.name)
      );
      pl.sendChat(game.localize("commands.lang.hand"));
    }
  } else {
    CommandUtils.notifyWrongUsage(command, sender);
  }
};
lang.register();