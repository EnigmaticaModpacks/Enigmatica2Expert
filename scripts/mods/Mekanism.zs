import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.item.IIngredient;
#modloaded mekanism


# The Combiner can dupe a bunch of stuff, so we're removing it.
mods.mekanism.combiner.removeAllRecipes();
recipes.remove(<mekanism:machineblock:2>);


# Unifying Graphite ingots, seems the crusher was overlooked
mods.mekanism.crusher.removeRecipe(<bigreactors:dustgraphite>, <bigreactors:ingotgraphite>);

for ingot in <ore:ingotGraphite>.items {
	scripts.wrap.mekanism.crusher.addRecipe(ingot, <nuclearcraft:dust:8>);
}
	
# Increasing Stacksize
	<mekanism:tierinstaller>.maxStackSize = 16;
	<mekanism:tierinstaller:1>.maxStackSize = 16;
	<mekanism:tierinstaller:2>.maxStackSize = 16;
	<mekanism:tierinstaller:3>.maxStackSize = 16;

	<mekanism:filterupgrade>.maxStackSize = 64;
	<mekanism:energyupgrade>.maxStackSize = 64;
	<mekanism:speedupgrade>.maxStackSize = 64;
	<mekanism:mufflingupgrade>.maxStackSize = 64;
	
# Basic Mekanism Pipe/Tube/Cables
	recipes.remove(<mekanism:transmitter>.withTag({tier: 0}));
	recipes.remove(<mekanism:transmitter:1>.withTag({tier: 0}));
	recipes.remove(<mekanism:transmitter:2>.withTag({tier: 0}));
	recipes.remove(<mekanism:transmitter:3>.withTag({tier: 0}));
	recipes.remove(<mekanism:transmitter:4>.withTag({tier: 0}));
	recipes.addShapedMirrored("MekanismCable1", 
	<mekanism:transmitter>.withTag({tier: 0}) * 8, 
	[[<ore:ingotElectricalSteel>, <advgenerators:iron_wiring>, <ore:ingotElectricalSteel>]]);
	recipes.addShapedMirrored("MekanismCable2", 
	<mekanism:transmitter:1>.withTag({tier: 0}) * 8, 
	[[<ore:ingotElectricalSteel>, <flopper:flopper>, <ore:ingotElectricalSteel>]]);
	recipes.addShapedMirrored("MekanismCable3", 
	<mekanism:transmitter:2>.withTag({tier: 0}) * 8, 
	[[<ore:ingotElectricalSteel>, <appliedenergistics2:quartz_vibrant_glass>, <ore:ingotElectricalSteel>]]);
	recipes.addShapedMirrored("MekanismCable4", 
	<mekanism:transmitter:3>.withTag({tier: 0}) * 8, 
	[[<ore:ingotElectricalSteel>, <ore:circuitBoard>, <ore:ingotElectricalSteel>]]);
	recipes.addShapedMirrored("MekanismCable5", 
	<mekanism:transmitter:4>.withTag({tier: 0}) * 8, 
	[[<ore:ingotElectricalSteel>, <enderio:block_dark_iron_bars>, <ore:ingotElectricalSteel>]]);

# Jetpack
	recipes.remove(<mekanism:jetpack>);
	recipes.addShaped("Mekanism Jetpack", 
	<mekanism:jetpack>, 
	[[<ore:ingotSteel>, <minecraft:elytra>.anyDamage(), <ore:ingotSteel>],
	[<ore:plateBronze>, <mekanism:gastank>, <ore:plateBronze>], 
	[<ore:plateBronze>, <ore:circuitElite>, <ore:plateBronze>]]);

# Thermal Evaporator Controller
	recipes.remove(<mekanism:basicblock:14>);
	recipes.addShaped("Thermal Evaporatotion Controller", 
	<mekanism:basicblock:14>, 
	[[<ore:circuitUltimate>, <ore:paneGlass>, <ore:circuitUltimate>],
	[<mekanism:basicblock2>, <mekanism:tierinstaller:2>, <mekanism:basicblock2>], 
	[<mekanism:basicblock2>, <mekanism:basicblock2>, <mekanism:basicblock2>]]);

