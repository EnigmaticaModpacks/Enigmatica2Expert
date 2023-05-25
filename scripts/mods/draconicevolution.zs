import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
#modloaded draconicevolution

# Debug chest for recipes
if(utils.DEBUG) mods.jei.JEI.addItem(<draconicevolution:draconium_chest>.withTag({
  ench:[{lvl:1,id:0}], // Add enchant glow
  enchantmentColor:16711680, // Random Things can change color with this tag
  display:{Name:"Draconic Chest with Markings"},

	BCTileData: {BCManagedData: {autoSmeltMode: 0 as byte, smeltEnergyPerTick: 256, colour: -16777216, furnaceOutputBlocked: 0 as byte, burnRate: 0.0, smeltProgress: 0.0, smeltTime: 100 as byte, isSmelting: 0 as byte}, ChestColour: -16777216, RegionData: {SR_6_nsweIO: -1 as byte, SR_4_xSize: 4 as byte, SR_5_nsweIO: -1 as byte, SR_0_ySize: 10 as byte, SR_2_xPos: 16 as byte, SR_1_xSize: 4 as byte, SR_3_xPos: 24 as byte, SR_3_dufIO: -1 as byte, SR_4_ySize: 3 as byte, SR_1_yPos: 0 as byte, SR_6_dufIO: -1 as byte, SR_3_Enabled: 1 as byte, SR_1_Invalid: 0 as byte, SR_4_xPos: 4 as byte, SR_3_xSize: 2 as byte, SR_5_Enabled: 1 as byte, SR_0_yPos: 0 as byte, SR_5_Invalid: 0 as byte, SR_1_Enabled: 1 as byte, SR_2_dufIO: -1 as byte, SR_5_dufIO: -1 as byte, SR_1_xPos: 8 as byte, SR_1_nsweIO: -1 as byte, SR_3_ySize: 10 as byte, SR_3_nsweIO: -1 as byte, SR_3_yPos: 0 as byte, SR_0_xSize: 4 as byte, SR_3_Invalid: 0 as byte, SR_2_ySize: 10 as byte, SR_5_xPos: 12 as byte, SR_4_yPos: 3 as byte, SR_2_xSize: 4 as byte, SR_0_xPos: 0 as byte, SR_5_ySize: 3 as byte, SR_4_dufIO: -1 as byte, SR_1_dufIO: -1 as byte, SR_5_yPos: 3 as byte, SR_2_Enabled: 1 as byte, SR_1_ySize: 10 as byte, SR_0_dufIO: -1 as byte, SR_2_yPos: 0 as byte, SR_0_Invalid: 0 as byte, SR_4_Enabled: 1 as byte, SR_0_nsweIO: -1 as byte, SR_0_Enabled: 1 as byte, SR_4_Invalid: 0 as byte, SR_2_Invalid: 0 as byte, SR_2_nsweIO: -1 as byte, SR_4_nsweIO: -1 as byte, SR_5_xSize: 4 as byte}}}));

# *======= Recipes =======*

# Mob Grinder - by request of Vyraal1
	recipes.remove(<draconicevolution:grinder>);
	recipes.addShapedMirrored("Mob Grinder",
	<draconicevolution:grinder>,
	[[<ore:ingotElectricalSteel>, <draconicevolution:draconium_block:1>, <ore:ingotElectricalSteel>],
	[<astralsorcery:itemcrystalsword:*>.withTag({astralsorcery:{}}), <draconicevolution:draconic_core>, <astralsorcery:itemcrystalsword:*>.withTag({astralsorcery:{}})],
	[<ore:ingotElectricalSteel>, <industrialforegoing:mob_relocator>, <ore:ingotElectricalSteel>]]);

# Charged Draconium
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:draconium_block:1> * 2, 2000000000, 50000000, <draconicevolution:draconium_block>, [<draconicevolution:draconium_block>]);

# Crystal Binder
	recipes.remove(<draconicevolution:crystal_binder>);
	recipes.addShapedMirrored("DE Crystal Binder",
	<draconicevolution:crystal_binder>,
	[[null, <ore:gemDiamondRat>, <ore:ingotCobalt>],
	[null, <ore:rodBlaze>, <ore:gemDiamondRat>],
	[<actuallyadditions:item_laser_wrench>, null, null]]);

