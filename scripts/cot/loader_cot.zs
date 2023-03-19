#priority 9000

#loader contenttweaker

import crafttweaker.data.IData;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.event.EntityLivingFallEvent;
import crafttweaker.item.IItemDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IWorld;
import mods.contenttweaker.AxisAlignedBB;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Color;
import mods.contenttweaker.Item;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.SoundType;
import mods.contenttweaker.VanillaFactory;
import mods.ctutils.utils.Math.abs;
import mods.ctutils.utils.Math.floor;
import mods.ctutils.utils.Math.max;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.sqrt;

mods.contenttweaker.VanillaFactory.createCreativeTab("other", <item:minecraft:coal:1>).register();

function buildItem(name as string) {
	val item = VanillaFactory.createItem(name) as Item;
	item.setCreativeTab(<creativetab:other>);
	item.register();
}

function createBlock(name as string, level as int, blockMaterial as BlockMaterial, blockSoundType as SoundType, lightValue as int = 0) as void {
	val c = VanillaFactory.createBlock(name, blockMaterial);
	c.toolClass = "pickaxe";
	c.toolLevel = level;
	c.blockHardness = level * 1.6;
	c.blockResistance = level * 1.4;
	c.blockSoundType = blockSoundType;
	c.lightValue = (lightValue as double / 15.0 + 0.00001) as int;
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
  "compressed_dimensional",
  
] as string[] {
	buildItem(craftMat);
}

createBlockStone("compressed_skystone", 6, <blockmaterial:rock>);
createBlockStone("compressed_andesite", 4, <blockmaterial:rock>);
createBlockStone("compressed_diorite" , 4, <blockmaterial:rock>);
createBlockStone("compressed_granite" , 4, <blockmaterial:rock>);
createBlockStone("compressed_garbage_pile" , 4, <blockmaterial:rock>);

createBlockStone("compressed_crushed_skystone", 5, <blockmaterial:rock>);
createBlockStone("compressed_crushed_andesite", 3, <blockmaterial:rock>);
createBlockStone("compressed_crushed_diorite" , 3, <blockmaterial:rock>);
createBlockStone("compressed_crushed_granite" , 3, <blockmaterial:rock>);
createBlockStone("compressed_dried_sand"      , 3, <blockmaterial:rock>);
createBlockStone("compressed_gravisand"       , 5, <blockmaterial:rock>);
createBlockStone("compressed_red_sand"        , 3, <blockmaterial:rock>);
createBlockStone("compressed_white_sand"      , 3, <blockmaterial:rock>);
createBlockStone("block_sulfur"               , 2, <blockmaterial:sand>);
createBlockStone("compressed_block_sulfur"    , 3, <blockmaterial:sand>);
createBlockStone("compressed_pumpkin"   		  , 3, <blockmaterial:cactus>);
createBlockStone("compressed_pumpkin_double"  , 4, <blockmaterial:cactus>);
createBlockStone("compressed_string" 				  , 2, <blockmaterial:cloth>);

createBlockStone("terrestrial_artifact_block", 9, <blockmaterial:rock>);
createBlockStone("silicon_block", 4, <blockmaterial:rock>);

val gemABB = AxisAlignedBB.create(0.3, 0, 0.3, 0.7, 0.9, 0.7);
var
b = VanillaFactory.createBlock("anglesite", <blockmaterial:glass>);
b.toolClass = "pickaxe";
b.toolLevel = 10;
b.blockHardness = 16;
b.blockResistance = 14;
b.blockSoundType = <soundtype:glass>;
b.lightValue = 1;
b.axisAlignedBB = gemABB;
b.entitySpawnable = false;
b.fullBlock = false;
b.lightOpacity = 27;
b.translucent = true;
b.register();

b = VanillaFactory.createBlock("benitoite", <blockmaterial:glass>);
b.toolClass = "pickaxe";
b.toolLevel = 10;
b.blockHardness = 16;
b.blockResistance = 14;
b.blockSoundType = <soundtype:glass>;
b.lightValue = 1;
b.axisAlignedBB = gemABB;
b.entitySpawnable = false;
b.fullBlock = false;
b.lightOpacity = 27;
b.translucent = true;
b.register();

