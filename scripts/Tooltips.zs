import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
import mods.jei.JEI.addDescription as ad;
print("--- loading Tooltips.zs ---");

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

ad(<thermalexpansion:cache>, "Shift right click with a Crescent Hammer to pick up.", "The Cache retains it's upgrades and inventory.", "Do not break with Pickaxe!");

ad(<mekanism:gaugedropper>, "Can be used to clear Mekanism machines of their gases. Simply hold the Gauge Dropper and Shift Left Click the Gas from inside the Machine.");

ad(<environmentaltech:void_ore_miner_cont_6>, "Void Ore Miner Tier 6 specializes in generating rare ores from the void", "It does not generate common ores.");

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
	ad(item, "Most Thaumcraft items need to be unlocked through research in the Thaumonomicon.");
}

# Liquid Nitrogen
	ad(<liquid:nitrogen>, "Obtainable with Nitrogen Collectors.");
	
# Oil Generator
	ad(<actuallyadditions:block_oil_generator>, 
	"This item has been disabled.", 
	"Use the Thermal Expansion Compression Dynamo instead.",
	"You can craft this item into a Compression Dynamo.");
	
# Wireless Heating Coil
	ad(<extrautils2:ingredients:13>, "Not consumed when used in crafting recipes.");
	<extrautils2:ingredients:13>.addTooltip(format.aqua("Not consumed when used in crafting recipes"));

# Creative Wireless Crafting Terminal
	ad(<wct:wct_creative>,
	"The recipe is Wireless Crafting Terminal + Creative Powercell.");

# Luminous Crafting Table
	ad(<astralsorcery:blockaltar>,
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
		ad(cheese, cheeseMold);
	}
	
	
# Bag of Holding
	ad(<extrautils2:bagofholding>, "Removed due to instability.");

# Enticing Crystal
	ad(<enderio:item_material:17>, 
	"Villagers can be spawned by the following means:",
	"EnderIO Powered Spawner",
	"Vanilla Spawner, changed with Spawner Changer",
	"Resturbed Mob Spawner",
	"RFTools Spawner",
	"Industrial Foregoing Mob Duplicator");
	
# Crafting Core
	ad(<extendedcrafting:crafting_core>, "The FE/t specified in Crafting Core recipes is the maximum allowed input. Any amount of FE/t will work.");
	
# Infused Wood
	ad(<astralsorcery:blockinfusedwood>, "Made by dropping Wood Logs in Liquid Starlight. You need to have crafted a Luminous Crafting Table for the process to work.");
	
# Void Seed + Void Metal Temp
	<thaumcraft:void_seed>.addTooltip(tempRecipe);

# IC2 Scanner & Replicator possibilities
	ad(<ic2:te:63>, ["Custom blocks that can be scanned & replicated: ", "Iridium Ore", "Iridium Shard", "Electronic Circuit", "Advanced Alloy", "Advanced Machine Casing", "Thermal Expansion Machine Frame", "Advanced Coil", "RFTools Machine Frame", "Machine Case", "Iron Casing", "Advanced Computer", "Litherite Crystal", "Machine Block", "Ultimate Control Circuit", "Hardened Casing", "Fusion Crafting Core", "Secret", "All Chaos Shards"]);
	ad(<ic2:te:64>, ["Custom blocks that can be scanned & replicated: ", "Iridium Ore", "Iridium Shard", "Electronic Circuit", "Advanced Alloy", "Advanced Machine Casing", "Thermal Expansion Machine Frame", "Advanced Coil", "RFTools Machine Frame", "Machine Case", "Iron Casing", "Advanced Computer", "Litherite Crystal", "Machine Block", "Ultimate Control Circuit", "Hardened Casing", "Fusion Crafting Core", "Secret", "All Chaos Shards"]);

# Small Plate Press
	ad(<advancedrocketry:platepress>, "The Small Plate Presser can convert blocks into Plates and Rods. It's a multiblock, 3 blocks tall and 1 wide. The top block is the Small Plate Presser and the bottom is a block of Obsidian. You place the block you want to compress between the two, and apply a redstone signal to activate the Presser.");

