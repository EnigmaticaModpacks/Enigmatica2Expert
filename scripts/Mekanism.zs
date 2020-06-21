import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IItemStack as IItemStack;
#modloaded mekanism


# The Combiner can dupe a bunch of stuff, so we're removing it.
mods.mekanism.combiner.removeAllRecipes();
recipes.remove(<mekanism:machineblock:2>);


# Unifying Graphite ingots, seems the crusher was overlooked
mods.mekanism.crusher.removeRecipe(<bigreactors:dustgraphite>, <bigreactors:ingotgraphite>);

for ingot in <ore:ingotGraphite>.items {
	mods.mekanism.crusher.addRecipe(ingot, <nuclearcraft:dust:8>);
}

# Sky stone dust recipe
	mods.mekanism.crusher.addRecipe(<appliedenergistics2:sky_stone_block>, <appliedenergistics2:material:45>);

# Energized Smelter is not entirely unified, this should fix that
var itemsToUnify as IItemStack[IItemStack] = {
	<ic2:crushed> : <thermalfoundation:material:128>,
	<ic2:crushed:3> : <thermalfoundation:material:131>,
	<ic2:crushed:4> : <thermalfoundation:material:130>,
	<ic2:crushed:5> : <thermalfoundation:material:129>,
	<ic2:purified> : <thermalfoundation:material:128>,
	<ic2:purified:3> : <thermalfoundation:material:131>,
	<ic2:purified:4> : <thermalfoundation:material:130>,
	<ic2:purified:5> : <thermalfoundation:material:129>
};

for input, output in itemsToUnify {
	mods.mekanism.smelter.removeRecipe(input);

	mods.mekanism.smelter.addRecipe(input, output);
}

# Starmetal Ingots
	mods.mekanism.smelter.addRecipe(<astralsorcery:itemcraftingcomponent:2>, <astralsorcery:itemcraftingcomponent:1>);
	
	var ultimateGasTank = <mekanism:gastank>.withTag({tier: 3, mekData:{}})|<mekanism:gastank>.withTag({tier: 3, mekData:{security:0}});
	var ultimateFluidTank = <mekanism:machineblock2:11>.withTag({tier: 3, mekData:{}})|<mekanism:machineblock2:11>.withTag({tier: 3, mekData:{security:0}});
	
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
	[[<ore:ingotElectricalSteel>, <minecraft:bucket>, <ore:ingotElectricalSteel>]]);
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
	[<mekanism:basicblock2>, ultimateFluidTank, <mekanism:basicblock2>], 
	[<mekanism:basicblock2>, <mekanism:basicblock2>, <mekanism:basicblock2>]]);

# Chemical Oxidizer
	recipes.remove(<mekanism:machineblock2:1>);
	recipes.addShapedMirrored("Chemical Oxidizer", 
	<mekanism:machineblock2:1>, 
	[[<extrautils2:decorativesolid:3>, <ore:circuitUltimate>, <extrautils2:decorativesolid:3>],
	[<mekanism:machineblock:13>, ultimateFluidTank, ultimateGasTank], 
	[<extrautils2:decorativesolid:3>, <ore:circuitUltimate>, <extrautils2:decorativesolid:3>]]);

# Chemical Infuser
	recipes.remove(<mekanism:machineblock2:2>);
	recipes.addShapedMirrored("Chemical Infuser", 
	<mekanism:machineblock2:2>, 
	[[<mekanism:basicblock:11>, <ore:circuitUltimate>, <mekanism:basicblock:11>],
	[ultimateGasTank, <rftools:infused_diamond>, ultimateGasTank],
	[<mekanism:basicblock:11>, <ore:circuitUltimate>, <mekanism:basicblock:11>]]);

# Chemical Injection Chamber
	recipes.remove(<mekanism:machineblock2:3>);
	recipes.addShaped("Chemical Injection Chamber", 
	<mekanism:machineblock2:3>, 
	[[<ore:dustSulfur>, <ore:circuitUltimate>, <ore:dustSulfur>],
	[<ore:blockGold>, <mekanism:machineblock:9>, <ore:blockGold>], 
	[<ore:dustSulfur>, <ore:circuitUltimate>, <ore:dustSulfur>]]);

