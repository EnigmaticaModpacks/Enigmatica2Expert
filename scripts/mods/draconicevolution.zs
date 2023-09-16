import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
#modloaded draconicevolution

// Increase blast resistant to omit mining cheasing with dynamite
<draconicevolution:draconium_ore>.asBlock().definition.resistance = 720;

# Debug chest for recipes
if(utils.DEBUG) mods.jei.JEI.addItem(<draconicevolution:draconium_chest>.withTag({
  ench:[{lvl:1,id:0}], // Add enchant glow
  enchantmentColor:16711680, // Random Things can change color with this tag
  display:{Name:"Draconic Chest with Markings"},

	BCTileData: {BCManagedData: {autoSmeltMode: 0 as byte, smeltEnergyPerTick: 256, colour: -16777216, furnaceOutputBlocked: 0 as byte, burnRate: 0.0, smeltProgress: 0.0, smeltTime: 100 as byte, isSmelting: 0 as byte}, ChestColour: -16777216, RegionData: {SR_6_nsweIO: -1 as byte, SR_4_xSize: 4 as byte, SR_5_nsweIO: -1 as byte, SR_0_ySize: 10 as byte, SR_2_xPos: 16 as byte, SR_1_xSize: 4 as byte, SR_3_xPos: 24 as byte, SR_3_dufIO: -1 as byte, SR_4_ySize: 3 as byte, SR_1_yPos: 0 as byte, SR_6_dufIO: -1 as byte, SR_3_Enabled: 1 as byte, SR_1_Invalid: 0 as byte, SR_4_xPos: 4 as byte, SR_3_xSize: 2 as byte, SR_5_Enabled: 1 as byte, SR_0_yPos: 0 as byte, SR_5_Invalid: 0 as byte, SR_1_Enabled: 1 as byte, SR_2_dufIO: -1 as byte, SR_5_dufIO: -1 as byte, SR_1_xPos: 8 as byte, SR_1_nsweIO: -1 as byte, SR_3_ySize: 10 as byte, SR_3_nsweIO: -1 as byte, SR_3_yPos: 0 as byte, SR_0_xSize: 4 as byte, SR_3_Invalid: 0 as byte, SR_2_ySize: 10 as byte, SR_5_xPos: 12 as byte, SR_4_yPos: 3 as byte, SR_2_xSize: 4 as byte, SR_0_xPos: 0 as byte, SR_5_ySize: 3 as byte, SR_4_dufIO: -1 as byte, SR_1_dufIO: -1 as byte, SR_5_yPos: 3 as byte, SR_2_Enabled: 1 as byte, SR_1_ySize: 10 as byte, SR_0_dufIO: -1 as byte, SR_2_yPos: 0 as byte, SR_0_Invalid: 0 as byte, SR_4_Enabled: 1 as byte, SR_0_nsweIO: -1 as byte, SR_0_Enabled: 1 as byte, SR_4_Invalid: 0 as byte, SR_2_Invalid: 0 as byte, SR_2_nsweIO: -1 as byte, SR_4_nsweIO: -1 as byte, SR_5_xSize: 4 as byte}}}));

# *======= Recipes =======*

recipes.remove(<draconicevolution:celestial_manipulator>);

