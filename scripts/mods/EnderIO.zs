import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput as ncAlloyRm;
import scripts.process.solution;
import scripts.craft.grid.Grid;

#modloaded enderio

# Cheaper decorations
var casing = <teslacorelib:machine_case>|<actuallyadditions:block_misc:9>|<mekanism:basicblock:8>|<nuclearcraft:part:10>;
recipes.remove(<enderio:item_material:2>);
recipes.addShaped("Cheaper Chassis Parts", 
<enderio:item_material:2> * 16, [
[<ore:ingotFakeIron>, <ore:ingotFakeIron>, <ore:ingotFakeIron>], 
[<ore:ingotFakeIron>, casing, <ore:ingotFakeIron>], 
[<ore:ingotFakeIron>, <ore:ingotFakeIron>, <ore:ingotFakeIron>]]);


# This is basically quantity filter with auto input/output
# [Impulse_Hopper] from [Basic_Machine_Casing][+4]
craft.remake(<enderio:block_impulse_hopper>, ["pretty",
  "▬ ◘ ▬",
  "I □ I",
  "▬ ♥ ▬"], {
  "□": <ore:machineBlock>,     # Basic Machine Casing
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
	[[<ore:gemQuartz>, gemDiamondRat, <ore:gemQuartz>], 
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
	[[<ore:ingotFakeIron>, <ore:ingotElectricalSteel>, <ore:ingotFakeIron>],
	[<ore:ingotElectricalSteel>, <enderio:item_basic_capacitor>, <ore:ingotElectricalSteel>], 
	[<ore:ingotFakeIron>, <ore:ingotElectricalSteel>, <ore:ingotFakeIron>]]);

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
	scripts.wrap.immersiveengineering.MetalPress.addRecipe(<enderio:item_material:12>, <enderio:item_alloy_ingot:1>, <immersiveengineering:mold:1>, 16000, 4);
	scripts.wrap.thermalexpansion.Compactor.addGearRecipe(<enderio:item_material:12>, <enderio:item_alloy_ingot:1> * 4, 16000);

# Vibrant Bimetal gear
	recipes.remove(<enderio:item_material:13>);
	scripts.wrap.immersiveengineering.MetalPress.addRecipe(<enderio:item_material:13>, <enderio:item_alloy_ingot:2>, <immersiveengineering:mold:1>, 16000, 4);
	scripts.wrap.thermalexpansion.Compactor.addGearRecipe(<enderio:item_material:13>, <enderio:item_alloy_ingot:2> * 4, 16000);

# Dark Bimetel gear
	recipes.remove(<enderio:item_material:73>);
	scripts.wrap.immersiveengineering.MetalPress.addRecipe(<enderio:item_material:73>, <enderio:item_alloy_ingot:6>, <immersiveengineering:mold:1>, 16000, 4);
	scripts.wrap.thermalexpansion.Compactor.addGearRecipe(<enderio:item_material:73>, <enderio:item_alloy_ingot:6> * 4, 16000);
	
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

# [Basic Capacitor] from [Redstone Conductance Coil][+3]
craft.remake(<enderio:item_basic_capacitor>, ["pretty",
  "  H  ",
  "I ♥ I",
  "  ■  "], {
  "■": <immersivecables:coil_block:1>,         # Dense Fluix Coil Block
  "♥": <thermalfoundation:material:515>,       # Redstone Conductance Coil
  "H": <immersiveengineering:metal_device0:2>, # HV Capacitor
  "I": <ore:itemInfinityGoop>,                 # Infinity Reagent
});

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
		[<ore:ingotFakeIron>, <ic2:te:88>, <ore:ingotFakeIron>], 
		[<ore:gearStone>, <ore:workbench>, <ore:gearStone>]]);

	recipes.remove(<enderio:block_crafter>);
	recipes.addShaped(<enderio:block_crafter>, [
		[<ore:itemSilicon>, <ore:itemSilicon>, <ore:itemSilicon>],
		[<ore:ingotFakeIron>, <ic2:te:89>, <ore:ingotFakeIron>], 
		[<ore:gearIronInfinity>, <ore:workbench>, <ore:gearIronInfinity>]]);

