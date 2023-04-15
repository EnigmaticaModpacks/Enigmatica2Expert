#modloaded qmd

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.nuclearcraft.ChanceItemIngredient;

utils.rh(<qmd:ingot:3>); // Titanium Ingot

# [BSCCO Wire]*6 from [Silver Plate][+1]
mods.immersiveengineering.Blueprint.addRecipe('components', <qmd:part:4> * 2, Grid(["▲□□"], {
  "▲": <qmd:chemical_dust:1>, # BSCCO Dust
  "□": <ore:plateSilver>, # Silver Plate
}).shapeless());

# [Gold Plated Tungsten Wire]*6 from [Gold Item Casing][+1]
mods.immersiveengineering.Blueprint.addRecipe('components', <qmd:part:6> * 6, Grid(["▬▬▬▬⌂⌂"], {
  "▬": <ore:ingotTungsten>, # Tungsten Ingot
  "⌂": <ic2:casing:2>,      # Gold Item Casing
}).shapeless());

# [BSCCO Dust]*3 from [Copper Oxide][+3]
craft.shapeless(<qmd:chemical_dust:1> * 3, "∆♠∆▲♠▲♣♠♣", {
  "∆": <ore:dustBismuth>,     # Bismuth Dust
  "▲": <ore:dustStrontium>,   # Strontium Dust
  "♣": <ore:dustCalcium>,     # Calcium Dust
  "♠": <ore:dustCopperOxide>, # Copper Oxide
});

# [Plastic Scintillator] from [Blue Dye][+1]
scripts.process.alloy([<ore:dyeBlue>, <ore:bioplastic>, <ore:bioplastic>], <qmd:part:3>);

# [Basic Processor] from [N-Type Doped Silicon][+3]
craft.make(<qmd:semiconductor:4> * 4, ["NF","⌂F","□F"], {
  "N": <ore:siliconNDoped>,     # N-Type Doped Silicon
  "F": <fluxnetworks:flux>,     # Flux
  "⌂": <forestry:chipsets:3>.withTag({T: 3 as short}, false), # Intricate Circuit Board
  "□": <ore:circuitUltimate>, # Ultimate Control Circuit
});

# [Advanced Processor] from [P-Type Doped Silicon][+3]
craft.make(<qmd:semiconductor:5>, ["BF","▲F","PF"], {
  "B": <ore:processorBasic>,    # Basic Processor
  "F": <fluxnetworks:flux>,     # Flux
  "▲": <ore:dustHafniumOxide>,  # Hafnium Oxide
  "P": <ore:siliconPDoped>,     # P-Type Doped Silicon
});

# [Elite Processor] from [Platinum Plate][+3]
craft.make(<qmd:semiconductor:6>, ["AB","▲B","□B"], {
  "A": <ore:processorAdvanced>, # Advanced Processor
  "B": <ore:wireBSCCO>,         # BSCCO Wire
  "▲": <ore:dustHafniumOxide>,  # Hafnium Oxide
  "□": <ore:platePlatinum>,     # Platinum Plate
});

# [Accelerator Casing]*64 from [Steel Chassis][+2]
craft.remake(<qmd:accelerator_casing> * 64, ["pretty",
  "▬ - ▬",
  "- ◙ -",
  "▬ - ▬"], {
  "▬": <ore:ingotStainlessSteel>, # Stainless Steel Ingot
  "-": <ore:ingotTough>,          # Tough Alloy Ingot
  "◙": <ore:steelFrame>,          # Steel Chassis
});

# [Particle Chamber Casing]*64 from [Steel Chassis][+2]
craft.remake(<qmd:particle_chamber_casing> * 64, ["pretty",
  "▬ - ▬",
  "- ◙ -",
  "▬ - ▬"], {
  "▬": <ore:ingotStainlessSteel>, # Stainless Steel Ingot
  "-": <ore:ingotTungsten>,       # Tungsten Ingot
  "◙": <ore:steelFrame>,          # Steel Chassis
});

# [Vacuum Chamber Casing]*64 from [Steel Chassis][+3]
craft.remake(<qmd:containment_casing> * 64, ["pretty",
  "▬ _ ▬",
  "- ◙ -",
  "▬ _ ▬"], {
  "▬": <ore:ingotOsmiridium>,     # Osmiridium Ingot
  "_": <ore:ingotTough>,          # Tough Alloy Ingot
  "-": <ore:ingotStainlessSteel>, # Stainless Steel Ingot
  "◙": <ore:steelFrame>,          # Steel Chassis
});

