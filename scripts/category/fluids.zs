import mods.thermalexpansion.Crucible;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.nuclearcraft.melter;

#modloaded nuclearcraft thermalexpansion

	Crucible.addRecipe(<liquid:alumite> * 16, <plustic:alumitenugget>, 500);
	Crucible.addRecipe(<liquid:alumite> * 144, <plustic:alumiteingot>, 5000);
	Crucible.addRecipe(<liquid:alumite> * 1296, <plustic:alumiteblock>, 40000);
	Crucible.addRecipe(<liquid:osgloglas> * 16, <plustic:osgloglasnugget>, 500);
	Crucible.addRecipe(<liquid:osgloglas> * 144, <plustic:osgloglasingot>, 5000);
	Crucible.addRecipe(<liquid:osgloglas> * 1296, <plustic:osgloglasblock>, 40000);
	Crucible.addRecipe(<liquid:osmiridium> * 16, <plustic:osmiridiumnugget>, 500);
	Crucible.addRecipe(<liquid:osmiridium> * 144, <plustic:osmiridiumingot>, 5000);
	Crucible.addRecipe(<liquid:osmiridium> * 1296, <plustic:osmiridiumblock>, 40000);
	Crucible.addRecipe(<liquid:elementium> * 16, <botania:manaresource:19>, 500);
	Crucible.addRecipe(<liquid:elementium> * 144, <botania:manaresource:7>, 5000);
	Crucible.addRecipe(<liquid:elementium> * 1296, <botania:storage:2>, 40000);
	Crucible.addRecipe(<liquid:mirion> * 16, <plustic:mirionnugget>, 500);
	Crucible.addRecipe(<liquid:mirion> * 144, <plustic:mirioningot>, 5000);
	Crucible.addRecipe(<liquid:mirion> * 1296, <plustic:mirionblock>, 40000);
	Crucible.addRecipe(<liquid:psimetal> * 144, <psi:material:1>, 5000);
	Crucible.addRecipe(<liquid:psimetal> * 144, <psi:material:0>, 5000);
	Crucible.addRecipe(<liquid:psimetal> * 1296, <psi:psi_decorative:1>, 40000);
	Crucible.addRecipe(<liquid:psimetal> * 1296, <psi:psi_decorative:0>, 40000);
	Crucible.addRecipe(<liquid:infinity> * 144, <avaritia:resource:6>, 5000);
	Crucible.addRecipe(<liquid:infinity> * 1296, <avaritia:block_resource:1>, 40000);
	Crucible.addRecipe(<liquid:thaumium> * 16, <thaumcraft:nugget:6>, 500);
	Crucible.addRecipe(<liquid:thaumium> * 144, <thaumcraft:ingot:0>, 5000);
	Crucible.addRecipe(<liquid:thaumium> * 1296, <thaumcraft:metal_thaumium>, 40000);
	Crucible.addRecipe(<liquid:manasteel> * 16, <botania:manaresource:17>, 500);
	Crucible.addRecipe(<liquid:manasteel> * 144, <botania:manaresource:0>, 5000);
	Crucible.addRecipe(<liquid:manasteel> * 1296, <botania:storage:0>, 40000);
	Crucible.addRecipe(<liquid:terrasteel> * 16, <botania:manaresource:18>, 500);
	Crucible.addRecipe(<liquid:terrasteel> * 144, <botania:manaresource:4>, 5000);
	Crucible.addRecipe(<liquid:terrasteel> * 1296, <botania:storage:1>, 40000);
	Crucible.addRecipe(<liquid:purpleslime> * 250, <tconstruct:edible:2>, 2500);
	Crucible.addRecipe(<liquid:blood> * 40, <minecraft:rotten_flesh>, 2500);
	
	melter.addRecipe(<ore:nuggetAlumite>, <liquid:alumite> * 16);
	melter.addRecipe(<ore:ingotAlumite>, <liquid:alumite> * 144);
	melter.addRecipe(<ore:blockAlumite>, <liquid:alumite> * 1296);
	melter.addRecipe(<ore:nuggetOsgloglas>, <liquid:osgloglas> * 16);
	melter.addRecipe(<ore:ingotOsgloglas>, <liquid:osgloglas> * 144);
	melter.addRecipe(<ore:blockOsgloglas>, <liquid:osgloglas> * 1296);
	melter.addRecipe(<ore:nuggetOsmiridium>, <liquid:osmiridium> * 16);
	melter.addRecipe(<ore:ingotOsmiridium>, <liquid:osmiridium> * 144);
	melter.addRecipe(<ore:blockOsmiridium>, <liquid:osmiridium> * 1296);
	melter.addRecipe(<ore:nuggetElvenElementium>, <liquid:elementium> * 16);
	melter.addRecipe(<ore:ingotElvenElementium>, <liquid:elementium> * 144);
	melter.addRecipe(<botania:storage:2>, <liquid:elementium> * 1296);
	melter.addRecipe(<ore:nuggetMirion>, <liquid:mirion> * 16);
	melter.addRecipe(<ore:ingotMirion>, <liquid:mirion> * 144);
	melter.addRecipe(<ore:blockMirion>, <liquid:mirion> * 1296);
	melter.addRecipe(<psi:material:1>, <liquid:psimetal> * 144);
	melter.addRecipe(<psi:material:0>, <liquid:psimetal> * 144);
	melter.addRecipe(<psi:psi_decorative:1>, <liquid:psimetal> * 1296);
	melter.addRecipe(<psi:psi_decorative:0>, <liquid:psimetal> * 1296);
	melter.addRecipe(<ore:ingotInfinity>, <liquid:infinity> * 144);
	melter.addRecipe(<ore:blockInfinity>, <liquid:infinity> * 1296);
	melter.addRecipe(<ore:nuggetThaumium>, <liquid:thaumium> * 16);
	melter.addRecipe(<ore:ingotThaumium>, <liquid:thaumium> * 144);
	melter.addRecipe(<ore:blockThaumium>, <liquid:thaumium> * 1296);
	melter.addRecipe(<botania:storage:0>, <liquid:manasteel> * 1296);
	melter.addRecipe(<botania:storage:1>, <liquid:terrasteel> * 1296);
	melter.addRecipe(<ore:slimeballPurple>, <liquid:purpleslime> * 250);
	melter.addRecipe(<minecraft:rotten_flesh>, <liquid:blood> * 40);
	
