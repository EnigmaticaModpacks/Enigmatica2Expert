#modloaded enderstorage

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