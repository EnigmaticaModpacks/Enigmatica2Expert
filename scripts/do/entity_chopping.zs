
#loader crafttweaker reloadableevents

import crafttweaker.item.IItemStack;
import mods.ctintegration.data.DataUtil;
import mods.ctintegration.util.RawLogger.logRaw as logRaw;
import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;


events.onEntityLivingDamage(function(e as crafttweaker.event.EntityLivingDamageEvent){
  val mob = e.entity;
  if(
    isNull(mob)
    || isNull(mob.world)
    || mob.world.remote
    || e.amount <= 0
    || isNull(mob.definition)
    || mob.definition.id != "emberroot:rootsonespriteboss"
    || isNull(e.damageSource)
    || isNull(e.damageSource.trueSource)
  ) return;

  // Convert player
  val _player = e.damageSource.trueSource;
  if (!(_player instanceof IPlayer)) return;
  val player as IPlayer = _player;
  
  val amount = e.amount / 5.0f;
  if (amount < 1.0f && mob.world.getRandom().nextDouble() > amount) return;
  utils.geyser(
    mob.world, <mysticalagriculture:crafting:3>,
    mob.position.x, mob.position.y, mob.position.z,
    max(1, amount as int),
    mob.motionX, mob.motionY, mob.motionZ, 2
  );

  player.sendPlaySoundPacket("minecraft:entity.sheep.shear", "ambient", mob.position, 1.0f, 1.0f);
});