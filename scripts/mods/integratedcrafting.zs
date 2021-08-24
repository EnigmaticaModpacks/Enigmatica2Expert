#modloaded integratedcrafting

# [Crafting Interface] from [Chorus Glass][+4]
craft.remake(<integratedcrafting:part_interface_crafting_item>, ["pretty",
  "□ ¤ □",
  "O ■ I",
  "□ ¤ □"], {
  "■": <integratedterminals:chorus_glass>,          # Chorus Glass
  "□": <ore:plateDenseLapis>,                       # Dense Lapis Lazuli Plate
  "¤": <ore:gearVibrant>,                           # Vibrant Bimetal Gear
  "I": <integrateddynamics:variable_transformer:1>, # Input Variable Transformer
  "O": <integrateddynamics:variable_transformer>,   # Output Variable Transformer
});