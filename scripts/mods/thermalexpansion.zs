import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.recipes.IRecipeFunction;
import crafttweaker.data.IData;
#modloaded thermalexpansion

# Planks/Slabs -> Sticks
for plank in <ore:plankWood>.items {
	mods.thermalexpansion.Sawmill.addRecipe(<minecraft:stick> * 6, plank, 500, <thermalfoundation:material:800>, 30);
}

for slab in <ore:slabWood>.items {
	mods.thermalexpansion.Sawmill.addRecipe(<minecraft:stick> * 3, slab, 250, <thermalfoundation:material:800>, 15);
}
	
recipes.addShaped("TE Wooden Gear", 
<thermalfoundation:material:22>, 
[[null, <ore:plankWood>, null],
[<ore:plankWood>, null, <ore:plankWood>], 
[null, <ore:plankWood>, null]]);

recipes.addShaped("TE Stone Gear Direct", 
<thermalfoundation:material:23>, 
[[<ore:plankWood>, <ore:cobblestone>, <ore:plankWood>],
[<ore:cobblestone>, null, <ore:cobblestone>], 
[<ore:plankWood>, <ore:cobblestone>, <ore:plankWood>]]);

recipes.addShaped("TE Stone Gear Wood", 
<thermalfoundation:material:23>, 
[[null, <ore:cobblestone>, null],
[<ore:cobblestone>, <ore:gearWood>, <ore:cobblestone>], 
[null, <ore:cobblestone>, null]]);

// Iridium conversion
recipes.addShapeless(<thermalfoundation:material:135> * 2, [<ic2:misc_resource:1>, <ic2:misc_resource:1>]);
recipes.addShapeless(<ic2:misc_resource:1> * 2, [<thermalfoundation:material:135>, <thermalfoundation:material:135>]);

# Canola Oil Changes	
	mods.thermalexpansion.CompressionDynamo.removeFuel(<liquid:refinedcanolaoil>);
	mods.thermalexpansion.CompressionDynamo.removeFuel(<liquid:crystaloil>);
	mods.thermalexpansion.CompressionDynamo.removeFuel(<liquid:empoweredoil>);

	mods.thermalexpansion.CompressionDynamo.addFuel(<liquid:refinedcanolaoil>, 250000);
	mods.thermalexpansion.CompressionDynamo.addFuel(<liquid:biofuel>, 500000);
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
	mods.thermalexpansion.Crucible.addRecipe(<liquid:experience> * 200, <mysticalagriculture:xp_droplet>, 4000);
	mods.thermalexpansion.Crucible.addRecipe(<liquid:experience> * 200, <mysticalagriculture:experience_essence>, 4000);

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
	mods.thermalexpansion.Transposer.addFillRecipe(<thermalexpansion:frame:146>, <thermalexpansion:frame:130>, <liquid:lumium> * 576, 250000);

# Signalum Cell Frame (Empty)
	recipes.addShapedMirrored("Signalum Cell Frame Empty", 
	<thermalexpansion:frame:131>, 
	[[<ore:plateSignalum>, <ore:crystalCinnabar>, <ore:plateSignalum>],
	[<thermalfoundation:material:832>, <thermalexpansion:frame:146>, <thermalfoundation:material:832>], 
	[<ore:plateSignalum>, <ore:crystalSlagRich>, <ore:plateSignalum>]]);

# Signalum Cell Frame (Full)
	mods.thermalexpansion.InductionSmelter.addRecipe(<thermalexpansion:frame:147>, <thermalexpansion:frame:131>, <minecraft:redstone_block> * 40, 100000);

# Resonant Cell Frame (Empty)
	scripts.mods.forestry.ThermionicFabricator.addCast(<thermalexpansion:frame:132>, 
	[[<thermalfoundation:material:166>, <actuallyadditions:block_misc:8>, <thermalfoundation:material:166>],
	[<thermalfoundation:glass_alloy:7>, <thermalexpansion:frame:147>, <thermalfoundation:glass_alloy:7>],
	[<thermalfoundation:material:1028>, <thermalfoundation:material:1028>, <thermalfoundation:material:1028>]], <liquid:glass> * 4000, null, 4);

# Resonant Cell Frame (Full)
	mods.extendedcrafting.CombinationCrafting.addRecipe(<thermalexpansion:frame:148>, 
	100000000, 1000000, 
	<thermalexpansion:frame:132>, 
	[<gendustry:genetics_processor>, <extrautils2:ingredients:5>, <ic2:plate:16>,
	<ore:lapotronCrystal>, <forestry:thermionic_tubes:12>, <forestry:crafting_material:1>,
	<mekanismgenerators:reactor:1>, <environmentaltech:structure_frame_1>, <rftools:infused_diamond>,
	<mekanism:controlcircuit:3>, <thermalfoundation:material:295>, <environmentaltech:litherite_crystal>,
	<nuclearcraft:part:6>, <nuclearcraft:gem:1>]);
	
