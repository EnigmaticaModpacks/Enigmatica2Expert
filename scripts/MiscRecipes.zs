import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.craft.grid.Grid;

#priority -1

// Buff Elythra durability (was 432)
<minecraft:elytra>.maxDamage = 1200;
<colytra:elytra_bauble>.maxDamage = 1200;

// Quark Marble Wall Oredicted version
recipes.remove(<quark:marble_wall>);
recipes.addShaped('Quark Marble Wall',
  <quark:marble_wall> * 6,
  [[<ore:stoneMarble>, <ore:stoneMarble>, <ore:stoneMarble>],
    [<ore:stoneMarble>, <ore:stoneMarble>, <ore:stoneMarble>]]);

// MOAR BAITS
recipes.addShapeless('Polar Bear Bait',
  <excompressum:bait:10>,
  [<ore:fish>, <minecraft:snowball>]);
recipes.addShapeless('Llama Bait',
  <excompressum:bait:11>,
  [<ore:listAllgrain>, <ore:listAllsugar>]);

// NuclearCraft -> Random Things Glowing Mushroom
recipes.removeShapeless(<minecraft:brown_mushroom>, [<nuclearcraft:glowing_mushroom>]);
recipes.addShapeless('Random Things Glowing Mushroom',
  <randomthings:glowingmushroom>, [<nuclearcraft:glowing_mushroom>]);

// Bookshelf > Oak Bookshelf
recipes.addShapeless('Bookshelf Conversion', <minecraft:bookshelf>, [<ore:bookshelf>]);

// Uranium Block
recipes.addShaped('UraniumBlock',
  <immersiveengineering:storage:5>,
  [[<ore:ingotUranium>, <ore:ingotUranium>, <ore:ingotUranium>],
    [<ore:ingotUranium>, <ore:ingotUranium>, <ore:ingotUranium>],
    [<ore:ingotUranium>, <ore:ingotUranium>, <ore:ingotUranium>]]);
// Block -> Ingots
recipes.addShapeless('UraniumIngots',
  <immersiveengineering:metal:5> * 9,
  [<ore:blockUranium>]);

// Amber Conversion
recipes.addShapeless('BoP Amber', <biomesoplenty:gem:7> * 2, [<thaumcraft:amber>, <thaumcraft:amber>]);
recipes.addShapeless('Thaumcraft Amber', <thaumcraft:amber> * 2, [<biomesoplenty:gem:7>, <biomesoplenty:gem:7>]);

// End Crystal
recipes.remove(<minecraft:end_crystal>);
recipes.addShaped('End Crystal',
  <minecraft:end_crystal>,
  [[<ore:blockGlassHardened>, <ore:blockGlassHardened>, <ore:blockGlassHardened>],
    [<ore:blockGlassHardened>, <ore:netherStar>, <ore:blockGlassHardened>],
    [<ore:blockGlassHardened>, <ore:itemGhastTear>, <ore:blockGlassHardened>]]);

// Cyclic Guide
recipes.addShapeless('Cyclic Guide',
  <guideapi:cyclicmagic-guide>,
  [<minecraft:book>, <cyclicmagic:carbon_paper>]);

// Blood Magic Guide
recipes.addShapeless('Blood Magic Guide',
  <guideapi:bloodmagic-guide>,
  [<minecraft:book>, <bloodmagic:soul_snare>]);

// Animania Random Animal Spawn Egg
mods.forestry.Carpenter.addRecipe(<animania:entity_egg_random>,
  [[null, <cyclicmagic:sprout_seed>, null],
    [<ore:egg>, <ore:egg>, <ore:egg>],
    [null, <cyclicmagic:sprout_seed>, null]],
  40, <liquid:meat> * 500);

mods.forestry.Carpenter.addRecipe(<animania:entity_egg_random>,
  [[null, <cyclicmagic:sprout_seed>, null],
    [<ore:egg>, <ore:egg>, <ore:egg>],
    [null, <cyclicmagic:sprout_seed>, null]],
  40, <liquid:liquiddna> * 250);

