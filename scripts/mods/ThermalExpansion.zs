import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import mods.jei.JEI.removeAndHide;
import crafttweaker.recipes.IRecipeFunction;
import crafttweaker.data.IData;
import scripts.craft.grid.Grid;
#modloaded thermalexpansion

# Planks/Slabs -> Sticks
for plank in <ore:plankWood>.items {
	scripts.wrap.thermalexpansion.Sawmill.addRecipe(<minecraft:stick> * 6, plank, 500, <thermalfoundation:material:800>, 30);
}

for slab in <ore:slabWood>.items {
	scripts.wrap.thermalexpansion.Sawmill.addRecipe(<minecraft:stick> * 3, slab, 250, <thermalfoundation:material:800>, 15);
}

# Canola Oil Changes	
	mods.thermalexpansion.CompressionDynamo.removeFuel(<liquid:refinedcanolaoil>);
	mods.thermalexpansion.CompressionDynamo.removeFuel(<liquid:crystaloil>);
	mods.thermalexpansion.CompressionDynamo.removeFuel(<liquid:empoweredoil>);

	mods.thermalexpansion.CompressionDynamo.addFuel(<liquid:refinedcanolaoil>, 250000);
	mods.thermalexpansion.CompressionDynamo.addFuel(<liquid:crystaloil>, 1000000);
	mods.thermalexpansion.CompressionDynamo.addFuel(<liquid:empoweredoil>, 1750000);

# Rocket Fuel Compatibility
	mods.thermalexpansion.CompressionDynamo.addFuel(<liquid:rocket_fuel>, 2000000);

	mods.thermalexpansion.NumisticDynamo.addGemFuel(<actuallyadditions:item_misc:5>, 40000);
	mods.thermalexpansion.NumisticDynamo.addGemFuel(<astralsorcery:itemcraftingcomponent:0>, 80000);
	mods.thermalexpansion.NumisticDynamo.addGemFuel(<appliedenergistics2:material:0>, 60000);
	mods.thermalexpansion.NumisticDynamo.addGemFuel(<appliedenergistics2:material:1>, 60000);
	mods.thermalexpansion.NumisticDynamo.addGemFuel(<appliedenergistics2:material:10>, 30000);
	mods.thermalexpansion.NumisticDynamo.addGemFuel(<darkutils:shulker_pearl>, 5000);

# Essence of Knowledge XP Compatibility (credit RedGoblin88)
	scripts.wrap.thermalexpansion.Crucible.addRecipe(<liquid:experience> * 200, <mysticalagriculture:xp_droplet>, 4000);
	scripts.wrap.thermalexpansion.Crucible.addRecipe(<liquid:experience> * 200, <mysticalagriculture:experience_essence>, 4000);

# Nullifier 
	recipes.remove(<thermalexpansion:device:1>);
	recipes.addShaped("Nullifier", 
	<thermalexpansion:device:1>, 
	[[<ore:ingotTin>, <ore:ingotTin>, <ore:ingotTin>],
	[<ore:ingotTin>, <extrautils2:trashcan>, <ore:ingotTin>], 
	[<ore:ingotTin>, <ore:ingotTin>, <ore:ingotTin>]]);

# Igneous Extruder
	recipes.remove(<thermalexpansion:machine:15>);
	recipes.addShaped("Igneous Extruder", 
	<thermalexpansion:machine:15>, 
	[[null, <ore:blockGlass>, null],
	[<ore:ingotInvar>, <thermalexpansion:frame:64>, <ore:ingotInvar>], 
	[<ore:gearCopper>, <immersiveengineering:metal_decoration0>, <ore:gearCopper>]]);

# [Reinforced Cell Frame (Empty)] from [Hardened Cell Frame][+5]
craft.make(<thermalexpansion:frame:130>, ["pretty",
  "S ♥ S",
  "E H E",
  "T ☼ T"], {
  "S": <ore:gearSilver>,                 # Silver Gear
  "T": <thermalfoundation:material:640>, # Tool Casing
  "E": <ore:plateElectrumFlux>,          # Fluxed Electrum Plate
  "♥": <thermalfoundation:material:515>, # Redstone Conductance Coil
  "H": <thermalexpansion:frame:129>,     # Hardened Cell Frame
  "☼": <ore:gemCrystalFlux>,             # Flux Crystal
});

# Reinforced Cell Frame (Full)
	scripts.wrap.thermalexpansion.Transposer.addFillRecipe(<thermalexpansion:frame:146>, <thermalexpansion:frame:130>, <liquid:lumium> * 576, 250000);

