import mods.TweakedPetroleum.TweakedReservoir;
import mods.TweakedLib.TweakedPowerTier.registerPowerTier;
import mods.TweakedPetroleum.TweakedReservoir.registerReservoir;
import mods.TweakedPetroleum.TweakedReservoir.registerReservoirWithDrainChance;
import mods.TweakedPetroleum.TweakedGasReservoir.registerGasReservoir;
import crafttweaker.liquid.ILiquidStack;
import mod.mekanism.gas.IGasStack;

#modloaded tweakedpetroleum tweakedpetroleumgas

/*

public static int registerPowerTier(int capacity, int rft)

	PowerUsage capacity can not be smaller than 1
	PowerUsage capacity can not be smaller than rft

https://github.com/TwistedGate/ImmersivePetroleum/wiki/%5B1.12.2-And-Older%5D-Modpack-Developers#fluid-reservoirs
public static void registerReservoir(String name, ILiquidStack fluid, int minSize, int maxSize, int replenishRate, int pumpSpeed, int weight, int powerTier 
		@Optional int[] dimBlacklist, @Optional int[] dimWhitelist, @Optional String[] biomeBlacklist, @Optional String[] biomeWhitelist);

		The name of the reservoir will act as an id, and it should be unique and not renamed, if its renamed existing fluid chunks with that id will disappear. It will be saved in minecraft/saves/New Normal Overworld/data/ImmersiveEngineering-SaveData.dat,
			with some other data, example:
				
			            {
                x: -19
                dim: 0
                z: -11
                info: {
                    oil: 7161816
                    type: Aquifer
                    capacity: 7161816
                }


		The pumpSpeed must be equal or greater than replenishRate
*/


//Max int is 2_147_483_647
val maxInt = 2147480000;

# Power tiers
val I   = registerPowerTier(16000,      1024);
val II  = registerPowerTier(160000,     10240);
val III = registerPowerTier(16000000,   1024000);
val IV  = registerPowerTier(1600000000, 102400000);


# Vanila
registerReservoir("aquifer"                            , <liquid:water>   , 5000000 , 10000000, 6  , 25  , 30, I, [], [0,1,7,-11325] , [], []);
registerReservoir("oil"                                , <liquid:oil>     , 2500000 , 15000000, 6  , 25  , 40, I, [], [0,7,-11325]   , [], []);
registerReservoir("lava"                               , <liquid:lava>    , 250000  , 1000000 , 0  , 25  , 30, I, [], [0,-1,7,-11325], [], []);
registerReservoir("Desert Oil Reservoir"               , <liquid:oil>     , 15000000, 30000000, 25 , 50  , 5 , I, [], [0]            , [], ["SANDY"]);
registerReservoir("Deep Ocean Oil Reservoir"           , <liquid:oil>     , 15000000, 30000000, 25 , 50  , 5 , I, [], [0]            , [], ["OCEAN"]);
registerReservoir("Low Pressure Magma Chamber (Nether)", <liquid:lava>    , 500000  , 1500000 , 500, 1500, 5 , I, [], [-1]           , [], []);
registerReservoir("Molten Tungsten Reservoir (End)"    , <liquid:tungsten>, 720000  , 1440000 , 0  , 4   , 10, I, [], [1]            , [], []);


# Deep Dark ID=-11325
/*
	Black quartz ore 2.6%
*/

registerReservoir("Dark Steel Reservoir (Deep Dark)", <liquid:dark_steel>, 12400000, 16400000, 0, 100, 10, I, [], [-11325], [], []);

# Twilight Forest ID=7
registerReservoir("Flux Goo Reservoir (Twilight Forest)"    , <liquid:flux_goo>    , 35000, 750000, 0, 50, 20,  I, [], [7], [], []);
registerReservoir("Primal Metal Reservoir (Twilight Forest)", <liquid:primal_metal>,  5000,  50000, 0, 50, 10, III, [], [7], [], []);

# Vast epltines ID=14676
registerReservoir("Flux Goo Reservoir (Vast Epltines)", <liquid:flux_goo>, 35000, 750000, 0, 50, 20, I, [], [14676], [], []);

# --------------------------
# Star Sol
# --------------------------

# Luna ID=100
/*
	Helium3
*/
registerReservoir("Helium 3 Reservoir (Luna)", <liquid:helium_3>, 2000000000, maxInt, 15, 40, 30, I, [], [100], [], []);

