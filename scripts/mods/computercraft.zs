#modloaded computercraft

<computercraft:printout>.maxStackSize = 64;

	utils.rh(<computercraft:turtle:1>);
	utils.rh(<computercraft:turtle_advanced>.withTag({leftUpgrade: 5 as short}));

# Wired Modem
	recipes.remove(<computercraft:cable:1>);
	recipes.addShapedMirrored("Wired Modem", 
	<computercraft:cable:1>, 
	[[<ore:stone>, <ore:dustRedstone>, <ore:stone>],
	[<ore:stone>, <computercraft:cable>, <ore:stone>], 
	[<ore:stone>, <ore:dustRedstone>, <ore:stone>]]);

# [Computer] from [Screen (Tier 1)][+2]
craft.reshapeless(<computercraft:computer>, "M:h", {
  "M": <opencomputers:microcontroller>, # Microcontroller
  ":": <ore:oc:screen1>,                # Screen (Tier 1)
  "h": <ore:oc:hdd1>,                   # Hard Disk Drive (Tier 1) (1MB)
});

# [Advanced Computer] from [Screen (Tier 3)][+2]
craft.reshapeless(<computercraft:computer:16384>, "Ms:", {
  "M": <opencomputers:microcontroller>, # Microcontroller
  "s": <ore:oc:screen3>,                # Screen (Tier 3)
  ":": <ore:oc:hdd3>,                   # Hard Disk Drive (Tier 3) (4MB)
});

# [Advanced Turtle] from [Turtle][+3]
recipes.removeByRecipeName("computercraft:advanced_turtle");
recipes.removeByRecipeName("computercraft:advanced_turtle_upgrade");
craft.make(<computercraft:turtle_advanced>, ["pretty",
  "⌂ I ⌂",
  ": T :",
  "⌂ ⌂ ⌂"], {
  "⌂": <ic2:casing:2>,                      # Gold Item Casing
  "I": <ironchest:iron_gold_chest_upgrade>, # Iron to Gold Chest Upgrade
  ":": <ore:oc:batteryUpgrade3>,            # Battery Upgrade (Tier 3)
  "T": <computercraft:turtle> | <computercraft:turtle_expanded>, # Turtle
});

# Pocket Computer
	recipes.remove(<computercraft:pocket_computer>);
	mods.immersiveengineering.MetalPress.addRecipe(<computercraft:pocket_computer>, <computercraft:computer>, <immersiveengineering:mold:0>, 2000);
	mods.mechanics.addCrushingBlockRecipe(<computercraft:computer>, [<computercraft:pocket_computer>], [1.0]);

# Advanced Pocket Computer
	recipes.remove(<computercraft:pocket_computer:1>);
	mods.immersiveengineering.MetalPress.addRecipe(<computercraft:pocket_computer:1>, <computercraft:computer:16384>, <immersiveengineering:mold:0>, 2000);
	mods.mechanics.addCrushingBlockRecipe(<computercraft:computer:16384>, [<computercraft:pocket_computer:1>], [1.0]);

# Add missed items to JEI
mods.jei.JEI.addItem(<opencomputers:print>);
mods.jei.JEI.addItem(<opencomputers:misc>);
mods.jei.JEI.addItem(<opencomputers:robot>);
mods.jei.JEI.addItem(<opencomputers:microcontroller>);

# [Turtle] from [Computer][+3]
recipes.removeByRecipeName("computercraft:normal_turtle");
craft.make(<computercraft:turtle_expanded>, ["pretty",
  "⌂ E ⌂",
  "¤ C ¤",
  "⌂ E ⌂"], {
  "⌂": <ic2:casing:5>,           # Steel Item Casing
  "E": <ic2:crafting:6>,         # Electric Motor
  "¤": <ore:gearIronInfinity>,   # Infinity Bimetal Gear
  "C": <computercraft:computer>, # Computer
});
