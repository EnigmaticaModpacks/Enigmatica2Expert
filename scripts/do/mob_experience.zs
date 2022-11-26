import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;
import crafttweaker.potions.IPotion;
import crafttweaker.potions.IPotionEffect;
import crafttweaker.data.IData;

#loader crafttweaker reloadable

static experience_potions as int[][IPotion][] = [
//{<potion:minecraft:strength>      : [ 4, 1]},
  {<potion:minecraft:speed>         : [ 4, 1]},
  {<potion:minecraft:glowing>       : [ 0, 1]},
  {<potion:minecraft:health_boost>  : [ 4, 4]},
  {<potion:potioncore:iron_skin>    : [ 4, 1]},
  {<potion:potioncore:diamond_skin> : [ 4, 1]},
//{<potion:minecraft:regeneration>  : [ 4, 1]}, // Not working for some reason
  {<potion:potioncore:revival>      : [ 0, 1]},
] as int[][IPotion][];

static potionTime as int = 20*60;

function increaseLevel(
  entity as IEntityLivingBase,
  potion as IPotion,
  maxLevel as int,
  step as int
) as bool {
  if (!entity.isPotionActive(potion)) {
    // First level
    entity.addPotionEffect(potion.makePotionEffect(potionTime, 0));
    return true;
  }
  val existEffect = entity.getActivePotionEffect(potion);
  val addition = existEffect.amplifier >= maxLevel ? 0 : step;
  entity.addPotionEffect(potion.makePotionEffect(potionTime, existEffect.amplifier + addition));
  return addition != 0;
}

events.onEntityLivingDeath(function(e as crafttweaker.event.EntityLivingDeathEvent){
  if(e.entity.world.remote) return;
  if(!(e.entity instanceof IEntityLivingBase)) return;

  if(!(e.damageSource.trueSource instanceof IEntityLivingBase)) return;
  val source as IEntityLivingBase = e.damageSource.trueSource;

  if(isNull(source.definition) || isNull(source.definition.id)) return;
  val source_id = source.definition.id;

  if(source_id != 'minecraft:villager_golem') return;

  for tuple in experience_potions {
    for potion, value in tuple {
      if(increaseLevel(source, potion, value[0], value[1])) return;
    }
  }

  // No potions was buffed - now becomes blight
  val data = e.damageSource.trueSource.nbt + {'ScalingHealth.IsBlight': 1 as byte} as IData;
  e.damageSource.trueSource.setNBT(data);
});