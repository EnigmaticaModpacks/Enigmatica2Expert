#priority 2147483645

#loader preinit nc_preinit crafttweaker
import scripts.mods.nuclearcraft.NTP.coilclasses.ConverterInfo;

static ConverterInfoList as [ConverterInfo] = [

	ConverterInfo("Lapis",0.85, "one obsidianstabilizer coil || one bricknetherstabilizer coil"),
	ConverterInfo("Diamond",0.90, "one slimeballstabilizer coil || one boronstabilizer coil || one lapisconverter coil"),
	ConverterInfo("Emerald",0.95, "one manganesedioxidestabilizer coil || one diamondconverter coil"),
	ConverterInfo("Prismarine",1.00, "one manganeseoxidestabilizer coil || one emeraldconverter coil"),
	ConverterInfo("Arsenic",1.05, "one zircaloystabilizer coil || one prismarineconverter coil"),
	ConverterInfo("Carobbiite",1.10, "one boronarsenidestabilizer coil || one arsenicconverter coil"),
	ConverterInfo("Fluorite",1.15, "one boronnitridestabilizer coil || one carobbiiteconverter coil"),
	ConverterInfo("Rhodochrosite",1.2, "one hardcarbonstabilizer coil || one fluoriteconverter coil"),
	ConverterInfo("Villiaumite",1.25, "one hslasteelstabilizer coil || one rhodochrositeconverter coil"),
	ConverterInfo("Zirconium",1.3, "one lithiummanganesedioxidestabilizer coil || one villiaumiteconverter coil"),
	ConverterInfo("Glowstone",1.35, "one magnesiumdiboridestabilizer coil || one zirconiumconverter coil"),
	ConverterInfo("Quartz",1.4, "one toughstabilizer coil || one glowstoneconverter coil"),
	ConverterInfo("Molybdenum",1.45, "one coriumstabilizer coil || one quartzconverter coil"),
	ConverterInfo("Endstone",1.5, "one extremealloystabilizer coil || one molybdenumconverter coil"),
	ConverterInfo("Purpur",1.55, "one liquidheliumstabilizer coil || one endstoneconverter coil"),
	ConverterInfo("Cobalt",1.6, "one liquidnitrogenstabilizer coil || one purpurconverter coil"),
	ConverterInfo("Lumium",1.65, "one sicsiccmcstabilizer coil || one cobaltconverter coil"),
	ConverterInfo("Barium",1.7, "one sodiumstabilizer coil || one lumiumconverter coil"),
	ConverterInfo("Witherite",1.75, "one bariumoxidestabilizer coil || one bariumconverter coil"),
	ConverterInfo("Promethium147",1.8, "one caesium137stabilizer coil || one witheriteconverter coil"),
	ConverterInfo("Mercury",1.85, "one thermoconductingstabilizer coil || one promethium147converter coil"),
	ConverterInfo("NiobiumTin",1.9, "one zirconiummolybdenumstabilizer coil || one mercuryconverter coil"),
	ConverterInfo("Baratol",1.95, "one nichromestabilizer coil || one niobiumtinconverter coil"),
	ConverterInfo("Gold198",2.0, "one niobiumstabilizer coil || one baratolconverter coil"),
	ConverterInfo("Europium155",2.05, "one titaniumstabilizer coil || one gold198converter coil"),
	ConverterInfo("Strontium",2.1, "one tungstencarbidestabilizer coil || one europium155converter coil"),
	ConverterInfo("Enderium",2.15, "one cryotheumstabilizer coil || one strontiumconverter coil"),
	ConverterInfo("Terbium",2.2, "one bariumnitratestabilizer coil || one enderiumconverter coil"),
	ConverterInfo("Ytterbium",2.25, "one iodinestabilizer coil || one terbiumconverter coil")
	

];