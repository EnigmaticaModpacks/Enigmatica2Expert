import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded enderio



# Cheaper decorations
var casing = <teslacorelib:machine_case>|<actuallyadditions:block_misc:9>|<mekanism:basicblock:8>|<nuclearcraft:part:10>;
var constructionAlloyOrIron = <ore:ingotConstructionAlloy> | <ore:ingotIron>;
recipes.remove(<enderio:item_material:2>);
recipes.addShaped("Cheaper Chassis Parts", 
<enderio:item_material:2> * 16, [
[constructionAlloyOrIron, constructionAlloyOrIron, constructionAlloyOrIron], 
[constructionAlloyOrIron, casing, constructionAlloyOrIron], 
[constructionAlloyOrIron, constructionAlloyOrIron, constructionAlloyOrIron]]);

# Electrical Steel
mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:96>, <nuclearcraft:gem:6>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:160>, <nuclearcraft:gem:6>);

for silicon in <ore:itemSilicon>.items {
	for steel in <ore:ingotSteel>.items {
		mods.thermalexpansion.InductionSmelter.addRecipe(<enderio:item_alloy_ingot>, silicon, steel, 10000);
	}
	for steel in <ore:dustSteel>.items {
		mods.thermalexpansion.InductionSmelter.addRecipe(<enderio:item_alloy_ingot>, silicon, steel, 10000);
	}
}

# This is basically quantity filter with auto input/output
# [Impulse Hopper] from [Basic Machine Casing][+4]
craft.remake(<enderio:block_impulse_hopper>, ["pretty",
  "▬ ◘ ▬",
  "I □ I",
  "▬ ♥ ▬"], {
  "□": <ic2:resource:12>,      # Basic Machine Casing
  "♥": <ore:blockRedstone>,    # Block of Redstone
  "◘": <ore:blockHopper>,      # Hopper
  "I": <ore:gearIronInfinity>, # Infinity Bimetal Gear
  "▬": <ore:ingotDarkSteel>    # Dark Steel Ingot
});

# Advanced Item Filter
	recipes.remove(<enderio:item_advanced_item_filter>);
	recipes.addShapedMirrored("Advanced Item Filter", 
	<enderio:item_advanced_item_filter>, 
	[[<ore:blockRedstone>, <ore:paper>, <ore:blockRedstone>],
	[<ore:paper>, <enderio:block_enderman_skull>, <ore:paper>], 
	[<ore:blockRedstone>, <ore:paper>, <ore:blockRedstone>]]);

# Painting Machine
	recipes.remove(<enderio:block_painter>);
	recipes.addShaped("Ender IO Painting Machine", <enderio:block_painter>, 
	[[<ore:gemQuartz>, <ore:gemDiamond>, <ore:gemQuartz>], 
	[<ore:gearIronInfinity>, <nuclearcraft:part:10>, <ore:gearIronInfinity>], 
	[<ore:ingotElectricalSteel>, <ore:ingotElectricalSteel>, <ore:ingotElectricalSteel>]]);

# Fused Quartz (before Alloy Smelter)
	mods.nuclearcraft.alloy_furnace.addRecipe(<minecraft:quartz> * 4, <minecraft:quartz_block>, <enderio:block_fused_quartz> * 2);

# Clear Glass (before Alloy Smelter)
	recipes.addShaped("Quite Clear Glass", 
	<enderio:block_fused_glass> * 8, 
	[[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>],
	[<ore:blockGlass>, null, <ore:blockGlass>], 
	[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>]]);

# Power Buffer
	recipes.remove(<enderio:block_buffer:1>);
	recipes.addShapedMirrored("Power Buffer", 
	<enderio:block_buffer:1>, 
	[[<ore:ingotIron>, <ore:ingotElectricalSteel>, <ore:ingotIron>],
	[<ore:ingotElectricalSteel>, <enderio:item_basic_capacitor>, <ore:ingotElectricalSteel>], 
	[<ore:ingotIron>, <ore:ingotElectricalSteel>, <ore:ingotIron>]]);

