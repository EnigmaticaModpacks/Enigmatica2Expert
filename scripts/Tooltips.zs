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

var ultimateTierInstaller = "Only works on Bins, Energy Cubes, Tanks and Gas Tanks";
<mekanism:tierinstaller:3>.addTooltip(ultimateTierInstaller);
addDescription(<mekanism:tierinstaller:3>, ultimateTierInstaller);

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
	
# Old Extreme Reactors Crystals
	<contenttweaker:anglesite>.displayName = "Anglesite";
	<contenttweaker:benitoite>.displayName = "Benitoite";
	
	addDescription(<contenttweaker:anglesite>, craftable);
	addDescription(<contenttweaker:benitoite>, craftable);

# Uncraftable ingots
	addDescription(<enderio:item_alloy_endergy_ingot:2>,"Melodic Alloy Block is craftable.");
	addDescription(<enderio:item_alloy_endergy_ingot:3>,"Stellar Alloy Block is craftable.");

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
		"actuallyadditions:block_misc",           "9",     "1600",
		"actuallyadditions:item_misc",            "8",     "600",
		"computercraft:computer",                 "16384", "600",
		"draconicevolution:chaos_shard",          "0",     "600000",
		"draconicevolution:chaos_shard",          "1",     "66667",
		"draconicevolution:chaos_shard",          "2",     "7407",
		"draconicevolution:chaos_shard",          "3",     "823",
		"draconicevolution:dragon_heart",         "0",     "200000",
		"draconicevolution:fusion_crafting_core", "0",     "100000",
		"environmentaltech:litherite_crystal",    "0",     "6000",
		"forestry:hardened_machine",              "0",     "1800",
		"ic2:crafting",                           "1",     "80",
		"ic2:crafting",                           "3",     "180",
		"ic2:nuclear",                            "3",     "21324",
		"ic2:nuclear",                            "7",     "2369",
		"ic2:resource",                           "12",    "800",
		"ic2:resource",                           "13",    "1600",
		"immersiveengineering:metal_decoration0", "3",     "950",
		"immersiveengineering:metal_decoration0", "4",     "1600",
		"immersiveengineering:metal_decoration0", "5",     "2500",
		"mekanism:basicblock",                    "8",     "1750",
		"mekanism:controlcircuit",                "3",     "1500",
		"minecraft:cookie",                       "0",     "10",
		"minecraft:skull",                        "1",     "5000",
		"quark:crystal",                          "0",     "25",
		"quark:crystal",                          "1",     "25",
		"quark:crystal",                          "2",     "25",
		"quark:crystal",                          "3",     "25",
		"quark:crystal",                          "4",     "25",
		"quark:crystal",                          "5",     "25",
		"quark:crystal",                          "6",     "25",
		"quark:crystal",                          "7",     "25",
		"rftools:machine_frame",                  "0",     "2600",
		"teslacorelib:machine_case",              "0",     "1900",
		"thermalexpansion:frame",                 "0",     "4000"
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
	

# Turbine Fuel description
<advgenerators:turbine_controller>.addShiftTooltip(
	format.darkAqua("Canola Oil")         ~  format.gray(" 10 MJ/mB\n") ~
	format.darkAqua("Crude Oil")          ~  format.gray(" 25 MJ/mB\n") ~
	format.darkAqua("Biomass")            ~  format.gray(" 30 MJ/mB\n") ~
	format.darkAqua("Biodiesel")          ~  format.gray(" 40 MJ/mB\n") ~
	format.darkAqua("Crystallized Oil")   ~  format.gray(" 40 MJ/mB\n") ~
	format.darkAqua("Biogas")             ~  format.gray(" 50 MJ/mB\n") ~
	format.darkAqua("Ethylene")           ~  format.gray(" 80 MJ/mB\n") ~
	format.darkAqua("Biofuel")            ~  format.gray(" 90 MJ/mB\n") ~
	format.darkAqua("Rocket Fuel (EiO)")  ~  format.gray(" 95 MJ/mB\n") ~
	format.darkAqua("Refined Fuel")       ~ format.gray(" 105 MJ/mB\n") ~
	format.darkAqua("Rocket Fuel (AR)")   ~ format.gray(" 110 MJ/mB\n") ~
	format.darkAqua("Empowered Oil")      ~ format.gray(" 120 MJ/mB")
,format.darkAqua("<<Hold shift to see fuel list>>"));

# Antimatter
<forge:bucketfilled>.withTag({FluidName: "blockfluidantimatter", Amount: 1000}).addTooltip(format.aqua("To obtain strike Life Essense with lightning"));

# Corium Bucket
<forge:bucketfilled>.withTag({FluidName: "corium", Amount: 1000}).addTooltip(format.red("Obtainable by melting down a Fission Reactor"));

# Unbreakable Graphite Electrode
	addDescription(<immersiveengineering:graphite_electrode>.withTag({Unbreakable: 1, display: {Lore: ["Reinforced with Titanium Iridium Alloy"], Name: "Unbreakable Graphite Electrode"}}),"Reinforced Graphite Eletrode. Repaired Graphite Electrodes are insufficient for this process");

# Adv Gen Gas Intake
	<advgenerators:gas_input>.addTooltip("Disabled");
	addDescription(<advgenerators:gas_input>,"Disabled due to a bug that was never fixed");

# Marble can be chiseled into..
	<astralsorcery:blockmarble>.addTooltip(format.aqua("Chisel Variations: Astral Sorcery & Unlimited Chisel Works"));
	<chisel:marble2:7>.addTooltip(format.aqua("Chisel Variations: Chisel & Quark"));
	<quark:marble>.addTooltip(format.aqua("Chisel Variations: Chisel & Quark"));