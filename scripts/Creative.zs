import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IItemCondition;


# *======= Variables =======*

	var ingotUltimate = <ore:ingotUltimate>;
	var ultCatalyst = <extendedcrafting:material:13>;
	var elitePlating = <ore:plateElite>;
	var resonantCube = <thermalexpansion:cell>.withTag({Level: 4 as byte});
	var resonantFrame = <thermalexpansion:frame:148>;
	var awakendedCapacitor = <draconicevolution:draconium_capacitor:1>;
	var awakendedCore = <draconicevolution:awakened_core>;
	var blockAwakended = <ore:blockDraconiumAwakened>;
	var draconicEnergyCore = <draconicevolution:draconic_energy_core>;
	var rtgFuel = <ic2:nuclear:10>;
	var dilithium = <ore:gemDilithium>;
	var anglesite = <bigreactors:minerals>;
	var benitoite = <bigreactors:minerals:1>;
	var ingotMirion = <ore:ingotMirion>;
	var manaTablet = <botania:manatablet>.withTag({mana: 500000});
	var megaDrum = <extrautils2:drum:3>;
	var draconicChest = <draconicevolution:draconium_chest>;
	var bucketUU = <forge:bucketfilled>.withTag({FluidName: "ic2uu_matter", Amount: 1000});
	var hvSolar = <compactsolars:compact_solar_block:2>;
	var ultCell = <mekanism:basicblock2:3>.withTag({tier: 3});
	var ultProvider = <mekanism:basicblock2:4>.withTag({tier: 3});
	var blackHoleUnit = <industrialforegoing:black_hole_unit>;
	var blackHoleTank = <industrialforegoing:black_hole_tank>;
	var millLava = <extrautils2:passivegenerator:2>;
	var millWater = <extrautils2:passivegenerator:3>;
	var millWind = <extrautils2:passivegenerator:4>;
	var millFire = <extrautils2:passivegenerator:5>;
	var millDragonEgg = <extrautils2:passivegenerator:8>;
	var amazingCore = <extrautils2:opinium:6>;
	var speedUpgrade3 = <extrautils2:ingredients:16>;
	var sunCrystal = <extrautils2:suncrystal>;
	var kleinBottle = <extrautils2:klein>;
	var blockLudicrite = <bigreactors:blockmetals:4>;
	var gasPad = <advancedrocketry:oxygencharger>;
    var blockOsgloglas = <ore:blockOsgloglas>;
	var blockMirion = <ore:blockMirion>;
	var moonStone = <extrautils2:ingredients:5>;
	var creativeEssence = <mysticalagradditions:stuff:69>;
	var rocketFuel = <forge:bucketfilled>.withTag({FluidName: "rocket_fuel", Amount: 1000});
	var stoneburnt = <extrautils2:decorativesolid:3>;
	var cobble8x = <extrautils2:compressedcobblestone:7>;
	var storage16m = <extracells:storage.component:3>;
	var meChest = <appliedenergistics2:chest>;
	var creativeTank = <mekanism:machineblock2:11>.withTag({tier: 4});
	var creativeGasTank = <mekanism:gastank>.withTag({tier: 4});

var creativeGasTankFrame = <simple_trophies:trophy>.withTag({
	TrophyItem:{id:"mekanism:gastank",Count:1 as byte, Damage:0 as short},
	TrophyName:"Creative Gas Tank Frame",
	TrophyVariant:"gold"
});

var twilightForestMasterTrophy = <simple_trophies:trophy>.withTag({
  TrophyItem:{id:"twilightforest:trophy",Count:1 as byte, Damage:5 as short},
  TrophyName:"Twilight Forest Master Trophy",
  TrophyVariant:"gold"
});

# *======= Recipes =======*

# Twilight Forest Master Trophy
	recipes.addShapedMirrored("Twilight Forest Master Trophy", twilightForestMasterTrophy, 
	[[<twilightforest:trophy>, <twilightforest:trophy:1>, <twilightforest:trophy:2>],
	[<twilightforest:trophy:5>, <ore:blockCrystalMatrix>, <twilightforest:trophy:3>], 
	[<twilightforest:trophy:4>, <twilightforest:trophy:8>, <twilightforest:trophy:6>]]);