# Signalum Cell Frame (Empty)
	recipes.addShapedMirrored("Signalum Cell Frame Empty", 
	<thermalexpansion:frame:131>, 
	[[<ore:plateSignalum>, <ore:crystalCinnabar>, <ore:plateSignalum>],
	[<thermalfoundation:material:832>, <thermalexpansion:frame:146>, <thermalfoundation:material:832>], 
	[<ore:plateSignalum>, <ore:crystalSlagRich>, <ore:plateSignalum>]]);

# Signalum Cell Frame (Full)
	scripts.wrap.thermalexpansion.InductionSmelter.addRecipe(<thermalexpansion:frame:147>, <thermalexpansion:frame:131>, <minecraft:redstone_block> * 40, 100000);

# Resonant Cell Frame (Empty)
	scripts.wrap.forestry.ThermionicFabricator.addCast(<thermalexpansion:frame:132>, 
	[[<thermalfoundation:material:166>, <actuallyadditions:block_misc:8>, <thermalfoundation:material:166>],
	[<thermalfoundation:glass_alloy:7>, <thermalexpansion:frame:147>, <thermalfoundation:glass_alloy:7>],
	[<thermalfoundation:material:1028>, <thermalfoundation:material:1028>, <thermalfoundation:material:1028>]], <liquid:glass> * 4000);

# Resonant Cell Frame (Full)
	scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<thermalexpansion:frame:148>, 
	100000000, 1000000, 
	<thermalexpansion:frame:132>, 
	[<gendustry:genetics_processor>, <extrautils2:ingredients:5>, <ic2:plate:16>,
	<ic2:lapotron_crystal>.anyDamage(), <forestry:thermionic_tubes:12>, <forestry:crafting_material:1>,
	<mekanismgenerators:reactor:1>, <environmentaltech:structure_frame_1>, <rftools:infused_diamond>,
	<mekanism:controlcircuit:3>, <thermalfoundation:material:295>, <environmentaltech:litherite_crystal>,
	<nuclearcraft:part:6>, <nuclearcraft:gem:1>]);
	
# Mana Dust
	recipes.addShapedMirrored("Mana Dust", 
	<thermalfoundation:material:1028> * 2, 
	[[<ore:manaDiamond>, <ore:dustCryotheum>, <ore:manaDiamond>],
	[<ore:dustPyrotheum>, <ore:powderMana>, <ore:dustAerotheum>], 
	[<ore:manaDiamond>, <ore:dustPetrotheum>, <ore:manaDiamond>]]);

# Centrifugal Seperator
	recipes.remove(<thermalexpansion:machine:10>);
	recipes.addShaped("Centrifugal Seperator", 
	<thermalexpansion:machine:10>, 
	[[null, <forestry:centrifuge>, null],
	[<ore:ingotConstantan>, <thermalexpansion:frame>, <ore:ingotConstantan>], 
	[<ore:gearCopper>, <thermalfoundation:material:513>, <ore:gearCopper>]]);

# Fluid Transposer
	recipes.remove(<thermalexpansion:machine:8>);
	recipes.addShaped("Fluid Transposer", 
	<thermalexpansion:machine:8>, 
	[[<thermalexpansion:tank>, <forestry:carpenter>, <thermalexpansion:tank>],
	[<ore:blockGlass>, <thermalexpansion:frame>, <ore:blockGlass>], 
	[<ore:gearInvar>, <thermalfoundation:material:513>, <ore:gearInvar>]]);

# Sawmill
	recipes.remove(<thermalexpansion:machine:2>);
	recipes.addShaped("Sawmill", 
	<thermalexpansion:machine:2>, 
	[[null, <mekanism:machineblock2:5>, null],
	[<ore:logWood>, <thermalexpansion:frame>, <ore:logWood>], 
	[<ore:gearCopper>, <thermalfoundation:material:513>, <ore:gearCopper>]]);

# Pulverizer
	recipes.remove(<thermalexpansion:machine:1>);
	recipes.addShaped("Pulverizer", 
	<thermalexpansion:machine:1>, 
	[[<ore:craftingPiston>, <actuallyadditions:block_grinder>, <ore:craftingPiston>],
	[<tconstruct:large_plate>.withTag({Material: "flint"}), <thermalexpansion:frame>, <tconstruct:large_plate>.withTag({Material: "flint"})], 
	[<ore:gearCopper>, <thermalfoundation:material:513>, <ore:gearCopper>]]);
	
	recipes.addShaped("Pulverizer2", 
	<thermalexpansion:machine:1>, 
	[[<ore:craftingPiston>, <actuallyadditions:block_grinder_double>, <ore:craftingPiston>],
	[<tconstruct:large_plate>.withTag({Material: "flint"}), <thermalexpansion:frame>, <tconstruct:large_plate>.withTag({Material: "flint"})], 
	[<ore:gearCopper>, <thermalfoundation:material:513>, <ore:gearCopper>]]);

