/*
Copyright Bob Bartsch, 2023

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#modloaded ncsteamadditions



import mods.ncsteamadditions.heat_exchanger;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;


/* -=-=-=-=-=-=-=-=- Base NCO HX stuff -=-=-=-=-=-=-=-=- */
mods.ncsteamadditions.heat_exchanger.removeAllRecipes();
var crMatrix = [[275,250,425,400,350,525,450,500,550,575,725,325,475,1000,975,375,600,300,800,650,625,750,875,850,825,900,700,675,925,950,775,1025],[825,750,1275,1200,1050,1575,1350,1500,1650,1725,2175,975,1425,3000,2925,1125,1800,900,2400,1950,1875,2250,2625,2550,2475,2700,2100,2025,2775,2850,2325,3075],[2750,2500,4250,4000,3500,5250,4500,5000,5500,5750,7250,3250,4750,10000,9750,3750,6000,3000,8000,6500,6250,7500,8750,8500,8250,9000,7000,6750,9250,9500,7750,10250],[1375,1250,2125,2000,1750,2625,2250,2500,2750,2875,3625,1625,2375,5000,4875,1875,3000,1500,4000,3250,3125,3750,4375,4250,4125,4500,3500,3375,4625,4750,3875,5125],[165,150,255,240,210,315,270,300,330,345,435,195,285,600,585,225,360,180,480,390,375,450,525,510,495,540,420,405,555,570,465,615],[4125,3750,6375,6000,5250,7875,6750,7500,8250,8625,10875,4875,7125,15000,14625,5625,9000,4500,12000,9750,9375,11250,13125,12750,12375,13500,10500,10125,13875,14250,11625,15375]] as int[][];
var coolantIn = [<fluid:nak_hot>,<fluid:iron_nak_hot>,<fluid:redstone_nak_hot>,<fluid:quartz_nak_hot>,<fluid:obsidian_nak_hot>,<fluid:nether_brick_nak_hot>,<fluid:glowstone_nak_hot>,<fluid:lapis_nak_hot>,<fluid:gold_nak_hot>,<fluid:prismarine_nak_hot>,<fluid:slime_nak_hot>,<fluid:end_stone_nak_hot>,<fluid:purpur_nak_hot>,<fluid:diamond_nak_hot>,<fluid:emerald_nak_hot>,<fluid:copper_nak_hot>,<fluid:tin_nak_hot>,<fluid:lead_nak_hot>,<fluid:boron_nak_hot>,<fluid:lithium_nak_hot>,<fluid:magnesium_nak_hot>,<fluid:manganese_nak_hot>,<fluid:aluminum_nak_hot>,<fluid:silver_nak_hot>,<fluid:fluorite_nak_hot>,<fluid:villiaumite_nak_hot>,<fluid:carobbiite_nak_hot>,<fluid:arsenic_nak_hot>,<fluid:liquid_nitrogen_nak_hot>,<fluid:liquid_helium_nak_hot>,<fluid:enderium_nak_hot>,<fluid:cryotheum_nak_hot>] as IIngredient[];
var coolantOut = [<fluid:nak>,<fluid:iron_nak>,<fluid:redstone_nak>,<fluid:quartz_nak>,<fluid:obsidian_nak>,<fluid:nether_brick_nak>,<fluid:glowstone_nak>,<fluid:lapis_nak>,<fluid:gold_nak>,<fluid:prismarine_nak>,<fluid:slime_nak>,<fluid:end_stone_nak>,<fluid:purpur_nak>,<fluid:diamond_nak>,<fluid:emerald_nak>,<fluid:copper_nak>,<fluid:tin_nak>,<fluid:lead_nak>,<fluid:boron_nak>,<fluid:lithium_nak>,<fluid:magnesium_nak>,<fluid:manganese_nak>,<fluid:aluminum_nak>,<fluid:silver_nak>,<fluid:fluorite_nak>,<fluid:villiaumite_nak>,<fluid:carobbiite_nak>,<fluid:arsenic_nak>,<fluid:liquid_nitrogen_nak>,<fluid:liquid_helium_nak>,<fluid:enderium_nak>,<fluid:cryotheum_nak>] as IIngredient[];
var coolModifier = [144,192,15,60,540,240] as int[];
var transferIn = [<fluid:water>|<fluid:condensate_water>,<fluid:preheated_water>, <fluid:exhaust_steam>,<fluid:condensate_water>,<fluid:well_pressed_water>,<fluid:crap_steam>] as IIngredient[];
var transferOut = [<fluid:high_pressure_steam>,<fluid:high_pressure_steam>,<fluid:low_pressure_steam>,<fluid:preheated_water>,<fluid:super_critical_steam>,<fluid:high_pressure_steam>] as IIngredient[];
var transferModifier = [4,4,1,1,1,1] as int[];