// Mud conversion
recipes.remove(<animania:block_mud>);
recipes.addShapeless('BoP Mud', <biomesoplenty:mud>, [<animania:block_mud>]);
recipes.addShapeless('Animania Mud', <animania:block_mud>, [<biomesoplenty:mud>]);

// Iridium conversion
recipes.addShapeless(<thermalfoundation:material:135> * 2, [<ic2:misc_resource:1>, <ic2:misc_resource:1>]);
recipes.addShapeless(<ic2:misc_resource:1> * 2, [<thermalfoundation:material:135>, <thermalfoundation:material:135>]);

// Graphite conversion
recipes.addShapeless('Graphite Conversion 3', <bigreactors:blockgraphite> * 2, [<nuclearcraft:ingot_block:8>, <nuclearcraft:ingot_block:8>]);
recipes.addShapeless('Graphite Conversion 4', <nuclearcraft:ingot_block:8> * 2, [<bigreactors:blockgraphite>, <bigreactors:blockgraphite>]);

// Rustic Slate
recipes.addShapeless('slate',
  <rustic:slate> * 4,
  [<ore:stoneBasalt>, <ore:stoneBasalt>, <ore:stoneBasalt>, <ore:stoneLimestone>]);

// String recipes
var wool = <minecraft:wool:*>;
recipes.removeShapeless(<minecraft:string> * 4, [wool]);
recipes.removeShaped(<minecraft:string> * 4,
  [[wool, null, null],
    [null, null, null],
    [null, null, null]]);

// Piston
val pistonPlates = [
  <ore:plateIron>,
  <ore:plateCopper>,
  <ore:plateTin>,
  <ore:plateAluminum>,
  <ore:plateLead>,
] as IIngredient[];

// Tuples to keep order
val pistonWood = [
  { <ore:plankTreatedWood>: 2 },
  { <extrautils2:ironwood_planks:1>: 1 },
] as int[IIngredient][];

recipes.remove(<minecraft:piston>);
var k = 0;
for tuple in pistonWood{
  for wood, amount in tuple{
    for i, plate in pistonPlates{
      recipes.addShapedMirrored('piston' ~k,
        amount != 1 ? <minecraft:piston> * amount : <minecraft:piston>, [
          [wood, wood, wood],
          [<ore:compressed1xCobblestone>, plate, <ore:compressed1xCobblestone>],
          [<ore:compressed1xCobblestone>, <ore:dustRedstone>, <ore:compressed1xCobblestone>],
        ]);
      k += 1;
    }
  }
}

// Nametag
recipes.addShaped('Nametag',
  <minecraft:name_tag>,
  [[null, <ore:paper>, <ore:cropFlax>],
    [<ore:paper>, <ore:dyeBlack>, <ore:paper>],
    [<ore:paper>, <ore:paper>, null]]);

// Remove extraneous (and OP) Paper recipes
recipes.removeByRecipeName('minecraft:paper'); // Removed because EnderCore adds a shapeless one
recipes.removeByRecipeName('mekanism:paper'); // Removed because CHEATS

// [Elytra] from [Purpur Shards][+3]
recipes.removeShaped(<minecraft:elytra>);
craft.make(<minecraft:elytra>, ['pretty',
  'A   A',
  'A C A',
  'X   X'], {
  A: <endreborn:item_angel_feather>, // Angel Feather
  C: <minecraft:web>,                // Cobweb
  X: <endreborn:death_essence>,      // Xorcite Shard
});

// Farming for Blockheads Market
recipes.remove(<farmingforblockheads:market>);
recipes.remove(<harvestcraft:market>);
recipes.addShaped('Farming for Blockheads Market',
  <farmingforblockheads:market>,
  [[<ore:plankWood>, <ore:blockWool>, <ore:plankWood>],
    [<ore:logWood>, <ore:blockEmerald>, <ore:logWood>],
    [<ore:logWood>, <ore:logWood>, <ore:logWood>]]);