# Primal Mana
	scripts.wrap.tconstruct.Alloy.addRecipe(<liquid:mana> * 125, [<liquid:mirion> * 18, <liquid:osgloglas> * 18, <liquid:ic2coolant> * 125]);

# Mana Infused Ingot&Block
	scripts.wrap.mekanism.infuser.addRecipe("DIAMOND", 20, <botania:manaresource>, <thermalfoundation:material:136>);
	scripts.wrap.mekanism.infuser.addRecipe("DIAMOND", 160, <botania:storage>, <thermalfoundation:storage:8>);

# Energy Cell Frame
	recipes.remove(<thermalexpansion:frame:128>);
	scripts.wrap.mekanism.infuser.addRecipe("GLOWSTONE", 400, <thermalexpansion:frame>, <thermalexpansion:frame:128>);

# Machine Frame
	recipes.remove(<thermalexpansion:frame>);
	scripts.wrap.forestry.ThermionicFabricator.addCast(<thermalexpansion:frame> * 2, 
	[[<actuallyadditions:item_crystal:5>, <rftools:machine_frame>, <actuallyadditions:item_crystal:5>],
	[<immersiveengineering:metal_decoration0:5>, <thermalexpansion:frame:64>, <actuallyadditions:block_misc:9>], 
	[<actuallyadditions:item_crystal:5>, <teslacorelib:machine_case>, <actuallyadditions:item_crystal:5>]], 
	<liquid:glass> * 6000);
	
# Removing craftable Bronze 
	recipes.removeShapeless(<thermalfoundation:material:163> * 4, 
	[<ore:ingotTin>, <ore:ingotCopper>, <ore:ingotCopper>, <ore:ingotCopper>]);

# Redstone Reception Coil
	recipes.remove(<thermalfoundation:material:513>);
	scripts.wrap.actuallyadditions.AtomicReconstructor.addRecipe(<thermalfoundation:material:513> * 1, <immersiveengineering:metal_decoration0>, 25000);
	scripts.wrap.mekanism.infuser.addRecipe("REDSTONE", 160, <minecraft:gold_ingot>, <thermalfoundation:material:513>);

# Redstone Transmission Coil
	recipes.remove(<thermalfoundation:material:514>);
	scripts.wrap.actuallyadditions.AtomicReconstructor.addRecipe(<thermalfoundation:material:514>, <immersiveengineering:wirecoil:2>, 5000);
	scripts.wrap.mekanism.infuser.addRecipe("REDSTONE", 160, <thermalfoundation:material:130>, <thermalfoundation:material:514>);
	
# Redstone Conductance Coil
	recipes.remove(<thermalfoundation:material:515>);
	scripts.wrap.actuallyadditions.AtomicReconstructor.addRecipe(<thermalfoundation:material:515> * 1, <immersiveengineering:metal_decoration0:1>, 25000);
	scripts.wrap.mekanism.infuser.addRecipe("REDSTONE", 160, <thermalfoundation:material:161>, <thermalfoundation:material:515>);

# Removing Netherrack -> Gravel Pulverizer recipes
	mods.thermalexpansion.Pulverizer.removeRecipe(<minecraft:netherrack>);

# Making TE alloys meltable
	scripts.wrap.thermalexpansion.Crucible.addRecipe(<liquid:signalum> * 144, <thermalfoundation:material:165>, 5000);
	scripts.wrap.thermalexpansion.Crucible.addRecipe(<liquid:lumium> * 144, <thermalfoundation:material:166>, 5000);
	scripts.wrap.thermalexpansion.Crucible.addRecipe(<liquid:enderium> * 144, <thermalfoundation:material:167>, 5000);

# Signalum Ingots
	scripts.wrap.thermalexpansion.Transposer.addFillRecipe(<thermalfoundation:material:165>, <nuclearcraft:alloy:7>, <liquid:redstone> * 250, 5000);
	scripts.wrap.thermalexpansion.InductionSmelter.addRecipe(<nuclearcraft:alloy:7> * 4, <thermalfoundation:material:130>, <thermalfoundation:material:128> * 3, 15000);

