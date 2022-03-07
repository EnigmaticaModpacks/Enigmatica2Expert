
#modloaded buildinggadgets

val gCell = <thermalexpansion:cell>.withTag({Level: 4 as byte}); # Energy Cell (Resonant)

# [Destruction Gadget] from [Tablet Case (Tier 2)][+3]
craft.remake(<buildinggadgets:destructiontool>, ["pretty",
  "  *  ",
  "□ : □",
  "  Ϟ  "], {
  "*": <actuallyadditions:item_crystal_empowered:3>, # Empowered Void Crystal
  "□": <ore:plateSignalum>,  # Signalum Plate
  ":": <opencomputers:misc>,
  "Ϟ": gCell,
});

# [Copy-Paste Gadget] from [Tablet Case (Tier 2)][+3]
craft.remake(<buildinggadgets:copypastetool>, ["pretty",
  "  *  ",
  "□ : □",
  "  Ϟ  "], {
  "*": <actuallyadditions:item_crystal_empowered:4>, # Empowered Emeradic Crystal
  "□": <ore:plateEnderium>,  # Enderium Plate
  ":": <opencomputers:misc>,
  "Ϟ": gCell,
});

# [Exchanging Gadget] from [Tablet Case (Tier 2)][+3]
craft.remake(<buildinggadgets:exchangertool>, ["pretty",
  "  *  ",
  "□ : □",
  "  Ϟ  "], {
  "*": <actuallyadditions:item_crystal_empowered:2>, # Empowered Diamatine Crystal
  "□": <ore:plateLumium>,    # Lumium Plate
  ":": <opencomputers:misc>,
  "Ϟ": gCell,
});

# [Building Gadget] from [Tablet Case (Tier 2)][+3]
craft.remake(<buildinggadgets:buildingtool>, ["pretty",
  "  *  ",
  "□ : □",
  "  Ϟ  "], {
  "*": <actuallyadditions:item_crystal_empowered:5>, # Empowered Enori Crystal
  "□": <ore:platePlatinum>,  # Platinum Plate
  ":": <opencomputers:misc>,
  "Ϟ": gCell,
});


# [Creative Paste Container] from [Mana Dust][+4]
craft.remake(<buildinggadgets:constructionpastecontainercreative>, ["pretty",
  "  L ▲ L",
  "  ▬ P ▬",
  "  ▬ P ▬",
  "  ▬ P ▬",
  "  C C C"], {
  "P": <buildinggadgets:constructionpastecontainert3>.withTag({amount: 8192}), # Paste Container T3
  "▲": <ore:dustMana>,                      # Mana Dust
  "C": <integratedterminals:chorus_glass>,  # Chorus Glass
  "▬": <ore:ingotDraconium>,                # Draconium Ingot
  "L": <integrateddynamics:logic_director>, # Logic Director
});
