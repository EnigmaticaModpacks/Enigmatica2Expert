/*
Copyright Bob Bartsch, 2023

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

import crafttweaker.item.IIngredient;

/* -=-=-=-=-=-=-=-=- Normal HX Recipes -=-=-=-=-=-=-=-=- */
if (!(loadedMods in 'ncsteamadditions')) {
  var crMatrix = [[275, 250, 425, 400, 350, 525, 450, 500, 550, 575, 725, 325, 475, 1000, 975, 375, 600, 300, 800, 650, 625, 750, 875, 850, 825, 900, 700, 675, 925, 950, 775, 1025], [825, 750, 1275, 1200, 1050, 1575, 1350, 1500, 1650, 1725, 2175, 975, 1425, 3000, 2925, 1125, 1800, 900, 2400, 1950, 1875, 2250, 2625, 2550, 2475, 2700, 2100, 2025, 2775, 2850, 2325, 3075], [2750, 2500, 4250, 4000, 3500, 5250, 4500, 5000, 5500, 5750, 7250, 3250, 4750, 10000, 9750, 3750, 6000, 3000, 8000, 6500, 6250, 7500, 8750, 8500, 8250, 9000, 7000, 6750, 9250, 9500, 7750, 10250], [1375, 1250, 2125, 2000, 1750, 2625, 2250, 2500, 2750, 2875, 3625, 1625, 2375, 5000, 4875, 1875, 3000, 1500, 4000, 3250, 3125, 3750, 4375, 4250, 4125, 4500, 3500, 3375, 4625, 4750, 3875, 5125], [165, 150, 255, 240, 210, 315, 270, 300, 330, 345, 435, 195, 285, 600, 585, 225, 360, 180, 480, 390, 375, 450, 525, 510, 495, 540, 420, 405, 555, 570, 465, 615], [4125, 3750, 6375, 6000, 5250, 7875, 6750, 7500, 8250, 8625, 10875, 4875, 7125, 15000, 14625, 5625, 9000, 4500, 12000, 9750, 9375, 11250, 13125, 12750, 12375, 13500, 10500, 10125, 13875, 14250, 11625, 15375]] as int[][];
  var coolantIn = [<fluid:nak_hot>, <fluid:iron_nak_hot>, <fluid:redstone_nak_hot>, <fluid:quartz_nak_hot>, <fluid:obsidian_nak_hot>, <fluid:nether_brick_nak_hot>, <fluid:glowstone_nak_hot>, <fluid:lapis_nak_hot>, <fluid:gold_nak_hot>, <fluid:prismarine_nak_hot>, <fluid:slime_nak_hot>, <fluid:end_stone_nak_hot>, <fluid:purpur_nak_hot>, <fluid:diamond_nak_hot>, <fluid:emerald_nak_hot>, <fluid:copper_nak_hot>, <fluid:tin_nak_hot>, <fluid:lead_nak_hot>, <fluid:boron_nak_hot>, <fluid:lithium_nak_hot>, <fluid:magnesium_nak_hot>, <fluid:manganese_nak_hot>, <fluid:aluminum_nak_hot>, <fluid:silver_nak_hot>, <fluid:fluorite_nak_hot>, <fluid:villiaumite_nak_hot>, <fluid:carobbiite_nak_hot>, <fluid:arsenic_nak_hot>, <fluid:liquid_nitrogen_nak_hot>, <fluid:liquid_helium_nak_hot>, <fluid:enderium_nak_hot>, <fluid:cryotheum_nak_hot>] as IIngredient[];
  var coolantOut = [<fluid:nak>, <fluid:iron_nak>, <fluid:redstone_nak>, <fluid:quartz_nak>, <fluid:obsidian_nak>, <fluid:nether_brick_nak>, <fluid:glowstone_nak>, <fluid:lapis_nak>, <fluid:gold_nak>, <fluid:prismarine_nak>, <fluid:slime_nak>, <fluid:end_stone_nak>, <fluid:purpur_nak>, <fluid:diamond_nak>, <fluid:emerald_nak>, <fluid:copper_nak>, <fluid:tin_nak>, <fluid:lead_nak>, <fluid:boron_nak>, <fluid:lithium_nak>, <fluid:magnesium_nak>, <fluid:manganese_nak>, <fluid:aluminum_nak>, <fluid:silver_nak>, <fluid:fluorite_nak>, <fluid:villiaumite_nak>, <fluid:carobbiite_nak>, <fluid:arsenic_nak>, <fluid:liquid_nitrogen_nak>, <fluid:liquid_helium_nak>, <fluid:enderium_nak>, <fluid:cryotheum_nak>] as IIngredient[];
  var coolModifier = [144, 192, 15, 60, 540, 240] as int[];
  var transferIn = [<fluid:water> | <fluid:condensate_water>, <fluid:preheated_water>, <fluid:exhaust_steam>, <fluid:condensate_water>, <fluid:well_pressed_water>, <fluid:crap_steam>] as IIngredient[];
  var transferOut = [<fluid:high_pressure_steam>, <fluid:high_pressure_steam>, <fluid:low_pressure_steam>, <fluid:preheated_water>, <fluid:super_critical_steam>, <fluid:high_pressure_steam>] as IIngredient[];
  var transferModifier = [4, 4, 1, 1, 1, 1] as int[];

  // normal HX recipes
  for i, array in crMatrix {
    for j, num in array {
      mods.nuclearcraft.ChemicalReactor.addRecipe(coolantIn[j].amount(coolModifier[i]), transferIn[i].amount(num), coolantOut[j].amount(coolModifier[i]), transferOut[i].amount(num * transferModifier[i]), 0.00125, 0.0, 0.0);
    }
  }

  // steam powered HX recipes
  mods.nuclearcraft.ChemicalReactor.addRecipe(<fluid:high_pressure_steam> * 75, <fluid:exhaust_steam> * 120, <fluid:steam> * 300, <fluid:low_pressure_steam> * 120, 0.00125, 0.0, 0.0);
  mods.nuclearcraft.ChemicalReactor.addRecipe(<fluid:high_pressure_steam> * 80, <fluid:condensate_water> * 16, <fluid:steam> * 320, <fluid:preheated_water> * 16, 0.00125, 0.0, 0.0);

  /* -=-=-=-=-=-=-=-=- Moar Heat Sinks Integration -=-=-=-=-=-=-=-=- */
  if (oreDict in 'QuantumTraverseWouldYouKindlyStuffASockInIt') {
    crMatrix = [[625, 1075, 1125, 950, 1100, 350, 800, 875, 725, 875, 550, 600, 725, 900, 1200, 2815, 150], [625, 1075, 1125, 950, 1100, 350, 800, 875, 725, 875, 550, 600, 725, 900, 1200, 2815, 150], [2500, 4300, 4500, 3800, 4400, 1400, 3200, 3500, 2900, 3500, 2200, 2400, 2900, 3600, 4800, 11260, 600], [3125, 5375, 5625, 4750, 5500, 1750, 4000, 4375, 3625, 4375, 2750, 3000, 3625, 4500, 6000, 14075, 750], [375, 645, 675, 570, 660, 210, 480, 525, 435, 525, 330, 360, 435, 540, 720, 1689, 90], [3125, 5375, 5625, 4750, 5500, 1750, 4000, 4375, 3625, 4375, 2750, 3000, 3625, 4500, 6000, 14075, 750]] as int[][];
    coolantIn = [<fluid:steel_nak_hot>, <fluid:ferroboron_nak_hot>, <fluid:tough_alloy_nak_hot>, <fluid:limno2_nak_hot>, <fluid:mgb2_nak_hot>, <fluid:boron_arsenide_nak_hot>, <fluid:boron_nitride_nak_hot>, <fluid:rhodochrosite_nak_hot>, <fluid:zirconium_nak_hot>, <fluid:hard_carbon_nak_hot>, <fluid:extreme_alloy_nak_hot>, <fluid:thermoconducting_alloy_nak_hot>, <fluid:zircaloy_nak_hot>, <fluid:sic_sic_cmc_nak_hot>, <fluid:hsla_nak_hot>, <fluid:smore_nak_hot>, <fluid:liquid_oxygen_nak_hot>] as IIngredient[];
    coolantOut = [<fluid:steel_nak>, <fluid:ferroboron_nak>, <fluid:tough_alloy_nak>, <fluid:limno2_nak>, <fluid:mgb2_nak>, <fluid:boron_arsenide_nak>, <fluid:boron_nitride_nak>, <fluid:rhodochrosite_nak>, <fluid:zirconium_nak>, <fluid:hard_carbon_nak>, <fluid:extreme_alloy_nak>, <fluid:thermoconducting_alloy_nak>, <fluid:zircaloy_nak>, <fluid:sic_sic_cmc_nak>, <fluid:hsla_nak>, <fluid:smore_nak>, <fluid:liquid_oxygen_nak>] as IIngredient[];
    val coolModifier = [144, 64, 6, 60, 540, 80] as int[];
    var transferIn = [<fluid:water> | <fluid:condensate_water>, <fluid:preheated_water>, <fluid:exhaust_steam>, <fluid:condensate_water>, <fluid:well_pressed_water>, <fluid:crap_steam>] as IIngredient[];
    var transferOut = [<fluid:high_pressure_steam>, <fluid:high_pressure_steam>, <fluid:low_pressure_steam>, <fluid:preheated_water>, <fluid:super_critical_steam>, <fluid:high_pressure_steam>] as IIngredient[];
    var transferModifier = [4, 4, 1, 1, 1, 1] as int[];

    // MHS-NCO HX recipes
    for i, array in crMatrix {
      for j, num in array {
        mods.nuclearcraft.ChemicalReactor.addRecipe(coolantIn[j].amount(coolModifier[i]), transferIn[i].amount(num), coolantOut[j].amount(coolModifier[i]), transferOut[i].amount(num * transferModifier[i]), 0.00125, 0.0, 0.0);
      }
    }

    mods.nuclearcraft.ChemicalReactor.addRecipe(<fluid:corium_nak_hot> * 60, <fluid:preheated_water> * 125, <fluid:corium_nak> * 60, <fluid:condensate_water> * 125, 0.00125, 0.0, 0.0);

    if (loadedMods in 'thermalfoundation') {
      crMatrix = [[1450, 450, 850, 600, 750, 1700, 1250, 875, 400, 600, 525, 600, 450, 975], [1450, 450, 850, 600, 750, 1700, 1250, 875, 400, 600, 525, 600, 450, 975], [5800, 1800, 3400, 2400, 3000, 6800, 5000, 3500, 1600, 2400, 2100, 2400, 1800, 3900], [7250, 2250, 4250, 3000, 3750, 8500, 6250, 4375, 2000, 3000, 2625, 3000, 2250, 4875], [870, 270, 510, 360, 450, 1020, 750, 525, 240, 360, 315, 360, 270, 585], [7250, 2250, 4250, 3000, 3750, 8500, 6250, 4375, 2000, 3000, 2625, 3000, 2250, 4875]] as int[][];
      coolantIn = [<fluid:pyro_nak_hot>, <fluid:aero_nak_hot>, <fluid:petro_nak_hot>, <fluid:nickel_nak_hot>, <fluid:platinum_nak_hot>, <fluid:iridium_nak_hot>, <fluid:signalum_nak_hot>, <fluid:lumium_nak_hot>, <fluid:mana_dust_nak_hot>, <fluid:mithril_nak_hot>, <fluid:invar_nak_hot>, <fluid:constantan_nak_hot>, <fluid:bronze_nak_hot>, <fluid:electrum_nak_hot>] as IIngredient[];
      coolantOut = [<fluid:pyro_nak>, <fluid:aero_nak>, <fluid:petro_nak>, <fluid:nickel_nak>, <fluid:platinum_nak>, <fluid:iridium_nak>, <fluid:signalum_nak>, <fluid:lumium_nak>, <fluid:mana_dust_nak>, <fluid:mithril_nak>, <fluid:invar_nak>, <fluid:constantan_nak>, <fluid:bronze_nak>, <fluid:electrum_nak>] as IIngredient[];
      val coolModifier = [144, 64, 6, 60, 540, 80] as int[];
      var transferIn = [<fluid:water> | <fluid:condensate_water>, <fluid:preheated_water>, <fluid:exhaust_steam>, <fluid:condensate_water>, <fluid:well_pressed_water>, <fluid:crap_steam>] as IIngredient[];
      var transferOut = [<fluid:high_pressure_steam>, <fluid:high_pressure_steam>, <fluid:low_pressure_steam>, <fluid:preheated_water>, <fluid:super_critical_steam>, <fluid:high_pressure_steam>] as IIngredient[];
      var transferModifier = [4, 4, 1, 1, 1, 1] as int[];

      // MHS-TE HX recipes
      for i, array in crMatrix {
        for j, num in array {
          mods.nuclearcraft.ChemicalReactor.addRecipe(coolantIn[j].amount(coolModifier[i]), transferIn[i].amount(num), coolantOut[j].amount(coolModifier[i]), transferOut[i].amount(num * transferModifier[i]), 0.00125, 0.0, 0.0);
        }
      }
    }
  }
}// end of HX-CR stuff

