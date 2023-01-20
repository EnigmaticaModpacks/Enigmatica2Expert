#modloaded bithop

// Remove BitHop due crashes: https://github.com/elytra/BitHop/issues/12
recipes.remove(<bithop:bithop>);
scripts.category.tooltip_utils.desc.jei(<bithop:bithop>, "tooltips.lang.removed.crash");

# [PullHop] from [Cabinet][+1]
craft.remake(<bithop:pullhop>, ["pretty",
  "A   A",
  "A C A",
  "  A  "], {
  "A": <ore:stoneAndesite>, # Andesite
  "C": <rustic:cabinet>, # Cabinet
});

# [ScrewHop] from [Cabinet][+1]
craft.remake(<bithop:screwhop>, ["pretty",
  "    A",
  "A A  ",
  "C A  "], {
  "A": <ore:stoneAndesite>, # Andesite
  "C": <rustic:cabinet>, # Cabinet
});

# [FluxHop] from [Cabinet][+2]
craft.remake(<bithop:fluxhop>, ["pretty",
  "⌂ ♥ ⌂",
  "⌂ C ⌂",
  "♥ ⌂ ♥"], {
  "⌂": <ic2:casing:3>,     # Iron Item Casing
  "♥": <ore:dustRedstone>, # Redstone
  "C": <rustic:cabinet>,   # Cabinet
});

# [Hopper] from [PullHop][+2]
craft.make(<minecraft:hopper>, ["pretty",
  "□ B □",
  "□ P □",
  "  □  "], {
  "□": <ore:plateIron>,  # Iron Plate
  "B": <bithop:screwhop>,
  "P": <bithop:pullhop>, # PullHop
});

# [Hopper] from [PullHop][+2]
craft.make(<minecraft:hopper>, ["pretty",
  "□ B □",
  "□ P □",
  "  □  "], {
  "□": <ore:plateAluminium>, # Aluminum Plate
  "B": <bithop:screwhop>,
  "P": <bithop:pullhop>,     # PullHop
});