// Pam's Lavender Shortbread
recipes.remove(<harvestcraft:lavendershortbreaditem>);
recipes.addShapeless("Pam's Harvestcraft Lavender Shortbread",
  <harvestcraft:lavendershortbreaditem>,
  [<ore:toolBakeware>, <ore:foodDough>, <ore:flowerLavender>]);

// Dragon Egg
recipes.addShaped('Dragon Egg',
  <minecraft:dragon_egg>,
  [[<ore:elvenDragonstone>, <ore:egg>, <ore:elvenDragonstone>],
    [<draconicevolution:dragon_heart>, <mysticalagradditions:stuff:3>, <draconicevolution:dragon_heart>],
    [<ore:elvenDragonstone>, <ore:egg>, <ore:elvenDragonstone>]]);

// Minecraft Boats from oreDict planks
recipes.addShaped('Boat',
  <minecraft:boat>,
  [[<ore:plankWood>, null, <ore:plankWood>],
    [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]]);

// Wither Dust
recipes.remove(<darkutils:material>);
recipes.addShapeless('Wither Dust1', <darkutils:material> * 6, [<ore:boneWither>, <ore:boneWither>]);
recipes.addShapeless('Wither Dust2', <darkutils:material> * 9, [<minecraft:skull:1>]);
recipes.addShapeless('Wither Dust3', <darkutils:material> * 4, [<ore:blockWither>]);

// Chest

// Logs defined by Quark
val excludeLogs as IItemStack[] = [
  <minecraft:log>,
  <minecraft:log:1>,
  <minecraft:log:2>,
  <minecraft:log:3>,
  <minecraft:log2>,
  <minecraft:log2:1>,
];

// Ingredient of all possible logs except listed above
var logsFiltered as IIngredient = <minecraft:log>;
for log in <ore:logWood>.items{
  var isAdd = true;
  for i in 0 .. excludeLogs.length {
    if ((log in excludeLogs[i]) || (excludeLogs[i] in log)) {
      isAdd = false;
    }
  }
  if (isAdd) {
    logsFiltered = logsFiltered.or(log);
  }
}

function remakeChest(name as string, chest as IItemStack, log as IIngredient) {
  recipes.remove(chest);

  recipes.addShapedMirrored(name, chest * 2,
    [[log, <ore:plankTreatedWood>, log],
      [<ore:plankTreatedWood>, <minecraft:stone_button>, <ore:plankTreatedWood>],
      [log, <ore:plankTreatedWood>, log]]);

  val toolRod = <tconstruct:tough_tool_rod>.withTag({ Material: 'wood' });
  recipes.addShaped('Cheap ' ~ name, chest,
    [[log, toolRod, log],
      [toolRod, <minecraft:stone_button>, toolRod],
      [log, toolRod, log]]);
}

// Quark chests
remakeChest('Spruce Chest', <quark:custom_chest>, <minecraft:log:1>);
remakeChest('Birch Chest', <quark:custom_chest:1>, <minecraft:log:2>);
remakeChest('Jungle Chest', <quark:custom_chest:2>, <minecraft:log:3>);
remakeChest('Acacia Chest', <quark:custom_chest:3>, <minecraft:log2>);
remakeChest('Dark Oak Chest', <quark:custom_chest:4>, <minecraft:log2:1>);

// Chest from any log
remakeChest('Any Chest', <minecraft:chest>, logsFiltered);

recipes.addShaped('Mini Chest To Chest',
  <minecraft:chest>,
  [[<extrautils2:minichest>, <extrautils2:minichest>, <extrautils2:minichest>],
    [<extrautils2:minichest>, <extrautils2:minichest>, <extrautils2:minichest>],
    [<extrautils2:minichest>, <extrautils2:minichest>, <extrautils2:minichest>]]);

