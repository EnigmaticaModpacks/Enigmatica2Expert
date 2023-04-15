/*
Copyright Bob Bartsch, 2023

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#loader contenttweaker
import mods.contenttweaker.CreativeTab;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;
import mods.contenttweaker.Item;
import mods.contenttweaker.Block;


val zsTab = VanillaFactory.createCreativeTab("moar_reactor_functionality", <item:contenttweaker:radio_waste>);
zsTab.register();


/* -=-=-=-=-=-=-=-=- Gas Turbine Declarations -=-=-=-=-=-=-=-=- */
var zsFluid = VanillaFactory.createFluid("hot_nitrogen", Color.fromHex("5fca5d"));
zsFluid.setGaseous(true);
zsFluid.setVaporize(true);
zsFluid.setDensity(-600);
zsFluid.setViscosity(100);
zsFluid.setTemperature(700);
zsFluid.register();

zsFluid = VanillaFactory.createFluid("hot_carbon_dioxide", Color.fromHex("736F6F"));
zsFluid.setGaseous(true);
zsFluid.setVaporize(true);
zsFluid.setDensity(-300);
zsFluid.setViscosity(100);
zsFluid.setTemperature(700);
zsFluid.register();

zsFluid = VanillaFactory.createFluid("hot_helium", Color.fromHex("FF7373"));
zsFluid.setGaseous(true);
zsFluid.setVaporize(true);
zsFluid.setDensity(-200);
zsFluid.setViscosity(100);
zsFluid.setTemperature(700);
zsFluid.register();

/* -=-=-=- QMD additions -=-=-=- */
if(loadedMods has "qmd"){
zsFluid = VanillaFactory.createFluid("hot_argon", Color.fromHex("F873FF"));
zsFluid.setGaseous(true);
zsFluid.setVaporize(true);
zsFluid.setDensity(-600);
zsFluid.setViscosity(100);
zsFluid.setTemperature(700);
zsFluid.register();

zsFluid = VanillaFactory.createFluid("hot_neon", Color.fromHex("FF9673"));
zsFluid.setGaseous(true);
zsFluid.setVaporize(true);
zsFluid.setDensity(-600);
zsFluid.setViscosity(100);
zsFluid.setTemperature(700);
zsFluid.register();


//deprecated
var temp = VanillaFactory.createItem("compressed_air_canister");
temp.creativeTab = <creativetab:moar_reactor_functionality>;
temp.register();


zsFluid = VanillaFactory.createFluid("liquid_air", Color.fromHex("ECE7F0"));
zsFluid.setDensity(10);
zsFluid.setViscosity(100);
zsFluid.setTemperature(300);
zsFluid.register();

zsFluid = VanillaFactory.createFluid("nether_air", Color.fromHex("fff2e6"));
zsFluid.setDensity(10);
zsFluid.setViscosity(100);
zsFluid.setTemperature(300);
zsFluid.register();

zsFluid = VanillaFactory.createFluid("end_air", Color.fromHex("f9e6ff"));
zsFluid.setDensity(10);
zsFluid.setViscosity(100);
zsFluid.setTemperature(300);
zsFluid.register();

zsFluid = VanillaFactory.createFluid("krypton", Color.fromHex("99CCFF"));
zsFluid.setGaseous(true);
zsFluid.setVaporize(true);
zsFluid.setDensity(-600);
zsFluid.setViscosity(100);
zsFluid.setTemperature(300);
zsFluid.register();
zsFluid = VanillaFactory.createFluid("hot_krypton", Color.fromHex("6699FF"));
zsFluid.setGaseous(true);
zsFluid.setVaporize(true);
zsFluid.setDensity(-600);
zsFluid.setViscosity(100);
zsFluid.setTemperature(700);
zsFluid.register();

zsFluid = VanillaFactory.createFluid("xenon", Color.fromHex("66FFFF"));
zsFluid.setGaseous(true);
zsFluid.setVaporize(true);
zsFluid.setDensity(-600);
zsFluid.setViscosity(100);
zsFluid.setTemperature(300);
zsFluid.register();
zsFluid = VanillaFactory.createFluid("hot_xenon", Color.fromHex("0099FF"));
zsFluid.setGaseous(true);
zsFluid.setVaporize(true);
zsFluid.setDensity(-600);
zsFluid.setViscosity(100);
zsFluid.setTemperature(700);
zsFluid.register();
}

