#priority 9000

#loader contenttweaker

import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import mods.contenttweaker.AxisAlignedBB;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.Color;
import mods.contenttweaker.Item;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.SoundType;
import mods.contenttweaker.VanillaFactory;
import mods.ctutils.utils.Math.abs;

mods.contenttweaker.VanillaFactory.createCreativeTab('other', <item:minecraft:coal:1>).register();

function buildItem(name as string) {
  val item = VanillaFactory.createItem(name) as Item;
  item.setCreativeTab(<creativetab:other>);
  item.register();
}

function createBlock(name as string, level as int, blockMaterial as BlockMaterial, blockSoundType as SoundType, lightValue as int = 0) as void {
  val c = VanillaFactory.createBlock(name, blockMaterial);
  c.toolClass = 'pickaxe';
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

function createPill(name as string) {
  val pill = VanillaFactory.createItemFood(name, 50);
  pill.saturation = 0.0f;
  pill.alwaysEdible = true;
  pill.register();
}

/** Crafting Materials **/
for craftMat in [

  // TCon core ingredient
  'supremium_helmet_base',
  'supremium_chest_base',
  'supremium_leggings_base',
  'supremium_boots_base',

  // Compressed mekanism items
  'compressed_glowstone',
  'compressed_ender',
  'compressed_dimensional',

] as string[] {
  buildItem(craftMat);
}

createBlockStone('compressed_skystone'    , 6, <blockmaterial:rock>);
createBlockStone('compressed_andesite'    , 4, <blockmaterial:rock>);
createBlockStone('compressed_diorite'     , 4, <blockmaterial:rock>);
createBlockStone('compressed_granite'     , 4, <blockmaterial:rock>);
createBlockStone('compressed_garbage_pile', 4, <blockmaterial:rock>);

createBlockStone('compressed_crushed_skystone', 5, <blockmaterial:rock>);
createBlockStone('compressed_crushed_andesite', 3, <blockmaterial:rock>);
createBlockStone('compressed_crushed_diorite' , 3, <blockmaterial:rock>);
createBlockStone('compressed_crushed_granite' , 3, <blockmaterial:rock>);
createBlockStone('compressed_dried_sand'      , 3, <blockmaterial:rock>);
createBlockStone('compressed_gravisand'       , 5, <blockmaterial:rock>);
createBlockStone('compressed_red_sand'        , 3, <blockmaterial:rock>);
createBlockStone('compressed_white_sand'      , 3, <blockmaterial:rock>);
createBlockStone('block_sulfur'               , 2, <blockmaterial:sand>);
createBlockStone('compressed_block_sulfur'    , 3, <blockmaterial:sand>);
createBlockStone('compressed_pumpkin'         , 3, <blockmaterial:cactus>);
createBlockStone('compressed_pumpkin_double'  , 4, <blockmaterial:cactus>);
createBlockStone('compressed_string'          , 2, <blockmaterial:cloth>);
createBlockStone('compressed_string_double'   , 3, <blockmaterial:cloth>);
createBlockStone('compressed_basalt'          , 3, <blockmaterial:rock>);
createBlockStone('compressed_basalt_double'   , 5, <blockmaterial:rock>);

createBlockStone('terrestrial_artifact_block', 9, <blockmaterial:rock>);
createBlockStone('silicon_block', 4, <blockmaterial:rock>);

val gemABB = AxisAlignedBB.create(0.3, 0, 0.3, 0.7, 0.9, 0.7);
var
b = VanillaFactory.createBlock('anglesite', <blockmaterial:glass>);
b.toolClass = 'pickaxe';
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

b = VanillaFactory.createBlock('benitoite', <blockmaterial:glass>);
b.toolClass = 'pickaxe';
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

b = VanillaFactory.createBlock('ore_anglesite', <blockmaterial:rock>);
b.toolClass = 'pickaxe';
b.toolLevel = 11;
b.blockHardness = 20;
b.blockResistance = 18;
b.blockSoundType = <soundtype:stone>;
b.lightValue = 14.0 / 15.0 + 0.00001;
b.dropHandler = function (drops, world, position, state, fortune) {
  drops.clear();
  drops.add(<item:contenttweaker:anglesite>);
  for i in 0 .. fortune { drops.add(<item:contenttweaker:anglesite> % 50); }
};
b.register();

b = VanillaFactory.createBlock('ore_benitoite', <blockmaterial:rock>);
b.toolClass = 'pickaxe';
b.toolLevel = 11;
b.blockHardness = 20;
b.blockResistance = 18;
b.blockSoundType = <soundtype:stone>;
b.lightValue = 14.0 / 15.0 + 0.00001;
b.dropHandler = function (drops, world, position, state, fortune) {
  drops.clear();
  drops.add(<item:contenttweaker:benitoite>);
  for i in 0 .. fortune { drops.add(<item:contenttweaker:benitoite> % 50); }
};
b.register();

// -------------------------------
// Molten Cheese
// -------------------------------
var moltenCheese = MaterialSystem
  .getMaterialBuilder()
  .setName('Cheese')
  .setColor(Color.fromHex('FEE66F'))
  .build()
  .registerPart('molten')
  .getData();
moltenCheese.addDataValue('temperature', '300');
moltenCheese.addDataValue('density', '1004');
moltenCheese.addDataValue('viscosity', '2000');

// -------------------------------
// Molten heavy
// -------------------------------
var heavyMatBuilder = MaterialSystem
  .getMaterialBuilder()
  .setName('Heavy Metal')
  .setColor(Color.fromHex('444450'))
  .build();

var molten = heavyMatBuilder.registerPart('molten').getData();
molten.addDataValue('temperature', '320');
molten.addDataValue('density', '500000');
molten.addDataValue('viscosity', '30000');

// -------------------------------
// Seed
// -------------------------------
val seed_fluid = VanillaFactory.createFluid('seed', 0xFFE3D7C8);
seed_fluid.material = <blockmaterial:water>;
seed_fluid.density = 2009;
seed_fluid.viscosity = 3000;
seed_fluid.temperature = 290;
seed_fluid.stillLocation = 'contenttweaker:fluids/fluid';
seed_fluid.flowingLocation = 'contenttweaker:fluids/fluid_flowing';
seed_fluid.register();

// -------------------------------
// Animal's blocks
// -------------------------------
function getPlayer(world as IWorld, p as IBlockPos) as IPlayer {
  for pl in world.getAllPlayers() {
    if(abs(pl.x - p.x) > 60 || abs(pl.y - p.y) > 60 || abs(pl.z - p.z) > 60) continue;
    return pl;
  }
  return null;
}

function createParticles(world as IWorld, p as IBlockPos, amount as int = 10) as void {
  if(world.remote) return;
  val player = getPlayer(world, p);
  if(isNull(player)) return;
  server.commandManager.executeCommandSilent(<item:minecraft:dirt>.createEntityItem(world, p.x, p.y, p.z),
    "/particle heart "~
    ((p.x+0.5))~" "~(p.y+0.5)~" "~((p.z+0.5))~
    " 0.25 0.25 0.25 0.02 "~amount
  );
}

createBlockGround('conglomerate_of_coal', 5, <blockmaterial:clay>);

b = VanillaFactory.createBlock('conglomerate_of_life', <blockmaterial:clay>);
b.toolClass = 'shovel';
b.toolLevel = 3;
b.blockHardness = 3 * 1.6;
b.blockResistance = 3 * 1.4;
b.blockSoundType = <soundtype:ground>;
b.lightValue = (3 as double / 15.0 + 0.00001) as int;
b.onBlockPlace = function(world, p, blockState) { createParticles(world, p); };
b.onBlockBreak = function(world, p, blockState) { createParticles(world, p); };

val lifeRecipes = {
  'betteranimalsplus:goose': { <item:betteranimalsplus:golden_goose_egg>: 100},
  'minecraft:ocelot'       : { <item:actuallyadditions:item_hairy_ball> :  4 },
} as int[IItemStack][string];

b.onRandomTick = function(world, p, blockState) {
  if(world.remote) return;
  for entity in world.getEntities() {
    if(isNull(entity.definition)) continue;
    val output = lifeRecipes[entity.definition.id];
    if(isNull(output)) continue;

    for outItem, outChance in output {
      if(abs(entity.x - p.x) > 8 || abs(entity.y - p.y) > 8 || abs(entity.z - p.z) > 8) continue;
      if(world.getRandom().nextInt(outChance) != 1) continue;
      val w as IWorld = world;
      val itemEntity = outItem.createEntityItem(w, entity.x as float, entity.y as float, entity.z as float);
      itemEntity.motionY = 0.4;
      world.spawnEntity(itemEntity);
      createParticles(world, p, 3);
    }
  }
};
b.register();

createBlockGround('conglomerate_of_sun',  5, <blockmaterial:clay>);

// -------------------------------
// Animal's items
// -------------------------------
buildItem('empowered_phosphor');
buildItem('saturated_phosphor');
buildItem('blasted_coal');

// -------------------------------
// Nutrition pills
// -------------------------------
createPill('dairy_pill');
createPill('fruit_pill');
createPill('grain_pill');
createPill('protein_pill');
createPill('vegetable_pill');

// -------------------------------
// Other
// -------------------------------
buildItem('any_different_item');
buildItem('any_burnable');
buildItem('ore_phosphor');
buildItem('nugget_phosphor');
buildItem('dust_tiny_gold');
buildItem('dust_tiny_silver');
buildItem('compressed_tallow');

var x = VanillaFactory.createItem('bee_diversity');
x.setCreativeTab(<creativetab:other>);
x.rarity = 'rare';
x.register();

val molten_spectre = VanillaFactory.createFluid('spectre', 0xFF9CC1CE);
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

// -------------------------------
// perfect_fuel
// -------------------------------
val perfect_fuel = VanillaFactory.createFluid('perfect_fuel', 0xFFFFCC00);
perfect_fuel.material = <blockmaterial:lava>;
perfect_fuel.luminosity = 15;
perfect_fuel.viscosity = 8000;
perfect_fuel.temperature = 10000;
perfect_fuel.stillLocation = 'contenttweaker:fluids/fluid';
perfect_fuel.flowingLocation = 'contenttweaker:fluids/fluid_flowing';
perfect_fuel.register();

// -------------------------------
// Knowledge Absorber
// -------------------------------
x = VanillaFactory.createItem('knowledge_absorber');
x.maxStackSize = 1;
x.rarity = 'rare';
x.maxDamage = 9;
x.glowing = true;
x.register();

// -------------------------------
// electronics
// -------------------------------
var f = VanillaFactory.createFluid('electronics', 0xFF0A1410);
f.material = <blockmaterial:lava>;
f.viscosity = 8000;
f.temperature = 2000;
f.colorize = true;
f.stillLocation = 'base:fluids/molten';
f.flowingLocation = 'base:fluids/molten_flowing';
f.register();

// -------------------------------
// terrestrial
// -------------------------------
f = VanillaFactory.createFluid('terrestrial', 0xFFDB0F53);
f.material = <blockmaterial:lava>;
f.viscosity = 8000;
f.temperature = 8000;
f.colorize = true;
f.stillLocation = 'base:fluids/molten';
f.flowingLocation = 'base:fluids/molten_flowing';
f.register();

// -------------------------------
// mithrillium
// -------------------------------
val mr = VanillaFactory.createFluid('mithrillium', Color.fromHex('2B86FC'));
mr.material = <blockmaterial:lava>;
mr.viscosity = 2000;
mr.temperature = 6000;
mr.colorize = true;
mr.luminosity = 7;
mr.stillLocation = 'astralsorcery:blocks/fluid/starlight_still';
mr.flowingLocation = 'astralsorcery:blocks/fluid/starlight_flow';
mr.register();

// -------------------------------
// adaminite
// -------------------------------
val ada = VanillaFactory.createFluid('adaminite', Color.fromHex('AA002D'));
ada.material = <blockmaterial:lava>;
ada.viscosity = 4000;
ada.temperature = 7000;
ada.colorize = true;
ada.luminosity = 3;
ada.stillLocation = 'astralsorcery:blocks/fluid/starlight_still';
ada.flowingLocation = 'astralsorcery:blocks/fluid/starlight_flow';
ada.register();

// -------------------------------
// mithminite
// -------------------------------
val mm = VanillaFactory.createFluid('mithminite', Color.fromHex('ff80b7'));
mm.material = <blockmaterial:lava>;
mm.viscosity = 2000;
mm.temperature = 8000;
mm.colorize = true;
mm.luminosity = 10;
mm.stillLocation = 'astralsorcery:blocks/fluid/starlight_still';
mm.flowingLocation = 'astralsorcery:blocks/fluid/starlight_flow';
mm.register();