// condenser recipes
mods.nuclearcraft.Enricher.addRecipe(<minecraft:snowball>, <fluid:exhaust_steam> * 16000, <fluid:condensate_water> * 1000, 0.00125, 0.0, 0.0);
mods.nuclearcraft.Enricher.addRecipe(<minecraft:snowball>, <fluid:low_quality_steam> * 16000, <fluid:condensate_water> * 500, 0.00125, 0.0, 0.0);

mods.nuclearcraft.Melter.addRecipe(<nuclearcraft:solidified_corium>, <fluid:corium> * 1000);
mods.nuclearcraft.IngotFormer.addRecipe(<fluid:corium> * 1000, <nuclearcraft:solidified_corium>);

/* -=-=-=-=-=-=-=-=- SuperCritical Water Recipes -=-=-=-=-=-=-=-=- */
// functionality
recipes.addShapeless(<contenttweaker:blaster> * 32, [<minecraft:tnt>]);
mods.nuclearcraft.Enricher.addRecipe(<contenttweaker:blaster>, <fluid:preheated_water> * 16000, <fluid:well_pressed_water> * 4000, 0.00125, 0.0, 0.0);
mods.nuclearcraft.FissionHeating.addRecipe(<fluid:well_pressed_water>, <fluid:super_critical_steam>, 175);
mods.nuclearcraft.Turbine.addRecipe(<fluid:super_critical_steam>, <fluid:crap_steam> * 16, 16.00, 16.00, 1.00);