# Chemical Dissolution Chamber
	recipes.remove(<mekanism:machineblock2:6>);
	recipes.addShapedMirrored("Chemical Dissolution Chamber", 
	<mekanism:machineblock2:6>, 
	[[<ore:circuitUltimate>, ultimateGasTank, <ore:circuitUltimate>],
	[<mekanism:basicblock:11>, <forge:bucketfilled>.withTag({FluidName: "sulfuric_acid", Amount: 1000})|<forge:bucketfilled>.withTag({FluidName: "sulfuricacid", Amount: 1000}), <mekanism:basicblock:11>], 
	[<ore:circuitUltimate>, ultimateGasTank, <ore:circuitUltimate>]]);

# Chemical Washer
	recipes.remove(<mekanism:machineblock2:7>);
	recipes.addShapedMirrored("Chemical Washer", 
	<mekanism:machineblock2:7>, 
	[[<ore:circuitUltimate>, <nuclearcraft:water_source>, <ore:circuitUltimate>],
	[<mekanismgenerators:reactor:2>, <ic2:te:56>, <mekanismgenerators:reactor:2>], 
	[<ore:circuitUltimate>, ultimateGasTank, <ore:circuitUltimate>]]);

# Chemical Crystallizer
	recipes.remove(<mekanism:machineblock2:8>);
	recipes.addShapedMirrored("Chemical Crystallizer", 
	<mekanism:machineblock2:8>, 
	[[ultimateGasTank, <extrautils2:suncrystal>, ultimateGasTank],
	[<mekanismgenerators:reactor:2>, <advancedrocketry:crystallizer>, <mekanismgenerators:reactor:2>], 
	[<ore:circuitUltimate>, <ic2:lapotron_crystal>.anyDamage(), <ore:circuitUltimate>]]);

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
	
# Basic Tier Installer
	recipes.remove(<mekanism:tierinstaller>);
	recipes.addShaped("Basic Tier Installer", 
	<mekanism:tierinstaller>, 
	[[<ore:blockRedstone>, <ore:circuitAdvanced>, <ore:blockRedstone>],
	[<ore:ingotSteel>, <mekanism:basicblock:8>, <ore:ingotSteel>], 
	[<ore:blockRedstone>, <ore:circuitAdvanced>, <ore:blockRedstone>]]);

# Advanced Tier Installer
	recipes.remove(<mekanism:tierinstaller:1>);
	recipes.addShaped("Advanced Tier Installer", 
	<mekanism:tierinstaller:1>, 
	[[<ore:alloyElite>, <ore:circuitElite>, <ore:alloyElite>],
	[<ore:ingotZirconium>, <mekanism:basicblock:8>, <ore:ingotZirconium>], 
	[<ore:alloyElite>, <ore:circuitElite>, <ore:alloyElite>]]);

# Elite Tier Installer
	recipes.remove(<mekanism:tierinstaller:2>);
	recipes.addShaped("Elite Tier Installer", 
	<mekanism:tierinstaller:2>, 
	[[<ore:alloyUltimate>, <ore:circuitUltimate>, <ore:alloyUltimate>],
	[<ore:ingotBlutonium>, <mekanism:basicblock:8>, <ore:ingotBlutonium>], 
	[<ore:alloyUltimate>, <ore:circuitUltimate>, <ore:alloyUltimate>]]);

# Quantum Entangloporter
	recipes.remove(<mekanism:machineblock3>);
	recipes.addShaped("Quantum Entangloporter", <mekanism:machineblock3>, 
	[[<mekanism:basicblock:7>, <ore:heartDragon>, <mekanism:basicblock:7>],
	[<forestry:chipsets:3>.withTag({T: 3 as short}), <mekanism:machineblock:11>|<mekanism:machineblock:11>.withTag({}), <forestry:chipsets:3>.withTag({T: 3 as short})], 
	[<mekanism:basicblock:7>, <rftools:matter_beamer>, <mekanism:basicblock:7>]]);

