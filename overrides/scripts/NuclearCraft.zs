import mods.jei.JEI.removeAndHide as rh;
#modloaded nuclearcraft

# Removing an Obsidian dupe
mods.nuclearcraft.melter.removeRecipeWithInput(<ore:obsidian>);
mods.nuclearcraft.melter.removeRecipeWithInput(<ore:dustObsidian>);
mods.nuclearcraft.melter.addRecipe(<ore:obsidian>, <liquid:obsidian> * 144);

# Rhodochrosite
	mods.actuallyadditions.AtomicReconstructor.addRecipe(<nuclearcraft:gem>, <biomesoplenty:gem:1>, 15000);

# Fluorite
	mods.actuallyadditions.AtomicReconstructor.addRecipe(<nuclearcraft:gem:2>, <biomesoplenty:gem:2>, 15000);

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
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:refinedobsidian>*144, <mekanism:ingot>, 1.0, 1.0]);
	//Refined Glowstone Ingot
	mods.nuclearcraft.ingot_former.addRecipe([<liquid:refinedglowstone>*144, <mekanism:ingot:3>, 1.0, 1.0]);
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
	
	rh(<nuclearcraft:ore>);
	rh(<nuclearcraft:ore:1>);
	rh(<nuclearcraft:ore:2>);
	rh(<nuclearcraft:ore:4>);
	rh(<nuclearcraft:dust>);
	rh(<nuclearcraft:dust:2>);
	rh(<nuclearcraft:dust:1>);
	rh(<nuclearcraft:ingot:4>);
	rh(<nuclearcraft:ingot:2>);
	rh(<nuclearcraft:ingot:1>);
	rh(<nuclearcraft:dust:4>);
	rh(<nuclearcraft:alloy>);
	rh(<nuclearcraft:alloy:5>);
	rh(<nuclearcraft:ingot>);

	
# Remove Unused alloy recipes from EnderIO
	mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:1>);
	mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:2>);
	mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:3>*2);
	mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:5>);
	mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:6>);

# *=======  =======*


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

# Quartz -> [Quarts dust] (nuclearcraft) wrong output fix
val qwrong = <nuclearcraft:gem_dust:2>;
val qdust = <appliedenergistics2:material:3>;
recipes.removeByRecipeName("thermalfoundation:gem_dust");
mods.bloodmagic.AlchemyTable.removeRecipe([<minecraft:quartz_ore>, <bloodmagic:cutting_fluid>]);
mods.appliedenergistics2.Grinder.removeRecipe(<minecraft:quartz_ore>);
mods.immersiveengineering.Crusher.removeRecipesForInput(<minecraft:quartz>);
mods.mekanism.crusher.removeRecipe(qwrong);
mods.appliedenergistics2.Grinder.removeRecipe(<minecraft:quartz>);
scripts.process.crush(<ore:gemQuartz>, qdust, "only: iecrusher aegrinder mekcrusher", null, null);

# Bioplastic process
scripts.process.extract(<ore:sugarcane> * 2, <ore:bioplastic>.firstItem, "except: manufactory extractor");


# Supercooled Ice compat
scripts.process.fill(<ore:ice>, <fluid:liquidhelium> * 50, <nuclearcraft:block_ice>, "only: Transposer");

# ----------------------------------
# Remove worthless recipes
for fluid in [
   "hea_242", "heb_248","hecf_249","hecf_251","hecm_243",
  "hecm_245","hecm_247", "hen_236", "hep_239", "hep_241",
   "heu_233", "heu_235", "lea_242", "leb_248","lecf_249",
  "lecf_251","lecm_243","lecm_245","lecm_247", "len_236",
   "lep_239", "lep_241", "leu_233", "leu_235",     "tbu"
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
  "californium_249","californium_250","californium_251",
  "californium_252",  "americium_241",  "americium_242",
    "americium_243",  "berkelium_247",  "berkelium_248",
    "neptunium_236",  "neptunium_237",  "plutonium_238",
    "plutonium_239",  "plutonium_241",  "plutonium_242",
      "thorium_230",    "uranium_233",    "uranium_235",
      "uranium_238",     "curium_243",     "curium_245",
       "curium_246",     "curium_247",      "plutonium",
          "thorium",        "uranium"
] as string[] {
	mods.nuclearcraft.electrolyser.removeRecipeWithInput([
		game.getLiquid(fluid~"_fluoride")*144
	]);

	mods.nuclearcraft.centrifuge.removeRecipeWithInput([
		game.getLiquid(fluid~"_fluoride_flibe")*288
	]);
}
# ----------------------------------

# Add Immersive Tech Salt to Melter
// mods.nuclearcraft.melter.removeRecipeWithInput([itemInput]);
// mods.nuclearcraft.melter.removeRecipeWithOutput([fluidOutput]);
// mods.nuclearcraft.melter.removeAllRecipes();
// mods.nuclearcraft.melter.addRecipe([itemInput, fluidOutput, @Optional double timeMultiplier, @Optional double powerMultiplier, @Optional double processRadiation]);

mods.nuclearcraft.melter.removeRecipeWithInput(<mekanism:salt>);
mods.nuclearcraft.melter.removeRecipeWithInput(<harvestcraft:saltitem>);

var allSalts = <immersivetech:material> | <mekanism:salt> | <harvestcraft:saltitem>;

//mods.nuclearcraft.melter.addRecipe([<ore:dustSalt>,<liquid:brine> * 15, 0.25, 0.5]);
mods.nuclearcraft.melter.addRecipe([allSalts,<liquid:brine> * 15, 0.25, 0.5]);
