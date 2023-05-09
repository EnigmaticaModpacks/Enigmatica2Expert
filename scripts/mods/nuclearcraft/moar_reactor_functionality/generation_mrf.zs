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

/* -=-=-=-=-=-=-=-=- SC CO2 Declarations -=-=-=-=-=-=-=-=- */
var f = VanillaFactory.createFluid('hot_carbon_dioxide', Color.fromHex('736F6F'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-300);
f.setViscosity(100);
f.setTemperature(700);
f.register();

f = VanillaFactory.createFluid('compr_carbon_dioxide', Color.fromHex('9E9E9E'));
f.setGaseous(true);
f.setVaporize(true);
f.setDensity(-400);
f.setViscosity(40);
f.setTemperature(700);
f.register();

f = VanillaFactory.createFluid('supercritical_carbon_dioxide', Color.fromHex('9E9E9E'));
f.setDensity(8000);
f.setViscosity(200);
f.setTemperature(1400);
f.register();

f = VanillaFactory.createFluid('critical_exhaust_carbon_dioxide', Color.fromHex('9E9E9E'));
f.setDensity(4000);
f.setViscosity(200);
f.setTemperature(400);
f.register();