# Lumium Ingots
	scripts.wrap.thermalexpansion.Transposer.addFillRecipe(<thermalfoundation:material:166>, <nuclearcraft:alloy:8>, <liquid:glowstone> * 250, 5000);
	scripts.wrap.thermalexpansion.InductionSmelter.addRecipe(<nuclearcraft:alloy:8> * 4, <thermalfoundation:material:130>, <thermalfoundation:material:129> * 3, 20000);

# Hardened Cell Frame
	scripts.wrap.actuallyadditions.Empowerer.addRecipe(<thermalexpansion:frame:129>, <thermalexpansion:frame:128>, <immersiveengineering:material:2>, <thermalfoundation:material:354>, <thermalfoundation:material:290>, <mekanism:basicblock:8>, 2500000, 200, [0.25, 0.25, 0.29]);

# Dynamo harder recipes
function remakeDynamo(name as string, item as IItemStack, i1 as IIngredient, i2 as IIngredient){
	remake("ThermalExpansion Dynamo " ~ name, item, [
		[null, <actuallyadditions:item_battery_triple>, null],
		[<thermalfoundation:material:514>, i1 , <thermalfoundation:material:514>],
		[i2, <mekanism:tierinstaller:1>, i2]]);
}

remakeDynamo("0", <thermalexpansion:dynamo>,   <ore:plateCopper>,     <ore:gearCopper>);
remakeDynamo("1", <thermalexpansion:dynamo:1>, <ore:plateInvar>,      <ore:gearInvar>);
remakeDynamo("2", <thermalexpansion:dynamo:2>, <ore:plateTin>,        <ore:gearTin>);
remakeDynamo("3", <thermalexpansion:dynamo:3>, <ore:plateLead>,       <ore:gearLead>);
remakeDynamo("4", <thermalexpansion:dynamo:4>, <ore:plateElectrum>,   <ore:gearElectrum>);
remakeDynamo("5", <thermalexpansion:dynamo:5>, <ore:plateConstantan>, <ore:gearConstantan>);

# Remove old non-working reservior clearings
recipes.removeByRecipeName("thermalexpansion:reservoir_10");
recipes.removeByRecipeName("thermalexpansion:reservoir_11");
recipes.removeByRecipeName("thermalexpansion:reservoir_12");
recipes.removeByRecipeName("thermalexpansion:reservoir_13");
recipes.removeByRecipeName("thermalexpansion:reservoir_14");

# Duct filling compat
scripts.process.fill(<thermaldynamics:duct_0:6>,  <liquid:redstone>*200,  <thermaldynamics:duct_0:2>,  null);
scripts.process.fill(<thermaldynamics:duct_0:7>,  <liquid:redstone>*200,  <thermaldynamics:duct_0:3>,  null);
scripts.process.fill(<thermaldynamics:duct_0:8>,  <liquid:redstone>*200,  <thermaldynamics:duct_0:4>,  null);
scripts.process.fill(<thermaldynamics:duct_0:9>,  <liquid:cryotheum>*500, <thermaldynamics:duct_0:5>,  null);
scripts.process.fill(<thermaldynamics:duct_32:1>, <liquid:glowstone>*200, <thermaldynamics:duct_32:3>, null);
scripts.process.fill(<thermaldynamics:duct_32:4>, <liquid:glowstone>*200, <thermaldynamics:duct_32:6>, null);
scripts.process.fill(<thermaldynamics:duct_32:5>, <liquid:glowstone>*200, <thermaldynamics:duct_32:7>, null);
scripts.process.fill(<thermaldynamics:duct_32>,   <liquid:glowstone>*200, <thermaldynamics:duct_32:2>, null);
scripts.process.fill(<thermaldynamics:duct_64:3>, <liquid:aerotheum>*500, <thermaldynamics:duct_64>,   null);
scripts.process.fill(<thermaldynamics:duct_64>,   <liquid:ender>*1000,    <thermaldynamics:duct_64:2>, null);

# Remove and hide creative innovation items
removeAndHide(<thermalinnovation:quiver:32000>.withTag({}));
removeAndHide(<thermalinnovation:injector:32000>.withTag({}));
removeAndHide(<thermalinnovation:magnet:32000>.withTag({Energy: 600000}));

# Remake magnet
recipes.removeByRecipeName("thermalinnovation:magnet");
recipes.removeByRecipeName("thermalinnovation:magnet_1");
recipes.removeByRecipeName("thermalinnovation:magnet_2");
recipes.removeByRecipeName("thermalinnovation:magnet_3");
recipes.removeByRecipeName("thermalinnovation:magnet_4");