# Mob Grinder - by request of Vyraal1
	recipes.remove(<draconicevolution:grinder>);
	recipes.addShapedMirrored("Mob Grinder",
	<draconicevolution:grinder>,
	[[<ore:ingotElectricalSteel>, <draconicevolution:draconium_block:1>, <ore:ingotElectricalSteel>],
	[<astralsorcery:itemcrystalsword:*>.withTag({astralsorcery:{}}), <draconicevolution:crafting_injector>, <astralsorcery:itemcrystalsword:*>.withTag({astralsorcery:{}})],
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

# [Draconic Core]*2 from [Draconium Infused Obsidian][+1]
recipes.remove(<draconicevolution:draconic_core>);
scripts.process.alloy(
	[<jaopca:item_geardraconium> * 2, <draconicevolution:infused_obsidian>],
	<draconicevolution:draconic_core> * 2,
	"only: induction alloySmelter kiln"
);

# [Wyvern Core] from [Sponge][+2]
craft.remake(<draconicevolution:wyvern_core>, ["pretty",
  "D S D",
  "S p S",
  "D S D"], {
  "D": <draconicevolution:draconic_core>, # Draconic Core
  "S": <minecraft:shulker_shell>,         # Shulker Shell
  "p": <minecraft:sponge>,                # Sponge
});
mods.advancedrocketry.RecipeTweaker.forMachine('PrecisionAssembler').builder()
	.outputs(<draconicevolution:wyvern_core>)
	.input(<draconicevolution:draconic_core> * 2)
	.input(<minecraft:shulker_shell> * 2)
	.input(<minecraft:sponge>)
	.input(<fluid:redstone> * 4000)
	.power(60000).timeRequired(5).build();

# [Awakened Core] from [Vibrant Bimetal Gear][+2]
craft.remake(<draconicevolution:awakened_core>, ["pretty",
  "W ◊ W",
  "◊ ¤ ◊",
  "W ◊ W"], {
  "W": <draconicevolution:wyvern_core>, # Wyvern Core
  "◊": <ore:gemTopaz>,                  # Topaz
  "¤": <ore:gearVibrant>,               # Vibrant Bimetal Gear
});
mods.advancedrocketry.RecipeTweaker.forMachine('PrecisionLaserEtcher').builder()
	.outputs(<draconicevolution:awakened_core>)
	.input(<draconicevolution:wyvern_core> * 2)
	.input(<ore:gemTopaz> * 2)
	.input(<ore:gearVibrant>)
	.input(<fluid:glowstone> * 8000)
	.power(1200000).timeRequired(10).build();

# [Chaotic Core] from [Chaos Shard][+4]
craft.remake(<draconicevolution:chaotic_core>, ["pretty",
  "A E A",
  "■ C ■",
  "A ▄ A"], {
  "A": <draconicevolution:awakened_core>,           # Awakened Core
  "E": <ore:dragonEgg>,                             # Dragon Egg
  "■": <ore:blockEvilMetal>,                        # Block of Evil Infused Iron
  "C": <draconicevolution:chaos_shard>,             # Chaos Shard
  "▄": <contenttweaker:terrestrial_artifact_block>, # Terrestrial Artifact Block
});
mods.advancedrocketry.RecipeTweaker.forMachine('PrecisionLaserEtcher').builder()
	.outputs(<draconicevolution:chaotic_core>)
	.input(<draconicevolution:awakened_core> * 2)
	.input(<draconicevolution:chaos_shard>)
	.input(<ore:dragonEgg>)
	.input(<ore:blockEvilMetal>)
	.input(<contenttweaker:terrestrial_artifact_block>)
	.input(<fluid:silicon> * 16000)
	.power(5000000).timeRequired(20).build();

# [Wyvern Energy Core] from [Wyvern Core][+3]
recipes.remove(<draconicevolution:wyvern_energy_core>);
scripts.mods.forestry.Carpenter.addRecipe(<draconicevolution:wyvern_energy_core>, Grid(["pretty",
  "  ▬  ",
  "▬ W ▬",
  "  ■  "], {
  "▬": <ore:ingotCrystallineAlloy>,     # Crystalline Alloy Ingot
  "W": <draconicevolution:wyvern_core>, # Wyvern Core
  "■": <environmentaltech:pladium>,     # Pladium
}).shaped(), 40, <fluid:ic2hot_coolant> * 4000, null, 2);

# [Draconic Energy Core] from [Awakened Core][+2]
recipes.remove(<draconicevolution:draconic_energy_core>);
scripts.mods.forestry.Carpenter.addRecipe(<draconicevolution:draconic_energy_core>, Grid(["pretty",
  "  ▬  ",
  "▬ A ▬",
  "  ■  "], {
  "▬": <ore:ingotDraconiumAwakened>,      # Awakened Draconium Ingot
  "A": <draconicevolution:awakened_core>, # Awakened Core
  "■": <environmentaltech:ionite>,        # Ionite
}).shaped(), 40, <fluid:ic2hot_coolant> * 8000, null, 2);

# [Basic Fusion Crafting Injector] from [Genetics Processor][+5]
craft.remake(<draconicevolution:crafting_injector>, ["pretty",
  "D ▬ D",
  "* G *",
  "□ Ϟ □"], {
  "D": <draconicevolution:draconic_core>,  # Draconic Core
  "▬": <ore:ingotCobalt60>,                # Cobalt-60
  "*": <ore:crystalLitherite>,             # Litherite Crystal
  "G": <gendustry:genetics_processor>,     # Genetics Processor
  "□": <ore:plateElite>,                   # Elite Plating
  "Ϟ": <draconicevolution:energy_crystal>, # Basic Energy Relay Crystal
});

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

# [Dislocator] from [Chorus Glass][+2]
craft.remake(<draconicevolution:dislocator>, ["pretty",
  "▬ - ▬",
  "- C -",
  "▬ - ▬"], {
  "▬": <ore:ingotDraconium>,               # Draconium Ingot
  "-": <ore:ingotManyullyn>,               # Manyullyn Ingot
  "C": <integratedterminals:chorus_glass>, # Chorus Glass
});

# [Dislocator Pedestal] from [Infused Enderpearl][+2]
craft.remake(<draconicevolution:dislocator_pedestal>, ["pretty",
  "  I  ",
  "  P  ",
  "□ P □"], {
  "I": <rftools:infused_enderpearl>,           # Infused Enderpearl
  "P": <draconicevolution:particle_generator>, # Particle Generator
  "□": <tconstruct:large_plate>.withTag({Material: "manyullyn"}), # Manyullyn Large Plate
});

# Resetting
# [Dislocator] from [Teleportation Core][+1]
craft.shapeless(<draconicevolution:dislocator>, "DT", {
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

# [Ender Energy Manipulator] from [Obsidian Skull][+2]
craft.make(<draconicevolution:ender_energy_manipulator>, ["pretty",
  "  W  ",
  "W O W",
  "  D  "], {
  "W": <draconicevolution:wyvern_core>, # Wyvern Core
  "O": <randomthings:obsidianskull>, # Obsidian Skull
  "D": <draconicevolution:dislocator:*>, # Dislocator
});
scripts.mods.forestry.Carpenter.addRecipe(<draconicevolution:ender_energy_manipulator>, Grid(["pretty",
  "W O W",
  "  D  "], {
  "W": <draconicevolution:wyvern_core>, # Wyvern Core
  "O": <randomthings:obsidianskull>, # Obsidian Skull
  "D": <draconicevolution:dislocator:*>, # Dislocator
}).shaped(), 40, <fluid:hot_spring_water> * 8000, null, 1);

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
  "D": <draconicevolution:crafting_injector>,
  "▬": <ore:ingotDraconium>,              # Draconium Ingot
});

# [Energy Pylon]*2 from [Basalt Sediment][+3]
craft.remake(<draconicevolution:energy_pylon> * 2, ["pretty",
  "□ D □",
  "▬ B ▬",
  "□ ▬ □"], {
  "□": <ore:plateTitanium>,               # Titanium Plate
  "B": <advancedrocketry:basalt>,         # Basalt Sediment
  "D": <draconicevolution:crafting_injector>,
  "▬": <ore:ingotDraconium>,              # Draconium Ingot
});

# [Energy Core Stabilizer] from [Draconic Core][+2]
craft.remake(<draconicevolution:particle_generator:2>, ["pretty",
  "¤ ■ ¤",
  "■ D ■",
  "¤ ■ ¤"], {
  "■": <ore:blockAmber>,                  # Amber Block
  "¤": <ore:gearMithril>,                 # Mana Infused Gear
  "D": <draconicevolution:crafting_injector>,
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