# Power Monitor simplify
	recipes.remove(<enderio:block_power_monitor>);
	recipes.addShaped(<enderio:block_power_monitor>, [
		[<ore:ingotElectricalSteel>, <enderio:item_conduit_probe>, <ore:ingotElectricalSteel>], 
		[<ore:ingotElectricalSteel>, <nuclearcraft:part:10> | <teslacorelib:machine_case> | <actuallyadditions:block_misc:9> | <mekanism:basicblock:8>, <ore:ingotElectricalSteel>], 
		[<ore:ingotElectricalSteel>, <enderio:item_power_conduit>, <ore:ingotElectricalSteel>]]);

# Removals
	utils.rh(<enderio:item_material:30>);
	utils.rh(<enderio:item_material:31>);

# Dark Steel Upgrade Recycling
	mods.nuclearcraft.decay_hastener.addRecipe([<enderio:item_dark_steel_upgrade:1>.anyDamage(), <enderio:item_dark_steel_upgrade>, 2.0, 2.0]);

# Dark Steel Upgrade Expensive, Thermal
	scripts.wrap.thermalexpansion.InductionSmelter.addRecipe(<enderio:item_dark_steel_upgrade>, <enderio:block_alloy:6>, <minecraft:clay>, 25000);


	
# Lava Heat Exchanger
var machineCaseVariant = <nuclearcraft:part:10> | <teslacorelib:machine_case> | <actuallyadditions:block_misc:9> | <mekanism:basicblock:8>;
recipes.remove(<enderio:block_lava_generator>);
recipes.addShaped(<enderio:block_lava_generator>, [
	[<ore:ingotBrickNetherGlazed>, <ore:ingotBrickNetherGlazed>, <ore:ingotBrickNetherGlazed>], 
	[<ore:ingotBrickNetherGlazed>, machineCaseVariant, <ore:ingotBrickNetherGlazed>], 
	[<ore:ingotBrickNetherGlazed>, <enderio:block_tank>, <ore:ingotBrickNetherGlazed>]]);

# Nethercotta
scripts.wrap.immersiveengineering.ArcFurnace.addRecipe(<enderio:item_material:72>, <ore:ingotBrickNether>,
	<immersiveengineering:material:7>, 20*4, 2560, [<ore:cropNetherWart>*4, <ore:clay>*6], "Alloying");

# Remake binder
recipes.remove(<enderio:item_material:22> * 8);
makeEx(<enderio:item_material:22> * 24, [
	[<ore:dust>, <ore:dustEndstone>, <ore:dust>],
	[<ore:dustClay>, <liquid:sand> * 1000, <ore:dustClay>],
	[<ore:dust>, <ore:dustEndstone>, <ore:dust>]]);

# And remake binder as compost
furnace.remove(<enderio:item_material:4>);
scripts.wrap.actuallyadditions.Compost.addRecipe(<enderio:item_material:4>, <quark:quilted_wool:8>, <enderio:item_material:22>, <biomesoplenty:dirt:2>);

# Simplifi Niard
recipes.remove(<enderio:block_niard>);
recipes.addShaped(<enderio:block_niard>, [
	[<immersiveengineering:metal_device1:6>, <enderio:block_tank>, <immersiveengineering:metal_device1:6>],
	[<ore:craftingPiston>, <ore:chassis>, <ore:craftingPiston>],
	[<ore:ingotFakeIron>, <ore:barsIron>, <ore:ingotFakeIron>]]);

# Compat of nano glowstone
scripts.process.crush(<enderio:item_material:76>, <enderio:block_holy_fog>, "except: sagMill", 
	[<enderio:block_holy_fog>, <minecraft:clay_ball>, <minecraft:glowstone_dust>], [0.6f, 0.1f, 0.1f]);

# Compunent for nano-glowstone compat
scripts.process.alloy([<minecraft:glowstone_dust>, <minecraft:clay_ball>], <enderio:item_material:76> * 2, "except: alloySmelter");