#Make Rustic Honeycomb produce forestry honey
	mods.thermalexpansion.Centrifuge.removeRecipe(<rustic:honeycomb>);
	mods.thermalexpansion.Centrifuge.addRecipe([<rustic:beeswax> % 100], <rustic:honeycomb>, <liquid:for.honey> * 250, 2000);

	mods.forestry.Squeezer.removeRecipe(<liquid:honey>, [<rustic:honeycomb>]);
	mods.forestry.Squeezer.addRecipe(<liquid:for.honey> * 250, [<rustic:honeycomb>], 8);

	mods.rustic.CrushingTub.removeRecipe(<liquid:honey>, <rustic:honeycomb>);
	mods.rustic.CrushingTub.addRecipe(<liquid:for.honey> * 250, null, <rustic:honeycomb>);

# Make sure Botania molten metals can be casted
	mods.tconstruct.Casting.addBasinRecipe(<botania:storage:0>, null, <liquid:manasteel>, 1296);
	mods.tconstruct.Casting.addBasinRecipe(<botania:storage:1>, null, <liquid:terrasteel>, 1296);
	mods.tconstruct.Casting.addBasinRecipe(<botania:storage:2>, null, <liquid:elementium>, 1296);



# Chalice interactions
val chaliceGrid = {
  # First                      , Second                                                             , ⏩ + ⏩                                , ⏩ + 🔷                             , 🔷 + ⏩                      ,
[<liquid:cloud_seed_concentrated>*10,<liquid:water>                        *90]:[<additionalcompression:feather_compressed>  ,<twilightforest:wispy_cloud>                  ,<minecraft:clay>                                ],
[<liquid:cloud_seed_concentrated>*10,<liquid:lava>                         *90]:[<exnihilocreatio:block_endstone_crushed>    ,<minecraft:end_stone>                         ,<excompressum:compressed_block:7>               ],
[<liquid:cloud_seed_concentrated>*10,<liquid:astralsorcery.liquidstarlight>*90]:[<exnihilocreatio:block_dust>                ,<exnihilocreatio:block_andesite_crushed>      ,<excompressum:compressed_block>                 ],
[<liquid:lifeessence>            *10,<liquid:water>                        *90]:[<additionalcompression:cropapple_compressed>,<thaumcraft:flesh_block>                      ,<additionalcompression:spidereye_compressed>    ],
[<liquid:lifeessence>            *10,<liquid:lava>                         *90]:[<tconstruct:slime:3>                        ,<thaumcraft:flesh_block>                      ,<minecraft:nether_wart_block>                   ],
[<liquid:lifeessence>            *10,<liquid:astralsorcery.liquidstarlight>*90]:[<harvestcraft:honey>                        ,<harvestcraft:honeycomb>                      ,<biomesoplenty:honey_block>                     ],
[<liquid:lifeessence>            *10,<liquid:cloud_seed_concentrated>      *90]:[utils.tryCatch("animania:wool", 4, <minecraft:wool>), utils.tryCatch("animania:wool",2, <minecraft:wool>), utils.tryCatch("animania:wool", <minecraft:wool>)],
[<liquid:plasma>                 *10,<liquid:water>                        *90]:[<mekanism:saltblock>                        ,<additionalcompression:dustsugar_compressed:1>,<additionalcompression:dustgunpowder_compressed>],
[<liquid:plasma>                 *10,<liquid:lava>                         *90]:[<minecraft:magma>                           ,<additionalcompression:flint_compressed:1>    ,<additionalcompression:coal_compressed:2>       ],
[<liquid:plasma>                 *10,<liquid:astralsorcery.liquidstarlight>*90]:[<quark:sugar_block>                         ,<biomesoplenty:white_sand>                    ,<astralsorcery:blockmarble>                     ],
[<liquid:plasma>                 *10,<liquid:cloud_seed_concentrated>      *90]:[<enderio:block_fused_quartz>                ,<mysticalagriculture:storage:5>               ,<biomesoplenty:crystal>                         ],
[<liquid:plasma>                 *10,<liquid:lifeessence>                  *90]:[<excompressum:compressed_block:6>           ,<minecraft:bone_block>                        ,<iceandfire:dragon_bone_block>                  ],
[<liquid:ic2uu_matter>           *10,<liquid:water>                        *90]:[<quark:crystal:0>                           ,<quark:crystal:6>                             ,<actuallyadditions:block_crystal:2>             ],
[<liquid:ic2uu_matter>           *10,<liquid:lava>                         *90]:[<advancedrocketry:basalt>                   ,<draconicevolution:infused_obsidian>          ,<draconicevolution:draconium_block>             ],
[<liquid:ic2uu_matter>           *10,<liquid:astralsorcery.liquidstarlight>*90]:[<quark:marble>                              ,<minecraft:quartz_block>                      ,<thermalfoundation:storage:7>                   ],
[<liquid:ic2uu_matter>           *10,<liquid:cloud_seed_concentrated>      *90]:[<randomthings:superlubricentice>            ,<nuclearcraft:block_ice>                      ,<enderio:block_alloy:6>                         ],
[<liquid:ic2uu_matter>           *10,<liquid:lifeessence>                  *90]:[<additionalcompression:meatbeef_compressed> ,<minecraft:nether_wart_block>                 ,<tconevo:metal_block:5>                         ],
[<liquid:ic2uu_matter>           *10,<liquid:plasma>                       *90]:[<enderio:block_infinity>                    ,<minecraft:obsidian>                          ,<tconevo:metal_block:7>                         ],
} as IItemStack[][ILiquidStack[]];