# Wyvern Tools
	recipes.remove(<draconicevolution:wyvern_sword>);
	recipes.remove(<draconicevolution:wyvern_shovel>);
	recipes.remove(<draconicevolution:wyvern_pick>);
	recipes.remove(<draconicevolution:wyvern_bow>);
	recipes.remove(<draconicevolution:wyvern_axe>);

	recipes.addShaped("Wyvern Sword", <draconicevolution:wyvern_sword>, [[<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_core>, <draconicevolution:infused_obsidian>],[<ore:blockDraconium>, <thaumcraft:elemental_sword>.anyDamage(), <ore:blockDraconium>], [<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_energy_core>, <draconicevolution:infused_obsidian>]]);
	recipes.addShaped("Wyvern Shovel", <draconicevolution:wyvern_shovel>, [[<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_core>, <draconicevolution:infused_obsidian>],[<ore:blockDraconium>, <thaumcraft:elemental_shovel>.anyDamage(), <ore:blockDraconium>], [<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_energy_core>, <draconicevolution:infused_obsidian>]]);
	recipes.addShaped("Wyvern Pickaxe", <draconicevolution:wyvern_pick>, [[<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_core>, <draconicevolution:infused_obsidian>],[<ore:blockDraconium>, <thaumcraft:elemental_pick>.anyDamage(), <ore:blockDraconium>], [<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_energy_core>, <draconicevolution:infused_obsidian>]]);
	recipes.addShaped("Wyvern Bow", <draconicevolution:wyvern_bow>, [[<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_core>, <draconicevolution:infused_obsidian>],[<ore:blockDraconium>, <extrautils2:compoundbow>.anyDamage(), <ore:blockDraconium>], [<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_energy_core>, <draconicevolution:infused_obsidian>]]);
	recipes.addShaped("Wyvern Axe", <draconicevolution:wyvern_axe>, [[<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_core>, <draconicevolution:infused_obsidian>],[<ore:blockDraconium>, <thaumcraft:elemental_axe>.anyDamage(), <ore:blockDraconium>], [<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_energy_core>, <draconicevolution:infused_obsidian>]]);

# Draconic Core
	recipes.remove(<draconicevolution:draconic_core>);
	recipes.addShapedMirrored("Draconic Core",
	<draconicevolution:draconic_core>,
	[[<ore:gearDraconium>, <ore:ingotCobalt60>, <ore:gearDraconium>],
	[<ore:crystalLitherite>, <gendustry:genetics_processor>, <ore:crystalLitherite>],
	[<ore:plateElite>, <draconicevolution:energy_crystal>, <ore:plateElite>]]);

# Wyvern Core
	recipes.remove(<draconicevolution:wyvern_core>);
	scripts.mods.forestry.Carpenter.addRecipe(<draconicevolution:wyvern_core>,
	[[<ore:shulkerShell>, <draconicevolution:draconic_core>, <ore:shulkerShell>],
	[<draconicevolution:draconic_core>, <minecraft:sponge>, <draconicevolution:draconic_core>],
	[<ore:ingotVividAlloy>, <environmentaltech:pladium>, <ore:ingotVividAlloy>]],
	40, <liquid:ic2hot_coolant> * 2000, null, 2);

# Draconic Energy Core
	recipes.remove(<draconicevolution:draconic_energy_core>);
	scripts.mods.forestry.Carpenter.addRecipe(<draconicevolution:draconic_energy_core>,
	[[<ore:ingotDraconiumAwakened>, <draconicevolution:wyvern_energy_core>, <ore:ingotDraconiumAwakened>],
	[<draconicevolution:wyvern_energy_core>, <draconicevolution:wyvern_core>, <draconicevolution:wyvern_energy_core>],
	[<ore:ingotDraconiumAwakened>, <draconicevolution:wyvern_energy_core>, <ore:ingotDraconiumAwakened>]],
	40, <liquid:ic2hot_coolant> * 2000, null, 2);

# Fusion Crafting Core
	recipes.remove(<draconicevolution:fusion_crafting_core>);
	mods.extendedcrafting.CombinationCrafting.addRecipe
	(<draconicevolution:fusion_crafting_core>, 1000000000, 1000000,
	<extendedcrafting:crafting_core>, [
		<draconicevolution:draconic_core>,
		<draconicevolution:wyvern_energy_core>,
		<draconicevolution:wyvern_core>,
		<actuallyadditions:item_misc:19>,
		<minecraft:nether_star>,
		<ic2:crafting:4>,
		<plustic:mirionblock>,
		<plustic:osmiridiumblock>,
		<plustic:osgloglasblock>,
		<actuallyadditions:block_empowerer>,
		<nuclearcraft:salt_fission_controller>,
		<environmentaltech:aethium>,
		<extendedcrafting:storage:3>,
		<biomesoplenty:terrestrial_artifact>,
		<thermalexpansion:frame:148>
	]);

# Wyvern Energy Core
	recipes.remove(<draconicevolution:wyvern_energy_core>);
	mods.thermalexpansion.Transposer.addFillRecipe
	(<draconicevolution:wyvern_energy_core>,
	<draconicevolution:draconic_core>,
	<liquid:redstone> * 10000, 250000);