# Solar Panels
	# Tier 2
	recipes.remove(<enderio:block_solar_panel:1>);
	recipes.addShapedMirrored("EnderIO Solar Panel1", 
	<enderio:block_solar_panel:1>, 
	[[<ore:ingotEnergeticAlloy>, <ore:ingotEnergeticAlloy>, <ore:ingotEnergeticAlloy>],
	[<enderio:block_solar_panel>, <enderio:block_solar_panel>, <enderio:block_solar_panel>], 
	[<enderio:item_basic_capacitor>, <ore:fusedQuartz>, <enderio:item_basic_capacitor>]]);
	# Tier 3
	recipes.remove(<enderio:block_solar_panel:2>);
	recipes.addShaped("EnderIO Solar Panel2", 
	<enderio:block_solar_panel:2>, 
	[[<ore:ingotPulsatingIron>, <ore:ingotPulsatingIron>, <ore:ingotPulsatingIron>],
	[<enderio:block_solar_panel:1>, <enderio:block_solar_panel:1>, <enderio:block_solar_panel:1>],
	[<enderio:item_basic_capacitor:1>, <ore:enlightenedFusedQuartz>, <enderio:item_basic_capacitor:1>]]);
	# Tier 4
	recipes.remove(<enderio:block_solar_panel:3>);
	recipes.addShaped("EnderIO Solar Panel3", 
	<enderio:block_solar_panel:3>, 
	[[<ore:ingotVibrantAlloy>, <ore:ingotVibrantAlloy>, <ore:ingotVibrantAlloy>],
	[<enderio:block_solar_panel:2>, <enderio:block_solar_panel:2>, <enderio:block_solar_panel:2>],
	[<enderio:item_basic_capacitor:2>, <ore:darkFusedQuartz>, <enderio:item_basic_capacitor:2>]]);
	# Tier 5
	recipes.remove(<enderio:block_solar_panel:4>);
	recipes.addShaped("EnderIO Solar Panel4", 
	<enderio:block_solar_panel:4>, 
	[[<ore:ingotVibrantAlloy>, <ore:ingotVibrantAlloy>, <ore:ingotVibrantAlloy>],
	[<enderio:block_solar_panel:3>, <thermalexpansion:frame:128>, <enderio:block_solar_panel:3>],
	[<enderio:item_capacitor_crystalline>, <ore:darkFusedQuartz>, <enderio:item_capacitor_crystalline>]]);
	# Tier 6
	recipes.remove(<enderio:block_solar_panel:5>);
	recipes.addShaped("EnderIO Solar Panel5", 
	<enderio:block_solar_panel:5>, 
	[[<ore:ingotCrystaltine>, <ore:ingotCrystaltine>, <ore:ingotCrystaltine>],
	[<enderio:block_solar_panel:4>, <thermalexpansion:frame:129>, <enderio:block_solar_panel:4>],
	[<enderio:item_capacitor_melodic>, <ore:darkFusedQuartz>, <enderio:item_capacitor_melodic>]]);
	# Tier 7
	recipes.remove(<enderio:block_solar_panel:6>);
	recipes.addShaped("EnderIO Solar Panel6", 
	<enderio:block_solar_panel:6>, 
	[[<ore:ingotMelodicAlloy>, <ore:ingotMelodicAlloy>, <ore:ingotMelodicAlloy>],
	[<enderio:block_solar_panel:5>, <thermalexpansion:frame:130>, <enderio:block_solar_panel:5>],
	[<ore:ingotStellarAlloy>, <ore:darkFusedQuartz>, <ore:ingotStellarAlloy>]]);

