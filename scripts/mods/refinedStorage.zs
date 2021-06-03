#modloaded refinedstorage

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;


# [Quartz Enriched Iron] from [Pure Nether Quartz Crystal][+1]
recipes.remove(<refinedstorage:quartz_enriched_iron>);
scripts.process.alloy([<ore:ingotElectricalSteel>, <ore:crystalPureNetherQuartz>], <refinedstorage:quartz_enriched_iron>, "No Exceptions");

# [Machine Casing] from [Hardened Cell Frame][+2]
craft.remake(<refinedstorage:machine_casing>, ["pretty",
  "⌃ ▬ ⌃",
  "▬ ◘ ▬",
  "⌃ ▬ ⌃"], {
  "⌃": <refinedstorage:quartz_enriched_iron>, # Quartz Enriched Iron
  "◘": <thermalexpansion:frame:129>,          # Hardened Cell Frame
  "▬": <ore:ingotHSLASteel>,                  # HSLA Steel Ingot
});

# [Controller] from [Machine Casing][+3]
craft.remake(<refinedstorage:controller>, ["pretty",
  "⌃ A ⌃",
  "□ ⌂ □",
  "⌃ □ ⌃"], {
  "□": <ore:plateSilicon>,                    # Silicon Plate
  "A": <refinedstorage:processor:5>,          # Advanced Processor
  "⌂": <refinedstorage:machine_casing>,       # Machine Casing
  "⌃": <refinedstorage:quartz_enriched_iron>, # Quartz Enriched Iron
});

# [Infinite Wireless Transmitter] from [Wireless Transmitter][+3]
craft.remake(<rsinfinitewireless:infinite_wireless_transmitter>, ["pretty",
  "  *  ",
  "T W T",
  "T U T"], {
  "T": <ore:sheetTitaniumAluminide>,          # Titanium Aluminide Sheet
  "U": <ore:itemUnsouledMachineChassi>,       # Soulless Machine Chassis
  "W": <refinedstorage:wireless_transmitter>, # Wireless Transmitter
  "*": <ore:clathrateGlowstone>,              # Energized Clathrate
});

# [Construction Core] from [Empowered Palis Crystal][+1]
recipes.remove(<refinedstorage:core>);
scripts.process.alloy([<refinedstorage:processor:3>, <actuallyadditions:item_crystal_empowered:1>], <refinedstorage:core>, "No Exceptions");

# [Destruction Core] from [Empowered Restonia Crystal][+1]
recipes.remove(<refinedstorage:core:1>);
scripts.process.alloy([<refinedstorage:processor:3>, <actuallyadditions:item_crystal_empowered>], <refinedstorage:core:1>, "No Exceptions");

# [Processor Binding*8] from [Grains of Vibrancy][+1]
craft.reshapeless(<refinedstorage:processor_binding> * 8, "ssV", {
  "s": <ore:slimeball>, # Slimeball
  "V": <ore:itemVibrantPowder>, # Grains of Vibrancy
});

val processorIngrs = [
	<fluxnetworks:flux> * 4,            # Flux
	<ore:ingotCarbon>.firstItem,        # Carbon Brick
	<refinedstorage:processor_binding>, # Processor Binding
] as IItemStack[];

# [Processor] from [Iron Plate][+3]
recipes.remove(<refinedstorage:processor:*>);
mods.cyclicmagic.Packager.addRecipe(<refinedstorage:processor:0>, processorIngrs + <ore:plateIron>.firstItem);
mods.cyclicmagic.Packager.addRecipe(<refinedstorage:processor:1>, processorIngrs + <ore:plateElectrum>.firstItem);
mods.cyclicmagic.Packager.addRecipe(<refinedstorage:processor:2>, processorIngrs + <ore:plateEnderium>.firstItem);
