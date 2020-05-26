import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.addDescription;

var vanillaToolTooltip = "Vanilla tools don't work. Use Tinkers' Construct tools.";
var rf100000 = "Requires 100.000 RF to make.";
var rf200000 = "Requires 200.000 RF to make.";
var rf300000 = "Requires 300.000 RF to make.";
var mil1 = "Requires 1.000.000 RF to make.";
var mil2 = "Requires 2.000.000 RF to make."; 
var mil10 = "Requires 10.000.000 RF to make.";
var mil12 = "Requires 12.000.000 RF to make.";
var mil100 = "Requires 100.000.000 RF to make.";
var bil1 = "Requires 1.000.000.000 RF to make.";
var atomicReconstructor = "Only obtainable through the Atomic Reconstructor.";
var metallurgic = "Only obtainable through the Metallurgic Infuser. Requires 20 Diamond Units.";
var craftable = "Craftable.";
var spaceGen = "This ore only generates on other planets.";
var spaceGenHigh = "Generates in large quantities on other planets.";
var mekanismFactories = "Factories are made by upgrading Machines in-world with Basic/Advanced/Elite Tier Installers.";
var ic2wrench = "You can safely break IC2 machines with a Pickaxe.";
var tempRecipe = "This item has a temporary crafting recipe.";

var biomesOPlentyOres as IItemStack[] = [
	<biomesoplenty:gem_ore:1>,
	<biomesoplenty:gem_ore:2>,
	<biomesoplenty:gem_ore:3>,
	<biomesoplenty:gem_ore:4>,
	<biomesoplenty:gem_ore:5>,
	<biomesoplenty:gem_ore:6>,
	<biomesoplenty:gem_ore:7>
];

for ore in biomesOPlentyOres {
	var tooltip = "Does not generate naturally. Use the Sieve to obtain Biomes O' Plenty Gems directly.";
	ore.addTooltip(tooltip);
	addDescription(ore, tooltip);
}

var metalRods as IItemStack[] = [
	<immersiveengineering:material:1>,
	<immersiveengineering:material:3>,
	<immersiveengineering:material:2>
];
	
for rod in metalRods {
	addDescription(rod, "The earliest (and cheapest) way of making Metal Rods is with the Small Plate Presser from Advanced Rocketry.");
}

addDescription(<mekanism:machineblock:2>, "Removed, because it could be used to dupe multiple ores.");

addDescription(<thermalexpansion:cache>, "Shift right click with a Crescent Hammer to pick up.", "The Cache retains it's upgrades and inventory.", "Do not break with Pickaxe!");

addDescription(<mekanism:gaugedropper>, "Can be used to clear Mekanism machines of their gases. Simply hold the Gauge Dropper and Shift Left Click the Gas from inside the Machine.");

addDescription(<environmentaltech:void_ore_miner_cont_6>, "Void Ore Miner Tier 6 specializes in generating rare ores from the void", "It does not generate common ores.");

var thaumcraftHintItems as IItemStack[] = [
	<thaumcraft:mechanism_complex>,
	<thaumcraft:mechanism_simple>,
	<thaumcraft:mirrored_glass>,
	<thaumcraft:vis_resonator>,
	<thaumcraft:fabric>,
	<thaumcraft:seal>,
	<thaumcraft:jar_normal>,
	<thaumcraft:lamp_arcane>,
	<thaumcraft:pedestal_arcane>,
	<thaumcraft:alembic>,
	<thaumcraft:metal_alchemical>,
	<thaumcraft:mind>,
	<thaumcraft:vis_battery>,
	<thaumcraft:stabilizer>,
	<thaumcraft:inlay>,
	<thaumcraft:research_table>,
	<thaumcraft:arcane_workbench>,
	<thaumcraft:smelter_basic>,
	<thaumcraft:alumentum>,
	<thaumcraft:nitor_yellow>
];

for item in thaumcraftHintItems {
	addDescription(item, "Most Thaumcraft items need to be unlocked through research in the Thaumonomicon.");
}

# Liquid Nitrogen
	addDescription(<liquid:nitrogen>, "Obtainable with Nitrogen Collectors.");
	
# Oil Generator
	addDescription(<actuallyadditions:block_oil_generator>, 
	"This item has been disabled.", 
	"Use the Thermal Expansion Compression Dynamo instead.",
	"You can craft this item into a Compression Dynamo.");
	
# Wireless Heating Coil
	addDescription(<extrautils2:ingredients:13>, "Not consumed when used in crafting recipes.");
	<extrautils2:ingredients:13>.addTooltip(format.aqua("Not consumed when used in crafting recipes"));

# Creative Wireless Crafting Terminal
	addDescription(<wct:wct_creative>,
	"The recipe is Wireless Crafting Terminal + Creative Powercell.");

# Luminous Crafting Table
	addDescription(<astralsorcery:blockaltar>,
	"The Luminous Crafting Table has to be crafted near a Floating Crystal, commonly found in Marble structures throughout the world.", 
	"See the Astral Tome for the recipe.");

#CheeseArray (yes, hashtag)
	var cheeses as IItemStack[] = [
	<animania:friesian_cheese_wheel>,
	<animania:holstein_cheese_wheel>,
	<animania:jersey_cheese_wheel>,
	<animania:goat_cheese_wheel>,
	<animania:sheep_cheese_wheel>
	];
	