# Mercury ID=101
	/*
		aluminium 11%
		tin 8.66%
		energized N
		lava
		White sand
*/
registerReservoir("Liquid Mica (Mercury)"                     , <liquid:mica>        ,      14400,  72000, 0, 10, 30, I , [], [101], [], []);
registerReservoir("Liquid Starlight (Mercury)", <liquid:astralsorcery.liquidstarlight>,maxInt/500,maxInt/100, 0, 10, 30, I , [], [101], [], []);
registerGasReservoir("Aluminium Slurry Reservoir (Terra Nova)", <gas:slurryAluminium>, 1228800000, maxInt, 0, 50, 30, II, [], [101], [], []);

# Venus ID=102
	/*
		gold ore 4.6%
		Pyrotheum
		volcanic island
*/
registerReservoir("Steam Reservoir (Venus)"         , <liquid:steam>    , 2000000000, maxInt, 0 , 800, 30,  I, [], [102], [], []);
registerReservoir("Pyrotheum Reservoir (Venus)"     , <liquid:pyrotheum>, 1228800000, maxInt, 0 , 200, 30,  I, [], [102], [], []);
registerReservoir("Hot NaK Reservoir (Venus)"       , <liquid:nak_hot>  , 250000    , 650000, 20, 200, 30,  I, [], [102], [], []);
registerGasReservoir("Gold Slurry Reservoir (Venus)", <gas:gold>        , 1228800000, maxInt, 0 , 50 , 30, II, [], [102], [], []);	

# Mars ID=103
	/*
		iron ore 12%
		ender draconium 7.4%
		oxedized feric
*/
registerGasReservoir("Oxygen Reservoir (Mars)"     , <gas:oxygen>, 1228800000, maxInt, 0 , 256, 1024, II, [], [103], [], []);
registerGasReservoir("Iron Slurry Reservoir (Mars)", <gas:iron>  , 1228800000, maxInt, 0 , 50 , 30  , II, [], [103], [], []);	

# Jupiter ID=104
		//Is not reachable with tpx command


# IO ID=105
	/*
		ender io metals
*/
registerReservoir("Molten Redstone Alloy Reservoir (IO)"              , <liquid:redstone_alloy>        , 1228800000, maxInt  , 0, 200, 50, II, [], [105], [], []);
registerReservoir("Molten Pulsating Iron Reservoir (IO)"              , <liquid:pulsating_iron>        , 1228800000, maxInt  , 0, 200, 50, II, [], [105], [], []);
registerReservoir("Molten Electrical Steel Reservoir (IO)"            , <liquid:electrical_steel>      , 1228800000, maxInt  , 0, 200, 50, II, [], [105], [], []);
registerReservoir("Molten Soularium Reservoir (IO)"                   , <liquid:soularium>             , 1228800000, maxInt  , 0, 200, 50, II, [], [105], [], []);
registerReservoir("Dark Steel Reservoir (IO)"                         , <liquid:dark_steel>            , 1228800000, maxInt  , 0, 200, 45, II, [], [105], [], []);
registerReservoir("Molten End Steel Reservoir (IO)"                   , <liquid:end_steel>             , 1228800000, maxInt  , 0, 200, 40, II, [], [105], [], []);
registerReservoir("Molten Conductive Iron Alloy Reservoir (IO)"       , <liquid:conductive_iron>       , 11520000  , 14400000, 0, 144, 35, II, [], [105], [], []);
registerReservoir("Molten Energetic Alloy Reservoir (IO)"             , <liquid:energetic_alloy>       , 8640000   , 11520000, 0, 144, 30, II, [], [105], [], []);
registerReservoir("Molten Vibrant Alloy Reservoir (IO)"               , <liquid:vibrant_alloy>         , 5760000   , 8640000 , 0, 20 , 25, II, [], [105], [], []);
registerReservoir("Molten Crystalline Alloy Reservoir (IO)"           , <liquid:crystalline_alloy>     , 1440000   , 2880000 , 0, 20 , 10, II, [], [105], [], []);
registerReservoir("Molten Crystalline Pink Slime Alloy Reservoir (IO)", <liquid:crystalline_pink_slime>, 720000    , 1440000 , 0, 20 , 6 , II, [], [105], [], []);
registerReservoir("Molten Melodic Alloy Reservoir (IO)"               , <liquid:melodic_alloy>         , 288000    , 720000  , 0, 20 , 2 , II, [], [105], [], []);

