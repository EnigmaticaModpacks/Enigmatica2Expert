#modloaded nuclearcraft

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

// Unused category
mods.jei.JEI.hideCategory('nuclearcraft_pebble_fission');

// <ore:ingotPlutonium239> <=> <ic2:nuclear:3>
<ore:ingotPlutonium239>.add(<ic2:nuclear:3>);
<ore:ingotPlutonium239All>.add(<ic2:nuclear:3>);
recipes.addShapeless('Plutonium conversion', <nuclearcraft:plutonium:5> * 2, [<ic2:nuclear:3>, <ic2:nuclear:3>]);

// ------------------------------------------------------------------
// Recipes and integrations
// ------------------------------------------------------------------

# [Basic Plating]*4 from [Graphite Block][+2]
craft.remake(<nuclearcraft:part> * 4, ["pretty",
  "□ ⌂ □",
  "⌂ ■ ⌂",
  "□ ⌂ □"], {
  "□": <ore:plateLead>,     # Lead Plate
  "⌂": <ic2:casing:4>,      # Lead Item Casing
  "■": <ore:blockGraphite>, # Graphite Block
});

# [Copper Solenoid]*4 from [Advanced Alloy][+3]
craft.remake(<nuclearcraft:part:4> * 4, ["pretty",
  "□ ⌂ □",
  "╱ п ╱",
  "□ ⌂ □"], {
  "□": <ore:plateCopper>,        # Copper Plate
  "⌂": <ic2:casing:1>,           # Copper Item Casing
  "╱": <ore:stickAluminum>,      # Aluminium Rod
  "п": <ore:plateAdvancedAlloy>, # Advanced Alloy
});

# [Alloy Furnace] from [Electric Furnace][+4]
craft.remake(<nuclearcraft:alloy_furnace>, ["pretty",
  "B | B",
  "b E b",
  "B C B"], {
  "B": <ore:plateBasic>,     # Basic Plating
  "b": <ore:bioplastic>,     # Bioplastic
  "C": <ore:solenoidCopper>, # Copper Solenoid
  "E": <ic2:te:44>,          # Electric Furnace
  "|": <ic2:crafting:42>,    # Shaft (Bronze)
});

# [Universal Bin] from [Boron Ingot][+1]
craft.remake(<nuclearcraft:bin>, ["pretty",
  "□ ▬ □",
  "▬   ▬",
  "□ ▬ □"], {
  "□": <ore:plateBasic>, # Basic Plating
  "▬": <ore:ingotBoron>, # Boron Ingot
});

# [Speed Upgrade] from [Base Upgrade][+2]
craft.remake(<nuclearcraft:upgrade>, ["pretty",
  "T ⌂ T",
  "⌂ B ⌂",
  "T ⌂ T"], {
  "T": <ic2:nuclear:5>,         # Tiny Pile of Uranium 235
  "⌂": <ic2:casing>,            # Bronze Item Casing
  "B": <mctsmelteryio:upgrade>, # Base Upgrade
});

# [Energy Upgrade] from [Base Upgrade][+2]
craft.remake(<nuclearcraft:upgrade:1>, ["pretty",
  "T ⌂ T",
  "⌂ B ⌂",
  "T ⌂ T"], {
  "T": <ic2:nuclear:5>,         # Tiny Pile of Uranium 235
  "⌂": <ic2:casing:5>,          # Steel Item Casing
  "B": <mctsmelteryio:upgrade>, # Base Upgrade
});

# Uranium RTG should require [Advanced Plating] instead of Basic
# [Uranium RTG] from [Uranium-238 Block][+2]
craft.remake(<nuclearcraft:rtg_uranium>, ["pretty",
  "□ ▬ □",
  "▬ ■ ▬",
  "□ ▬ □"], {
  "■": <ore:blockUranium238>, # Uranium-238 Block
  "□": <ore:plateAdvanced>,   # Advanced Plating
  "▬": <ore:ingotGraphite>,   # Graphite Ingot
});

# [Empty Frame] from [Tin Gear][+2]
craft.remake(<nuclearcraft:part:11>, ["pretty",
  "□ ¤ □",
  "п   п",
  "□ ¤ □"], {
  "□": <ore:plateBasic>,          # Basic Plating
  "¤": <ore:gearTin>,             # Tin Gear
  "п": <enderio:block_reservoir>, # Endervoir
});

# [Ingot Former] from [Machine Chassis][+3]
craft.remake(<nuclearcraft:ingot_former>, ["pretty",
  "□ C □",
  "S c S",
  "□ C □"], {
  "□": <ore:plateAdvanced>,       # Advanced Plating
  "C": <mctsmelteryio:machine:1>, # Casting Machine
  "S": <mctsmelteryio:upgrade:4>, # Slot Size Upgrade 4
  "c": <ore:chassis>,             # Machine Chassis
});

# [Machine Interface]*8 from [Machine Chassis]
craft.reshapeless(<nuclearcraft:machine_interface> * 8, "c", {
  "c": <ore:chassis>, # Machine Chassis
});