// sc steam powered HX recipes
if (!(loadedMods in 'ncsteamadditions')) {
  mods.nuclearcraft.ChemicalReactor.addRecipe(<fluid:super_critical_steam> * 80, <fluid:crap_steam> * 672, <fluid:steam> * 5120, <fluid:high_pressure_steam> * 672, 0.00125, 0.0, 0.0);
  mods.nuclearcraft.ChemicalReactor.addRecipe(<fluid:super_critical_steam> * 5, <fluid:exhaust_steam> * 448, <fluid:steam> * 320, <fluid:low_pressure_steam> * 448, 0.00125, 0.0, 0.0);
  mods.nuclearcraft.ChemicalReactor.addRecipe(<fluid:super_critical_steam> * 20, <fluid:condensate_water> * 224, <fluid:steam> * 1280, <fluid:preheated_water> * 224, 0.00125, 0.0, 0.0);
}

/* -=-=-=-=-=-=-=-=- Gas Turbine Recipes -=-=-=-=-=-=-=-=- */
mods.nuclearcraft.FissionHeating.addRecipe(<fluid:nitrogen> * 2, <fluid:hot_nitrogen>, 5);
mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_nitrogen>, <fluid:nitrogen> * 2, 11.00, 2.00, 1.00);

mods.nuclearcraft.FissionHeating.addRecipe(<fluid:carbon_dioxide> * 3, <fluid:hot_carbon_dioxide>, 5);
mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_carbon_dioxide>, <fluid:carbon_dioxide> * 3, 17.00, 3.00, 1.00);