# [Strontium RTG] from [Strontium-90 Block][+2]
craft.remake(<qmd:rtg_strontium>, ["pretty",
  "□ P □",
  "P ■ P",
  "□ P □"], {
  "□": <ore:plateElite>,       # Elite Plating
  "P": <ore:siliconPDoped>,    # P-Type Doped Silicon
  "■": <ore:blockStrontium90>, # Strontium-90 Block
});

val ingrs = {
  "O": <qmd:luminous_paint:2>, # Orange Radioluminescent Paint
  "H": <nuclearcraft:rad_shielding:2>, # Heavy Radiation Shielding
  "R": <industrialforegoing:plastic>, # Plastic
  "a": <nuclearcraft:helm_hazmat:*> | <nuclearcraft:helm_hazmat:*>.withTag({}, false), # Hazmat Suit Headwear
  "z": <nuclearcraft:chest_hazmat:*> | <nuclearcraft:chest_hazmat:*>.withTag({}, false), # Hazmat Suit Chestpiece
  "●": <nuclearcraft:legs_hazmat:*> | <nuclearcraft:legs_hazmat:*>.withTag({}, false), # Hazmat Suit Leggings
  "m": <nuclearcraft:boots_hazmat:*> | <nuclearcraft:boots_hazmat:*>.withTag({}, false), # Hazmat Suit Boots
  "S": <ic2:hazmat_helmet:*> | <ic2:hazmat_helmet:*>.withTag({}, false), # Scuba Helmet
  "⌀": <ic2:hazmat_chestplate:*> | <ic2:hazmat_chestplate:*>.withTag({}, false), # Hazmat Suit
  "○": <ic2:hazmat_leggings:*> | <ic2:hazmat_leggings:*>.withTag({}, false), # Hazmat Suit Leggings
  "u": <ic2:rubber_boots:*> | <ic2:rubber_boots:*>.withTag({}, false), # Rubber Boots
} as IIngredient[string];

# [HEV Helmet] from [Hazmat Suit Headwear][+4]
craft.make(<qmd:helm_hev>, ["pretty",
  "O O O",
  "H a H",
  "R S R"], ingrs
);

# [HEV Chestplate] from [Hazmat Suit Chestpiece][+4]
craft.make(<qmd:chest_hev>, ["pretty",
  "O O O",
  "H z H",
  "R ⌀ R"], ingrs
);

# [HEV Leggings] from [Hazmat Suit Leggings][+4]
craft.make(<qmd:legs_hev>, ["pretty",
  "O O O",
  "H ● H",
  "R ○ R"], ingrs
);

# [HEV Boots] from [Hazmat Suit Boots][+4]
craft.make(<qmd:boots_hev>, ["pretty",
  "O O O",
  "H m H",
  "R u R"], ingrs
);

# [Tungsten Filament] from [Tungsten Ingot]
scripts.process.alloy([<ore:ingotTungsten>, <ore:ingotTungsten>],
  <qmd:source>.withTag({particle_storage: {particle_amount: 50000000}}), "except: AlloyFurnace"
);

val alloyMachines = "except: alloyFurnace kiln";
scripts.process.alloy([<ore:ingotNeodymium>, <ore:ingotFerroboron>, <ore:ingotFerroboron>], <qmd:part:8>); # [Neodymium Magnet] from [Neodymium Ingot][+1]
scripts.process.alloy([<ore:dustTungsten>     , <ore:ingotGraphite>]       , <qmd:ingot_alloy>   * 2, alloyMachines); # [Tungsten Carbide Ingot]*2 from [Graphite Ingot][+1]
scripts.process.alloy([<ore:ingotNiobium> * 3 , <ore:ingotTin>]            , <qmd:ingot_alloy:1> * 4, alloyMachines); # [Niobium-Tin Ingot]*4 from [Tin Ingot][+1]
scripts.process.alloy([<ore:ingotSteel> * 5   , <ore:ingotChromium>]       , <qmd:ingot_alloy:2> * 6, alloyMachines); # [Stainless Steel Ingot]*6 from [Chromium Ingot][+1]
scripts.process.alloy([<ore:ingotNiobium>     , <ore:ingotTitanium>]       , <qmd:ingot_alloy:3> * 2, alloyMachines); # [Niobium-Titanium Ingot]*2 from [Titanium Ingot][+1]
scripts.process.alloy([<ore:ingotNickel>      , <ore:ingotChromium>]       , <qmd:ingot_alloy:5> * 2, alloyMachines); # [Nichrome Ingot]*2 from [Chromium Ingot][+1]
scripts.process.alloy([<ore:ingotNichrome> * 2, <ore:ingotNiobiumTitanium>], <qmd:ingot_alloy:6> * 3, alloyMachines); # [Super Alloy Ingot]*3 from [Niobium-Titanium Ingot][+1]