b = VanillaFactory.createBlock("ore_anglesite", <blockmaterial:rock>);
b.toolClass = "pickaxe";
b.toolLevel = 11;
b.blockHardness = 20;
b.blockResistance = 18;
b.blockSoundType = <soundtype:stone>;
b.lightValue = 14.0 / 15.0 + 0.00001;
b.dropHandler = function(drops, world, position, state, fortune) {
	drops.clear();
	drops.add(<item:contenttweaker:anglesite>);
	for i in 0 .. fortune { drops.add(<item:contenttweaker:anglesite> % 50); }
	return;
};
b.register();

b = VanillaFactory.createBlock("ore_benitoite", <blockmaterial:rock>);
b.toolClass = "pickaxe";
b.toolLevel = 11;
b.blockHardness = 20;
b.blockResistance = 18;
b.blockSoundType = <soundtype:stone>;
b.lightValue = 14.0 / 15.0 + 0.00001;
b.dropHandler = function(drops, world, position, state, fortune) {
	drops.clear();
	drops.add(<item:contenttweaker:benitoite>);
	for i in 0 .. fortune { drops.add(<item:contenttweaker:benitoite> % 50); }
	return;
};
b.register();


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
val seed_fluid = VanillaFactory.createFluid("seed", 0xffe3d7c8);
seed_fluid.material = <blockmaterial:water>;
seed_fluid.density= 2009;
seed_fluid.viscosity = 3000;
seed_fluid.temperature = 290;
seed_fluid.stillLocation = "contenttweaker:fluids/fluid";
seed_fluid.flowingLocation = "contenttweaker:fluids/fluid_flowing";
seed_fluid.register();


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
buildItem("any_different_item");
buildItem("any_burnable");
buildItem("ore_phosphor");
buildItem("nugget_phosphor");
buildItem("dust_tiny_gold");
buildItem("dust_tiny_silver");
buildItem("compressed_tallow");

var x = VanillaFactory.createItem("bee_diversity");
x.setCreativeTab(<creativetab:other>);
x.rarity = "rare";
x.register();


val molten_spectre = VanillaFactory.createFluid("spectre", 0xff9CC1CE);
molten_spectre.material = <blockmaterial:water>;
molten_spectre.viscosity = 3000;
molten_spectre.density = 6500;
// molten_spectre.colorize = true;
molten_spectre.temperature = 400;
molten_spectre.luminosity = 10;
molten_spectre.color = 0x9CC1CE;
molten_spectre.colorize = true;
// molten_spectre.stillLocation = "base:fluids/molten";
// molten_spectre.flowingLocation = "base:fluids/molten_flowing";
molten_spectre.register();

# -------------------------------
# perfect_fuel
# -------------------------------
val perfect_fuel = VanillaFactory.createFluid("perfect_fuel", 0xffffcc00);
perfect_fuel.material = <blockmaterial:lava>;
perfect_fuel.luminosity = 15;
perfect_fuel.viscosity = 8000;
perfect_fuel.temperature= 10000;
perfect_fuel.stillLocation = "contenttweaker:fluids/fluid";
perfect_fuel.flowingLocation = "contenttweaker:fluids/fluid_flowing";
perfect_fuel.register();

# -------------------------------
# Knowledge Absorber
# -------------------------------
x = VanillaFactory.createItem("knowledge_absorber");
x.maxStackSize = 1;
x.rarity = "rare";
x.maxDamage = 9;
x.glowing = true;
x.register();

# -------------------------------
# electronics
# -------------------------------
var f = VanillaFactory.createFluid("electronics", 0xff0a1410);
f.material = <blockmaterial:lava>;
f.viscosity = 8000;
f.temperature= 2000;
f.colorize = true;
f.stillLocation = "base:fluids/molten";
f.flowingLocation = "base:fluids/molten_flowing";
f.register();

# -------------------------------
# terrestrial
# -------------------------------
f = VanillaFactory.createFluid("terrestrial", 0xffdb0f53);
f.material = <blockmaterial:lava>;
f.viscosity = 8000;
f.temperature= 8000;
f.colorize = true;
f.stillLocation = "base:fluids/molten";
f.flowingLocation = "base:fluids/molten_flowing";
f.register();