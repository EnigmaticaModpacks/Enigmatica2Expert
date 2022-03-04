import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.jei.JEI.removeAndHide as rh;
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
	mods.extendedcrafting.CombinationCrafting.addRecipe(<draconicevolution:draconium_block:1> * 2, 2000000000, 10000000, <draconicevolution:draconium_block>, [<draconicevolution:draconium_block>]);

# Crystal Binder
	recipes.remove(<draconicevolution:crystal_binder>);
	recipes.addShapedMirrored("DE Crystal Binder", 
	<draconicevolution:crystal_binder>, 
	[[null, <ore:gemDiamond>, <ore:ingotCobalt>],
	[null, <ore:rodBlaze>, <ore:gemDiamond>], 
	[<actuallyadditions:item_laser_wrench>, null, null]]);

# Wyvern Tools
	recipes.remove(<draconicevolution:wyvern_sword>);
	recipes.remove(<draconicevolution:wyvern_shovel>);
	recipes.remove(<draconicevolution:wyvern_pick>);
	recipes.remove(<draconicevolution:wyvern_bow>);
	recipes.remove(<draconicevolution:wyvern_axe>);
	
	recipes.addShaped("Wyvern Sword", <draconicevolution:wyvern_sword>, [[<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_core>, <draconicevolution:infused_obsidian>],[<ore:blockDraconium>, <mysticalagriculture:supremium_sword>.anyDamage(), <ore:blockDraconium>], [<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_energy_core>, <draconicevolution:infused_obsidian>]]);
	recipes.addShaped("Wyvern Shovel", <draconicevolution:wyvern_shovel>, [[<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_core>, <draconicevolution:infused_obsidian>],[<ore:blockDraconium>, <mysticalagriculture:supremium_shovel>.anyDamage(), <ore:blockDraconium>], [<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_energy_core>, <draconicevolution:infused_obsidian>]]);
	recipes.addShaped("Wyvern Pickaxe", <draconicevolution:wyvern_pick>, [[<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_core>, <draconicevolution:infused_obsidian>],[<ore:blockDraconium>, <mysticalagriculture:supremium_pickaxe>.anyDamage(), <ore:blockDraconium>], [<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_energy_core>, <draconicevolution:infused_obsidian>]]);
	recipes.addShaped("Wyvern Bow", <draconicevolution:wyvern_bow>, [[<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_core>, <draconicevolution:infused_obsidian>],[<ore:blockDraconium>, <mysticalagriculture:supremium_bow>.anyDamage(), <ore:blockDraconium>], [<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_energy_core>, <draconicevolution:infused_obsidian>]]);
	recipes.addShaped("Wyvern Axe", <draconicevolution:wyvern_axe>, [[<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_core>, <draconicevolution:infused_obsidian>],[<ore:blockDraconium>, <mysticalagriculture:supremium_axe>.anyDamage(), <ore:blockDraconium>], [<draconicevolution:infused_obsidian>, <draconicevolution:wyvern_energy_core>, <draconicevolution:infused_obsidian>]]);

# Draconic Core
	recipes.remove(<draconicevolution:draconic_core>);
	recipes.addShapedMirrored("Draconic Core", 
	<draconicevolution:draconic_core>, 
	[[<ore:blockDraconium>, <ore:ingotBlutonium>, <ore:blockDraconium>],
	[<ore:crystalLitherite>, <gendustry:genetics_processor>, <ore:crystalLitherite>], 
	[<ore:plateElite>, <draconicevolution:dislocator>, <ore:plateElite>]]);

# Wyvern Core
	recipes.remove(<draconicevolution:wyvern_core>);
	mods.forestry.Carpenter.addRecipe(<draconicevolution:wyvern_core>, 
	[[<ore:shulkerShell>, <draconicevolution:draconic_core>, <ore:shulkerShell>],
	[<draconicevolution:draconic_core>, <minecraft:nether_star>, <draconicevolution:draconic_core>], 
	[<ore:ingotLudicrite>, <environmentaltech:pladium>, <ore:ingotLudicrite>]], 
	40, <liquid:mana> * 1000);