//normal HX recipes
for i,array in crMatrix{
	for j,num in array{
		mods.ncsteamadditions.heat_exchanger.addRecipe(coolantIn[j].amount(coolModifier[i]), transferIn[i].amount(num), coolantOut[j].amount(coolModifier[i]), transferOut[i].amount(num*transferModifier[i]), 0.0001);
	}
}

//steam powered HX recipes
mods.ncsteamadditions.heat_exchanger.addRecipe(<fluid:high_pressure_steam>*75, <fluid:exhaust_steam>*120, <fluid:steam>*300, <fluid:low_pressure_steam>*120, 0.0001);
mods.ncsteamadditions.heat_exchanger.addRecipe(<fluid:high_pressure_steam>*80, <fluid:condensate_water>*16, <fluid:steam>*320, <fluid:preheated_water>*16, 0.0001);



/* -=-=-=-=-=-=-=-=- SuperCritical Water Recipes -=-=-=-=-=-=-=-=- */
//sc steam powered HX recipes
mods.ncsteamadditions.heat_exchanger.addRecipe(<fluid:super_critical_steam>*80, <fluid:crap_steam>*672, <fluid:steam>*5120, <fluid:high_pressure_steam>*672, 0.0001);
mods.ncsteamadditions.heat_exchanger.addRecipe(<fluid:super_critical_steam>*5, <fluid:exhaust_steam>*448, <fluid:steam>*320, <fluid:low_pressure_steam>*448, 0.0001);
mods.ncsteamadditions.heat_exchanger.addRecipe(<fluid:super_critical_steam>*20, <fluid:condensate_water>*224, <fluid:steam>*1280, <fluid:preheated_water>*224, 0.0001);