# Chemical Injection Chamber
	recipes.remove(<mekanism:machineblock2:3>);
	recipes.addShaped("Chemical Injection Chamber", 
	<mekanism:machineblock2:3>, 
	[[<ore:dustSulfur>, <ore:circuitUltimate>, <ore:dustSulfur>],
	[<ore:blockGold>, <mekanism:machineblock:9>, <ore:blockGold>], 
	[<ore:dustSulfur>, <ore:circuitUltimate>, <ore:dustSulfur>]]);

val chemIngrs = {
  "■": <mekanism:plasticblock:*>,            # Grey Plastic Block
  "⌂": <mekanism:basicblock:8>,              # Steel Casing
  "▲": <ore:dustSiliconDioxide>,             # Silicon Dioxide
  "C": <advancedrocketry:crystallizer>,      # Crystallizer
  "D": <nuclearcraft:water_source_dense>,    # Dense Infinite Water Source
  "E": <mekanism:tierinstaller:2>,           # Elite Tier Installer
  "I": <rftools:infused_diamond>,            # Infused Diamond
  "*": <extrautils2:suncrystal>,             # Sun Crystal
  "~": Bucket("sulfuric_acid")|Bucket("sulfuricacid"), # Sulfuric Acid Bucket
  "O": <ic2:te:56>,                          # Ore Washing Plant
} as IIngredient[string];

# [Chemical Oxidizer] from [Steel Casing][+3]
craft.remake(<mekanism:machineblock2:1>, ["pretty",
  "■ ▲ ■",
  "E ⌂ E",
  "■ ▲ ■"], chemIngrs
);

# [Chemical Infuser] from [Steel Casing][+3]
craft.remake(<mekanism:machineblock2:2>, ["pretty",
  "■ I ■",
  "E ⌂ E",
  "■ I ■"], chemIngrs
);

# [Chemical Dissolution Chamber] from [Steel Casing][+4]
craft.remake(<mekanism:machineblock2:6>, ["pretty",
  "■ ~ ■",
  "E ⌂ E",
  "■ ■ ■"], chemIngrs
);

# [Chemical Washer] from [Steel Casing][+4]
craft.remake(<mekanism:machineblock2:7>, ["pretty",
  "■ O ■",
  "E ⌂ E",
  "■ D ■"], chemIngrs
);

# [Chemical Crystallizer] from [Steel Casing][+4]
craft.remake(<mekanism:machineblock2:8>, ["pretty",
  "■ * ■",
  "E ⌂ E",
  "■ C ■"], chemIngrs
);


# Gas-burning generator
	recipes.remove(<mekanismgenerators:generator:3>);
	recipes.addShapedMirrored("Gas-burning Generator", 
	<mekanismgenerators:generator:3>, 
	[[<ore:ingotTough>, <ore:alloyElite>, <ore:ingotTough>],
	[<mekanism:basicblock:8>, <mekanism:electrolyticcore>, <mekanism:basicblock:8>], 
	[<ore:ingotTough>, <ore:alloyElite>, <ore:ingotTough>]]);

# Factories
	recipes.remove(<mekanism:machineblock:5>);
	recipes.remove(<mekanism:machineblock:6>);
	recipes.remove(<mekanism:machineblock:7>);

# Quantum Entangloporter
	recipes.remove(<mekanism:machineblock3>);
	recipes.addShaped("Quantum Entangloporter", <mekanism:machineblock3>, 
	[[<mekanism:basicblock:7>, <ore:heartDragon>, <mekanism:basicblock:7>],
	[<modularmachinery:blockcasing:5>, <mekanism:machineblock:11>|<mekanism:machineblock:11>.withTag({}), <modularmachinery:blockcasing:5>], 
	[<mekanism:basicblock:7>, <rftools:matter_beamer>, <mekanism:basicblock:7>]]);
	
