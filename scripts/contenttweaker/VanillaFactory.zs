#priority 9000

#loader contenttweaker

import crafttweaker.data.IData;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.event.EntityLivingFallEvent;
import crafttweaker.item.IItemDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IWorld;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Color;
import mods.contenttweaker.Item;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.VanillaFactory;
import mods.ctutils.utils.Math.abs;
import mods.ctutils.utils.Math.floor;
import mods.ctutils.utils.Math.max;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.random;
import mods.ctutils.utils.Math.sqrt;


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


val
ta = VanillaFactory.createBlock("terrestrial_artifact_block", <blockmaterial:rock>);
ta.toolClass = "pickaxe";
ta.toolLevel = 9;
ta.blockHardness = 9 * 1.6;
ta.blockResistance = 9 * 1.4;
ta.blockSoundType = <soundtype:stone>;
ta.register();


# -------------------------------
# Molten Cheese
# -------------------------------
var moltenCheese = MaterialSystem
	.getMaterialBuilder()
	.setName("Cheese")
	.setColor(Color.fromHex("FEE66F"))
	.build()
	.registerPart("molten")
	.getData();
moltenCheese.addDataValue("temperature", "300");
moltenCheese.addDataValue("density", "1004");
moltenCheese.addDataValue("viscosity", "2000");


# -------------------------------
# Molten heavy
# -------------------------------
var heavyMatBuilder = MaterialSystem
	.getMaterialBuilder()
	.setName("Heavy Metal")
	.setColor(Color.fromHex("444450"))
	.build();

var molten = heavyMatBuilder.registerPart("molten").getData();
molten.addDataValue("temperature", "320");
molten.addDataValue("density", "500000");
molten.addDataValue("viscosity", "30000");