# First level magnet
recipes.addShaped(<thermalinnovation:magnet>, [
	[<ore:ingotConductiveIron>, null, <ore:ingotConductiveIron>],
	[<ore:ingotLead>, null, <ore:ingotLead>],
	[null, <ore:ingotHeavy>, null]]);

function remakeMagnet(meta as int, i1 as IIngredient, i2 as IIngredient){
	var item = itemUtils.getItem("thermalinnovation:magnet", meta);
	var prev = itemUtils.getItem("thermalinnovation:magnet", meta - 1);
	recipes.addShaped("TE Magnet  " ~ meta, item, [
		[null, i2, null],
		[i1, prev, i1],
		[i2, null, i2]]);
}

remakeMagnet(1, <thermalfoundation:material:162>, <enderio:item_alloy_nugget:0>);
remakeMagnet(2, <thermalfoundation:material:161>, <enderio:item_alloy_nugget:3>);
remakeMagnet(3, <thermalfoundation:material:165>, <enderio:item_alloy_nugget:1>);
remakeMagnet(4, <thermalfoundation:material:167>, <enderio:item_alloy_nugget:2>);

# More TE coolants
# mods.thermalexpansion.Coolant.addCoolant(ILiquidStack fluid, int coolantRf, int coolantFactor);
mods.thermalexpansion.Coolant.addCoolant(<liquid:liquidhelium>,   3500000, 65);
mods.thermalexpansion.Coolant.addCoolant(<liquid:liquid_nitrogen>, 2500000, 55);
mods.thermalexpansion.Coolant.addCoolant(<liquid:ender_distillation>, 4000000, 70);
mods.thermalexpansion.Coolant.addCoolant(<liquid:vapor_of_levity>, 4500000, 75);
mods.thermalexpansion.Coolant.addCoolant(<liquid:blockfluidantimatter>, 5000000, 80);

#####################################
# Enderium harder recipe
#####################################

recipes.remove(<ore:dustEnderium>.firstItem * 4);

# EnderIO Remove enderium and enderium base recipes
val enderiumBase = <enderio:item_material:39>;
val enderiumIngot = <thermalfoundation:material:167>;
mods.enderio.AlloySmelter.removeRecipe(enderiumIngot);
mods.enderio.AlloySmelter.removeRecipe(enderiumBase);
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<nuclearcraft:alloy:9> * 4);

# Remove Lead platinum alloy -> Enderium (used only to two-step craft for enderium)
mods.nuclearcraft.infuser.removeRecipeWithOutput(<ore:ingotEnderium>.firstItem);

# Remake ender ingot recipe
val enderIngot = <extendedcrafting:material:36>;
craft.reshapeless(enderIngot * 2, "ABB", {
	A: <ore:ingotPlatinum>,
	B: <ore:dustEnder>,
	remove: enderIngot});
scripts.wrap.mekanism.infuser.addRecipe("ENDER", 20, <ore:ingotPlatinum>, enderIngot * 2);

# Remake Pulsating ender recipe
mods.enderio.AlloySmelter.removeRecipe(<ore:ingotPulsatingIron>.firstItem);
mods.thermalexpansion.InductionSmelter.removeRecipe(<ore:dustIron>.firstItem, <minecraft:ender_pearl>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:iron_ingot>, <minecraft:ender_pearl>);
scripts.process.alloy([<minecraft:iron_ingot>, <ore:dustEnderEye>], <ore:ingotPulsatingIron>.firstItem, "except: alloyFurnace");

# Ender Eye dust
scripts.process.crush(<minecraft:ender_eye>, <ic2:dust:32>, "No Exceptions", [<minecraft:blaze_powder>], [0.2]);

# Enderium base
scripts.process.alloy([<ore:ingotPulsatingIron>, enderIngot * 2], <enderio:item_material:39>, "no exception");

# Enderium base -> Enderium ingot
scripts.process.fill(<enderio:item_material:39>, <liquid:ender> * 500, enderiumIngot, "only: NCInfuser Transposer");

# Alloy in smeltery -> Enderium ingot
mods.tconstruct.Alloy.removeRecipe(<liquid:enderium>);
scripts.wrap.tconstruct.Alloy.addRecipe(<liquid:enderium> * 144, [<liquid:platinum> * 144,  <liquid:pulsating_iron> * 144, <liquid:ender> * 1500]);

