#priority 2147483645

#loader preinit nc_preinit crafttweaker

import scripts.mods.nuclearcraft.NTP.coilclasses.MagnetInfo;

static MagnetInfoList as [MagnetInfo] = [

	MagnetInfo("Iron",0.50,"one bearing"),
	MagnetInfo("Lithium",0.50,"one connector"),
	MagnetInfo("Constantan",0.55,"one ironmagnet coil || one lithiummagnet coil"),
	MagnetInfo("Manganese",0.60,"one lithiummagnet coil"),
	MagnetInfo("Bronze",0.60,"one ironmagnet coil"),
	MagnetInfo("Lead",0.70,"one ironmagnet coil && one lithiummagnet coil"),
	MagnetInfo("Nickel",0.80,"two lithiummagnet coils"),
	MagnetInfo("Steel",0.80,"two ironmagnet coils"),
	MagnetInfo("Tin",0.90,"three ironmagnet coils || three lithiummagnet coils"),
	MagnetInfo("Ferroboron",0.75,"one manganesemagnet coil || one bronzemagnet coil || one constantanmagnet coil || one leadmagnet coil"),
	MagnetInfo("SiliconCarbide",1.00,"one tinmagnet coil"),
	MagnetInfo("Invar",0.90,"one steelmagnet coil || one nickelmagnet coil"),
	MagnetInfo("Potassium",1.10,"one siliconcarbidemagnet coil"),
	MagnetInfo("Chromium",1.25,"two ferroboronmagnet coils || two siliconcarbidemagnet coils || two invarmagnet coils"),
	MagnetInfo("Tungsten",1.10,"one nakmagnet coil"),
	MagnetInfo("Zinc",1.20,"one potassiummagnet coil"),
	MagnetInfo("Neodymium",1.20,"one tungstenmagnet coil"),
	MagnetInfo("Osmium",1.20,"one zincmagnet coil"),
	//more then 6 coils crashes nc even with or
	//	MagnetInfo("iridium",1.30,"two potassiummagnet coils || two chromiummagnet coils || two zincmagnet coils || one neodymiummagnet coil || one osmiummagnet coil"),
	//MagnetInfo("samarium",1.30,"two potassiummagnet coils || two chromiummagnet coils || two zincmagnet coils || one neodymiummagnet coil || one osmiummagnet coil")
	
	MagnetInfo("Iridium",1.30,"one neodymiummagnet coil || one osmiummagnet coil"),
	MagnetInfo("Samarium",1.30,"one neodymiummagnet coil || one osmiummagnet coil")
];

