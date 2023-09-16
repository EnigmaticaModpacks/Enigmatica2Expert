#modloaded rftdimtweak
import crafttweaker.item.IItemStack;

# [Dimension Enscriber Prototype] from [Resonant Cell Frame (Empty)][+4]
craft.remake(<rftdimtweak:dimension_enscriber>, ["pretty",
  "M E M",
  "A ◘ A",
  "M D M"], {
  "A": utils.tryCatch("ae2stuff:inscriber", <appliedenergistics2:inscriber>), # Advanced Inscriber
  "D": <draconicevolution:crafting_injector>,
  "E": <rftoolsdim:empty_dimension_tab>,  # Empty Dimension Tab
  "◘": <thermalexpansion:frame:132>,      # Resonant Cell Frame (Empty)
  "M": <rftools:machine_base>,            # Machine Base
});

# [tile.rftdimtweak.dimension_builder.name] from [Dimension Builder][+1]
craft.remake(<rftdimtweak:dimension_builder>, ["pretty",
  "  ■  ",
  "■ D ■",
  "  ■  "], {
  "■": <ore:blockDimensional>,         # Dimensional Blank Block
  "D": <rftoolsdim:dimension_builder>, # Dimension Builder
});

# [tile.rftdimtweak.dimension_editor.name] from [Dimension Editor][+1]
craft.remake(<rftdimtweak:dimension_editor>, ["pretty",
  "  ■  ",
  "■ D ■",
  "  ■  "], {
  "■": <ore:blockDimensional>,        # Dimensional Blank Block
  "D": <rftoolsdim:dimension_editor>, # Dimension Editor
});

val energyDimletIngrs = {
  Delta  : <avaritia:endest_pearl>,
  Beta   : <avaritia:block_resource>,
  Epsilon: <plustic:mirionblock>,
  Alpha  : <contenttweaker:terrestrial_artifact_block>,
  Gamma  : <jaopca:item_dustalchemerald>,
  Zeta   : <rats:idol_of_ratlantis>,
} as IItemStack[string];

for name, ingr in energyDimletIngrs {
  # [Energy Dimlet] from [Dimlet Special Type Controller][+4]
  craft.remake(<rftdimtweak:known_dimletreplica>.withTag({dkey: name}), ["pretty",
    "■ ▄ ■",
    "Ϟ D i",
    "■ ▄ ■"], {
    "■": <ore:blockDraconiumCharged>,                 # Charged Draconium Block
    "▄": <ore:blockDimensional>,                      # Dimensional Blank Block
    "Ϟ": <rftdimtweak:dimlet_type_controller_energy>, # Dimlet Energy Type Controller
    "D": ingr,
    "i": <rftdimtweak:dimlet_control_circuit_seven>,  # Dimlet Control Circuit Rarity 7
  });
}

# [Dimlet Control Circuit Rarity 7] from [Machine Circuitry][+1]
scripts.processUtils.avdRockXmlRecipeEx("PrecisionAssembler",
  [
    <advancedrocketry:ic:2>, # Advanced Circuit
    <ore:processorBasic>,
  ], null,
  [<rftdimtweak:dimlet_control_circuit_seven>], null, {power: 100000, timeRequired: 100}
);

# [Dimlet Energy Type Controller] from [Particle Generator][+1]
scripts.processUtils.avdRockXmlRecipeEx("PrecisionAssembler",
  [
    <advancedrocketry:ic:2>,          # Advanced Circuit
    <draconicevolution:particle_generator>, # Particle Generator
  ], null,
  [<rftdimtweak:dimlet_type_controller_energy>], null, {power: 100000, timeRequired: 100}
);

# [Dimension Monitor] from [Dimension Monitor]
craft.shapeless(<rftdimtweak:dimension_monitor>, "D", {
  "D": <rftoolsdim:dimension_monitor>, # Dimension Monitor
});

# [Dimension Monitor] from [Dimension Monitor]
craft.shapeless(<rftoolsdim:dimension_monitor>, "D", {
  "D": <rftdimtweak:dimension_monitor>, # Dimension Monitor
});
