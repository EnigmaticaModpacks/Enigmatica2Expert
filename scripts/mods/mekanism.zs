import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#modloaded mekanism

# Clear tooltip for Osmium Ore since its not spawned everywhere
<mekanism:oreblock>.removeTooltip('.*LSHIFT.*');
<mekanism:oreblock>.removeTooltip('.*any height.*');

# The Combiner can dupe a bunch of stuff, so we're manually handle this
mods.mekanism.combiner.removeAllRecipes();
/*Inject_js(
getCSV('config/tellme/items-csv.csv')
.map(it=>{
  const mat = it['Ore Dict keys']
    .split(',')
    .map(o=>o.match(/(piece)([A-Z]\w+)/)?.[2])
    .find(o=>o)
  if(!mat || !isODExist('block'+mat)) return undefined
  return [
    it['Registry name']+':'+it['Meta/dmg'],
    mat
]})
.filter(o=>o)
.map(([item, mat], i, arr)=>
  `mods.mekanism.combiner.addRecipe(<ore:block${(mat+'>,').padEnd(17)} ${$(...item.split(':'))});`
)
)*/
mods.mekanism.combiner.addRecipe(<ore:blockTungsten>,        <contenttweaker:item_ore_tungsten>);
mods.mekanism.combiner.addRecipe(<ore:blockAluminium>,       <exnihilocreatio:item_ore_aluminium>);
mods.mekanism.combiner.addRecipe(<ore:blockArdite>,          <exnihilocreatio:item_ore_ardite>);
mods.mekanism.combiner.addRecipe(<ore:blockCobalt>,          <exnihilocreatio:item_ore_cobalt>);
mods.mekanism.combiner.addRecipe(<ore:blockCopper>,          <exnihilocreatio:item_ore_copper>);
mods.mekanism.combiner.addRecipe(<ore:blockGold>,            <exnihilocreatio:item_ore_gold>);
mods.mekanism.combiner.addRecipe(<ore:blockIron>,            <exnihilocreatio:item_ore_iron>);
mods.mekanism.combiner.addRecipe(<ore:blockLead>,            <exnihilocreatio:item_ore_lead>);
mods.mekanism.combiner.addRecipe(<ore:blockNickel>,          <exnihilocreatio:item_ore_nickel>);
mods.mekanism.combiner.addRecipe(<ore:blockSilver>,          <exnihilocreatio:item_ore_silver>);
mods.mekanism.combiner.addRecipe(<ore:blockTin>,             <exnihilocreatio:item_ore_tin>);
mods.mekanism.combiner.addRecipe(<ore:blockAstralStarmetal>, <jaopca:item_pieceastralstarmetal>);
mods.mekanism.combiner.addRecipe(<ore:blockBoron>,           <jaopca:item_pieceboron>);
mods.mekanism.combiner.addRecipe(<ore:blockDraconium>,       <jaopca:item_piecedraconium>);
mods.mekanism.combiner.addRecipe(<ore:blockIridium>,         <jaopca:item_pieceiridium>);
mods.mekanism.combiner.addRecipe(<ore:blockLithium>,         <jaopca:item_piecelithium>);
mods.mekanism.combiner.addRecipe(<ore:blockMagnesium>,       <jaopca:item_piecemagnesium>);
mods.mekanism.combiner.addRecipe(<ore:blockMithril>,         <jaopca:item_piecemithril>);
mods.mekanism.combiner.addRecipe(<ore:blockOsmium>,          <jaopca:item_pieceosmium>);
mods.mekanism.combiner.addRecipe(<ore:blockPlatinum>,        <jaopca:item_pieceplatinum>);
mods.mekanism.combiner.addRecipe(<ore:blockThorium>,         <jaopca:item_piecethorium>);
mods.mekanism.combiner.addRecipe(<ore:blockTitanium>,        <jaopca:item_piecetitanium>);
mods.mekanism.combiner.addRecipe(<ore:blockUranium>,         <jaopca:item_pieceuranium>);
/**/


for ingot in <ore:ingotGraphite>.items {
	mods.mekanism.crusher.addRecipe(ingot, <nuclearcraft:dust:8>);
}
	
