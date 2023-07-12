#modloaded plethora

// Harder recipe for Laser Beam gun
recipes.remove(<plethora:module:1>);
mods.tconstruct.Casting.addTableRecipe(<plethora:module:1>, <bibliocraft:bibliodrill>, <liquid:conductive_iron>, 144*4, true);

remakeEx(<plethora:module:6>, [[<computercraft:peripheral:1>, <ore:ingotIron>, <computercraft:peripheral:1>], [<computercraft:peripheral:4>, <computercraft:peripheral:4>, <computercraft:peripheral:4>], [<ore:ingotIron>, <conarm:helmet_core>.withTag({Material: "iron"}), <ore:ingotIron>]]);

# [Introspection module] from [Inventory Controller Upgrade][+2]
craft.remake(<plethora:module>, ["pretty",
  "□ # □",
  "# : #",
  "□ # □"], {
  "□": <ore:plateElectrum>,                 # Electrum Plate
  "#": <randomthings:spectreplank>,         # Spectre Planks
  ":": <ore:oc:inventoryControllerUpgrade>, # Inventory Controller Upgrade
});
