#norun
#loader nc_preinit

import scripts.mods.nuclearcraft.NTP.coilclasses.MagnetInfo;
import scripts.mods.nuclearcraft.NTP.coilmagnetlist.MagnetInfoList;


function registerMagnet (info as MagnetInfo){

var naming = info.name;
var lowercase = naming.toLowerCase() ;
mods.nuclearcraft.Registration.registerTurbineCoil(lowercase~"magnet",info.efficiency,info.rule);


}



for info in MagnetInfoList{
	registerMagnet(info);
}

mods.nuclearcraft.Registration.registerTurbineCoil("basemagnet",0.1,"one bearing");
mods.nuclearcraft.Registration.registerTurbineCoil("nakmagnet",0.80,"one ferroboronmagnet coil || one invarmagnet coil");
mods.nuclearcraft.Registration.registerTurbineCoil("antihydrogenmagnet",1.50,"one iridiummagnet coil || one samariummagnet coil");
