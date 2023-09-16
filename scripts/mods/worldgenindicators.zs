#modloaded worldgenindicators
#reloadable

import mods.worldgenindicators.BlockChecker;
import mods.worldgenindicators.WorldGenManager;
import mods.worldgenindicators.SurfaceIndicator;
import crafttweaker.block.IBlock;

WorldGenManager.addChecker(
  BlockChecker.create(1.0)
  .addValid(<extrautils2:decorativesolid:6>.asBlock())
  .addIndicator(SurfaceIndicator.create().add(<botania:shinyflower:3>.asBlock()))
);