# Potentiometer
	recipes.remove(<draconicevolution:potentiometer>);
	recipes.addShapedMirrored("Potentiometer", <draconicevolution:potentiometer>,
	[[null,<ore:plankWood>,null],
	[<ore:dustRedstone>,<randomthings:advancedredstonetorch_on>,<ore:dustRedstone>],
	[<minecraft:stone_slab>,<minecraft:stone_slab>,<minecraft:stone_slab>]]);

# [Basic Energy Relay Crystal] from [Fluix Steel Ingot][+3]
recipes.removeShaped(<draconicevolution:energy_crystal>);
mods.bloodmagic.AlchemyTable.addRecipe(<draconicevolution:energy_crystal> * 4, [
	<astralsorcery:blocklens>, <thermalfoundation:material:136>, <ore:ingotPlutonium242All>, utils.tryCatch("threng:material", <nuclearcraft:alloy:15>),
], 2000, 200, 2);
scripts.processUtils.avdRockXmlRecipeEx("PrecisionLaserEtcher", [
	<advancedrocketry:vacuumlaser>, <ore:ingotMithril>, <ore:ingotPlutonium242All>, <ore:ingotFluixSteel>,
], null, [<draconicevolution:energy_crystal> * 4], null, {power: 8000000, timeRequired: 20});


# [Dislocator] from [Chorus Glass][+3]
craft.remake(<draconicevolution:dislocator>, ["pretty",
  "F I F",
  "T ■ T",
  "F I F"], {
  "■": <integratedterminals:chorus_glass>, # Chorus Glass
  "T": <mekanism:teleportationcore>, # Teleportation Core
  "F": <randomthings:flootoken>,     # Floo Token
  "I": <rftools:infused_enderpearl>, # Infused Enderpearl
});

# Resetting
# [Dislocator] from [Teleportation Core][+1]
craft.reshapeless(<draconicevolution:dislocator>, "DT", {
  "D": <draconicevolution:dislocator>.anyDamage(), # Dislocator
  "T": <mekanism:teleportationcore>,               # Teleportation Core
});

# Draconium chest easier
# [Draconium Chest] from [Small Storage Crate][+2]
craft.make(<draconicevolution:draconium_chest>, ["pretty",
  "▬ ▬ ▬",
  "¤ S ¤",
  "▬ ▬ ▬"], {
  "▬": <ore:ingotDraconium>,                  # Draconium Ingot
  "¤": <ore:gearDraconium>,                   # Draconium Gear
  "S": <actuallyadditions:block_giant_chest>, # Small Storage Crate
});
craft.make(<draconicevolution:draconium_chest>, ["pretty",
  "▬ ▬ ▬",
  "¤ S ¤",
  "▬ ▬ ▬"], {
  "▬": <ore:ingotDraconium>,                  # Draconium Ingot
  "¤": <ore:gearDraconium>,                   # Draconium Gear
  "S": <randomthings:specialchest>,
});
craft.make(<draconicevolution:draconium_chest>, ["pretty",
  "▬ ▬ ▬",
  "¤ S ¤",
  "▬ ▬ ▬"], {
  "▬": <ore:ingotDraconium>,                  # Draconium Ingot
  "¤": <ore:gearDraconium>,                   # Draconium Gear
  "S": <randomthings:specialchest:1>,
});

# Combination Crafting Alternative for Ender Energy Manipulator
mods.extendedcrafting.CombinationCrafting.addRecipe(
	<draconicevolution:ender_energy_manipulator>, 12000000, 1200000,
	<randomthings:obsidianskull>, Grid(["AABCCCCCCC"], {
		A: <draconicevolution:draconic_core>,
		B: <draconicevolution:dislocator>,
		C: <deepmoblearning:pristine_matter_enderman>,
	}).shapeless());

# [Bound Dislocator (Point to Point)] from [Siren Tear][+2]
craft.reshapeless(<draconicevolution:dislocator_bound:1>, "DrDS", {
  "r": <draconicevolution:infused_obsidian>,       # Draconium Infused Obsidian
  "S": <iceandfire:siren_tear>,                    # Siren Tear
  "D": <draconicevolution:dislocator>.anyDamage(), # Dislocator
});

# [Bound Dislocator (Player)] from [Draconium Infused Obsidian][+2]
craft.reshapeless(<draconicevolution:dislocator_bound:2>, "DrS", {
  "r": <draconicevolution:infused_obsidian>,       # Draconium Infused Obsidian
  "S": <iceandfire:siren_tear>,                    # Siren Tear
  "D": <draconicevolution:dislocator>.anyDamage(), # Dislocator
});

# Harder to better fit as endgame ingredient
# Defined in other files
recipes.remove(<draconicevolution:infused_obsidian>);