# Harder Vibrant Alloy
mods.thermalexpansion.InductionSmelter.removeRecipe(<enderio:item_alloy_ingot:1>, <minecraft:ender_pearl>);
scripts.process.alloy([<ore:ingotEnergeticAlloy>, <extendedcrafting:material:49>], <enderio:item_alloy_ingot:2> * 2, "ONLY: induction alloySmelter");

# Remove alloy recipes made in High Oven
ncAlloyRm(<enderio:item_alloy_ingot>);
ncAlloyRm(<enderio:item_alloy_ingot:1>);
ncAlloyRm(<enderio:item_alloy_ingot:2>);
ncAlloyRm(<enderio:item_alloy_ingot:3>);
ncAlloyRm(<enderio:item_alloy_ingot:4>); # conductive Iron
ncAlloyRm(<enderio:item_alloy_ingot:5>);
ncAlloyRm(<enderio:item_alloy_ingot:6>);
ncAlloyRm(<enderio:item_alloy_ingot:7>);
ncAlloyRm(<enderio:item_alloy_ingot:8>);
ncAlloyRm(<enderio:item_alloy_ingot:9>*3);



val fake_iron_variations = 
<thermalfoundation:material:1>   | <thermalfoundation:material:64>         | <thermalfoundation:material:65>  |
<thermalfoundation:material:66>  | <thermalfoundation:material:67>         | <thermalfoundation:material:68>  |
<thermalfoundation:material:69>  | <thermalfoundation:material:70>         | <thermalfoundation:material:71>  |
<thermalfoundation:material:72>  | <astralsorcery:itemcraftingcomponent:2> | <mekanism:dust:2>                |
<nuclearcraft:dust:3>            | <nuclearcraft:dust:5>                   | <nuclearcraft:dust:7>            |
<nuclearcraft:compound:2>        | <psi:material>                          | <thermalfoundation:material:96>  |
<thermalfoundation:material:97>  | <thermalfoundation:material:98>         | <thermalfoundation:material:99>  |
<thermalfoundation:material:100> | <thermalfoundation:material:101>        | <thermalfoundation:material:102> |
<thermalfoundation:material:103>;

# EnderIO simple alloys
solution([<ore:dustBedrock>, fake_iron_variations      			       ], [<liquid:iron>      *72 ], [<liquid:construction_alloy>*216], [0.5, 1,    2700], "only: highoven");
solution([<ore:dustBedrock>, <ore:dustEndstone>, <ore:dustObsidian>], [<liquid:dark_steel>*144], [<liquid:end_steel>         *144], [0.5, 1, 1, 5500], "only: highoven");
solution([<ore:dustBedrock>, <ore:dustRedstone>                    ], [<liquid:iron>      *144], [<liquid:conductive_iron>   *144], [0.5, 1,    4200], "only: highoven");


# Oxidiser
val ox as IIngredient = <ore:itemInfinityGoop>; # Infinity reagent

# EnderIO hard alloys
solution([ox, <mysticalagriculture:crafting:28>], [<liquid:gold>*144           ], [<liquid:soularium> *144       ], [0.5, 1, 0.25, 7600], "only: highoven");
solution([ox, <ore:itemSilicon>                ], [<liquid:steel>*144          ], [<liquid:electrical_steel> *144], [0.5, 1, 0.25, 4500], "only: highoven");
solution([ox, <ore:dustEnergetic>              ], [<liquid:gold>*144           ], [<liquid:energetic_alloy> *144 ], [0.5, 1, 0.25, 5400], "only: highoven");
solution([ox, <extendedcrafting:material:49>   ], [<liquid:energetic_alloy>*144], [<liquid:vibrant_alloy> *144   ], [0.5, 1, 0.25, 8100], "only: highoven");
solution([ox, <ore:dustRedstone>               ], [<liquid:tin>*144            ], [<liquid:redstone_alloy> *144  ], [0.5, 1, 0.25, 5400], "only: highoven");
solution([ox, <ore:dustEnderEye>               ], [<liquid:iron>*144           ], [<liquid:pulsating_iron> *144  ], [0.5, 1, 0.25, 8200], "only: highoven");