# Steel Casing
	recipes.remove(<mekanism:basicblock:8>);
	recipes.addShaped("Steel Casing", 
	<mekanism:basicblock:8> * 2, 
	[[<ore:ingotOsmium>, <ore:blockOsmium>, <ore:ingotOsmium>],
	[<immersiveengineering:material:9>, <immersiveengineering:stone_decoration:2>, <immersiveengineering:material:9>], 
	[<ore:ingotOsmium>, <ore:blockOsmium>, <ore:ingotOsmium>]]);
	
# Metallurgic Infuser
	recipes.remove(<mekanism:machineblock:8>);
	recipes.addShaped("Metallurgic Infuser", 
	<mekanism:machineblock:8>, 
	[[<ore:ingotOsmium>, <ore:ingotOsmium>, <ore:ingotOsmium>],
	[<minecraft:furnace>, <mekanism:basicblock:8>, <minecraft:furnace>], 
	[<minecraft:furnace>, <immersiveengineering:metal_device1:1>, <minecraft:furnace>]]);

# Wind Generator
	recipes.remove(<mekanismgenerators:generator:6>);
	recipes.addShaped("Wind Generator", 
	<mekanismgenerators:generator:6>, 
	[[<ore:ingotOsmium>, <immersiveengineering:wooden_device1:1>, <ore:ingotOsmium>],
	[<ore:ingotOsmium>, <ore:alloyAdvanced>, <ore:ingotOsmium>], 
	[<ore:plateElectrum>, <ore:circuitBasic>, <ore:plateElectrum>]]);

# [Solar Panel] from [Osmium Ingot][+2]
craft.reshapeless(<mekanismgenerators:solarpanel>, "□▬A", {
  "A": <ore:alloyAdvanced>, # Enriched Alloy
  "□": <ore:itemPlatePhotovoltaic>, # Photovoltaic Plate
  "▬": <ore:ingotOsmium>,           # Osmium Ingot
});

# Solar Generator
	recipes.remove(<mekanismgenerators:generator:1>);
	recipes.addShaped("Solar Generator", 
	<mekanismgenerators:generator:1>, 
	[[<mekanismgenerators:solarpanel>, <mekanismgenerators:solarpanel>, <mekanismgenerators:solarpanel>],
	[<ore:alloyAdvanced>, <ic2:te:8>, <ore:alloyAdvanced>], 
	[<ore:dustOsmium>, <ore:circuitBasic>, <ore:dustOsmium>]]);

# Advanced Solar Generator
	recipes.remove(<mekanismgenerators:generator:5>);
	recipes.addShaped("Advanced Solar Generator", 
	<mekanismgenerators:generator:5>, 
	[[<mekanismgenerators:generator:1>, <mekanism:reinforcedalloy>, <mekanismgenerators:generator:1>],
	[<mekanismgenerators:generator:1>, <ore:alloyElite>, <mekanismgenerators:generator:1>], 
	[<ore:ingotOsmium>, <tconstruct:large_plate>.withTag({Material: "iron"}), <ore:ingotOsmium>]]);
	
# Digital Miner
	recipes.remove(<mekanism:machineblock:4>);
	recipes.addShapedMirrored("Digital Miner",
	<mekanism:machineblock:4>, 
	[[<ore:alloyUltimate>, <ore:circuitUltimate>, <ore:alloyUltimate>],
	[<thermalexpansion:frame>, <mekanism:robit>.anyDamage(), <thermalexpansion:frame>], 
	[<mekanism:machineblock:11>, <computercraft:computer:16384>.withTag({})|<computercraft:computer:16384>, <mekanism:machineblock:11>]]);

# Basic circuit
	mods.mekanism.infuser.removeRecipe(<mekanism:controlcircuit>);
	scripts.wrap.mekanism.compressor.addRecipe(<opencomputers:material:4>, <mekanism:controlcircuit>);