# [Mana Dust*2] from [Mana Powder][+5]
craft.remake(<thermalfoundation:material:1028> * 2, ["pretty",
  "◊ ♠ ◊",
  "∆ M ♣",
  "◊ ▲ ◊"], {
  "♠": <ore:dustAerotheum>,  # Aerotheum Dust
  "▲": <ore:dustPyrotheum>,  # Pyrotheum Dust
  "♣": <ore:dustPetrotheum>, # Petrotheum Dust
  "∆": <ore:dustCryotheum>,  # Cryotheum Dust
  "◊": <ore:gemTanzanite>,   # Tanzanite
  "M": <ore:powderMana>,     # Mana Powder
});

# Centrifugal Seperator
	recipes.remove(<thermalexpansion:machine:10>);
	recipes.addShaped("Centrifugal Seperator", 
	<thermalexpansion:machine:10>, 
	[[null, <forestry:centrifuge>, null],
	[<ore:ingotConstantan>, <thermalexpansion:frame>, <ore:ingotConstantan>], 
	[<ore:gearCopper>, <thermalfoundation:material:513>, <ore:gearCopper>]]);

# Sawmill
	recipes.remove(<thermalexpansion:machine:2>);
	recipes.addShaped("Sawmill", 
	<thermalexpansion:machine:2>, 
	[[null, <mekanism:machineblock2:5>, null],
	[<ore:logWood>, <thermalexpansion:frame>, <ore:logWood>], 
	[<ore:gearCopper>, <thermalfoundation:material:513>, <ore:gearCopper>]]);


# Primal Mana
	mods.tconstruct.Alloy.addRecipe(<liquid:mana> * 125, [<liquid:spectre> * 144, <liquid:flux_goo> * 125]);

# Energy Cell Frame
	recipes.remove(<thermalexpansion:frame:128>);
	mods.mekanism.infuser.addRecipe("GLOWSTONE", 400, <thermalexpansion:frame>, <thermalexpansion:frame:128>);

# [Machine Frame]*2 from [Device Frame][+6]
	recipes.remove(<thermalexpansion:frame>);
	scripts.mods.forestry.ThermionicFabricator.addCast(<thermalexpansion:frame> * 2, 
		Grid(["pretty",
			"■ B ■",
			"M ◙ ⌂",
			"* ▄ *"], {
			"■": <ore:blockOsmium>,                          # Osmium Block
			"B": <advancedrocketry:basalt>,                  # Basalt Sediment
			"M": <rftools:machine_frame>,                    # Machine Frame
			"◙": <thermalexpansion:frame:64>,                # Device Frame
			"⌂": <actuallyadditions:block_misc:9>,           # Iron Casing
			"*": <actuallyadditions:block_crystal:3>,        # Void Crystal Block
			"▄": <immersiveengineering:metal_decoration0:5>, # Heavy Engineering Block
		}).shaped(), 
	<liquid:glass> * 6000, null, 4);
	
# Removing craftable Bronze 
	recipes.removeShapeless(<thermalfoundation:material:163> * 4, 
	[<ore:ingotTin>, <ore:ingotCopper>, <ore:ingotCopper>, <ore:ingotCopper>]);

# Redstone Reception Coil
	recipes.remove(<thermalfoundation:material:513>);
	mods.actuallyadditions.AtomicReconstructor.addRecipe(<thermalfoundation:material:513>, <immersiveengineering:metal_decoration0>, 25000);
	mods.mekanism.infuser.addRecipe("REDSTONE", 160, <minecraft:gold_ingot>, <thermalfoundation:material:513>);

# Redstone Transmission Coil
	recipes.remove(<thermalfoundation:material:514>);
	mods.actuallyadditions.AtomicReconstructor.addRecipe(<thermalfoundation:material:514>, <immersiveengineering:wirecoil:2>, 5000);
	mods.mekanism.infuser.addRecipe("REDSTONE", 160, <thermalfoundation:material:130>, <thermalfoundation:material:514>);
	
# Redstone Conductance Coil
	recipes.remove(<thermalfoundation:material:515>);
	mods.actuallyadditions.AtomicReconstructor.addRecipe(<thermalfoundation:material:515>, <immersivecables:wire_coil>, 25000);
	mods.mekanism.infuser.addRecipe("REDSTONE", 160, <thermalfoundation:material:161>, <thermalfoundation:material:515>);

# Removing Netherrack -> Gravel Pulverizer recipes
	mods.thermalexpansion.Pulverizer.removeRecipe(<minecraft:netherrack>);

