import mods.armoreablemobs.ArmorHandler;
import mods.armoreablemobs.ArmorHandler.createArmorEntity as armEnt;
import mods.armoreablemobs.ArmorEntity;
import mods.armoreablemobs.ArmorSlot;
import mods.armoreablemobs.ArmorGroup;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.max;

#modloaded armoreablemobs



##########################
#       ENTITIES         #

# ######################################################################
#
# 
#
# ######################################################################


##########################
#       ENTITIES         #
static armorEntitys as ArmorEntity[] = [
	armEnt("minecraft:zombie_pigman"),
	armEnt("minecraft:zombie"),
	armEnt("minecraft:zombie_villager"),
	armEnt("minecraft:wither_skeleton"),
	armEnt("minecraft:husk"),
	armEnt("emberroot:knight_fallen")
] as ArmorEntity[];
static armorSkeletons as ArmorEntity[] = [
	armEnt("minecraft:skeleton"),
	armEnt("minecraft:stray")
] as ArmorEntity[];

##########################
#       ARMOR SLOTS      #
static armSlots as ArmorSlot[IItemStack] = {} as ArmorSlot[IItemStack];
static slotNames as string[] = ["head", "chest", "legs", "feet", "mainhand", "offhand"] as string[];

# Add armors recursively
function addArmorToGroup(group as ArmorGroup, stage as IData, isSkeleton as bool){
  for i in 0 to (isSkeleton ? 4 : 6) {
    var sltName = slotNames[i];
    var listedItem = stage.list[i];
    var id = listedItem.id.asString();
    var itemNoNBT = itemUtils.getItem(id);
    if(!isNull(itemNoNBT)) {
      val it = itemNoNBT.withTag(isNull(listedItem.tag) ? {} : listedItem.tag);

      # Check if can be charged
      val chargeable = !isNull(it.tag) && (!isNull(it.tag.charge) || !isNull(it.tag.Energy));

      var item as IItemStack = null;
      
      if (chargeable) {
        # Lower charge
        item = !isNull(it.tag.charge)
          ? it.updateTag({charge: it.tag.charge as int / 11})
          : (!isNull(it.tag.Energy)
            ? it.updateTag({Energy: it.tag.Energy as int / 11})
            : it);
      } else {
        # Damage item to 0.78
        val loweredDmg = min(it.maxDamage, max(1, (it.maxDamage as float * 0.78f) as int));
        item = it.isDamageable ? (it.withDamage(loweredDmg)) : it;
      }

      if (isNull( armSlots[item] )){
        val weight = 1 + stage.tier.asInt();
        armSlots[item] = ArmorHandler.createArmorSlot(sltName, item, weight, 0.1 /* <- chanceToDropOnDeath */);
      }
      group.addArmor(armSlots[item]);
    }
  }
}

function makeGroup(id as string, stage as IData, isSkeleton as bool){
    var tier as float = stage.tier.asFloat();
    val chanceToGetUsed = /* tier * 0.005f + */ 0.01f;
    var group as ArmorGroup = ArmorHandler.createArmorGroup(id, chanceToGetUsed);
    group.addGameStage(id); # Add stage
    for ent in (isSkeleton ? armorSkeletons : armorEntitys) { 
        group.addEntity(ent); # Add entitys
    }
    addArmorToGroup(group, stage, isSkeleton);
}

# Create all stages
for id, stage in scripts.equipment.armorData.armorStaged {
    makeGroup(id, stage, false); # Weaponized group
    makeGroup(id, stage, true);  # Sceleton group
}