# Advanced Circuit
	recipes.remove(<mekanism:controlcircuit:1>);
	recipes.addShapedMirrored("Advanced Circuit",
	<mekanism:controlcircuit:1>, 
	[[<ore:dustRedstone>, <ore:alloyAdvanced>, <ore:dustRedstone>],
	[<ore:alloyAdvanced>, <ore:circuitBasic>, <ore:alloyAdvanced>], 
	[<ore:dustRedstone>, <ore:alloyAdvanced>, <ore:dustRedstone>]]);

# Elite Circuit
	recipes.remove(<mekanism:controlcircuit:2>);
	recipes.addShaped("Elite Circuit",
	<mekanism:controlcircuit:2>, 
	[[<ore:gemLapis>, <ore:alloyElite>, <ore:gemLapis>],
	[<ore:alloyElite>, <ore:circuitAdvanced>, <ore:alloyElite>], 
	[<ore:gemLapis>, <ore:alloyElite>, <ore:gemLapis>]]);

# Ultimate Circuit
	recipes.remove(<mekanism:controlcircuit:3>);
	scripts.wrap.actuallyadditions.Empowerer.addRecipe(<mekanism:controlcircuit:3>, <mekanism:controlcircuit:2>, <mekanism:atomicalloy>, <mekanism:atomicalloy>, <mekanism:atomicalloy>, <mekanism:atomicalloy>, 500000, 100, [0.5, 0.3, 0.2]);

# Removing unused ores & Walkietalkie
	utils.rh(<mekanism:oreblock:1>);
	utils.rh(<mekanism:oreblock:2>);
	utils.rh(<mekanism:walkietalkie>);

# Tier applying
	recipes.addShapeless(<mekanism:machineblock:5>.withTag({recipeType: 3, mekData: {}}), [<mekanism:machineblock:1>, <mekanism:tierinstaller>]);
	recipes.addShapeless(<mekanism:machineblock:6>.withTag({recipeType: 3, mekData: {}}), [<mekanism:machineblock:5>.withTag({recipeType: 3, mekData: {}}), <mekanism:tierinstaller:1>]);
	recipes.addShapeless(<mekanism:machineblock:7>.withTag({recipeType: 3, mekData: {}}), [<mekanism:machineblock:6>.withTag({recipeType: 3, mekData: {}}), <mekanism:tierinstaller:2>]);

# Mek Tiered craft
val mekTiers = [
	# Primary           , Secondary                      , Additional         , Induction Cell Capacitors
	[<ore:alloyAdvanced>,<ore:circuitAdvanced>           ,<ore:ingotOsmium>   , <enderio:item_basic_capacitor:0>],
	[<ore:alloyElite>   ,<ore:circuitElite>              ,<ore:ingotZirconium>, <enderio:item_basic_capacitor:1>],
	[<ore:alloyUltimate>,<ore:circuitUltimate>           ,<ore:ingotBlutonium>, <enderio:item_basic_capacitor:2>],
	[<ic2:crafting:4>   ,<modularmachinery:blockcasing:5>,<ore:ingotLudicrite>, <enderio:item_capacitor_melodic>],
] as IIngredient[][];

function mekStorage(i as int, item as IItemStack, storageIngrs as IIngredient[string], strGrid as string[]) {
	val output = item.withTag({tier: i});
	craft.remake(output, strGrid, storageIngrs);

	var gridStr = "CT";

	# If this is Bin, add additional ingredient to prevent adding item to Bin storage
	if(item.definition.id == 'mekanism:basicblock' && item.damage == 6) gridStr += "R";

	# Tier Installer upgrade
	if(i>0) craft.shapeless(output, gridStr, {
		"C": item.withTag({tier: i - 1}),
		"T": <mekanism:tierinstaller>.definition.makeStack(i),
		"R": <ore:dustRedstone>,
	});
}

