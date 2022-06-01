#modloaded thaumicwonders

# [Flux Capacitor] from [Vis Battery][+4]
mods.thaumcraft.Infusion.removeRecipe(<thaumicwonders:flux_capacitor>);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(
  "flux_capacitor", # Name
  "TWOND_FLUX_CAPACITOR", # Research
  200, # Vis cost
  [<aspect:terra>, <aspect:ignis>],
  <thaumicwonders:flux_capacitor>, # Output
  scripts.craft.grid.Grid(["pretty",
  "  *  ",
  "F V F",
  "  *  "], {
  "*": <ore:oreCrystalTaint>,          # Flux Crystal
  "F": <thaumcraft:condenser_lattice>, # Flux Condenser Lattice
  "V": <thaumcraft:vis_battery>,       # Vis Battery
}).shaped());

# [Flux Distiller] from [Flux Condenser][+8]
mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumicwonders:flux_distiller>);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(
  "flux_distiller", # Name
  "TWOND_FLUX_DISTILLER", # Research
  750, # Vis cost
  [<aspect:aer> * 8, <aspect:aqua> * 8, <aspect:ordo> * 8],
  <thaumicwonders:flux_distiller>, # Output
  scripts.craft.grid.Grid(["pretty",
  "□ F □",
  "C l C",
  "□ c □"], {
  "□": <ore:plateVoid>,                # Void Metal Plate
  "F": <thaumcraft:condenser_lattice>, # Flux Condenser Lattice
  "C": <thaumcraft:mechanism_complex>, # Complex Arcane Mechanism
  "l": <thaumcraft:condenser>,         # Flux Condenser
  "c": <thaumcraft:metal_alchemical>,  # Alchemical Construct
}).shaped());