# Increasing Stacksize
	<mekanism:tierinstaller>.maxStackSize = 16;
	<mekanism:tierinstaller:1>.maxStackSize = 16;
	<mekanism:tierinstaller:2>.maxStackSize = 16;
	<mekanism:tierinstaller:3>.maxStackSize = 16;

	<mekanism:filterupgrade>.maxStackSize = 64;
	<mekanism:energyupgrade>.maxStackSize = 64;
	<mekanism:speedupgrade>.maxStackSize = 64;
	<mekanism:gasupgrade>.maxStackSize = 64;
	<mekanism:mufflingupgrade>.maxStackSize = 64;
	
# Basic Mekanism Pipe/Tube/Cables
	recipes.remove(<mekanism:transmitter>.withTag({tier: 0}));
	recipes.remove(<mekanism:transmitter:1>.withTag({tier: 0}));
	// recipes.remove(<mekanism:transmitter:2>.withTag({tier: 0}));
	recipes.remove(<mekanism:transmitter:3>.withTag({tier: 0}));
	recipes.remove(<mekanism:transmitter:4>.withTag({tier: 0}));
	recipes.addShapedMirrored("MekanismCable1", 
	<mekanism:transmitter>.withTag({tier: 0}) * 8, 
	[[<ore:ingotElectricalSteel>, <advgenerators:iron_wiring>, <ore:ingotElectricalSteel>]]);
	recipes.addShapedMirrored("MekanismCable2", 
	<mekanism:transmitter:1>.withTag({tier: 0}) * 8, 
	[[<ore:ingotElectricalSteel>, <flopper:flopper>, <ore:ingotElectricalSteel>]]);
	// recipes.addShapedMirrored("MekanismCable3", 
	// <mekanism:transmitter:2>.withTag({tier: 0}) * 8, 
	// [[<ore:ingotElectricalSteel>, <appliedenergistics2:quartz_vibrant_glass>, <ore:ingotElectricalSteel>]]);
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
	[[<ore:ingotSteel>, <minecraft:web>, <ore:ingotSteel>],
	[<ore:plateBronze>, <mekanism:gastank>, <ore:plateBronze>], 
	[<ore:plateBronze>, <mekanism:reinforcedalloy>, <ore:plateBronze>]]);

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

# [Heat Generator] from [Treated Wood Planks][+3]
craft.remake(<mekanismgenerators:generator>, ["pretty",
  "A ▬ A",
  "▬ # ▬",
  "A F A"], {
  "A": <ore:alloyAdvanced>,    # Enriched Alloy
  "▬": <ore:ingotOsmium>,      # Osmium Ingot
  "#": <ore:plankTreatedWood>, # Treated Wood Planks
  "F": <minecraft:furnace>,    # Furnace
});

# Factories
	recipes.remove(<mekanism:machineblock:5>);
	recipes.remove(<mekanism:machineblock:6>);
	recipes.remove(<mekanism:machineblock:7>);

# Quantum Entangloporter
	recipes.remove(<mekanism:machineblock3>);
	recipes.addShaped("Quantum Entangloporter", <mekanism:machineblock3>, 
	[[<mekanism:basicblock:7>, <ore:heartDragon>, <mekanism:basicblock:7>],
	[<modularmachinery:blockcasing:5>, <ore:machineTeleporter>, <modularmachinery:blockcasing:5>], 
	[<mekanism:basicblock:7>, <rftools:matter_beamer>, <mekanism:basicblock:7>]]);

// Mekanism Boiler Casing
recipes.remove(<mekanism:basicblock2:7>);
recipes.addShaped(<mekanism:basicblock2:7> * 8,
  [[<ore:ingotSteel>, <ore:ingotSteel>, <ore:ingotSteel>],
    [<ore:ingotSteel>, <ore:ingotFakeIron>, <ore:ingotSteel>],
    [<ore:ingotSteel>, <ore:ingotSteel>, <ore:ingotSteel>]]);

# [Steel Casing]*2 from [Blast Brick][+3]
craft.remake(<mekanism:basicblock:8> * 2, ["pretty",
  "▬ - ▬",
  "S B S",
  "▬ - ▬"], {
  "▬": <ore:ingotOsmium>,                         # Osmium Ingot
  "-": <ore:ingotAlubrass>,                       # Aluminum Brass Ingot
  "S": <immersiveengineering:material:9>,         # Steel Mechanical Component
  "B": <immersiveengineering:stone_decoration:1>, # Blast Brick
});

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

