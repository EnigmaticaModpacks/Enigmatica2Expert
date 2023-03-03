#modloaded ctintegration

#priority 3999
#loader crafttweaker reloadableevents

import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import mods.ctintegration.data.DataUtil.parse as sNBT;
import crafttweaker.block.IBlock;
import crafttweaker.world.IWorld;
import crafttweaker.block.IBlockState;

utils.DEBUG = true;

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

function getStateFromItem(item as IItemStack) as IBlockState {
  val block = item.asBlock();
  if(isNull(block)) return null;
  val def = block.definition;
  val state = def.getStateFromMeta(block.meta);
  return state;
}

function forEachBlockState(callback as function(IItemStack,IBlockState)void) as void {
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
      val state = getStateFromItem(sub);
      if(isNull(state)) continue;
      callback(sub, state);
    }
  }
}

function dumpOreBlocks() {
  print('##################################################');
  print('#                  Ore Blocks                    #');
  forEachBlockState(function(item as IItemStack, state as IBlockState) as void {
    val def = state.block.definition;
    val tool = def.getHarvestTool(state);
    val harvLevel = def.getHarvestLevel(state);
    if(tool=="" && harvLevel == -1 as int) return;

    // Check if block is ore
    var targetLvl = -1 as int;
    for ore in item.ores {
      if(!(ore.name.startsWith("oreEnd") || ore.name.startsWith("oreNether"))) continue;
      val isEnd = ore.name.startsWith("oreEnd");
      val material = ore.name.replaceAll("^(oreEnd|oreNether)", "");
      val origOre = oreDict['ore'+material];
      for origItem in origOre.items {
        val state = getStateFromItem(origItem);
        if(isNull(state)) continue;
        val origLvl = state.block.definition.getHarvestLevel(state);
        targetLvl = max(3, origLvl) + (isEnd ? 3 : 2);
        break;
      }
      if(targetLvl > 0) break;
    }
    if(targetLvl < 0) return;

    // S:"extrautils2:compressedcobblestone:0"=pickaxe=3
    
    print('S:"'~def.id~":"~item.damage~'"='~tool~"="~targetLvl~" // was: "~harvLevel~' '~item.displayName);
  });
  print('##################################################');
}

function dumpLightSources(player as IPlayer) as void {
  for light in 13 .. 16 {
    var items = [] as IItemStack[];
    var ids = [] as string[];
    for i,block in game.blocks {
      val ll = block.lightLevel;
      if(ll <= 0) continue;
      utils.log(ll, block.id);

      if(ll == light) {
        ids += block.id;
      }
    }
    mods.ctintegration.util.ArrayUtil.sort(ids);
    for id in ids {
      val item = itemUtils.getItem(id);
      if(!isNull(item)) items += item;
      else utils.log('Light without item:', id);
    }
    giveChest(player, items);
  }
}

events.onPlayerLeftClickBlock(function(e as crafttweaker.event.PlayerLeftClickBlockEvent){
  if(e.player.world.isRemote()) return;
  if(
    isNull(e.player.currentItem) 
    || !(<minecraft:stick> has e.player.currentItem)
    || e.block.definition.id != "minecraft:bedrock"
  ) return;

  e.player.sendMessage("§eLeft Clicked§r");
  // dumpLightSources(e.player);
  // dumpOreBlocks();
  for slot in extrautilities2.Tweaker.IMachineRegistry.getMachine("extrautils2:enchanter").getOutputSlots() {
    server.commandManager.executeCommand(server, '/say §aslot: '~slot.name);
  }
  e.player.sendMessage("§8Done!§r");
});


events.onPlayerInteractBlock(function(e as crafttweaker.event.PlayerInteractBlockEvent){
  /*
    Check requirments
  */

  val world as IWorld = e.world;
  if(isNull(world) || world.remote) return;

  val player as IPlayer = e.player;
  if (isNull(player) || !player.creative) return;

  val currentItem = e.item;
  if (isNull(currentItem)) return;
  if(currentItem.definition.id != 'minecraft:stick') return;

  val block as IBlock = world.getBlock(e.x, e.y, e.z);
  if (isNull(block)) return;

  val data as IData = block.data;
  if (isNull(data)) return;

  var itemsList = data.Items;
  if (isNull(itemsList) || isNull(itemsList.asList())) {
    itemsList = data.Inventory;
  }
  
  if (isNull(itemsList) || isNull(itemsList.asList()) || itemsList.length <= 0) return;

  mods.ctintegration.util.RawLogger.logRaw(mods.ctintegration.data.DataUtil.toNBTString(itemsList));
  player.sendMessage("§8Printed "~itemsList.length~" items");
  e.cancel();
});



// events.onEntityLivingAttacked(function(e as crafttweaker.event.EntityLivingAttackedEvent){
//   server.commandManager.executeCommand(server,
//     '/say §atype:§r '~e.damageSource.damageType
//     ~' §ahas inmmediate:§r '~!isNull(e.damageSource.immediateSource)
//     ~' §ahas true:§r '~!isNull(e.damageSource.trueSource)
//     ~' §atrue:§r '~!isNull(e.damageSource.trueSource.)
//   );
//   if(isNull(e.damageSource) || isNull(e.damageSource.trueSource)) return;
//   val source = isNull(e.damageSource.trueSource.definition) ? '' : '§asource_id:§r '~e.damageSource.trueSource.definition.id;
//   server.commandManager.executeCommand(server, '/say '~source);
  
// });
