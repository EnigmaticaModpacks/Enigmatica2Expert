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
import mods.contenttweaker.SoundType;
import mods.ctutils.utils.Math.abs;
import mods.ctutils.utils.Math.floor;
import mods.ctutils.utils.Math.max;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.random;
import mods.ctutils.utils.Math.sqrt;

mods.contenttweaker.VanillaFactory.createCreativeTab("other", <item:minecraft:coal:1>).register();

function buildItem(name as string) {
	val item = VanillaFactory.createItem(name) as Item;
	item.setCreativeTab(<creativetab:other>);
	item.register();
}

function createBlock(name as string, level as int, blockMaterial as BlockMaterial, blockSoundType as SoundType) {
	val c = VanillaFactory.createBlock(name, blockMaterial);
	c.toolClass = "pickaxe";
	c.toolLevel = level;
	c.blockHardness = level * 1.6;
	c.blockResistance = level * 1.4;
	c.blockSoundType = blockSoundType;
	c.register();
}

function createBlockGround(name as string, level as int, blockMaterial as BlockMaterial) {
	createBlock(name, level, blockMaterial, <soundtype:ground>);
}

function createBlockStone(name as string, level as int, blockMaterial as BlockMaterial) {
	createBlock(name, level, blockMaterial, <soundtype:stone>);
}

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
	buildItem(craftMat);
}

createBlockStone("compressed_skystone", 6, <blockmaterial:rock>);
createBlockStone("compressed_andesite", 4, <blockmaterial:rock>);
createBlockStone("compressed_diorite" , 4, <blockmaterial:rock>);
createBlockStone("compressed_granite" , 4, <blockmaterial:rock>);

createBlockStone("compressed_crushed_skystone", 5, <blockmaterial:rock>);
createBlockStone("compressed_crushed_andesite", 3, <blockmaterial:rock>);
createBlockStone("compressed_crushed_diorite" , 3, <blockmaterial:rock>);
createBlockStone("compressed_crushed_granite" , 3, <blockmaterial:rock>);

createBlockStone("terrestrial_artifact_block", 9, <blockmaterial:rock>);
createBlockStone("silicon_block", 4, <blockmaterial:rock>);



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



# -------------------------------
# Seed
# -------------------------------
# Liquid part
var pFluidBuilder = MaterialSystem.getPartBuilder().setName("fluid");
pFluidBuilder.setPartType(MaterialSystem.getPartType("fluid"));
var pfluid = pFluidBuilder.build();

var seedIssue = MaterialSystem
	.getMaterialBuilder()
	.setName("Seed")
	.setColor(0xE3D7C8)
	.build()
	.registerPart(pfluid)
	.getData();
seedIssue.addDataValue("temperature", "290");
seedIssue.addDataValue("density", "2009");
seedIssue.addDataValue("viscosity", "1000");


# -------------------------------
# Animal's blocks
# -------------------------------
createBlockGround("conglomerate_of_life", 5, <blockmaterial:clay>);
createBlockGround("conglomerate_of_coal", 5, <blockmaterial:clay>);
createBlockGround("conglomerate_of_sun",  5, <blockmaterial:clay>);

# -------------------------------
# Animal's items
# -------------------------------
buildItem("empowered_phosphor");
buildItem("saturated_phosphor");
buildItem("blasted_coal");

# -------------------------------
# Other
# -------------------------------
buildItem("bee_diversity");


val molten_spectre = VanillaFactory.createFluid("spectre", 0x9CC1CE);
molten_spectre.material = <blockmaterial:water>;
molten_spectre.viscosity = 3000;
molten_spectre.density = 6500;
// molten_spectre.colorize = true;
molten_spectre.temperature = 400;
molten_spectre.luminosity = 10;
molten_spectre.color = 0x9CC1CE;
// molten_spectre.stillLocation = "base:fluids/molten";
// molten_spectre.flowingLocation = "base:fluids/molten_flowing";
molten_spectre.register();

# -------------------------------
# perfect_fuel
# -------------------------------
val perfect_fuel = VanillaFactory.createFluid("perfect_fuel", 0xffcc00);
// perfect_fuel.fillSound = <soundevent:block.note.snare>;
perfect_fuel.material = <blockmaterial:lava>;
perfect_fuel.luminosity = 20;
perfect_fuel.viscosity = 8000;
perfect_fuel.temperature= 10000;
// perfect_fuel.stillLocation = "contenttweaker:fluids/perfect_fuel";
// perfect_fuel.flowingLocation = "contenttweaker:fluids/perfect_fuel_flow";
perfect_fuel.stillLocation = "contenttweaker:fluids/fluid";
perfect_fuel.flowingLocation = "contenttweaker:fluids/fluid_flowing";
perfect_fuel.register();