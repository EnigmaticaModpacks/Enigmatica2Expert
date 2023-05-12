
#modloaded thermallogistics

# [Terminal] from [Network Manager][+3]
craft.remake(<thermallogistics:terminal_item>, ["pretty",
  "□ ♥ □",
  "¤ N ¤",
  "□ ♥ □"], {
  "□": <ore:plateSteel>,                 # Steel Plate
  "♥": <thermalfoundation:material:513>, # Redstone Reception Coil
  "¤": <ore:gearCopper>,                 # Copper Gear
  "N": <thermallogistics:manager>,       # Network Manager
});

# Defined in shaped_recipes.ini
recipes.removeByRecipeName("thermallogistics:manager");
