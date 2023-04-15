#priority 2147483645

#loader preinit nc_preinit crafttweaker
import scripts.mods.nuclearcraft.NTP.coilclasses.ExtractorInfo;

static ExtractorInfoList as [ExtractorInfo] = [

	ExtractorInfo("Redstone",0.80, "one lapisconverter coil || one diamondconverter coil"),
	ExtractorInfo("Aluminium",0.90, "one emeraldconverter coil || one prismarineconverter coil || one redstoneextractor coil"),
	ExtractorInfo("Copper",1.00, "one arsenicconverter coil || one carobiiteconverter coil || one aluminiumextractor coil"),
	ExtractorInfo("Gold",1.10, "one fluoriteconverter coil || one rhodochrositeconverter coil || one copperextractor coil"),
	ExtractorInfo("Beryllium",1.20, "one zirconiumconverter coil || one villiaumiteconverter coil || one goldextractor coil"),
	ExtractorInfo("Graphite",1.30, "one glowstoneconverter coil || one quartzconverter coil || one berylliumextractor coil"),
	ExtractorInfo("Magnesium",1.40, "one molybdenumconverter coil || one endstoneconverter coil || one graphiteextractor coil"),
	ExtractorInfo("Silver",1.50, "one purpurconverter coil || one cobaltconverter coil || one magnesiumextractor coil"),
	ExtractorInfo("Signalum",1.60, "one lumiumconverter coil || one bariumconverter coil || one silverextractor coil"),
	ExtractorInfo("Smore",1.70, "one witheriteconverter coil || one silverextractor coil"),
	ExtractorInfo("Electrum",1.80, "one promethium147converter coil || one smoreextractor coil"),
	ExtractorInfo("Calcium",1.90, "one mercuryconverter coil || one electrumextractor coil"),
	ExtractorInfo("Hafnium",2.00, "one niobiumtinconverter coil || one calciumextractor coil"),
	ExtractorInfo("Lithium6Deuteride",2.10, "one baratolconverter coil || one hafniumextractor coil"),
	ExtractorInfo("SuperAlloy",2.20, "one gold198converter coil || one lithium6deuterideextractor coil"),
	ExtractorInfo("Yttrium",2.30, "one europium155converter coil || one superalloyextractor coil"),
	ExtractorInfo("Platinum",2.40, "one strontiumconverter coil || one yttriumextractor coil"),
	ExtractorInfo("Erbium",2.50, "one enderiumconverter coil || one platinumextractor coil"),
	ExtractorInfo("RadioactiveEarth",2.60, "one terbiumconverter coil || one erbiumextractor coil"),
	ExtractorInfo("Osmiridium",2.70, "one ytterbiumconverter coil || one radioactiveearthextractor coil"),
];