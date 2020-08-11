#loader contenttweaker

import mods.contenttweaker.Block;
import mods.contenttweaker.VanillaFactory;


val c = VanillaFactory.createBlock("compressed_skystone", <blockmaterial:rock>) as Block;
c.creativeTab = <creativetab:other>;
c.toolClass = "pickaxe";
c.toolLevel = 7;
c.blockHardness = 10;
c.blockResistance = 8;
c.blockSoundType = <soundtype:stone>;
c.register();
