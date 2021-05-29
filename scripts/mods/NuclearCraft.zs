import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.nuclearcraft.decay_generator.addRecipe as addDecayRecipe;
#modloaded nuclearcraft

# Removing an Obsidian dupe
mods.nuclearcraft.melter.removeRecipeWithInput(<ore:obsidian>);
mods.nuclearcraft.melter.removeRecipeWithInput(<ore:dustObsidian>);
mods.nuclearcraft.melter.addRecipe(<ore:obsidian>, <liquid:obsidian> * 144);

# Rhodochrosite
	scripts.wrap.actuallyadditions.AtomicReconstructor.addRecipe(<nuclearcraft:gem>, <biomesoplenty:gem:1>, 15000);

# Fluorite
	scripts.wrap.actuallyadditions.AtomicReconstructor.addRecipe(<nuclearcraft:gem:2>, <biomesoplenty:gem:2>, 15000);

# Rock Crusher
	recipes.remove(<nuclearcraft:rock_crusher_idle>);
	recipes.addShapedMirrored("Rock Crusher", 
	<nuclearcraft:rock_crusher_idle>, 
	[[<ore:plateDU>, <ore:motor>, <ore:plateDU>],
	[<ore:actuator>, <ore:chassis>, <ore:actuator>], 
	[<ore:plateDU>, <ore:motor>, <ore:plateDU>]]);

# Clay Dust
	mods.nuclearcraft.manufactory.addRecipe(<minecraft:clay>, <ic2:dust:1> * 4);
	mods.nuclearcraft.manufactory.removeRecipeWithOutput(<ic2:dust:1> * 2);

# A slight buff to the Deuterium recipe
	mods.nuclearcraft.electrolyser.addRecipe([<liquid:heavywater> * 1000, <liquid:deuterium> * 500,  <liquid:deuterium> * 500, <liquid:oxygen> * 500, <liquid:tritium> * 50]);
	mods.nuclearcraft.electrolyser.addRecipe([<liquid:ic2heavy_water> * 1000, <liquid:deuterium> * 500,  <liquid:deuterium> * 500, <liquid:oxygen> * 500, <liquid:tritium> * 50]);
	mods.nuclearcraft.electrolyser.addRecipe([<liquid:water> * 1000, <liquid:hydrogen> * 500, <liquid:hydrogen> * 500,  <liquid:deuterium> * 50, <liquid:oxygen> * 500]);
	mods.nuclearcraft.electrolyser.removeRecipeWithOutput([<liquid:deuterium> * 950, <liquid:oxygen> * 500, <liquid:tritium> * 50, null]);
	mods.nuclearcraft.electrolyser.removeRecipeWithOutput([<liquid:hydrogen> * 950, <liquid:deuterium> * 50, <liquid:oxygen> * 500, null]);

# Basic Plating
	recipes.remove(<nuclearcraft:part>);
	recipes.addShapedMirrored("Basic Plating", 
	<nuclearcraft:part> * 4, 
	[[<ore:blockSheetmetalLead>, <ic2:casing:4>, <ore:blockSheetmetalLead>],
	[<ic2:casing:4>, <ore:blockGraphite>, <ic2:casing:4>], 
	[<ore:blockSheetmetalLead>, <ic2:casing:4>, <ore:blockSheetmetalLead>]]);

# Copper Solenoid
	recipes.remove(<nuclearcraft:part:4>);
	recipes.addShapedMirrored("Copper Solenoid", 
	<nuclearcraft:part:4> * 4, 
	[[<ore:plateCopper>, <ic2:casing:1>, <ore:plateCopper>],
	[<ore:stickAluminum>, <ic2:ingot>, <ore:stickAluminum>], 
	[<ore:plateCopper>, <ic2:casing:1>, <ore:plateCopper>]]);

# Nuclearcraft Battery fix
	recipes.remove(<nuclearcraft:lithium_ion_battery_basic>);
	recipes.addShapedMirrored(<nuclearcraft:lithium_ion_battery_basic>, 
	[[<ore:plateBasic>, <nuclearcraft:lithium_ion_cell>, <ore:plateBasic>], 
	[<nuclearcraft:lithium_ion_cell>, <ore:solenoidMagnesiumDiboride>, <nuclearcraft:lithium_ion_cell>], 
	[<ore:plateBasic>, <nuclearcraft:lithium_ion_cell>, <ore:plateBasic>]
	]);

