import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#modloaded thaumicenergistics

#loader crafttweaker reloadableevents

/* 
This fix not working - event not fired at all

# Fix Essentia cells right-click dissassemble
# Without this fix components not returned always
# https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/30
events.onEntityLivingUseItem(function(e as crafttweaker.event.EntityLivingUseItemEvent.All){
  if(!e.isPlayer || e.player.world.isRemote()) return;
  e.player.sendMessage("§7Entering onEntityLivingUseItemStart");
  if(!e.player.isSneaking) return;
  e.player.sendMessage("§7Player Sneaking");
  val id = e.item.definition.id;
  if(!id.startsWith("thaumicenergistics:essentia_cell_")) return;
  e.player.sendMessage("§7startsWith essentia_cell_");
  e.item.mutable().shrink(1);
  e.player.give(<appliedenergistics2:material:39>);
  e.player.give(itemUtils.getItem(id.replaceAll("_cell_", "_component_")));
  e.cancel();
  e.player.sendMessage("§7Finished");
});

*/

val cellIngrs = {
  "⌃": <appliedenergistics2:quartz_glass>,          # Quartz Glass
  "♥": <ore:dustRedstone>,                          # Redstone
  "□": <ore:plateIron>,                             # Iron Plate
  "I": <ironchest:iron_chest>,                      # Iron Chest
  "1": <thaumicenergistics:essentia_component_1k>,  # 1k ME Essentia Storage Component
  "4": <thaumicenergistics:essentia_component_4k>,  # 4k ME Essentia Storage Component
  "6": <thaumicenergistics:essentia_component_16k>, # 16k ME Essentia Storage Component
  "k": <thaumicenergistics:essentia_component_64k>, # 64k ME Essentia Storage Component
} as IIngredient[string];

# [1k ME Essentia Storage Cell] from [1k ME Essentia Storage Component][+4]
recipes.removeByRecipeName("thaumicenergistics:cells/essentia_cell_1k");
craft.make(<thaumicenergistics:essentia_cell_1k>, ["pretty",
  "⌃ ♥ ⌃",
  "♥ 1 ♥",
  "□ I □"], cellIngrs
);

# [4k ME Essentia Storage Cell] from [4k ME Essentia Storage Component][+4]
recipes.removeByRecipeName("thaumicenergistics:cells/essentia_cell_4k");
craft.make(<thaumicenergistics:essentia_cell_4k>, ["pretty",
  "⌃ ♥ ⌃",
  "♥ 4 ♥",
  "□ I □"], cellIngrs
);

# [16k ME Essentia Storage Cell] from [16k ME Essentia Storage Component][+4]
recipes.removeByRecipeName("thaumicenergistics:cells/essentia_cell_16k");
craft.make(<thaumicenergistics:essentia_cell_16k>, ["pretty",
  "⌃ ♥ ⌃",
  "♥ 6 ♥",
  "□ I □"], cellIngrs
);

# [64k ME Essentia Storage Cell] from [64k ME Essentia Storage Component][+4]
recipes.removeByRecipeName("thaumicenergistics:cells/essentia_cell_64k");
craft.make(<thaumicenergistics:essentia_cell_64k>, ["pretty",
  "⌃ ♥ ⌃",
  "♥ k ♥",
  "□ I □"], cellIngrs
);