#### Honorable mentions: ####
# liquid_sunshine
# cloud_seed_concentrated
# vibrant_alloy
# deuterium
# hydrofluoric_acid
# milk_chocolate
# honey
# blockfluiddirt
# mutagen
# dist_water
# if.pink_slime
# menrilresin
# liquidchorus
# witchwater
# xpjuice

# Defauls weights:
# 1200: lava + starlight = sand
#   70: lava + starlight = Aquamarine

# Weights by interaction type
var weights = [
	1200, # Flow+Flow
	70,   # Flow+Source
	2,    # Source+Flow
] as int[];

for lList, itList in chaliceGrid {
	for i, it in itList {
		# LiquidInteraction.addInteraction(ILiquidStack liquidIn1, float chanceConsumption1, ILiquidStack liquidIn2, float chanceConsumption2, int weight, IItemStack output);
		mods.astralsorcery.LiquidInteraction.addInteraction(lList[0], 0.1, lList[1], 0.2, weights[i], it);
	}

	# Liquid interactions:
	mods.plustweaks.Liquid.registerLiquidInteraction(lList[0], lList[1], itList[0].asBlock().definition.defaultState, false);
	mods.plustweaks.Liquid.registerLiquidInteraction(lList[1], lList[0], itList[0].asBlock().definition.defaultState, false);
}