# Tool Forge
	ad(<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy", Count: 1 as byte, Damage: 0 as short}}), "The Tool Forge can be crafted with any 4 Metal Blocks.");
	<tconstruct:toolforge>.anyDamage().addTooltip(format.red("(The Tool Forge can be crafted with any 4 Metal Blocks)"));

# Blood Magic Guide
	ad(<guideapi:bloodmagic-guide>, "Sneak-Right-Click on a Blood Altar with this book, and it will show you where to place the appropriate blocks for the different Blood Altar tiers. Right-click to change tier.");

# Thaumonomicon
	ad(<thaumcraft:thaumonomicon>, "Made by right-clicking a Bookshelf with Salis Mundus.");

# Arcane Workbench
	ad(<thaumcraft:arcane_workbench>, "Made by right-clicking a Crafting Table with Salis Mundus.");

# Crucible
	ad(<thaumcraft:crucible>, "Made by right-clicking a Cauldron with Salis Mundus.");

# Blood Magic Wills
	ad(<bloodmagic:item_demon_crystal>, "Obtained through the Gathering of the Forsaken Souls ritual.");
	ad(<bloodmagic:item_demon_crystal:1>, "Obtained through the Resonance of the Faceted Crystal ritual.");
	ad(<bloodmagic:item_demon_crystal:2>, "Obtained through the Resonance of the Faceted Crystal ritual.");
	ad(<bloodmagic:item_demon_crystal:3>, "Obtained through the Resonance of the Faceted Crystal ritual.");
	ad(<bloodmagic:item_demon_crystal:4>, "Obtained through the Resonance of the Faceted Crystal ritual.");

# Backpacks
	ad(<backpack:backpack:*>, ["To equip the Backpack, rebind the key in Esc > Options > Controls.", "You access the Backpack slot with Shift + the key you just selected.", "Once the Backpack is placed in the backpack slot, it can be accessed with that key."]);
	
# Solidified Experience
	ad(<actuallyadditions:item_solidified_experience>, "This item does not grant Experience, its only use is to make Essence of Knowledge");
	
# Neutronium
	ad(<avaritia:resource:2>,"Obtainable through the Neutron Collector.");
	
# XP Bucket
	ad(<forge:bucketfilled>.withTag({FluidName: "xpjuice", Amount: 1000}),"Obtainable through the Fluid Transposer.");

# Bibliocraft Clipboard
	ad(<bibliocraft:biblioclipboard>,"Removed due to instability issues.");
	
# Pumpjack
	ad(<forge:bucketfilled>.withTag({FluidName: "oil", Amount: 1000}),"The Pumpjack needs a pipe to bedrock to function.");
	ad(<liquid:oil>, "The Pumpjack needs a pipe to bedrock to function.");
	
# Energy Cell Frame
	ad(<thermalexpansion:frame:128>,"Requires 400 Redstone Units.");
	
# Thermal Expansion Coils
	ad(<thermalfoundation:material:513>,"Requires 160 Redstone Units.");
	ad(<thermalfoundation:material:514>,"Requires 160 Redstone Units.");
	ad(<thermalfoundation:material:515>,"Requires 160 Redstone Units.");

# Special Gas Tank Item
	ad(<chiselsandbits:chiseled_fluid>.withTag({side: 3, RepairCost: 0, BlockEntityTag: {b: 3593, side: 3 as byte, s: 1, nc: 0 as byte, X: [120, -38, 99, 96, 103, -104, -63, -72, 99, 22, 75, -89, -52, -33, -55, 50, 19, -101, 116, 118, 78, -28, 104, 96, -2, -62, 122, 59, 119, 3, -125, 1, 3, 3, 27, 3, -37, 36, -49, 73, -98, 6, 20, -79, 55, -128, -39, -73, 115, 25, -112, -128, -89, -54, 6, 6, 5, -112, 56, -21, -74, -37, -37, 110, 43, -128, -40, -84, -28, -78, 13, 64, 108, -96, 93, -71, -37, 26, 64, 70, 51, 50, 48, -26, 46, 32, -42, 124, 1, 56, 91, -128, -128, -7, 75, 38, 58, 48, -63, -52, 119, 32, -46, -3, 2, 56, -20, -62, 102, -2, -94, 32, 71, 5, -122, 65, 102, 62, 41, -31, 79, 78, -8, -112, 31, -65, -76, 72, -97, 0, 93, 17, -69, -123] as byte[] as byte[], lv: 11}, display: {Name: "Creative Gas Tank Frame"}}),
	"This item is a crafting ingredient for the Creative Gas Tank.");

# Reinforced Cell Frame (full)
	ad(<thermalexpansion:frame:146>, "The Reinforced Cell Frame (Full) can only be made in a Fluid Transposer with an internal buffer of 250.000 RF or more.");

# IC2 Wrenches
	ad(<ic2:electric_wrench>, ic2wrench);
	ad(<ic2:wrench>, ic2wrench);
	
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
	ad(item, spaceGen);
	}
	
	ad(<libvulpes:ore0:8>, "Rutile Ore only generates on other planets, but Titanium Ingots are craftable.");
	
