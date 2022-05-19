#modloaded integratedcrafting

# [Crafting Interface] from [Chorus Glass][+4]
craft.remake(<integratedcrafting:part_interface_crafting_item>, ["pretty",
  "□ ¤ □",
  "O ■ I",
  "□ ¤ □"], {
  "¤": <ore:gearIronInfinity>,
  "■": <integratedterminals:chorus_glass>,          # Chorus Glass
  "□": <ore:plateDenseLapis>,                       # Dense Lapis Lazuli Plate
  "I": <integrateddynamics:variable_transformer:1>, # Input Variable Transformer
  "O": <integrateddynamics:variable_transformer>,   # Output Variable Transformer
});