# Draconic Energy Core
	recipes.remove(<draconicevolution:draconic_energy_core>);
	mods.forestry.Carpenter.addRecipe(<draconicevolution:draconic_energy_core>, 
	[[<ore:ingotDraconiumAwakened>, <draconicevolution:wyvern_energy_core>, <ore:ingotDraconiumAwakened>],
	[<draconicevolution:wyvern_energy_core>, <draconicevolution:wyvern_core>, <draconicevolution:wyvern_energy_core>], 
	[<ore:ingotDraconiumAwakened>, <draconicevolution:wyvern_energy_core>, <ore:ingotDraconiumAwakened>]], 
	40, <liquid:mana> * 1000);
	
# Fusion Crafting Core
	recipes.remove(<draconicevolution:fusion_crafting_core>);
	mods.extendedcrafting.CombinationCrafting.addRecipe
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
	mods.thermalexpansion.Transposer.addFillRecipe
	(<draconicevolution:wyvern_energy_core>, 
	<draconicevolution:draconic_core>, 
	<liquid:redstone> * 10000, 250000);



# Draconic chest easier
var dchest = <draconicevolution:draconium_chest>;
var ingrds as IItemStack[] = [
	<actuallyadditions:block_giant_chest_large>, 
	<draconicevolution:draconic_core>, 
	<actuallyadditions:block_giant_chest_large>, 
	<draconicevolution:draconium_block>
] as IItemStack[];
mods.extendedcrafting.CombinationCrafting.addRecipe(dchest, 20000000, 2000000, <minecraft:chest>, ingrds as IIngredient[]);
mods.actuallyadditions.Empowerer.addRecipe(dchest, <minecraft:chest>, ingrds[0], ingrds[1], ingrds[2], ingrds[3], 20000000/4, 400, [8.0, 0.1, 0.9]);


# Combination Crafting Alternative for Ender Energy Manipulator
val pearl = <rftools:infused_enderpearl>;
mods.extendedcrafting.CombinationCrafting.addRecipe(
	<draconicevolution:ender_energy_manipulator>, 12000000, 1200000, 
	<randomthings:obsidianskull>, [
		<draconicevolution:draconic_core>,
		<draconicevolution:draconic_core>,
		<draconicevolution:dislocator>,
		pearl, pearl, pearl, pearl, pearl, pearl, pearl
	]);

# Potentiometer
	recipes.remove(<draconicevolution:potentiometer>);
	recipes.addShapedMirrored("Potentiometer", <draconicevolution:potentiometer>,
	[[null,<ore:plankWood>,null],
	[<ore:dustRedstone>,<randomthings:advancedredstonetorch_on>,<ore:dustRedstone>],
	[<minecraft:stone_slab>,<minecraft:stone_slab>,<minecraft:stone_slab>]]);
	
# Basic Energy Relay Crystal
	recipes.remove(<draconicevolution:energy_crystal>);
	recipes.addShapedMirrored("Basic Energy Relay Crystal", <draconicevolution:energy_crystal>*4,
	[[<industrialforegoing:laser_lens:11>,<actuallyadditions:block_laser_relay_extreme>,<industrialforegoing:laser_lens:11>],
	[<enderio:item_alloy_ingot>,<ore:crystalAstralAny>,<enderio:item_alloy_ingot>],
	[<industrialforegoing:laser_lens:11>,<actuallyadditions:block_laser_relay_extreme>,<industrialforegoing:laser_lens:11>]]);
	
# Basic Wireless Energy Crystal
	recipes.remove(<draconicevolution:energy_crystal:6>);
	recipes.addShapedMirrored("Basic Wireless Enegy Crystal", <draconicevolution:energy_crystal:6>,
	[[<ore:dustAstralStarmetal>,<extrautils2:powertransmitter>,<ore:dustAstralStarmetal>],
	[<appliedenergistics2:material:41>,<draconicevolution:energy_crystal:0>,<appliedenergistics2:material:41>],
	[<ore:dustAstralStarmetal>,<extrautils2:powertransmitter>,<ore:dustAstralStarmetal>]]);
