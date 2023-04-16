#norun
/*
Copyright Bob Bartsch, 2023

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Color;

VanillaFactory.createCreativeTab('moar_reactor_functionality', <item:contenttweaker:radio_waste>).register();

/* -=-=-=-=-=-=-=-=- Gas Turbine Declarations -=-=-=-=-=-=-=-=- */
var f = VanillaFactory.createFluid('hot_nitrogen', Color.fromHex('5fca5d'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-600);
f.setViscosity(100);
f.setTemperature(700);
f.register();

f = VanillaFactory.createFluid('hot_carbon_dioxide', Color.fromHex('736F6F'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-300);
f.setViscosity(100);
f.setTemperature(700);
f.register();

f = VanillaFactory.createFluid('hot_helium', Color.fromHex('FF7373'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-200);
f.setViscosity(100);
f.setTemperature(700);
f.register();

/* -=-=-=- QMD additions -=-=-=- */
f = VanillaFactory.createFluid('hot_argon', Color.fromHex('F873FF'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-600);
f.setViscosity(100);
f.setTemperature(700);
f.register();

f = VanillaFactory.createFluid('hot_neon', Color.fromHex('FF9673'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-600);
f.setViscosity(100);
f.setTemperature(700);
f.register();

f = VanillaFactory.createFluid('liquid_air', Color.fromHex('ECE7F0'));
f.setDensity(10);
f.setViscosity(100);
f.setTemperature(300);
f.register();

f = VanillaFactory.createFluid('nether_air', Color.fromHex('fff2e6'));
f.setDensity(10);
f.setViscosity(100);
f.setTemperature(300);
f.register();

f = VanillaFactory.createFluid('end_air', Color.fromHex('f9e6ff'));
f.setDensity(10);
f.setViscosity(100);
f.setTemperature(300);
f.register();

f = VanillaFactory.createFluid('krypton', Color.fromHex('99CCFF'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-600);
f.setViscosity(100);
f.setTemperature(300);
f.register();

f = VanillaFactory.createFluid('hot_krypton', Color.fromHex('6699FF'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-600);
f.setViscosity(100);
f.setTemperature(700);
f.register();

f = VanillaFactory.createFluid('xenon', Color.fromHex('66FFFF'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-600);
f.setViscosity(100);
f.setTemperature(300);
f.register();

f = VanillaFactory.createFluid('hot_xenon', Color.fromHex('0099FF'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-600);
f.setViscosity(100);
f.setTemperature(700);
f.register();

/* -=-=-=-=-=-=-=-=- Super Critical Water Declarations -=-=-=-=-=-=-=-=- */
f = VanillaFactory.createFluid('well_pressed_water', Color.fromHex('4076EB'));
f.setDensity(4000);
f.setViscosity(700);
f.setTemperature(400);
f.register();

f = VanillaFactory.createFluid('super_critical_steam', Color.fromHex('919191'));
f.setDensity(4000);
f.setViscosity(200);
f.setTemperature(2200);
f.register();

f = VanillaFactory.createFluid('crap_steam', Color.fromHex('A3A3A3'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-250);
f.setViscosity(300);
f.setTemperature(800);
f.register();

var temp = VanillaFactory.createItem('blaster');
temp.creativeTab = <creativetab:moar_reactor_functionality>;
temp.register();

temp = VanillaFactory.createItem('radio_waste');
temp.creativeTab = <creativetab:moar_reactor_functionality>;
temp.register();

/* -=-=-=-=-=-=-=-=- SC CO2 Declarations -=-=-=-=-=-=-=-=- */
var comco = VanillaFactory.createFluid('compr_carbon_dioxide', Color.fromHex('9E9E9E'));
comco.setGaseous(true);
comco.setVaporize(true);
comco.setDensity(-400);
comco.setViscosity(40);
comco.setTemperature(700);
comco.register();

var critco = VanillaFactory.createFluid('supercritical_carbon_dioxide', Color.fromHex('9E9E9E'));
critco.setDensity(8000);
critco.setViscosity(200);
critco.setTemperature(1400);
critco.register();

var critexco = VanillaFactory.createFluid('critical_exhaust_carbon_dioxide', Color.fromHex('9E9E9E'));
critexco.setDensity(4000);
critexco.setViscosity(200);
critexco.setTemperature(400);
critexco.register();

/* -=-=-=-=-=-=-=-=- Low Budget Fusion Simulation Stuff -=-=-=-=-=-=-=-=- */
f = VanillaFactory.createFluid('cold_nrg', Color.fromHex('2db300'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-250);
f.setViscosity(200);
f.setTemperature(800000);
f.register();

f = VanillaFactory.createFluid('hot_nrg', Color.fromHex('33ff33'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-250);
f.setViscosity(200);
f.setTemperature(8000000);
f.register();

f = VanillaFactory.createFluid('hot_deuterium', Color.fromHex('7733ff'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-250);
f.setViscosity(300);
f.setTemperature(8000000);
f.register();

f = VanillaFactory.createFluid('hot_tritium', Color.fromHex('00e6e6'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-250);
f.setViscosity(200);
f.setTemperature(8000000);
f.register();