mods.nuclearcraft.FissionHeating.addRecipe(<fluid:helium> * 4, <fluid:hot_helium>, 6);
mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_helium>, <fluid:helium> * 4, 30.00, 4.00, 1.00);

/* -=-=-=- QMD additions -=-=-=- */
if (loadedMods in 'qmd') {
  mods.nuclearcraft.FissionHeating.addRecipe(<fluid:argon> * 2, <fluid:hot_argon>, 5);
  mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_argon>, <fluid:argon> * 2, 12.00, 2.00, 1.00);

  mods.nuclearcraft.FissionHeating.addRecipe(<fluid:neon> * 5, <fluid:hot_neon>, 4);
  mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_neon>, <fluid:neon> * 5, 24.30, 5.00, 1.00);

  mods.nuclearcraft.FissionHeating.addRecipe(<fluid:krypton> * 8, <fluid:hot_krypton>, 5);
  mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_krypton>, <fluid:krypton> * 8, 51.00, 8.00, 1.00);

  mods.nuclearcraft.FissionHeating.addRecipe(<fluid:xenon> * 9, <fluid:hot_xenon>, 4);
  mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_xenon>, <fluid:xenon> * 9, 48.00, 9.00, 1.00);
}

/* -=-=-=-=-=-=-=-=- SC CO2 Recipes -=-=-=-=-=-=-=-=- */
mods.nuclearcraft.Enricher.addRecipe(<contenttweaker:blaster>, <fluid:hot_carbon_dioxide> * 16000, <fluid:compr_carbon_dioxide> * 4000, 0.1, 0.0, 0.0);
mods.nuclearcraft.FissionHeating.addRecipe(<fluid:compr_carbon_dioxide>, <fluid:supercritical_carbon_dioxide>, 8);
mods.nuclearcraft.Turbine.addRecipe(<fluid:supercritical_carbon_dioxide>, <fluid:critical_exhaust_carbon_dioxide> * 8, 24.0, 8.0, 1.00);
mods.nuclearcraft.FissionHeating.addRecipe(<fluid:critical_exhaust_carbon_dioxide> * 8, <fluid:compr_carbon_dioxide>, 1);

