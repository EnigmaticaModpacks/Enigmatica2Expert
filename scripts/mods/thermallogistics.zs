
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

# [Network Manager] from [Advanced RE-Battery][+2]
craft.remake(<thermallogistics:manager>, ["pretty",
  "□ ⌃ □",
  "□ A □",
  "□ ⌃ □"], {
  "□": <ore:plateElectrum>,  # Electrum Plate
  "⌃": <ore:gemQuartzBlack>, # Black Quartz
  "A": <ic2:advanced_re_battery>.withTag({}).anyDamage(), # Advanced RE-Battery
});