# Making TE alloys meltable
	mods.thermalexpansion.Crucible.addRecipe(<liquid:signalum> * 144, <thermalfoundation:material:165>, 5000);
	mods.thermalexpansion.Crucible.addRecipe(<liquid:lumium> * 144, <thermalfoundation:material:166>, 5000);
	mods.thermalexpansion.Crucible.addRecipe(<liquid:enderium> * 144, <thermalfoundation:material:167>, 5000);

# Signalum Ingots
	mods.thermalexpansion.Transposer.addFillRecipe(<thermalfoundation:material:165>, <nuclearcraft:alloy:7>, <liquid:redstone> * 250, 5000);
	mods.thermalexpansion.InductionSmelter.addRecipe(<nuclearcraft:alloy:7> * 4, <thermalfoundation:material:130> * 3, <thermalfoundation:material:128>, 15000);

# Lumium Ingots
	mods.thermalexpansion.Transposer.addFillRecipe(<thermalfoundation:material:166>, <nuclearcraft:alloy:8>, <liquid:glowstone> * 250, 5000);
	mods.thermalexpansion.InductionSmelter.addRecipe(<nuclearcraft:alloy:8> * 4, <thermalfoundation:material:130>, <thermalfoundation:material:129> * 3, 20000);

# Hardened Cell Frame
	mods.actuallyadditions.Empowerer.addRecipe(<thermalexpansion:frame:129>, <thermalexpansion:frame:128>, <immersiveengineering:material:2>, <thermalfoundation:material:354>, <thermalfoundation:material:290>, <mekanism:basicblock:8>, 2500000, 200, [0.25, 0.25, 0.29]);

# Dynamo harder recipes
function remakeDynamo(item as IItemStack, oreName as string) {
	recipes.removeShaped(item);
	recipes.addShaped("ThermalExpansion Dynamo " ~ item.damage, item, [
		[null, <actuallyadditions:item_battery_double:*>, null],
		[<thermalfoundation:material:514>, oreDict["plate"~oreName], <thermalfoundation:material:514>],
		[oreDict["gear"~oreName], <mekanism:tierinstaller>, oreDict["gear"~oreName]]]);
}

remakeDynamo(<thermalexpansion:dynamo:0>, "Copper");
remakeDynamo(<thermalexpansion:dynamo:1>, "Invar");
remakeDynamo(<thermalexpansion:dynamo:2>, "Tin");
remakeDynamo(<thermalexpansion:dynamo:3>, "Lead");
remakeDynamo(<thermalexpansion:dynamo:4>, "Electrum");
remakeDynamo(<thermalexpansion:dynamo:5>, "Constantan");

# Remove old non-working reservior clearings
recipes.removeByRecipeName("thermalexpansion:reservoir_10");
recipes.removeByRecipeName("thermalexpansion:reservoir_11");
recipes.removeByRecipeName("thermalexpansion:reservoir_12");
recipes.removeByRecipeName("thermalexpansion:reservoir_13");
recipes.removeByRecipeName("thermalexpansion:reservoir_14");

# Duct filling compat
scripts.process.fill(<thermaldynamics:duct_0:6>,  <liquid:redstone>*200,  <thermaldynamics:duct_0:2>);
scripts.process.fill(<thermaldynamics:duct_0:7>,  <liquid:redstone>*200,  <thermaldynamics:duct_0:3>);
scripts.process.fill(<thermaldynamics:duct_0:8>,  <liquid:redstone>*200,  <thermaldynamics:duct_0:4>);
scripts.process.fill(<thermaldynamics:duct_0:9>,  <liquid:cryotheum>*500, <thermaldynamics:duct_0:5>);
scripts.process.fill(<thermaldynamics:duct_32:1>, <liquid:glowstone>*200, <thermaldynamics:duct_32:3>);
scripts.process.fill(<thermaldynamics:duct_32:4>, <liquid:glowstone>*200, <thermaldynamics:duct_32:6>);
scripts.process.fill(<thermaldynamics:duct_32:5>, <liquid:glowstone>*200, <thermaldynamics:duct_32:7>);
scripts.process.fill(<thermaldynamics:duct_32>,   <liquid:glowstone>*200, <thermaldynamics:duct_32:2>);
scripts.process.fill(<thermaldynamics:duct_64:3>, <liquid:oliveoil>*300,  <thermaldynamics:duct_64>);
scripts.process.fill(<thermaldynamics:duct_64>,   <liquid:biomass>*300,   <thermaldynamics:duct_64:2>);

# More TE coolants
# mods.thermalexpansion.Coolant.addCoolant(ILiquidStack fluid, int coolantRf, int coolantFactor);
mods.thermalexpansion.Coolant.addCoolant(<liquid:liquid_helium>,   3500000, 65);
mods.thermalexpansion.Coolant.addCoolant(<liquid:liquid_nitrogen>, 2500000, 55);
mods.thermalexpansion.Coolant.addCoolant(<liquid:ender_distillation>, 4000000, 70);
mods.thermalexpansion.Coolant.addCoolant(<liquid:vapor_of_levity>, 4500000, 75);
mods.thermalexpansion.Coolant.addCoolant(<liquid:blockfluidantimatter>, 5000000, 80);

