#norun
#loader nc_preinit

import scripts.mods.nuclearcraft.NTP.coilclasses.ConverterInfo;
import scripts.mods.nuclearcraft.NTP.coilconverterlist.ConverterInfoList;

function registerConverter(info as ConverterInfo){

var naming = info.name;
var lowercase = naming.toLowerCase() ;
mods.nuclearcraft.Registration.registerTurbineCoil(lowercase~"converter",info.efficiency,info.rule);
}

for info in ConverterInfoList{
	registerConverter(info);
}


mods.nuclearcraft.Registration.registerTurbineCoil("baseconverter",0.20,"one basemagnet coil");
mods.nuclearcraft.Registration.registerTurbineCoil("antitritiumconverter",3.00,"one antideuteriumstabilizer coil || one ytterbiumconverter coil");