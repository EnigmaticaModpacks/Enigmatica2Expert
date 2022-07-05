import scripts.requiousJei;

/*

https://github.com/TwistedGate/ImmersivePetroleum/wiki/%5B1.12.2-And-Older%5D-Modpack-Developers#fluid-reservoirs

public static void registerReservoir(String name, ILiquidStack fluid, int minSize, int maxSize, int replenishRate, int pumpSpeed, int weight,
		int[] dimBlacklist, int[] dimWhitelist, String[] biomeBlacklist, String[] biomeWhitelist);

		The name of the reservoir will act as a id, and it should be unique and not renamed. It will be saved in minecraft/saves/New Normal Overworld/data/ImmersiveEngineering-SaveData.dat,
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
var maxInt = 2147480000;

#Vanila
	requiousJei.registerPumpjackliquids("aquifer", <liquid:water>, 5000000, 10000000, 6, 25, 30,
		[], [0,1,7,-11325], [], []);

	requiousJei.registerPumpjackliquids("oil", <liquid:oil>, 2500000, 15000000, 6, 25, 40,
		[], [0,7,-11325], [], []);

	requiousJei.registerPumpjackliquids("lava", <liquid:lava>, 250000, 1000000, 0, 25, 30,
		[], [0,-1,7,-11325], [], []);


	requiousJei.registerPumpjackliquids("Desert Oil Reservoir", <liquid:oil>, 15000000, 30000000, 25 , 50, 5,
		[], [0], [], ["SANDY","HOT"]);

	requiousJei.registerPumpjackliquids("Deep Ocean Oil Reservoir", <liquid:oil>, 15000000, 30000000, 25 , 50, 5,
		[], [0], [], ["OCEAN","WET"]);
	

	requiousJei.registerPumpjackliquids("Low Pressure Magma Chamber (Nether)", <liquid:lava>, 500000, 1500000, 500, 1500, 5,
		[], [-1], [], []);


	requiousJei.registerPumpjackliquids("Molten Tungsten Reservoir (End)", <liquid:tungsten>, 12400000, 16400000, 0, 4, 10,
		[], [1], [], []);



#Deep Dark ID=-11325
	/*
	 	Black quartz ore 2.6%

	*/

	requiousJei.registerPumpjackliquids("Dark Steel Reservoir (Deep Dark)", <liquid:dark_steel>, 12400000, 16400000, 0, 100, 10,
		[], [-11325], [], []);


#Twilight Forest ID=7
	requiousJei.registerPumpjackliquids("Flux Goo Reservoir (Twilight Forest)", <liquid:flux_goo>, 35000, 750000, 0, 50, 20,
		[], [7], [], []);

