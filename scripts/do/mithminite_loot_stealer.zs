import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityDrop;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.data.IData;



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
    if(isNull(entity.definition) || isNull(entity.definition.id)) return;       # Has no definition or ID

    val id = entity.definition.id;
    if(!(e.damageSource.trueSource instanceof IPlayer)) return;                 # Source not an player

    val player as IPlayer = e.damageSource.trueSource;
    if(!player.thaumcraftKnowledge.isResearchComplete("LOOT_STEALER")) return;  # Player don't have research

    var check as bool = false;
    if(!isNull(player.mainHandHeldItem)){                       # Player don't have item in main hand
        check=checkTool(player.mainHandHeldItem);               # Tool check tag
    }
    if(!isNull(player.offHandHeldItem)){                       # Player don't have item in off hand
        check=(check || checkTool(player.offHandHeldItem));     # Tool check tag
    }

    if(!check) return;                                          # None of tools have research tag
    return;
    //e.addItem(<thaumcraft:bottle_taint>);



    /*val by_drop = dropList[id];
    if(isNull(by_drop)) return; # No drop for this entity

    val drop = by_drop[source_id];
    if(isNull(drop)) return; # No drop by this entity*/

    //e.addItem();




    /*for drop in event.drops {
        if(drop.item.amount()>1) {
            event.addItem(drop.item * drop.amount);
        } 
    }*/
    /*if(isNull(entity.definition.drops)){
        print("null!");
        return;
    } */
    //val drops = entity.definition.drops; #to sie odnosi tylko do itemow ddanych przez CT!!!

    /*for drop in drops {
        print(drop.stack.name);
        e.addItem(drop.stack*drop.min);
        if(drop.max<2 ||
        drop.playerOnly ||
        drop.chance !=1) continue;
        print("added!");
        e.addItem(drop.stack*(drop.max+e.entity.world.getRandom().nextInt(1,10)));
    }*/
    

    
});