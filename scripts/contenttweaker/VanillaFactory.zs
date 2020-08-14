#priority 9000

#loader contenttweaker

import mods.contenttweaker.Item;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.BlockMaterial;


/*** Crafting Materials ***/
for craftMat in [

  # TCon core ingredient
	"supremium_helmet_base",
	"supremium_chest_base",
	"supremium_leggings_base",
	"supremium_boots_base",

  # Compressed mekanism items
  "compressed_glowstone",
  "compressed_ender",
  
] as string[] {
	itemBuilder.addItem(craftMat);
}

function createCompressedBlock(name as string, level as int, blockMaterial as BlockMaterial) {
	val c = VanillaFactory.createBlock(name, blockMaterial);
	c.toolClass = "pickaxe";
	c.toolLevel = level;
	c.blockHardness = level * 1.6;
	c.blockResistance = level * 1.4;
	c.blockSoundType = <soundtype:stone>;
	c.register();
}

createCompressedBlock("compressed_crushed_skystone", 5, <blockmaterial:rock>);
createCompressedBlock("compressed_crushed_andesite", 3, <blockmaterial:rock>);
createCompressedBlock("compressed_crushed_diorite" , 3, <blockmaterial:rock>);
createCompressedBlock("compressed_crushed_granite" , 3, <blockmaterial:rock>);