# Dimensional Transceiver
	recipes.remove(<enderio:block_transceiver>);
	recipes.addShapedMirrored("Ender IO Dimensional Transceiver", 
	<enderio:block_transceiver>, 
	[[<ore:blockElectricalSteel>, <ore:skullEnderResonator>, <ore:blockElectricalSteel>],
	[<enderio:item_basic_capacitor:2>, <mekanism:machineblock3>, <enderio:item_basic_capacitor:2>], 
	[<ore:blockElectricalSteel>, <ore:itemEnderCrystal>, <ore:blockElectricalSteel>]]);

# Enchanter
	recipes.remove(<enderio:block_enchanter>);
	recipes.addShapedMirrored("EnderIO Enchanter", 
	<enderio:block_enchanter>, 
	[[<ore:blockMagicalWood>, <ore:blockMagicalWood>, <ore:blockMagicalWood>],
	[<rftools:infused_diamond>, <thermalexpansion:machine:13>.withTag({}), <rftools:infused_diamond>], 
	[<ore:ingotDarkSteel>, <ore:ingotDarkSteel>, <ore:ingotDarkSteel>]]);

# Dialing Device
	recipes.remove(<enderio:block_dialing_device>);
	recipes.addShapedMirrored("EnderIO Dialing Device", 
	<enderio:block_dialing_device>, 
	[[null, <rftools:dialing_device>, null],
	[<ore:ingotDarkSteel>, <ore:skullEnderResonator>, <ore:ingotDarkSteel>], 
	[<ore:ingotDarkSteel>, <enderio:item_basic_capacitor:2>, <ore:ingotDarkSteel>]]);

# Energized Bimetal gear
	recipes.remove(<enderio:item_material:12>);
	mods.immersiveengineering.MetalPress.addRecipe(<enderio:item_material:12>, <enderio:item_alloy_ingot:1>, <immersiveengineering:mold:1>, 16000, 4);
	mods.thermalexpansion.Compactor.addGearRecipe(<enderio:item_material:12>, <enderio:item_alloy_ingot:1> * 4, 16000);

# Vibrant Bimetal gear
	recipes.remove(<enderio:item_material:13>);
	mods.immersiveengineering.MetalPress.addRecipe(<enderio:item_material:13>, <enderio:item_alloy_ingot:2>, <immersiveengineering:mold:1>, 16000, 4);
	mods.thermalexpansion.Compactor.addGearRecipe(<enderio:item_material:13>, <enderio:item_alloy_ingot:2> * 4, 16000);

# Dark Bimetel gear
	recipes.remove(<enderio:item_material:73>);
	mods.immersiveengineering.MetalPress.addRecipe(<enderio:item_material:73>, <enderio:item_alloy_ingot:6>, <immersiveengineering:mold:1>, 16000, 4);
	mods.thermalexpansion.Compactor.addGearRecipe(<enderio:item_material:73>, <enderio:item_alloy_ingot:6> * 4, 16000);
	
# Simple Machine Chassis
	recipes.remove(<enderio:item_material>);
	recipes.addShapedMirrored("Simple Machine Chassis", 
	<enderio:item_material>, 
	[[<ore:plateTitaniumAluminide>, <ore:gearIronInfinity>, <ore:plateTitaniumAluminide>],
	[<enderio:block_dark_iron_bars>, <thermalexpansion:frame:129>, <enderio:block_dark_iron_bars>], 
	[<ore:plateTitaniumAluminide>, <ore:gearIronInfinity>, <ore:plateTitaniumAluminide>]]);

# Machine Chassis
	recipes.remove(<enderio:item_material:1>);
	recipes.addShapedMirrored("Machine Chassis", 
	<enderio:item_material:1>, 
	[[<enderio:block_reinforced_obsidian>, <ore:dyeMachine>, <enderio:block_reinforced_obsidian>],
	[<ore:dyeMachine>, <enderio:item_material>, <ore:dyeMachine>], 
	[<enderio:block_reinforced_obsidian>, <ore:dyeMachine>, <enderio:block_reinforced_obsidian>]]);