# [Alloy Furnace] from [Electric Furnace][+4]
craft.remake(<nuclearcraft:alloy_furnace_idle>, ["pretty",
  "B | B",
  "b E b",
  "B C B"], {
  "B": <ore:plateBasic>,     # Basic Plating
  "b": <ore:bioplastic>,     # Bioplastic
  "C": <ore:solenoidCopper>, # Copper Solenoid
  "E": <ic2:te:44>,          # Electric Furnace
  "|": <ic2:crafting:42>,    # Shaft (Bronze)
});

# [Empty Frame] from [Tin Gear][+2]
craft.remake(<nuclearcraft:part:11>, ["pretty",
  "□ ¤ □",
  "п   п",
  "□ ¤ □"], {
  "□": <ore:plateBasic>,      # Basic Plating
  "¤": <ore:gearTin>,         # Tin Gear
  "п": <enderio:block_reservoir>, # Endervoir
});

# Only leave Fluid fill recipe
recipes.remove(<nuclearcraft:water_source>);
scripts.process.fill(<nuclearcraft:part:11>, <fluid:water> * 2000, <nuclearcraft:water_source>, "only: Transposer");


# Add missing ingots/bricks to ingot former
	//Brick
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:clay>*144, <minecraft:brick>, 1.0, 1.0]);
	//Starmetal Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:starmetal>*144, <astralsorcery:itemcraftingcomponent:1>, 1.0, 1.0]);
	//Demon Metal Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:xu_demonic_metal>*144, <extrautils2:ingredients:11>, 2.0, 2.0]);
	//Enchanted Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:xu_enchanted_metal>*144, <extrautils2:ingredients:12>, 1.0, 1.0]);
	//Evil Infused Iron Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:xu_evil_metal>*144, <extrautils2:ingredients:17>, 1.0, 1.0]);
	//Fire Dragonsteel Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:dragonsteel_fire>*144, <iceandfire:dragonsteel_fire_ingot>, 1.0, 1.0]);
	//Ice Dragonsteel Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:dragonsteel_ice>*144, <iceandfire:dragonsteel_ice_ingot>, 1.0, 1.0]);
	//Pink Slime Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:molten_reinforced_pink_slime>*144, <industrialforegoing:pink_slime_ingot>, 1.0, 1.0]);
	//Refined Obsidian Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:refined_obsidian>*144, <mekanism:ingot>, 1.0, 1.0]);
	//Refined Glowstone Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:refined_glowstone>*144, <mekanism:ingot:3>, 1.0, 1.0]);
	//Base Essence Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:base_essence>*144, <mysticalagriculture:crafting:32>, 1.0, 1.0]);
	//Psimetal Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:psimetal>*144, <psi:material:1>, 1.0, 1.0]);
	//Fiery Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:fierymetal>*144, <twilightforest:fiery_ingot>, 1.0, 1.0]);
	//Seared Brick
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:stone>*72, <tconstruct:materials>, 1.0, 1.0]);
	//Mud Brick
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:dirt>*144, <tconstruct:materials:1>, 1.0, 1.0]);
	//Elementium Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:elementium>*144, <botania:manaresource:7>, 1.0, 1.0]);

# *======= Remove & Hide =======*
	
	utils.rh(<nuclearcraft:ore>);
	utils.rh(<nuclearcraft:ore:1>);
	utils.rh(<nuclearcraft:ore:2>);
	utils.rh(<nuclearcraft:ore:4>);
	utils.rh(<nuclearcraft:dust>);
	utils.rh(<nuclearcraft:dust:2>);
	utils.rh(<nuclearcraft:dust:1>);
	utils.rh(<nuclearcraft:ingot:4>);
	utils.rh(<nuclearcraft:ingot:2>);
	utils.rh(<nuclearcraft:ingot:1>);
	utils.rh(<nuclearcraft:dust:4>);
	utils.rh(<nuclearcraft:alloy>);
	utils.rh(<nuclearcraft:alloy:5>);
	utils.rh(<nuclearcraft:ingot>);

	
# Remove Unused alloy recipes from EnderIO
	mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:1>);
	mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:2>);
	mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:3>*2);
	mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:5>);
	mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:6>);