# [Copper Oxide] from [Universal Fluid Cell][+1]
scripts.process.fill(<ore:dustCopper>, <fluid:oxygen> * 1000, <qmd:chemical_dust:4>, 'except: NCInfuser Casting DryingBasin');

# [Hafnium Oxide] from [Universal Fluid Cell][+1]
scripts.process.fill(<ore:dustHafnium>, <fluid:oxygen> * 1000, <qmd:chemical_dust:5>, 'except: NCInfuser Casting DryingBasin');

// Remove Silicon Boule
mods.nuclearcraft.Crystallizer.removeRecipeWithOutput(<libvulpes:productboule:3>);
mods.nuclearcraft.Melter.addRecipe(<ore:blockSilicon>, <fluid:silicon> * 1296);
utils.rh(<qmd:semiconductor:3>); // Wafer replaced by Adv. Rock.
utils.rh(<qmd:semiconductor:2>); // Silicon boule
mods.nuclearcraft.FissionIrradiator.removeRecipeWithOutput(<qmd:semiconductor:1>);
mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:waferSilicon>, <qmd:semiconductor:1>, 120000, 0, 0, 0);
mods.rats.recipes.addArcheologistRatRecipe(<advancedrocketry:wafer>, <qmd:semiconductor:1>);

// Molten Silicon from pre-AR sources
scripts.process.melt(<ore:ingotSilicon>, <fluid:silicon> * 144, "except: melter");
scripts.process.melt(<ore:blockSilicon>, <fluid:silicon> * 1296, "except: melter");
mods.tconstruct.Casting.addTableRecipe(<appliedenergistics2:material:5>, <tconstruct:cast_custom:2>, <liquid:silicon>, 144, false);
mods.tconstruct.Casting.addBasinRecipe(<contenttweaker:silicon_block>, null, <liquid:silicon>, 1296, false);
mods.inworldcrafting.FluidToItem.transform(<libvulpes:productboule:3>, <fluid:silicon>, [<contenttweaker:silicon_block>], true);
scripts.process.saw(<ore:bouleSilicon>, <advancedrocketry:wafer>, "except: shapeless mekSawmill AdvRockCutter", null, 0, {hardness: 9});

// Unify P-Type Doped Silicon
mods.qmd.target_chamber.removeRecipeWithInput(<qmd:semiconductor:3>, ((<particle:boron_ion>*1000000)^600)~2.0);
mods.qmd.target_chamber.addRecipe(<ore:waferSilicon>, ((<particle:boron_ion>*1000000)^600)~2.0, <qmd:semiconductor>, 
null, null, null, 
1000, 1.0, 0, 0);

//mods.qmd.nucleosynthesis_chamber.addRecipe(IIngredient inputFluid1, IIngredient inputFluid2, IIngredient inputParticle, IIngredient outputFluid1, IIngredient outputFluid2, {long maxEnergy}, {long heatRelased})
mods.qmd.nucleosynthesis_chamber.addRecipe(<liquid:sky_stone>*52, <liquid:enrichedlava>*20, <particle:neutron>*1000000, <liquid:neutronium>*72, null, 1000000, 874000);

// sodium, iridium, cobalt, and calcium source stack size fix
<qmd:source:1>.maxStackSize = 1;
<qmd:source:2>.maxStackSize = 1;
<qmd:source:3>.maxStackSize = 1;
<qmd:source:4>.maxStackSize = 1;

// Remove tools
utils.rh(<qmd:sword_tungsten_carbide>);
utils.rh(<qmd:pickaxe_tungsten_carbide>);
utils.rh(<qmd:shovel_tungsten_carbide>);
utils.rh(<qmd:axe_tungsten_carbide>);
utils.rh(<qmd:hoe_tungsten_carbide>);

