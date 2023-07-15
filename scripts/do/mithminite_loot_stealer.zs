#priority -1
#reloadable
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityDrop;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityItem;



function checkTool(tool as IItemStack) as bool {
    if(
    !isNull(tool.tag)
    && !isNull(tool.tag.TinkerData)
    && !isNull(tool.tag.Traits)
    && !isNull(tool.tag.Traits.asList())
  ) {
    for trait in tool.tag.Traits.asList() {
        if(trait != "researcher") continue;
        return true;
    }
  }
  return false;
}

events.onEntityLivingDeathDrops(function(e as crafttweaker.event.EntityLivingDeathDropsEvent){
    if(e.entity.world.isRemote()) return;                   # Remote world
    if(!(e.entity instanceof IEntityLivingBase)) return;    # Is not entity

    val entity as IEntityLivingBase = e.entity;
    if(isNull(entity.definition)) return;
    if(isNull(entity.definition.id)) return;        # Has no definition or ID
    if(!entity.isBoss) return;                       # Must be a boss!

    val id = entity.definition.id;
    if(!(e.damageSource.trueSource instanceof IPlayer)) return;                 # Source not an player

    val player as IPlayer = e.damageSource.trueSource;
    if(isNull(player)) return;

    if(!player.thaumcraftKnowledge.isResearchComplete("LOOT_STEALER")) return;  # Player don't have research

    var check as bool = false;
    if(!isNull(player.mainHandHeldItem)){                       # Player don't have item in main hand
        check=checkTool(player.mainHandHeldItem);               # Tool check tag
    }
    if(!isNull(player.offHandHeldItem)){                       # Player don't have item in off hand
        check=(check || checkTool(player.offHandHeldItem));     # Tool check tag
    }
    if(!check) return;                                          # None of tools have research tag

    for drop in e.drops {
        if(isNull(drop.item)) continue;
        if(drop.item.amount > 1) e.addItem(drop.item*e.entity.world.getRandom().nextInt(1,drop.item.amount/2));
    }
});