# Nuclearcraft Speed and Energy upgrades
recipes.remove(<nuclearcraft:upgrade>);
makeEx(<nuclearcraft:upgrade>*2, [
	[<ore:blockSheetmetalIron>, <ore:itemCompressedRedstone>, <ore:blockSheetmetalIron>], 
	[<ore:itemCompressedRedstone>, 
		<rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:speed", Duration: 9600, Amplifier: 0}]}) | 
		<rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:speed", Duration: 1800, Amplifier: 1}]}), 
	<ore:itemCompressedRedstone>], 
	[<ore:blockSheetmetalIron>, <ore:itemCompressedRedstone>, <ore:blockSheetmetalIron>]
]);

recipes.remove(<nuclearcraft:upgrade:1>);
makeEx(<nuclearcraft:upgrade:1>*2, [
	[<ore:blockSheetmetalGold>, <ore:itemCompressedObsidian>, <ore:blockSheetmetalGold>], 
	[<ore:itemCompressedObsidian>, 
		<rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:haste", Duration: 9600, Amplifier: 0}]}) | 
		<rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:haste", Duration: 1800, Amplifier: 1}]}), 
	<ore:itemCompressedObsidian>], 
	[<ore:blockSheetmetalGold>, <ore:itemCompressedObsidian>, <ore:blockSheetmetalGold>]
]);

# Fusion core with 3d prints
remake("NC Fusion core", <nuclearcraft:fusion_core>, [
	[<opencomputers:print>, <nuclearcraft:accelerator_electromagnet_idle>, <opencomputers:print>],
	[<nuclearcraft:chemical_reactor_idle>, <nuclearcraft:voltaic_pile_elite>, <nuclearcraft:chemical_reactor_idle>],
	[<opencomputers:print>, <nuclearcraft:accelerator_electromagnet_idle>, <opencomputers:print>]]);

	
# Blutonium
scripts.process.solution([<ic2:nuclear:7>, <actuallyadditions:item_crystal_empowered:1>, <thermalfoundation:material:136>], 
	[<liquid:cyanite> * (144*1)], [<liquid:plutonium> * (144/2)], [0.17, 1, 1, 3000], "only: highoven");

# Boron arsenid simplify recipe
scripts.process.solution([<ore:dustArsenic>], [<liquid:boron>*144], [<liquid:bas> * 666], [1, 6000], "only: highoven");
scripts.wrap.tconstruct.Casting.addTableRecipe(<ore:gemBoronArsenide>.firstItem, <tconstruct:cast_custom:2>, <liquid:bas>, 666, false);

# End stone dust compat
scripts.process.crush(<minecraft:end_stone>, <nuclearcraft:gem_dust:11>, "except: manufactory", null, null);

# HSLA ingots
scripts.process.alloy([<ore:ingotIron> * 15, <ore:dustCarbonManganese>], <ore:ingotHSLASteel>.firstItem * 16, "except: alloyFurnace");

# S'More ingredients processing
scripts.process.extract(<minecraft:porkchop>, <nuclearcraft:gelatin> * 8, "except: manufactory");
scripts.process.extract(<ore:fish>,           <nuclearcraft:gelatin> * 4, "except: manufactory");

scripts.process.crush(<nuclearcraft:roasted_cocoa_beans>, <nuclearcraft:ground_cocoa_nibs>, "except: manufactory", null, null);
recipes.addShapeless("Crush Cocoa", <nuclearcraft:ground_cocoa_nibs>, [<ore:pestleAndMortar>, <nuclearcraft:roasted_cocoa_beans>]);

scripts.process.squeeze([<nuclearcraft:ground_cocoa_nibs>], <liquid:cocoa_butter> * 144, "except: FluidExtractor", <nuclearcraft:cocoa_solids>);

scripts.process.compress(<harvestcraft:flouritem> * 2, <nuclearcraft:graham_cracker>, "except: Pressurizer");

