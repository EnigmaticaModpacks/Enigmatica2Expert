
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

# Remove tiny pile and replace it with Ore Piece
mods.forestry.Squeezer.removeRecipe(<liquid:ironberryjuice>);
mods.rustic.EvaporatingBasin.removeRecipe(<rustic:dust_tiny_iron>);
mods.rustic.EvaporatingBasin.addRecipe(<exnihilocreatio:item_ore_iron>, <liquid:ironberryjuice> * 1000, 30*20);

# [Liquid Barrel] from [Oak Wood Slab][+2]
craft.remake(<rustic:liquid_barrel>, ["pretty",
  "#   #",
  "‚   ‚",
  "# ≢ #"], {
  "#": <ore:plankWood>, # Oak Wood Planks
  "‚": <ore:nuggetFakeIron>, # Iron Alloy Nugget
  "≢": <ore:slabWood>, # Oak Wood Slab
});

# Crushed ice pricy alt
mods.rustic.CrushingTub.addRecipe(<liquid:ice> * 100, null, <mctsmelteryio:iceball>);

# [Wooden Lantern]*2 from [Charcoal]*3[+1]
craft.remake(<rustic:lantern_wood> * 2, [
  "#",
  "c",
  "#"], {
  "#": <ore:plankWood>,    # Oak Wood Planks
  "c": <minecraft:coal:*>, # Charcoal
});

# [Golden Lantern]*2 from [Gold Item Casing][+1]
craft.remake(<rustic:golden_lantern> * 2, [
  "c",
  "⌂"], {
  "c": <minecraft:coal:*>, # Charcoal
  "⌂": <ic2:casing:2>,     # Gold Item Casing
});

# [Iron Lantern]*2 from [Iron Item Casing][+1]
craft.remake(<rustic:iron_lantern> * 2, [
  "c",
  "⌂"], {
  "c": <minecraft:coal:*>, # Charcoal
  "⌂": <ic2:casing:3>,     # Iron Item Casing
});

# [Silver Lantern]*2 from [Silver Plate][+1]
craft.remake(<rustic:silver_lantern> * 2, [
  "c",
  "□"], {
  "c": <minecraft:coal:*>, # Charcoal
  "□": <ore:plateSilver>,  # Silver Plate
});