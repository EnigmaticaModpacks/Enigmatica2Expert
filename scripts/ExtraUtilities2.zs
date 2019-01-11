#modloaded extrautils2
print("--- loading ExtraUtilities2.zs ---");
	
# *======= Recipes =======*

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
	
# Removing and re-adding all generators
	recipes.remove(<extrautils2:machine>);
	recipes.addShaped("EnderGen", <extrautils2:machine>.withTag({Type: "extrautils2:generator_ender"}), [[<ore:enderpearl>, <ore:enderpearl>, <ore:enderpearl>],[<ore:enderpearl>, <ore:obsidian>, <ore:enderpearl>], [<ore:alloyBasic>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:alloyBasic>]]);
	recipes.addShaped("SurvivalGen", <extrautils2:machine>.withTag({Type: "extrautils2:generator_survival"}), [[<ore:compressed1xCobblestone>, <ore:compressed1xCobblestone>, <ore:compressed1xCobblestone>],[<ore:compressed1xCobblestone>, <ore:ingotIron>, <ore:compressed1xCobblestone>], [<ore:dustRedstone>, <minecraft:furnace>, <ore:dustRedstone>]]);
	recipes.addShaped("ExUEnchanter", <extrautils2:machine>.withTag({Type: "extrautils2:enchanter"}), [[null, <minecraft:enchanted_book>.anyDamage(), null],[<ore:gemDiamond>, <extrautils2:machine>, <ore:gemDiamond>], [<ore:ingotIron>, <minecraft:iron_ingot>, <ore:ingotIron>]]);
	recipes.addShaped("ExUCrusher", <extrautils2:machine>.withTag({Type: "extrautils2:crusher"}), [[<ore:ingotIron>, <ore:craftingPiston>, <ore:ingotIron>],[<ore:ingotIron>, <extrautils2:machine>, <ore:ingotIron>], [<ore:ingotIron>, <minecraft:sticky_piston>, <ore:ingotIron>]]);
	recipes.addShaped("ExUFurnace", <extrautils2:machine>.withTag({Type: "extrautils2:furnace"}), [[<ore:ingotBrick>, <ore:ingotBrick>, <ore:ingotBrick>],[<ore:ingotBrick>, <extrautils2:machine>, <ore:ingotBrick>], [<ore:ingotBrick>, <minecraft:brick>, <ore:ingotBrick>]]);
	recipes.addShaped("SlimeGen", <extrautils2:machine>.withTag({Type: "extrautils2:generator_slime"}), [[<ore:slimeball>, <ore:slimeball>, <ore:slimeball>],[<ore:slimeball>, <ore:blockSlime>, <ore:slimeball>], [<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);
	recipes.addShaped("DisenchantmentGen", <extrautils2:machine>.withTag({Type: "extrautils2:generator_enchant"}), [[<ore:blockMagicalWood>, <ore:blockMagicalWood>, <ore:blockMagicalWood>],[<ore:blockMagicalWood>, <minecraft:enchanting_table>, <ore:blockMagicalWood>], [<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);
	recipes.addShaped("DeathGen", <extrautils2:machine>.withTag({Type: "extrautils2:generator_death"}), [[<minecraft:rotten_flesh>, <minecraft:rotten_flesh>, <minecraft:rotten_flesh>],[<minecraft:rotten_flesh>, <minecraft:spider_eye>, <minecraft:rotten_flesh>], [<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);
	recipes.addShaped("FrostyGen", <extrautils2:machine>.withTag({Type: "extrautils2:generator_ice"}), [[<minecraft:snowball>, <minecraft:snowball>, <minecraft:snowball>],[<minecraft:snowball>, <ore:ice>, <minecraft:snowball>], [<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);
	recipes.addShaped("HalitosisGen", <extrautils2:machine>.withTag({Type: "extrautils2:generator_dragonsbreath"}), [[<minecraft:purpur_block>, <minecraft:purpur_block>, <minecraft:purpur_block>],[<minecraft:purpur_block>, <minecraft:end_rod>, <minecraft:purpur_block>], [<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);
	recipes.addShaped("ExplosiveGen", <extrautils2:machine>.withTag({Type: "extrautils2:generator_tnt"}), [[<ore:gunpowder>, <ore:gunpowder>, <ore:gunpowder>],[<ore:gunpowder>, <minecraft:tnt>, <ore:gunpowder>], [<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);
	recipes.addShaped("OverclockedGen", <extrautils2:machine>.withTag({Type: "extrautils2:generator_overclock"}), [[<ore:dyeBlue>, <ore:dyeBlue>, <ore:dyeBlue>],[<ore:dyeBlue>, <ore:blockMetal>, <ore:dyeBlue>], [<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);
	recipes.addShaped("PinkGen", <extrautils2:machine>.withTag({Type: "extrautils2:generator_pink"}), [[<ore:dyePink>, <ore:dyePink>, <ore:dyePink>],[<ore:dyePink>, <minecraft:wool:6>, <ore:dyePink>], [<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);
	recipes.addShaped("PotionGen", <extrautils2:machine>.withTag({Type: "extrautils2:generator_potion"}), [[<ore:rodBlaze>, <ore:rodBlaze>, <ore:rodBlaze>],[<ore:rodBlaze>, <minecraft:brewing_stand>, <ore:rodBlaze>], [<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);
	recipes.addShaped("CulinaryGen", <extrautils2:machine>.withTag({Type: "extrautils2:generator_culinary"}), [[<ore:listAllveggie>, <ore:listAllveggie>, <ore:listAllveggie>],[<ore:listAllveggie>, <ore:listAllmeatcooked>, <ore:listAllveggie>], [<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);
	recipes.addShaped("FurnaceGen", <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), [[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>],[<ore:plateIron>, <extrautils2:machine>, <ore:plateIron>], [<ore:dustRedstone>, <minecraft:furnace>, <ore:dustRedstone>]]);
	recipes.addShaped("MagmaticGen", <extrautils2:machine>.withTag({Type: "extrautils2:generator_redstone"}), [[<ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>],[<ore:dustRedstone>, <ore:blockRedstone>, <ore:dustRedstone>], [<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator_lava"}), <ore:dustRedstone>]]);
	recipes.addShaped("LavaGen", <extrautils2:machine>.withTag({Type: "extrautils2:generator_lava"}), [[<ore:plateGold>, <ore:plateGold>, <ore:plateGold>],[<ore:plateGold>, <minecraft:lava_bucket>, <ore:plateGold>], [<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);

# Nether Star Generator
	recipes.addShaped("Nether Star Generator", 
	<extrautils2:machine>.withTag({Type: "extrautils2:generator_netherstar"}), 
	[[<quark:black_ash>, <quark:black_ash>, <quark:black_ash>],
	[<ore:ingotEnderEnhanced>, <extendedcrafting:material:40>, <ore:ingotEnderEnhanced>], 
	[<ore:blockRedstone>, <draconicevolution:generator>, <ore:blockRedstone>]]);

# Wireless RF Transmitter
	recipes.remove(<extrautils2:powertransmitter>);
	recipes.addShapedMirrored("Wireless RF Transmitter", 
	<extrautils2:powertransmitter>, 
	[[null, <extrautils2:ingredients>, null],
	[<appliedenergistics2:material:42>, <opencomputers:card:7>, <appliedenergistics2:material:42>], 
	[<extrautils2:decorativesolid:3>, <extrautils2:decorativesolid:3>, <extrautils2:decorativesolid:3>]]);

# Wireless RF Battery
	recipes.remove(<extrautils2:powerbattery>);
	recipes.addShapedMirrored("Wireless RF Battery", 
	<extrautils2:powerbattery>, 
	[[<extrautils2:decorativesolid:3>, <immersiveengineering:metal_decoration0:3>, <extrautils2:decorativesolid:3>],
	[<ore:gemRedstone>, <actuallyadditions:item_battery>.anyDamage(), <ore:gemRedstone>], 
	[<extrautils2:decorativesolid:3>, <immersiveengineering:metal_decoration0:3>, <extrautils2:decorativesolid:3>]]);


# Rainbow Generator
	recipes.remove(<extrautils2:rainbowgenerator>);
	recipes.addShaped("Rainbow Generator", 
	<extrautils2:rainbowgenerator>, 
	[[<extrautils2:opinium:4>, <extrautils2:rainbowgenerator:2>, <extrautils2:opinium:4>],
	[<extrautils2:ingredients:16>, <draconicevolution:draconium_capacitor:1>, <extrautils2:ingredients:16>], 
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
	recipes.removeShaped(<extrautils2:machine>, 
	[[<minecraft:iron_ingot>, <minecraft:redstone>, <minecraft:iron_ingot>],
	[<minecraft:redstone>, <minecraft:chest>, <minecraft:redstone>], 
	[<minecraft:iron_ingot>, <minecraft:redstone>, <minecraft:iron_ingot>]]);
	
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
	recipes.remove(<extrautils2:drum>);
	recipes.addShapedMirrored("Stone Drum", 
	<extrautils2:drum>, 
	[[<extrautils2:compressedcobblestone:1>, <minecraft:stone_slab:*>, <extrautils2:compressedcobblestone:1>],
	[<extrautils2:decorativesolid:3>, <minecraft:bucket>, <extrautils2:decorativesolid:3>], 
	[<extrautils2:compressedcobblestone:1>, <minecraft:stone_slab:*>, <extrautils2:compressedcobblestone:1>]]);

# Iron Drum
	recipes.remove(<extrautils2:drum:1>);
	recipes.addShapedMirrored("Iron Drum",
	<extrautils2:drum:1>, 
	[[<ore:blockSheetmetalIron>, <ore:plateDenseIron>, <ore:blockSheetmetalIron>],
	[<minecraft:cauldron>, <extrautils2:drum>, <minecraft:cauldron>], 
	[<ore:blockSheetmetalIron>, <ore:plateDenseIron>, <ore:blockSheetmetalIron>]]);

# Reinforced Drum
	recipes.remove(<extrautils2:drum:2>);
	recipes.addShapedMirrored("Reinforced Drum",
	<extrautils2:drum:2>, 
	[[<ore:itemCompressedDiamond>, <ore:plateDenseGold>, <ore:itemCompressedDiamond>],
	[<extrautils2:drum:1>, <extrautils2:drum:1>, <extrautils2:drum:1>], 
	[<ore:itemCompressedDiamond>, <ore:plateDenseGold>, <ore:itemCompressedDiamond>]]);

# Gargantuan Drum
	recipes.remove(<extrautils2:drum:3>);
	recipes.addShapedMirrored("Gargantuan Drum",
	<extrautils2:drum:3>, 
	[[<tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"}), <extrautils2:klein>, <tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"})],
	[<extrautils2:drum:2>, <extrautils2:drum:2>, <extrautils2:drum:2>], 
	[<tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"}), <extrautils2:klein>, <tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"})]]);

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

# *======= Crusher =======*

//mods.extrautils2.Crusher.add(IItemStack output, IItemStack input, @Optional IItemStack secondaryOutput, @Optional float secondaryChance);
#mods.extrautils2.Crusher.add(<minecraft:gold_ingot> * 9, <minecraft:gold_block>, <minecraft:iron_ingot>, 0.1f);
#mods.extrautils2.Crusher.add(<minecraft:iron_ingot> * 9, <minecraft:iron_block>);

//mods.extrautils2.Crusher.remove(IItemStack outout);
#mods.extrautils2.Crusher.remove(<minecraft:redstone>);

# *======= Resonator =======*

//1 GP = 100 energy
//mods.extrautils2.Resonator.add(IItemStack output, IItemStack input, int energy, @Optional boolean addOwnerTag);
#mods.extrautils2.Resonator.add(<minecraft:redstone_block>, <minecraft:gold_block>, 100);
#mods.extrautils2.Resonator.add(<minecraft:gold_block>, <minecraft:iron_block>, 200, false);

//mods.extrautils2.Resonator.remove(IItemStack outout);
#mods.extrautils2.Resonator.remove(<minecraft:redstone>);

	print("--- ExtraUtilities2.zs initialized ---");