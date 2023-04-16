import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.item.IIngredient;
#modloaded mekanism

# The Combiner can dupe a bunch of stuff, so we're removing it.
mods.mekanism.combiner.removeAllRecipes();
recipes.remove(<mekanism:machineblock:2>);

for ingot in <ore:ingotGraphite>.items {
	mods.mekanism.crusher.addRecipe(ingot, <nuclearcraft:dust:8>);
}


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
	
	var ultimateGasTank = <mekanism:gastank>.withTag({tier: 3})|<mekanism:gastank>.withTag({tier: 3, mekData:{security:0}});
	var ultimateFluidTank = <mekanism:machineblock2:11>.withTag({tier: 3})|<mekanism:machineblock2:11>.withTag({tier: 3, mekData:{}})|<mekanism:machineblock2:11>.withTag({tier: 3, mekData:{security:0}});
	
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
	[<ore:circuitUltimate>, <ic2:lapotron_crystal:*>, <ore:circuitUltimate>]]);

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
	[<ore:ingotMelodicAlloy>, <mekanism:basicblock:8>, <ore:ingotMelodicAlloy>], 
	[<ore:alloyUltimate>, <ore:circuitUltimate>, <ore:alloyUltimate>]]);

# Quantum Entangloporter
	recipes.remove(<mekanism:machineblock3>);
	recipes.addShaped("Quantum Entangloporter", <mekanism:machineblock3>, 
	[[<mekanism:basicblock:7>, <ore:heartDragon>, <mekanism:basicblock:7>],
	[<forestry:chipsets:3>.withTag({T:3 as short}, false), <mekanism:machineblock:11>|<mekanism:machineblock:11>.withTag({}), <forestry:chipsets:3>.withTag({T:3 as short}, false)], 
	[<mekanism:basicblock:7>, <rftools:matter_beamer>, <mekanism:basicblock:7>]]);

# Turbine Casing
	recipes.remove(<mekanismgenerators:generator:10>);
	recipes.addShapedMirrored("Mekanism Turbine Casing", 
	<mekanismgenerators:generator:10> * 6, 
	[[<actuallyadditions:block_misc:7>, <nuclearcraft:fission_block>, <actuallyadditions:block_misc:7>],
	[<nuclearcraft:fission_block>, <mekanism:basicblock:8>, <nuclearcraft:fission_block>], 
	[<actuallyadditions:block_misc:7>, <nuclearcraft:fission_block>, <actuallyadditions:block_misc:7>]]);

# Reactor Controller
	recipes.remove(<mekanismgenerators:reactor>);
	recipes.addShaped(<mekanismgenerators:reactor>, 
	[[<ore:circuitUltimate>, ultimateGasTank, <ore:circuitUltimate>],
	[<mekanismgenerators:reactor:1>, <nuclearcraft:fusion_core>, <mekanismgenerators:reactor:1>], 
	[<mekanismgenerators:reactor:1>, <mekanismgenerators:reactor:1>, <mekanismgenerators:reactor:1>]]);
	
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
	[<mekanism:machineblock:11>, <computercraft:computer>.anyDamage(), <mekanism:machineblock:11>]]);

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



# Fix cubes uncraftable in AE
# Just remake original crafts, but without additional security tags
remake("Mek Cube 1", <mekanism:energycube>.withTag({tier: 1}), [[<ore:alloyAdvanced>, <ore:battery>, <ore:alloyAdvanced>],[<ore:ingotOsmium>, <mekanism:energycube>.withTag({tier: 0}), <ore:ingotOsmium>], [<ore:alloyAdvanced>, <ore:battery>, <ore:alloyAdvanced>]]);
remake("Mek Cube 2", <mekanism:energycube>.withTag({tier: 2}), [[<ore:alloyElite>, <ore:battery>, <ore:alloyElite>],[<ore:ingotGold>, <mekanism:energycube>.withTag({tier: 1}), <ore:ingotGold>], [<ore:alloyElite>, <ore:battery>, <ore:alloyElite>]]);
remake("Mek Cube 3", <mekanism:energycube>.withTag({tier: 3}), [[<ore:alloyUltimate>, <ore:battery>, <ore:alloyUltimate>], [<ore:gemDiamond>, <mekanism:energycube>.withTag({tier: 2}), <ore:gemDiamond>], [<ore:alloyUltimate>, <ore:battery>, <ore:alloyUltimate>]]);


# Remake recipes of gas/fluid tanks to remove recipe functions (they caused AE2 autocrafting issues)
val mekTankIngrs = [
	<ore:dustRedstone>,
	<mekanism:enrichedalloy>,
	<mekanism:reinforcedalloy>,
	<mekanism:atomicalloy>,
	<mekanism:controlcircuit:3>,
] as IIngredient[];
for i, it in mekTankIngrs {
	var grid = [
		"#-#", 
		"-o-", 
		"#-#"] as string[];
	if(i < 4) {
		craft.remake(<mekanism:gastank>.withTag({tier: i}) , grid, { 
			"#": it, 
			"-": <ore:ingotOsmium>, 
			"o": i==0 ? null : <mekanism:gastank>.withTag({tier: i - 1}, false)
		});
	}

	if(i==0) continue;
	craft.remake(<mekanism:machineblock2:11>.withTag({tier: i - 1}) , grid, { 
		"#": it, 
		"-": <ore:ingotIron>, 
		"o": i==1 ? null : <mekanism:machineblock2:11>.withTag({tier: i - 2}, false)
	});
}

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