# Special Gas Tank Item
	recipes.addShapedMirrored("Creative Gas Tank Frame", creativeGasTankFrame, 
	[[<mekanism:gastank>.withTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "slurryCleanTitanium"}}}).onlyWithTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "slurryCleanTitanium"}}}), <mekanism:gastank>.withTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "slurryCleanIridium"}}}).onlyWithTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "slurryCleanIridium"}}}), <mekanism:gastank>.withTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "slurryCleanDraconium"}}}).onlyWithTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "slurryCleanDraconium"}}})],
	[<mekanism:gastank>.withTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "slurryCleanBoron"}}}).onlyWithTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "slurryCleanBoron"}}}), <mekanism:gastank>.withTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "slurryCleanMithril"}}}).onlyWithTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "slurryCleanMithril"}}}), <mekanism:gastank>.withTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "fusionfuel"}}}).onlyWithTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "fusionfuel"}}})], 
	[<mekanism:gastank>.withTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "ethene"}}}).onlyWithTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "ethene"}}}), <mekanism:gastank>.withTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "sulfuricacid"}}}).onlyWithTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "sulfuricacid"}}}), <mekanism:gastank>.withTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "hydrogenchloride"}}}).onlyWithTag({tier: 3, mekData: { stored: {amount: 512000, gasName: "hydrogenchloride"}}})]]);

# Master Trophy
	mods.jei.JEI.addItem(twilightForestMasterTrophy);
	
# Gas Tank Frame 
	mods.jei.JEI.addItem(creativeGasTankFrame);
	
# Mystical Agradditions Creative Essence
	mods.extendedcrafting.TableCrafting.addShaped(0, <mysticalagradditions:stuff:69>, 
	[[<ore:blockInsaniumEssence>, <ore:ingotVoid>, <ore:blockInsaniumEssence>, <ore:ingotVoid>, <ore:blockInsaniumEssence>], 
	[<ore:ingotVoid>, <ore:essenceTier6>, <ore:blockBaseEssence>, <ore:essenceTier6>, <ore:ingotVoid>], 
	[<ore:blockInsaniumEssence>, <ore:blockBaseEssence>, <ore:blockInsanium>, <ore:blockBaseEssence>, <ore:blockInsaniumEssence>], 
	[<ore:ingotVoid>, <ore:essenceTier6>, <ore:blockBaseEssence>, <ore:essenceTier6>, <ore:ingotVoid>], 
	[<ore:blockInsaniumEssence>, <ore:ingotVoid>, <ore:blockInsaniumEssence>, <ore:ingotVoid>, <ore:blockInsaniumEssence>]]);  

# Ultimate Ingot
	mods.extendedcrafting.TableCrafting.addShapeless(0, <extendedcrafting:material:32>, 
	[<nuclearcraft:ingot:3>, <nuclearcraft:ingot:5>, <minecraft:iron_ingot>,<minecraft:gold_ingot>,
	<advancedrocketry:productingot>,<advancedrocketry:productingot:1>,<advancedrocketry:misc:1>,
	<astralsorcery:itemcraftingcomponent:1>,<botania:manaresource>,<botania:manaresource:4>,
	<botania:manaresource:7>,<draconicevolution:draconium_ingot>,<draconicevolution:draconic_ingot>,
	<extendedcrafting:material>,<extendedcrafting:material:24>,<extrautils2:ingredients:11>,<extrautils2:ingredients:12>,
	<extrautils2:ingredients:17>,<bigreactors:ingotmetals:1>,<bigreactors:ingotmetals:3>,
	<bigreactors:ingotmetals:4>,<immersiveengineering:material:19>,<immersiveengineering:metal:5>,
	<mekanism:ingot>,<mekanism:ingot:1>,<mekanism:ingot:3>,<thermalfoundation:material:131>,
	<thermalfoundation:material:132>,<thermalfoundation:material:133>,<thermalfoundation:material:134>,
	<thermalfoundation:material:135>,<thermalfoundation:material:136>,<thermalfoundation:material:160>,
	<thermalfoundation:material:161>,<nuclearcraft:ingot:6>,<nuclearcraft:ingot:7>,<nuclearcraft:ingot:8>,
	<nuclearcraft:ingot:9>,<nuclearcraft:ingot:10>,<nuclearcraft:alloy:1>,<nuclearcraft:alloy:2>,
	<nuclearcraft:alloy:3>,<nuclearcraft:alloy:4>,<nuclearcraft:alloy:6>,<plustic:alumiteingot>,
	<plustic:osgloglasingot>,<plustic:osmiridiumingot>,<plustic:mirioningot>,<psi:material:1>,
	<psi:material:3>,<psi:material:4>,<redstonearsenal:material:32>,<twilightforest:ironwood_ingot>,
	<twilightforest:fiery_ingot>,<twilightforest:knightmetal_ingot>,<thermalfoundation:material:128>,
	<thermalfoundation:material:129>,<thermalfoundation:material:162>,<thermalfoundation:material:163>,
	<thermalfoundation:material:164>,<thermalfoundation:material:165>,<thermalfoundation:material:166>,
	<thermalfoundation:material:167>,<tconstruct:ingots>,<tconstruct:ingots:1>,<tconstruct:ingots:2>,
	<tconstruct:ingots:3>,<tconstruct:ingots:4>,<tconstruct:ingots:5>,<libvulpes:productingot:3>,
	<libvulpes:productingot:7>, <extendedcrafting:material:36>, <extendedcrafting:material:48>,
	<enderio:item_alloy_ingot:8>, <enderio:item_alloy_ingot:7>, <enderio:item_alloy_ingot:2>,
	<enderio:item_alloy_ingot>, <mysticalagradditions:insanium:2>, <thaumcraft:ingot:2>,
	<thaumcraft:ingot>, <thaumcraft:ingot:1>]);
	