for lList, itList in chaliceGrid {
	val b1 = Bucket(lList[0].name);
	val b2 = Bucket(lList[1].name);
	scripts.jei.mod.astralsorcery.add_everflow_chalice(b2, b1, itList);
	scripts.jei.liquids.interact(b1, b2, itList[0]);
}


# *======= Fuels =======*

/* Patchouli_js("Liquids/Smeltery Fuels", {
	item: "tconstruct:smeltery_controller",
	_text: `
		$(l)Smeltery/$ melting temperatures was tweaked. Some metals $(l)require/$ better fuels than $(#d31)lava/$.
		All fuels consume $(l)50/$mb.
		$(l)Temperature/$ of fuel affect melting speed.
		$(l)Time/$ is number of ticks fuel will burn.`});

Patchouli_js("Liquids/Smeltery Fuels",
  paged({
    item: "tconstruct:smeltery_controller",
    type: "item_list"
  }, 7, 
  from_crafttweaker_log(/Register Smeltery fuel. Temp: (?<temp>\d+), Burn time: (?<time>\d+), Name: (?<name>.*)/gm)
  .map(o=>o.groups)

	// Default fuels
	.concat([{temp:1300, time:80, name:"lava"}])

  .sort((a,b)=>b.temp*b.time - a.temp*a.time)
  .map(o=>[wrap_bucket(o.name), `${o.temp}°К, ${o.time} ticks`])
))*/

for pos, names in utils.graph([
# ↑ Duration
	"                                                          l           o        p",
	"       a              f  g                      k                               ",
	"                                           n           m                        ",
	"                                                                                ",
	"                   e         h   i                                              ",
	"         b c    d                                                               ",
	"                                                                                ",
	"*    q                               j                                          ",
	"1 2      3            4                     5                         6         ",
# ┣━━━━─━━━━┷━━━━─━━━━┻━━━━─━━━━┷━━━━─━━━━╋╋━━━━─━━━━┷━━━━─━━━━┻━━━━─━━━━┷━━━━─━━━━┫
# |500     2300      4100      5900      7800      9600      11400     13200  15000| Temp --->
],{
	x: {min: 500, max: 15000, step: 100},
	y: {min:   0, max:  1200, step: 100}
},{
	# Fuels
"*": ["steam"],
	q: ["canolaoil", "creosote"],
	a: ["ic2pahoehoe_lava"],
	b: ["biodiesel", "biofuel"],
	c: ["diesel", "ic2biogas", "refinedcanolaoil"],
	d: ["gasoline", "crystaloil"],
	e: ["boric_acid", "napalm", "refined_biofuel"],
	f: ["hydrofluoric_acid"],
	g: ["sulfuricacid"],
	h: ["bio.ethanol", "rocket_fuel"],
	i: ["refined_fuel"],
	j: ["pyrotheum"],
	m: ["rocketfuel"],
	k: ["ic2uu_matter", "enrichedlava"],
	l: ["neutron"],
	n: ["empoweredoil"],
	o: ["plasma", "perfect_fuel"],
	p: ["infinity_metal"],

	# Non-fuel Metals
	"1": [],
	"2": [],
	"3": ["osmium", "obsidian", "vibrant_alloy", "pulsating_iron", "end_steel"],
	"4": ["xu_demonic_metal", "mirion", "signalum", "lumium", "crystalline_alloy", "melodic_alloy", "crystalline_pink_slime"],
	"5": ["xu_enchanted_metal", "xu_evil_metal", "fierymetal"],
	"6": ["stellar_alloy", "osgloglas", "enderium", "gelid_enderium", "supremium"],
}) {
	for name in names {
		var temp = pos.x as int;
		var time = pos.y as int;
		var liquid = game.getLiquid(name);
		if(isNull(liquid)) continue;
		
		liquid.definition.temperature = temp;

		if (time != 0) {
			utils.log("Register Smeltery fuel. Temp: "~temp~", Burn time: "~time~", Name: "~name);
			mods.tconstruct.Fuel.registerFuel(liquid * 50, time);
		}
	}
}

