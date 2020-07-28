import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IItemCondition;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
print("--- loading Creative.zs ---");

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
	var anglesite = <bigreactors:mineralanglesite>;
	var benitoite = <bigreactors:mineralbenitoite>;
	var ingotMirion = <ore:ingotMirion>;
	var manaTablet = <botania:manatablet>.withTag({mana: 500000});
	var megaDrum = <extrautils2:drum:3>;
	var draconicChest = <draconicevolution:draconium_chest>;
	var bucketUU = Bucket("ic2uu_matter");
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
	var blockLudicrite = <bigreactors:blockludicrite>;
	var gasPad = <advancedrocketry:oxygencharger>;
  var blockOsgloglas = <ore:blockOsgloglas>;
	var blockMirion = <ore:blockMirion>;
	var moonStone = <extrautils2:ingredients:5>;
	var creativeEssence = <mysticalagradditions:stuff:69>;
	var rocketFuel = Bucket("rocket_fuel");
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


# *======= Gas Trophy Frame =======*

# Add to JEI and apply Information
mods.jei.JEI.addItem(creativeGasTankFrame);
mods.jei.JEI.addDescription(creativeGasTankFrame, "Craft with 9 DIFFERENT gases");

# Gases to previwe. Not actual gases that used to craft
var allGasesNames as string[] = ["hydrogen", "oxygen", "water", "chlorine", "sulfurdioxide",
	"sulfurtrioxide", "sulfuricacid", "hydrogenchloride", "ethene", "sodium", "brine", "deuterium",
	"tritium", "fusionfuel", "lithium", "liquidosmium", "cleanIron", "iron", "cleanGold", "gold",
	"cleanOsmium", "osmium", "cleanCopper", "copper", "cleanTin", "tin", "cleanSilver", "silver",
	"cleanLead", "lead", "slurryCleanAluminium", "slurryCleanArdite", "slurryCleanAstralStarmetal",
	"slurryCleanBoron", "slurryCleanCobalt", "slurryCleanDraconium", "slurryCleanIridium",
	"slurryCleanLithium", "slurryCleanMagnesium", "slurryCleanMithril", "slurryCleanNickel",
	"slurryCleanPlatinum", "slurryCleanThorium", "slurryCleanTitanium", "slurryCleanUranium",
	"slurryAluminium", "slurryArdite", "slurryAstralStarmetal", "slurryBoron", "slurryCobalt",
	"slurryDraconium", "slurryIridium", "slurryLithium", "slurryMagnesium", "slurryMithril",
	"slurryNickel", "slurryPlatinum", "slurryThorium", "slurryTitanium", "slurryUranium"] as string[];

# Gas Ingredients (can use even gas tank without any gas)
var gt as IIngredient = <mekanism:gastank>.withTag({tier: 3, mekData: { stored: {amount: 512000/* , gasName: allGasesNames[0] */}}}) as IIngredient;
for i in 0 to allGasesNames.length {
  if (!isNull(mods.mekanism.MekanismHelper.getGas(allGasesNames[i]))) {
    gt = gt.or( <mekanism:gastank>.withTag({tier: 3, mekData: { stored: {amount: 512000, gasName: allGasesNames[i]}}}) );
  }
}

# Create list of 9 gases and mark them
var ingList as IIngredient[] = [] as IIngredient[];
for i in 0 to 9 {
  ingList += gt.marked("g"~i);
}

# Get gas name from IItemStack
function getGas(item as IItemStack) as string {
  if (!isNull(item) && !isNull(item.tag) && !isNull(item.tag.mekData) && !isNull(item.tag.mekData.stored) && !isNull(item.tag.mekData.stored.gasName)) {
    return item.tag.mekData.stored.gasName.asString();
  }
  return "";
}

# Add Shapeless Gas Tank recipe
recipes.addShapeless("Creative Gas Tank Frame", 
  creativeGasTankFrame.withLore(["Craft with 9 DIFFERENT gases"]), 
  ingList, 
  
  function(out, ins, cInfo) {
    for i in 0 to 8 {
      for j in (i+1) to 9 {
        if (getGas(ins["g"~i]) == getGas(ins["g"~j])) {
          return null; # We found gas duplicate, return nothing
        }
      }
    }
    return out;
  }, 
  null);



# *======= Recipes =======*


# Twilight Forest Master Trophy
	recipes.addShapedMirrored("Twilight Forest Master Trophy", twilightForestMasterTrophy, 
	[[<twilightforest:trophy>, <twilightforest:trophy:1>, <twilightforest:trophy:2>],
	[<twilightforest:trophy:5>, <ore:blockCrystalMatrix>, <twilightforest:trophy:3>], 
	[<twilightforest:trophy:4>, <twilightforest:trophy:8>, <twilightforest:trophy:6>]]);

# Master Trophy
	mods.jei.JEI.addItem(twilightForestMasterTrophy);
	
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
	<extrautils2:ingredients:17>,<bigreactors:ingotcyanite>,<bigreactors:ingotblutonium>,
	<bigreactors:ingotludicrite>,<immersiveengineering:material:19>,<immersiveengineering:metal:5>,
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