# [Chemical Reactor] from [Machine Chassis][+4]
craft.remake(<nuclearcraft:chemical_reactor>, ["pretty",
  "□ T □",
  "| c |",
  "□ a □"], {
  "□": <ore:plateAdvanced>,              # Advanced Plating
  "T": <ic2:nuclear:7>,                  # Tiny Pile of Plutonium
  "|": <ic2:crafting:42>,                # Shaft (Bronze)
  "c": <ore:chassis>,                    # Machine Chassis
  "a": <thermalfoundation:material:833>, # Tar
});

# [Supercooler] from [Machine Chassis][+4]
craft.remake(<nuclearcraft:supercooler>, ["pretty",
  "□ T □",
  "| c |",
  "□ ~ □"], {
  "□": <ore:plateAdvanced>, # Advanced Plating
  "T": <ic2:nuclear:7>,     # Tiny Pile of Plutonium
  "|": <ic2:crafting:42>,   # Shaft (Bronze)
  "c": <ore:chassis>,       # Machine Chassis
  "~": <fluid:ic2coolant> * 1000, # IC2 Coolant
});

# [Rock Crusher] from [Machine Chassis][+4]
craft.remake(<nuclearcraft:rock_crusher>, ["pretty",
  "□ T □",
  "| c |",
  "□ ■ □"], {
  "□": <ore:plateAdvanced>,        # Advanced Plating
  "T": <ic2:nuclear:7>,            # Tiny Pile of Plutonium
  "|": <ic2:crafting:42>,          # Shaft (Bronze)
  "c": <ore:chassis>,              # Machine Chassis
  "■": <mechanics:crushing_block>, # Crushing Block
});

# [Fission Reactor Casing]*64 from [Steel Chassis][+1]
craft.remake(<nuclearcraft:fission_casing> * 64, ["pretty",
  "  □  ",
  "□ ◙ □",
  "  □  "], {
  "□": <ore:plateBasic>, # Basic Plating
  "◙": <ore:steelFrame>, # Steel Chassis
});

# [Turbine Casing]*64 from [Steel Chassis][+1]
craft.remake(<nuclearcraft:turbine_casing> * 64, ["pretty",
  "  ▬  ",
  "▬ ◙ ▬",
  "  ▬  "], {
  "▬": <ore:ingotHSLASteel>, # HSLA Steel Ingot
  "◙": <ore:steelFrame>,     # Steel Chassis
});

# Removing an Obsidian dupe
mods.nuclearcraft.Melter.removeRecipeWithOutput(<fluid:obsidian> * 288);
mods.nuclearcraft.Melter.removeRecipeWithOutput(<fluid:obsidian> * 72);
mods.nuclearcraft.Melter.addRecipe(<ore:obsidian>, <liquid:obsidian> * 144);

# Remove charcoal to coal conversion
mods.nuclearcraft.Melter.removeRecipeWithInput(<nuclearcraft:dust:8>);
mods.nuclearcraft.Melter.removeRecipeWithInput(<bigreactors:blockgraphite>);

# Only leave Fluid fill recipe for Infinite water source
recipes.remove(<nuclearcraft:water_source>);
scripts.process.fill(<nuclearcraft:part:11>, <fluid:water> * 2000, <nuclearcraft:water_source>, "only: Transposer");

# [Dimensional Blend] from [Biome Essence]
recipes.remove(<nuclearcraft:compound:9>);
scripts.process.crush(<biomesoplenty:biome_essence>, <nuclearcraft:compound:9>, "only: eu2Crusher AACrusher IECrusher", [<thermalfoundation:material:66>], [0.25]);

if(!isNull(loadedMods["immersivetech"])) {
  mods.immersivetechnology.SolarTower.addRecipe(<liquid:sic_vapor> * 1000, <liquid:carbon_dioxide> * 1000, 100);
} else {
  mods.nuclearcraft.Enricher.addRecipe(<minecraft:coal>, <liquid:carbon_dioxide> * 1000, <liquid:sic_vapor> * 1000);
}

# Sic-Sic ingots
scripts.process.fill(<exnihilocreatio:item_mesh:2>, <fluid:sic_vapor> * 1000, <nuclearcraft:part:13>, "only: NCInfuser Transposer");
scripts.process.alloy([<ore:bouleSilicon>, <ore:fiberSiliconCarbide>], <nuclearcraft:alloy:14>, "only: advrockarc");

// Unify Silicon
<ore:itemSilicon>.remove(<nuclearcraft:gem:6>);
furnace.remove(<appliedenergistics2:material:5>, <nuclearcraft:gem_dust:2>); // Furnance quartz dusts -> AE silicon

# Boron arsenid simplify recipe
scripts.process.solution([<ore:dustArsenic>], [<liquid:boron>*144], [<liquid:bas> * 666], [1, 6000], "only: highoven");
mods.tconstruct.Casting.addTableRecipe(<ore:gemBoronArsenide>.firstItem, <tconstruct:cast_custom:2>, <liquid:bas>, 666, false);

# HSLA ingots
scripts.process.alloy([<ore:ingotIron> * 15, <ore:dustCarbonManganese>], <ore:ingotHSLASteel>.firstItem * 16, "except: alloyFurnace alloySmelter");