# Creative Builder's Wand
	mods.extendedcrafting.TableCrafting.addShaped(0, <extrautils2:itemcreativebuilderswand>, 
	[[<extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>], 
	[<extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>], 
	[<extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>, <extrautils2:itembuilderswand>]]);  

# Creative RFTools Screen
	mods.extendedcrafting.CombinationCrafting.addRecipe(<rftools:creative_screen>, 
	100000000, 1000000, <rftools:screen_controller>, 
	[<rftools:screen>, <rftools:screen>, <rftools:screen>, 
	<rftools:screen>, <rftools:screen>, <rftools:screen>, 
	<rftools:screen>, <rftools:screen>, <rftools:screen>, 
	<rftools:screen>, <extrautils2:screen>, <extrautils2:screen>, 
	<extrautils2:screen>, <opencomputers:screen3>, 
	<opencomputers:screen2>, <opencomputers:screen1>]);

# EnderIO Creative Capacitor Bank
	mods.extendedcrafting.TableCrafting.addShaped(4, <enderio:block_cap_bank>.withTag({"enderio:energy": 1000000000}),
	[[rtgFuel, resonantFrame, ingotUltimate, ingotUltimate, ingotUltimate, ingotUltimate, ingotUltimate, resonantFrame, rtgFuel], 
	[resonantFrame, <nuclearcraft:rtg_californium>, elitePlating, anglesite, dilithium, anglesite, elitePlating, <nuclearcraft:rtg_californium>, resonantFrame], 
	[ingotUltimate, elitePlating, ultProvider, resonantCube, <environmentaltech:solar_cont_5>, resonantCube, ultProvider, elitePlating, ingotUltimate], 
	[ingotUltimate, benitoite, resonantCube, ultCell, <draconicevolution:draconic_energy_core>, ultCell, resonantCube, benitoite, ingotUltimate], 
	[ingotUltimate, dilithium, <environmentaltech:solar_cont_4>, <extrautils2:rainbowgenerator>, ultCatalyst, <extrautils2:rainbowgenerator>, <environmentaltech:solar_cont_4>, dilithium, ingotUltimate], 
	[ingotUltimate, benitoite, resonantCube, ultCell, <draconicevolution:draconic_energy_core>, ultCell, resonantCube, benitoite, ingotUltimate], 
	[ingotUltimate, elitePlating, ultProvider, resonantCube, <environmentaltech:solar_cont_5>, resonantCube, ultProvider, elitePlating, ingotUltimate], 
	[resonantFrame, <nuclearcraft:rtg_californium>, elitePlating, anglesite, dilithium, anglesite, elitePlating, <nuclearcraft:rtg_californium>, resonantFrame], 
	[rtgFuel, resonantFrame, ingotUltimate, ingotUltimate, ingotUltimate, ingotUltimate, ingotUltimate, resonantFrame, rtgFuel]]); 
	
# Creative Mana Tablet
	mods.extendedcrafting.TableCrafting.addShaped(4, <botania:manatablet>.withTag({mana: 500000, creative: 1 as byte}),	
	[[manaTablet, ingotMirion, ingotMirion, ingotMirion, manaTablet, ingotMirion, ingotMirion, ingotMirion, manaTablet], 
	[ingotMirion, <botania:laputashard>, benitoite, benitoite, benitoite, benitoite, benitoite, <botania:laputashard>, ingotMirion], 
	[ingotMirion, benitoite, <ore:gaiaIngot>, <botania:storage:1>, <botania:pylon:2>, <botania:storage:1>, <ore:gaiaIngot>, benitoite, ingotMirion], 
	[ingotMirion, benitoite, <botania:storage:1>, <botania:specialflower>.withTag({type: "narslimmus"}), <botania:specialflower>.withTag({type: "kekimurus"}), <botania:specialflower>.withTag({type: "munchdew"}), <botania:storage:1>, benitoite, ingotMirion], 
	[manaTablet, benitoite, <botania:pylon:2>, <botania:specialflower>.withTag({type: "kekimurus"}), <botania:manaringgreater>.withTag({mana: 2000000}), <botania:specialflower>.withTag({type: "kekimurus"}), <botania:pylon:2>, benitoite, manaTablet], 
	[ingotMirion, benitoite, <botania:storage:1>, <botania:specialflower>.withTag({type: "gourmaryllis"}), <botania:specialflower>.withTag({type: "kekimurus"}), <botania:specialflower>.withTag({type: "entropinnyum"}), <botania:storage:1>, benitoite, ingotMirion], 
	[ingotMirion, benitoite, <ore:gaiaIngot>, <botania:storage:1>, <botania:pylon:2>, <botania:storage:1>, <ore:gaiaIngot>, benitoite, ingotMirion], 
	[ingotMirion, <botania:laputashard>, benitoite, benitoite, benitoite, benitoite, benitoite, <botania:laputashard>, ingotMirion], 
	[manaTablet, ingotMirion, ingotMirion, ingotMirion, manaTablet, ingotMirion, ingotMirion, ingotMirion, manaTablet]]);
	
