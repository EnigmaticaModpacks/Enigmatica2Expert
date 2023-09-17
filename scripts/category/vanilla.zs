
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.LootTable;

#priority -1

// -------------------------------------------------------------------------------
// Tools
// -------------------------------------------------------------------------------

// Buff Elythra durability (was 432)
<minecraft:elytra>.maxDamage = 1200;
<colytra:elytra_bauble>.maxDamage = 1200;

// Nerf torches from Light level 14
<minecraft:torch>.asBlock().definition.lightLevel = 0.75f;

<minecraft:cake>.maxStackSize = 64;

// -------------------------------------------------------------------------------
// Loot
// -------------------------------------------------------------------------------

# Add 100% Guardian Diode to Guardian
val guardTbl = loottweaker.LootTweaker.getTable("minecraft:entities/elder_guardian");
guardTbl.getPool("pool3").removeEntry("minecraft:gameplay/fishing/fish");
guardTbl.addPool("diode", 1, 1, 1, 1).addItemEntryHelper(<enderio:item_material:56>, 1, 0, [Functions.lootingEnchantBonus(0, 1, 0)], [Conditions.killedByPlayer()]);

# Add drops to vanilla entities
<entity:minecraft:endermite>.addDrop(<appliedenergistics2:material:46>, 1, 3);
<entity:minecraft:endermite>.addPlayerOnlyDrop(<endreborn:wolframium_nugget>, 1, 6);

val endermanPool = loottweaker.LootTweaker.getTable("minecraft:entities/enderman").getPool("main"); //Enderman (make enderpearls drop 100% of the time)
endermanPool.removeEntry("minecraft:ender_pearl"); //Remove main enderpearl entry
endermanPool.addItemEntryHelper(<minecraft:ender_pearl>, 1, 0, [Functions.lootingEnchantBonus(0, 1, 0)], [Conditions.killedByPlayer()]);

# More Zombie Pigman gold drop
loottweaker.LootTweaker.getTable("minecraft:entities/zombie_pigman").getPool("main")
.addItemEntryHelper(<minecraft:gold_ingot>, 1, 0, [Functions.lootingEnchantBonus(0, 1, 0)], [Conditions.killedByPlayer()]);

# Vex
loottweaker.LootTweaker.getTable("minecraft:entities/vex").getPool("main")
.addItemEntryHelper(<deepmoblearning:living_matter_overworldian>, 1, 0, [Functions.lootingEnchantBonus(0, 1, 0), Functions.setCount(0, 1)], [Conditions.killedByPlayer()]);

// -------------------------------------------------------------------------------

# *======= Adding Burnables =======*

furnace.setFuel(<minecraft:fire_charge>, 1200);# Fire Charges
furnace.setFuel(<ore:dustSulfur>, 300);# Sulfur
furnace.setFuel(<thermalfoundation:material:832>, 800);# Rosin
furnace.setFuel(<forestry:resource_storage>, 1000); # Apatite
furnace.setFuel(<forestry:apatite>, 100);
furnace.setFuel(<randomthings:ingredient:13>, 1200); # Blackout Powder
furnace.setFuel(<rats:little_black_squash_balls>, 8000);


// -------------------------------------------------------------------------------
// Recipes
// -------------------------------------------------------------------------------

// Bookshelf > Oak Bookshelf
recipes.addShapeless('Bookshelf Conversion', <minecraft:bookshelf>, [<ore:bookshelf>]);

// End Crystal
recipes.remove(<minecraft:end_crystal>);
recipes.addShaped('End Crystal',
  <minecraft:end_crystal>,
  [[<ore:blockGlassHardened>, <ore:blockGlassHardened>, <ore:blockGlassHardened>],
    [<ore:blockGlassHardened>, <ore:netherStar>, <ore:blockGlassHardened>],
    [<ore:blockGlassHardened>, <ore:itemGhastTear>, <ore:blockGlassHardened>]]);

// String recipes
var wool = <minecraft:wool:*>;
recipes.removeShapeless(<minecraft:string> * 4, [wool]);
recipes.removeShaped(<minecraft:string> * 4,
  [[wool, null, null],
    [null, null, null],
    [null, null, null]]);

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
  '  C  ',
  'X   X'], {
  A: <endreborn:item_angel_feather>, // Angel Feather
  C: <minecraft:web>,                // Cobweb
  X: <endreborn:death_essence>,      // Xorcite Shard
});

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

// Lesser blaze powder
recipes.removeShapeless(<minecraft:blaze_powder>, [<minecraft:blaze_rod>]);
recipes.addShapeless('harder_blaze_dust', <minecraft:blaze_powder>, [<minecraft:blaze_rod>]);

// Harder vanilla recipe
recipes.remove(<minecraft:flint_and_steel>);
recipes.addShapeless(<minecraft:flint_and_steel>, [<ore:ingotSteel>, <ore:itemFlint>]);

// Remove Glass pane non-oredict recipe
recipes.removeByRecipeName('minecraft:glass_pane');

// Red sand harder (for sieves)
mods.tconstruct.Casting.removeBasinRecipe(<minecraft:sand:1>);
mods.tconstruct.Casting.addBasinRecipe(<minecraft:sand:1>, <exnihilocreatio:block_granite_crushed>, <liquid:blood>, 10, true);

// Additional bonus
scripts.do.entity_kill_entity.add('minecraft:slime', 'minecraft:wolf', <ore:essencePrudentium>.firstItem);

// Compressed Sticks
recipes.remove(<openblocks:scaffolding>);
recipes.remove(<storagedrawers:customtrim>);
utils.compact(<ore:stickWood>, <openblocks:scaffolding>);
utils.compact(<openblocks:scaffolding>, <storagedrawers:customtrim>);

// Compress Arrows
recipes.remove(<extrautils2:spike_wood>);
recipes.remove(<extrautils2:spike_stone>);
utils.compact(<minecraft:arrow>, <extrautils2:spike_wood>);
utils.compact(<extrautils2:spike_wood>, <extrautils2:spike_stone>);

// ------------------------------------
// Crafting tables rework
// ------------------------------------

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

// ------------------------------------
// Piston
// ------------------------------------
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

// ------------------------------------
// Chests
// ------------------------------------
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

// Compressed chest
recipes.remove(<extrautils2:largishchest>);
utils.compact(<ore:chest>, <extrautils2:largishchest>);

// ------------------------------------
// Recycles
// ------------------------------------

// Arrows recycle
scripts.process.crush(<minecraft:arrow>, <minecraft:flint>, 'no exceptions', [<ore:dustWood>.firstItem], [0.2f]);

// Fire charge recycle
scripts.process.crush(<minecraft:fire_charge>, <thermalfoundation:material:768>,
  'only: eu2Crusher AACrusher crushingBlock', [
    <minecraft:gunpowder>, <minecraft:blaze_powder>
  ], [0.5f, 0.2f]
);

// ------------------------------------