# Mekanism Factories
	<mekanism:machineblock:5>.addTooltip(mekanismFactories);
	<mekanism:machineblock:6>.addTooltip(mekanismFactories);
	<mekanism:machineblock:7>.addTooltip(mekanismFactories);

	ad(<mekanism:machineblock:5>, mekanismFactories);
	ad(<mekanism:machineblock:6>, mekanismFactories);
	ad(<mekanism:machineblock:7>, mekanismFactories);
	
# Rock Crystals
	ad(<astralsorcery:blockcustomore>, spaceGenHigh);
	
# Titanium Ingot
	ad(<libvulpes:productingot:7>, "Obtainable through the Advanced Metallurgic Fabricator.");
	<libvulpes:productingot:7>.addTooltip(format.red("(Obtainable through the Advanced Metallurgic Fabricator)"));

# Mystical Agriculture Seeds Tier 5 -> 6
	<mysticalagriculture:ender_amethyst_seeds>.addTooltip("Tier: " + format.darkPurple("6"));
	<mysticalagriculture:enderium_seeds>.addTooltip("Tier: " + format.darkPurple("6"));
	<mysticalagriculture:iridium_seeds>.addTooltip("Tier: " + format.darkPurple("6"));
	<mysticalagriculture:terrasteel_seeds>.addTooltip("Tier: " + format.darkPurple("6"));
	
# Thermal Expansion Resonant Machine Frame (Full)
	ad(<thermalexpansion:frame:148>, mil100);
	
# Extreme Reactors Crystals
	<bigreactors:minerals>.displayName = "Anglesite";
	<bigreactors:minerals:1>.displayName = "Benitoite";
	
	ad(<bigreactors:minerals>, craftable);
	ad(<bigreactors:minerals:1>, craftable);

# Uncraftable ingots
	ad(<bigreactors:ingotmetals:3>,"Block of Blutonium is craftable.");
	ad(<bigreactors:ingotmetals:4>,"Block of Ludicrite is craftable.");

# Mana Infused Ingot
	ad(<thermalfoundation:material:136>,"Only obtainable through the Metallurgic Infuser, the Advanced Metallurgic Fabricator, and other planets.");

# Thermal Expansion Casings
	ad(<thermalexpansion:frame:129>, mil10);
	
# Actually Additions Crystals
	# Restonia
	ad(<actuallyadditions:item_crystal_empowered>,rf100000);
	# Palis
	ad(<actuallyadditions:item_crystal_empowered:1>,rf100000);
	# Diamantine
	ad(<actuallyadditions:item_crystal_empowered:2>,rf200000);
	# Void
	ad(<actuallyadditions:item_crystal_empowered:3>,mil1);
	# Emeradic
	ad(<actuallyadditions:item_crystal_empowered:4>,rf200000);
	# Enori
	ad(<actuallyadditions:item_crystal_empowered:5>,rf100000);
	
	# Restonia
	ad(<actuallyadditions:block_crystal_empowered>,mil1);
	# Palis
	ad(<actuallyadditions:block_crystal_empowered:1>,mil1);
	# Diamantine
	ad(<actuallyadditions:block_crystal_empowered:2>,mil2);
	# Void
	ad(<actuallyadditions:block_crystal_empowered:3>,mil10);
	# Emeradic
	ad(<actuallyadditions:block_crystal_empowered:4>,mil2);
	# Enori
	ad(<actuallyadditions:block_crystal_empowered:5>,mil1);