// Chest to chest
recipes.addShapeless('Chest Conversion', <minecraft:chest> * 2, [<ore:chest>, <ore:chest>]);

// [Ender Chest] from [Ender Chest][+5]
craft.remake(<enderstorage:ender_storage>, ['pretty',
  'C E C',
  'M n M',
  '▬ ▲ ▬'], {
  '▲': <ore:dustWither>,          // Wither Ash
  'C': <minecraft:web>,           // Cobweb
  'E': <ore:nuggetEnderium>,      // Enderium Nugget
  '▬': <ore:ingotArdite>,         // Ardite Ingot
  'M': <tconstruct:materials:19>, // Mending Moss
  'n': <ore:chestEnder>,          // Ender Chest
});

// [Ender Tank] from [Crucible][+5]
craft.remake(<enderstorage:ender_storage:1>, ['pretty',
  'C E C',
  'M r M',
  '▬ ▲ ▬'], {
  '▲': <ore:dustWither>,          // Wither Ash
  'r': <thaumcraft:crucible>,     // Crucible
  'C': <minecraft:web>,           // Cobweb
  'E': <ore:nuggetEnderium>,      // Enderium Nugget
  '▬': <ore:ingotArdite>,         // Ardite Ingot
  'M': <tconstruct:materials:19>, // Mending Moss
});

// [Ender Pouch] from [Mending Moss][+5]
craft.remake(<enderstorage:ender_pouch>, ['pretty',
  'C E C',
  'H M H',
  '▬ ▲ ▬'], {
  '▲': <ore:dustWither>,                   // Wither Ash
  'C': <minecraft:web>,                    // Cobweb
  'E': <extendedcrafting:material:37>,     // Ender Nugget
  'H': <harvestcraft:hardenedleatheritem>, // Hardened Leather
  '▬': <ore:ingotArdite>,                  // Ardite Ingot
  'M': <tconstruct:materials:19>,          // Mending Moss
});

// Cauldron
recipes.remove(<minecraft:cauldron>);
recipes.addShapedMirrored('Iron Cauldron',
  <minecraft:cauldron>,
  [[<ore:plateIron>, null, <ore:plateIron>],
    [<ore:plateIron>, null, <ore:plateIron>],
    [<ore:plateIron>, <ore:plateIron>, <ore:plateIron>]]);

recipes.addShapedMirrored('Aluminum Cauldron',
  <minecraft:cauldron>,
  [[<ore:plateAluminum>, null, <ore:plateAluminum>],
    [<ore:plateAluminum>, null, <ore:plateAluminum>],
    [<ore:plateAluminum>, <ore:plateAluminum>, <ore:plateAluminum>]]);

// [Furnace] from [Coal][+2]
craft.remake(<minecraft:furnace>, ['pretty',
  '░ ░ ░',
  'S ☺ S',
  '░ ░ ░'], {
  '░': <ore:cobblestone>, // Cobblestone
  'S': <ore:gearStone>,   // Stone Gear
  '☺': <minecraft:coal:*> | <actuallyadditions:item_misc:22>, // Coal
});

// Hopper
recipes.remove(<minecraft:hopper>);
recipes.addShaped('Hopper Aluminum',
  <minecraft:hopper>,
  [[<ore:plateAluminum>, null, <ore:plateAluminum>],
    [<ore:plateAluminum>, <ore:chest>, <ore:plateAluminum>],
    [null, <ore:plateAluminum>, null]]);

recipes.addShaped('Hopper Iron',
  <minecraft:hopper>,
  [[<ore:plateIron>, null, <ore:plateIron>],
    [<ore:plateIron>, <ore:chest>, <ore:plateIron>],
    [null, <ore:plateIron>, null]]);

