import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;

#priority 10
#loader crafttweaker reloadableevents

static dropList as IItemStack[string][string] = {} as IItemStack[string][string];

function add(deadEntity as string, killerEntity as string, item as IItemStack) as void {
  var by_drop = dropList[deadEntity];
  if(isNull(by_drop)) by_drop = {} as IItemStack[string];
  by_drop[killerEntity] = item;
  dropList[deadEntity] = by_drop;
}

events.onEntityLivingDeathDrops(function(e as crafttweaker.event.EntityLivingDeathDropsEvent){
  if(e.entity.world.isRemote()) return; # Remove world
  if(!(e.entity instanceof IEntityLivingBase)) return; # Is not entity

  val entity as IEntityLivingBase = e.entity;
  if(isNull(entity.definition) || isNull(entity.definition.id)) return; # Has no definition or ID

  val id = entity.definition.id;
  val by_drop = dropList[id];

  if(isNull(by_drop)) return; # No drop for this entity

  if(!(e.damageSource.trueSource instanceof IEntityLivingBase)) return; # Source not an living
  val source as IEntityLivingBase = e.damageSource.trueSource;

  if(isNull(source.definition) || isNull(source.definition.id)) return; # Has no definition or ID
  val source_id = source.definition.id;

  val drop = by_drop[source_id];
  if(isNull(drop)) return; # No drop by this entity

  e.addItem(drop);
});