////////////////////////////////////////
//               Unify                //
////////////////////////////////////////
utils.rh(<qmd:dust:4>); // Cobalt
utils.rh(<qmd:ingot:4>); // Cobalt
utils.rh(<qmd:dust>); // Tungsten
utils.rh(<qmd:ingot>); // Tungsten
utils.rh(<qmd:ingot:10>); // Platinum
utils.rh(<qmd:ingot_alloy:4>); // Osmiridium
utils.rh(<qmd:ingot:9>); // Iridium

# Sodium Chlorde (salt)
mods.nuclearcraft.Crystallizer.removeRecipeWithOutput(<qmd:chemical_dust:3>);
mods.nuclearcraft.Crystallizer.addRecipe(<fluid:sodium_chloride_solution> * 666, <mekanism:salt>);
utils.rh(<qmd:chemical_dust:3>);

# Sodium Nitrate (niter)
mods.nuclearcraft.Crystallizer.removeRecipeWithOutput(<qmd:chemical_dust:2>);
mods.nuclearcraft.Crystallizer.addRecipe(<fluid:sodium_nitrate_solution> * 666, <thermalfoundation:material:772> * 20);
utils.rh(<qmd:chemical_dust:2>);

////////////////////////////////////////
// Replacing Mercury with Quicksilver //
////////////////////////////////////////

mods.nuclearcraft.Melter.removeRecipeWithOutput(<fluid:mercury> * 144);
mods.nuclearcraft.IngotFormer.removeRecipeWithInput(<fluid:mercury> * 144);
mods.qmd.nucleosynthesis_chamber.removeRecipeWithInput(<fluid:gold> * 144, null, (<particle:neutron>*13980000)~1);
mods.qmd.nucleosynthesis_chamber.addRecipe(<fluid:gold> * 144, null, (<particle:neutron>*13980000)~1, <liquid:fluid_quicksilver>*144, null, 10000000, 3610);
mods.qmd.nucleosynthesis_chamber.removeRecipeWithInput(<fluid:mercury> * 144, null, (<particle:neutron>*16940000)~1);
mods.qmd.nucleosynthesis_chamber.addRecipe(<fluid:fluid_quicksilver> * 144, null, (<particle:neutron>*16940000)~1, <liquid:lead>*144, null, 10000000, 4180);
mods.nuclearcraft.Turbine.removeRecipeWithOutput(<fluid:mercury>);
mods.nuclearcraft.Turbine.addRecipe(<liquid:hot_mercury>, <liquid:fluid_quicksilver>, 8192.0, 4.0, 1.0);
mods.nuclearcraft.Infuser.removeRecipeWithOutput(<qmd:discharge_lamp2:1>);
mods.nuclearcraft.Infuser.addRecipe(<qmd:discharge_lamp:6>, <liquid:fluid_quicksilver>*144, <qmd:discharge_lamp2:1>);
mods.qmd.nucleosynthesis_chamber_heater.removeRecipeWithOutput(<fluid:hot_mercury>);
mods.qmd.nucleosynthesis_chamber_heater.addRecipe(<liquid:fluid_quicksilver>, <fluid:hot_mercury>, 1);

// Below, taken from Multiblock-Madness
// https://github.com/Filostorm/Multiblock-Madness/blob/19659008c64234f96d5607df3f9ca6df7adee778/scripts/Non%20Mod%20Scripts/unification.zs#L150-L301

// New Ore Leacher Recipes
mods.qmd.ore_leacher.removeRecipeWithOutput(<minecraft:redstone> * 12, <qmd:ingot2:2> * 3, null);
mods.qmd.ore_leacher.removeRecipeWithOutput(<qmd:ingot2:2>, <thermalfoundation:material:771>, null);

mods.qmd.ore_leacher.addRecipe(<ore:oreRedstone>, <liquid:nitric_acid>*16, <liquid:hydrochloric_acid>*16, <liquid:sulfuric_acid>*16, <minecraft:redstone>*12, <thaumcraft:quicksilver>*3, null, 1.0, 1.0, 0);
mods.qmd.ore_leacher.addRecipe(<ore:dustRedstone>, <liquid:nitric_acid>*16, <liquid:hydrochloric_acid>*16, <liquid:sulfuric_acid>*16, 
ChanceItemIngredient.create(<thaumcraft:quicksilver>, 50, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:771>, 50, 0), 
null, 1.0, 1.0, 0.001);