# Basic Capacitor
	recipes.remove(<enderio:item_basic_capacitor>);
	recipes.addShapedMirrored("Basic Capacitor", 
	<enderio:item_basic_capacitor> * 2, 
	[[null, <thermalfoundation:material:514>, <ore:dustBedrock>],
	[<thermalfoundation:material:514>, <immersiveengineering:metal_device0:2>, <thermalfoundation:material:514>], 
	[<ore:dustBedrock>, <thermalfoundation:material:514>, null]]);

# Double-Layer Capacitor
	recipes.remove(<enderio:item_basic_capacitor:1>);
	recipes.addShapedMirrored("Double-Layer Capacitor", 
	<enderio:item_basic_capacitor:1>, 
	[[null, <ore:ingotEnergeticAlloy>, null],
	[<enderio:item_basic_capacitor>, <ore:dustCoke>, <enderio:item_basic_capacitor>], 
	[null, <ore:ingotEnergeticAlloy>, null]]);

# Octadic Capacitor
	recipes.remove(<enderio:item_basic_capacitor:2>);
	recipes.addShapedMirrored("Octadic Capacitor", 
	<enderio:item_basic_capacitor:2>, 
	[[<ore:ingotFerroboron>, <ore:ingotVibrantAlloy>, <ore:ingotFerroboron>],
	[<enderio:item_basic_capacitor:1>, <draconicevolution:draconium_block:1>, <enderio:item_basic_capacitor:1>], 
	[<ore:ingotFerroboron>, <ore:ingotVibrantAlloy>, <ore:ingotFerroboron>]]);

# Stirling Generator
	recipes.remove(<enderio:block_stirling_generator>);
	recipes.addShapedMirrored("Stirling Generator", 
	<enderio:block_stirling_generator>, 
	[[<extrautils2:decorativesolid:2>, <minecraft:furnace>, <extrautils2:decorativesolid:2>],
	[<minecraft:furnace>, <ic2:resource:13>, <minecraft:furnace>], 
	[<ore:gearEnergized>, <ore:craftingPiston>, <ore:gearEnergized>]]);

# Combustion Generator
	recipes.remove(<enderio:block_combustion_generator>);
	recipes.addShapedMirrored("Combustion Generator", 
	<enderio:block_combustion_generator>, 
	[[<ore:ingotElectricalSteel>, <minecraft:furnace>, <enderio:item_alloy_ingot>],
	[<enderio:block_tank>, <ic2:resource:13>, <enderio:block_tank>], 
	[<ore:gearEnergized>, <ore:craftingPiston>, <ore:gearEnergized>]]);

# Farming Station
	recipes.remove(<enderio:block_farm_station>);
	recipes.addShapedMirrored("Farming Station1", 
	<enderio:block_farm_station>, 
	[[<ore:ingotElectricalSteel>, <twilightforest:ironwood_hoe>.anyDamage(), <ore:ingotElectricalSteel>],
	[<ore:ingotElectricalSteel>, <enderio:item_material:1>, <ore:ingotElectricalSteel>], 
	[<ore:gearVibrant>, <twilightforest:ironwood_axe>.anyDamage(), <ore:gearVibrant>]]);
	
	recipes.addShapedMirrored("Farming Station2", 
	<enderio:block_farm_station>, 
	[[<ore:ingotElectricalSteel>, <twilightforest:steeleaf_hoe>.anyDamage(), <ore:ingotElectricalSteel>],
	[<ore:ingotElectricalSteel>, <enderio:item_material:1>, <ore:ingotElectricalSteel>], 
	[<ore:gearVibrant>, <twilightforest:steeleaf_axe>.anyDamage(), <ore:gearVibrant>]]);

# The Vat
	recipes.remove(<enderio:block_vat>);
	recipes.addShapedMirrored("The Vat",
	<enderio:block_vat>,
	[[<ore:ingotElectricalSteel>, <minecraft:cauldron>, <ore:ingotElectricalSteel>],
	[<enderio:block_tank>, <thermalexpansion:machine:7>, <enderio:block_tank>],
	 [<ore:ingotElectricalSteel>, <minecraft:cauldron>, <ore:ingotElectricalSteel>]]);

