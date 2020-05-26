import mods.armoreablemobs.ArmorHandler;
import mods.armoreablemobs.ArmorHandler.createArmorEntity as armEnt;
import mods.armoreablemobs.ArmorEntity;
import mods.armoreablemobs.ArmorSlot;
import mods.armoreablemobs.ArmorGroup;
import crafttweaker.item.IItemStack as IItemStack;
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
events.onCommand(function(event as CommandEvent) {
    print("Entering [events.onCommand]...");
    val command = event.command;
    if(isNull(command) || 
        (command.name != "gamestage") || 
        (event.parameters[0] != "silentadd") ||
        (event.parameters.length < 3)) {
        
        print("  command dont match, return..");
        return;
    }
    
    var currStageName = event.parameters[2];
    var stage = armorStaged[currStageName];
    print("  currStageName: " ~ currStageName ~ ", stage:" ~ stage);
    if (isNull(stage) || isNull(stage.prev)) { print("  stage is wrong, return.."); return;}
    
    var prevStage = stage.prev.asString();
    print("EXECUTE: " ~ "gamestage silentremove " ~ event.parameters[1] ~ " " ~ prevStage);
    server.commandManager.executeCommand(server, "gamestage silentremove " ~ event.parameters[1] ~ " " ~ prevStage);
    return;
});

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
  print("Call addArmorToGroup");
  for i in 0 to (isSkeleton ? 4 : 6) {
    print(" i = " ~ i);
    var sltName = slotNames[i];
    var listedItem = stage.list[i];
    var id = listedItem.id.asString();
    var itemNoNBT = itemUtils.getItem(id);
    print("    sltName:" ~ sltName ~ " listedItem:" ~ listedItem.asString() ~ " id:" ~ id);
    if(!isNull(itemNoNBT)) {
      print("    itemNoNBT is not null..");
      var item = itemNoNBT.withTag(isNull(listedItem.tag) ? {} : listedItem.tag);
      if (isNull( armSlots[item] )){
        print("      createArmorSlot: " ~ sltName ~ " " ~ (1 + stage.tier.asInt()) );
        armSlots[item] = ArmorHandler.createArmorSlot(sltName, item, 
          1 + stage.tier.asInt(), 0.1);
      }
      group.addArmor(armSlots[item]);
    }
  }
  if (!isNull(stage.prev)){
    print("  stage.prev: " ~ stage.prev.asString());
    addArmorToGroup(group, armorStaged[stage.prev.asString()], isSkeleton);
  }
}

function makeGroup(id as string, stage as IData, isSkeleton as bool){
    var tier = stage.tier.asInt();
    print("  tier:" ~ tier);
    var group as ArmorGroup = ArmorHandler.createArmorGroup(id, tier * 0.04 + 0.08);
    group.addGameStage(id); # Add stage
    for ent in (isSkeleton ? armorSkeletons : armorEntitys) { 
        print("  group.addEntity()");
        group.addEntity(ent); # Add entitys
    }
    addArmorToGroup(group, stage, isSkeleton);
}

# Create all stages
for id, stage in armorStaged {
    print("Making stages for id: " ~ (isNull(id) ? "null" : id));
    print("  stage:" ~ (isNull(stage) ? "null" : stage.asString()));
    makeGroup(id, stage, false); # Weaponized group
    makeGroup(id, stage, true);  # Sceleton group
}