/* -=-=-=-=-=-=-=-=- Heavy Water Recipe -=-=-=-=-=-=-=-=- */
if (!(oreDict in 'QuantumTraverseHowCanYouPossiblyNotBeDoneYetWithTheStrangeNamingSystem')) {
  mods.nuclearcraft.Centrifuge.addRecipe(<fluid:water> * 1600, <fluid:condensate_water> * 1590, <fluid:heavy_water> * 10, null, null, null, null, 1.0, 1.0, 0.0);
}

/* -=-=-=-=-=-=-=-=- Pebble Transfer -=-=-=-=-=-=-=-=- */
val fuelDecayFactor = [0.040, 0.065, 0.065, 0.065, 0.065, 0.070, 0.070, 0.075, 0.075, 0.075, 0.075, 0.075, 0.075, 0.08, 0.08, 0.085, 0.085, 0.085, 0.085, 0.085, 0.085, 0.090, 0.090, 0.10, 0.10, 0.10, 0.10] as double[];
val pebbles = [<ore:ingotTBUTRISO>, <ore:ingotLEU233TRISO>, <ore:ingotHEU233TRISO>, <ore:ingotLEU235TRISO>, <ore:ingotHEU235TRISO>, <ore:ingotLEN236TRISO>, <ore:ingotHEN236TRISO>, <ore:ingotLEP239TRISO>, <ore:ingotHEP239TRISO>, <ore:ingotLEP241TRISO>, <ore:ingotHEP241TRISO>, <ore:ingotMIX239TRISO>, <ore:ingotMIX241TRISO>, <ore:ingotLEA242TRISO>, <ore:ingotHEA242TRISO>, <ore:ingotLECm243TRISO>, <ore:ingotHECm243TRISO>, <ore:ingotLECm245TRISO>, <ore:ingotHECm245TRISO>, <ore:ingotLECm247TRISO>, <ore:ingotHECm247TRISO>, <ore:ingotLEB248TRISO>, <ore:ingotHEB248TRISO>, <ore:ingotLECf249TRISO>, <ore:ingotHECf249TRISO>, <ore:ingotLECf251TRISO>, <ore:ingotHECf251TRISO>] as IIngredient[];
val dpebbles = [<ore:ingotDepletedTBUTRISO>, <ore:ingotDepletedLEU233TRISO>, <ore:ingotDepletedHEU233TRISO>, <ore:ingotDepletedLEU235TRISO>, <ore:ingotDepletedHEU235TRISO>, <ore:ingotDepletedLEN236TRISO>, <ore:ingotDepletedHEN236TRISO>, <ore:ingotDepletedLEP239TRISO>, <ore:ingotDepletedHEP239TRISO>, <ore:ingotDepletedLEP241TRISO>, <ore:ingotDepletedHEP241TRISO>, <ore:ingotDepletedMIX239TRISO>, <ore:ingotDepletedMIX241TRISO>, <ore:ingotDepletedLEA242TRISO>, <ore:ingotDepletedHEA242TRISO>, <ore:ingotDepletedLECm243TRISO>, <ore:ingotDepletedHECm243TRISO>, <ore:ingotDepletedLECm245TRISO>, <ore:ingotDepletedHECm245TRISO>, <ore:ingotDepletedLECm247TRISO>, <ore:ingotDepletedHECm247TRISO>, <ore:ingotDepletedLEB248TRISO>, <ore:ingotDepletedHEB248TRISO>, <ore:ingotDepletedLECf249TRISO>, <ore:ingotDepletedHECf249TRISO>, <ore:ingotDepletedLECf251TRISO>, <ore:ingotDepletedHECf251TRISO>] as IIngredient[];
// lifetime, heat, criticality
val pebInts = [[12960, 44, 211], [2399, 240, 70], [2399, 720, 35], [4320, 133, 92], [4320, 399, 46], [1775, 324, 63], [1775, 972, 32], [4115, 140, 89], [4115, 420, 45], [2848, 202, 76], [2848, 606, 38], [3917, 147, 85], [2713, 213, 72], [1328, 433, 59], [1328, 1299, 30], [1350, 427, 59], [1350, 1281, 30], [2178, 264, 68], [2178, 792, 34], [1935, 298, 65], [1935, 894, 33], [1949, 296, 66], [1949, 888, 33], [959, 600, 54], [959, 1800, 27], [1800, 320, 64], [1800, 960, 32]] as int[][];
// efficiency, radiation
val pebDoubles = [[1.25, 5.44950384952691e-4], [1.1, 1.5368750507812497e-4], [1.15, 8.818056119791668e-5], [1.0, 1.4647403038194445e-5], [1.05, 4.3232476345486116e-5], [1.1, 1.3848286614583333e-4], [1.15, 1.871094112847222e-4], [1.2, 1.9298020833333332e-4], [1.25, 7.372842013888889e-4], [1.25, 3.059723958333333e-4], [1.3, 0.0010500715277777777], [1.05, 3.043609421875e-4], [1.15, 4.284255251302083e-4], [1.35, 1.8690104166666668e-4], [1.4, 5.958593749999999e-4], [1.45, 2.3746538975694446e-4], [1.5, 6.862065972222223e-4], [1.5, 8.506955642361112e-5], [1.55, 2.3019976475694448e-4], [1.55, 8.961816753472223e-5], [1.6, 2.3861144704861108e-4], [1.65, 6.76953125e-4], [1.7, 0.003945312500000001], [1.75, 0.011202864583333333], [1.8, 0.009991406250000001], [1.8, 0.011140885416666666], [1.85, 0.010332378472222223]] as double[][];
val pebPrime = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true] as bool[];
mods.nuclearcraft.PebbleFission.removeAllRecipes();
for i, item in pebbles {
  mods.nuclearcraft.SolidFission.addRecipe(item, dpebbles[i], pebInts[i][0], pebInts[i][1], pebDoubles[i][0], pebInts[i][2], fuelDecayFactor[i], pebPrime[i], pebDoubles[i][1]);
}