#####################################

# Clathrates rework. More output
function reworkClathrate(ore as IItemStack, crystal as IItemStack, dust as IItemStack, liquid as ILiquidStack) {
	# Rermove defaults outputs
	mods.thermalexpansion.Crucible.removeRecipe(ore);
	mods.thermalexpansion.Crucible.removeRecipe(crystal);
	mods.thermalexpansion.Transposer.removeFillRecipe(crystal, <liquid:cryotheum> * 200);
	recipes.removeShapeless(<*>, [crystal, <thermalfoundation:material:1025>]);
	
	# Melting into raw liquids
	scripts.process.melt(ore, liquid * min(10000, liquid.amount * 4), "no exceptions");
	scripts.process.melt(crystal, liquid, "no exceptions");

	# Filling with cryotheum to make advanced liquids
	scripts.process.fill(crystal, <liquid:cryotheum> * 250, dust, "only: NCInfuser Transposer");
}

reworkClathrate(<thermalfoundation:ore_fluid:2>, <thermalfoundation:material:893>, <thermalfoundation:material:101>, <liquid:redstone> * 1000);
reworkClathrate(<thermalfoundation:ore_fluid:3>, <thermalfoundation:material:894>, <thermalfoundation:material:102>, <liquid:glowstone> * 2500);
reworkClathrate(<thermalfoundation:ore_fluid:4>, <thermalfoundation:material:895>, <thermalfoundation:material:103>, <liquid:ender> * 2500);

#####################################

# [Reinforced_Upgrade_Kit] from [Iridium_Gear][+2]
craft.remake(<thermalfoundation:upgrade:1>, ["pretty",
  "  ▬  ",
  "▬ I ▬",
  "□ ▬ □"], {
  "□": <ore:blockGlassHardened>, # Hardened Copper Glass
  "I": <ore:gearIridium>,        # Iridium Gear
  "▬": <ore:ingotLumium>         # Lumium Ingot
});

# [Signalum_Upgrade_Kit] from [Lumium_Gear][+2]
craft.remake(<thermalfoundation:upgrade:2>, ["pretty",
  "  ▬  ",
  "▬ L ▬",
  "E ▬ E"], {
  "E": <ore:plateElite>,    # Elite Plating
  "▬": <ore:ingotSignalum>, # Signalum Ingot
  "L": <ore:gearLumium>     # Lumium Gear
});

# [Resonant_Upgrade_Kit] from [Signalum_Gear][+2]
craft.remake(<thermalfoundation:upgrade:3>, ["pretty",
  "  ▬  ",
  "▬ S ▬",
  "☼ ▬ ☼"], {
  "S": <ore:gearSignalum>,  # Signalum Gear
  "▬": <ore:ingotEnderium>, # Enderium Ingot
  "☼": <ore:crystalEnder>   # Resonant Clathrate
});

# Remove TE vanilla compass & clock slag dupes
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, <minecraft:compass>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:sand>, <minecraft:clock>);

# Process Geodes
scripts.process.crush(<thermalfoundation:geode>, <mysticalagradditions:insanium:5>, "No exceptions", 
  [<mysticalagradditions:insanium:5>], [0.25]);

#####################################
# Remake Hardened versions of equipment
# they required $hardenedGlass, that actually too hard to craft
#####################################

# Remove all old recipes
for name in [
	/*"frame_1",*/ "frame_3"    , "frame_4"    , "frame_5",
	"frame_6"    , "frame_7"    , "frame_8"    , "cell_1",
	"cell_2"     , "cell_3"     , "cell_4"     , "cell_5",
	"cell_6"     , "cell_7"     , "cell_8"     , "cell",
	"cache_1"    , "cache_2"    , "cache_3"    , "cache_4",
	"cache_5"    , "cache"      ,
	// "reservoir_1", "reservoir_2", "reservoir_3", "reservoir_4", "reservoir"  ,
	"satchel_2"  , "satchel_3"  , "satchel_4"  , "satchel_5",
	"satchel_6"  , "satchel_7"  , "strongbox_1",
	"strongbox_2", "strongbox_3", "strongbox_4", "strongbox_5",
	"strongbox"  , "tank_1"     , "tank_2"     , "tank_3",
	"tank_4"     , "tank_5"     , "tank"
] as string[] {
	recipes.removeByRecipeName("thermalexpansion:" ~ name);
}

# Also remove frames filling
for i in 130 to 133 {
	mods.thermalexpansion.Transposer.removeFillRecipe(<thermalexpansion:frame>.definition.makeStack(i), <liquid:redstone> * 4000);
}