# Europa ID=106
	/*
		Copper ore 14%
		frozen ocean
*/
registerGasReservoir("Copper Slurry Reservoir (Europa)"     , <gas:copper>  , 1228800000, maxInt, 0     , 50     , 30, II, [], [106], [], []);
registerReservoir("High Pressure Aquifer Reservoir (Europa)", <liquid:water>, 1228800000, maxInt, 640000, 1280000, 30, II, [], [106], [], []);

# Saturn ID=107
		//Is not reachable with tpx command

# Titan ID=108
	/*
		Radioactive
*/
registerReservoir("Molten FLiBe Salt Solution of Depleted TBU Fluoride Fuel Reservoir (Titan)"    , <liquid:depleted_fuel_tbu_fluoride_flibe>    , 324000    , 453600, 2, 20, 5 , II, [], [108], [], []);
registerReservoir("Molten FLiBe Salt Solution of Depleted LEU-235 Fluoride Fuel Reservoir (Titan)", <liquid:depleted_fuel_leu_235_fluoride_flibe>, 324000    , 453600, 2, 20, 5 , II, [], [108], [], []);
registerGasReservoir("Magnesium Reservoir (Titan)"                                                , <gas:slurryMagnesium>                        , 1228800000, maxInt, 0, 50, 30, II, [], [108], [], []);
registerGasReservoir("Thorium Reservoir (Titan)"                                                  , <gas:slurryThorium>                          , 1228800000, maxInt, 0, 50, 30, II, [], [108], [], []);
registerGasReservoir("Boron Reservoir (Titan)"                                                    , <gas:slurryBoron>                            , 1228800000, maxInt, 0, 50, 30, II, [], [108], [], []);
registerGasReservoir("Lithium Reservoir (Titan)"                                                  , <gas:slurryLithium>                          , 1228800000, maxInt, 0, 50, 30, II, [], [108], [], []);
			

# Uranus ID=109
	/*
		Nickle ore 7.7%
		Cold
*/
registerGasReservoir("Nickel Slurry Reservoir (Uranus)", <gas:slurryNickel>, 1228800000, maxInt, 0, 50 , 30, II, [], [109], [], []);
registerReservoir("Liquid Cryotheum Reservoir (Uranus)", <liquid:cryotheum>, 1228800000, maxInt, 0, 200, 30,  I, [], [109], [], []);

# Neptune ID=110
	/*
		lapis ore 7%
		cloud seed
		Crushed Ice
		Cold
*/
registerReservoir("Molten Superium Reservoir (Neptune)", <liquid:superium>  , 21600   , 36000   , 0  , 5 , 5 , II, [], [110], [], []);
registerReservoir("IC2 Coolant Reservoir (Neptune)"    , <liquid:ic2coolant>, 15000000, 30000000, 25 , 50, 30, I , [], [110], [], []);

# Star Proxima Centaur
# Proxima B ID=111
	/*
		super cooled ice block
		emereld 0.16%
	
*/
registerReservoir("Nitrogen Reservoir (Proxima B)"                   , <liquid:nitrogen>   , 1228800000,   maxInt, 6400, 12800, 30,  I, [], [111], [], []);
registerReservoir("Helium Reservoir (Proxima B)"                     , <liquid:helium>     , 1228800000,   maxInt, 6400, 12800, 30,  I, [], [111], [], []);
registerReservoir("Molten Terrestrial Artifact Reservoir (Proxima B)", <liquid:terrestrial>,    1500000, 25000000, 0   , 200  , 5 , II, [], [111], [], []);

# Terra Nova ID=112
	/*
		cobalt ore 0.6%
		Rutile ore 1.3%
		cynanite block
*/
registerGasReservoir("Cobalt Slurry Reservoir (Terra Nova)", <gas:slurryCobalt>, 1228800000, maxInt, 0, 50, 30, II, [], [112], [], []);