#####################################
# Enderium harder recipe
#####################################

recipes.remove(<ore:dustEnderium>.firstItem * 4);

# Remove Lead platinum alloy -> Enderium (used only to two-step craft for enderium)
mods.nuclearcraft.Infuser.removeRecipeWithOutput(<ore:ingotEnderium>.firstItem);

# Remake ender ingot recipe
val enderIngot = <extendedcrafting:material:36>;
craft.reshapeless(enderIngot * 2, "ABB", {
	A: <ore:ingotPlatinum>,
	B: <ore:dustEnder>});
mods.mekanism.infuser.addRecipe("ENDER", 20, <ore:ingotPlatinum>, enderIngot * 2);

# Remake Pulsating ender recipe
mods.thermalexpansion.InductionSmelter.removeRecipe(<ore:dustIron>.firstItem, <minecraft:ender_pearl>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:iron_ingot>, <minecraft:ender_pearl>);
scripts.process.alloy([<minecraft:iron_ingot>, <ore:dustEnderEye>], <ore:ingotPulsatingIron>.firstItem, "except: alloyFurnace");

# Ender Eye dust
scripts.process.crush(<minecraft:ender_eye>, <ic2:dust:32>, "No Exceptions", [<minecraft:blaze_powder>], [0.2]);

# Enderium base
scripts.process.alloy([<ore:ingotPulsatingIron>, enderIngot * 2], <enderio:item_material:39>, "no exception");

# Enderium base -> Enderium ingot
scripts.process.fill(<enderio:item_material:39>, <liquid:ender> * 500, <thermalfoundation:material:167>, "only: NCInfuser Transposer");

# Alloy in smeltery -> Enderium ingot
mods.tconstruct.Alloy.removeRecipe(<liquid:enderium>);
mods.tconstruct.Alloy.addRecipe(<liquid:enderium> * 144, [<liquid:platinum> * 144,  <liquid:pulsating_iron> * 144, <liquid:ender> * 1500]);

#####################################

# Clathrates rework. More output
function reworkClathrate(ore as IItemStack, crystal as IItemStack, dust as IItemStack, liquid as ILiquidStack) {
	# Remove default outputs
	mods.thermalexpansion.Crucible.removeRecipe(ore);
	mods.thermalexpansion.Crucible.removeRecipe(crystal);
	mods.thermalexpansion.Transposer.removeFillRecipe(crystal, <liquid:cryotheum> * 200);
	recipes.removeShapeless(<*>, [crystal, <thermalfoundation:material:1025>]);
	
	# Buff melting into raw liquids
	scripts.process.melt(ore, liquid * min(10000, liquid.amount * 4), "no exceptions");
	scripts.process.melt(crystal, liquid, "no exceptions");

	# Filling with cryotheum to make advanced liquids
	scripts.process.fill(crystal, <liquid:cryotheum> * 250, dust, "only: NCInfuser Transposer");
}

reworkClathrate(<thermalfoundation:ore_fluid:2>, <thermalfoundation:material:893>, <thermalfoundation:material:101>, <liquid:redstone> * 1000);
reworkClathrate(<thermalfoundation:ore_fluid:3>, <thermalfoundation:material:894>, <thermalfoundation:material:102>, <liquid:glowstone> * 2500);
reworkClathrate(<thermalfoundation:ore_fluid:4>, <thermalfoundation:material:895>, <thermalfoundation:material:103>, <liquid:ender> * 2500);

recipes.addShapeless('Carminite cheap recipe', <twilightforest:carminite> * 2, [<twilightforest:borer_essence>, <ore:clathrateRedstone>]);

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

# Add other slag => Rockwool
furnace.addRecipe(<thermalfoundation:rockwool:7>, <immersiveengineering:material:7>, 1);

# Remove Slag from Rock Wool recipe
for i in 0 .. 16 {
	mods.extrautils2.Crusher.remove(<thermalfoundation:rockwool>.definition.makeStack(i));
}

# Process Geodes
scripts.process.crush(<thermalfoundation:geode>, <mysticalagradditions:insanium:5>, "No exceptions", 
  [<mysticalagradditions:insanium:5>], [0.25], {bonusType: "MULTIPLY_OUTPUT"});

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
	// "satchel_6"  , "satchel_7"  , // Void Satchel
	"strongbox_1",
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

