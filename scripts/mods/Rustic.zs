
#modloaded rustic

import crafttweaker.item.IItemStack;

# Simplified Crushing tub
recipes.remove(<rustic:crushing_tub>);
recipes.addShaped(<rustic:crushing_tub>, [
  [<ore:slabWood>, null, <ore:slabWood>],
  [<ore:slabWood>, <ore:slabWood>, <ore:slabWood>]]);

# Growing olives
scripts.process.grow(<rustic:olives>, <rustic:olives> * 9, null, null, 0);

/*
  Sadly, but cabinet recipe cant be removed
*/
// # Remake Cabinets
// craft.make(<rustic:cabinet>, ["pretty",
//   "A A B",
//   "A   C",
//   "A A B"], {
//   A: <ore:plankWood>.marked("marked"),
//   B: <bibliocraft:framingsheet>,
//   C: <ore:doorWood>,
//   }, function(out, ins, cInfo) {
//     var id = "minecraft:air";
//     var count = 0 as byte;
//     var damage = 0 as short;
//     if(ins has "marked" && !isNull(ins.marked)) {
//       id = ins.marked.definition.id;
//       count = 1;
//       damage = ins.marked.damage;
//     }
//     return out.withTag({material: {id: id, Count: count, Damage: damage}});
// 	});

# Conflicting recipe
# [Wooden Stake*4] from [Oak Log]
craft.remake(<rustic:crop_stake> * 4, ["#","#","#"], {
  "#": <ore:logWood>, # Oak Log
});

# Skyblock alt
mods.rustic.CrushingTub.addRecipe(<liquid:water> * 100, <minecraft:dye:2>, <minecraft:cactus>);
