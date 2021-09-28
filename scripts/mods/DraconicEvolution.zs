import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.craft.grid.Grid;
#modloaded draconicevolution

# *======= Recipes =======*

# Mob Grinder - by request of Vyraal1
	recipes.remove(<draconicevolution:grinder>);
	recipes.addShapedMirrored("Mob Grinder", 
	<draconicevolution:grinder>, 
	[[<ore:ingotElectricalSteel>, <draconicevolution:draconium_block:1>, <ore:ingotElectricalSteel>],
	[<astralsorcery:itemcrystalsword>.anyDamage(), <draconicevolution:draconic_core>, <astralsorcery:itemcrystalsword>.anyDamage()], 
	[<ore:ingotElectricalSteel>, <industrialforegoing:mob_relocator>, <ore:ingotElectricalSteel>]]);

# Charged Draconium
	scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:draconium_block:1> * 2, 2000000000, 50000000, <draconicevolution:draconium_block>, [<draconicevolution:draconium_block>]);

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
	[[<ore:gearDraconium>, <ore:ingotBlutonium>, <ore:gearDraconium>],
	[<ore:crystalLitherite>, <gendustry:genetics_processor>, <ore:crystalLitherite>], 
	[<ore:plateElite>, <draconicevolution:energy_crystal>, <ore:plateElite>]]);

# Wyvern Core
	recipes.remove(<draconicevolution:wyvern_core>);
	scripts.wrap.forestry.Carpenter.addRecipe(<draconicevolution:wyvern_core>, 
	[[<ore:shulkerShell>, <draconicevolution:draconic_core>, <ore:shulkerShell>],
	[<draconicevolution:draconic_core>, <minecraft:sponge>, <draconicevolution:draconic_core>], 
	[<ore:ingotLudicrite>, <environmentaltech:pladium>, <ore:ingotLudicrite>]], 
	40, <liquid:ic2hot_coolant> * 2000);

# Draconic Energy Core
	recipes.remove(<draconicevolution:draconic_energy_core>);
	scripts.wrap.forestry.Carpenter.addRecipe(<draconicevolution:draconic_energy_core>, 
	[[<ore:ingotDraconiumAwakened>, <draconicevolution:wyvern_energy_core>, <ore:ingotDraconiumAwakened>],
	[<draconicevolution:wyvern_energy_core>, <draconicevolution:wyvern_core>, <draconicevolution:wyvern_energy_core>], 
	[<ore:ingotDraconiumAwakened>, <draconicevolution:wyvern_energy_core>, <ore:ingotDraconiumAwakened>]], 
	40, <liquid:ic2hot_coolant> * 2000);
	
# Fusion Crafting Core
	recipes.remove(<draconicevolution:fusion_crafting_core>);
	scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe
	(<draconicevolution:fusion_crafting_core>, 1000000000, 1000000, 
	<extendedcrafting:crafting_core>, 
	[<draconicevolution:draconic_core>, <draconicevolution:wyvern_energy_core>, 
	<draconicevolution:wyvern_core>, <actuallyadditions:item_misc:19>, 
	<minecraft:nether_star>, <ic2:crafting:4>, 
	<plustic:mirionblock>, <plustic:osmiridiumblock>, <plustic:osgloglasblock>, 
	<actuallyadditions:block_empowerer>, 
	<nuclearcraft:fusion_core>, <environmentaltech:litherite>, 
	<environmentaltech:erodium>, <environmentaltech:kyronite>, 
	<environmentaltech:pladium>, <environmentaltech:ionite>, 
	<environmentaltech:aethium>, <extendedcrafting:storage:3>,
	<biomesoplenty:terrestrial_artifact>, <thermalexpansion:frame:148>]);

# Wyvern Energy Core
	recipes.remove(<draconicevolution:wyvern_energy_core>);
	scripts.wrap.thermalexpansion.Transposer.addFillRecipe
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
scripts.wrap.bloodmagic.AlchemyTable.addRecipe(<draconicevolution:energy_crystal> * 4, [
	<astralsorcery:blocklens>, <thermalfoundation:material:136>, <bigreactors:ingotcyanite>, utils.tryCatch("threng:material", <nuclearcraft:alloy:15>),
], 2000, 200, 2);

# [Dislocator] from [Chorus Glass][+3]
craft.remake(<draconicevolution:dislocator>, ["pretty",
  "F I F",
  "T ■ T",
  "F I F"], {
  "■": <ore:blockGlass>,             # Chorus Glass
  "T": <mekanism:teleportationcore>, # Teleportation Core
  "F": <randomthings:flootoken>,     # Floo Token
  "I": <rftools:infused_enderpearl>, # Infused Enderpearl
});


# Draconium chest easier
var dchest = <draconicevolution:draconium_chest>;
var ingrds as IItemStack[] = [
	<actuallyadditions:block_giant_chest_large>, 
	<draconicevolution:draconium_block>, 
	<actuallyadditions:block_giant_chest_large>, 
	<draconicevolution:draconium_block>
] as IItemStack[];
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(dchest, 20000000, 2000000, <minecraft:chest>, ingrds as IIngredient[]);
scripts.wrap.actuallyadditions.Empowerer.addRecipe(dchest, <minecraft:chest>, ingrds[0], ingrds[1], ingrds[2], ingrds[3], 20000000/4, 400, [8.0, 0.1, 0.9]);

# Combination Crafting Alternative for Ender Energy Manipulator
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(
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