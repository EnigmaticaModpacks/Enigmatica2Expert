import mods.armoreablemobs.ArmorHandler;
import mods.armoreablemobs.ArmorHandler.createArmorEntity as armEnt;
import mods.armoreablemobs.ArmorEntity;
import mods.armoreablemobs.ArmorSlot;
import mods.armoreablemobs.ArmorGroup;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.event.CommandEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.data.IData;

#modloaded armoreablemobs



##########################
#       ENTITIES         #

# ######################################################################
#
# 
#
# ######################################################################

static armorStaged as IData[string] = scripts.DataTables.armorStaged;


# Remove previous stage on command execution
// events.onCommand(function(event as CommandEvent) {
//     print("Entering [events.onCommand]...");
//     val command = event.command;
//     if(isNull(command) || 
//       (command.name != "gamestage") ||
//       (event.parameters.length < 3) || 
//       (event.parameters[0] != "silentadd")) {
        
//         print("  command dont match, return..");
//         return;
//     }
    
//     # Check is this stage is listed in DataTables
//     # and have previous stage
//     var currStageName = event.parameters[2];
//     var stage = armorStaged[currStageName];
//     print("  currStageName: " ~ currStageName ~ ", stage:" ~ stage);
//     if (isNull(stage)) { print("  there is no stage for [" ~ currStageName ~ "]"); return;}
    
//     # Recursively remove all previous stages
//     var currStage = stage;
//     val playerName = event.parameters[1];
//     while (!isNull(currStage.prev)) {
//       var prevStageName = currStage.prev.asString();
//       print("EXECUTE: " ~ "gamestage silentremove " ~ playerName ~ " " ~ prevStageName);
//       server.commandManager.executeCommand(server, "gamestage silentremove " ~ playerName ~ " " ~ prevStageName);

//       currStage = armorStaged[prevStageName];
//     }
//     return;
// });

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
  # print("Call addArmorToGroup for stage: " ~ ((isNull(stage.prev)) ? "Stage without prev" : stage.asString()));
  for i in 0 to (isSkeleton ? 4 : 6) {
    # print(" i = " ~ i);
    var sltName = slotNames[i];
    var listedItem = stage.list[i];
    var id = listedItem.id.asString();
    var itemNoNBT = itemUtils.getItem(id);
    # print("    " ~ sltName ~ " listedItem:" ~ listedItem.asString());
    if(!isNull(itemNoNBT)) {
      var item = itemNoNBT.withTag(isNull(listedItem.tag) ? {} : listedItem.tag);
      if (isNull( armSlots[item] )){
        val weight = 1 + stage.tier.asInt();
        # print("      createArmorSlot: " ~ sltName ~ " weight: " ~ weight );
        armSlots[item] = ArmorHandler.createArmorSlot(sltName, item, weight, 0.1 /* <- chanceToDropOnDeath */);
      } else {
        # print("      item for armSlots[item] already created, skip..");
      }
      group.addArmor(armSlots[item]);
    } else {
      # print("    itemNoNBT is Null..");
    }
  }

  # Recursively add all previous stages
  // if (!isNull(stage.prev)){
  //   print("  stage.prev: " ~ stage.prev.asString());
  //   addArmorToGroup(group, armorStaged[stage.prev.asString()], isSkeleton);
  // }
}

function makeGroup(id as string, stage as IData, isSkeleton as bool){
    var tier as float = stage.tier.asFloat();
    val chanceToGetUsed = /* tier * 0.005f + */ 0.02f;
    # print("  tier:" ~ tier ~ " chanceToGetUsed:" ~ chanceToGetUsed);
    var group as ArmorGroup = ArmorHandler.createArmorGroup(id, chanceToGetUsed);
    group.addGameStage(id); # Add stage
    for ent in (isSkeleton ? armorSkeletons : armorEntitys) { 
        # print("  group.addEntity()");
        group.addEntity(ent); # Add entitys
    }
    addArmorToGroup(group, stage, isSkeleton);
}

# Create all stages
for id, stage in armorStaged {
    # print("Making stages for id: " ~ (isNull(id) ? "null" : id));
    makeGroup(id, stage, false); # Weaponized group
    makeGroup(id, stage, true);  # Sceleton group
}