# Ground Cocoa
recipes.addShapeless("Crush Cocoa", <nuclearcraft:ground_cocoa_nibs>, [<ore:pestleAndMortar>, <nuclearcraft:roasted_cocoa_beans>, <nuclearcraft:roasted_cocoa_beans>]);
scripts.process.squeeze([<nuclearcraft:ground_cocoa_nibs>], <liquid:cocoa_butter> * 144, "except: FluidExtractor", <nuclearcraft:cocoa_solids>);
scripts.process.compress(<harvestcraft:flouritem> * 2, <nuclearcraft:graham_cracker>);

# IC2 Steam -> Water in turbine
# mods.nuclearcraft.Turbine.addRecipe(ILiquidStack fluidInput, ILiquidStack fluidOutput, double turbine_power_per_mb, double turbine_expansion_level, double turbine_spin_up_multiplier, @Optional String particleEffect, @Optional double particleSpeedMultiplier);
mods.nuclearcraft.Turbine.addRecipe(<liquid:ic2superheated_steam>, <liquid:ic2steam> * 2, 1000.0, 1.8, 1.0);
mods.nuclearcraft.Turbine.addRecipe(<liquid:ic2steam>, <liquid:low_quality_steam> * 2, 400.0, 1.6, 1.0);

# Harder compressed recipes
val compressed = [
  <nuclearcraft:water_source>, <nuclearcraft:water_source_compact>, <nuclearcraft:water_source_dense>,
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
# mods.nuclearcraft.DecayGenerator.addRecipe(IIngredient blockInput, IIngredient blockOutput, double meanLifetime, double power, double radiation);
mods.nuclearcraft.DecayGenerator.addRecipe(<contenttweaker:terrestrial_artifact_block>, <environmentaltech:litherite>  , 100.0, 8000000.0, 1.0);
mods.nuclearcraft.DecayGenerator.addRecipe(<environmentaltech:litherite>             , <actuallyadditions:block_misc:6>,  50.0,  400000.0, 1.0);

# Supercooled Ice compat
scripts.process.fill(<ore:ice>, <fluid:liquid_helium> * 50, <nuclearcraft:supercold_ice>, "only: Transposer");

# Alloy furnace missed Alum Brass recipe
mods.nuclearcraft.AlloyFurnace.addRecipe(<ore:ingotCopper>, <ore:ingotAluminum> * 3, <tconstruct:ingots:5> * 4);# [Aluminum Brass Ingot]
mods.nuclearcraft.AlloyFurnace.addRecipe(<ore:blockCopper>, <ore:blockAluminum> * 3, <tconstruct:metal:5> * 4); # [Block of Aluminum Brass]

# [Zirconium-Molybdenum Alloy Ingot] from [Molybdenum Dust][+1]
scripts.process.alloy([<ore:ingotZirconium>, <ore:dustMolybdenum> * 15], <nuclearcraft:alloy:16> * 16, "except: AlloyFurnace");

# [Zircaloy Ingot] from [Tin Ingot][+1]
scripts.process.alloy([<ore:ingotZirconium> * 7, <ore:ingotTin>], <nuclearcraft:alloy:12> * 8, "except: AlloyFurnace");

# Quartz -> [Quarts dust] (nuclearcraft) wrong output fix
mods.appliedenergistics2.Grinder.removeRecipe(<minecraft:quartz>);
mods.bloodmagic.AlchemyTable.removeRecipe([<minecraft:quartz_ore>, <bloodmagic:cutting_fluid>]);
mods.mekanism.crusher.removeRecipe(<nuclearcraft:gem_dust:2>);
scripts.process.crush(<ore:gemQuartz>, <appliedenergistics2:material:3>, "only: aegrinder mekcrusher", null, null);

# More melting compat
for ingr, fluid in {
  <ore:nuggetManyullyn>      : <fluid:manyullyn> * (144/9),
  <ore:ingotManyullyn>       : <fluid:manyullyn> * 144,
  <ore:blockManyullyn>       : <fluid:manyullyn> * (144*9),
  <threng:material>          : <fluid:fluix_steel> * 144,
  <ore:ingotInfinity>        : <fluid:infinity_metal> * 144,
  <ore:blockInfinity>        : <fluid:infinity_metal> * (144*9),
  <ore:nuggetAlumite>        : <liquid:alumite> * 16,
  <ore:ingotAlumite>         : <liquid:alumite> * 144,
  <ore:blockAlumite>         : <liquid:alumite> * 1296,
  <ore:nuggetOsgloglas>      : <liquid:osgloglas> * 16,
  <ore:ingotOsgloglas>       : <liquid:osgloglas> * 144,
  <ore:blockOsgloglas>       : <liquid:osgloglas> * 1296,
  <ore:nuggetOsmiridium>     : <liquid:osmiridium> * 16,
  <ore:ingotOsmiridium>      : <liquid:osmiridium> * 144,
  <ore:blockOsmiridium>      : <liquid:osmiridium> * 1296,
  <ore:nuggetElvenElementium>: <liquid:elementium> * 16,
  <ore:ingotElvenElementium> : <liquid:elementium> * 144,
  <botania:storage:2>        : <liquid:elementium> * 1296,
  <ore:nuggetMirion>         : <liquid:mirion> * 16,
  <ore:ingotMirion>          : <liquid:mirion> * 144,
  <ore:blockMirion>          : <liquid:mirion> * 1296,
  <psi:material:1>           : <liquid:psimetal> * 144,
  <psi:material:0>           : <liquid:psimetal> * 144,
  <psi:psi_decorative:1>     : <liquid:psimetal> * 1296,
  <psi:psi_decorative:0>     : <liquid:psimetal> * 1296,
  <ore:ingotInfinity>        : <liquid:infinity> * 144,
  <ore:blockInfinity>        : <liquid:infinity> * 1296,
  <ore:nuggetThaumium>       : <liquid:thaumium> * 16,
  <ore:ingotThaumium>        : <liquid:thaumium> * 144,
  <ore:blockThaumium>        : <liquid:thaumium> * 1296,
  <botania:storage:0>        : <liquid:manasteel> * 1296,
  <botania:storage:1>        : <liquid:terrasteel> * 1296,
  <ore:slimeballPurple>      : <liquid:purpleslime> * 250,
  <minecraft:rotten_flesh>   : <liquid:blood> * 40,
} as ILiquidStack[IIngredient] {
  mods.nuclearcraft.Melter.addRecipe(ingr, fluid);
}

// ------------------------------------------------------------------
// Alt recipes
// ------------------------------------------------------------------

# Rhodochrosite & Fluorite alt
mods.actuallyadditions.AtomicReconstructor.addRecipe(<nuclearcraft:gem>, <biomesoplenty:gem:1>, 15000);
mods.actuallyadditions.AtomicReconstructor.addRecipe(<nuclearcraft:gem:2>, <biomesoplenty:gem:2>, 15000);

# Boron Nitride shortcut with AdvRock machines
scripts.processUtils.avdRockXmlRecipeEx("ChemicalReactor", null, [<fluid:nitrogen> * 800, <fluid:hydrogen> * 2400], null, [<fluid:ammonia> * 16000], {power: 120000, timeRequired: 80});
scripts.processUtils.avdRockXmlRecipe("Crystallizer", [<ore:dustBoron> * 5], [<fluid:ammonia> * 5000], [<nuclearcraft:gem:1> * 10], null);

# Platings Laser Alternatives
scripts.processUtils.avdRockXmlRecipeEx("PrecisionLaserEtcher", [<ore:plateLead> * 12, <ore:dustCrystalBinder> * 32, <ore:ingotUranium238> * 32, <ore:ingotTough> * 32], null, [<nuclearcraft:part:3> * 8], null, {power: 160000, timeRequired: 20});
scripts.processUtils.avdRockXmlRecipeEx("PrecisionLaserEtcher", [<ore:plateLead> * 12, <ore:ingotUranium238> * 32, <ore:ingotTough> * 32], null, [<nuclearcraft:part:2> * 8], null, {power: 130000, timeRequired: 40});
scripts.processUtils.avdRockXmlRecipeEx("PrecisionLaserEtcher", [<ore:plateLead> * 12, <ore:ingotTough> * 32], null, [<nuclearcraft:part:1> * 8], null, {power: 100000, timeRequired: 60});
scripts.processUtils.avdRockXmlRecipeEx("PrecisionLaserEtcher", [<ore:plateLead> * 12, <ore:ingotGraphite> * 16], null, [<nuclearcraft:part> * 8], null, {power: 70000, timeRequired: 80});

// ----------------------------------------
// Ingot Former missing ingot recipes
// ----------------------------------------
for fluid, ingot in {
/*Inject_js{
if(cmd.block) return cmd.block
const existIngotRecipes = loadJson('exports/recipes/nuclearcraft_ingot_former.json')
  .recipes.map(r => r.output.items[0].stacks[0].name)
return loadJson('exports/recipes/tconstruct__casting_table.json')
  .recipes.map((r) => {
    if (r.output.items.some(i => i.stacks.some(s => existIngotRecipes.includes(s.name)))) return undefined
    if (!r.input.items.some(i => i.stacks.some(s => s.name === 'tconstruct:cast_custom:0'))) return undefined
    return [
      '  '+r.input.items.find(i => i.stacks.some(s => s.type === 'fluid')).stacks[0].name,
      `: <${r.output.items[0].stacks[0].name.replace(/:0$/, '')}>,`,
    ]
  })
  .filter(Boolean)
  .sort((a, b) => naturalSort(a[1], b[1]))
}*/
  stone                       : <tconstruct:materials> * 2,
  clay                        : <minecraft:brick>,
  fluix_steel                 : <threng:material>,
  starmetal                   : <astralsorcery:itemcraftingcomponent:1>,
  xu_demonic_metal            : <extrautils2:ingredients:11>,
  xu_enchanted_metal          : <extrautils2:ingredients:12>,
  xu_evil_metal               : <extrautils2:ingredients:17>,
  dragonsteel_fire            : <iceandfire:dragonsteel_fire_ingot>,
  dragonsteel_ice             : <iceandfire:dragonsteel_ice_ingot>,
  molten_reinforced_pink_slime: <industrialforegoing:pink_slime_ingot>,
  refined_obsidian            : <mekanism:ingot>,
  refined_glowstone           : <mekanism:ingot:3>,
  base_essence                : <mysticalagriculture:crafting:32>,
  psimetal                    : <psi:material:1>,
  fierymetal                  : <twilightforest:fiery_ingot>,
  dirt                        : <tconstruct:materials:1>,
  elementium                  : <botania:manaresource:7>,
  crystal_matrix              : <avaritia:resource:1>,
  neutronium                  : <avaritia:resource:4>,
  tungsten                    : <endreborn:item_ingot_wolframium>,
  heavy_metal                 : <mechanics:heavy_ingot>,
  electronics                 : <opencomputers:material:8>,
  spectre                     : <randomthings:ingredient:3>,
  fluxed_electrum             : <redstonearsenal:material:32>,
  gelid_enderium              : <redstonerepository:material:1>,
  draconic_metal              : <tconevo:metal:5>,
  chaotic_metal               : <tconevo:metal:10>,
  essence_metal               : <tconevo:metal:15>,
  primal_metal                : <tconevo:metal:20>,
  bound_metal                 : <tconevo:metal:25>,
  sentient_metal              : <tconevo:metal:30>,
  energetic_metal             : <tconevo:metal:35>,
  universal_metal             : <tconevo:metal:40>,
  wyvern_metal                : <tconevo:metal>,
  void_metal                  : <thaumcraft:ingot:1>,
  infinity_metal              : <avaritia:resource:6>,
/**/
} as IItemStack[string] {
  mods.nuclearcraft.IngotFormer.addRecipe(game.getLiquid(fluid) * 144, ingot, 1.0, 1.0);
}

// ------------------------------------------------------------
// Manufactory replacements
// ------------------------------------------------------------

# End stone dust compat
scripts.process.crush(<minecraft:end_stone>, <nuclearcraft:gem_dust:11>);

# Ground Cocoa
scripts.process.crush(<nuclearcraft:roasted_cocoa_beans>, <nuclearcraft:ground_cocoa_nibs>, null, null, null, {bonusType: "MULTIPLY_OUTPUT"});

# Bioplastic process
scripts.process.extract(<ore:sugarcane> * 2, <ore:bioplastic>.firstItem);

scripts.process.extract(<ore:dustVilliaumite>, <ore:dustSodiumFluoride>.firstItem);
scripts.process.extract(<ore:dustCarobbiite>, <ore:dustPotassiumFluoride>.firstItem);
scripts.process.extract(<ore:listAllporkraw>, <nuclearcraft:gelatin> * 8);
scripts.process.extract(<ore:listAllfishraw>, <nuclearcraft:gelatin> * 4);

// ------------------------------------------------------------
// Pressurizer replacements
// ------------------------------------------------------------
scripts.process.compress(<ore:dustRhodochrosite>, <nuclearcraft:gem>); # [Rhodochrosite]
scripts.process.compress(<ore:dustBoronNitride> , <nuclearcraft:gem:1>); # [Cubic Boron Nitride]
scripts.process.compress(<ore:dustFluorite>     , <nuclearcraft:gem:2>); # [Fluorite]
scripts.process.compress(<ore:dustVilliaumite>  , <nuclearcraft:gem:3>); # [Villiaumite]
scripts.process.compress(<ore:dustCarobbiite>   , <nuclearcraft:gem:4>); # [Carobbiite]
scripts.process.compress(<ore:dustStrontium90>*9, <qmd:strontium_90_block>); # [Strontium-90 Block]
scripts.process.compress(<ore:dustWitherite>    , <trinity:gem_witherite>); # [Witherite]

// ------------------------------------------------------------
// Fluid Extractor replacement
// ------------------------------------------------------------
# [Helium-3 Bucket] from [Gravel][+1]
scripts.process.squeeze([<ore:turfMoon>], <fluid:helium_3> * 250, "only: TECentrifuge");
mods.industrialforegoing.Extractor.add(<advancedrocketry:moonturf_dark>, <fluid:helium_3> * 5);
mods.industrialforegoing.Extractor.add(<advancedrocketry:moonturf>, <fluid:helium_3> * 5);

// ------------------------------------------------------------
// Electrolyzer replacement
// ------------------------------------------------------------
val elOpts = {energy: 20000, time: 2} as crafttweaker.data.IData;
scripts.process.electrolyze(<fluid:heavy_water> * 500, [<fluid:deuterium> * 500, <fluid:oxygen> * 250], null, elOpts);
scripts.process.electrolyze(<fluid:ic2heavy_water> * 500, [<fluid:deuterium> * 500, <fluid:oxygen> * 250], null, elOpts);
scripts.process.electrolyze(<fluid:hydrofluoric_acid> * 250, [<fluid:hydrogen> * 250, <fluid:fluorine> * 250], null, elOpts);
scripts.process.electrolyze(<fluid:naoh> * 333, [<fluid:sodium> * 72, <fluid:water> * 250, <fluid:oxygen> * 125], null, elOpts);
scripts.process.electrolyze(<fluid:koh> * 333, [<fluid:potassium> * 72, <fluid:water> * 250, <fluid:oxygen> * 125], null, elOpts);
scripts.process.electrolyze(<fluid:alumina> * 72, [<fluid:aluminum> * 144, <fluid:oxygen> * 750], null, elOpts);
scripts.process.electrolyze(<fluid:sodium_chloride_solution> * 1332, [<fluid:hydrogen> * 1000, <fluid:chlorine> * 1000, <fluid:sodium_hydroxide_solution> * 1332], null, elOpts);
scripts.process.electrolyze(<fluid:nitric_oxide> * 100, [<fluid:nitrogen> * 500, <fluid:oxygen> * 500], null, elOpts);

// ------------------------------------------------------------
// Remove worthless recipes
// ------------------------------------------------------------

// Unimplemented multiblocks
utils.rh(<nuclearcraft:heat_exchanger_controller>);
utils.rh(<nuclearcraft:condenser_controller>);
utils.rh(<nuclearcraft:fission_monitor>);
utils.rh(<nuclearcraft:fission_computer_port>);
utils.rh(<nuclearcraft:fission_shield_manager>);
utils.rh(<nuclearcraft:turbine_computer_port>);
utils.rh(<nuclearcraft:heat_exchanger_casing>);
utils.rh(<nuclearcraft:heat_exchanger_glass>);
utils.rh(<nuclearcraft:heat_exchanger_vent>);
utils.rh(<nuclearcraft:heat_exchanger_tube_copper>);
utils.rh(<nuclearcraft:heat_exchanger_tube_hard_carbon>);
utils.rh(<nuclearcraft:heat_exchanger_tube_thermoconducting>);
utils.rh(<nuclearcraft:heat_exchanger_computer_port>);
utils.rh(<nuclearcraft:condenser_tube_copper>);
utils.rh(<nuclearcraft:condenser_tube_hard_carbon>);
utils.rh(<nuclearcraft:condenser_tube_thermoconducting>);

// Alloy furnace meant to be only for blocks
// Remove all ingot and nugget recipes that have blocks
for alloy in [
  <thermalfoundation:material:163> * 4,
  <thermalfoundation:material:227> * 4,
  <tconstruct:ingots:2>,
  <tconstruct:nuggets:2>,
  <thermalfoundation:material:161> * 2,
  <thermalfoundation:material:225> * 2,
  <thermalfoundation:material:162> * 3,
  <thermalfoundation:material:226> * 3,
  <thermalfoundation:material:164> * 2,
  <thermalfoundation:material:228> * 2,
  <advancedrocketry:productingot> * 3,
  <advancedrocketry:productnugget> * 3,
  <thaumcraft:ingot:2> * 4,
  <advancedrocketry:productingot:1> * 2,
  <advancedrocketry:productnugget:1> * 2,
  <plustic:osmiridiumingot> * 2,
  <plustic:osmiridiumnugget> * 2,
  <immersiveengineering:metal:5> * 10,
  <nuclearcraft:ingot:5> * 12,
  <nuclearcraft:ingot:6> * 10,
  <nuclearcraft:ingot:7> * 9,
  <tconstruct:ingots:5> * 4,
] as IItemStack[] {
  mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(alloy);
}

// Pebble ingredients
utils.rh(<nuclearcraft:part:15>);
utils.rh(<nuclearcraft:alloy:13>);

// [mod][data_type][name][count]
val nuclearData = {
  nuclearcraft: {
    americium: 3,
    berkelium: 2,
    californium: 4,
    curium: 6,
    mixed: 2,
    neptunium: 2,
    plutonium: 4,
    thorium: 1,
    uranium: 4,
  },
  qmd: {
    copernicium: 1,
  }
} as int[string][string];

function get(mod as string, pfx as string, key as string, i as int) as IItemStack {
  val j = i * (pfx==''?5:pfx.endsWith('fuel_')?4:2);
  val item = itemUtils.getItem(mod+':'+pfx+key, j);
  if(isNull(item)) print('~~ this item doesnt exist: '+mod+':'+key+':'+j);
  return item;
}

for mod, types in nuclearData {
  for key, value in types {
    for i in 0 .. value {
      val isotope         = itemUtils.getItem(mod+':'+key, i*5);
      val isotope_carbide = itemUtils.getItem(mod+':'+key, i*5+1);
      val isotope_oxide   = itemUtils.getItem(mod+':'+key, i*5+2);
      val isotope_nitride = itemUtils.getItem(mod+':'+key, i*5+3);
      val isotope_zirc    = itemUtils.getItem(mod+':'+key, i*5+4);
      val  pellet         = itemUtils.getItem(mod+':pellet_'+key, i*2);
      val  pellet_carbide = itemUtils.getItem(mod+':pellet_'+key, i*2+1);
      val    fuel         = itemUtils.getItem(mod+':fuel_'+key, i*4);
      val    fuel_carbide = itemUtils.getItem(mod+':fuel_'+key, i*4+1);
      val    fuel_oxide   = itemUtils.getItem(mod+':fuel_'+key, i*4+2);
      val    fuel_nitride = itemUtils.getItem(mod+':fuel_'+key, i*4+3);

      // Remove unoxidation and unnitridation recipes
      if(!isNull(isotope)) furnace.remove(isotope);
      if(!isNull(pellet)) furnace.remove(pellet);
      if(!isNull(fuel)) furnace.remove(fuel);

      // Pebbles in fuel reprocessor
      if(key!='americium' && i!=2) {
        val pebble = itemUtils.getItem(mod+':depleted_fuel_'+key, i*4);
        mods.nuclearcraft.FuelReprocessor.removeRecipeWithInput(pebble * 9);
        utils.rh(pebble);
        mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(pellet_carbide);
        utils.rh(pellet_carbide);
      }

      if(key!='mixed' && key!='thorium'
        && !(key=='curium' && i >= 4)
        && !(key=='uranium' && i >= 3)
      ) {
        mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(isotope_carbide);
        if ((key=='americium' && i == 2)
          ||(key=='curium'    && (i == 1 || i == 2 || i == 3))
          ||(key=='neptunium' && (i == 1))
          ||(key=='plutonium' && (i == 1 || i == 2 || i == 3))
          ||(key=='uranium'   && (i == 0 || i == 1 || i == 2))
        ) {
          mods.nuclearcraft.DecayHastener.removeRecipeWithOutput(isotope_carbide);
        }
        utils.rh(isotope_carbide);
      }
    }
  }
}

// Concrete watering
for i in 0 .. 16 {
  mods.nuclearcraft.Infuser.removeRecipeWithOutput(<minecraft:concrete>.definition.makeStack(i));
}

val coolants = {
  // water       : 55,
  iron           : 50,
  redstone       : 85,
  quartz         : 80,
  obsidian       : 70,
  nether_brick   : 105,
  glowstone      : 90,
  lapis          : 100,
  gold           : 110,
  prismarine     : 115,
  slime          : 145,
  end_stone      : 65,
  purpur         : 95,
  diamond        : 200,
  emerald        : 195,
  copper         : 75,
  tin            : 120,
  lead           : 60,
  boron          : 160,
  lithium        : 130,
  magnesium      : 125,
  manganese      : 150,
  aluminum       : 175,
  silver         : 170,
  fluorite       : 165,
  villiaumite    : 180,
  carobbiite     : 140,
  arsenic        : 135,
  liquid_nitrogen: 185,
  liquid_helium  : 190,
  enderium       : 155,
  cryotheum      : 205,
} as int[string];

for coolant, cooling in coolants {
  mods.nuclearcraft.Centrifuge.removeRecipeWithInput(game.getLiquid(coolant+'_nak') * 144);
  val f = game.getLiquid(coolant+'_nak_fluoride_flibe');
  if(!isNull(f)) mods.nuclearcraft.Centrifuge.removeRecipeWithInput(f * 72);
}

for fluid in [
  'hea_242' , 'heb_248' , 'hecf_249', 'hecf_251',
  'hecm_243', 'hecm_245', 'hecm_247', 'hen_236',
  'hep_239' , 'hep_241' , 'heu_233' , 'heu_235',
  'lea_242' , 'leb_248' , 'lecf_249', 'lecf_251',
  'lecm_243', 'lecm_245', 'lecm_247', 'len_236',
  'lep_239' , 'lep_241' , 'leu_233' , 'leu_235',
  'mix_239' , 'mix_241' , 'tbu',
] as string[] {
  if(fluid != 'tbu')
    mods.nuclearcraft.Centrifuge.removeRecipeWithInput(game.getLiquid(fluid) * 144);
  
  // Add Electolyze recipes
  scripts.process.electrolyze(
    game.getLiquid('depleted_'+fluid+'_fluoride') * 72, [
      game.getLiquid('depleted_'+fluid) * 72,
      <fluid:fluorine> * 500
    ], null, elOpts);
}

// ------------------------------------------------------------
// HeatExchanger replacement
// ------------------------------------------------------------
mods.nuclearcraft.HeatExchanger.removeAllRecipes();

val waterRequired = {
  water             : 100,
  preheated_water   : 50,
  ic2hot_water      : 30,
  hot_spring_water  : 20,
  ic2distilled_water: 25,
  distwater         : 25,
} as int[string];

for coolant, cooling in coolants {
  val cold= game.getLiquid(coolant+'_nak');
  val hot = game.getLiquid(coolant+'_nak_hot');
  val HPS = <fluid:high_pressure_steam>;
  for fluid, amount in waterRequired {
    mods.immersivetechnology.HeatExchanger.addRecipe(
      cold * amount, HPS * (400 * cooling), hot * amount, game.getLiquid(fluid) * (100 * cooling), 32000, 2
    );
  }
}

// ------------------------------------------------------------
// Condenser replacement
// ------------------------------------------------------------
mods.nuclearcraft.Condenser.removeAllRecipes();
mods.immersivetechnology.Radiator.addRecipe(<liquid:condensate_water> * 100, <liquid:exhaust_steam> * 100, 4);
mods.immersivetechnology.Radiator.addRecipe(<liquid:condensate_water> * 100, <liquid:low_quality_steam> * 100, 4);

// ------------------------------------------------------------
// Piles and Batteries rework
// ------------------------------------------------------------

val pileIngrs = {
  "▬": <ore:ingotMagnesium>,            # Magnesium Ingot

  "0": <ic2:casing:1>,                  # Copper Item Casing
  "1": <ore:plateBasic>,                # Basic Plating
  "2": <ore:plateAdvanced>,             # Advanced Plating
  "3": <ore:plateDU>,                   # DU Plating
  "4": <ore:plateElite>,                # Elite Plating

  "I": <nuclearcraft:lithium_ion_cell>.withTag({}, false), # Lithium Ion Cell
  "S": <ore:solenoidMagnesiumDiboride>, # Magnesium Diboride Solenoid
} as IIngredient[string];

/*Inject_js{
  const list = config('config/nuclearcraft.Cfg').energy_storage.battery_block_capacity
  let i = 0
  return cmd.block.replace(/\s*capacity\s*:\s*\d+/g, (m,p) =>
    `capacity:${(''+list[i++]).padStart(10)}`
  )
}*/
val piles = [
  <nuclearcraft:voltaic_pile_basic>   .withTag({energyStorage: {capacity:   1600000 as long, energy: 0 as long}}),
  <nuclearcraft:voltaic_pile_advanced>.withTag({energyStorage: {capacity:   6400000 as long, energy: 0 as long}}),
  <nuclearcraft:voltaic_pile_du>      .withTag({energyStorage: {capacity:  25600000 as long, energy: 0 as long}}),
  <nuclearcraft:voltaic_pile_elite>   .withTag({energyStorage: {capacity: 102400000 as long, energy: 0 as long}}),
] as IItemStack[];

val batteries = [
  <nuclearcraft:lithium_ion_battery_basic>   .withTag({energyStorage: {capacity:  32000000 as long, energy: 0 as long}}),
  <nuclearcraft:lithium_ion_battery_advanced>.withTag({energyStorage: {capacity: 128000000 as long, energy: 0 as long}}),
  <nuclearcraft:lithium_ion_battery_du>      .withTag({energyStorage: {capacity: 512000000 as long, energy: 0 as long}}),
  <nuclearcraft:lithium_ion_battery_elite>   .withTag({energyStorage: {capacity:2048000000 as long, energy: 0 as long}}),
] as IItemStack[];
/**/

for i, item in piles {
  recipes.remove(item.withTag(null));
  craft.make(item, ['^','p','0'], {
    "^": i==0 ? pileIngrs['▬'] : piles[i - 1].withTag({}, false),
    "p": pileIngrs[''~(i+1)],
    "0": pileIngrs['0'],
  });
}

for i, item in batteries {
  recipes.remove(item.withTag(null));
  if(i==0)
    craft.make(item, ['I','1','S'], pileIngrs);
  else
    craft.make(item, [' p ','^^^',' S '], {
      "^": batteries[i - 1].withTag({}, false),
      "p": pileIngrs[''~(i+1)],
      "S": pileIngrs['S'],
    });
}

# --------------------------------------------------------------
# Radiation Shielding recipes
# --------------------------------------------------------------
function getUpdateFn(resistance as double) as crafttweaker.recipes.IRecipeFunction {
  return function(out, ins, cInfo) {
    if (isNull(ins)) return out;
    for mark, item in ins {
      if (isNull(item)) continue;
      return item.updateTag({ncRadiationResistance: resistance});
    }
    return out;
  } as crafttweaker.recipes.IRecipeFunction;
}
val armorPieces = [
  <conarm:helmet:*>,
  <conarm:chestplate:*>,
  <conarm:leggings:*>,
  <conarm:boots:*>,
] as IItemStack[];
val radPlates = [
  <nuclearcraft:rad_shielding>,
  <nuclearcraft:rad_shielding:1>,
  <nuclearcraft:rad_shielding:2>,
] as IItemStack[];
for i, plate in radPlates {
  val resistance = 0.03 * pow(10.0, i as double);
  val updFn = getUpdateFn(resistance);
  for armor in armorPieces {
    recipes.addShapeless('RadResist '~i~' '~armor.name,
      armor.withDamage(0).updateTag({ncRadiationResistance: resistance}),
      [armor.marked(''), plate], updFn, null
    );
  }
}
# --------------------------------------------------------------

# Radiation mutations
# Sadly, radiation mutations works really laggy and cant
#   be implemented in heavy modpacks...
// for threshold, pair in {
//   0.05d: {
//     <ore:dirt> | <ore:grass> | <ore:gravel>: <nuclearcraft:wasteland_earth>,
//     <ore:logWood> : <biomesoplenty:log_4:5>,
//     <ore:treeLeaves> : <biomesoplenty:leaves_1:9>,
//   },
//   0.3d: {
//     <ore:stone>: <twilightforest:deadrock>,
//     <ore:gravel> | <ore:cobblestone> :<twilightforest:deadrock:1>,
//     <ore:stoneGranite> | <ore:stoneDiorite> | <ore:stoneAndesite>: <twilightforest:deadrock:2>,
//   }
// } as IItemStack[IIngredient][double] {
//   for _from, _to in pair {
//     mods.nuclearcraft.Radiation.addBlockMutation(_from, _to, threshold);
//   }
// }