// New Fuel Reprocessor Recipes
val fuelstorewrite =
[
<qmd:waste_spallation:1>,
<qmd:waste_spallation:2>,
<qmd:waste_spallation:3>,
<qmd:waste_spallation:4>,
<qmd:waste_spallation:5>,
<qmd:waste_spallation:6>,
<qmd:waste_spallation:8>,
<qmd:waste_spallation:7>,
<qmd:waste_spallation:9>
]
 as IItemStack[];

for item in fuelstorewrite {
	mods.nuclearcraft.FuelReprocessor.removeRecipeWithInput(item);
}

mods.nuclearcraft.FuelReprocessor.addRecipe(<qmd:waste_spallation:1>, 
ChanceItemIngredient.create(<nuclearcraft:fission_dust:1>, 9, 0), 
ChanceItemIngredient.create(<nuclearcraft:fission_dust:2>, 15, 0), 
ChanceItemIngredient.create(<nuclearcraft:fission_dust>, 40, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:67>, 35, 0), 
ChanceItemIngredient.create(<thaumcraft:quicksilver>, 1, 0), 
null, 
null, 
null);

mods.nuclearcraft.FuelReprocessor.addRecipe(<qmd:waste_spallation:2>, 
ChanceItemIngredient.create(<nuclearcraft:fission_dust:1>, 13, 0), 
ChanceItemIngredient.create(<nuclearcraft:fission_dust:2>, 17, 0), 
ChanceItemIngredient.create(<nuclearcraft:fission_dust>, 16, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:67>, 50, 0), 
ChanceItemIngredient.create(<thaumcraft:quicksilver>, 4, 0), 
null, 
null, 
null);

mods.nuclearcraft.FuelReprocessor.addRecipe(<qmd:waste_spallation:3>, 
ChanceItemIngredient.create(<nuclearcraft:fission_dust:2>, 22, 0), 
ChanceItemIngredient.create(<nuclearcraft:fission_dust>, 15, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:67>, 55, 0), 
ChanceItemIngredient.create(<thaumcraft:quicksilver>, 5, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:1>, 1, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:70>, 2, 0), 
null, 
null);

mods.nuclearcraft.FuelReprocessor.addRecipe(<qmd:waste_spallation:4>, 
ChanceItemIngredient.create(<nuclearcraft:fission_dust:2>, 22, 0), 
ChanceItemIngredient.create(<nuclearcraft:fission_dust>, 14, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:67>, 55, 0), 
ChanceItemIngredient.create(<thaumcraft:quicksilver>, 5, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:1>, 1, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:70>, 3, 0), 
null, 
null);

mods.nuclearcraft.FuelReprocessor.addRecipe(<qmd:waste_spallation:5>, 
ChanceItemIngredient.create(<nuclearcraft:fission_dust:2>, 36, 0), 
ChanceItemIngredient.create(<nuclearcraft:fission_dust>, 17, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:67>, 34, 0), 
ChanceItemIngredient.create(<thaumcraft:quicksilver>, 7, 0),
ChanceItemIngredient.create(<thermalfoundation:material:1>, 2, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:70>, 4, 0), 
null, 
null);

mods.nuclearcraft.FuelReprocessor.addRecipe(<qmd:waste_spallation:6>, 
ChanceItemIngredient.create(<nuclearcraft:fission_dust:2>, 21, 0), 
ChanceItemIngredient.create(<nuclearcraft:fission_dust>, 12, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:67>, 55, 0), 
ChanceItemIngredient.create(<thaumcraft:quicksilver>, 7, 0),
ChanceItemIngredient.create(<thermalfoundation:material:1>, 1, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:70>, 4, 0), 
null, 
null);

mods.nuclearcraft.FuelReprocessor.addRecipe(<qmd:waste_spallation:8>, 
ChanceItemIngredient.create(<nuclearcraft:fission_dust:2>, 10, 0), 
ChanceItemIngredient.create(<nuclearcraft:fission_dust>, 7, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:67>, 62, 0), 
ChanceItemIngredient.create(<thaumcraft:quicksilver>, 11, 0),
ChanceItemIngredient.create(<thermalfoundation:material:1>, 2, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:70>, 8, 0), 
null, 
null);