/* -=-=-=-=-=-=-=-=- Super Critical Water Declarations -=-=-=-=-=-=-=-=- */
zsFluid = VanillaFactory.createFluid("well_pressed_water", Color.fromHex("4076EB"));
zsFluid.setDensity(4000);
zsFluid.setViscosity(700);
zsFluid.setTemperature(400);
zsFluid.register();

zsFluid = VanillaFactory.createFluid("super_critical_steam", Color.fromHex("919191"));
zsFluid.setDensity(4000);
zsFluid.setViscosity(200);
zsFluid.setTemperature(2200);
zsFluid.register();

zsFluid = VanillaFactory.createFluid("crap_steam", Color.fromHex("A3A3A3"));
zsFluid.setGaseous(true);
zsFluid.setVaporize(true);
zsFluid.setDensity(-250);
zsFluid.setViscosity(300);
zsFluid.setTemperature(800);
zsFluid.register();

var temp = VanillaFactory.createItem("blaster");
temp.creativeTab = <creativetab:moar_reactor_functionality>;
temp.register();

temp = VanillaFactory.createItem("radio_waste");
temp.creativeTab = <creativetab:moar_reactor_functionality>;
temp.register();

/* -=-=-=-=-=-=-=-=- SC CO2 Declarations -=-=-=-=-=-=-=-=- */
var comco = VanillaFactory.createFluid("compr_carbon_dioxide", Color.fromHex("9E9E9E"));
comco.setGaseous(true);
zsFluid.setVaporize(true);
comco.setDensity(-400);
comco.setViscosity(40);
comco.setTemperature(700);
comco.register();

var critco = VanillaFactory.createFluid("supercritical_carbon_dioxide", Color.fromHex("9E9E9E"));
critco.setDensity(8000);
critco.setViscosity(200);
critco.setTemperature(1400);
critco.register();

var critexco = VanillaFactory.createFluid("critical_exhaust_carbon_dioxide", Color.fromHex("9E9E9E"));
critexco.setDensity(4000);
critexco.setViscosity(200);
critexco.setTemperature(400);
critexco.register();

/* -=-=-=-=-=-=-=-=- Low Budget Fusion Simulation Stuff -=-=-=-=-=-=-=-=- */
zsFluid = VanillaFactory.createFluid("cold_nrg", Color.fromHex("2db300"));
zsFluid.setGaseous(true);
zsFluid.setVaporize(true);
zsFluid.setDensity(-250);
zsFluid.setViscosity(200);
zsFluid.setTemperature(800000);
zsFluid.register();

zsFluid = VanillaFactory.createFluid("hot_nrg", Color.fromHex("33ff33"));
zsFluid.setGaseous(true);
zsFluid.setVaporize(true);
zsFluid.setDensity(-250);
zsFluid.setViscosity(200);
zsFluid.setTemperature(8000000);
zsFluid.register();

zsFluid = VanillaFactory.createFluid("hot_deuterium", Color.fromHex("7733ff"));
zsFluid.setGaseous(true);
zsFluid.setVaporize(true);
zsFluid.setDensity(-250);
zsFluid.setViscosity(300);
zsFluid.setTemperature(8000000);
zsFluid.register();

zsFluid = VanillaFactory.createFluid("hot_tritium", Color.fromHex("00e6e6"));
zsFluid.setGaseous(true);
zsFluid.setVaporize(true);
zsFluid.setDensity(-250);
zsFluid.setViscosity(200);
zsFluid.setTemperature(8000000);
zsFluid.register();