# [Particle Generator] from [Draconium Block][+2]
craft.remake(<draconicevolution:particle_generator>, ["pretty",
  "D ▬ D",
  "▬ ■ ▬",
  "D ▬ D"], {
  "■": <ore:blockDraconium>,                 # Draconium Block
  "D": <draconicevolution:infused_obsidian>, # Draconium Infused Obsidian
  "▬": <ore:ingotDemonicMetal>,              # Demon Ingot
});

# [Energy Core] from [Basalt Sediment][+3]
craft.remake(<draconicevolution:energy_storage_core>, ["pretty",
  "□ D □",
  "▬ B ▬",
  "□ ▬ □"], {
  "□": <tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"}), # Demonic Large Plate
  "B": <advancedrocketry:basalt>,         # Basalt Sediment
  "D": <draconicevolution:draconic_core>, # Draconic Core
  "▬": <ore:ingotDraconium>,              # Draconium Ingot
});

# [Energy Pylon]*2 from [Basalt Sediment][+3]
craft.remake(<draconicevolution:energy_pylon> * 2, ["pretty",
  "□ D □",
  "▬ B ▬",
  "□ ▬ □"], {
  "□": <ore:plateTitanium>,               # Titanium Plate
  "B": <advancedrocketry:basalt>,         # Basalt Sediment
  "D": <draconicevolution:draconic_core>, # Draconic Core
  "▬": <ore:ingotDraconium>,              # Draconium Ingot
});

# [Energy Core Stabilizer] from [Draconic Core][+2]
craft.remake(<draconicevolution:particle_generator:2>, ["pretty",
  "¤ ■ ¤",
  "■ D ■",
  "¤ ■ ¤"], {
  "■": <ore:blockAmber>,                  # Amber Block
  "¤": <ore:gearMithril>,                 # Mana Infused Gear
  "D": <draconicevolution:draconic_core>, # Draconic Core
});

# [Energy Infuser] from [Steel Casing][+2]
craft.remake(<draconicevolution:energy_infuser>, ["pretty",
  "  ◘  ",
  "¤ ⌂ ¤"], {
  "◘": <nuclearcraft:lithium_ion_cell>.withTag({}), # Lithium Ion Cell
  "¤": <ore:gearDraconium>,                         # Draconium Gear
  "⌂": <mekanism:basicblock:8>,                     # Steel Casing
});

# [Disenchanter] from [Enchantment Table][+3]
craft.remake(<draconicevolution:diss_enchanter>, ["pretty",
  "▬ ■ ▬",
  "E n E"], {
  "▬": <ore:ingotDraconium>,         # Draconium Ingot
  "■": <ore:blockAlubrass>,          # Block of Aluminum Brass
  "E": <minecraft:enchanted_book:*>, # Enchanted Book
  "n": <minecraft:enchanting_table>, # Enchantment Table
});

# [Generator] from [Draconium Ingot][+2]
craft.remake(<draconicevolution:generator>, ["pretty",
  "▬ ⌂ ▬",
  "⌂ - ⌂",
  "▬ ⌂ ▬"], {
  "▬": <ore:ingotBrickNether>, # Nether Brick
  "⌂": <ic2:casing:5>,         # Steel Item Casing
  "-": <ore:ingotDraconium>,   # Draconium Ingot
});

# [Entity Detector] from [Eye of Ender][+3]
craft.remake(<draconicevolution:entity_detector>, ["pretty",
  "□ E □",
  "▬ □ ▬",
  "M M M"], {
  "□": <ore:plateLapis>,    # Lapis Lazuli Plate
  "E": <ore:pearlEnderEye>, # Eye of Ender
  "▬": <ore:ingotCarbon>,   # Carbon Brick
  "M": <ore:stoneMarble>,   # Marble
});

# Flux Gate
	recipes.remove(<draconicevolution:flow_gate:0>);
	recipes.addShapedMirrored("Flux Gate", 
	<draconicevolution:flow_gate:0>,
	[[<ore:ingotIron>,<draconicevolution:potentiometer>,<ore:ingotIron>],
	[<ore:blockRedstone>,<nuclearcraft:part:10>,<ore:blockRedstone>],
	[<ore:ingotIron>,<minecraft:comparator>,<ore:ingotIron>]]);

# Fluid Gate
	recipes.remove(<draconicevolution:flow_gate:8>);
	recipes.addShapedMirrored("Fluid Gate", 
	<draconicevolution:flow_gate:8>,
	[[<ore:ingotIron>,<draconicevolution:potentiometer>,<ore:ingotIron>],
	[<minecraft:bucket>,<nuclearcraft:part:10>,<minecraft:bucket>],
	[<ore:ingotIron>,<minecraft:comparator>,<ore:ingotIron>]]);