// Bucket
recipes.remove(<minecraft:bucket>);
recipes.addShaped('Bucket',
  <minecraft:bucket>,
  [[<ore:plateIron>, null, <ore:plateIron>],
    [null, <ore:plateIron>, null]]);

// *======= Recycles =======*

// Arrows recycle
scripts.process.crush(<minecraft:arrow>, <minecraft:flint>, 'no exceptions', [<ore:dustWood>.firstItem], [0.2f]);

// Make Quicksand
scripts.process.solution([<ore:soulSand>], [<liquid:blueslime> * 1000], [<liquid:sand> * 1000], null, 'except: highoven');

// [Bedrock Miner] from [Grains of Infinity][+2]
craft.remake(<bedrockores:bedrock_miner>, ['pretty',
  '⌂ ⌃ ⌂',
  '⌃ ▲ ⌃',
  '⌂ ⌃ ⌂'], {
  '⌂': <ic2:casing:4>,       // Lead Item Casing
  '⌃': <ore:gemQuartzBlack>, // Black Quartz
  '▲': <ore:dustBedrock>,    // Grains of Infinity
});

// [Sandwich_Station] from [Cooking_Table][+3]
recipes.remove(<culinaryconstruct:sandwich_station>);
mods.extendedcrafting.TableCrafting.addShaped(0,
  <culinaryconstruct:sandwich_station>, Grid(['pretty',
    '  T  ',
    'F C F',
    'K K K'], {
    C: <cookingforblockheads:cooking_table>, // Cooking Table
    T: <rats:tiny_coin>,                     // Tiny Coin
    F: <nuclearcraft:foursmore>,             // FourS'more QuadS'mingot
    K: <cookingforblockheads:counter>,        // Kitchen Counter
  }).shaped());

// Peacock fan
recipes.addShaped(<twilightforest:peacock_fan>, [
  [<ore:peacockFeathers>, <ore:peacockFeathers>, null],
  [<forestry:oak_stick>, <forestry:oak_stick>, <ore:peacockFeathers>],
  [<ore:slimecrystalBlue>, <forestry:oak_stick>, <ore:peacockFeathers>],
]);

// Lesser blaze powder
recipes.removeShapeless(<minecraft:blaze_powder>, [<minecraft:blaze_rod>]);
recipes.addShapeless('harder_blaze_dust', <minecraft:blaze_powder>, [<minecraft:blaze_rod>]);

// Harder vanilla recipe
recipes.remove(<minecraft:flint_and_steel>);
recipes.addShapeless(<minecraft:flint_and_steel>, [<ore:ingotSteel>, <ore:itemFlint>]);

// ------ Silicon unification ------

var trueSilicon = <appliedenergistics2:material:5>;
<ore:itemSilicon>.remove([<nuclearcraft:gem:6>, <libvulpes:productingot:3>, <enderio:item_material:5>]);
<ore:ingotSilicon>.add(trueSilicon);

// Removing
furnace.remove(<appliedenergistics2:material:5>); // Furnance quartz dusts -> AE silicon
mods.nuclearcraft.manufactory.removeRecipeWithOutput(<appliedenergistics2:material:5>); // Ingot->AE
mods.mekanism.crusher.removeRecipe(<nuclearcraft:gem:6>); // Sand -> silicon

// Addition
furnace.addRecipe(trueSilicon, <ore:dustCertusQuartz>, 4.0d);
furnace.addRecipe(trueSilicon, <ore:dustNetherQuartz>, 4.0d);
mods.thermalexpansion.Compactor.addMintRecipe(trueSilicon * 2, <minecraft:sand>, 4000);

// Tallow into biomass
scripts.process.compress(<ore:tallow> * 64, <contenttweaker:compressed_tallow>, 'except: compressor');
scripts.process.melt(<ore:tallow>, <liquid:biomass> * 20);
scripts.process.melt(<contenttweaker:compressed_tallow>, <liquid:biomass> * 1280);

