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

function dumpTraits() as void {
  val traits = [ 'prosperous', 'duritos', 'tconevo.executor', 'tconevo.corrupting', 'tconevo.celestial_armor', 'tconevo.spectral_armor', 'mirabile', 'mana', 'tconevo.relentless', 'tconevo.aftershock1', 'lightweight_armor', 'invigorating_armor', 'tconevo.crystalline', 'magnetic1', 'heavy_armor', 'magnetic1_armor', 'tconevo.luminiferous', 'tconevo.opportunist', 'tconevo.radiant_armor', 'indomitable_armor', 'sharp', 'bloodymary', 'haorans_cult_armor', 'apocalypse', 'tconevo.modifiable1', 'crude1', 'mundane1_armor', 'coldblooded', 'tconevo.deadly_precision', 'prideful_armor', 'tconevo.divine_grace_armor', 'shocking', 'voltaic_armor', 'anticorrosion', 'devilsstrength', 'cheapskate', 'cheap_armor', 'tconevo.piezoelectric', 'xu_withering', 'chunky', 'lightweight', 'established', 'ambitious_armor', 'jagged', 'aquadynamic', 'aquaspeed_armor', 'rough_armor', 'xu_whispering', 'tconevo.sundering', 'tconevo.stifling_armor', 'tconevo.slimey_pink', 'tconevo.slimey_pink_armor', 'bouncy_armor', 'writable1', 'ecological', 'ecological_armor', 'xu_xp_boost', 'steady_armor', 'stonebound', 'tconevo.stonebound_armor', 'writable2', 'ratty', 'tasty', 'spectre', 'spectre_armor', 'alpha_fur', 'alpha_fur_armor', 'brownmagic', 'sassy', 'global', 'tconevo.eternal_density1', 'tconevo.culling', 'tconevo.staggering', 'tconevo.superdense_armor', 'dense_armor', 'infernal_armor', 'tconevo.eternal_density2', 'tconevo.juggernaut', 'tconevo.overwhelm', 'tconevo.ultradense_armor', 'tconevo.hearth_embrace_armor', 'tconevo.fertilizing', 'absorbent_armor', 'cheapskate_armor', 'crumbling', 'alien_armor', 'tconevo.mortal_wounds', 'enderference', 'vengeful_armor', 'enderport_armor', 'twilit', 'stalwart', 'dramatic_armor', 'synergy', 'endorium', 'tconevo.blasting', 'tconevo.vampiric', 'tconevo.foot_fleet', 'precipitate', 'autosmelt', 'superheat', 'flammable', 'superhot_armor', 'veiled', 'unnatural', 'petramor', 'holy', 'enderport-4', 'enderpickup', 'crude2', 'enderport-0', 'poisonous', 'enderport-2', 'enderport-3', 'enderport-1', 'dense', 'shielding_armor', 'hellish', 'splinters', 'alien', 'cheap', 'mundane2_armor', 'prickly', 'spiky', 'spiny_armor', 'splintering', 'fractured', 'splitting', 'calcic_armor', 'skeletal_armor', 'duritos_ranch_armor', 'squeaky', 'combustible_armor', 'magnetic2', 'magnetic2_armor', 'baconlicious', 'baconlicious_armor', 'tasty_armor', 'slimey_green', 'slimey_green_armor', 'slimey_blue', 'slimey_blue_armor', 'autoforge_armor', 'aridiculous', 'aridiculous_armor', 'momentum', 'featherweight_armor', 'subterranean_armor', 'petravidity_armor', 'insatiable', 'heavy', 'blessed_armor', 'stiff', 'hovering', 'breakable', 'freezing', 'endspeed', 'grinding_armor', 'splintering2', 'fractured2', 'splitting2', 'hive_defender', 'flame2', 'frost2', 'antigravity', 'arrow_knockback', 'in_the_garage', 'sweater_song', 'surf_wax_america', 'wolframium', 'magical_modifier', 'brittle', 'depthdigger', 'tconevo.photosynthetic', 'tconevo.photosynthetic_armor', 'tconevo.astral', 'tconevo.astral_armor', 'im_a_superstar', 'tconevo.aftershock3', 'tconevo.will_strength_armor', 'tconevo.condensing1', 'tconevo.reactive_armor', 'tconevo.omnipotence', 'tconevo.infinitum', 'tconevo.null_almighty_armor', 'tconevo.eternity_armor', 'tconevo.gale_force1_armor', 'tconevo.crystalys', 'tconevo.bloodbound', 'tconevo.soul_guard_armor', 'tconevo.bloodbound_armor', 'tconevo.sentient', 'tconevo.willful', 'tconevo.sentient_armor', 'tconevo.willful_armor', 'tconevo.aura_siphon', 'tconevo.aura_infused_armor', 'tconevo.mana_infused', 'tconevo.mana_infused_armor', 'tconevo.mana_affinity1_armor', 'tconevo.gaia_wrath', 'tconevo.mana_affinity2_armor', 'tconevo.second_wind_armor', 'tconevo.fae_voice', 'tconevo.cascading', 'tconevo.fae_voice_armor', 'tconevo.soul_rend1', 'tconevo.evolved', 'tconevo.evolved_armor', 'tconevo.soul_rend2', 'tconevo.soul_rend3', 'tconevo.gale_force2_armor', 'tconevo.chain_lightning', 'tconevo.thundergod_wrath', 'tconevo.battle_furor', 'tconevo.bulwark_armor', 'tconevo.shadowstep_armor', 'tconevo.modifiable2', 'tconevo.rejuvenating', 'tconevo.thundergod_favour_armor', 'tconevo.impact_force', 'tconevo.electric', 'tconevo.electric_armor', 'tconevo.ruination', 'tconevo.phoenix_aspect_armor', 'tconevo.energized1', 'tconevo.energized1_armor', 'tconevo.energized2', 'tconevo.energized2_armor', 'tconevo.chilling_touch_armor', 'tconevo.aftershock2', 'tconevo.warping', 'tconevo.warping_armor', 'thundering', 'tconevo.aura_affinity1_armor', 'withering', 'withering_armor', 'poisonous_armor', 'moldable2', 'moldable1', 'uplifting', 'moldable_armor2', 'moldable_armor1', 'uplifting_armor', 'explosive', 'camdaibay_armor', 'dunanstransport_armor', 'naturesblessing', 'tom_and_jerry_armor', 'natureswrath', 'naturespower', 'light', 'psicological', 'portly', 'disease', 'plague_shot', 'exhausting2', 'feasting', 'exhausting1', 'torporic_armor', 'nourishing_armor', 'elemental', 'terrafirma1', 'goodfridayagreement_armor',
  ] as string[];
  for trait in traits {
    var traitRef = trait;
    var name = game.localize('modifier.'~traitRef~'.name');
    if(name.matches('\\w+\\.\\w+\\.\\w+.*')) {
      traitRef = traitRef.replaceAll('\\d+', '');
      name = game.localize('modifier.'~traitRef~'.name');
    }

    print(traitRef~'==='~name~'==='~game.localize('modifier.'~traitRef~'.desc'));
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