# Electrolyzer recipes to other machines
scripts.process.electrolyze(<fluid:hydrofluoric_acid>  *1000, [<fluid:hydrogen>   *500, <fluid:fluorine>  *500], "except: NCElectrolyzer");
scripts.process.electrolyze(<fluid:naoh>               *666,  [<fluid:sodium>     *144, <fluid:oxygen>    *500, <fluid:water>*1000], "except: NCElectrolyzer");
scripts.process.electrolyze(<fluid:koh>                *666,  [<fluid:potassium>  *144, <fluid:water>     *1000], "except: NCElectrolyzer");
scripts.process.electrolyze(<fluid:alumina>            *144,  [<fluid:aluminum>   *288, <fluid:oxygen>    *3000], "except: NCElectrolyzer");
scripts.process.electrolyze(<fluid:heavywater>         *1000, [<fluid:deuterium>  *1000, <fluid:tritium>  *50, <fluid:oxygen>*500], "except: NCElectrolyzer");
scripts.process.electrolyze(<fluid:ic2heavy_water>     *1000, [<fluid:deuterium>  *1000, <fluid:tritium>  *50, <fluid:oxygen>*500], "except: NCElectrolyzer");

# Bioplastic process
scripts.process.extract(<ore:sugarcane> * 2, <ore:bioplastic>.firstItem, "except: manufactory extractor");

/* Patchouli_js('Liquids/IC2 fluids -> NC reactor', {
	icon: "ic2:te:18",
	type:  "item_list",
	...match_block_below(/^mods\.nuclearcraft\.(\w+)\.addRecipe\(\[<liquid:(.+?)>/gm)
    .reduce((o, m, i) => Object.assign(o, {
      [`item${i}`]: wrap_bucket(m[2]),
      [`text${i}`]: m[1]=="turbine"?"As Turbine steam":"As Exchanger Coolant",
    }),{}),
})*/
# IC2 Steam -> Water in turbine
# mods.nuclearcraft.turbine.addRecipe([fluidInput, fluidOutput, double powerPerMB, double expansionLevel]);
mods.nuclearcraft.turbine.addRecipe([<liquid:ic2superheated_steam>, <liquid:ic2steam> * 2, 1000.0d, 1.8d]);
mods.nuclearcraft.turbine.addRecipe([<liquid:ic2steam>, <liquid:low_quality_steam> * 2, 400.0d, 1.6d]);
# Heat exchanger
# mods.nuclearcraft.heat_exchanger.addRecipe([fluidInput, fluidOutput, double heatRequired, int temperatureIn, int temperatureOut]);
mods.nuclearcraft.heat_exchanger.addRecipe([<liquid:ic2hot_coolant>, <liquid:ic2coolant>, 10000.0d, 700, 300]);

# Harder compressed recipes
val compressed = [
	<nuclearcraft:rtg_americium>  , <notenoughrtgs:rtg_americium_compact>  , <notenoughrtgs:rtg_americium_dense>  ,
	<nuclearcraft:rtg_californium>, <notenoughrtgs:rtg_californium_compact>, <notenoughrtgs:rtg_californium_dense>,
	<nuclearcraft:rtg_plutonium>  , <notenoughrtgs:rtg_plutonium_compact>  , <notenoughrtgs:rtg_plutonium_dense>  ,
	<nuclearcraft:rtg_uranium>    , <notenoughrtgs:rtg_uranium_compact>    , <notenoughrtgs:rtg_uranium_dense>    ,
	<nuclearcraft:water_source>   , <nuclearcraft:water_source_compact>    , <nuclearcraft:water_source_dense>    ,
] as IItemStack[];

for i, output in compressed {
	if(i%3==0) continue;
	craft.remake(output, ["pretty",
		"x x x",
		"x ▬ x",
		"x x x"], {
		"x": compressed[i - 1],
		"▬": i%3==1 ? <ore:ingotHSLASteel> : <ore:gemBoronNitride>,
	});
}


# Decay generator as crafting method
addDecayRecipe([<contenttweaker:terrestrial_artifact_block>, <environmentaltech:litherite>  , 24000.0d, 36000.0d]);
addDecayRecipe([<environmentaltech:litherite>             , <actuallyadditions:block_misc:6>, 12000.0d, 18000.0d]);

# Radiation mutations
# Sadly, radiation mutations works really laggy and cant 
#   be implemented in heavy modpacks...
// for threshold, pair in {
// 	0.05d: {
// 		<ore:dirt> | <ore:grass> | <ore:gravel>: <nuclearcraft:dry_earth>,
// 		<ore:logWood> : <biomesoplenty:log_4:5>,
// 		<ore:treeLeaves> : <biomesoplenty:leaves_1:9>,
// 	},
// 	0.3d: {
// 		<ore:stone>: <twilightforest:deadrock>,
// 		<ore:gravel> | <ore:cobblestone> :<twilightforest:deadrock:1>,
// 		<ore:stoneGranite> | <ore:stoneDiorite> | <ore:stoneAndesite>: <twilightforest:deadrock:2>,
// 	}
// } as IItemStack[IIngredient][double] {
// 	for _from, _to in pair {
// 		mods.nuclearcraft.radiation.addBlockMutation(_from, _to, threshold);
// 	}
// }