// Molten Cheese
scripts.process.melt(<ore:cheeseWheels> | <ore:blockCheese>, <liquid:cheese> * 1000);
scripts.process.melt(<ore:foodCheese>, <liquid:cheese> * 250);
mods.tconstruct.Casting.addBasinRecipe(<rats:block_of_cheese>, null, <liquid:cheese>, 1000);

// Hardened Ice Unification
craft.make(<biomesoplenty:hard_ice> * 8, ['AAA', 'A A', 'AAA'], { A: <mysticalagriculture:ice_essence> });
scripts.process.compress(<minecraft:packed_ice> * 2, <biomesoplenty:hard_ice>);

// Remove Glass pane non-oredict recipe
recipes.removeByRecipeName('minecraft:glass_pane');

// Nerf torches from Light level 14
<minecraft:torch>.asBlock().definition.lightLevel = 0.7f;

// Prevent melting dupe
craft.remake(<quark:obsidian_pressure_plate>, ['AA', 'AA'], { A: <ore:obsidian> });

// Conflict recipes
recipes.removeByRecipeName('quark:basalt_1');

<minecraft:cake>.maxStackSize = 64;

// Compressed chest
recipes.remove(<extrautils2:largishchest>);
utils.compact(<ore:chest>, <extrautils2:largishchest>);

// Sunshine from Sun conglomerate
mods.mechanics.addTubeRecipe([<contenttweaker:conglomerate_of_sun>], <liquid:liquid_sunshine> * 1000);

// Life Essence from Sun conglomerate
mods.mechanics.addTubeRecipe([<contenttweaker:conglomerate_of_life>], <liquid:lifeessence> * 1000);

// Silicon Block
craft.shapeless(<contenttweaker:silicon_block>, 'AAAAAAAAA', { A: <ore:ingotSilicon> });
craft.shapeless(<libvulpes:productingot:3> * 9,   'A', { A: <contenttweaker:silicon_block> });

// [Conglomerate Of Life]*2 from [Cheese Wheel][+4]
craft.make(<contenttweaker:conglomerate_of_life> * 2, ['pretty',
  '▲ B ▲',
  'D W D',
  '▲ C ▲'], {
  '▲': <scalinghealth:heartdust>,           // Heart Dust
  'B': <randomthings:rezstone>,             // Blood Stone
  'D': <iceandfire:dragon_meal>,            // Dragon Meal
  'W': <ore:cheeseWheels>,                  // Cheese Wheel
  'C': <cyclicmagic:crystallized_obsidian>, // Crystallized Obsidian
});

// [Conglomerate_Of_Sun*8] from [Totem_of_Undying][+3]
craft.make(<contenttweaker:conglomerate_of_sun> * 8, ['pretty',
  'R o R',
  'C T C',
  'R o R'], {
  R: <ore:myrmexResin>,                // Desert Myrmex Resin Chunk
  C: <cyclicmagic:crystallized_amber>, // Crystallized Amber
  T: <minecraft:totem_of_undying>,     // Totem of Undying
  o: <ore:dropRoyalJelly>,              // Royal Jelly
});

// Saturate Phosphor
scripts.process.fill(<contenttweaker:empowered_phosphor>, <fluid:syngas> * 1000, <contenttweaker:saturated_phosphor>, 'only: MechanicalDryingBasin NCInfuser Transposer');

// [Empowered Phosphor] from [Phosphor][+1]
scripts.process.alloy([<contenttweaker:blasted_coal>, <forestry:phosphor>], <contenttweaker:empowered_phosphor>, 'Only: Kiln Induction');

mods.inworldcrafting.ExplosionCrafting.explodeBlockRecipe(<contenttweaker:blasted_coal> * 2, <contenttweaker:conglomerate_of_coal>);
craft.make(<contenttweaker:conglomerate_of_coal>, ['pretty',
  'L B L',
  '▲ i ▲',
  'L B L'], {
  '▲': <mechanics:fuel_dust_tiny>,      // Tiny Pile of Heavy Fuel Dust
  'B': <randomthings:ingredient:13>,    // Blackout Powder
  'i': <forestry:bituminous_peat>,      // Bituminous Peat
  'L': <rats:little_black_squash_balls>, // Little Black Squash Balls
});