mods.nuclearcraft.FuelReprocessor.addRecipe(<qmd:waste_spallation:7>, 
ChanceItemIngredient.create(<nuclearcraft:fission_dust:2>, 36, 0), 
ChanceItemIngredient.create(<nuclearcraft:fission_dust>, 6, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:67>, 39, 0), 
ChanceItemIngredient.create(<thaumcraft:quicksilver>, 10, 0),
ChanceItemIngredient.create(<thermalfoundation:material:1>, 2, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:70>, 7, 0), 
null, 
null);

mods.nuclearcraft.FuelReprocessor.addRecipe(<qmd:waste_spallation:9>, 
ChanceItemIngredient.create(<thermalfoundation:material:67>, 58, 0), 
ChanceItemIngredient.create(<thaumcraft:quicksilver>, 18, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:1>, 3, 0), 
ChanceItemIngredient.create(<thermalfoundation:material:70>, 10, 0),
ChanceItemIngredient.create(<thermalfoundation:material:71>, 6, 0), 
ChanceItemIngredient.create(<mekanism:dust:2>, 5, 0), 
null, 
null);

// New Target Chamber Recipes
mods.qmd.target_chamber.removeRecipeWithInput(<qmd:ingot2:2>, (<particle:proton>*50000000)^200000);
mods.qmd.target_chamber.removeRecipeWithInput(<qmd:ingot2:2>, (<particle:proton>*5000000)^6580000);
mods.qmd.target_chamber.removeRecipeWithInput(<qmd:ingot2:2>, (<particle:proton>*5000000)^1540000);
mods.qmd.target_chamber.removeRecipeWithInput(<qmd:ingot2:2>, <particle:antiproton>*1000000);
mods.qmd.target_chamber.removeRecipeWithInput(<qmd:ingot2:2>, (<particle:deuteron>*10000000)^13100000);
mods.qmd.target_chamber.removeRecipeWithInput(<qmd:ingot2:2>, <particle:antideuteron>*1000000);

mods.qmd.target_chamber.addRecipe(<thaumcraft:quicksilver>, (<particle:proton>*50000000)^200000, <qmd:waste_fission>, 
null, <particle:neutron>, null, 
1000000, 0.02, 0, 0);

mods.qmd.target_chamber.addRecipe(<thaumcraft:quicksilver>, (<particle:proton>*5000000)^6580000, <qmd:waste_spallation2:3>, 
<particle:proton>, null, <particle:antiproton>, 
20000000, 0.2, -6580000, 0);

mods.qmd.target_chamber.addRecipe(<thaumcraft:quicksilver>, (<particle:proton>*5000000)^1540000, <qmd:waste_spallation2:3>, 
<particle:pion_plus>, null, <particle:pion_minus>, 
5000000, 0.2, -1540000, 0);

mods.qmd.target_chamber.addRecipe(<thaumcraft:quicksilver>, <particle:antiproton>*1000000, <qmd:waste_spallation2:3>, 
<particle:pion_plus>, <particle:pion_naught>, <particle:pion_minus>, 
10000000, 1.0, 1460000, 0);

mods.qmd.target_chamber.addRecipe(<thaumcraft:quicksilver>, (<particle:deuteron>*10000000)^13100000, <qmd:waste_spallation2:3>, 
<particle:deuteron>, null, <particle:antideuteron>, 
20000000, 0.1, -13100000, 0);

mods.qmd.target_chamber.addRecipe(<thaumcraft:quicksilver>, <particle:antideuteron>*1000000, <qmd:waste_spallation2:3>, 
<particle:pion_plus>*4, <particle:pion_naught>*4, <particle:pion_minus>*4, 
10000000, 1.0, 2090000, 0);

utils.rh(<qmd:ingot2:2>);
////////////////////////////////////////

// mods.qmd.target_chamber.addRecipe(
//   IIngredient inputItem,
//   IIngredient inputParticle,
//   IIngredient outputItem,
//   IIngredient outputParticle1,
//   IIngredient outputParticle2,
//   IIngredient outputParticle3,
//   long maxEnergy,
//   double crossSection,
//   {long energyReleased, double processRadiation}
// )
