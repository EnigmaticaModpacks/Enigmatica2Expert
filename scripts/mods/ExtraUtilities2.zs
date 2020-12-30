import crafttweaker.item.IItemStack;

#modloaded extrautils2
	
# Bag of Holding
	recipes.remove(<extrautils2:bagofholding>);
	
# Diamond Spike
	recipes.remove(<extrautils2:spike_diamond>);
	recipes.addShapedMirrored("Diamond Spike", 
	<extrautils2:spike_diamond>, 
	[[null, <redstonearsenal:tool.sword_flux>.anyDamage(), null],
	[<immersiveengineering:metal_decoration1_slab:5>, <ore:itemCompressedDiamond>, <immersiveengineering:metal_decoration1_slab:5>], 
	[<ore:itemCompressedDiamond>, <ore:itemCompressedDiamond>, <ore:itemCompressedDiamond>]]);

	
# User
	recipes.remove(<extrautils2:user>);
	recipes.addShapedMirrored("extrautils2 User", 
	<extrautils2:user>, 
	[[<ore:ingotGold>, <ore:ingotRefinedObsidian>, <ore:ingotGold>],
	[<minecraft:golden_pickaxe>, <computercraft:turtle_expanded>, <minecraft:golden_axe>], 
	[<ore:compressed2xCobblestone>, <ore:compressed2xCobblestone>, <ore:compressed2xCobblestone>]]);

# User rotate
	val us1 = <integratedtunnels:part_player_simulator_item>;
	val us2 = <extrautils2:user>;
	recipes.remove(us1);
	recipes.addShapeless("User rotate 1", us2 * 2, [us1.anyDamage(), us1.anyDamage()]);
	recipes.addShapeless("User rotate 2", us1 * 2, [us2, us2]);


# Redstone Clock
	recipes.remove(<extrautils2:redstoneclock>);
	recipes.addShaped("XU2 Redstone Clock", 
	<extrautils2:redstoneclock>, 
	[[<appliedenergistics2:smooth_sky_stone_block>, <randomthings:advancedredstonetorch_on>, <appliedenergistics2:smooth_sky_stone_block>],
	[<randomthings:advancedredstonetorch_on>, <ore:gemRedstone>, <randomthings:advancedredstonetorch_on>], 
	[<appliedenergistics2:smooth_sky_stone_block>, <randomthings:advancedredstonetorch_on>, <appliedenergistics2:smooth_sky_stone_block>]]);

# Melting Ender Lilies
	scripts.wrap.thermalexpansion.Crucible.addRecipe(<liquid:ender> * 2000, <extrautils2:enderlilly>, 100000);

# Removing Easy Moon Stone recipe
	recipes.remove(<extrautils2:ingredients:5>);
	recipes.addShaped("Moon Stone", 
	<extrautils2:ingredients:5>, 
	[[<ore:dustLunar>, <ore:dustLunar>, <ore:dustLunar>],
	[<ore:dustLunar>, <ore:ingotUnstable>, <ore:dustLunar>], 
	[<ore:dustLunar>, <ore:dustLunar>, <ore:dustLunar>]]);

# Nether Star Generator
	recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_netherstar"}),true);
	recipes.addShaped("Nether Star Generator", 
	<extrautils2:machine>.withTag({Type: "extrautils2:generator_netherstar"}), 
	[[<quark:black_ash>, <quark:black_ash>, <quark:black_ash>],
	[<ore:ingotEnderEnhanced>, <extendedcrafting:material:40>, <ore:ingotEnderEnhanced>], 
	[<ore:blockRedstone>, <draconicevolution:generator>, <ore:blockRedstone>]]);