# Turbine Casing
	recipes.remove(<mekanismgenerators:generator:10>);
	recipes.addShapedMirrored("Mekanism Turbine Casing", 
	<mekanismgenerators:generator:10> * 6, 
	[[<actuallyadditions:block_misc:7>, <nuclearcraft:fission_block>, <actuallyadditions:block_misc:7>],
	[<nuclearcraft:fission_block>, <mekanism:basicblock:8>, <nuclearcraft:fission_block>], 
	[<actuallyadditions:block_misc:7>, <nuclearcraft:fission_block>, <actuallyadditions:block_misc:7>]]);

# Reactor Controller
#	recipes.remove(<mekanismgenerators:reactor>);
#	recipes.addShaped(<mekanismgenerators:reactor>, 
#	[[<ore:circuitUltimate>, ultimateGasTank, <ore:circuitUltimate>],
#	[<mekanismgenerators:reactor:1>, <nuclearcraft:fusion_core>, <mekanismgenerators:reactor:1>], 
#	[<mekanismgenerators:reactor:1>, <mekanismgenerators:reactor:1>, <mekanismgenerators:reactor:1>]]);
	
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
	[<thermalfoundation:material:640>, <ore:circuitBasic>, <thermalfoundation:material:640>]]);

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
	[<mekanism:machineblock:11>, <computercraft:computer:16384>, <mekanism:machineblock:11>]]);

# Basic circuit
	mods.mekanism.infuser.removeRecipe(<mekanism:controlcircuit>);
	mods.mekanism.compressor.addRecipe(<opencomputers:material:4>, <mekanism:controlcircuit>);

# Advanced Circuit
	recipes.remove(<mekanism:controlcircuit:1>);
	recipes.addShapedMirrored("Advanced Circuit",
	<mekanism:controlcircuit:1>, 
	[[<ore:alloyBasic>, <ore:alloyAdvanced>, <ore:alloyBasic>],
	[<ore:alloyAdvanced>, <ore:circuitBasic>, <ore:alloyAdvanced>], 
	[<ore:alloyBasic>, <ore:alloyAdvanced>, <ore:alloyBasic>]]);

# Elite Circuit
	recipes.remove(<mekanism:controlcircuit:2>);
	recipes.addShaped("Elite Circuit",
	<mekanism:controlcircuit:2>, 
	[[<ore:alloyBasic>, <ore:alloyElite>, <ore:alloyBasic>],
	[<ore:alloyElite>, <ore:circuitAdvanced>, <ore:alloyElite>], 
	[<ore:alloyBasic>, <ore:alloyElite>, <ore:alloyBasic>]]);

# Ultimate Circuit
	recipes.remove(<mekanism:controlcircuit:3>);
	mods.actuallyadditions.Empowerer.addRecipe(<mekanism:controlcircuit:3>, <mekanism:controlcircuit:2>, <mekanism:atomicalloy>, <mekanism:atomicalloy>, <mekanism:atomicalloy>, <mekanism:atomicalloy>, 500000, 100, [0.5, 0.3, 0.2]);

# Removing unused ores & Walkietalkie
	rh(<mekanism:oreblock:1>);
	rh(<mekanism:oreblock:2>);
	rh(<mekanism:walkietalkie>);

# Tier applying
	recipes.addShapeless(<mekanism:machineblock:5>.withTag({recipeType: 3, mekData: {}}), [<mekanism:machineblock:1>, <mekanism:tierinstaller>]);
	recipes.addShapeless(<mekanism:machineblock:6>.withTag({recipeType: 3, mekData: {}}), [<mekanism:machineblock:5>.withTag({recipeType: 3, mekData: {}}), <mekanism:tierinstaller:1>]);
	recipes.addShapeless(<mekanism:machineblock:7>.withTag({recipeType: 3, mekData: {}}), [<mekanism:machineblock:6>.withTag({recipeType: 3, mekData: {}}), <mekanism:tierinstaller:2>]);