# Cheaper conduit facades
recipes.removeByRecipeName("enderio:conduit_facade_transparent");
val BDR = <ore:itemConduitBinder>;
recipes.addShaped(<enderio:item_conduit_facade:2> * 8, [
	[BDR, BDR, BDR],
	[BDR, <ore:fusedQuartz>, BDR],
	[BDR, BDR, BDR]]);

recipes.removeByRecipeName("enderio:conduit_facade");
recipes.addShaped(<enderio:item_conduit_facade> * 8, [
	[BDR, BDR, BDR],
	[BDR, null, BDR],
	[BDR, BDR, BDR]]);

# Avaritia Ender IO integration
#Infinity ball from all other balls and infinity catalyst
recipes.remove(<avaritiaio:grindingballinfinity> * 64);
val grindingBalls = [
<enderio:item_alloy_ball>,
<enderio:item_alloy_ball:1>,
<enderio:item_alloy_ball:2>,
<enderio:item_alloy_ball:3>,
<enderio:item_alloy_ball:4>,
<enderio:item_alloy_ball:5>,
<enderio:item_alloy_ball:6>,
<enderio:item_alloy_ball:7>,
<enderio:item_alloy_ball:8>,
<enderio:item_alloy_ball:9>,
<enderio:item_material:57>,
<enderio:item_material:58>,
<enderio:item_material:59>,
<enderio:item_alloy_endergy_ball:1>,
<enderio:item_alloy_endergy_ball:2>,
<enderio:item_alloy_endergy_ball:3>,
<enderio:item_alloy_endergy_ball:4>,
<avaritiaio:grindingballneutronium>,
] as IItemStack[];

scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<avaritiaio:grindingballinfinity> * 2, 2000000000, 20000000, <avaritia:resource:5>, grindingBalls);
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<avaritiaio:grindingballinfinity> * 2, 2000000000, 20000000, <avaritiaio:grindingballinfinity>, grindingBalls);

# End Steel process
scripts.process.alloy([<ore:ingotDarkSteel>, <ore:obsidian>, <ore:endstone>], <ore:ingotEndSteel>.firstItem, "except: alloySmelter");

# Excess ender dust recipe
recipes.removeByRecipeName("enderio:ender_dust");

# Remove default Infinity reagent recipe
mods.enderio.AlloySmelter.removeRecipe(<enderio:item_material:75>);

# [Simple_Inventory_Charger] from [LV_Capacitor][+2]
craft.remake(<enderio:item_inventory_charger_simple>, ["D","L","▬"], {
  "D": <ore:nuggetDarkSteel>,               # Dark Steel Nugget
  "L": <immersiveengineering:metal_device0>,# LV Capacitor
  "▬": <ore:ingotLead>,
});

# [Basic_Inventory_Charger] from [MV_Capacitor][+2]
craft.remake(<enderio:item_inventory_charger_basic>, ["E","M","▬"], {
  "E": <ore:nuggetElectricalSteel>,           # Electrical Steel Nugget
  "M": <immersiveengineering:metal_device0:1>,# MV Capacitor
  "▬": <ore:ingotLead>,
});

# [Inventory_Charger] from [HV_Capacitor][+2]
craft.remake(<enderio:item_inventory_charger>, ["♥","H","▬"], {
  "♥": <ore:nuggetRedstoneAlloy>,              # Redstone Alloy Nugget
  "H": <immersiveengineering:metal_device0:2>, # HV Capacitor
  "▬": <ore:ingotLead>,
});

# [Vibrant_Inventory_Charger] from [Basic_Capacitor][+2]
craft.remake(<enderio:item_inventory_charger_vibrant>, ["P","B","▬"], {
  "P": <ore:nuggetPulsatingIron>,      # Pulsating Iron Nugget
  "B": <enderio:item_basic_capacitor>, # Basic Capacitor
  "▬": <ore:ingotLead>,
});

# [Fluid Filter] from [Flopper][+1]
craft.remake(<enderio:item_fluid_filter>, ["pretty",
  "  p  ",
  "p F p",
  "  p  "], {
  "p": <ore:paper>,       # Paper
  "F": <flopper:flopper>, # Flopper
});