# [Solar Generator] from [Osmium Dust][+2]
craft.remake(<mekanismgenerators:generator:1>, [
  "S",
  "▲",
  "B"], {
  "▲": <ore:dustOsmium>,                # Osmium Dust
  "B": <ore:circuitBasic>,              # Electronic Circuit
  "S": <mekanismgenerators:solarpanel>, # Solar Panel
});

# [Advanced Solar Generator] from [Iron Large Plate][+3]
craft.remake(<mekanismgenerators:generator:5>, ["pretty",
  "S E S",
  "S E S",
  "▲ □ ▲"], {
  "□": <tconstruct:large_plate>.withTag({Material: "iron"}), # Iron Large Plate
  "▲": <ore:dustOsmium>,                # Osmium Dust
  "S": <mekanismgenerators:solarpanel>, # Solar Panel
  "E": <ore:alloyElite>,                # Reinforced Alloy
});

	
# Digital Miner
	recipes.remove(<mekanism:machineblock:4>);
	recipes.addShapedMirrored("Digital Miner",
	<mekanism:machineblock:4>, 
	[[<ore:alloyUltimate>, <ore:circuitUltimate>, <ore:alloyUltimate>],
	[<thermalexpansion:frame>, <mekanism:robit>.anyDamage(), <thermalexpansion:frame>], 
	[<mekanism:machineblock:11>, <computercraft:computer:16384>.withTag({}, false)|<computercraft:computer:16384>, <mekanism:machineblock:11>]]);

# Basic circuit
	mods.mekanism.infuser.removeRecipe(<mekanism:controlcircuit>);
	mods.mekanism.compressor.addRecipe(<opencomputers:material:4>, <mekanism:controlcircuit>);

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
	mods.actuallyadditions.Empowerer.addRecipe(<mekanism:controlcircuit:3>, <mekanism:controlcircuit:2>, <mekanism:atomicalloy>, <mekanism:atomicalloy>, <mekanism:atomicalloy>, <mekanism:atomicalloy>, 500000, 100, [0.5, 0.3, 0.2]);

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
	[<ore:alloyUltimate>,<ore:circuitUltimate>           ,<ore:ingotPlutonium242All>, <enderio:item_basic_capacitor:2>],
	[<ic2:crafting:4>   ,<modularmachinery:blockcasing:5>,<ore:ingotVividAlloy>, <enderio:item_capacitor_melodic>],
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
		"Ϟ": i==0 ? <mekanism:energyupgrade> : <mekanism:basicblock2:3>.withTag({tier: i - 1}),
		"∑": i==0 ? <nuclearcraft:lithium_ion_cell>.withTag({}) : <mekanism:basicblock2:4>.withTag({tier: i - 1}),
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
mods.extendedcrafting.TableCrafting.addShaped(0, <mekanismgenerators:reactor>, [
	[<ore:plateElite>, <advancedrocketry:blocklens>, <advancedrocketry:blocklens>, <advancedrocketry:blocklens>, <ore:plateElite>], 
	[<mekanismgenerators:reactor:2>, <ic2:iridium_reflector>, <mekanism:gastank>.withTag({tier: 3}), <ic2:iridium_reflector>, <mekanismgenerators:reactor:2>], 
	[<qmd:particle_chamber_detector:3>, <advancedrocketry:intake>, <nuclearcraft:salt_fission_controller>, <advancedrocketry:intake>, <qmd:particle_chamber_detector:3>], 
	[<mekanismgenerators:reactor:2>, <ic2:iridium_reflector>, <mekanism:gastank>.withTag({tier: 3}), <ic2:iridium_reflector>, <mekanismgenerators:reactor:2>], 
	[<ore:plateElite>, <nuclearcraft:lithium_ion_battery_elite>, <nuclearcraft:lithium_ion_battery_elite>, <nuclearcraft:lithium_ion_battery_elite>, <ore:plateElite>]
]);