# Everlasting Guilty Pool
	mods.extendedcrafting.TableCrafting.addShaped(4, <botania:pool:1>,	
	[[<botania:pool:3>, ingotMirion, ingotMirion, ingotMirion, <botania:pool:3>, ingotMirion, ingotMirion, ingotMirion, <botania:pool:3>], 
	[ingotMirion, <botania:laputashard>, benitoite, benitoite, benitoite, benitoite, benitoite, <botania:laputashard>, ingotMirion], 
	[ingotMirion, benitoite, <ore:gaiaIngot>, <botania:storage:1>, <botania:pylon:2>, <botania:storage:1>, <ore:gaiaIngot>, benitoite, ingotMirion], 
	[ingotMirion, benitoite, <botania:storage:1>, <botania:specialflower>.withTag({type: "narslimmus"}), <botania:specialflower>.withTag({type: "kekimurus"}), <botania:specialflower>.withTag({type: "munchdew"}), <botania:storage:1>, benitoite, ingotMirion], 
	[<botania:pool:3>, benitoite, <botania:pylon:2>, <botania:specialflower>.withTag({type: "kekimurus"}), <botania:manaringgreater>.withTag({mana: 2000000}), <botania:specialflower>.withTag({type: "kekimurus"}), <botania:pylon:2>, benitoite, <botania:pool:3>], 
	[ingotMirion, benitoite, <botania:storage:1>, <botania:specialflower>.withTag({type: "gourmaryllis"}), <botania:specialflower>.withTag({type: "kekimurus"}), <botania:specialflower>.withTag({type: "entropinnyum"}), <botania:storage:1>, benitoite, ingotMirion], 
	[ingotMirion, benitoite, <ore:gaiaIngot>, <botania:storage:1>, <botania:pylon:2>, <botania:storage:1>, <ore:gaiaIngot>, benitoite, ingotMirion], 
	[ingotMirion, <botania:laputashard>, benitoite, benitoite, benitoite, benitoite, benitoite, <botania:laputashard>, ingotMirion], 
	[<botania:pool:3>, ingotMirion, ingotMirion, ingotMirion, <botania:pool:3>, ingotMirion, ingotMirion, ingotMirion, <botania:pool:3>]]);

