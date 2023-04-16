#norun
#loader nc_preinit

import scripts.mods.nuclearcraft.NTP.coilclasses.ExtractorInfo;
import scripts.mods.nuclearcraft.NTP.coilextractorlist.ExtractorInfoList;

function registerExtractor(info as ExtractorInfo){

var naming = info.name;
var lowercase = naming.toLowerCase() ;
mods.nuclearcraft.Registration.registerTurbineCoil(lowercase~"extractor",info.efficiency,info.rule);
}

for info in ExtractorInfoList{
	registerExtractor(info);
}


mods.nuclearcraft.Registration.registerTurbineCoil("baseextractor",0.70,"one baseconverter coil");
mods.nuclearcraft.Registration.registerTurbineCoil("antiheliumextractor",3.50,"one antitritiumconverter coil || one osmiridiumextractor coil");
mods.nuclearcraft.Registration.registerTurbineCoil("antihelium3extractor",4.00,"one antiheliumextractor coil ");