/* -=-=-=-=-=-=-=-=- Metallurgy 4 Reforged Compatability -=-=-=-=-=-=-=-=- */
if (loadedMods in 'metallurgy') {
  mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:ingotPrometheum>, <ore:dustPromethium147>, 282000, 0.0, 0.0);
}

/* -=-=-=-=-=-=-=-=- Pseudo-Decay Pool System -=-=-=-=-=-=-=-=- */
val radw = <contenttweaker:radio_waste>;
mods.nuclearcraft.Enricher.addRecipe(radw, <fluid:condensate_water> * 16000, <fluid:preheated_water> * 16000, 1.0, 0.0, 0.000747);
mods.nuclearcraft.Radiation.setRadiationLevel(radw, 0.000747);

mods.nuclearcraft.FuelReprocessor.addRecipe(<ore:dustStrontium90>, radw * 61, null, null, null, null, null, null, null);
mods.nuclearcraft.FuelReprocessor.addRecipe(<ore:dustRuthenium106>, radw * 64, radw * 38, null, null, null, null, null, null);
mods.nuclearcraft.FuelReprocessor.addRecipe(<ore:dustCaesium137>, radw * 64, radw * 64, null, null, radw * 64, radw * 12, null, null);
mods.nuclearcraft.FuelReprocessor.addRecipe(<ore:dustPromethium147>, radw * 64, radw * 64, null, null, radw * 64, radw * 53, null, null);
mods.nuclearcraft.FuelReprocessor.addRecipe(<ore:dustEuropium155>, radw * 64, radw * 64, radw * 64, null, radw * 64, radw * 64, radw * 47, null);