# Crafter simplify
	recipes.remove(<enderio:block_simple_crafter>);
	recipes.addShaped(<enderio:block_simple_crafter>, [
		[<ore:itemSilicon>, <ore:itemSilicon>, <ore:itemSilicon>], 
		[<ore:ingotConstructionAlloy> | <ore:ingotIron>, <ic2:te:88>, <ore:ingotConstructionAlloy> | <ore:ingotIron>], 
		[<ore:gearStone>, <ore:workbench>, <ore:gearStone>]]);

	recipes.remove(<enderio:block_crafter>);
	recipes.addShaped(<enderio:block_crafter>, [
		[<ore:itemSilicon>, <ore:itemSilicon>, <ore:itemSilicon>],
		[<ore:ingotConstructionAlloy> | <ore:ingotIron>, <ic2:te:89>, <ore:ingotConstructionAlloy> | <ore:ingotIron>], 
		[<ore:gearIronInfinity>, <ore:workbench>, <ore:gearIronInfinity>]]);

# Power Monitor simplify
	recipes.remove(<enderio:block_power_monitor>);
	recipes.addShaped(<enderio:block_power_monitor>, [
		[<ore:ingotElectricalSteel>, <enderio:item_conduit_probe>, <ore:ingotElectricalSteel>], 
		[<ore:ingotElectricalSteel>, <nuclearcraft:part:10> | <teslacorelib:machine_case> | <actuallyadditions:block_misc:9> | <mekanism:basicblock:8>, <ore:ingotElectricalSteel>], 
		[<ore:ingotElectricalSteel>, <enderio:item_power_conduit>, <ore:ingotElectricalSteel>]]);

# Removals
	rh(<enderio:block_simple_stirling_generator>);
	rh(<enderio:block_enhanced_alloy_smelter>);
	rh(<enderio:block_enhanced_combustion_generator>);
	rh(<enderio:block_enhanced_sag_mill>);
	rh(<enderio:block_enhanced_vat>);
	rh(<enderio:block_enhanced_wired_charger>);
	rh(<enderio:item_material:30>);
	rh(<enderio:item_material:31>);
	rh(<enderio:block_wireless_charger_extension>);
	
# Lava Heat Exchanger
var machineCaseVariant = <nuclearcraft:part:10> | <teslacorelib:machine_case> | <actuallyadditions:block_misc:9> | <mekanism:basicblock:8>;
recipes.remove(<enderio:block_lava_generator>);
recipes.addShaped(<enderio:block_lava_generator>, [
	[<ore:ingotBrickNetherGlazed>, <ore:ingotBrickNetherGlazed>, <ore:ingotBrickNetherGlazed>], 
	[<ore:ingotBrickNetherGlazed>, machineCaseVariant, <ore:ingotBrickNetherGlazed>], 
	[<ore:ingotBrickNetherGlazed>, <enderio:block_tank>, <ore:ingotBrickNetherGlazed>]]);

# Nethercotta
mods.immersiveengineering.ArcFurnace.addRecipe(<enderio:item_material:72>, <ore:ingotBrickNether>,
	<immersiveengineering:material:7>, 20*4, 2560, [<ore:cropNetherWart>*4, <ore:clay>*6], "Alloying");

# Simplifi Niard. Still need capacitor to function
recipes.remove(<enderio:block_niard>);
recipes.addShaped(<enderio:block_niard>, [
	[<immersiveengineering:metal_device1:6>, <enderio:block_tank>, <immersiveengineering:metal_device1:6>],
	[<ore:craftingPiston>, <ore:chassis>, <ore:craftingPiston>],
	[<ore:ingotIron>, <ore:barsIron>, <ore:ingotIron>]]);