# Pam's Harvestcraft Market
	ad(<harvestcraft:market>,"Disabled. Use the Market from Farming For Blockheads.");

# Mekanism Ultimate Circuit
	ad(<mekanism:controlcircuit:3>, mil2);
	
# Mystical Agriculture Block of Prosperity
	ad(<mysticalagriculture:crafting:5>, "Block of Prosperity is craftable.");
	
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
		ad(tool, vanillaToolTooltip);
		tool.addTooltip(format.red("Vanilla tools don't work. Use Tinkers' Construct tools"));
	}
	
# Environmental Tech

# Solar Panels
	ad(<environmentaltech:solar_cont_1>,
		["Required Blocks:",
		"4 Null or Piezo Modifier in any combination",
		"16 Structure Frame tier 1 or above",
		"9 Solar Cell of any type"]);
	ad(<environmentaltech:solar_cont_2>,
		["Required Blocks:",
		"4 Null or Piezo Modifier in any combination",
		"24 Structure Frame tier 2 or above",
		"25 Solar Cell of any type"]);
	ad(<environmentaltech:solar_cont_3>,
		["Required Blocks:",
		"8 Null or Piezo Modifier in any combination",
		"32 Structure Frame tier 3 or above",
		"49 Solar Cell of any type"]);
	ad(<environmentaltech:solar_cont_4>,
		["Required Blocks:",
		"8 Null or Piezo Modifier in any combination",
		"40 Structure Frame tier 4 or above",
		"81 Solar Cell of any type"]);
	ad(<environmentaltech:solar_cont_5>,
		["Required Blocks:",
		"12 Null or Piezo Modifier in any combination",
		"48 Structure Frame tier 5 or above",
		"121 Solar Cell of any type"]);
	ad(<environmentaltech:solar_cont_6>,
		["Required Blocks:",
		"12 Null or Piezo Modifier in any combination",
		"56 Structure Frame tier 6",
		"169 Solar Cell of any type"]);
	
# Void Ore Miner
	ad(<environmentaltech:void_ore_miner_cont_1>,
		["Required Blocks:",
		"24 Structure Frame tier 1 or above",
		"20 Structure Panel",
		"2 Laser Core",
		"1 Laser Lens of any type"]);
	ad(<environmentaltech:void_ore_miner_cont_2>,
		["Required Blocks:",
		"4 Null, Speed or Accuracy Modifier in any combination",
		"32 Structure Frame tier 2 or above",
		"16 Structure Panel",
		"3 Laser Core",
		"1 Laser Lens of any type"]);
	ad(<environmentaltech:void_ore_miner_cont_3>,
		["Required Blocks:",
		"8 Null, Speed or Accuracy Modifier in any combination",
		"56 Structure Frame tier 3 or above",
		"52 Structure Panel",
		"4 Laser Core",
		"1 Laser Lens of any type"]);
	ad(<environmentaltech:void_ore_miner_cont_4>,
		["Required Blocks:",
		"12 Null, Speed or Accuracy Modifier in any combination",
		"56 Structure Frame tier 4 or above",
		"56 Structure Panel",
		"5 Laser Core",
		"1 Laser Lens of any type"]);
	ad(<environmentaltech:void_ore_miner_cont_5>,
		["Required Blocks:",
		"16 Null, Speed or Accuracy Modifier in any combination",
		"72 Structure Frame tier 5 or above",
		"36 Structure Panel",
		"6 Laser Core",
		"1 Laser Lens of any type"]);
	ad(<environmentaltech:void_ore_miner_cont_6>,
		["Required Blocks:",
		"20 Null, Speed or Accuracy Modifier in any combination",
		"92 Structure Frame tier 6",
		"56 Structure Panel",
		"6 Laser Core",
		"1 Laser Lens of any type"]);
		