// Red sand harder (for sieves)
mods.tconstruct.Casting.removeBasinRecipe(<minecraft:sand:1>);
mods.tconstruct.Casting.addBasinRecipe(<minecraft:sand:1>, <exnihilocreatio:block_granite_crushed>, <liquid:blood>, 10, true);

/*
# Knowledge absorber craft
# [Golden eye] from [Ender Orb Translocator][+3]
craft.make(<contenttweaker:knowledge_absorber>, ["pretty",
  "  *  ",
  "L E L",
  "  R  "], {
  "*": <extrautils2:suncrystal>,  # Sun Crystal
  "L": <ore:shardLormyte>,        # Lormyte Crystal
  "E": <cyclicmagic:ender_pearl_mounted>.anyDamage(), # Ender Orb Translocator
  "R": <ore:itemResin>, # Sticky Resin
});

# Oh my gold, this hack!
# I cant use random() function, because it would return different values
# on client and server, that would result ingredient being
# dissapearing on one side and persist on another.
# This code not perfect any way - it would give different values
# when playing on server. But it would be happen stable amount of times.
static absorber_crafts_count as long[crafttweaker.world.IWorld] = {} as long[crafttweaker.world.IWorld];

val transformedAbsorber = <contenttweaker:knowledge_absorber>.anyDamage().transform(function(item, player) {
  absorber_crafts_count[player.world] =
    !isNull(absorber_crafts_count[player.world]) ? absorber_crafts_count[player.world] as long + 1 : 1;

  val damaged = (item.damage) < item.maxDamage
    ? item.withDamage(item.damage + 1)
    : null;

  if(!item.isEnchanted || item.enchantments.length < 1) return damaged;

  for ench in item.enchantments {
    if(ench.definition != <enchantment:minecraft:unbreaking>) continue;
    return (
      (player.world.time + absorber_crafts_count[player.world] as long) % ((ench.level + 1) as long) != 0
    ) ? item : damaged;
  }
  return damaged;
});

# Create "Void Miner" recipes by animals
for mobName, arr in {
  Cow     : [<ore:endstone>, <netherendingores:ore_end_modded_1:11>],
  Pig     : [<ore:endstone>, <netherendingores:ore_end_vanilla:3>],
  Cat     : [<ore:endstone>, <endreborn:block_wolframium_ore>],
  Enderman: [<ore:endstone>, <endreborn:dragon_essence>],
  Chicken : [<ore:endstone>, <netherendingores:ore_end_vanilla:6>],
  Dog     : [<ore:stone>,    <actuallyadditions:block_misc:3>],
  Sheep   : [<ore:stone>,    <forestry:resources>],
  Creeper : [<ore:endstone>, <netherendingores:ore_end_vanilla:1>],
  Zombie  : [<ore:endstone>, <netherendingores:ore_end_modded_1:12>],
} as IIngredient[][string] {
  val book = scripts._init.variables.bookWrittenBy_ingr[mobName];
  if(arr.length < 2 || isNull(arr[0]) || isNull(arr[1]) || isNull(book)) continue;
  val input = arr[0];
  val output = arr[1].itemArray[0];
  recipes.addShapeless("knowledge_absorber_"~mobName, output * 7, [
    input, book, input,
    input, transformedAbsorber, input,
    input, input, input,
  ]);
}
 */