# Animania Cheese
	var cheeseMold = "Made by right clicking Animania Milk into a placed Cheese Mold.";
	for cheese in cheeses {
		addDescription(cheese, cheeseMold);
	}
	
	
# Bag of Holding
	addDescription(<extrautils2:bagofholding>, "Removed due to instability.");

# Enticing Crystal
	addDescription(<enderio:item_material:17>, 
	"Villagers can be spawned by the following means:",
	"EnderIO Powered Spawner",
	"Vanilla Spawner, changed with Spawner Changer",
	"Resturbed Mob Spawner",
	"RFTools Spawner",
	"Industrial Foregoing Mob Duplicator");
	
# Crafting Core
	addDescription(<extendedcrafting:crafting_core>, "The FE/t specified in Crafting Core recipes is the maximum allowed input. Any amount of FE/t will work.");
	
# Infused Wood
	addDescription(<astralsorcery:blockinfusedwood>, "Made by dropping Wood Logs in Liquid Starlight. You need to have crafted a Luminous Crafting Table for the process to work.");
	
# Void Seed + Void Metal Temp
	<thaumcraft:void_seed>.addTooltip(tempRecipe);

# IC2 Scanner & Replicator possibilities
	addDescription(<ic2:te:63>, ["Custom blocks that can be scanned & replicated: ", "Iridium Ore", "Iridium Shard", "Electronic Circuit", "Advanced Alloy", "Advanced Machine Casing", "Thermal Expansion Machine Frame", "Advanced Coil", "RFTools Machine Frame", "Machine Case", "Iron Casing", "Advanced Computer", "Litherite Crystal", "Machine Block", "Ultimate Control Circuit", "Hardened Casing", "Fusion Crafting Core", "Secret", "All Chaos Shards"]);
	addDescription(<ic2:te:64>, ["Custom blocks that can be scanned & replicated: ", "Iridium Ore", "Iridium Shard", "Electronic Circuit", "Advanced Alloy", "Advanced Machine Casing", "Thermal Expansion Machine Frame", "Advanced Coil", "RFTools Machine Frame", "Machine Case", "Iron Casing", "Advanced Computer", "Litherite Crystal", "Machine Block", "Ultimate Control Circuit", "Hardened Casing", "Fusion Crafting Core", "Secret", "All Chaos Shards"]);

# Small Plate Press
	addDescription(<advancedrocketry:platepress>, "The Small Plate Presser can convert blocks into Plates and Rods. It's a multiblock, 3 blocks tall and 1 wide. The top block is the Small Plate Presser and the bottom is a block of Obsidian. You place the block you want to compress between the two, and apply a redstone signal to activate the Presser.");

