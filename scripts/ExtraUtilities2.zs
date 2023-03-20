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
	recipes.addShapeless("ExU User", 
	<extrautils2:user> * 2, 
	[<cyclicmagic:block_user>.anyDamage(), <cyclicmagic:block_user>.anyDamage()]);

# Redstone Clock
	recipes.remove(<extrautils2:redstoneclock>);
	recipes.addShaped("XU2 Redstone Clock", 
	<extrautils2:redstoneclock>, 
	[[<appliedenergistics2:smooth_sky_stone_block>, <randomthings:advancedredstonetorch_on>, <appliedenergistics2:smooth_sky_stone_block>],
	[<randomthings:advancedredstonetorch_on>, <ore:gemRedstone>, <randomthings:advancedredstonetorch_on>], 
	[<appliedenergistics2:smooth_sky_stone_block>, <randomthings:advancedredstonetorch_on>, <appliedenergistics2:smooth_sky_stone_block>]]);

# Melting Ender Lilies
	mods.thermalexpansion.Crucible.addRecipe(<liquid:ender> * 2000, <extrautils2:enderlilly>, 100000);

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
	[<extrautils2:ingredients:16>, <draconicevolution:draconic_core>, <extrautils2:ingredients:16>], 
	[<extrautils2:opinium:4>, <extrautils2:rainbowgenerator:1>, <extrautils2:opinium:4>]]);
	
# Angel Ring
	recipes.remove(<extrautils2:angelring:*>);
	recipes.addShaped("Angel Rings", 
	<extrautils2:angelring>, 
	[[<extrautils2:ineffableglass>, <minecraft:elytra>.anyDamage(), <extrautils2:ineffableglass>],
	[<ore:plateDenseGold>, <actuallyadditions:item_misc:19>, <ore:plateDenseGold>], 
	[<minecraft:golden_apple>, <extrautils2:chickenring:1>.anyDamage(), <minecraft:golden_apple>]]);
	
# Angel Ring Conversion
	recipes.addShapeless(<extrautils2:angelring:5>, [<ore:gemCoal>, <extrautils2:angelring:*>.anyDamage(), <ore:charcoal>]);
	recipes.addShapeless(<extrautils2:angelring:4>, [<ore:nuggetGold>, <extrautils2:angelring:*>.anyDamage(), <ore:nuggetGold>]);
	recipes.addShapeless(<extrautils2:angelring:3>, [<ore:leather>, <extrautils2:angelring:*>.anyDamage(), <ore:leather>]);
	recipes.addShapeless(<extrautils2:angelring:2>, [<ore:dye>, <extrautils2:angelring:*>.anyDamage(), <ore:dyePurple>]);
	recipes.addShapeless(<extrautils2:angelring:1>, [<ore:feather>, <extrautils2:angelring:*>.anyDamage(), <ore:feather>]);
	recipes.addShapeless(<extrautils2:angelring>, [<ore:blockGlass>, <extrautils2:angelring:*>.anyDamage(), <ore:blockGlass>]);
	
# Transper Pipe
	recipes.remove(<extrautils2:pipe>);
	recipes.addShaped("Transfer Pipe", 
	<extrautils2:pipe> * 32, 
	[[<minecraft:stone_slab>, <minecraft:stone_slab>, <minecraft:stone_slab>],
	[<xnet:netcable:*>, <ore:blockRedstone>, <xnet:netcable:*>], 
	[<minecraft:stone_slab>, <minecraft:stone_slab>, <minecraft:stone_slab>]]);

# Deep Dark portal recipe
	recipes.remove(<extrautils2:teleporter:1>);
	recipes.addShaped("Deeep Dark Portal", 
	<extrautils2:teleporter:1>, 
	[[<ore:compressed6xCobblestone>, <ore:crystalLitherite>, <ore:compressed6xCobblestone>],
	[<ore:ingotIridium>, <ore:ingotDraconium>, <ore:ingotIridium>], 
	[<ore:compressed6xCobblestone>, <ore:crystalLitherite>, <ore:compressed6xCobblestone>]]);

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

# Reinforced Drum
	recipes.removeByRecipeName("extrautils2:drum_4096");
	recipes.addShapedMirrored("Reinforced Drum",
	<extrautils2:drum:2>, 
	[[<ore:itemCompressedDiamond>, <ore:plateDenseGold>, <ore:itemCompressedDiamond>],
	[<extrautils2:drum:1>, <extrautils2:drum:1>, <extrautils2:drum:1>], 
	[<ore:itemCompressedDiamond>, <ore:plateDenseGold>, <ore:itemCompressedDiamond>]]);

# Gargantuan Drum
	recipes.removeByRecipeName("extrautils2:drum_65536");
	recipes.addShapedMirrored("Gargantuan Drum",
	<extrautils2:drum:3>, 
	[[<tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"}), <extrautils2:klein>, <tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"})],
	[<extrautils2:drum:2>, <extrautils2:drum:2>, <extrautils2:drum:2>], 
	[<tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"}), <extrautils2:klein>, <tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"})]]);


# More efficient cut enderpearl into pieces
scripts.process.mash(<minecraft:ender_pearl> , <extrautils2:endershard> * 16, null);

# Klein Flask
	recipes.remove(<extrautils2:klein>);
	recipes.addShapedMirrored("Klein Flask", 
	<extrautils2:klein>, 
	[[<tconstruct:clear_glass>, <ore:dustEnder>, <tconstruct:clear_glass>],
	[<ore:dustEnder>, <minecraft:experience_bottle>, <ore:dustEnder>], 
	[<tconstruct:clear_glass>, <ore:dustEnder>, <tconstruct:clear_glass>]]);
	
# Resonating Redstone Crystal
	recipes.removeShapeless(<extrautils2:ingredients> * 2, [<minecraft:redstone_ore>, <thermalfoundation:material:1027>]);
