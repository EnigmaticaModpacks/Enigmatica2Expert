#modloaded qmd

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

/* 
mods.qmd.target_chamber.addRecipe(IIngredient inputItem,
  IIngredient inputParticle,
  IIngredient outputItem,
  IIngredient outputParticle1,
  IIngredient outputParticle2,
  IIngredient outputParticle3,
  long maxEnergy,
  double crossSection,
  {long energyReleased, double processRadiation}
);
*/

// mods.qmd.target_chamber.addRecipe(<ore:nuggetTitaniumIridium>,
//   <particle:neutron>,
//   <avaritia:resource:2>,
//   <particle:photon>,
//   null,
//   null,
//   10000000,
//   1.0
// );


// Remove Silicon Boule
mods.nuclearcraft.Crystallizer.removeRecipeWithOutput(<libvulpes:productboule:3>);
mods.nuclearcraft.Melter.addRecipe(<ore:blockSilicon>, <fluid:silicon> * 1296);
utils.rh(<qmd:semiconductor:3>); // Wafer replaced by Adv. Rock.
utils.rh(<qmd:semiconductor:2>); // Silicon boule
mods.nuclearcraft.FissionIrradiator.removeRecipeWithOutput(<qmd:semiconductor:1>);
mods.nuclearcraft.FissionIrradiator.addRecipe(<ore:waferSilicon>, <qmd:semiconductor:1>, 120000, 0, 0);