val tieredUpgradeFnc as IRecipeFunction = function(out, ins, cInfo){
	if(ins has "marked" && !isNull(ins.marked) && !isNull(ins.marked.tag)) {
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

val catalysts = [
	<ore:dustCryotheum>, # Cryotheum Dust
	<thermalfoundation:material:832>, # Rosin
	<ore:itemSlagRich>, # Rich Slag
	<ore:gearEmerald>, # Emerald Gear
	<ore:clathrateRedstone>, # Destabilized Clathrate
] as IIngredient[];


recipes.removeShaped(<thermalexpansion:capacitor:*>);
for i, mat in materials {
	val lvl_i  = {Level: i as byte} as IData;
	val lvl_im = {Level: (i - 1) as byte} as IData;

	# Tank
	craft.make(<thermalexpansion:tank>.withTag(lvl_i), ["pretty",
		"□ a □",
		"g ♥ g",
		"□ a □"], {
		"♥": i!=0 ? <thermalexpansion:tank>.withTag(lvl_im).marked("marked") : <thermalfoundation:material:864>,
		"a": i!=0 ? oreDict["ingot" ~ materials[i - 1]] : <ore:ingotCopper>,
		"g": oreDict["gear" ~ mat],
		"□": <tconstruct:clear_glass>,
	}, i!=0 ? tieredUpgradeFnc : null);

	# [Flux Capacitor (Basic)] from [Copper Ingot][+3]
	craft.make(<thermalexpansion:capacitor>.definition.makeStack(i), ["pretty",
		"  ♥  ",
		"▬ - ▬",
		"♥ ▲ ♥"], {
		"▲": catalysts[i],
		"♥": <ore:ingotRedstoneAlloy>,
		"▬": oreDict["ingot" ~ mat],
		"-": i!=0
			? <thermalexpansion:capacitor>.definition.makeStack(i - 1).withTag({}, false).marked("marked")
			: <ore:ingotCopper>,
	}, i!=0 ? utils.upgradeFnc : null);

	if(i != 0) {
		# Simplify Satchels
		craft.make(
			<thermalexpansion:satchel>.definition.makeStack(i), ["aOa"],
			{O: <thermalexpansion:satchel>.definition.makeStack(i - 1).marked("marked"), a: oreDict["nugget" ~ mat]},
			utils.upgradeFnc
		);

		# Cache
		craft.remake(<thermalexpansion:cache>.withTag(lvl_i), ["pretty",
			", ▬ ,",
			"▬ ♥ ▬",
			", ▬ ,"], {
			"♥": ((i==1)
				? <thermalexpansion:cache>.withTag(lvl_im, false).only(function(item) {return isNull(item.tag) || isNull(item.tag.Level) || item.tag.Level.asByte() < 1;})
				: <thermalexpansion:cache>.withTag(lvl_im)).marked("marked"),
			"▬": oreDict["ingot" ~ materials[i - 1]],
			",": oreDict["nugget" ~ mat],
		}, tieredUpgradeFnc);

		# Strongbox
		craft.remake(<thermalexpansion:strongbox>.withTag(lvl_i), ["pretty",
			"  ▬  ",
			"i ♥ i",
			"  ▬  "], {
			"♥": <thermalexpansion:strongbox>.withTag(lvl_im).marked("marked"),
			"▬": oreDict["nugget" ~ mat],
			"i": oreDict["nugget" ~ materials[i - 1]],
		}, tieredUpgradeFnc);
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
	}, (i==0)?null:tieredUpgradeFnc);
}

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
	"♥": <rustic:cabinet>,
	"▬": <ore:nuggetTin>,
	"i": <ore:nuggetCopper>,
});

mods.jei.JEI.hide(<thermalexpansion:cell:*>);
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

# Make Dusts alternatives
val dustAlts = {
	<thermalfoundation:material:1024> : [<ore:dustBlaze> , <ore:dustSulfur>    , <forestry:pollen>]  ,
	<thermalfoundation:material:1025> : [<ore:dustBlizz> , <minecraft:snowball>, <forestry:pollen:1>],
	<thermalfoundation:material:1026> : [<ore:dustBlitz> , <ore:dustSaltpeter> , <forestry:pollen>]  ,
	<thermalfoundation:material:1027> : [<ore:dustBasalz>, <ore:dustObsidian>  , <forestry:pollen>]  ,
} as IIngredient[][IItemStack];
for out,list in dustAlts {
	recipes.remove(out);
	recipes.addShapeless(out.displayName~" x1", out,     [list[0], list[0],          <ore:dustRedstone>, list[1]]);
	recipes.addShapeless(out.displayName~" x4", out * 4, [list[0], list[0], list[2], <ore:dustRedstone>, list[1]]);
}

# Clear content of reserviors
for i in 0 to 5 {
	val reservior as IItemStack = <thermalexpansion:reservoir>.definition.makeStack(i) as IItemStack;
	utils.clearFluid(reservior);
}