/* -=-=-=-=-=-=-=-=- Moar Heat Sinks Integration -=-=-=-=-=-=-=-=- */
if (oreDict has "QuantumTraverseWouldYouKindlyStuffASockInIt") {

crMatrix = [[625,1075,1125,950,1100,350,800,875,725,875,550,600,725,900,1200,2815,150],[625,1075,1125,950,1100,350,800,875,725,875,550,600,725,900,1200,2815,150],[2500,4300,4500,3800,4400,1400,3200,3500,2900,3500,2200,2400,2900,3600,4800,11260,600],[3125,5375,5625,4750,5500,1750,4000,4375,3625,4375,2750,3000,3625,4500,6000,14075,750],[375,645,675,570,660,210,480,525,435,525,330,360,435,540,720,1689,90],[3125,5375,5625,4750,5500,1750,4000,4375,3625,4375,2750,3000,3625,4500,6000,14075,750]] as int[][];
coolantIn = [<fluid:steel_nak_hot>,<fluid:ferroboron_nak_hot>,<fluid:tough_alloy_nak_hot>,<fluid:limno2_nak_hot>,<fluid:mgb2_nak_hot>,<fluid:boron_arsenide_nak_hot>,<fluid:boron_nitride_nak_hot>,<fluid:rhodochrosite_nak_hot>,<fluid:zirconium_nak_hot>,<fluid:hard_carbon_nak_hot>,<fluid:extreme_alloy_nak_hot>,<fluid:thermoconducting_alloy_nak_hot>,<fluid:zircaloy_nak_hot>,<fluid:sic_sic_cmc_nak_hot>,<fluid:hsla_nak_hot>,<fluid:smore_nak_hot>,<fluid:liquid_oxygen_nak_hot>] as IIngredient[];
coolantOut = [<fluid:steel_nak>,<fluid:ferroboron_nak>,<fluid:tough_alloy_nak>,<fluid:limno2_nak>,<fluid:mgb2_nak>,<fluid:boron_arsenide_nak>,<fluid:boron_nitride_nak>,<fluid:rhodochrosite_nak>,<fluid:zirconium_nak>,<fluid:hard_carbon_nak>,<fluid:extreme_alloy_nak>,<fluid:thermoconducting_alloy_nak>,<fluid:zircaloy_nak>,<fluid:sic_sic_cmc_nak>,<fluid:hsla_nak>,<fluid:smore_nak>,<fluid:liquid_oxygen_nak>] as IIngredient[];
val coolModifier = [144,64,6,60,540,80] as int[];
var transferIn = [<fluid:water>|<fluid:condensate_water>,<fluid:preheated_water>, <fluid:exhaust_steam>,<fluid:condensate_water>,<fluid:well_pressed_water>,<fluid:crap_steam>] as IIngredient[];
var transferOut = [<fluid:high_pressure_steam>,<fluid:high_pressure_steam>,<fluid:low_pressure_steam>,<fluid:preheated_water>,<fluid:super_critical_steam>,<fluid:high_pressure_steam>] as IIngredient[];
var transferModifier = [4,4,1,1,1,1] as int[];

//MHS-NCO HX recipes
for i,array in crMatrix{
	for j,num in array{
		mods.ncsteamadditions.heat_exchanger.addRecipe(coolantIn[j].amount(coolModifier[i]), transferIn[i].amount(num), coolantOut[j].amount(coolModifier[i]), transferOut[i].amount(num*transferModifier[i]), 0.0001);
	}
}

mods.ncsteamadditions.heat_exchanger.addRecipe(<fluid:corium_nak_hot>*60, <fluid:preheated_water>*125, <fluid:corium_nak>*60, <fluid:condensate_water>*125, 0.0001);

if(loadedMods has "thermalfoundation"){
crMatrix = [[1450,450,850,600,750,1700,1250,875,400,600,525,600,450,975],[1450,450,850,600,750,1700,1250,875,400,600,525,600,450,975],[5800,1800,3400,2400,3000,6800,5000,3500,1600,2400,2100,2400,1800,3900],[7250,2250,4250,3000,3750,8500,6250,4375,2000,3000,2625,3000,2250,4875],[870,270,510,360,450,1020,750,525,240,360,315,360,270,585],[7250,2250,4250,3000,3750,8500,6250,4375,2000,3000,2625,3000,2250,4875]] as int[][];
coolantIn = [<fluid:pyro_nak_hot>,<fluid:aero_nak_hot>,<fluid:petro_nak_hot>,<fluid:nickel_nak_hot>,<fluid:platinum_nak_hot>,<fluid:iridium_nak_hot>,<fluid:signalum_nak_hot>,<fluid:lumium_nak_hot>,<fluid:mana_dust_nak_hot>,<fluid:mithril_nak_hot>,<fluid:invar_nak_hot>,<fluid:constantan_nak_hot>,<fluid:bronze_nak_hot>,<fluid:electrum_nak_hot>] as IIngredient[];
coolantOut = [<fluid:pyro_nak>,<fluid:aero_nak>,<fluid:petro_nak>,<fluid:nickel_nak>,<fluid:platinum_nak>,<fluid:iridium_nak>,<fluid:signalum_nak>,<fluid:lumium_nak>,<fluid:mana_dust_nak>,<fluid:mithril_nak>,<fluid:invar_nak>,<fluid:constantan_nak>,<fluid:bronze_nak>,<fluid:electrum_nak>] as IIngredient[];
val coolModifier = [144,64,6,60,540,80] as int[];
var transferIn = [<fluid:water>|<fluid:condensate_water>,<fluid:preheated_water>, <fluid:exhaust_steam>,<fluid:condensate_water>,<fluid:well_pressed_water>,<fluid:crap_steam>] as IIngredient[];
var transferOut = [<fluid:high_pressure_steam>,<fluid:high_pressure_steam>,<fluid:low_pressure_steam>,<fluid:preheated_water>,<fluid:super_critical_steam>,<fluid:high_pressure_steam>] as IIngredient[];
var transferModifier = [4,4,1,1,1,1] as int[];

//MHS-TE HX recipes
for i,array in crMatrix{
	for j,num in array{
		mods.ncsteamadditions.heat_exchanger.addRecipe(coolantIn[j].amount(coolModifier[i]), transferIn[i].amount(num), coolantOut[j].amount(coolModifier[i]), transferOut[i].amount(num*transferModifier[i]), 0.0001);
	}
}
}

}