/* -=-=-=-=-=-=-=-=- Low Budget Fusion Simulation Time -=-=-=-=-=-=-=-=- */
mods.nuclearcraft.FissionIrradiator.addRecipe(<forge:bucketfilled>.withTag({ FluidName: 'lithium_6', Amount: 1000 }), <forge:bucketfilled>.withTag({ FluidName: 'tritium', Amount: 1000 }), 199131, 0.0, 0.1);

if (false) {
  mods.nuclearcraft.Enricher.addRecipe(<nuclearcraft:lithium_ion_battery_basic>, <fluid:hydrofluoric_acid> * 4000, <fluid:cold_nrg> * 15360, 0.0083333333, 40000.0, 0.0);
  mods.nuclearcraft.ChemicalReactor.addRecipe(<fluid:deuterium> * 15, <fluid:cold_nrg> * 15360, <fluid:hot_deuterium> * 15, null, 0.005, 500.0, 0.0);
  mods.nuclearcraft.ChemicalReactor.addRecipe(<fluid:tritium> * 15, <fluid:cold_nrg> * 15360, <fluid:hot_tritium> * 15, null, 0.005, 500.0, 0.0);
  mods.nuclearcraft.ChemicalReactor.addRecipe(<fluid:hot_tritium> * 1000, <fluid:hot_deuterium> * 1000, <fluid:helium> * 1000, <fluid:hot_nrg> * 16000, 0.3125, 1500.0, 2.58598671875e-4);
  mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_nrg>, <fluid:cold_nrg> * 128, 2687.5, 128.00, 1.00);
}
else {
  mods.jei.JEI.hide(<fluid:cold_nrg>);
  mods.jei.JEI.hide(<fluid:hot_nrg>);
  mods.jei.JEI.hide(<fluid:hot_deuterium>);
  mods.jei.JEI.hide(<fluid:hot_tritium>);
}