# [Device Frame] from [Copper Gear][+2]
recipes.remove(<thermalexpansion:frame:64>);
scripts.mods.forestry.ThermionicFabricator.addCast(<thermalexpansion:frame:64>, Grid(["pretty",
  "▬   ▬",
  "  C  ",
  "▬   ▬"], {
  "C": <ore:gearCopper>, # Copper Gear
  "▬": <ore:ingotTin>,   # Tin Ingot
}).shaped(), <liquid:glass> * 1000, <forestry:wax_cast:*>);
scripts.mods.forestry.ThermionicFabricator.addCast(<thermalexpansion:frame:64>, Grid(["pretty",
  "▬ ▬ ▬",
  "▬ C ▬",
  "▬ ▬ ▬"], {
  "C": <ore:gearCopper>, # Copper Gear
  "▬": <ore:ingotTin>,   # Tin Ingot
}).shaped(), <liquid:glass> * 1000);

# [Augment: Auxiliary Reception Coil] from [Redstone Servo][+2]
craft.remake(<thermalexpansion:augment:128>, ["pretty",
  "  E  ",
  "T ♥ T",
  "  E  "], {
  "T": <thermalfoundation:material:640>, # Tool Casing
  "E": <ore:plateElectrum>,              # Electrum Plate
  "♥": <thermalfoundation:material:512>, # Redstone Servo
});