# Fixing the Slime generator recipe (something went wrong with the oredict)
	recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_slime"}),true);
	recipes.addShaped("SlimeGen", 
	<extrautils2:machine>.withTag({Type: "extrautils2:generator_slime"}), 
	[[<ore:slimeball>, <ore:slimeball>, <ore:slimeball>],
	[<ore:slimeball>, <ore:blockSlime>, <ore:slimeball>], 
	[<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);

# Wireless RF Transmitter
	recipes.remove(<extrautils2:powertransmitter>);
	recipes.addShapedMirrored("Wireless RF Transmitter", 
	<extrautils2:powertransmitter>, 
	[[null, <extrautils2:ingredients>, null],
	[null, <appliedenergistics2:material:42>, null], 
	[<extrautils2:decorativesolid:3>, <extrautils2:decorativesolid:3>, <extrautils2:decorativesolid:3>]]);

# Wireless RF Battery
	recipes.remove(<extrautils2:powerbattery>);
	recipes.addShapedMirrored("Wireless RF Battery", 
	<extrautils2:powerbattery>, 
	[[<extrautils2:decorativesolid:3>, <ore:blockRedstone>, <extrautils2:decorativesolid:3>],
	[<ore:gemRedstone>, <immersiveengineering:metal_decoration0:3>, <ore:gemRedstone>], 
	[<extrautils2:decorativesolid:3>, <ore:blockRedstone>, <extrautils2:decorativesolid:3>]]);

# Rainbow Generator
	recipes.remove(<extrautils2:rainbowgenerator>);
	recipes.addShaped("Rainbow Generator", 
	<extrautils2:rainbowgenerator>, 
	[[<extrautils2:opinium:4>, <extrautils2:rainbowgenerator:2>, <extrautils2:opinium:4>],
	[<extrautils2:ingredients:16>, <draconicevolution:draconium_capacitor:1>, <extrautils2:ingredients:16>], 
	[<extrautils2:opinium:4>, <extrautils2:rainbowgenerator:1>, <extrautils2:opinium:4>]]);
	
# Transper Pipe
	recipes.remove(<extrautils2:pipe>);
	recipes.addShaped("Transfer Pipe", 
	<extrautils2:pipe> * 32, 
	[[<minecraft:stone_slab>, <minecraft:stone_slab>, <minecraft:stone_slab>],
	[<xnet:netcable:*>, <ore:blockRedstone>, <xnet:netcable:*>], 
	[<minecraft:stone_slab>, <minecraft:stone_slab>, <minecraft:stone_slab>]]);

# Analog Crafter
	recipes.remove(<extrautils2:analogcrafter>);
	recipes.addShaped("Analog Crafter",
	<extrautils2:analogcrafter>, 
	[[<ore:workbench>, <ore:workbench>, <ore:workbench>],
	[<ore:workbench>, <minecraft:lever>, <ore:workbench>], 
	[<ore:workbench>, <ore:workbench>, <ore:workbench>]]);

# Resonator
	recipes.remove(<extrautils2:resonator>);
	recipes.addShaped("Resonator",
	<extrautils2:resonator>, 
	[[<ore:circuitAdvanced>, <extrautils2:machine>, <ore:circuitAdvanced>],
	[<ore:plateSteel>, <chisel:glass:1>, <ore:plateSteel>], 
	[<ore:plateSteel>, <ore:blockCoalCoke>, <ore:plateSteel>]]);

# Machine Block
	recipes.remove(<extrautils2:machine>, true);
	
	var polishedStone = <extrautils2:decorativesolid:2>;
# IC2
	recipes.addShaped("ExtraUtilities2 Machine Block IC2", 
	<extrautils2:machine>, 
	[[polishedStone, <ic2:resource:11>, polishedStone],
	[<ic2:resource:11>, <ic2:resource:12>, <ic2:resource:11>], 
	[polishedStone, <ic2:resource:11>, polishedStone]]);
# IE
	recipes.addShapedMirrored("ExtraUtilities2 Machine Block IE", 
	<extrautils2:machine>, 
	[[polishedStone, <ore:blockSheetmetalIron>, polishedStone],
	[<ore:blockSheetmetalIron>, <ore:electronTube>, <ore:blockSheetmetalIron>], 
	[polishedStone, <ore:blockSheetmetalIron>, polishedStone]]);
# Forestry
	recipes.addShaped("ExtraUtilities2 Machine Block Forestry", 
	<extrautils2:machine> * 3, 
	[[polishedStone, <forestry:thermionic_tubes:3>, polishedStone],
	[<forestry:thermionic_tubes:3>, <forestry:sturdy_machine>, <forestry:thermionic_tubes:3>], 
	[polishedStone, <forestry:thermionic_tubes:3>, polishedStone]]);

# Stone Drum
	recipes.removeByRecipeName("extrautils2:drum_16");
	recipes.addShapedMirrored("Stone Drum", 
	<extrautils2:drum>, 
	[[<extrautils2:compressedcobblestone:1>, <minecraft:stone_slab:*>, <extrautils2:compressedcobblestone:1>],
	[<extrautils2:decorativesolid:3>, <minecraft:bucket>, <extrautils2:decorativesolid:3>], 
	[<extrautils2:compressedcobblestone:1>, <minecraft:stone_slab:*>, <extrautils2:compressedcobblestone:1>]]);

# Iron Drum
	recipes.removeByRecipeName("extrautils2:drum_256");
	recipes.addShapedMirrored("Iron Drum",
	<extrautils2:drum:1>, 
	[[<ore:blockSheetmetalIron>, <ore:plateDenseIron>, <ore:blockSheetmetalIron>],
	[<minecraft:cauldron>, <extrautils2:drum>, <minecraft:cauldron>], 
	[<ore:blockSheetmetalIron>, <ore:plateDenseIron>, <ore:blockSheetmetalIron>]]);

# Klein Flask
	recipes.remove(<extrautils2:klein>);
	recipes.addShapedMirrored("Klein Flask", 
	<extrautils2:klein>, 
	[[<tconstruct:clear_glass>, <ore:dustEnder>, <tconstruct:clear_glass>],
	[<ore:dustEnder>, <minecraft:experience_bottle>, <ore:dustEnder>], 
	[<tconstruct:clear_glass>, <ore:dustEnder>, <tconstruct:clear_glass>]]);
	
# Resonating Redstone Crystal
	recipes.removeShapeless(<extrautils2:ingredients> * 2, 
	[<minecraft:redstone_ore>, <thermalfoundation:material:1027>]);

# Reinforced Drum
recipes.removeByRecipeName("extrautils2:drum_4096");
recipes.addShapedMirrored("Reinforced Drum",
	<extrautils2:drum:2>, [
		[<thermalfoundation:upgrade:33>, <botania:storage:3>, <thermalfoundation:upgrade:33>],
		[<extrautils2:drum:1>, <extrautils2:drum:1>, <extrautils2:drum:1>], 
		[<thermalfoundation:upgrade:33>, <botania:storage:3>, <thermalfoundation:upgrade:33>]
	]);

# Gargantuan Drum
var demonPlate = <tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"});
recipes.removeByRecipeName("extrautils2:drum_65536");
recipes.addShapedMirrored("Gargantuan Drum",
	<extrautils2:drum:3>, [
		[demonPlate, <liquid:high_pressure_steam>*1000, demonPlate],
		[<extrautils2:drum:2>, <extrautils2:drum:2>, <extrautils2:drum:2>], 
		[demonPlate, <liquid:high_pressure_steam>*1000, demonPlate]
		]);

# Sun crystal
recipes.remove(<extrautils2:suncrystal:*>);
var sunIngr = <liquid:glowstone> * 1000; # <volumetricflask:volumetric_flask_2000>.withTag({Fluid: {FluidName: "glowstone", Amount: 2000}});
recipes.addShaped(<extrautils2:suncrystal:250>, [
	[null, sunIngr, null],
	[sunIngr, <ic2:energy_crystal>.anyDamage(), sunIngr], 
	[null, sunIngr, null]]);

# Not sure if this would work:
vanilla.seeds.removeSeed(<extrautils2:enderlilly>);

# Remake Chunk loader recipe
remakeEx(<extrautils2:chunkloader>, [
	[<ore:stickTreatedWood>, <ore:eyeofredstone>, <ore:stickTreatedWood>],
	[<ore:stickTreatedWood>, <extrautils2:goldenlasso>.withTag({Animal: {id:"minecraft:villager"}}), <ore:stickTreatedWood>],
	[null, <ore:stickTreatedWood>, null]]);

# Fix generator (probably ench table is invisible because of Quark ench changes)
remakeEx(<extrautils2:machine>.withTag({Type: "extrautils2:generator_enchant"}), [
	[<ore:blockMagicalWood>, <ore:blockMagicalWood>, <ore:blockMagicalWood>],
	[<ore:blockMagicalWood>, <minecraft:enchanting_table>, <ore:blockMagicalWood>],
	[<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);

# Cut enderpearl into pieces
scripts.process.mash(<minecraft:ender_pearl> , <extrautils2:endershard> * 8, null);

# Blue quartz as ultimate grid user
//mods.extrautils2.Resonator.add(IItemStack output, IItemStack input, int energy, @Optional boolean addOwnerTag);
scripts.wrap.extrautils2.Resonator.add(<extrautils2:decorativesolid:6>, <botania:quartztypemana>, 700 * 100);

# Harder Player Chest (was most easy player interface)
craft.remake(<extrautils2:playerchest>, ["pretty",
	"A A A",
	"A C A",
	"A B A"], {
	A: <extrautils2:decorativesolid:7>,
	B: <extrautils2:ingredients:12>,
	C: <enderstorage:ender_storage>,
});

# [Deep_Dark_Portal] from [Black_Iron_Lamp][+3]
craft.remake(<extrautils2:teleporter:1>, ["pretty",
  "░ ☺ ░",
  "◊ B ◊",
  "░ ☺ ░"], {
  "░": <ore:compressed5xCobblestone>, # Sextuple Compressed Cobblestone
  "B": <extendedcrafting:lamp:1>,     # Black Iron Lamp
  "◊": <ore:gemIridium>,              # Iridium Ore
  "☺": <contenttweaker:blasted_coal>  # Blasted Coal
});

# [Ender_Porcupine] from [Indexer][+2]
craft.remake(<extrautils2:interactionproxy>, ["pretty",
  "E T E",
  "T I T",
  "E T E"], {
  "T": <cd4017be_lib:m:402>,     # Telekinetic Alloy
  "E": <extrautils2:enderlilly>, # Ender Lilly
  "I": <extrautils2:indexer>     # Indexer
});