# Mekanism Creative Tank
	mods.extendedcrafting.TableCrafting.addShaped(4, <mekanism:machineblock2:11>.withTag({tier: 4, mekData:{}}), 
	[[<industrialforegoing:black_hole_tank>, <forge:bucketfilled>.withTag({FluidName: "milk_goat", Amount: 1000}), <forge:bucketfilled>.withTag({FluidName: "blood", Amount: 1000}), <forge:bucketfilled>.withTag({FluidName: "liquiddna", Amount: 1000}), <thermalexpansion:tank>.withTag({Fluid: {FluidName: "bio.ethanol", Amount: 32000}}), <forge:bucketfilled>.withTag({FluidName: "juice", Amount: 1000}), <forge:bucketfilled>.withTag({FluidName: "mutagen", Amount: 1000}), <forge:bucketfilled>.withTag({FluidName: "biomass", Amount: 1000}), <industrialforegoing:black_hole_tank>], 
	[<forge:bucketfilled>.withTag({FluidName: "empoweredoil", Amount: 1000}), resonantFrame, ingotUltimate, ingotUltimate, <bigreactors:minerals>, ingotUltimate, ingotUltimate, resonantFrame, <forge:bucketfilled>.withTag({FluidName: "witchwater", Amount: 1000})], 
	[<forge:bucketfilled>.withTag({FluidName: "xu_demonic_metal", Amount: 1000}), ingotUltimate, megaDrum, megaDrum, megaDrum, megaDrum, megaDrum, ingotUltimate, <forge:bucketfilled>.withTag({FluidName: "corium", Amount: 1000})], 
	[<forge:bucketfilled>.withTag({FluidName: "draconium", Amount: 1000}), ingotUltimate, megaDrum, awakendedCore, ultCatalyst, awakendedCore, megaDrum, ingotUltimate, <forge:bucketfilled>.withTag({FluidName: "sewage", Amount: 1000})], 
	[<thermalexpansion:tank>.withTag({Fluid: {FluidName: "tree_oil", Amount: 32000}}), <bigreactors:minerals>, megaDrum, ultCatalyst, <draconicevolution:chaotic_core>, ultCatalyst, megaDrum, <bigreactors:minerals>, <thermalexpansion:tank>.withTag({Fluid: {FluidName: "ic2uu_matter", Amount: 32000}})], 
	[<forge:bucketfilled>.withTag({FluidName: "pyrotheum", Amount: 1000}), ingotUltimate, megaDrum, awakendedCore, ultCatalyst, awakendedCore, megaDrum, ingotUltimate, <forge:bucketfilled>.withTag({FluidName: "ic2pahoehoe_lava", Amount: 1000})], 
	[<forge:bucketfilled>.withTag({FluidName: "aerotheum", Amount: 1000}), ingotUltimate, megaDrum, megaDrum, megaDrum, megaDrum, megaDrum, ingotUltimate, <forge:bucketfilled>.withTag({FluidName: "clay", Amount: 1000})], 
	[<forge:bucketfilled>.withTag({FluidName: "essence", Amount: 1000}), resonantFrame, ingotUltimate, ingotUltimate, <bigreactors:minerals>, ingotUltimate, ingotUltimate, resonantFrame, <forge:bucketfilled>.withTag({FluidName: "tritium", Amount: 1000})], 
	[<industrialforegoing:black_hole_tank>, <forge:bucketfilled>.withTag({FluidName: "ender", Amount: 1000}), <forge:bucketfilled>.withTag({FluidName: "cryotheum", Amount: 1000}), <forge:bucketfilled>.withTag({FluidName: "petrotheum", Amount: 1000}), <thermalexpansion:tank>.withTag({Fluid: {FluidName: "mana", Amount: 32000}}), <forge:bucketfilled>.withTag({FluidName: "refined_fuel", Amount: 1000}), <forge:bucketfilled>.withTag({FluidName: "mirion", Amount: 1000}), <forge:bucketfilled>.withTag({FluidName: "neutron", Amount: 1000}), <industrialforegoing:black_hole_tank>]]); 
	recipes.addShapeless("Creative Tank Reset", 
	<mekanism:machineblock2:11>.withTag({tier: 4, mekData: {}}), 
	[<mekanism:machineblock2:11>.withTag({tier: 4})]);

# Storage Drawers Unlimited Withdrawel Upgrade
	mods.extendedcrafting.TableCrafting.addShaped(4, <storagedrawers:upgrade_creative:1> * 2, 
	[[<ore:blockCrystalMatrix>, blackHoleUnit, ultCatalyst, ultCatalyst, <bigreactors:minerals>, ultCatalyst, ultCatalyst, blackHoleUnit, <ore:blockCrystalMatrix>], 
	[blackHoleUnit, resonantFrame, resonantFrame, draconicChest, <extracells:storage.component:3>, draconicChest, resonantFrame, resonantFrame, blackHoleUnit], 
	[ultCatalyst, resonantFrame, <ore:blockAethium>, <draconicevolution:chaotic_core>, benitoite, <draconicevolution:chaotic_core>, <ore:blockAethium>, resonantFrame, ultCatalyst], 
	[ultCatalyst, draconicChest, creativeEssence, <enderio:block_cap_bank>.withTag({"enderio:energy": 1000000000}), <ore:ingotInfinity>, <ic2:te:86>, creativeEssence, draconicChest, ultCatalyst], 
	[<bigreactors:minerals>, <extracells:storage.component:3>, benitoite, <environmentaltech:solar_cont_6>, twilightForestMasterTrophy, <environmentaltech:solar_cont_6>, benitoite, <extracells:storage.component:3>, <bigreactors:minerals>], 
	[ultCatalyst, draconicChest, creativeEssence, creativeTank, <ore:ingotInfinity>, creativeGasTank, creativeEssence, draconicChest, ultCatalyst], 
	[ultCatalyst, resonantFrame, <ore:blockAethium>, <draconicevolution:chaotic_core>, benitoite, <draconicevolution:chaotic_core>, <ore:blockAethium>, resonantFrame, ultCatalyst], 
	[blackHoleUnit, resonantFrame, resonantFrame, draconicChest, <extracells:storage.component:3>, draconicChest, resonantFrame, resonantFrame, blackHoleUnit], 
	[<ore:blockCrystalMatrix>, blackHoleUnit, ultCatalyst, ultCatalyst, <bigreactors:minerals>, ultCatalyst, ultCatalyst, blackHoleUnit, <ore:blockCrystalMatrix>]]);
	
	recipes.addShapeless("Creative Storage Upgrade Duplication", 
	<storagedrawers:upgrade_creative:1> * 2, 
	[<storagedrawers:upgrade_creative:1>]);