# [Augment: Auxiliary Transmission Coil] from [Redstone Transmission Coil][+2]
craft.remake(<thermalexpansion:augment:512>, ["pretty",
  "  ¤ ♥",
  "⌂ ♥ ¤",
  "♥ ⌂  "], {
  "⌂": <thermalfoundation:material:640>, # Tool Casing
  "¤": <ore:gearSilver>,                 # Silver Gear
  "♥": <thermalfoundation:material:514>, # Redstone Transmission Coil
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

# [Augment_ Flux Reconstruction] from [Redstone Conductance Coil][+3]
craft.remake(<thermalexpansion:augment:401>, ["pretty",
  "  ▼  ",
  "¤ ♥ ¤",
  "  ▬  "], {
  "¤": <ore:gearGelidEnderium>,          # Gelid Enderium Gear
  "♥": <thermalfoundation:material:515>, # Redstone Conductance Coil
  "▬": <ore:ingotCrystaltine>,           # Crystaltine Ingot
  "▼": <ore:clathrateRedstone>,          # Destabilized Clathrate
});

# [Augment_ Clastic Deposition] from [Redstone Conductance Coil][+4]
craft.remake(<thermalexpansion:augment:497>, ["pretty",
  "Q ¤ Q",
  "□ ♥ □",
  "Q ▲ Q"], {
  "Q": <immersiveengineering:stone_decoration:9>, # Quickdry Concrete
  "¤": <ore:gearNickel>,                          # Nickel Gear
  "□": <tconstruct:large_plate>.withTag({Material: "osgloglas"}), # Osgloglas Large Plate
  "♥": <thermalfoundation:material:515>,          # Redstone Conductance Coil
  "▲": <ore:dustAerotheum>,                       # Aerotheum Dust
});

# [Augment_ Boiler Conversion] from [Advanced Pressure Valve][+3]
craft.remake(<thermalexpansion:augment:576>, ["pretty",
  "T ¤ T",
  "◘ A ◘",
  "T ¤ T"], {
  "T": <ore:sheetTitaniumIridium>,              # Titanium Iridium Alloy Sheet
  "¤": <ore:gearEnderium>,                      # Enderium Gear
  "◘": <thermalexpansion:frame:147>,            # Signalum Cell Frame (Full)
  "A": <advgenerators:advanced_pressure_valve>, # Advanced Pressure Valve
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

# Mending Moss Alt
mods.thermalexpansion.Enchanter.addRecipe(
	<tconstruct:materials:19> * 2, <tconstruct:materials:18>, <tconstruct:materials:18>,
	12000, 3280 * 2, false
);

# [Pulverizer (Basic)] from [Machine Frame][+5]
recipes.removeShaped(<thermalexpansion:machine:1>);
craft.remake(<thermalexpansion:machine:1>, ["pretty",
  "s C s",
  "□ ◙ □",
  "¤ ♥ ¤"], {
  "□": <tconstruct:large_plate>.withTag({Material: "flint"}), # Flint Large Plate
  "s": <ore:gearEmerald>,
  "C": <actuallyadditions:block_grinder> | <actuallyadditions:block_grinder_double>, # Crusher
  "¤": <ore:gearElectrum>,                # Electrum Gear
  "♥": <thermalfoundation:material:513>,  # Redstone Reception Coil
  "◙": <thermalexpansion:frame>,          # Machine Frame
});

# [Phytogenic Insolator (Basic)] from [Machine Frame][+5]
recipes.removeShaped(<thermalexpansion:machine:4>);
craft.remake(<thermalexpansion:machine:4>, ["pretty",
  "B A B",
  "□ ◙ □",
  "¤ ♥ ¤"], {
  "□": <tconstruct:large_plate>.withTag({Material: "osgloglas"}), # Osgloglas Large Plate
  "A": <forestry:arboretum>,             # Arboretum (Managed)
  "B": <ore:itemBiomassRich>,            # Rich Biomass
  "¤": <ore:gearElectrum>,               # Electrum Gear
  "♥": <thermalfoundation:material:513>, # Redstone Reception Coil
  "◙": <thermalexpansion:frame>,         # Machine Frame
});

# [Induction Smelter (Basic)] from [Machine Frame][+5]
recipes.removeShaped(<thermalexpansion:machine:3>);
craft.remake(<thermalexpansion:machine:3>, ["pretty",
  "R I R",
  "□ ◙ □",
  "¤ ♥ ¤"], {
  "□": <tconstruct:large_plate>.withTag({Material: "heavy"}), # Heavy Large Plate
  "R": <thermalfoundation:material:832>, # Rosin
  "¤": <ore:gearElectrum>,               # Electrum Gear
  "♥": <thermalfoundation:material:513>, # Redstone Reception Coil
  "I": <ic2:te:54>,                      # Induction Furnace
  "◙": <thermalexpansion:frame>,         # Machine Frame
});

# [Fluid Transposer (Basic)] from [Machine Frame][+5]
recipes.removeShaped(<thermalexpansion:machine:8>);
craft.remake(<thermalexpansion:machine:8>, ["pretty",
  "B C B",
  "⌃ ◙ ⌃",
  "¤ ♥ ¤"], {
  "B": <actuallyadditions:item_water_bowl>, # Bowl of Water
  "⌃": <tconstruct:large_plate>.withTag({Material: "black_quartz"}), # Black Quartz Large Plate
  "C": <forestry:carpenter>,             # Carpenter
  "¤": <ore:gearInvar>,                  # Invar Gear
  "♥": <thermalfoundation:material:513>, # Redstone Reception Coil
  "◙": <thermalexpansion:frame>,         # Machine Frame
});

# [Magma Crucible (Basic)] from [Machine Frame][+5]
recipes.removeShaped(<thermalexpansion:machine:6>);
craft.remake(<thermalexpansion:machine:6>, ["pretty",
  "▬ S ▬",
  "□ ◙ □",
  "¤ ♥ ¤"], {
  "□": <tconstruct:large_plate>.withTag({Material: "constantan"}), # Constantan Large Plate
  "S": <tconstruct:smeltery_controller>, # Smeltery Controller
  "¤": <ore:gearInvar>,                  # Invar Gear
  "♥": <thermalfoundation:material:513>, # Redstone Reception Coil
  "◙": <thermalexpansion:frame>,         # Machine Frame
  "▬": <ore:ingotBrickNetherGlazed>,     # Nethercotta
});

# Make Signalum ask for 3 Silver and 1 Copper
# (was 3 copper 1 silver)
mods.tconstruct.Alloy.removeRecipe(<liquid:signalum>);
mods.tconstruct.Alloy.addRecipe(<liquid:signalum> * 144, [<liquid:silver> * 108, <liquid:copper> * 36,  <liquid:redstone> * 250]);
craft.reshapeless(<thermalfoundation:material:101> * 4, "▲▲▲♠♥", {
  "▲": <ore:dustSilver>, # Pulverized Silver
  "♠": <ore:dustCopper>, # Pulverized Copper
  "♥": Bucket("redstone"), # Destabilized Redstone Bucket
});
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<nuclearcraft:alloy:7> * 4);
scripts.process.alloy([<ore:ingotSilver> * 3, <ore:ingotCopper>], <nuclearcraft:alloy:7> * 4, "only: alloyFurnace induction");

# Stone Gear recipe
mods.thermalexpansion.Compactor.addGearRecipe(<thermalfoundation:material:23>, <minecraft:cobblestone> * 4, 16000);

# Way to craft Oil Ore (alternative way to get Tar)
mods.tconstruct.Casting.addBasinRecipe(<thermalfoundation:ore_fluid>, <minecraft:sand>, <liquid:oil>, 2000, true);
mods.tconstruct.Casting.addBasinRecipe(<thermalfoundation:ore_fluid:5>, <minecraft:sand:1>, <liquid:oil>, 2000, true);
mods.tconstruct.Casting.addBasinRecipe(<thermalfoundation:ore_fluid:1>, <minecraft:gravel>, <liquid:oil>, 2000, true);

# Early game alt
/* [Blizz Rod]  */ mods.tconstruct.Casting.addTableRecipe(<thermalfoundation:material:2048>, <mechanics:empty_rod:*>, <liquid:ice>, 2000, true);
/* [Blitz Rod]  */ mods.tconstruct.Casting.addTableRecipe(<thermalfoundation:material:2050>, <mechanics:empty_rod:*>, <liquid:ic2steam>, 2000, true);
/* [Blitz Rod]  */ mods.tconstruct.Casting.addTableRecipe(<thermalfoundation:material:2050>, <mechanics:empty_rod:*>, <liquid:steam>, 2000, true);
/* [Basalz Rod] */ mods.tconstruct.Casting.addTableRecipe(<thermalfoundation:material:2052>, <mechanics:empty_rod:*>, <liquid:sand>, 2000, true);

# Remake Hardened Glass recipes
val glassFromDust = {
	<thermalfoundation:glass>         : <thermalfoundation:material:64>,
	<thermalfoundation:glass:1>       : <thermalfoundation:material:65>,
	<thermalfoundation:glass:2>       : <thermalfoundation:material:66>,
	<thermalfoundation:glass:3>       : <thermalfoundation:material:67>,
	<thermalfoundation:glass:4>       : <thermalfoundation:material:68>,
	<thermalfoundation:glass:5>       : <thermalfoundation:material:69>,
	<thermalfoundation:glass:6>       : <thermalfoundation:material:70>,
	<thermalfoundation:glass:7>       : <thermalfoundation:material:71>,
	<thermalfoundation:glass:8>       : <thermalfoundation:material:72>,
	<thermalfoundation:glass_alloy>   : <thermalfoundation:material:96>,
	<thermalfoundation:glass_alloy:1> : <thermalfoundation:material:97>,
	<thermalfoundation:glass_alloy:2> : <thermalfoundation:material:98>,
	<thermalfoundation:glass_alloy:3> : <thermalfoundation:material:99>,
	<thermalfoundation:glass_alloy:4> : <thermalfoundation:material:100>,
	<thermalfoundation:glass_alloy:5> : <thermalfoundation:material:101>,
	<thermalfoundation:glass_alloy:6> : <thermalfoundation:material:102>,
	<thermalfoundation:glass_alloy:7> : <thermalfoundation:material:103>,
} as IItemStack[IItemStack];

for glass, dust in glassFromDust {
	if(glass.damage != 8) mods.thermalexpansion.InductionSmelter.removeRecipe(<ore:blockGlassHardened>.firstItem, dust);
	mods.thermalexpansion.InductionSmelter.addRecipe(
		glass, // Output
		<enderio:block_fused_quartz>,
		dust,
		6000,
		<thermalfoundation:material:865>, // Rich Slag
		15);
}

// Steel from IE fix
mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:material:160>,<immersiveengineering:material:6>,<minecraft:iron_ingot>, 6000);

# x100 energy consumption
mods.thermalexpansion.Infuser.removeRecipe(<thermalfoundation:fertilizer:1>);
mods.thermalexpansion.Infuser.addRecipe(<thermalfoundation:fertilizer:2>, <thermalfoundation:fertilizer:1>, 400000);

# Way cheaper viaducts
# [Viaduct (Untreated)]*64 from [Clear Glass][+1]
craft.remake(<thermaldynamics:duct_64:3> * 64, ["pretty",
  "□ ■ □",
  "■   ■",
  "□ ■ □"], {
  "□": <ore:plateBronze>,        # Bronze Plate
  "■": <tconstruct:clear_glass>, # Clear Glass
});

# Way cheaper viaducts
# [Long Range Viaduct]*64 from [Clear Glass][+1]
craft.remake(<thermaldynamics:duct_64:1> * 64, ["pretty",
  "□ ■ □",
  "■   ■",
  "□ ■ □"], {
  "□": <thermalfoundation:material:323>, # Lead Plate
  "■": <tconstruct:clear_glass>,         # Clear Glass
});

# Remove AE2 Seeds from Phytogenic Insolator (recipe is bugged - seeds can't be inserted)
mods.thermalexpansion.Insolator.removeRecipe(<appliedenergistics2:crystal_seed:0>, <minecraft:glowstone_dust>);
mods.thermalexpansion.Insolator.removeRecipe(<appliedenergistics2:crystal_seed:600>, <minecraft:glowstone_dust>);
mods.thermalexpansion.Insolator.removeRecipe(<appliedenergistics2:crystal_seed:1200>, <minecraft:glowstone_dust>);

// Replace recipe for removed rice
mods.thermalexpansion.Sawmill.removeRecipe(<harvestcraft:riceitem>);
mods.thermalexpansion.Sawmill.addRecipe(
	<thermalfoundation:material:816>,
	<actuallyadditions:item_food:16>,
	1000,
	<actuallyadditions:item_rice_seed>, 50
);