# Novus ID=113
	/*
		coal ore 14.2%
		diamond 3.7%
		volcanic
		hot
*/
registerReservoir("Low Pressure Steam Reservoir (Novus)", <liquid:low_pressure_steam>, 2000000000, maxInt  , 0  , 800, 30,  I, [], [113], [], []);
registerReservoir("IC2 Hot Coolant Reservoir (Novus)"   , <liquid:ic2hot_coolant>    , 15000000  , 30000000, 25 , 50 , 30,  I, [], [113], [], []);
registerReservoir("Enriched Lava Reservoir (Novus)"     , <liquid:enrichedlava>      , 40000     , maxInt  , 0  , 20 , 10, II, [], [113], [], []);

# Stella ID=114
	/*
		Magic
*/
registerReservoir("Flux Goo Reservoir (Stella)", <liquid:flux_goo>, 750000, 1750000, 10, 200, 30, I, [], [114], [], []);

# Philucka ID=115
	/*
		resonant end stone 0.22
		redstone ore 13.44
*/
registerReservoir("Resonant Ender Reservoir (Philucka)", <liquid:ender>, 2000000, 4500000, 50, 2000, 30, I, [], [115], [], []);

# Hubble ID=116
		//Is not reachable with tpx command


# Star HD 42176
# KELT-1b ID=117
		//Is not reachable with tpx command


# KELT-2ab ID=118
	/*
		frozen ocean
*/
registerReservoir("Energized Glowstone Reservoir (KELT-2ab)"    	              , <liquid:glowstone>, 2000000   , 4500000, 50      , 2000     , 30,  I, [], [118], [], []);
registerGasReservoir("Hydrogen Gas Reservoir (KELT-2ab)"                        , <gas:hydrogen>    , 1228800000, maxInt , 256     , 1024     , 30, II, [], [118], [], []);
registerReservoirWithDrainChance("Extreme Pressure Aquifer Reservoir (KELT-2ab)", <liquid:water>    , 1800000000, maxInt , 50000000, 100000000, 0.85f, 25, II, [], [118], [], []);

# KELT-3 ID=119
	/*
		molen sulfer
		sodium
		faric sand
	 
*/
registerGasReservoir("Oxygen Reservoir (KELT-3)", <gas:oxygen>, 1228800000, maxInt, 0 , 256  , 1024, II, [], [119], [], []);
/*
<gas:sulfurdioxide>, Sulfur Dioxide
<gas:sulfurtrioxide>, Sulfur Trioxide
<gas:sulfuricacid>, Sulfuric Acid
*/


# Star HD 63776
# KELT-4ab ID=120
	/*
		cold
*/
registerReservoir("Hot Spring Water Reservoir (KELT-4ab)", <liquid:hot_spring_water>, 1228800000, maxInt, 1000, 2500, 30, I, [], [120], [], []);

# KELT-6a ID=121
	/*
		alien forest
*/
registerReservoir("Protein Reservoir (KELT-6a)"   , <liquid:protein>  , 265000, 530000, 0, 60, 30,  I, [], [121], [], []);
registerReservoir("Liquid DNA Reservoir (KELT-6a)", <liquid:liquiddna>, 85000 , 265000, 0, 60, 15, II, [], [121], [], []);
registerReservoir("Mutagen Reservoir (KELT-6a)"   , <liquid:mutagen>  , 85000 , 265000, 0, 60, 15, II, [], [121], [], []);

# Kepler 0118 ID=122
	/*
		Volcanic
		Hot
*/
registerReservoir("High Pressure Magma Chamber (Kepler 0118)"  				  , <liquid:lava>               , 800000    , 2500000, 500, 2500, 	    30,  I, [], [122], [], []);
registerReservoir("Enriched Lava Reservoir (Kepler 0118)"      				  , <liquid:enrichedlava>       , 140000    , maxInt , 0  , 40  , 	    10, II, [], [122], [], []);
registerReservoirWithDrainChance("High Pressure Steam Reservoir (Kepler 0118)", <liquid:high_pressure_steam>, 2000000000, maxInt , 0  , 800 , 0.5f, 20, II, [], [122], [], []);

# Kepler 0119 ID=123
	/*
		oxedised feric sand
*/
registerReservoir("Destabilized Redstone Reservoir (Kepler 0119)", <liquid:redstone>, 2000000   , 4500000, 50 , 2000 , 30,  I, [], [123], [], []);
registerGasReservoir("Oxygen Reservoir (Kepler 0119)"            , <gas:oxygen>     , 1228800000, maxInt , 256, 41024, 30, II, [], [123], [], []);	