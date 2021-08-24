#modloaded rftdimtweak

# [Dimension Enscriber Prototype] from [Resonant Cell Frame (Empty)][+4]
craft.remake(<rftdimtweak:dimension_enscriber>, ["pretty",
  "M E M",
  "A ◘ A",
  "M D M"], {
  "A": utils.tryCatch("ae2stuff:inscriber", <appliedenergistics2:inscriber>), # Advanced Inscriber
  "D": <draconicevolution:draconic_core>, # Draconic Core
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