# Mekanism Induction difficult
remake("Mek Induction Provider 3", <mekanism:basicblock2:4>.withTag({tier: 3}) , [[<mekanism:tierinstaller:3> , <mekanism:basicblock2:4>.withTag({tier: 2}) , <mekanism:tierinstaller:3>] ,[<mekanism:basicblock2:4>.withTag({tier: 2}) , <mekanism:energycube>.withTag({tier: 3}) , <mekanism:basicblock2:4>.withTag({tier: 2})] , [<mekanism:tierinstaller:3> , <mekanism:basicblock2:4>.withTag({tier: 2}) , <mekanism:tierinstaller:3>]]);
remake("Mek Induction Provider 2", <mekanism:basicblock2:4>.withTag({tier: 2}) , [[<ore:circuitElite>         , <mekanism:basicblock2:4>.withTag({tier: 1}) , <ore:circuitElite>]         ,[<mekanism:basicblock2:4>.withTag({tier: 1}) , <mekanism:energycube>.withTag({tier: 2}) , <mekanism:basicblock2:4>.withTag({tier: 1})] , [<ore:circuitElite>         , <mekanism:basicblock2:4>.withTag({tier: 1}) , <ore:circuitElite>]]);
remake("Mek Induction Provider 1", <mekanism:basicblock2:4>.withTag({tier: 1}) , [[<ore:circuitAdvanced>      , <mekanism:basicblock2:4>.withTag({tier: 0}) , <ore:circuitAdvanced>]      ,[<mekanism:basicblock2:4>.withTag({tier: 0}) , <mekanism:energycube>.withTag({tier: 1}) , <mekanism:basicblock2:4>.withTag({tier: 0})] , [<ore:circuitAdvanced>      , <mekanism:basicblock2:4>.withTag({tier: 0}) , <ore:circuitAdvanced>]]);
remake("Mek Induction Provider 0", <mekanism:basicblock2:4>.withTag({tier: 0}) , [[<ore:circuitBasic>         , <nuclearcraft:lithium_ion_cell>             , <ore:circuitBasic>]         ,[<nuclearcraft:lithium_ion_cell>             , <mekanism:energycube>.withTag({tier: 0}) , <nuclearcraft:lithium_ion_cell>]             , [<ore:circuitBasic>         , <nuclearcraft:lithium_ion_cell>             , <ore:circuitBasic>]]);

# Tablet
remakeEx(<mekanism:energytablet>, [[<ore:alloyAdvanced>, <ore:plateDenseCopper>, <ore:alloyAdvanced>],[<ore:dustLithium>, <ore:plateDenseGold>, <ore:dustLithium>], [<ore:alloyAdvanced>, <ore:plateDenseCopper>, <ore:alloyAdvanced>]]);


# Mek induction Cell
val t1_cap = <enderio:item_basic_capacitor>;
val t2_cap = <enderio:item_basic_capacitor:1>;
val t3_cap = <enderio:item_basic_capacitor:2>;
val t4_cap = <draconicevolution:draconium_capacitor:1>;
remake("Induction Cell 1", <mekanism:basicblock2:3>.withTag({tier: 0}), [
	[t1_cap, <ore:battery>, t1_cap], 
	[<ore:battery>, <mekanism:energycube>.withTag({tier: 0}), <ore:battery>], 
	[t1_cap, <ore:battery>, t1_cap]
]);
remake("Induction Cell 2", <mekanism:basicblock2:3>.withTag({tier: 1}), [
	[t2_cap, <mekanism:basicblock2:3>.withTag({tier: 0}), t2_cap], 
	[<mekanism:basicblock2:3>.withTag({tier: 0}), <mekanism:energycube>.withTag({tier: 1}), <mekanism:basicblock2:3>.withTag({tier: 0})], 
	[t2_cap, <mekanism:basicblock2:3>.withTag({tier: 0}), t2_cap]
]);
remake("Induction Cell 3", <mekanism:basicblock2:3>.withTag({tier: 2}), [
	[t3_cap, <mekanism:basicblock2:3>.withTag({tier: 1}), t3_cap], 
	[<mekanism:basicblock2:3>.withTag({tier: 1}), <mekanism:energycube>.withTag({tier: 2}), <mekanism:basicblock2:3>.withTag({tier: 1})], 
	[t3_cap, <mekanism:basicblock2:3>.withTag({tier: 1}), t3_cap]
]);
remake("Induction Cell 4", <mekanism:basicblock2:3>.withTag({tier: 3}), [
	[t4_cap, <mekanism:basicblock2:3>.withTag({tier: 2}), t4_cap], 
	[<mekanism:basicblock2:3>.withTag({tier: 2}), <mekanism:energycube>.withTag({tier: 3}), <mekanism:basicblock2:3>.withTag({tier: 2})], 
	[t4_cap, <mekanism:basicblock2:3>.withTag({tier: 2}), t4_cap]
]);


