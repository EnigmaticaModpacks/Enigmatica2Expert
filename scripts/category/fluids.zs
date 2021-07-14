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
	scripts.wrap.thermalexpansion.Centrifuge.addRecipe([<rustic:beeswax> % 100], <rustic:honeycomb>, <liquid:for.honey> * 250, 2000);

	mods.forestry.Squeezer.removeRecipe(<liquid:honey>, [<rustic:honeycomb>]);
	scripts.wrap.forestry.Squeezer.addRecipe(<liquid:for.honey> * 250, [<rustic:honeycomb>], 8);

	mods.rustic.CrushingTub.removeRecipe(<liquid:honey>, <rustic:honeycomb>);
	mods.rustic.CrushingTub.addRecipe(<liquid:for.honey> * 250, null, <rustic:honeycomb>);

# Make sure Botania molten metals can be casted
	scripts.wrap.tconstruct.Casting.addBasinRecipe(<botania:storage:0>, null, <liquid:manasteel>, 1296);
	scripts.wrap.tconstruct.Casting.addBasinRecipe(<botania:storage:1>, null, <liquid:terrasteel>, 1296);
	scripts.wrap.tconstruct.Casting.addBasinRecipe(<botania:storage:2>, null, <liquid:elementium>, 1296);



# Chalice interactions
val chaliceGrid = {
  # First                      , Second                                                             , ⏩ + ⏩                                , ⏩ + 🔷                             , 🔷 + ⏩                      ,
[<liquid:cloud_seed_concentrated>*10,<liquid:water>                        *90]:[<additionalcompression:feather_compressed>  ,<twilightforest:wispy_cloud>                  ,<minecraft:clay>                                ],
[<liquid:cloud_seed_concentrated>*10,<liquid:lava>                         *90]:[<exnihilocreatio:block_endstone_crushed>    ,<minecraft:end_stone>                         ,<excompressum:compressed_block:7>               ],
[<liquid:cloud_seed_concentrated>*10,<liquid:astralsorcery.liquidstarlight>*90]:[<exnihilocreatio:block_dust>                ,<exnihilocreatio:block_andesite_crushed>      ,<excompressum:compressed_block>                 ],
[<liquid:lifeessence>            *10,<liquid:water>                        *90]:[<additionalcompression:cropapple_compressed>,<thaumcraft:flesh_block>                      ,<additionalcompression:spidereye_compressed>    ],
[<liquid:lifeessence>            *10,<liquid:lava>                         *90]:[<tconstruct:slime:3>                        ,<thaumcraft:flesh_block>                      ,<minecraft:nether_wart_block>                   ],
[<liquid:lifeessence>            *10,<liquid:astralsorcery.liquidstarlight>*90]:[<harvestcraft:honey>                        ,<harvestcraft:honeycomb>                      ,<biomesoplenty:honey_block>                     ],
[<liquid:lifeessence>            *10,<liquid:cloud_seed_concentrated>      *90]:[<animania:wool:4>                           ,<animania:wool:2>                             ,<animania:wool>                                 ],
[<liquid:plasma>                 *10,<liquid:water>                        *90]:[<mekanism:saltblock>                        ,<additionalcompression:dustsugar_compressed:1>,<additionalcompression:dustgunpowder_compressed>],
[<liquid:plasma>                 *10,<liquid:lava>                         *90]:[<minecraft:magma>                           ,<additionalcompression:flint_compressed:1>    ,<additionalcompression:coal_compressed:2>       ],
[<liquid:plasma>                 *10,<liquid:astralsorcery.liquidstarlight>*90]:[<quark:sugar_block>                         ,<biomesoplenty:white_sand>                    ,<astralsorcery:blockmarble>                     ],
[<liquid:plasma>                 *10,<liquid:cloud_seed_concentrated>      *90]:[<enderio:block_fused_quartz>                ,<mysticalagriculture:storage:5>               ,<biomesoplenty:crystal>                         ],
[<liquid:plasma>                 *10,<liquid:lifeessence>                  *90]:[<excompressum:compressed_block:6>           ,<minecraft:bone_block>                        ,<iceandfire:dragon_bone_block>                  ],
[<liquid:ic2uu_matter>           *10,<liquid:water>                        *90]:[<quark:crystal:5>                           ,<quark:crystal:6>                             ,<actuallyadditions:block_crystal:2>             ],
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
	scripts.requiousJei.add_everflow_chalice(b2, b1, itList);
	scripts.requiousJei.add_liquid_interaction(b1, b2, itList[0]);
}