# Supercooled Ice compat
scripts.process.fill(<ore:ice>, <fluid:liquidhelium> * 50, <nuclearcraft:block_ice>, "only: Transposer");

# ----------------------------------
# Remove worthless recipes
# ----------------------------------
for fluid in [
/*Inject_js(
(()=>{
  const fuels = getCSV('config/tellme/fluids-csv.csv')
		.map(l=>l.Name.match(/^fuel_(.*)_fluoride$/)?.[1])
    .filter(s=>s)

  return _.chunk(fuels, 5)
    .map(c=>'  ' + c.map(l=>('"'+l+'"').padStart(10)).join(','))
    .join(',\n')
})()
)*/
   "hea_242", "heb_248","hecf_249","hecf_251","hecm_243",
  "hecm_245","hecm_247", "hen_236", "hep_239", "hep_241",
   "heu_233", "heu_235", "lea_242", "leb_248","lecf_249",
  "lecf_251","lecm_243","lecm_245","lecm_247", "len_236",
   "lep_239", "lep_241", "leu_233", "leu_235",     "tbu"
/**/
] as string[] {
	mods.nuclearcraft.salt_mixer.removeRecipeWithOutput([
		game.getLiquid("depleted_fuel_"~fluid~"_fluoride_flibe")*288
	]);

	mods.nuclearcraft.chemical_reactor.removeRecipeWithOutput([
		game.getLiquid("depleted_fuel_"~fluid~"_fluoride")*144,  null
	]);

	mods.nuclearcraft.electrolyser.removeRecipeWithInput([
		game.getLiquid("fuel_"~fluid~"_fluoride")*144
	]);

	mods.nuclearcraft.centrifuge.removeRecipeWithInput([
		game.getLiquid("fuel_"~fluid~"_fluoride_flibe")*288
	]);

	if(fluid != "tbu")
		mods.nuclearcraft.centrifuge.removeRecipeWithInput([
			game.getLiquid("fuel_"~fluid)*144
		]);
}

for fluid in [
/*Inject_js(
(()=>{
  const fuels = getCSV('config/tellme/fluids-csv.csv')
		.map(l=>l.Name.match(/^(((?!fuel).)*)_fluoride_flibe$/)?.[1])
    .filter(s=>s)
		.sort((a, b) => b.length - a.length)

  return _.chunk(fuels, 3)
    .map(c=>'  ' + c.map(l=>('"'+l+'"').padStart(17)).join(','))
    .join(',\n')
})()
)*/
  "californium_249","californium_250","californium_251",
  "californium_252",  "americium_241",  "americium_242",
    "americium_243",  "berkelium_247",  "berkelium_248",
    "neptunium_236",  "neptunium_237",  "plutonium_238",
    "plutonium_239",  "plutonium_241",  "plutonium_242",
      "thorium_230",    "uranium_233",    "uranium_235",
      "uranium_238",     "curium_243",     "curium_245",
       "curium_246",     "curium_247",      "plutonium",
          "thorium",        "uranium"
/**/
] as string[] {
	mods.nuclearcraft.electrolyser.removeRecipeWithInput([
		game.getLiquid(fluid~"_fluoride")*144
	]);

	mods.nuclearcraft.centrifuge.removeRecipeWithInput([
		game.getLiquid(fluid~"_fluoride_flibe")*288
	]);
}

# Remove Niter recipe (way cheaper than any other)
mods.nuclearcraft.manufactory.removeRecipeWithOutput(<thermalfoundation:material:772> * 2);

# [Universal Bin] from [Boron Ingot][+1]
craft.remake(<nuclearcraft:bin>, ["pretty",
  "□ ▬ □",
  "▬   ▬",
  "□ ▬ □"], {
  "□": <ore:plateBasic>, # Basic Plating
  "▬": <ore:ingotBoron>, # Boron Ingot
});