val upgradeFnc as IRecipeFunction = function(out, ins, cInfo){
	if(ins has "marked" && !isNull(ins.marked) && ins.marked.hasTag) {
		return ins.marked.updateTag({Level: D(ins.marked.tag).getByte("Level", 0) + 1 as byte});
	}
	return out;
};

# Adding recipes
val materials = [
	"Tin",
	"Invar",
	"Electrum",
	"Signalum",
	"Enderium",
] as string[];

for i, mat in materials {
	val lvl_i  = {Level: i as byte} as IData;
	val lvl_im = {Level: (i - 1) as byte} as IData;

	if(i != 0) {
		# Simplify Satchels
		craft.make(
			<thermalexpansion:satchel>.definition.makeStack(i), ["aOa"],
			{O: <thermalexpansion:satchel>.definition.makeStack(i - 1).marked("marked"), a: oreDict["nugget" ~ mat]}, utils.upgradeFnc
		);

		# Tank
		craft.make(<thermalexpansion:tank>.withTag(lvl_i), ["pretty",
			"□ a □",
			"g ♥ g",
			"□ a □"], {
			"♥": <thermalexpansion:tank>.withTag(lvl_im).marked("marked"),
			"a": oreDict["ingot" ~ materials[i - 1]],
			"g": oreDict["gear" ~ mat],
			"□": <tconstruct:clear_glass>,
		}, upgradeFnc);

		# Cache
		craft.remake(<thermalexpansion:cache>.withTag(lvl_i), ["pretty",
			", ▬ ,",
			"▬ ♥ ▬",
			", ▬ ,"], {
			"♥": <thermalexpansion:cache>.withTag(lvl_im).marked("marked"),
			"▬": oreDict["ingot" ~ materials[i - 1]],
			",": oreDict["nugget" ~ mat],
		}, upgradeFnc);

		# Strongbox
		craft.remake(<thermalexpansion:strongbox>.withTag(lvl_i), ["pretty",
			"  ▬  ",
			"i ♥ i",
			"  ▬  "], {
			"♥": <thermalexpansion:strongbox>.withTag(lvl_im).marked("marked"),
			"▬": oreDict["ingot" ~ mat],
			"i": oreDict["ingot" ~ materials[i - 1]],
		}, upgradeFnc);
	}

	# Cell
	craft.remake(<thermalexpansion:cell>.withTag(lvl_i), ["pretty",
		"□ c □",
		"g Ϟ g",
		"□ c □"], {
		"Ϟ": ((i==0) 
			? <thermalexpansion:frame:128> # Energy Cell Frame
			: <thermalexpansion:cell>.withTag(lvl_im)).marked("marked"),
		"□": ((i==0)
			? <ore:plateLead>
			: oreDict["plate" ~ materials[i - 1]]),
		"g": oreDict["gear" ~ mat],
		"c": <thermalfoundation:material:515>, # Redstone Conductance Coil
	}, (i==0)?null:upgradeFnc);
}

# Level 0 of items
craft.make(<thermalexpansion:tank>.withTag({/* RSControl: 0 as byte,  */Level: 0 as byte}), ["pretty",
	"  □  ",
	"□ ▬ □",
	"  ♥  "], {
	"□": <ore:blockGlass>,
	"♥": <thermalfoundation:material:512>, # Redstone Servo
	"▬": <ore:ingotCopper>
});

# Cache
craft.remake(<thermalexpansion:cache>.withTag({/* Facing: 3 as byte,  */Level: 0 as byte}), ["pretty",
  "  ▬  ",
  "▬ c ▬",
  "  ♥  "], {
  "c": <ore:chest>,                      # Oak Chest
  "♥": <thermalfoundation:material:512>, # Redstone Servo
  "▬": <ore:ingotTin>                    # Tin Ingot
});

# Strongbox
craft.remake(<thermalexpansion:strongbox>.withTag({/* Facing: 3 as byte,  */Level: 0 as byte}), ["pretty",
	"  ▬  ",
	"i ♥ i",
	"  ▬  "], {
	"♥": <ore:chest>,
	"▬": <ore:ingotTin>,
	"i": <ore:ingotCopper>,
});