#Star Sol
	#Luna ID=100
	/*
		Helium3
	
	 */

	    requiousJei.registerPumpjackliquids("Helium 3 Reservoir (Luna)", <liquid:helium3>, 25000, 2500000, 20, 35, 30,
		    [], [100], [], []);

	#Mercury ID=101
	/*
		aluminium 11%
		tin 8.66%
		energized N
		lava
		White sand

	 */

	 	requiousJei.registerPumpjackliquids("Liquid Mica (Mercury)", <liquid:mica>, 14400, 72000, 0, 10, 30,
		    [], [101], [], []);


	#Venus ID=102
	/*
		gold ore 4.6%
		Pyrotheum
		volcanic island

	 */

		requiousJei.registerPumpjackliquids("Steam Reservoir (Venus)", <liquid:steam>, 2000000000, maxInt, 0, 800, 30,
			[], [102], [], []);

		requiousJei.registerPumpjackliquids("Pyrotheum Reservoir (Venus)", <liquid:pyrotheum>, 1228800000, maxInt, 0, 200, 30,
			[], [102], [], []);

		requiousJei.registerPumpjackliquids("Hot NaK Reservoir (Venus)", <liquid:nak_hot>, 250000, 650000, 20, 200, 30,
			[], [102], [], []);	

	#Mars ID=103
	/*
		iron ore 12%
		ender draconium 7.4%
		oxedized feric

	*/
	#Jupiter ID=104
		//Is not reachable with tpx command


	#IO ID=105
	/*
		ender io metals

	 */
		requiousJei.registerPumpjackliquids("Molten Redstone Alloya Reservoir (IO)", <liquid:redstone_alloy>, 1228800000, maxInt, 0, 200, 50,
			[], [105], [], []);	

		requiousJei.registerPumpjackliquids("Molten Pulsating Iron Reservoir (IO)", <liquid:pulsating_iron>, 1228800000, maxInt, 0, 200, 50,
			[], [105], [], []);	


		requiousJei.registerPumpjackliquids("Molten Electrical Steel Reservoir (IO)", <liquid:electrical_steel>, 1228800000, maxInt, 0, 200, 50,
			[], [105], [], []);	

		requiousJei.registerPumpjackliquids("Molten Soularium Reservoir (IO)", <liquid:soularium>, 1228800000, maxInt, 0, 200, 50,
			[], [105], [], []);

		requiousJei.registerPumpjackliquids("Dark Steel Reservoir (IO)", <liquid:dark_steel>, 1228800000, maxInt, 0, 200, 45,
			[], [105], [], []);

		requiousJei.registerPumpjackliquids("Molten End Steel Reservoir (IO)", <liquid:end_steel>, 1228800000, maxInt, 0, 200, 40,
			[], [105], [], []);


		requiousJei.registerPumpjackliquids("Molten Conductive Iron Alloy Reservoir (IO)", <liquid:conductive_iron>, 11520000, 14400000, 0, 144, 35,
			[], [105], [], []);

		requiousJei.registerPumpjackliquids("Molten Energetic Alloy Reservoir (IO)", <liquid:energetic_alloy>, 8640000, 11520000, 0, 144, 30,
			[], [105], [], []);

		requiousJei.registerPumpjackliquids("Molten Vibrant Alloy Reservoir (IO)", <liquid:vibrant_alloy>, 5760000, 8640000, 0, 20, 25,
			[], [105], [], []);

		requiousJei.registerPumpjackliquids("Molten Crystalline Alloy Reservoir (IO)", <liquid:crystalline_alloy>, 1440000, 2880000, 0, 20, 10,
			[], [105], [], []);

		requiousJei.registerPumpjackliquids("Molten Crystalline Pink Slime Alloy Reservoir (IO)", <liquid:crystalline_pink_slime>, 720000, 1440000, 0, 20, 6,
			[], [105], [], []);

		requiousJei.registerPumpjackliquids("Molten Melodic Alloy Reservoir (IO)", <liquid:melodic_alloy>, 288000, 720000, 0, 20, 2,
			[], [105], [], []);





	#Europa ID=106
	/*
		Copper ore 14%
		frozen ocean

	 */

		requiousJei.registerPumpjackliquids("High Pressure Aquifer Reservoir (Europa)", <liquid:water>, 1228800000, maxInt, 64000, 128000, 30,
			[], [106], [], []);

	#Saturn ID=107
		//Is not reachable with tpx command

	#Titan ID=108
	/*
		Radioactive

	 */

		requiousJei.registerPumpjackliquids("Molten FLiBe Salt Solution of Depleted TBU Fluoride Fuel Reservoir (Titan)", <liquid:depleted_fuel_tbu_fluoride_flibe>, 324000, 453600, 2, 20, 5,
			[], [108], [], []);	

		requiousJei.registerPumpjackliquids("Molten FLiBe Salt Solution of Depleted LEU-235 Fluoride Fuel Reservoir (Titan)", <liquid:depleted_fuel_leu_235_fluoride_flibe>, 324000, 453600, 2, 20, 5,
			[], [108], [], []);				


		requiousJei.registerPumpjackliquids("Magnesium Reservoir (Titan)", <liquid:magnesium>, 1228800000, maxInt, 0, 4, 30,
			[], [108], [], []);

		requiousJei.registerPumpjackliquids("Thorium Reservoir (Titan)", <liquid:thorium>, 1228800000, maxInt, 0, 4, 30,
			[], [108], [], []);

		requiousJei.registerPumpjackliquids("Boron Reservoir (Titan)", <liquid:boron>, 1228800000, maxInt, 0, 4, 30,
			[], [108], [], []);

		requiousJei.registerPumpjackliquids("Lithium Reservoir (Titan)", <liquid:lithium>, 1228800000, maxInt, 0, 4, 30,
			[], [108], [], []);
			
			

	#Uranus ID=109
	/*
		Nickle ore 7.7%
		Cold

	 */
		requiousJei.registerPumpjackliquids("Liquid Cryotheum Reservoir (Uranus)", <liquid:cryotheum>, 1228800000, maxInt, 0, 200, 30,
			[], [109], [], []);


	#Neptune ID=110
	/*
		lapis ore 7%
		cloud seed
		Crushed Ice
		Cold

	 */

		requiousJei.registerPumpjackliquids("Molten Superium Reservoir (Neptune)", <liquid:superium>, 21600, 36000, 0, 5, 5,
			[], [110], [], []);

		requiousJei.registerPumpjackliquids("IC2 Coolant Reservoir (Neptune)", <liquid:ic2coolant>, 15000000, 30000000, 25 , 50, 30,
			[], [110], [], []);