# Tool Forge
	addDescription(<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy", Count: 1 as byte, Damage: 0 as short}}), "The Tool Forge can be crafted with any 4 Metal Blocks.");
	<tconstruct:toolforge>.anyDamage().addTooltip(format.red("(The Tool Forge can be crafted with any 4 Metal Blocks)"));

# Blood Magic Guide
	addDescription(<guideapi:bloodmagic-guide>, "Sneak-Right-Click on a Blood Altar with this book, and it will show you where to place the appropriate blocks for the different Blood Altar tiers. Right-click to change tier.");

# Thaumonomicon
	addDescription(<thaumcraft:thaumonomicon>, "Made by right-clicking a Bookshelf with Salis Mundus.");

# Arcane Workbench
	addDescription(<thaumcraft:arcane_workbench>, "Made by right-clicking a Crafting Table with Salis Mundus.");

# Crucible
	addDescription(<thaumcraft:crucible>, "Made by right-clicking a Cauldron with Salis Mundus.");

# Blood Magic Wills
	addDescription(<bloodmagic:item_demon_crystal>, "Obtained through the Gathering of the Forsaken Souls ritual.");
	addDescription(<bloodmagic:item_demon_crystal:1>, "Obtained through the Resonance of the Faceted Crystal ritual.");
	addDescription(<bloodmagic:item_demon_crystal:2>, "Obtained through the Resonance of the Faceted Crystal ritual.");
	addDescription(<bloodmagic:item_demon_crystal:3>, "Obtained through the Resonance of the Faceted Crystal ritual.");
	addDescription(<bloodmagic:item_demon_crystal:4>, "Obtained through the Resonance of the Faceted Crystal ritual.");

# Backpacks
	addDescription(<backpack:backpack:*>, ["To equip the Backpack, rebind the key in Esc > Options > Controls.", "You access the Backpack slot with Shift + the key you just selected.", "Once the Backpack is placed in the backpack slot, it can be accessed with that key."]);
	
# Solidified Experience
	addDescription(<actuallyadditions:item_solidified_experience>, "This item does not grant Experience, its only use is to make Essence of Knowledge");
	
# Neutronium
	addDescription(<avaritia:resource:2>,"Obtainable through the Neutron Collector.");
	
# XP Bucket
	addDescription(<forge:bucketfilled>.withTag({FluidName: "xpjuice", Amount: 1000}),"Obtainable through the Fluid Transposer.");

# Bibliocraft Clipboard
	addDescription(<bibliocraft:biblioclipboard>,"Removed due to instability issues.");
	
# Pumpjack
	addDescription(<forge:bucketfilled>.withTag({FluidName: "oil", Amount: 1000}),"The Pumpjack needs a pipe to bedrock to function.");
	addDescription(<liquid:oil>, "The Pumpjack needs a pipe to bedrock to function.");
	
# Energy Cell Frame
	addDescription(<thermalexpansion:frame:128>,"Requires 400 Redstone Units.");
	
# Thermal Expansion Coils
	addDescription(<thermalfoundation:material:513>,"Requires 160 Redstone Units.");
	addDescription(<thermalfoundation:material:514>,"Requires 160 Redstone Units.");
	addDescription(<thermalfoundation:material:515>,"Requires 160 Redstone Units.");

# Reinforced Cell Frame (full)
	addDescription(<thermalexpansion:frame:146>, "The Reinforced Cell Frame (Full) can only be made in a Fluid Transposer with an internal buffer of 250.000 RF or more.");

# IC2 Wrenches
	addDescription(<ic2:electric_wrench>, ic2wrench);
	addDescription(<ic2:wrench>, ic2wrench);
	
# Space Ores
	var spaceOres = [
	<thermalfoundation:ore_fluid:4>,
	<thermalfoundation:ore_fluid:3>,
	<thermalfoundation:ore_fluid:2>,
	<libvulpes:ore0>,
	<thermalfoundation:ore:7>,
	<thermalfoundation:ore:8>,
	<rftools:dimensional_shard_ore>,
	<mysticalagriculture:prosperity_ore>,
	<draconicevolution:draconium_ore>,
	<draconicevolution:draconium_ore:1>,
	<draconicevolution:draconium_ore:2>,
	<thermalfoundation:material:893>,
	<thermalfoundation:material:894>,
	<thermalfoundation:material:895>
	] as IItemStack[];
	
	for item in spaceOres {
	addDescription(item, spaceGen);
	}
	
	addDescription(<libvulpes:ore0:8>, "Rutile Ore only generates on other planets, but Titanium Ingots are craftable.");
	
# Mekanism Factories
	<mekanism:machineblock:5>.addTooltip(mekanismFactories);
	<mekanism:machineblock:6>.addTooltip(mekanismFactories);
	<mekanism:machineblock:7>.addTooltip(mekanismFactories);

	addDescription(<mekanism:machineblock:5>, mekanismFactories);
	addDescription(<mekanism:machineblock:6>, mekanismFactories);
	addDescription(<mekanism:machineblock:7>, mekanismFactories);
	
# Rock Crystals
	addDescription(<astralsorcery:blockcustomore>, spaceGenHigh);
	
# Titanium Ingot
	addDescription(<libvulpes:productingot:7>, "Obtainable through the Advanced Metallurgic Fabricator.");
	<libvulpes:productingot:7>.addTooltip(format.red("(Obtainable through the Advanced Metallurgic Fabricator)"));

# Mystical Agriculture Seeds Tier 5 -> 6
	<mysticalagriculture:ender_amethyst_seeds>.addTooltip("Tier: " + format.darkPurple("6"));
	<mysticalagriculture:enderium_seeds>.addTooltip("Tier: " + format.darkPurple("6"));
	<mysticalagriculture:iridium_seeds>.addTooltip("Tier: " + format.darkPurple("6"));
	<mysticalagriculture:terrasteel_seeds>.addTooltip("Tier: " + format.darkPurple("6"));
	
# Thermal Expansion Resonant Machine Frame (Full)
	addDescription(<thermalexpansion:frame:148>, mil100);
	
# Extreme Reactors Crystals
	<bigreactors:mineralanglesite>.displayName = "Anglesite";
	<bigreactors:mineralbenitoite>.displayName = "Benitoite";
	
	addDescription(<bigreactors:mineralanglesite>, craftable);
	addDescription(<bigreactors:mineralbenitoite>, craftable);

# Uncraftable ingots
	addDescription(<bigreactors:ingotludicrite>,"Block of Ludicrite is craftable.");

# Mana Infused Ingot
	addDescription(<thermalfoundation:material:136>,"Only obtainable through the Metallurgic Infuser, the Advanced Metallurgic Fabricator, and other planets.");

# Thermal Expansion Casings
	addDescription(<thermalexpansion:frame:129>, mil10);
	
# Actually Additions Crystals
	# Restonia
	addDescription(<actuallyadditions:item_crystal_empowered>,rf100000);
	# Palis
	addDescription(<actuallyadditions:item_crystal_empowered:1>,rf100000);
	# Diamantine
	addDescription(<actuallyadditions:item_crystal_empowered:2>,rf200000);
	# Void
	addDescription(<actuallyadditions:item_crystal_empowered:3>,mil1);
	# Emeradic
	addDescription(<actuallyadditions:item_crystal_empowered:4>,rf200000);
	# Enori
	addDescription(<actuallyadditions:item_crystal_empowered:5>,rf100000);
	
	# Restonia
	addDescription(<actuallyadditions:block_crystal_empowered>,mil1);
	# Palis
	addDescription(<actuallyadditions:block_crystal_empowered:1>,mil1);
	# Diamantine
	addDescription(<actuallyadditions:block_crystal_empowered:2>,mil2);
	# Void
	addDescription(<actuallyadditions:block_crystal_empowered:3>,mil10);
	# Emeradic
	addDescription(<actuallyadditions:block_crystal_empowered:4>,mil2);
	# Enori
	addDescription(<actuallyadditions:block_crystal_empowered:5>,mil1);

# Pam's Harvestcraft Market
	addDescription(<harvestcraft:market>,"Disabled. Use the Market from Farming For Blockheads.");

# Mekanism Ultimate Circuit
	addDescription(<mekanism:controlcircuit:3>, mil2);
	
# Mystical Agriculture Block of Prosperity
	addDescription(<mysticalagriculture:crafting:5>, "Block of Prosperity is craftable.");
	
# Vanilla tools
	
	val toolsToTooltip = [
	
	<minecraft:golden_axe>,
	<minecraft:golden_shovel>,
	<minecraft:golden_hoe>,
	<minecraft:golden_pickaxe>,
	<minecraft:golden_sword>,

	<minecraft:diamond_sword>,
	<minecraft:diamond_shovel>,
	<minecraft:diamond_axe>,
	<minecraft:diamond_pickaxe>,
	
	<minecraft:iron_shovel>,
	<minecraft:iron_axe>,
	<minecraft:iron_sword>,
	<minecraft:iron_pickaxe>,
	<minecraft:iron_hoe>,
		
	<minecraft:wooden_pickaxe>,
	<minecraft:wooden_sword>,
	<minecraft:wooden_hoe>,
	<minecraft:wooden_shovel>,
	<minecraft:wooden_axe>,
	
	<minecraft:stone_pickaxe>,
	<minecraft:stone_hoe>,
	<minecraft:stone_axe>,
	<minecraft:stone_shovel>,
	<minecraft:stone_sword>
	
	] as IItemStack[];
		
	for tool in toolsToTooltip {
		addDescription(tool, vanillaToolTooltip);
		tool.addTooltip(format.red("Vanilla tools don't work. Use Tinkers' Construct tools"));
	}
	
# Environmental Tech

# Solar Panels
	addDescription(<environmentaltech:solar_cont_1>,
		["Required Blocks:",
		"4 Null or Piezo Modifier in any combination",
		"16 Structure Frame tier 1 or above",
		"9 Solar Cell of any type"]);
	addDescription(<environmentaltech:solar_cont_2>,
		["Required Blocks:",
		"4 Null or Piezo Modifier in any combination",
		"24 Structure Frame tier 2 or above",
		"25 Solar Cell of any type"]);
	addDescription(<environmentaltech:solar_cont_3>,
		["Required Blocks:",
		"8 Null or Piezo Modifier in any combination",
		"32 Structure Frame tier 3 or above",
		"49 Solar Cell of any type"]);
	addDescription(<environmentaltech:solar_cont_4>,
		["Required Blocks:",
		"8 Null or Piezo Modifier in any combination",
		"40 Structure Frame tier 4 or above",
		"81 Solar Cell of any type"]);
	addDescription(<environmentaltech:solar_cont_5>,
		["Required Blocks:",
		"12 Null or Piezo Modifier in any combination",
		"48 Structure Frame tier 5 or above",
		"121 Solar Cell of any type"]);
	addDescription(<environmentaltech:solar_cont_6>,
		["Required Blocks:",
		"12 Null or Piezo Modifier in any combination",
		"56 Structure Frame tier 6",
		"169 Solar Cell of any type"]);
	
# Void Ore Miner
	addDescription(<environmentaltech:void_ore_miner_cont_1>,
		["Required Blocks:",
		"24 Structure Frame tier 1 or above",
		"20 Structure Panel",
		"2 Laser Core",
		"1 Laser Lens of any type"]);
	addDescription(<environmentaltech:void_ore_miner_cont_2>,
		["Required Blocks:",
		"4 Null, Speed or Accuracy Modifier in any combination",
		"32 Structure Frame tier 2 or above",
		"16 Structure Panel",
		"3 Laser Core",
		"1 Laser Lens of any type"]);
	addDescription(<environmentaltech:void_ore_miner_cont_3>,
		["Required Blocks:",
		"8 Null, Speed or Accuracy Modifier in any combination",
		"56 Structure Frame tier 3 or above",
		"52 Structure Panel",
		"4 Laser Core",
		"1 Laser Lens of any type"]);
	addDescription(<environmentaltech:void_ore_miner_cont_4>,
		["Required Blocks:",
		"12 Null, Speed or Accuracy Modifier in any combination",
		"56 Structure Frame tier 4 or above",
		"56 Structure Panel",
		"5 Laser Core",
		"1 Laser Lens of any type"]);
	addDescription(<environmentaltech:void_ore_miner_cont_5>,
		["Required Blocks:",
		"16 Null, Speed or Accuracy Modifier in any combination",
		"72 Structure Frame tier 5 or above",
		"36 Structure Panel",
		"6 Laser Core",
		"1 Laser Lens of any type"]);
	addDescription(<environmentaltech:void_ore_miner_cont_6>,
		["Required Blocks:",
		"20 Null, Speed or Accuracy Modifier in any combination",
		"92 Structure Frame tier 6",
		"56 Structure Panel",
		"6 Laser Core",
		"1 Laser Lens of any type"]);
		
# Void Resource Miner
	addDescription(<environmentaltech:void_res_miner_cont_1>,
		["Required Blocks:",
		"24 Structure Frame tier 1 or above",
		"20 Structure Panel",
		"2 Laser Core",
		"1 Laser Lens of any type"]);
	addDescription(<environmentaltech:void_res_miner_cont_2>,
		["Required Blocks:",
		"4 Null, Speed or Accuracy Modifier in any combination",
		"32 Structure Frame tier 2 or above",
		"16 Structure Panel",
		"3 Laser Core",
		"1 Laser Lens of any type"]);
	addDescription(<environmentaltech:void_res_miner_cont_3>,
		["Required Blocks:",
		"8 Null, Speed or Accuracy Modifier in any combination",
		"56 Structure Frame tier 3 or above",
		"52 Structure Panel",
		"4 Laser Core",
		"1 Laser Lens of any type"]);
	addDescription(<environmentaltech:void_res_miner_cont_4>,
		["Required Blocks:",
		"12 Null, Speed or Accuracy Modifier in any combination",
		"56 Structure Frame tier 4 or above",
		"56 Structure Panel",
		"5 Laser Core",
		"1 Laser Lens of any type"]);
	addDescription(<environmentaltech:void_res_miner_cont_5>,
		["Required Blocks:",
		"16 Null, Speed or Accuracy Modifier in any combination",
		"72 Structure Frame tier 5 or above",
		"36 Structure Panel",
		"6 Laser Core",
		"1 Laser Lens of any type"]);
	addDescription(<environmentaltech:void_res_miner_cont_6>,
		["Required Blocks:",
		"20 Null, Speed or Accuracy Modifier in any combination",
		"92 Structure Frame tier 6",
		"56 Structure Panel",
		"6 Laser Core",
		"1 Laser Lens of any type"]);
		
# Nanobot Beacon
	addDescription(<environmentaltech:nano_cont_personal_1>,
		["Required Blocks:",
		"4 Null or Potion Effect Modifier in any combination",
		"20 Structure Frame tier 1 or above",
		"12 Structure Panel"]);
	addDescription(<environmentaltech:nano_cont_personal_2>,
		["Required Blocks:",
		"8 Null or Potion Effect Modifier in any combination",
		"36 Structure Frame tier 2 or above",
		"24 Structure Panel"]);
	addDescription(<environmentaltech:nano_cont_personal_3>,
		["Required Blocks:",
		"12 Null or Potion Effect Modifier in any combination",
		"56 Structure Frame tier 3 or above",
		"40 Structure Panel"]);
	addDescription(<environmentaltech:nano_cont_personal_4>,
		["Required Blocks:",
		"16 Null or Potion Effect Modifier in any combination",
		"80 Structure Frame tier 4 or above",
		"60 Structure Panel"]);
	addDescription(<environmentaltech:nano_cont_personal_5>,
		["Required Blocks:",
		"20 Null or Potion Effect Modifier in any combination",
		"108 Structure Frame tier 5 or above",
		"84 Structure Panel"]);
	addDescription(<environmentaltech:nano_cont_personal_6>,
		["Required Blocks:",
		"24 Null or Potion Effect Modifier in any combination",
		"140 Structure Frame tier 6",
		"112 Structure Panel"]);
		
# Lightning Rod
	addDescription(<environmentaltech:lightning_cont_1>,
		["Required Blocks:",
		"4 Structure Frame tier 1 or above",
		"3 Lightning Rod",
		"3 Insulated Lightning Rod"]);
	addDescription(<environmentaltech:lightning_cont_2>,
		["Required Blocks:",
		"4 Structure Frame tier 2 or above",
		"4 Lightning Rod",
		"4 Insulated Lightning Rod"]);
	addDescription(<environmentaltech:lightning_cont_3>,
		["Required Blocks:",
		"4 Structure Frame tier 3 or above",
		"5 Lightning Rod",
		"5 Insulated Lightning Rod"]);
	addDescription(<environmentaltech:lightning_cont_4>,
		["Required Blocks:",
		"13 Structure Frame tier 4 or above",
		"4 Lightning Rod",
		"16 Insulated Lightning Rod"]);
	addDescription(<environmentaltech:lightning_cont_5>,
		["Required Blocks:",
		"13 Structure Frame tier 5 or above",
		"6 Lightning Rod",
		"22 Insulated Lightning Rod"]);
	addDescription(<environmentaltech:lightning_cont_6>,
		["Required Blocks:",
		"13 Structure Frame tier 6",
		"8 Lightning Rod",
		"28 Insulated Lightning Rod"]);

# Tooltips for IC2 matter fabricator
	var uumatterTooltips = [
"ic2:crafting", "1", "800",
"ic2:crafting", "3", "1800",
"ic2:resource", "13", "16000",
"thermalexpansion:frame", "0", "40000",
"actuallyadditions:item_misc", "8", "6000",
"rftools:machine_frame", "0", "26000",
"teslacorelib:machine_case", "0", "19000",
"actuallyadditions:block_misc", "9", "16000",
"computercraft:computer", "16384", "6000",
"environmentaltech:litherite_crystal", "0", "60000",
"mekanism:controlcircuit", "3", "15000",
"forestry:hardened_machine", "0", "18000",
"draconicevolution:fusion_crafting_core", "0", "1000000",
"draconicevolution:dragon_heart", "0", "2000000",
"draconicevolution:chaos_shard", "0", "6000000",
"draconicevolution:chaos_shard", "1", "666670",
"draconicevolution:chaos_shard", "2", "74070",
"draconicevolution:chaos_shard", "3", "8230",
"minecraft:cookie", "0", "100",
"mekanism:basicblock", "8", "17500",
"immersiveengineering:metal_decoration0", "3", "9500",
"immersiveengineering:metal_decoration0", "4", "16000",
"immersiveengineering:metal_decoration0", "5", "25000",
"minecraft:skull", "1", "50000",
"ic2:nuclear", "7", "23690",
"ic2:nuclear", "3", "213240",
"quark:crystal", "0", "25",
"quark:crystal", "1", "25",
"quark:crystal", "2", "25",
"quark:crystal", "3", "25",
"quark:crystal", "4", "25",
"quark:crystal", "5", "25",
"quark:crystal", "6", "25",
"quark:crystal", "7", "25",
"rats:ancient_sawblade", "0", "3900",
"rats:arcane_technology", "0", "3900",
"rats:block_of_cheese", "0", "180",
"rats:charged_creeper_chunk", "0", "600",
"rats:cheese", "0", "30",
"rats:chunky_cheese_token", "0", "450000",
"rats:token_piece", "0", "4500",
"rats:token_fragment", "0", "450",
"rats:tiny_coin", "0", "45",
"rats:compressed_rat", "0", "600",
"rats:feral_bagh_nakhs", "0", "1200",
"rats:feral_rat_claw", "0", "2400",
"rats:gem_of_ratlantis", "0", "2400",
"rats:herb_bundle", "0", "300",
"rats:idol_of_ratlantis", "0", "2400",
"rats:little_black_squash_balls", "0", "60",
"rats:marbled_cheese_golem_core", "0", "3900",
"rats:marbled_cheese_rat_head", "0", "1950",
"rats:marbled_cheese_raw", "0", "8",
"rats:plague_leech", "0", "600",
"rats:psionic_rat_brain", "0", "3900",
"rats:rat_breeding_lantern", "0", "1050",
"rats:rat_cage", "0", "600",
"rats:rat_diamond", "0", "300",
"rats:rat_toga", "0", "840",
"rats:rat_upgrade_basic_ratlantean", "0", "1125",
"rats:rat_upgrade_basic", "0", "390",
"rats:rat_upgrade_combined", "0", "1650",
"rats:ratglove_flower", "0", "105",
"rats:ratglove_petals", "0", "1050",
"rats:ratlantean_flame", "0", "570",
"rats:treacle", "0", "3900",
"rats:vial_of_sentience", "0", "1950",
"actuallyadditions:item_crystal_shard", "0", "440",
"actuallyadditions:item_crystal_shard", "1", "440",
"actuallyadditions:item_crystal_shard", "2", "440",
"actuallyadditions:item_crystal_shard", "3", "440",
"actuallyadditions:item_crystal_shard", "4", "440",
"actuallyadditions:item_crystal_shard", "5", "440",
"appliedenergistics2:material", "0", "1371",
"appliedenergistics2:sky_stone_block", "0", "37",
"biomesoplenty:ash", "0", "282",
"biomesoplenty:bamboo", "0", "17",
"biomesoplenty:plant_1", "5", "17",
"chisel:basalt2", "7", "49",
"chisel:marble2", "7", "93",
"deepmoblearning:glitch_infused_ingot", "0", "31000",
"enderio:item_alloy_nugget", "0", "1920",
"enderio:item_alloy_nugget", "1", "1920",
"enderio:item_alloy_nugget", "2", "1920",
"enderio:item_alloy_nugget", "3", "1920",
"enderio:item_alloy_nugget", "4", "1920",
"enderio:item_alloy_nugget", "5", "1920",
"enderio:item_alloy_nugget", "6", "1920",
"enderio:item_alloy_nugget", "7", "1920",
"enderio:item_alloy_nugget", "8", "1920",
"forestry:apatite", "0", "1515",
"immersiveengineering:ore", "5", "246",
"immersiveengineering:treated_wood", "0", "140",
"mekanism:oreblock", "0", "261",
"mekanism:polyethene", "0", "343",
"minecraft:apple", "0", "37",
"minecraft:beef", "0", "41",
"minecraft:beetroot", "0", "18",
"minecraft:beetroot_seeds", "0", "18",
"minecraft:blaze_rod", "0", "4800",
"minecraft:bone", "0", "39",
"minecraft:book", "0", "160",
"minecraft:bucket", "0", "240",
"minecraft:carrot", "0", "18",
"minecraft:chest", "0", "1200",
"minecraft:chicken", "0", "41",
"minecraft:chorus_fruit", "0", "290",
"minecraft:clay_ball", "0", "56",
"minecraft:coal", "0", "134",
"minecraft:dirt", "0", "4",
"minecraft:dye", "0", "40",
"minecraft:dye", "1", "40",
"minecraft:dye", "2", "40",
"minecraft:dye", "3", "40",
"minecraft:dye", "4", "40",
"minecraft:dye", "5", "40",
"minecraft:dye", "6", "40",
"minecraft:dye", "7", "40",
"minecraft:dye", "8", "40",
"minecraft:dye", "9", "40",
"minecraft:dye", "10", "40",
"minecraft:dye", "11", "40",
"minecraft:dye", "12", "40",
"minecraft:dye", "13", "40",
"minecraft:dye", "14", "40",
"minecraft:dye", "15", "40",
"minecraft:ender_pearl", "0", "1800",
"minecraft:feather", "0", "25",
"minecraft:flint", "0", "722",
"minecraft:glowstone_dust", "0", "650",
"minecraft:gold_ore", "0", "198",
"minecraft:golden_carrot", "0", "170",
"minecraft:gravel", "0", "81",
"minecraft:leather", "0", "98",
"minecraft:log", "0", "100",
"minecraft:log", "1", "100",
"minecraft:log", "2", "100",
"minecraft:log", "3", "100",
"minecraft:log2", "0", "100",
"minecraft:log2", "1", "100",
"minecraft:melon_seeds", "0", "37",
"minecraft:mutton", "0", "41",
"minecraft:nether_brick", "0", "244",
"minecraft:nether_star", "0", "210000",
"minecraft:nether_wart", "0", "62",
"minecraft:netherrack", "0", "40",
"minecraft:obsidian", "0", "2400",
"minecraft:planks", "0", "50",
"minecraft:planks", "1", "50",
"minecraft:planks", "2", "50",
"minecraft:planks", "3", "50",
"minecraft:planks", "4", "50",
"minecraft:planks", "5", "50",
"minecraft:poisonous_potato", "0", "42",
"minecraft:potato", "0", "18",
"minecraft:pumpkin_seeds", "0", "37",
"minecraft:quartz", "0", "300",
"minecraft:rabbit", "0", "41",
"minecraft:redstone", "0", "17",
"minecraft:reeds", "0", "27",
"minecraft:rotten_flesh", "0", "41",
"minecraft:sand", "0", "297",
"minecraft:sandstone", "0", "417",
"minecraft:sapling", "0", "300",
"minecraft:slime_ball", "0", "120",
"minecraft:snowball", "0", "153",
"minecraft:soul_sand", "0", "556",
"minecraft:spider_eye", "0", "53",
"minecraft:stick", "0", "17",
"minecraft:stone", "1", "30",
"minecraft:stone", "3", "30",
"minecraft:stone", "5", "30",
"minecraft:stonebrick", "0", "194",
"minecraft:string", "0", "37",
"minecraft:sugar", "0", "37",
"minecraft:water_bucket", "0", "250",
"minecraft:wheat", "0", "37",
"minecraft:wheat_seeds", "0", "37",
"minecraft:wooden_slab", "0", "25",
"minecraft:wooden_slab", "1", "25",
"minecraft:wooden_slab", "2", "25",
"minecraft:wooden_slab", "3", "25",
"minecraft:wooden_slab", "4", "25",
"minecraft:wooden_slab", "5", "25",
"minecraft:wool", "0", "50",
"minecraft:wool", "1", "50",
"minecraft:wool", "2", "50",
"minecraft:wool", "3", "50",
"minecraft:wool", "4", "50",
"minecraft:wool", "5", "50",
"minecraft:wool", "6", "50",
"minecraft:wool", "7", "50",
"minecraft:wool", "8", "50",
"minecraft:wool", "9", "50",
"minecraft:wool", "10", "50",
"minecraft:wool", "11", "50",
"minecraft:wool", "12", "50",
"minecraft:wool", "13", "50",
"minecraft:wool", "14", "50",
"minecraft:wool", "15", "50",
"minecraft:brown_mushroom", "0", "36",
"minecraft:red_mushroom", "0", "36",
"minecraft:mossy_cobblestone", "0", "54",
"mysticalagriculture:aluminum_essence", "0", "145",
"mysticalagriculture:amber_essence", "0", "1600",
"mysticalagriculture:apatite_essence", "0", "145",
"mysticalagriculture:aquamarine_essence", "0", "550",
"mysticalagriculture:ardite_essence", "0", "1600",
"mysticalagriculture:basalt_essence", "0", "145",
"mysticalagriculture:black_quartz_essence", "0", "550",
"mysticalagriculture:blaze_essence", "0", "1600",
"mysticalagriculture:certus_quartz_essence", "0", "550",
"mysticalagriculture:chicken_essence", "0", "145",
"mysticalagriculture:coal_essence", "0", "145",
"mysticalagriculture:cobalt_essence", "0", "1600",
"mysticalagriculture:copper_essence", "0", "145",
"mysticalagriculture:cow_essence", "0", "145",
"mysticalagriculture:crafting", "0", "43",
"mysticalagriculture:crafting", "5", "143",
"mysticalagriculture:creeper_essence", "0", "550",
"mysticalagriculture:diamond_essence", "0", "4230",
"mysticalagriculture:dirt_essence", "0", "46",
"mysticalagriculture:draconium_essence", "0", "4230",
"mysticalagriculture:dye_essence", "0", "145",
"mysticalagriculture:emerald_essence", "0", "4230",
"mysticalagriculture:end_essence", "0", "1600",
"mysticalagriculture:enderman_essence", "0", "1600",
"mysticalagriculture:experience_essence", "0", "1600",
"mysticalagriculture:fiery_ingot_essence", "0", "1600",
"mysticalagriculture:fire_essence", "0", "145",
"mysticalagriculture:fluix_essence", "0", "1600",
"mysticalagriculture:ghast_essence", "0", "1600",
"mysticalagriculture:glowstone_essence", "0", "550",
"mysticalagriculture:gold_essence", "0", "1600",
"mysticalagriculture:guardian_essence", "0", "550",
"mysticalagriculture:ice_essence", "0", "46",
"mysticalagriculture:infusion_crystal", "0", "22000",
"mysticalagriculture:iron_essence", "0", "550",
"mysticalagriculture:ironwood_essence", "0", "550",
"mysticalagriculture:knightmetal_essence", "0", "1600",
"mysticalagriculture:knightslime_essence", "0", "550",
"mysticalagriculture:lapis_lazuli_essence", "0", "1600",
"mysticalagriculture:lead_essence", "0", "550",
"mysticalagriculture:limestone_essence", "0", "145",
"mysticalagriculture:malachite_essence", "0", "1600",
"mysticalagriculture:marble_essence", "0", "145",
"mysticalagriculture:master_infusion_crystal", "0", "90000",
"mysticalagriculture:menril_essence", "0", "145",
"mysticalagriculture:mystical_flower_essence", "0", "145",
"mysticalagriculture:nature_essence", "0", "46",
"mysticalagriculture:nether_essence", "0", "550",
"mysticalagriculture:nether_quartz_essence", "0", "550",
"mysticalagriculture:nickel_essence", "0", "1600",
"mysticalagriculture:obsidian_essence", "0", "550",
"mysticalagriculture:osmium_essence", "0", "1600",
"mysticalagriculture:peridot_essence", "0", "1600",
"mysticalagriculture:pig_essence", "0", "145",
"mysticalagriculture:platinum_essence", "0", "4230",
"mysticalagriculture:quicksilver_essence", "0", "550",
"mysticalagriculture:rabbit_essence", "0", "550",
"mysticalagriculture:redstone_essence", "0", "550",
"mysticalagriculture:rock_crystal_essence", "0", "4230",
"mysticalagriculture:ruby_essence", "0", "1600",
"mysticalagriculture:saltpeter_essence", "0", "550",
"mysticalagriculture:sapphire_essence", "0", "1600",
"mysticalagriculture:sheep_essence", "0", "145",
"mysticalagriculture:silver_essence", "0", "550",
"mysticalagriculture:skeleton_essence", "0", "550",
"mysticalagriculture:sky_stone_essence", "0", "550",
"mysticalagriculture:slate_essence", "0", "145",
"mysticalagriculture:slime_essence", "0", "145",
"mysticalagriculture:spider_essence", "0", "550",
"mysticalagriculture:steeleaf_essence", "0", "550",
"mysticalagriculture:stone_essence", "0", "46",
"mysticalagriculture:sulfur_essence", "0", "145",
"mysticalagriculture:tanzanite_essence", "0", "1600",
"mysticalagriculture:thaumium_essence", "0", "1600",
"mysticalagriculture:tin_essence", "0", "550",
"mysticalagriculture:topaz_essence", "0", "1600",
"mysticalagriculture:uranium_essence", "0", "4230",
"mysticalagriculture:void_metal_essence", "0", "4230",
"mysticalagriculture:water_essence", "0", "46",
"mysticalagriculture:wood_essence", "0", "46",
"mysticalagriculture:zombie_essence", "0", "46",
"nuclearcraft:alloy", "1", "98",
"nuclearcraft:alloy", "2", "4600",
"nuclearcraft:alloy", "6", "4600",
"nuclearcraft:compound", "0", "2780",
"nuclearcraft:dust", "9", "278",
"nuclearcraft:dust", "10", "278",
"nuclearcraft:gem_dust", "1", "278",
"nuclearcraft:ore", "3", "6488",
"nuclearcraft:ore", "5", "5592",
"nuclearcraft:ore", "6", "9608",
"nuclearcraft:ore", "7", "12920",
"tconstruct:edible", "1", "120",
"tconstruct:edible", "2", "120",
"tconstruct:edible", "3", "120",
"tconstruct:edible", "4", "120",
"thermalfoundation:material", "17", "2600",
"thermalfoundation:material", "32", "95",
"thermalfoundation:material", "163", "145",
"thermalfoundation:ore", "0", "6300",
"thermalfoundation:ore", "1", "2964",
"thermalfoundation:ore", "2", "1984",
"thermalfoundation:ore", "3", "1324",
"thermalfoundation:ore", "4", "21168",
"thermalfoundation:ore", "5", "2360",
"thermalfoundation:ore", "6", "27884",
"twilightforest:castle_brick", "0", "111",
"twilightforest:deadrock", "2", "7",
"twilightforest:twilight_log", "0", "134",
"botania:flower", "0", "97",
"botania:flower", "1", "97",
"botania:flower", "2", "97",
"botania:flower", "3", "97",
"botania:flower", "4", "97",
"botania:flower", "5", "97",
"botania:flower", "6", "97",
"botania:flower", "7", "97",
"botania:flower", "8", "97",
"botania:flower", "9", "97",
"botania:flower", "10", "97",
"botania:flower", "11", "97",
"botania:flower", "12", "97",
"botania:flower", "13", "97",
"botania:flower", "14", "97",
"botania:flower", "15", "97",
"mysticalagriculture:crafting", "32", "170",
	] as string[];

	for i in 0 to uumatterTooltips.length {
		if (i%3==0) {
			var item = itemUtils.getItem(uumatterTooltips[i], uumatterTooltips[i+1]);
			if (!isNull(item)) {
				item.addTooltip(format.darkPurple("Can be replicated with ") ~ 
					format.lightPurple(((uumatterTooltips[i+2] as float) / 100) as string) ~ format.darkPurple(" mB UU"));
			}
		}
	}
	
	<extrautils2:machine>.only(function(item){return !item.hasTag;})
	.addTooltip(format.darkPurple("Can be replicated with ") ~ 
					format.lightPurple(((450 as float) / 100) as string) ~ format.darkPurple(" mB UU"));

	<modularmachinery:itemmodularium>.displayName = "Modularium Alloy";