# ExU2 Mill
	mods.extendedcrafting.TableCrafting.addShaped(4, <extrautils2:passivegenerator:6>,
	[[amazingCore, amazingCore, ingotUltimate, millDragonEgg, millDragonEgg, millDragonEgg, ingotUltimate, amazingCore, amazingCore], 
	[amazingCore, ingotUltimate, millWind, millWind, anglesite, millWind, millWind, ingotUltimate, amazingCore], 
	[ingotUltimate, millLava, benitoite, speedUpgrade3, moonStone, speedUpgrade3, benitoite, millFire, ingotUltimate], 
	[millDragonEgg, millLava, speedUpgrade3, kleinBottle, draconicEnergyCore, kleinBottle, speedUpgrade3, millFire, millDragonEgg], 
	[millDragonEgg, anglesite, moonStone, draconicEnergyCore, awakendedCore, draconicEnergyCore, moonStone, anglesite, millDragonEgg], 
	[millDragonEgg, millLava, speedUpgrade3, sunCrystal, draconicEnergyCore, sunCrystal, speedUpgrade3, millFire, millDragonEgg], 
	[ingotUltimate, millLava, benitoite, speedUpgrade3, moonStone, speedUpgrade3, benitoite, millFire, ingotUltimate], 
	[amazingCore, ingotUltimate, millWater, millWater, anglesite, millWater, millWater, ingotUltimate, amazingCore], 
	[amazingCore, amazingCore, ingotUltimate, millDragonEgg, millDragonEgg, millDragonEgg, ingotUltimate, amazingCore, amazingCore]]);  
	
# IC2 Creative Generator
	mods.extendedcrafting.TableCrafting.addShaped(4, <ic2:te:86>, 	
	[[bucketUU, rtgFuel, rtgFuel, rtgFuel, bucketUU, rtgFuel, rtgFuel, rtgFuel, bucketUU], 
	[hvSolar, ultProvider, ultProvider, anglesite, anglesite, anglesite, ultProvider, ultProvider, hvSolar], 
	[hvSolar, ultProvider, <ic2:te:75>, <ic2:te:22>, <nuclearcraft:fusion_core>, <ic2:te:22>, <ic2:te:75>, ultProvider, hvSolar], 
	[hvSolar, anglesite, <ic2:te:22>, ultCell, ultCatalyst, ultCell, <ic2:te:22>, anglesite, hvSolar], 
	[bucketUU, anglesite, <nuclearcraft:fusion_core>, ultCatalyst, <extrautils2:rainbowgenerator>, ultCatalyst, <nuclearcraft:fusion_core>, anglesite, bucketUU], 
	[hvSolar, anglesite, <ic2:te:22>, ultCell, ultCatalyst, ultCell, <ic2:te:22>, anglesite, hvSolar], 
	[hvSolar, ultProvider, <ic2:te:75>, <ic2:te:22>, <nuclearcraft:fusion_core>, <ic2:te:22>, <ic2:te:75>, ultProvider, hvSolar], 
	[hvSolar, ultProvider, ultProvider, anglesite, anglesite, anglesite, ultProvider, ultProvider, hvSolar], 
	[bucketUU, rtgFuel, rtgFuel, rtgFuel, bucketUU, rtgFuel, rtgFuel, rtgFuel, bucketUU]]); 

# Creative Gas Tank 
	mods.extendedcrafting.TableCrafting.addShaped(4, <mekanism:gastank>.withTag({tier: 4, mekData: {}}),	
	[[ingotUltimate, ingotUltimate, ingotUltimate, blockLudicrite, rocketFuel, blockLudicrite, ingotUltimate, ingotUltimate, ingotUltimate], 
	[ingotUltimate, blackHoleTank, blockOsgloglas, anglesite, rocketFuel, anglesite, blockOsgloglas, blackHoleTank, ingotUltimate], 
	[ingotUltimate, blockMirion, <thermalexpansion:tank>.withTag({Fluid: {FluidName: "neutron", Amount: 512000}, Level: 3 as byte}), <avaritia:resource:4>, ultCatalyst, <avaritia:resource:4>, <thermalexpansion:tank>.withTag({Fluid: {FluidName: "mana", Amount: 512000}, Level: 3 as byte}), blockMirion, ingotUltimate], 
	[blockLudicrite, benitoite, gasPad, awakendedCore, <advancedrocketry:liquidtank>, awakendedCore, gasPad, benitoite, blockLudicrite], 
	[rocketFuel, rocketFuel, ultCatalyst, <advancedrocketry:liquidtank>, creativeGasTankFrame, <advancedrocketry:liquidtank>, ultCatalyst, rocketFuel, rocketFuel], 
	[blockLudicrite, benitoite, gasPad, awakendedCore, creativeTank, awakendedCore, gasPad, benitoite, blockLudicrite], 
	[ingotUltimate, blockMirion, <thermalexpansion:tank>.withTag({Fluid: {FluidName: "ic2uu_matter", Amount: 512000}, Level: 3 as byte}), <avaritia:resource:4>, ultCatalyst, <avaritia:resource:4>, <thermalexpansion:tank>.withTag({Fluid: {FluidName: "liquiddna", Amount: 512000}, Level: 3 as byte}), blockMirion, ingotUltimate], 
	[ingotUltimate, blackHoleTank, blockOsgloglas, anglesite, rocketFuel, anglesite, blockOsgloglas, blackHoleTank, ingotUltimate],
	[ingotUltimate, ingotUltimate, ingotUltimate, blockLudicrite, rocketFuel, blockLudicrite, ingotUltimate, ingotUltimate, ingotUltimate]]);  
	recipes.addShapeless("Creative Gas Tank Reset", 
	<mekanism:gastank>.withTag({tier: 4, mekData: {}}), 
	[<mekanism:gastank>.withTag({tier: 4})]);
	