# Mekanism Fusion Reactor
recipes.remove(<mekanismgenerators:reactor>);
mods.extendedcrafting.TableCrafting.addShaped(0, <mekanismgenerators:reactor>, [
	[<ore:plateElite>, <advancedrocketry:blocklens>, <advancedrocketry:blocklens>, <advancedrocketry:blocklens>, <ore:plateElite>], 
	[<mekanismgenerators:reactor:2>, <ic2:iridium_reflector>, <mekanism:gastank>.withTag({tier: 3}), <ic2:iridium_reflector>, <mekanismgenerators:reactor:2>], 
	[<nuclearcraft:electromagnet_supercooler_idle>, <advancedrocketry:intake>, <nuclearcraft:fusion_core>, <advancedrocketry:intake>, <nuclearcraft:electromagnet_supercooler_idle>], 
	[<mekanismgenerators:reactor:2>, <ic2:iridium_reflector>, <mekanism:gastank>.withTag({tier: 3}), <ic2:iridium_reflector>, <mekanismgenerators:reactor:2>], 
	[<ore:plateElite>, <nuclearcraft:lithium_ion_battery_elite>, <nuclearcraft:lithium_ion_battery_elite>, <nuclearcraft:lithium_ion_battery_elite>, <ore:plateElite>]
]);

# Speed Upgrade with energetic wool
remake("mekanism speedupgrade", <mekanism:speedupgrade>, [
	[<ore:blockGlass>, <energeticsheep:energetic_wool:*>, <ore:blockGlass>],
	[<mekanism:enrichedalloy>, <ore:dustOsmium>, <mekanism:enrichedalloy>],
	[<ore:blockGlass>, <energeticsheep:energetic_wool:*>, <ore:blockGlass>]]);

# Energy Upgrade with energetic wool
remake("mekanism energyupgrade", <mekanism:energyupgrade>, [
	[<ore:blockGlass>, <energeticsheep:energetic_wool:*>, <ore:blockGlass>],
	[<mekanism:enrichedalloy>, <ore:dustGold>, <mekanism:enrichedalloy>],
	[<ore:blockGlass>, <energeticsheep:energetic_wool:*>, <ore:blockGlass>]]);

# Atomic disassembler
recipes.removeShaped(<mekanism:atomicdisassembler>);
var anyDragonsteelRod = <tconstruct:tough_tool_rod>.withTag({Material: "dragonsteel_ice"}) |
												<tconstruct:tough_tool_rod>.withTag({Material: "dragonsteel_fire"});
recipes.addShaped(<mekanism:atomicdisassembler>, [
	[<ore:ingotPlatinum>, <mekanism:tierinstaller:2>, <ore:ingotPlatinum>], 
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


# Harder Refined obsidian and glowstone recipes
# Remove melting in Smeltery
mods.tconstruct.Melting.removeRecipe(<liquid:refinedobsidian>);
mods.tconstruct.Melting.removeRecipe(<liquid:refinedglowstone>);

# Remove melting in other machines
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedobsidian> * 144);
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedglowstone> * 144);
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedobsidian> * 16);
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedglowstone> * 16);
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedobsidian> * 1296);
mods.nuclearcraft.melter.removeRecipeWithOutput(<liquid:refinedglowstone> * 1296);

# Also recipe added in ChemicalReactor.xml
# Add Tube recipes
mods.mechanics.addTubeRecipe([<mekanism:basicblock:2>] as IItemStack[], <liquid:refinedobsidian> * 1000);
mods.mechanics.addTubeRecipe([<mekanism:basicblock:4>] as IItemStack[], <liquid:refinedglowstone> * 1000);

# Add advanced liquid recipes
scripts.process.solution([<thermalfoundation:material:770>], [<liquid:diamond> * 66], null, [<liquid:refinedobsidian> * 144], "No exceptions");
scripts.process.solution([<mekanism:dust:2>], [<liquid:glowstone> * 250], null, [<liquid:refinedglowstone> * 144], "No exceptions");