# RFTools Creative Powercell
	mods.extendedcrafting.TableCrafting.addShaped(4, <rftools:powercell_creative>,	
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
	[[<industrialforegoing:black_hole_tank>, Bucket("milk_goat"), Bucket("blood"), Bucket("liquiddna"), <thermalexpansion:tank>.withTag({Fluid: {FluidName: "bio.ethanol", Amount: 32000}}), Bucket("juice"), Bucket("mutagen"), Bucket("biomass"), <industrialforegoing:black_hole_tank>], 
	[Bucket("empoweredoil"), resonantFrame, ingotUltimate, ingotUltimate, <bigreactors:mineralanglesite>, ingotUltimate, ingotUltimate, resonantFrame, Bucket("witchwater")], 
	[Bucket("xu_demonic_metal"), ingotUltimate, megaDrum, megaDrum, megaDrum, megaDrum, megaDrum, ingotUltimate, Bucket("essence")], 
	[Bucket("draconium"), ingotUltimate, megaDrum, awakendedCore, ultCatalyst, awakendedCore, megaDrum, ingotUltimate, Bucket("sewage")], 
	[<thermalexpansion:tank>.withTag({Fluid: {FluidName: "tree_oil", Amount: 32000}}), <bigreactors:mineralanglesite>, megaDrum, ultCatalyst, <draconicevolution:chaotic_core>, ultCatalyst, megaDrum, <bigreactors:mineralanglesite>, <thermalexpansion:tank>.withTag({Fluid: {FluidName: "ic2uu_matter", Amount: 32000}})], 
	[Bucket("pyrotheum"), ingotUltimate, megaDrum, awakendedCore, ultCatalyst, awakendedCore, megaDrum, ingotUltimate, Bucket("ic2pahoehoe_lava")], 
	[Bucket("aerotheum"), ingotUltimate, megaDrum, megaDrum, megaDrum, megaDrum, megaDrum, ingotUltimate, Bucket("clay")], 
	[Bucket("essence"), resonantFrame, ingotUltimate, ingotUltimate, <bigreactors:mineralanglesite>, ingotUltimate, ingotUltimate, resonantFrame, Bucket("tritium")], 
	[<industrialforegoing:black_hole_tank>, Bucket("ender"), Bucket("cryotheum"), Bucket("petrotheum"), <thermalexpansion:tank>.withTag({Fluid: {FluidName: "mana", Amount: 32000}}), Bucket("refined_fuel"), Bucket("mirion"), Bucket("neutron"), <industrialforegoing:black_hole_tank>]]); 
	recipes.addShapeless("Creative Tank Reset", 
	<mekanism:machineblock2:11>.withTag({tier: 4, mekData: {}}), 
	[<mekanism:machineblock2:11>.withTag({tier: 4})]);

# Storage Drawers Unlimited Withdrawel Upgrade
	mods.extendedcrafting.TableCrafting.addShaped(4, <storagedrawers:upgrade_creative:1> * 2, 
	[[<ore:blockCrystalMatrix>, blackHoleUnit, ultCatalyst, ultCatalyst, <bigreactors:mineralanglesite>, ultCatalyst, ultCatalyst, blackHoleUnit, <ore:blockCrystalMatrix>], 
	[blackHoleUnit, resonantFrame, resonantFrame, draconicChest, <extracells:storage.component:3>, draconicChest, resonantFrame, resonantFrame, blackHoleUnit], 
	[ultCatalyst, resonantFrame, <ore:blockAethium>, <draconicevolution:chaotic_core>, benitoite, <draconicevolution:chaotic_core>, <ore:blockAethium>, resonantFrame, ultCatalyst], 
	[ultCatalyst, draconicChest, creativeEssence, <rftools:powercell_creative>, <ore:ingotInfinity>, <ic2:te:86>, creativeEssence, draconicChest, ultCatalyst], 
	[<bigreactors:mineralanglesite>, <extracells:storage.component:3>, benitoite, <environmentaltech:solar_cont_6>, twilightForestMasterTrophy, <environmentaltech:solar_cont_6>, benitoite, <extracells:storage.component:3>, <bigreactors:mineralanglesite>], 
	[ultCatalyst, draconicChest, creativeEssence, creativeTank, <ore:ingotInfinity>, creativeGasTank, creativeEssence, draconicChest, ultCatalyst], 
	[ultCatalyst, resonantFrame, <ore:blockAethium>, <draconicevolution:chaotic_core>, benitoite, <draconicevolution:chaotic_core>, <ore:blockAethium>, resonantFrame, ultCatalyst], 
	[blackHoleUnit, resonantFrame, resonantFrame, draconicChest, <extracells:storage.component:3>, draconicChest, resonantFrame, resonantFrame, blackHoleUnit], 
	[<ore:blockCrystalMatrix>, blackHoleUnit, ultCatalyst, ultCatalyst, <bigreactors:mineralanglesite>, ultCatalyst, ultCatalyst, blackHoleUnit, <ore:blockCrystalMatrix>]]);
	
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
	[bucketUU, anglesite, <nuclearcraft:fusion_core>, ultCatalyst, <extrautils2:decorativesolid:8>, ultCatalyst, <nuclearcraft:fusion_core>, anglesite, bucketUU], 
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
	[null, <ore:ingotIvoryPsi>, <psi:cad_assembly:4>, <bigreactors:mineralbenitoite>, <bigreactors:mineralbenitoite>, null, null, null, null], 
	[null, null, null, <bigreactors:mineralbenitoite>, <psi:cad_assembly:3>, <psi:cad_assembly:3>, null, null, null], 
	[null, null, null, null, <psi:cad_assembly:3>, <psi:cad_assembly:3>, <psi:cad_assembly:3>, null, null], 
	[null, null, null, null, null, <psi:cad_assembly:3>, <psi:cad_assembly:3>, <psi:cad_assembly:3>, null], 
	[null, null, null, null, null, null, <psi:cad_assembly:3>, <psi:cad_assembly:3>, <bigreactors:mineralbenitoite>], 
	[null, null, null, null, null, null, null, <bigreactors:mineralbenitoite>, <bigreactors:mineralbenitoite>]]); 

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
	
		print("--- Creative.zs initialized ---");
