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

# [Basic Processor] from [Silver Plate][+3]
mods.immersiveengineering.Blueprint.addRecipe('components', <qmd:semiconductor:4>, Grid(["NF⌂F□F"], {
  "N": <ore:siliconNDoped>,     # N-Type Doped Silicon
  "F": <fluxnetworks:flux>,     # Flux
  "⌂": <ic2:casing:2>,          # Gold Item Casing
  "□": <ore:plateSilver>,       # Silver Plate
}).shapeless());

# [Advanced Processor] from [P-Type Doped Silicon][+3]
mods.immersiveengineering.Blueprint.addRecipe('components', <qmd:semiconductor:5>, Grid(["BF▲FPF"], {
  "B": <ore:processorBasic>,    # Basic Processor
  "F": <fluxnetworks:flux>,     # Flux
  "▲": <ore:dustHafniumOxide>,  # Hafnium Oxide
  "P": <ore:siliconPDoped>,     # P-Type Doped Silicon
}).shapeless());

# [Elite Processor] from [Platinum Plate][+3]
mods.immersiveengineering.Blueprint.addRecipe('components', <qmd:semiconductor:6>, Grid(["AB▲B□B"], {
  "A": <ore:processorAdvanced>, # Advanced Processor
  "B": <ore:wireBSCCO>,         # BSCCO Wire
  "▲": <ore:dustHafniumOxide>,  # Hafnium Oxide
  "□": <ore:platePlatinum>,     # Platinum Plate
}).shapeless());

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

# [Tungsten Filament] from [Tungsten Ingot]
scripts.process.alloy([<qmd:ingot>, <qmd:ingot>],
  <qmd:source>.withTag({particle_storage: {particle_amount: 50000000}}), "except: AlloyFurnace"
);

# [Neodymium Magnet] from [Neodymium Ingot][+1]
scripts.process.alloy([<ore:ingotNeodymium>, <ore:ingotFerroboron>, <ore:ingotFerroboron>], <qmd:part:8>);

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

// Unify P-Type Doped Silicon
mods.qmd.target_chamber.removeRecipeWithInput(<qmd:semiconductor:3>, ((<particle:boron_ion>*1000000)^600)~2.0);
mods.qmd.target_chamber.addRecipe(<ore:waferSilicon>, ((<particle:boron_ion>*1000000)^600)~2.0, <qmd:semiconductor>, 
null, null, null, 
1000, 1.0, 0, 0);

// //qmd bugged recipe fix
// mods.qmd.target_chamber.removeRecipeWithInput(<ore:ingotUranium238>, (<particle:neutron>*1818000)^26000);
// mods.qmd.target_chamber.addRecipe(<ore:ingotUranium238>, (<particle:neutron>*1000000)^26000, <ore:ingotUranium235>, null, <particle:neutron>*4, null, 34000, 0.55, -17800);

//mods.qmd.nucleosynthesis_chamber.addRecipe(IIngredient inputFluid1, IIngredient inputFluid2, IIngredient inputParticle, IIngredient outputFluid1, IIngredient outputFluid2, {long maxEnergy}, {long heatRelased})
mods.qmd.nucleosynthesis_chamber.addRecipe(<liquid:sky_stone>*52, <liquid:enrichedlava>*20, <particle:neutron>*1000000, <liquid:neutronium>*72, null, 10000, 874000);

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
//           Unify Cobalt             //
////////////////////////////////////////
utils.rh(<qmd:dust:4>);
utils.rh(<qmd:ingot:4>);

////////////////////////////////////////
//           Unify Tungsten           //
////////////////////////////////////////
utils.rh(<qmd:dust>);
utils.rh(<qmd:ingot>);

////////////////////////////////////////
// Replacing Mercury with Quicksilver //
////////////////////////////////////////

// Taken from Multiblock-Madness
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