#Star Proxima Centaur
	#Proxima B ID=111
	/*
		super cooled ice block
		emereld 0.16%
	
	 */

		requiousJei.registerPumpjackliquids("Liquid Helium Reservoir (Proxima B)", <liquid:liquidhelium>, 150000, 250000, 0, 200, 30,
			[], [111], [], []);

		requiousJei.registerPumpjackliquids("Molten Terrestrial Artifact Reservoir (Proxima B)", <liquid:water>, 15000, 25000, 0, 200, 5,
			[], [111], [], []);// todo

	#Terra Nova ID=112
	/*
		cobalt ore 0.6%
		Rutile ore 1.3%
		cynanite block

	 */


	#Novus ID=113
	/*
		coal ore 14.2%
		diamond 3.7%
		volcanic
		hot

	 */

		requiousJei.registerPumpjackliquids("Low Pressure Steam Reservoir (Venus)", <liquid:low_pressure_steam>, 2000000000, maxInt, 0, 800, 30,
			[], [113], [], []);	
 
		requiousJei.registerPumpjackliquids("IC2 Hot Coolant Reservoir (Neptune)", <liquid:ic2hot_coolant>, 15000000, 30000000, 25 , 50, 30,
			[], [113], [], []);

		requiousJei.registerPumpjackliquids("Enriched Lava Reservoir (Novus)", <liquid:enrichedlava>, 40000, maxInt, 0, 60, 10,
			[], [113], [], []);

	#Stella ID=114
	/*
		Magic

	 */
		requiousJei.registerPumpjackliquids("Flux Goo Reservoir (Stella)", <liquid:flux_goo>, 750000, 750000, 10, 200, 30,
			[], [114], [], []);

	#Philucka ID=115
	/*
		resonant end stone 0.22
		redstone ore 13.44

	 */

		requiousJei.registerPumpjackliquids("Resonant Ender Reservoir (Philucka)", <liquid:ender>, 2000000, 4500000, 50, 2000, 30,
			[], [115], [], []);

	#Hubble ID=116
		//Is not reachable with tpx command



#Star HD 42176
	#KELT-1b ID=117
		//Is not reachable with tpx command


	#KELT-2ab ID=118
	/*
		frozen ocean

	 */

	 	requiousJei.registerPumpjackliquids("Energized Glowstone Reservoir (KELT-2ab)", <liquid:glowstone>, 2000000, 4500000, 50, 2000, 30,
			[], [118], [], []);

	 	requiousJei.registerPumpjackliquids("Extreme Pressure Aquifer Reservoir (KELT-2ab)", <liquid:water>, 1800000000, maxInt, 5000000, 10000000, 25,
			[], [118], [], []);


	#KELT-3 ID=119
	/*
		molen sulfer
		sodium
		faric sand
	 
	 */


#Star HD 63776
	#KELT-4ab ID=120
	/*
		cold

	 */
		requiousJei.registerPumpjackliquids("Hot Spring Water Reservoir (KELT-4ab)", <liquid:hot_spring_water>, 1228800000, maxInt, 1000, 2500, 30,
			[], [110], [], []);

	#KELT-6a ID=121
	/*
		alien forest
		
	 */

		requiousJei.registerPumpjackliquids("Molten Tungsten Reservoir (KELT-6a)", <liquid:tungsten>, 1228800000, maxInt, 0, 4, 30,
			[], [121], [], []);

		requiousJei.registerPumpjackliquids("Liquid DNA Reservoir (KELT-6a)", <liquid:liquiddna>, 85000, 265000, 0, 60, 25,
			[], [121], [], []);
		
		requiousJei.registerPumpjackliquids("Mutagen Reservoir (KELT-6a)", <liquid:mutagen>, 85000, 265000, 0, 60, 25,
			[], [121], [], []);


	#Kepler 0118 ID=122
	/*
		Volcanic
		Hot

	 */

		requiousJei.registerPumpjackliquids("High Pressure Magma Chamber (Kepler 0118)", <liquid:lava>, 800000, 2500000, 500, 2500, 30,
			[], [122], [], []);

		requiousJei.registerPumpjackliquids("Enriched Lava Reservoir (Kepler 0118)", <liquid:enrichedlava>, 140000, maxInt, 0, 120, 10,
			[], [122], [], []);

		requiousJei.registerPumpjackliquids("High Pressure Steam Reservoir (Kepler 0118)", <liquid:high_pressure_steam>, 2000000000, maxInt, 0, 800, 20,
			[], [122], [], []);


	#Kepler 0119 ID=123
	/*
		oxedised feric sand
	
	 */
		requiousJei.registerPumpjackliquids("Destabilized Redstone Reservoir (Kepler 0119)", <liquid:redstone>, 2000000, 4500000, 50, 2000, 30,
			[], [123], [], []);	