# Easter Egg fuel
mods.tconstruct.Fuel.registerFuel(<liquid:seed> * 10, 500000);

# *============================*

/*

	Fuels in Combustion Generator

*/

val combustionGenerator_fuels = {
	# name: [power_per_tick, burn_time]

/*Inject_js(
[...
  (await getPDF('config/enderio/recipes/fuels.pdf'))
  .matchAll(/<recipe name="Fuel: .*\n.*?<fuel fluid="(\w+)" pertick="(\d+)" ticks="(\d+)".*\n.*?<\/recipe>/gm)
]
.sort((a,b)=>b[2]*b[3] - a[2]*a[3])
.map(function ([_, fluid, pertick, ticks]) {
  return this.some(({Name})=>Name===fluid) 
  ? `  ${fluid.padEnd(17)}: [${pertick.padStart(3)}, ${ticks.padStart(5)}],`
  : undefined
}, getCSV('config/tellme/fluids-csv.csv'))
.filter(l=>l)
)*/
  fire_water       : [ 80, 15000],
  refined_fuel     : [200,  6000],
  rocket_fuel      : [160,  7000],
  gasoline         : [160,  6000],
  empoweredoil     : [140,  6000],
  refined_biofuel  : [125,  6000],
  biodiesel        : [125,  6000],
  diesel           : [125,  6000],
  biofuel          : [125,  6000],
  refined_oil      : [100,  6000],
  crystaloil       : [ 80,  6000],
  hootch           : [ 60,  6000],
  crude_oil        : [ 50,  6000],
  tree_oil         : [ 50,  6000],
  oil              : [ 50,  6000],
  ic2biogas        : [ 50,  6000],
  coal             : [ 40,  6000],
  refinedcanolaoil : [ 40,  6000],
  creosote         : [ 20,  6000],
  seed_oil         : [ 20,  6000],
  canolaoil        : [ 20,  6000],
/**/
} as int[][string];


# Way harder [Rocket Fuel] recipe
mods.tconstruct.Alloy.addRecipe(<liquid:rocketfuel> * 1000, [
  <liquid:gasoline> * 1000,
  <liquid:syngas> * 1000,
  <liquid:liquidfusionfuel> * 200,
  <liquid:empoweredoil> * 200,
  <liquid:refined_fuel> * 200,
]);

# Craft for Enriched Lava as exploration alt
# [Enriched Lava Bucket] from [Molten Demon Metal Bucket][+3]
mods.tconstruct.Alloy.addRecipe(<liquid:enrichedlava> * 1000, [
  <liquid:ic2pahoehoe_lava>   * 2000, # Pahoehoe Lava
  <liquid:xu_demonic_metal>   * 1000, # Molten Demon Metal
  <liquid:xu_enchanted_metal> * 288,  # Enchanted Metal
  <liquid:sic_vapor>          * 250,  # Silicon Carbide Vapor
]);

# Perfect Fuel is best fluid fuel in game
mods.tconstruct.Alloy.addRecipe(<liquid:perfect_fuel>, [
  <liquid:rocketfuel>   * 40,
  <liquid:enrichedlava> * 40,
  <liquid:sunnarium>    * 10,
]);

# Usage for Perfect Fuel
mods.enderio.CombustionGen.addFuel(<fluid:perfect_fuel>, 20000, 1500000);
mods.thermalexpansion.MagmaticDynamo.addFuel(<fluid:perfect_fuel>, 2000000000);

val PF = <fluid:perfect_fuel>;
mods.nuclearcraft.fusion.addRecipe([PF * 1000, PF * 1000, PF * 1000, PF * 999, <fluid:flux_goo> * 1000, <fluid:blockfluidantimatter> * 1000, 2000.0, 350000.0, 16500.0]);