# [Omnivoir] from [Black Quartz][+1]
craft.remake(<enderio:block_omni_reservoir> * 4, ["pretty",
  "⌃ S",
  "S ⌃"], {
  "⌃": <ore:blockQuartzBlack>,     # Black Quartz
  "S": <tconstruct:seared_tank:1>, # Seared Gauge
});

# Omnivoir fast alt
scripts.process.alloy([<ore:blockQuartzBlack>], <enderio:block_omni_reservoir> * 2, "only: alloySmelter");

# [Energy Gauge] from [Omnivoir][+2]
craft.remake(<enderio:block_gauge>, ["pretty",
  "  ▲  ",
  "▬ O ▬"], {
  "▲": <ore:dustBedrock>,              # Grains of Infinity
  "▬": <ore:ingotFakeIron>,            # Iron Ingot
  "O": <enderio:block_omni_reservoir>, # Omnivoir
});

# [Endervoir] from [Molten Lapis]
recipes.remove(<enderio:block_reservoir>);
scripts.wrap.tconstruct.Casting.addBasinRecipe(<enderio:block_reservoir>, <enderio:block_omni_reservoir>, <liquid:lapis>, 666 * 18);

# [Black Paper]*8 from [Ink Sac][+1]
craft.remake(<enderio:item_material:77> * 8, ["pretty",
  "p p p",
  "p d p",
  "p p p"], {
  "p": <ore:paper>,    # Paper
  "d": <ore:dyeBlack>, # Ink Sac
});

# Conflicts
recipes.removeByRecipeName("enderio:self_resetting_lever_300_seconds_inverted");

# Harder to compete with all other item transfer methods
# [Item Conduit*8] from [Vibrant Alloy Nugget][+1]
craft.remake(<enderio:item_item_conduit> * 8, ["pretty",
  "C C C",
  "‚ ‚ ‚",
  "C C C"], {
  "C": <ore:itemConduitBinder>,  # Conduit Binder
  "‚": <ore:nuggetVibrantAlloy>, # Vibrant Alloy Nugget
});


# Compressed blocks smelting
val compressedBlocks = [
	<extrautils2:compressedcobblestone>             , <additionalcompression:stone_compressed>  ,
	<extrautils2:compressedcobblestone:1>           , <additionalcompression:stone_compressed:1>,
	<extrautils2:compressedcobblestone:2>           , <additionalcompression:stone_compressed:2>,
	<extrautils2:compressedcobblestone:3>           , <additionalcompression:stone_compressed:3>,
	<extrautils2:compressedcobblestone:4>           , <additionalcompression:stone_compressed:4>,
	<extrautils2:compressedcobblestone:5>           , <additionalcompression:stone_compressed:5>,
	<extrautils2:compressedcobblestone:6>           , <additionalcompression:stone_compressed:6>,
	<extrautils2:compressedcobblestone:7>           , <additionalcompression:stone_compressed:7>,
	<additionalcompression:cobblestone_compressed:8>, <additionalcompression:stone_compressed:8>,
	<additionalcompression:cobblestone_compressed:9>, <additionalcompression:stone_compressed:9>,
] as IItemStack[];

for i, input in compressedBlocks {
	if(i%2==1) continue;
	scripts.wrap.enderio.AlloySmelter.addRecipe(compressedBlocks[i + 1], [input], pow(4, i/2+1) * 1000, (i + 1) * 200);
}

# Cheaper cause vanilla recipe require Vibrant Alloy
# [Dark Steel Upgrade "Empowered"] from [Pulsating Crystal][+1]
craft.reshapeless(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:energyupgrade"}), 
  "B*", {
  "B": <enderio:item_dark_steel_upgrade>, # Blank Dark Steel Upgrade
  "*": <ore:itemPulsatingCrystal>,        # Pulsating Crystal
});


# Add recipe to use in some AA crafts
# [Organic Brown Dye] from [Crushed Black Quartz][+3]
mods.rt.RandomThingsTweaker.addImbuingRecipe(
	<forestry:refractory_wax>, # Refractory Wax
	<actuallyadditions:item_misc:21>, # Biomass
	<actuallyadditions:item_dust:7>, # Crushed Black Quartz
	<forestry:decaying_wheat>, # Decaying Wheat
	<enderio:item_material:49>
);