for i,list in mekTiers {
	val tierIngrs = {
		"-": list[0], # Primary
		"▬": list[1], # Secondary
		"□": list[2], # Additional
		"H": list[3], # Induction Cell Capacitors
		"⌂": <mekanism:basicblock:8>, # Steel Casing
		"T": <mekanism:tierinstaller>.definition.makeStack(i),
		"d": <mekanism:speedupgrade>,
		"Ϟ": i==0 ? <mekanism:energyupgrade>        : <mekanism:basicblock2:3>.withTag({tier: i - 1}),
		"∑": i==0 ? <nuclearcraft:lithium_ion_cell> : <mekanism:basicblock2:4>.withTag({tier: i - 1}),
		"◘": i==0 ? <ore:circuitBasic> as IIngredient : mekTiers[i - 1][1],
	} as IIngredient[string];

	# Tier Installers
	craft.remake(tierIngrs.T.items[0], ["pretty",
		"- ▬ -",
		"□ ⌂ □",
		"- ▬ -"], tierIngrs);

	# [Basic Induction Cell] from [Basic Tier Installer][+2]
	craft.remake(<mekanism:basicblock2:3>.withTag({tier: i}), ["pretty",
		"H Ϟ H",
		"Ϟ T Ϟ",
		"H Ϟ H"], tierIngrs);

	# [Basic Induction Provider] from [Basic Tier Installer][+2]
	craft.remake(<mekanism:basicblock2:4>.withTag({tier: i}), ["pretty",
		"◘ ∑ ◘",
		"∑ d ∑",
		"◘ ∑ ◘"], tierIngrs);

	val storageIngrs = {
		"♥": <ore:dustRedstone>,
		"▬": <ore:ingotOsmium>,
		"_": <ore:ingotFakeIron>,
		"Ϟ": <mekanism:energyupgrade>, # Energy Upgrade
		"░": <ore:cobblestone>, # Cobblestone
		"B": <ore:circuitBasic>,# Basic Control Circuit
		"A": <ore:alloyAdvanced>, # Enriched Alloy
	} as IIngredient[string];
	for j in 1 .. 4 {	if(i>=j) storageIngrs[""~j] = <mekanism:tierinstaller>.definition.makeStack(j); }

	# [Basic Energy Cube] from [Energy Upgrade][+2]
	mekStorage(i, <mekanism:energycube>, storageIngrs, ["pretty",
		"♥ 1 ♥",
		"2 Ϟ 3",
		"♥ ▬ ♥"]);

	# [Basic Bin] from [Basic Control Circuit][+4]
	mekStorage(i, <mekanism:basicblock:6>, storageIngrs, ["pretty",
		"░ 1 ░",
		"2 B 3",
		"░ ░ ░"]);

	# [Basic Gas Tank] from [Advanced Tier Installer][+4]
	mekStorage(i, <mekanism:gastank>, storageIngrs, ["pretty",
		"♥ 1 ♥",
		"2 ▬ 3",
		"♥ ▬ ♥"]);

	# [Basic Fluid Tank] from [Advanced Tier Installer][+4]
	mekStorage(i, <mekanism:machineblock2:11>, storageIngrs, ["pretty",
		"A 1 A",
		"2 _ 3",
		"A _ A"]);
}

# Mekanism Fusion Reactor
recipes.remove(<mekanismgenerators:reactor>);
scripts.wrap.extendedcrafting.TableCrafting.addShaped(0, <mekanismgenerators:reactor>, [
	[<ore:plateElite>, <advancedrocketry:blocklens>, <advancedrocketry:blocklens>, <advancedrocketry:blocklens>, <ore:plateElite>], 
	[<mekanismgenerators:reactor:2>, <ic2:iridium_reflector>, <mekanism:gastank>.withTag({tier: 3}), <ic2:iridium_reflector>, <mekanismgenerators:reactor:2>], 
	[<nuclearcraft:electromagnet_supercooler_idle>, <advancedrocketry:intake>, <nuclearcraft:fusion_core>, <advancedrocketry:intake>, <nuclearcraft:electromagnet_supercooler_idle>], 
	[<mekanismgenerators:reactor:2>, <ic2:iridium_reflector>, <mekanism:gastank>.withTag({tier: 3}), <ic2:iridium_reflector>, <mekanismgenerators:reactor:2>], 
	[<ore:plateElite>, <nuclearcraft:lithium_ion_battery_elite>, <nuclearcraft:lithium_ion_battery_elite>, <nuclearcraft:lithium_ion_battery_elite>, <ore:plateElite>]
]);