mods.jei.JEI.hide(<thermalexpansion:cell>.withTag({Recv: 10000, RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [2, 1, 1, 1, 1, 1] as byte[] as byte[], Level: 0 as byte, Send: 10000}));
mods.jei.JEI.hide(<thermalexpansion:tank>.withTag({RSControl: 0 as byte, Level: 0 as byte}));
mods.jei.JEI.hide(<thermalexpansion:cache>.withTag({Facing: 3 as byte, Level: 0 as byte}));
mods.jei.JEI.hide(<thermalexpansion:strongbox>.withTag({Facing: 3 as byte, Level: 0 as byte}));

# Add Strongboxes to JEI
for i in 0 to 5 {
	val tank = <thermalexpansion:tank>     .withTag({/* RSControl: 0 as byte,  */Level: i as byte});
	utils.clearFluid(tank, "Clear TE Tank "~i);
	mods.jei.JEI.addItem(tank);
	mods.jei.JEI.addItem(<thermalexpansion:strongbox>.withTag({/* Facing: 3 as byte,  */Level: i as byte}));
	mods.jei.JEI.addItem(<thermalexpansion:cache>    .withTag({/* Facing: 3 as byte,  */Level: i as byte}));
	mods.jei.JEI.addItem(<thermalexpansion:cell>     .withTag({                   Level: i as byte}));
}

# Make cryotheum dust alternative
recipes.removeByRecipeName("thermalfoundation:dust_cryotheum");
recipes.addShapeless("dust_cryotheum x1", <thermalfoundation:material:1025> * 1, [<ore:dustBlizz>, <ore:dustBlizz>, <ore:dustRedstone>, <minecraft:snowball>]);
recipes.addShapeless("dust_cryotheum x4", <thermalfoundation:material:1025> * 4, [<ore:dustBlizz>, <ore:dustBlizz>, <ore:dustRedstone>, <forestry:pollen:1>]);

# Clear content of reserviors
for i in 0 to 5 {
	val reservior as IItemStack = <thermalexpansion:reservoir>.definition.makeStack(i) as IItemStack;
	utils.clearFluid(reservior);
}

# [Device Frame] from [Copper Gear][+2]
recipes.remove(<thermalexpansion:frame:64>);
scripts.wrap.forestry.ThermionicFabricator.addCast(<thermalexpansion:frame:64>, Grid(["pretty",
  "▬   ▬",
  "  C  ",
  "▬   ▬"], {
  "C": <ore:gearCopper>, # Copper Gear
  "▬": <ore:ingotTin>,   # Tin Ingot
}).shaped(), <liquid: glass> * 1000, <forestry:wax_cast:*>);

# [Augment: Auxiliary Reception Coil] from [Redstone Servo][+2]
craft.remake(<thermalexpansion:augment:128>, ["pretty",
  "  E  ",
  "T ♥ T",
  "  E  "], {
  "T": <thermalfoundation:material:640>, # Tool Casing
  "E": <ore:plateElectrum>,              # Electrum Plate
  "♥": <thermalfoundation:material:512>, # Redstone Servo
});

# [Augment: Auxiliary Sieve] from [Redstone Servo][+2]
craft.remake(<thermalexpansion:augment:129>, ["pretty",
  "  C  ",
  "T ♥ T",
  "  C  "], {
  "C": <ore:plateConstantan>,            # Constantan Plate
  "T": <thermalfoundation:material:640>, # Tool Casing
  "♥": <thermalfoundation:material:512>, # Redstone Servo
});

# [Augment: Sapling Infuser] from [Redstone Servo][+2]
craft.remake(<thermalexpansion:augment:323>, ["pretty",
  "  L  ",
  "T ♥ T",
  "  L  "], {
  "T": <thermalfoundation:material:640>, # Tool Casing
  "♥": <thermalfoundation:material:512>, # Redstone Servo
  "L": <ore:plateLumium>,                # Lumium Plate
});

# [Tool Casing] from [Block of Black Quartz][+2]
craft.remake(<thermalfoundation:material:640>, ["pretty",
  "R   R",
  "E • E"], {
  "R": <thermalfoundation:material:832>, # Rosin
  "•": <ore:blockQuartzBlack>, # Block of Black Quartz
  "E": <tconstruct:large_plate>.withTag({Material: "electrum"}), # Electrum Large Plate
});

# [Tool Casing*8] from [Block of Black Quartz][+2]
craft.make(<thermalfoundation:material:640> * 8, ["pretty",
  "R   R",
  "E • E"], {
  "R": <ore:dropRoyalJelly>,                # Royal Jelly
  "•": <ore:blockQuartzBlack>, # Block of Black Quartz
  "E": <tconstruct:large_plate>.withTag({Material: "electrum"}), # Electrum Large Plate
});