# [Pulsating Crystal] from [Biome Essence][+1]
craft.remake(<enderio:item_material:14>, ["pretty",
  "‚ ‚ ‚",
  "‚ B ‚",
  "‚ ‚ ‚"], {
  "B": <biomesoplenty:biome_essence>, # Biome Essence
  "‚": <ore:nuggetPulsatingIron>,     # Pulsating Iron Nugget
});

# Remove Death urn (we have special mod for this. Urn not as handy)
utils.rh(<enderio:item_material:81>, false);
utils.rh(<enderio:block_death_pouch>, false);

# [Experience Rod] from [Pulsating Crystal][+1]
craft.remake(<enderio:item_xp_transfer>, ["pretty",
  "    *",
  "  ▬  ",
  "▬    "], {
  "*": <ore:itemPulsatingCrystal>, # Pulsating Crystal
  "▬": <ore:ingotPulsatingIron>,   # Pulsating Iron Ingot
});

# [Experience Obelisk] from [Fluid Tank][+3]
craft.remake(<enderio:block_experience_obelisk>, ["pretty",
  "  /  ",
  "▬ F ▬",
  "S S S"], {
  "S": <ore:itemSimpleChassiParts>, # Simple Machine Parts
  "F": <enderio:block_tank>,        # Fluid Tank
  "▬": <ore:ingotSoularium>,        # Soularium Ingot
  "/": <enderio:item_xp_transfer>,  # Experience Rod
});

# [Vibrant Crystal] from [Vibrant Alloy Ingot][+1]
mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_material:15>);
mods.tconstruct.Casting.removeTableRecipe(<enderio:item_material:15>);
craft.remake(<enderio:item_material:15>, ["pretty",
  "  M  ",
  "M ▬ M",
  "  M  "], {
  "▬": <ore:ingotVibrantAlloy>,   # Vibrant Alloy Ingot
  "M": <tconstruct:materials:19>, # Mending Moss
});

# [Photovoltaic Composite] from [Silicon][+2]
craft.reshapeless(<enderio:item_material:38>, "▲▲▲©S©▲▲▲", {
  "▲": <ore:dustLapis>,    # Lapis Lazuli Dust
  "S": <ore:ingotSilicon>, # Silicon
  "©": <ore:dustCoal>,     # Pulverized Coal
});

# Low-level machines (original in Alloy Smelter)
scripts.process.compress(<ore:itemPowderPhotovoltaic> * 4, <enderio:item_material:3>, "No Exceptions");
scripts.wrap.immersiveengineering.MetalPress.addRecipe(<enderio:item_material:3>, <ore:itemPowderPhotovoltaic> * 4, <immersiveengineering:mold:0>, 2000);

# Cheaper to match other solar panels
# [Simple Photovoltaic Cell] from [Infinity Bimetal Gear][+3]
craft.remake(<enderio:block_solar_panel>, ["pretty",
  "‚ ‚ ‚",
  "□ □ □",
  "▲ ¤ ▲"], {
  "□": <ore:itemPlatePhotovoltaic>, # Photovoltaic Plate
  "▲": <ore:dustBedrock>,           # Grains of Infinity
  "¤": <ore:gearIronInfinity>,      # Infinity Bimetal Gear
  "‚": <ore:nuggetElectricalSteel>, # Electrical Steel Nugget
});

# Remove [Ender Pearl Powder] grinding recipes
mods.appliedenergistics2.Grinder.removeRecipe(<minecraft:ender_pearl>);
mods.appliedenergistics2.Grinder.removeRecipe(<thermalfoundation:material:895>);
scripts.process.crush(<ore:enderpearl>, <appliedenergistics2:material:46>, "Except: Pulverizer PulseCentrifuge", null, null);

# [block_fused_quartz] from [Block_of_Quartz][+2]
craft.shapeless(<enderio:block_fused_quartz>, "AB", {
  A: <contenttweaker:empowered_phosphor>,
  B: <ore:blockQuartz>,
});