# Compat of nano glowstone
scripts.process.crush(<enderio:item_material:76>, <enderio:block_holy_fog>, "except: sagMill", 
	[<enderio:block_holy_fog>, <minecraft:clay_ball>, <minecraft:glowstone_dust>], [0.6f, 0.1f, 0.1f]);

# Compunent for nano-glowstone compat
scripts.process.alloy([<minecraft:glowstone_dust>, <minecraft:clay_ball>], <enderio:item_material:76> * 2, "except: alloySmelter");

# Dark Steel Upgrade Recycling
var upgradeArray = [
	"enderio:anvil",
	"enderio:anvil1",
	"enderio:anvil2",
	"enderio:carpet",
	"enderio:depth",
	"enderio:direct",
	"enderio:elytra",
	"enderio:energyupgrade",
	"enderio:energyupgrade1",
	"enderio:energyupgrade2",
	"enderio:energyupgrade3",
	"enderio:energyupgrade4",
	"enderio:glide",
	"enderio:hoe",
	"enderio:inv",
	"enderio:inv1",
	"enderio:inv2",
	"enderio:jumpboost1",
	"enderio:jumpboost2",
	"enderio:jumpboost3",
	"enderio:nightvision",
	"enderio:padding",
	"enderiomachines:solar",
	"enderiomachines:solar1",
	"enderiomachines:solar2",
	"enderiomachines:solar3",
	"enderio:sounddetector",
	"enderio:speedboost1",
	"enderio:speedboost2",
	"enderio:speedboost3",
	"enderio:spoon",
	"enderio:step_assist",
	"enderio:swim",
	"enderio:tnt",
	"enderio:tnt1",
	"enderio:tnt2",
	"enderio:tnt3",
	"enderio:tntn4",
	"enderio:travel"] as string[];
var allUpgrades = <*>.only(function (item) { return false; }); // An ingredient that never matches, used as default to mean "nothing"
for upgrade in upgradeArray {
  allUpgrades = allUpgrades | <enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu" : (upgrade)}) | <enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu" : (upgrade),"enderio:enabled": 1 as byte});
}
	mods.nuclearcraft.decay_hastener.addRecipe([allUpgrades, <enderio:item_dark_steel_upgrade>]);

# Dark Steel Upgrade Expensive, Thermal
	mods.thermalexpansion.InductionSmelter.addRecipe(<enderio:item_dark_steel_upgrade>, <enderio:block_alloy:6>, <minecraft:clay>, 25000);

# Remove [Ender Pearl Powder] grinding recipes
mods.appliedenergistics2.Grinder.removeRecipe(<minecraft:ender_pearl>);
mods.appliedenergistics2.Grinder.removeRecipe(<thermalfoundation:material:895>);
scripts.process.crush(<ore:enderpearl>, <appliedenergistics2:material:46>, "Except: Pulverizer PulseCentrifuge", null, null);

recipes.addShapedMirrored("Simple Furnace Upgrade",<enderio:block_alloy_smelter>,[[null,<enderio:block_simple_furnace>,null],[null,<enderio:item_material:1>,null],[null,<enderio:item_material:73>,null]]);
recipes.addShapedMirrored("Simple SAG Upgrade",<enderio:block_sag_mill>,[[null,<enderio:block_simple_sag_mill>,null],[null,<enderio:item_material:1>,null],[null,<enderio:item_material:73>,null]]);
recipes.addShapedMirrored("Simple Alloy Upgrade",<enderio:block_alloy_smelter>,[[null,<enderio:block_simple_alloy_smelter>,null],[null,<enderio:item_material:1>,null],[null,<enderio:item_material:73>,null]]);
recipes.addShapedMirrored("Simple Crafter Upgrade",<enderio:block_crafter>,[[null,null,null],[<enderio:item_material:11>,<enderio:block_simple_crafter>,<enderio:item_material:11>],[null,null,null]]);