# Void Resource Miner
	ad(<environmentaltech:void_res_miner_cont_1>,
		["Required Blocks:",
		"24 Structure Frame tier 1 or above",
		"20 Structure Panel",
		"2 Laser Core",
		"1 Laser Lens of any type"]);
	ad(<environmentaltech:void_res_miner_cont_2>,
		["Required Blocks:",
		"4 Null, Speed or Accuracy Modifier in any combination",
		"32 Structure Frame tier 2 or above",
		"16 Structure Panel",
		"3 Laser Core",
		"1 Laser Lens of any type"]);
	ad(<environmentaltech:void_res_miner_cont_3>,
		["Required Blocks:",
		"8 Null, Speed or Accuracy Modifier in any combination",
		"56 Structure Frame tier 3 or above",
		"52 Structure Panel",
		"4 Laser Core",
		"1 Laser Lens of any type"]);
	ad(<environmentaltech:void_res_miner_cont_4>,
		["Required Blocks:",
		"12 Null, Speed or Accuracy Modifier in any combination",
		"56 Structure Frame tier 4 or above",
		"56 Structure Panel",
		"5 Laser Core",
		"1 Laser Lens of any type"]);
	ad(<environmentaltech:void_res_miner_cont_5>,
		["Required Blocks:",
		"16 Null, Speed or Accuracy Modifier in any combination",
		"72 Structure Frame tier 5 or above",
		"36 Structure Panel",
		"6 Laser Core",
		"1 Laser Lens of any type"]);
	ad(<environmentaltech:void_res_miner_cont_6>,
		["Required Blocks:",
		"20 Null, Speed or Accuracy Modifier in any combination",
		"92 Structure Frame tier 6",
		"56 Structure Panel",
		"6 Laser Core",
		"1 Laser Lens of any type"]);
		
# Nanobot Beacon
	ad(<environmentaltech:nano_cont_personal_1>,
		["Required Blocks:",
		"4 Null or Potion Effect Modifier in any combination",
		"20 Structure Frame tier 1 or above",
		"12 Structure Panel"]);
	ad(<environmentaltech:nano_cont_personal_2>,
		["Required Blocks:",
		"8 Null or Potion Effect Modifier in any combination",
		"36 Structure Frame tier 2 or above",
		"24 Structure Panel"]);
	ad(<environmentaltech:nano_cont_personal_3>,
		["Required Blocks:",
		"12 Null or Potion Effect Modifier in any combination",
		"56 Structure Frame tier 3 or above",
		"40 Structure Panel"]);
	ad(<environmentaltech:nano_cont_personal_4>,
		["Required Blocks:",
		"16 Null or Potion Effect Modifier in any combination",
		"80 Structure Frame tier 4 or above",
		"60 Structure Panel"]);
	ad(<environmentaltech:nano_cont_personal_5>,
		["Required Blocks:",
		"20 Null or Potion Effect Modifier in any combination",
		"108 Structure Frame tier 5 or above",
		"84 Structure Panel"]);
	ad(<environmentaltech:nano_cont_personal_6>,
		["Required Blocks:",
		"24 Null or Potion Effect Modifier in any combination",
		"140 Structure Frame tier 6",
		"112 Structure Panel"]);
		
# Lightning Rod
	ad(<environmentaltech:lightning_cont_1>,
		["Required Blocks:",
		"4 Structure Frame tier 1 or above",
		"3 Lightning Rod",
		"3 Insulated Lightning Rod"]);
	ad(<environmentaltech:lightning_cont_2>,
		["Required Blocks:",
		"4 Structure Frame tier 2 or above",
		"4 Lightning Rod",
		"4 Insulated Lightning Rod"]);
	ad(<environmentaltech:lightning_cont_3>,
		["Required Blocks:",
		"4 Structure Frame tier 3 or above",
		"5 Lightning Rod",
		"5 Insulated Lightning Rod"]);
	ad(<environmentaltech:lightning_cont_4>,
		["Required Blocks:",
		"13 Structure Frame tier 4 or above",
		"4 Lightning Rod",
		"16 Insulated Lightning Rod"]);
	ad(<environmentaltech:lightning_cont_5>,
		["Required Blocks:",
		"13 Structure Frame tier 5 or above",
		"6 Lightning Rod",
		"22 Insulated Lightning Rod"]);
	ad(<environmentaltech:lightning_cont_6>,
		["Required Blocks:",
		"13 Structure Frame tier 6",
		"8 Lightning Rod",
		"28 Insulated Lightning Rod"]);
			
# *======= Name Changes =======*

	<modularmachinery:itemmodularium>.displayName = "Modularium Alloy";
	
		print("--- Tooltips.zs initialized ---");