# Psi Creative Rod Frame
	mods.extendedcrafting.TableCrafting.addShaped(4, <psi:cad_assembly:5>, 
	[[<psi:cad_assembly:4>, <psi:cad_assembly:4>, <ore:ingotIvoryPsi>, null, null, null, null, null, null], 
	[<psi:cad_assembly:4>, <ore:blockInfinity>, <psi:cad_assembly:4>, <ore:ingotIvoryPsi>, null, null, null, null, null], 
	[<ore:ingotIvoryPsi>, <psi:cad_assembly:4>, <psi:cad_colorizer_:16>, <psi:cad_assembly:4>, null, null, null, null, null], 
	[null, <ore:ingotIvoryPsi>, <psi:cad_assembly:4>, <bigreactors:minerals:1>, <bigreactors:minerals:1>, null, null, null, null], 
	[null, null, null, <bigreactors:minerals:1>, <psi:cad_assembly:3>, <psi:cad_assembly:3>, null, null, null], 
	[null, null, null, null, <psi:cad_assembly:3>, <psi:cad_assembly:3>, <psi:cad_assembly:3>, null, null], 
	[null, null, null, null, null, <psi:cad_assembly:3>, <psi:cad_assembly:3>, <psi:cad_assembly:3>, null], 
	[null, null, null, null, null, null, <psi:cad_assembly:3>, <psi:cad_assembly:3>, <bigreactors:minerals:1>], 
	[null, null, null, null, null, null, null, <bigreactors:minerals:1>, <bigreactors:minerals:1>]]); 

# DE Creative Block Exchanger
	mods.extendedcrafting.TableCrafting.addShaped(4, <draconicevolution:creative_exchanger>,
	[[null, null, ultCatalyst, null, null, null, null, null, null], 
	[null, null, null, ultCatalyst, null, null, null, null, null], 
	[ultCatalyst, null, <storagedrawers:upgrade_creative:1>, ultCatalyst, null, null, null, null, null], 
	[null, ultCatalyst, ultCatalyst, <botania:exchangerod>, ultCatalyst, null, null, null, null], 
	[null, null, null, ultCatalyst, ultCatalyst, null, null, null, null], 
	[null, null, null, null, null, ultCatalyst, ultCatalyst, null, null], 
	[null, null, null, null, null, ultCatalyst, <buildinggadgets:exchangertool>.withTag({}), ultCatalyst, null], 
	[null, null, null, null, null, null, ultCatalyst, ultCatalyst, null], 
	[null, null, null, null, null, null, null, null, anglesite]]);
	
# Creative Wireless Crafting Terminal
	recipes.addShapeless("Creative Wireless Crafting Terminal", 
	<wct:wct_creative>, 
	[<wct:wct>.withTag({}),<rftools:powercell_creative>.anyDamage()]);

