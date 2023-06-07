
#priority 2147483645

#loader preinit nc_preinit crafttweaker


import scripts.mods.nuclearcraft.NTP.coilclasses.StabilizerInfo;
import scripts.mods.nuclearcraft.NTP.coilclasses.LiquidStabilizerInfo;

static StabilizerInfoList as [StabilizerInfo] = [

	StabilizerInfo("BrickNether",0.55, "one ironmagnet coil"),
	StabilizerInfo("Obsidian",0.60, "one bricknetherstabilizer coil || one lithiummagnet coil"),
	StabilizerInfo("Slimeball",0.65, "one obsidianstabilizer coil"),
	StabilizerInfo("Boron",0.70, "one slimeballstabilizer coil || one manganesemagnet coil"),
	StabilizerInfo("ManganeseDioxide",0.75, "one boronstabilizer coil || one bronzemagnet coil"),
	StabilizerInfo("ManganeseOxide",0.80, "one manganesedioxidestabilizer coil"),
	StabilizerInfo("Zircaloy",0.85, "one manganeseoxidestabilizer coil || one constantanmagnet coil"),
	StabilizerInfo("BoronArsenide",0.90, "one zircaloystabilizer coil || one leadmagnet coil"),
	StabilizerInfo("BoronNitride",0.95, "one boronarsenidestabilizer coil"),
	StabilizerInfo("HardCarbon",1.00, "one boronnitridestabilizer coil || one nickelmagnet coil"),
	StabilizerInfo("HSLASteel",1.05, "one hardcarbonstabilizer coil || one steelmagnet coil"),
	StabilizerInfo("LithiumManganeseDioxide",1.10, "one hslasteelstabilizer coil"),
	StabilizerInfo("MagnesiumDiboride",1.15, "one lithiummanganesedioxidestabilizer coil || one tinmagnet coil"),
	StabilizerInfo("Tough",1.20, "one magnesiumdiboridestabilizer coil || one ferroboronmagnet coil"),
	StabilizerInfo("Extremealloy",1.30, "one coriumstabilizer coil || one siliconcarbidemagnet coil"),
	StabilizerInfo("SiCSiCCMC",1.45, "one extremealloystabilizer coil || one nakmagnet coil"),
	StabilizerInfo("Sodium",1.50, "one sicsiccmcstabilizer coil"),
	StabilizerInfo("BariumOxide",1.55, "one sodiumstabilizer coil || one potassiummagnet coil"),
	StabilizerInfo("Caesium137",1.60, "one bariumoxidestabilizer coil || one chromiummagnet coil"),
	StabilizerInfo("Thermoconducting",1.65, "one caesium137stabilizer coil"),
	StabilizerInfo("ZirconiumMolybdenum",1.70, "one thermoconductingstabilizer coil || one tungstenmagnet coil"),
	StabilizerInfo("Nichrome",1.75, "one zirconiummolybdenumstabilizer coil || one zincmagnet coil"),
	StabilizerInfo("Niobium",1.80, "one nichromestabilizer coil "),
	StabilizerInfo("Titanium",1.85, "one niobiumstabilizer coil || one neodymiummagnet coil "),
	StabilizerInfo("TungstenCarbide",1.90, "one titaniumstabilizer coil || one osmiummagnet coil "),
	StabilizerInfo("BariumNitrate",2.00, "one cryotheumstabilizer coil || one iridiummagnet coil"),
	StabilizerInfo("Iodine",2.05, "one bariumnitratestabilizer coil || one samariummagnet coil" ),
];	
	
static LiquidStabilizerInfoList as [LiquidStabilizerInfo] =[
	LiquidStabilizerInfo("corium",<liquid:corium>,1.25,"one toughstabilizer coil"),
	LiquidStabilizerInfo("liquidhelium",<liquid:liquid_helium>,1.35,"one extremealloystabilizer coil"),
	LiquidStabilizerInfo("liquidnitrogen",<liquid:liquid_nitrogen>,1.40,"one liquidheliumtabilizer coil || one invarmagnet coil"),
	LiquidStabilizerInfo("cryotheum",<liquid:cryotheum>,1.95,"one tungstencarbidestabilizer coil")
];
	
	
	
	