val upgrIngrs = {
  "A": <ore:alloyAdvanced>,    # Enriched Alloy
  "□": <ore:plateDenseCopper>, # Dense Copper Plate
  "▲": <ore:dustLithium>,      # Lithium Dust
  "♣": <ore:dustArdite>,       # Ardite Ore Dust
  "♠": <ore:dustCobalt>,       # Cobalt Ore Dust
  "s": <ore:dustSilver>,       # Pulverized Silver
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

# [Gas Upgrade] from [Pulverized Silver][+3]
craft.remake(<mekanism:gasupgrade>, ["pretty",
  "A □ A",
  "▲ s ▲",
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

// Industrial Diamond
mods.mekanism.enrichment.removeRecipe(<*>, <ic2:crafting:19>);
mods.mekanism.enrichment.addRecipe(<ic2:dust:5>, <minecraft:diamond>);

// Fix Some dusts
mods.mekanism.enrichment.removeRecipe(<*>, <nuclearcraft:dust:4>);
mods.mekanism.enrichment.addRecipe(<ore:oreUranium>, <immersiveengineering:metal:14> * 2);
mods.mekanism.crusher.removeRecipe(<nuclearcraft:dust:4>);
mods.mekanism.crusher.addRecipe(<ore:ingotUranium>, <immersiveengineering:metal:14>);

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
mods.mekanism.enrichment.addRecipe(<ore:dustGlowstone>,  <contenttweaker:compressed_glowstone>);
mods.mekanism.enrichment.addRecipe(<ore:dustEnderPearl>, <contenttweaker:compressed_ender>);

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
  "⌂": <nuclearcraft:solid_fission_controller>, # Fission Reactor Casing
  "S": <mekanism:basicblock:8>,      # Steel Casing
  "T": <ore:wallTurbine>,
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

# [Enrichment Chamber] from [Steel Casing][+3]
craft.make(<mekanism:machineblock>, ["pretty",
  "A ▬ A",
  "B ⌂ B",
  "A ▬ A"], {
  "A": <ore:alloyAdvanced>, # Enriched Alloy
  "B": <ore:circuitBasic>,      # Basic Control Circuit
  "⌂": <mekanism:basicblock:8>, # Steel Casing
  "▬": <ore:ingotFakeIron>,     # Iron Ingot
});

# [Energized Smelter] from [Steel Casing][+3]
craft.make(<mekanism:machineblock:10>, ["pretty",
  "A ▬ A",
  "▬ ⌂ ▬",
  "A F A"], {
  "A": <ore:alloyAdvanced>, # Enriched Alloy
  "⌂": <mekanism:basicblock:8>, # Steel Casing
  "F": <minecraft:furnace>,     # Furnace
  "▬": <ore:ingotFakeIron>,     # Iron Ingot
});

# Remake salt block
recipes.remove(<mekanism:saltblock>);
recipes.addShapeless("salt block", <mekanism:saltblock>, [<ore:itemSalt>,<ore:itemSalt>,<ore:itemSalt>,<ore:itemSalt>]);

# More infuser recipes
recipes.remove(<nuclearcraft:glowing_mushroom>);
mods.mekanism.infuser.addRecipe("CARBON",  50, <industrialforegoing:pink_slime>, <enderio:item_material:50>);
mods.mekanism.infuser.addRecipe("CARBON",  50, <ore:animaniaEggs>, <enderio:item_material:50>);
mods.mekanism.infuser.addRecipe("FUNGI" ,  20, <ore:dustGlowstone>, <nuclearcraft:glowing_mushroom>);
mods.mekanism.infuser.addRecipe("BIO"   , 100, <ore:eternalLifeEssence> * 4, <botania:overgrowthseed>);

# Infinite Salt source
mods.extendedcrafting.CompressionCrafting.addRecipe(
	<mekanism:basicblock:6>.withTag({tier: 4, mekData: {storedItem: {id: "mekanism:salt", Count: 1 as byte, Damage: 0 as short}, itemCount: 2147483647}}), 
	<mekanism:salt>, 2000, <mekanism:basicblock:6>.withTag({tier: 3}), 2000000, 100000
);

# Cheaper by steel to compete with other double chests
# [Personal Chest] from [Glass][+2]
craft.remake(<mekanism:machineblock:13>, ["pretty",
  "‚ ■ ‚",
  "c   c",
  "‚ ‚ ‚"], {
  "‚": <ore:nuggetSteel>,# Steel Nugget
  "■": <ore:blockGlass>, # Glass
  "c": <ore:chest>,      # Oak Chest
});

# Cheaper, because basically its Anvill, Chest, Furnace in one place, consuming RF
# [Robit] from [Personal Chest][+2]
craft.remake(<mekanism:robit>, ["pretty",
  "  b  ",
  "W P W"], {
  "b": <ore:battery>,              # Energy Tablet
  "W": <animania:wheel>,           # Wheel
  "P": <mekanism:machineblock:13>, # Personal Chest
});

# ----------------------------------------------------------------
# Biofuel rework
# ----------------------------------------------------------------

val BF = <mekanism:biofuel>;
mods.mekanism.crusher.removeRecipe(<ore:itemBioFuel>);

val bioFuelList = {
	<minecraft:melon>                        : 1,  # Melon
	<actuallyadditions:item_misc:1>          : 2,  # Bio-Mash
	<actuallyadditions:item_misc:21>         : 2,  # Biomass
	<harvestcraft:fruitbaititem>             : 2,  # Bait
	<harvestcraft:grainbaititem>             : 2,  # Bait
	<harvestcraft:veggiebaititem>            : 2,  # Bait
	<minecraft:baked_potato>                 : 3,  # Baked Potato
	<exnihilocreatio:item_material:2>        : 5,  # Silkworm
	<minecraft:tallgrass>                    : 6,  # Shrub
	<minecraft:poisonous_potato>             : 6,  # Poisonous Potato
	<ore:cropPumpkin>                        : 6,  # Pumpkin
	<exnihilocreatio:item_cooked_silkworm>   : 6,  # Cooked Silkworm
	<ore:cropMelon>                          : 8,  # Melon
	<twilightforest:raw_meef>                : 8,  # Raw Meef
	<iceandfire:myrmex_desert_biolight>      : 10, # Desert Myrmex Bioluminescence
	<iceandfire:myrmex_jungle_biolight>      : 10, # Jungle Myrmex Bioluminescence
	<ic2:crafting:20>                        : 10, # Plantball
	<actuallyadditions:item_worm>            : 16, # Worm
	<twilightforest:cooked_meef>             : 10, # Meef Steak
	<ic2:crafting:21>                        : 12, # Bio Chaff
	<ore:itemBiomass>                        : 16, # Pulped Biomass
	<ore:itemBioblend>                       : 16, # Pulped Bioblend
	<ore:itemBiomassRich>                    : 24, # Rich Biomass
	<ore:itemBioblendRich>                   : 24, # Rich Bioblend
	<additionalcompression:bread_compressed> : 32, # Bread
} as int[IIngredient];

for input, count in bioFuelList {
	mods.mekanism.crusher.addRecipe(input, BF * count);
}

// mods.mekanism.crusher.removeRecipe(IIngredient outputStack, @Optional IIngredient inputStack);
// mods.mekanism.crusher.addRecipe(IIngredient inputStack, IItemStack outputStack);

# ----------------------------------------------------------------
# ----------------------------------------------------------------

# [Superheating Element] from [Steel Casing][+2]
craft.remake(<mekanism:basicblock2:5>, ["pretty",
  "c □ c",
  "□ ⌂ □",
  "c □ c"], {
  "c": <ore:concrete>,          # Concrete
  "□": <ore:plateCopper>,       # Copper Plate
  "⌂": <mekanism:basicblock:8>, # Steel Casing
});

# Fix squeezers have no recipe
val OD = <mekanism:dust:2>;
scripts.processWork.work(["Squeezer"],            null, [<ore:oreOsmium>], null, [OD  , OD], null, null, [0.75]);
scripts.processWork.work(["MechanicalSqueezer"],  null, [<ore:oreOsmium>], null, [OD*2, OD], null, null, [0.5 ]);

# Oredicting cheaper recipe
# [Formulaic Assemblicator] from [Steel Mechanical Component][+3]
craft.remake(<mekanism:machineblock3:5>, ["pretty",
  "‚ w ‚",
  ": S :",
  "‚ w ‚"], {
  "‚": <ore:nuggetSteel>, # Steel Nugget
  "w": <ore:workbench>, # Crafting Table
  ":": <ore:oc:materialCircuitBoardPrinted>, # Printed Circuit Board (PCB)
  "S": <immersiveengineering:material:9>, # Steel Mechanical Component
});