val upgrIngrs = {
  "A": <ore:alloyAdvanced>,    # Enriched Alloy
  "□": <ore:plateDenseCopper>, # Dense Copper Plate
  "▲": <ore:dustLithium>,      # Lithium Dust
  "♣": <ore:dustArdite>,       # Ardite Ore Dust
  "♠": <ore:dustCobalt>,       # Cobalt Ore Dust
} as IIngredient[string];

# [Energy Upgrade] from [Ardite Ore Dust][+3]
craft.remake(<mekanism:energyupgrade>, ["pretty",
  "A □ A",
  "▲ ♣ ▲",
  "A □ A"], upgrIngrs
);

# [Speed Upgrade] from [Cobalt Ore Dust][+3]
craft.remake(<mekanism:speedupgrade>, ["pretty",
  "A □ A",
  "▲ ♠ ▲",
  "A □ A"], upgrIngrs
);


# Atomic disassembler
recipes.removeShaped(<mekanism:atomicdisassembler>);
var anyDragonsteelRod = <tconstruct:tough_tool_rod>.withTag({Material: "dragonsteel_ice"}) |
												<tconstruct:tough_tool_rod>.withTag({Material: "dragonsteel_fire"});
recipes.addShaped(<mekanism:atomicdisassembler>, [
	[<ore:ingotPlatinum>, <mekanism:tierinstaller:3>, <ore:ingotPlatinum>], 
	[<ore:ingotPlatinum>, anyDragonsteelRod, null], 
	[null, anyDragonsteelRod, null]
]);

mods.mekanism.enrichment.removeRecipe(<appliedenergistics2:crystal_seed>, <appliedenergistics2:material:10>);
mods.mekanism.enrichment.removeRecipe(<appliedenergistics2:crystal_seed:600>, <appliedenergistics2:material:11>);
mods.mekanism.enrichment.removeRecipe(<appliedenergistics2:crystal_seed:1200>, <appliedenergistics2:material:12>);
mods.mekanism.enrichment.removeRecipe(<appliedenergistics2:material:8>, <appliedenergistics2:material:12>);
mods.mekanism.enrichment.removeRecipe(<appliedenergistics2:material:7>, <appliedenergistics2:material:12>);
mods.mekanism.enrichment.removeRecipe(<appliedenergistics2:material:2>, <appliedenergistics2:material:10>);
mods.mekanism.enrichment.removeRecipe(<appliedenergistics2:material>, <appliedenergistics2:material:10>);

# Remove unused obsidian dust recipes
mods.mekanism.infuser.removeRecipe(<mekanism:otherdust:5>, <ic2:dust:12>);
mods.mekanism.infuser.removeRecipe(<mekanism:otherdust:5>, <nuclearcraft:gem_dust:3>);
mods.mekanism.infuser.removeRecipe(<mekanism:otherdust:5>, <enderio:item_material:29>);
mods.mekanism.infuser.removeRecipe(<mekanism:otherdust:5>, <mekanism:otherdust:6>);

# Also Teleporter
recipes.remove(<mekanism:machineblock:11>);
recipes.addShaped("Mek Teleporter", <mekanism:machineblock:11>.withTag({}), [[<ore:circuitBasic>, <mekanism:basicblock:8>, <ore:circuitBasic>],[<mekanism:basicblock:8>, <mekanism:teleportationcore>, <mekanism:basicblock:8>], [<ore:circuitBasic>, <mekanism:basicblock:8>, <ore:circuitBasic>]]);

# [Teleportation Core] from [Pulsating Crystal][+3]
craft.remake(<mekanism:teleportationcore>, ["pretty",
  "▬ U ▬",
  "S * S",
  "▬ U ▬"], {
  "S": <mekanism:speedupgrade>,    # Speed Upgrade
  "U": <ore:alloyUltimate>,        # Atomic Alloy
  "*": <ore:itemPulsatingCrystal>, # Pulsating Crystal
  "▬": <ore:ingotCobalt>,          # Cobalt Ingot
});

