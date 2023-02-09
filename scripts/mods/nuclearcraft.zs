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
scripts.process.compress(<harvestcraft:flouritem> * 2, <nuclearcraft:graham_cracker>, "except: Pressurizer");

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
// Remove worthless recipes
// ------------------------------------------------------------


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
