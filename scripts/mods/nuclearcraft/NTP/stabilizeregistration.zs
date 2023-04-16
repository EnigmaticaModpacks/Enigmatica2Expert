#norun
#loader nc_preinit

import scripts.mods.nuclearcraft.NTP.coilclasses.StabilizerInfo;
import scripts.mods.nuclearcraft.NTP.coilclasses.LiquidStabilizerInfo;
import scripts.mods.nuclearcraft.NTP.coilstabilizerlist.StabilizerInfoList;
import scripts.mods.nuclearcraft.NTP.coilstabilizerlist.LiquidStabilizerInfoList;

function registerStabilizer(info as StabilizerInfo){

var naming = info.name;
var lowercase = naming.toLowerCase() ;
mods.nuclearcraft.Registration.registerTurbineCoil(lowercase~"stabilizer",info.efficiency,info.rule);
}

for info in StabilizerInfoList{
	registerStabilizer(info);
}

function registerLiquidStabilizer(info as LiquidStabilizerInfo){

var naming = info.name;
var lowercase = naming.toLowerCase() ;
mods.nuclearcraft.Registration.registerTurbineCoil(lowercase~"stabilizer",info.efficiency,info.rule);
}

for info in LiquidStabilizerInfoList{
	registerLiquidStabilizer(info);
}

mods.nuclearcraft.Registration.registerTurbineCoil("basestabilizer",0.20,"one basemagnet coil");
mods.nuclearcraft.Registration.registerTurbineCoil("antideuteriumstabilizer",2.50,"one antihydrogenmagnet coil || one iodinestabilizer coil");