# Cardboxes from Forestry's Carton
remakeEx(<mekanism:cardboardbox>, [[<forestry:carton>, <forestry:carton>, <forestry:carton>],[<forestry:carton>, null, <forestry:carton>], [<forestry:carton>, <forestry:carton>, <forestry:carton>]]);

# New compressed items
scripts.wrap.mekanism.enrichment.addRecipe(<ore:dustGlowstone>,  <contenttweaker:compressed_glowstone>);
scripts.wrap.mekanism.enrichment.addRecipe(<ore:dustEnderPearl>, <contenttweaker:compressed_ender>);

# Remake Universal cables for more efficient transfering of EU
for i, it in [
	<enderio:item_alloy_nugget:2>,
	<enderio:item_alloy_endergy_nugget:1>,
	<enderio:item_alloy_endergy_nugget:2>,
] as IIngredient[] {
	craft.remake(<mekanism:transmitter>.withTag({tier: i+1}) * 8, 
		["###", "#o#", "###"], { "#": <mekanism:transmitter>.withTag({tier: i}), "o": it });
}


# [Turbine Blade] from [Atomic Alloy][+1]
craft.remake(<mekanismgenerators:turbineblade>, ["pretty",
  "  ▬  ",
  "▬ U ▬",
  "  ▬  "], {
  "U": <ore:alloyUltimate>,  # Atomic Alloy
  "▬": <ore:ingotHSLASteel>, # HSLA Steel Ingot
});

# [Turbine Rotor] from [Atomic Alloy][+1]
craft.remake(<mekanismgenerators:generator:7>, ["pretty",
  "□ U □",
  "□ U □",
  "□ U □"], {
  "□": <ore:plateDenseSteel>, # Dense Steel Plate
  "U": <ore:alloyUltimate>,   # Atomic Alloy
});

# [Turbine Casing*6] from [Steel Casing][+2]
craft.remake(<mekanismgenerators:generator:10> * 6, ["pretty",
  "T ⌂ T",
  "⌂ S ⌂",
  "T ⌂ T"], {
  "⌂": <nuclearcraft:fission_block>, # Fission Reactor Casing
  "S": <mekanism:basicblock:8>,      # Steel Casing
  "T": <nuclearcraft:turbine_wall>,  # Turbine Wall
});

# Conflicts
utils.rh(<mekanism:nugget:5>);

# Cardboard Box spawner entity
<mekanism:cardboardbox:1>.addAdvancedTooltip(function(item) {
	val tag = item.tag;
	if(
		isNull(tag.mekData) ||
		isNull(tag.mekData.blockData) ||
		isNull(tag.mekData.blockData.tileTag) ||
		isNull(tag.mekData.blockData.tileTag.id) ||
		tag.mekData.blockData.tileTag.id != "minecraft:mob_spawner" ||
		isNull(tag.mekData.blockData.tileTag.SpawnData) ||
		isNull(tag.mekData.blockData.tileTag.SpawnData.id)
	) return '';
  return "§2Spawner with §a" ~ tag.mekData.blockData.tileTag.SpawnData.id.asString() ~ '§r';
});


# Harder because it is fastest pump in pack
val pumpIngrs = {
  "B": <ore:circuitBasic>,      # Basic Control Circuit
  "⌂": <mekanism:basicblock:8>, # Steel Casing
  "T": <enderio:block_omni_reservoir>,       # Tank
  "U": <ore:alloyUltimate>,     # Atomic Alloy
  "F": <flopper:flopper>,       # Flopper
} as IIngredient[string];

# [Electric Pump] from [Steel Casing][+3]
craft.remake(<mekanism:machineblock:12>, ["pretty",
  "  F  ",
  "U ⌂ U",
  "T T T"], pumpIngrs
);

# [Fluidic Plenisher] from [Steel Casing][+3]
craft.remake(<mekanism:machineblock2:12>, ["pretty",
  "B ⌂ B",
  "  F  "], pumpIngrs
);

