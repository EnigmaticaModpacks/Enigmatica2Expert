#norun
#loader nc_preinit


import scripts.mods.nuclearcraft.NTP.rotorclasses.StatorInfo;
import scripts.mods.nuclearcraft.NTP.rotorclasses.BladeInfo;
import scripts.mods.nuclearcraft.NTP.rotorclasses.qmdBladeInfo;
import scripts.mods.nuclearcraft.NTP.rotorlist.StatorInfoList;
import scripts.mods.nuclearcraft.NTP.rotorlist.BladeInfoList;
import scripts.mods.nuclearcraft.NTP.rotorlist.qmdBladeInfoList;


function registerStator (info as StatorInfo){

var naming = info.name;
var lowercase = naming.toLowerCase() ;
mods.nuclearcraft.Registration.registerTurbineStator(lowercase,info.expansion);
}

function registerBlade (info as BladeInfo){

var naming = info.name;
var lowercase = naming.toLowerCase() ;
mods.nuclearcraft.Registration.registerTurbineBlade(lowercase,info.efficiency,info.expansion);
}

function registerqmdBlade (info as qmdBladeInfo){

var naming = info.name;
var lowercase = naming.toLowerCase() ;
mods.nuclearcraft.Registration.registerTurbineBlade(lowercase,info.efficiency,info.expansion);
}





for info in StatorInfoList{
	registerStator(info);
}
for info in BladeInfoList{
	registerBlade(info);
}
for info in qmdBladeInfoList{
	registerqmdBlade(info);
}

mods.nuclearcraft.Registration.registerTurbineBlade("edelstahl", 1.50, 1.25);
mods.nuclearcraft.Registration.registerTurbineBlade("legierung", 1.50, 1.50);
mods.nuclearcraft.Registration.registerTurbineBlade("matrix", 1.50, 1.75);