// Molten Electronics casts
mods.tconstruct.Casting.addTableRecipe(<opencomputers:material:7>, <tconstruct:cast>.withTag({ PartType: 'tconstruct:shard' }), <liquid:electronics>, 8);
mods.tconstruct.Casting.addTableRecipe(<opencomputers:material:6>, <tconstruct:cast_custom:1>, <liquid:electronics>, 16);
mods.tconstruct.Casting.addTableRecipe(<opencomputers:storage>, null, <liquid:electronics>, 144);
mods.tconstruct.Casting.addTableRecipe(<opencomputers:material:8>, <tconstruct:cast_custom>, <liquid:electronics>, 144);
mods.tconstruct.Casting.addTableRecipe(<opencomputers:material:10>, <tconstruct:cast_custom:3>, <liquid:electronics>, 144);
mods.tconstruct.Casting.addTableRecipe(<opencomputers:material:9>, <tconstruct:cast>.withTag({ PartType: 'tconstruct:sign_head' }), <liquid:electronics>, 144 * 3);
mods.tconstruct.Casting.addTableRecipe(<opencomputers:material:5>, <tconstruct:cast_custom:4>, <liquid:electronics>, 144 * 4);
mods.tconstruct.Casting.addTableRecipe(<opencomputers:material:11>, <tconstruct:cast>.withTag({ PartType: 'tconstruct:hammer_head' }), <liquid:electronics>, 144 * 8);
mods.tconstruct.Casting.addBasinRecipe(<opencomputers:case1>, null, <liquid:electronics>, 144 * 9);

// Additional bonus
scripts.loot.entity_kill_entity.add('minecraft:slime', 'minecraft:wolf', <ore:essencePrudentium>.firstItem);

// Other silver occurances
mods.appliedenergistics2.Grinder.removeRecipe(<minecraft:gold_ore>);
scripts.process.crush(<minecraft:gold_ore>, <thermalfoundation:material:1>, 'only: AEGrinder', [<contenttweaker:dust_tiny_silver>], [0.9f]);

// Compressed Sticks
recipes.remove(<openblocks:scaffolding>);
recipes.remove(<storagedrawers:customtrim>);
utils.compact(<ore:stickWood>, <openblocks:scaffolding>);
utils.compact(<openblocks:scaffolding>, <storagedrawers:customtrim>);

// Crafting tables rework
recipes.removeByRecipeName('minecraft:crafting_table');
recipes.removeByRecipeName('tconstruct:tools/table/crafting_station');
val PL = <ore:plankWood>;

// Keep texture for station
recipes.addShaped('Crafting Station textured', <tconstruct:tooltables>, [
  [PL.marked('p1'), PL.marked('p2')], [PL.marked('p3'), PL.marked('p4')],
], function (out, ins, cInfo) {
  if (isNull(ins)
    || isNull(ins.p1)
    || isNull(ins.p2)
    || isNull(ins.p3)
    || isNull(ins.p4)
  ) return null;

  // If every plank not same, return texturless
  for i in 2 .. 5 {
    if (!ins.p1.matches(ins['p' ~i])) return out;
  }

  return <tconstruct:tooltables>.withTag({ textureBlock: { id: ins.p1.definition.id, Count: 1 as byte, Damage: ins.p1.damage } });
}, null);

// Convert station to table but keeping texture
recipes.addShapeless('Crafting Table conversion', <minecraft:crafting_table>, [
  <tconstruct:tooltables>.marked('station'),
], function (out, ins, cInfo) {
  if (isNull(ins) || isNull(ins.station)) return null;

  if (isNull(ins.station.tag)
    || isNull(ins.station.tag.textureBlock)
    || isNull(ins.station.tag.textureBlock.id)
    || isNull(ins.station.tag.textureBlock.Damage)
  ) return out;

  return <randomthings:customworkbench>.withTag({
    woodName: ins.station.tag.textureBlock.id.asString(),
    woodMeta: ins.station.tag.textureBlock.Damage.asInt(),
  });
}, null);

// Convert to vanilla
recipes.addShapeless('Crafting Table 2', <minecraft:crafting_table>, [<ore:workbench>]);