# TIC Creative Modifier
	mods.extendedcrafting.TableCrafting.addShaped(4, <tconstruct:materials:50>,
	[[<ore:blockPigiron>, <ore:blockAlubrass>, <tconstruct:materials:19>, <tconstruct:materials:19>, <tconstruct:materials:19>, <tconstruct:materials:19>, <tconstruct:materials:19>, <ore:blockAlubrass>, <ore:blockPigiron>], 
	[<ore:blockAlubrass>, <ore:blockPigiron>, <ore:blockManyullyn>, <ore:blockOsmiridium>, <ore:blockOsmiridium>, <ore:blockOsmiridium>, <ore:blockManyullyn>, <ore:blockPigiron>, <ore:blockAlubrass>], 
	[<ore:slimecrystalBlue>, <ore:blockManyullyn>, <tconstruct:large_plate>.withTag({Material: "xu_magical_wood"}), <ore:blockKnightslime>, <ore:blockKnightslime>, <ore:blockKnightslime>, <tconstruct:large_plate>.withTag({Material: "xu_magical_wood"}), <ore:blockManyullyn>, <ore:slimecrystalGreen>], 
	[<ore:slimecrystalBlue>, <ore:blockAlumite>, <ore:blockKnightslime>, <tconstruct:metal:6>, <tconstruct:materials:12>, <tconstruct:metal:6>, <ore:blockKnightslime>, <ore:blockMirion>, <ore:slimecrystalGreen>], 
	[<ore:slimecrystalBlue>, <ore:blockAlumite>, <ore:blockKnightslime>, <tconstruct:materials:13>, <extendedcrafting:singularity:5>, <tconstruct:materials:13>, <ore:blockKnightslime>, <ore:blockMirion>, <ore:slimecrystalGreen>], 
	[<ore:slimecrystalBlue>, <ore:blockAlumite>, <ore:blockKnightslime>, <tconstruct:metal:6>, <tconstruct:materials:12>, <tconstruct:metal:6>, <ore:blockKnightslime>, <ore:blockMirion>, <ore:slimecrystalGreen>], 
	[<ore:slimecrystalBlue>, <ore:blockManyullyn>, <tconstruct:large_plate>.withTag({Material: "xu_magical_wood"}), <ore:blockKnightslime>, <ore:blockKnightslime>, <ore:blockKnightslime>, <tconstruct:large_plate>.withTag({Material: "xu_magical_wood"}), <ore:blockManyullyn>, <ore:slimecrystalGreen>], 
	[<ore:blockAlubrass>, <ore:blockPigiron>, <ore:blockManyullyn>, <ore:blockOsgloglas>, <ore:blockOsgloglas>, <ore:blockOsgloglas>, <ore:blockManyullyn>, <ore:blockPigiron>, <ore:blockAlubrass>], 
	[<ore:blockPigiron>, <ore:blockAlubrass>, <ore:slimecrystalMagma>, <ore:slimecrystalMagma>, <ore:slimecrystalMagma>, <ore:slimecrystalMagma>, <ore:slimecrystalMagma>, <ore:blockAlubrass>, <ore:blockPigiron>]]);  
	
# AE2 Creative Cell
	mods.extendedcrafting.TableCrafting.addShaped(4, <appliedenergistics2:creative_storage_cell>,
	[[null, null, null, null, stoneburnt, null, null, null, null], 
	[null, null, null, cobble8x, storage16m, cobble8x, null, null, null], 
	[null, null, stoneburnt, storage16m, meChest, storage16m, stoneburnt, null, null], 
	[null, cobble8x, storage16m, meChest, draconicChest, meChest, storage16m, cobble8x, null], 
	[stoneburnt, storage16m, meChest, draconicChest, <storagedrawers:upgrade_creative:1>, draconicChest, meChest, storage16m, stoneburnt], 
	[null, cobble8x, storage16m, meChest, draconicChest, meChest, storage16m, cobble8x, null], 
	[null, null, stoneburnt, storage16m, meChest, storage16m, stoneburnt, null, null], 
	[null, null, null, cobble8x, storage16m, cobble8x, null, null, null], 
	[null, null, null, null, stoneburnt, null, null, null, null]]);  
	
# Draconic Evolution Creative Flux Capacitor
	mods.extendedcrafting.TableCrafting.addShaped(4, <draconicevolution:draconium_capacitor:2>.withTag({Energy: 1073741823}),
	[[null, null, null, null, blockAwakended, null, null, null, null], 
	[null, null, ingotUltimate, ingotUltimate, blockAwakended, ingotUltimate, ingotUltimate, null, null], 
	[null, ingotUltimate, creativeEssence, creativeEssence, blockAwakended, creativeEssence, creativeEssence, ingotUltimate, null], 
	[null, ingotUltimate, creativeEssence, awakendedCapacitor, awakendedCapacitor, awakendedCapacitor, creativeEssence, ingotUltimate, null], 
	[blockAwakended, blockAwakended, blockAwakended, awakendedCapacitor, <avaritia:resource:5>, awakendedCapacitor, blockAwakended, blockAwakended, blockAwakended], 
	[null, ingotUltimate, creativeEssence, awakendedCapacitor, awakendedCapacitor, awakendedCapacitor, creativeEssence, ingotUltimate, null], 
	[null, ingotUltimate, creativeEssence, creativeEssence, blockAwakended, creativeEssence, creativeEssence, ingotUltimate, null], 
	[null, null, ingotUltimate, ingotUltimate, blockAwakended, ingotUltimate, ingotUltimate, null, null], 
	[null, null, null, null, blockAwakended, null, null, null, null]]); 
	
		
