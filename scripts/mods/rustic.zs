
#modloaded rustic

import crafttweaker.item.IItemStack;

// Rustic Slate
recipes.addShapeless('slate',
  <rustic:slate> * 4,
  [<ore:stoneBasalt>, <ore:stoneBasalt>, <ore:stoneBasalt>, <ore:stoneLimestone>]);

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
mods.rustic.CrushingTub.addRecipe(<liquid:water> * 1000, <minecraft:dye:2>, <minecraft:cactus>);

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

# [Wooden Lantern] from [Charcoal]*3[+1]
craft.remake(<rustic:lantern_wood>, [
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

// Add missing fruit => seed recipes
recipes.addShapeless(<rustic:tomato_seeds>, [<rustic:tomato>]);
recipes.addShapeless(<rustic:chili_pepper_seeds>, [<rustic:chili_pepper>]);

// Remove useless seed from grass drop
vanilla.seeds.removeSeed(<rustic:tomato_seeds>);
vanilla.seeds.removeSeed(<rustic:chili_pepper_seeds>);

/* ------------------------------------------------------------ 

Fix of exception when right-clicking anything over Rustic's slabs:

Caused by: java.lang.ClassCastException: net.minecraft.block.BlockSlab$EnumBlockHalf cannot be cast to java.lang.Integer
    at java.lang.Integer.compareTo(Integer.java:52)
    at thecodex6824.thaumicaugmentation.common.internal.TAHooksCommon.isCompatibleSlab(TAHooksCommon.java:129)
    at thecodex6824.thaumicaugmentation.common.internal.TAHooksCommon.checkWardSlab(TAHooksCommon.java:136)
    at net.minecraft.item.ItemSlab.onItemUse(ItemSlab.java:49)
    at net.minecraftforge.common.ForgeHooks.onPlaceItemIntoWorld(ForgeHooks.java:889)
    at net.minecraft.item.ItemStack.onItemUse(ItemStack.java:186)
    at net.minecraft.server.management.PlayerInteractionManager.processRightClickBlock(PlayerInteractionManager.java:481)
    at net.minecraft.network.NetHandlerPlayServer.processTryUseItemOnBlock(NetHandlerPlayServer.java:741)

TODO:
Remove when fixed https://github.com/TheCodex6824/ThaumicAugmentation/issues/335

------------------------------------------------------------ */
# [Slab_ Olive Wood Planks]*6 from [Olive Wood Planks]
recipes.remove(<rustic:olive_slab_item>);
recipes.addShaped('alt slab fix Olive Wood',
  <architecturecraft:shape>.withTag({Shape: 90, BaseName: "rustic:planks", BaseData: 0}) * 6, 
  [[<rustic:planks>, <rustic:planks>, <rustic:planks>]]
);

# [Slab_ Ironwood Planks]*6 from [Ironwood Planks]
recipes.remove(<rustic:ironwood_slab_item>);
recipes.addShaped('alt slab fix Ironwood',
  <architecturecraft:shape>.withTag({Shape: 90, BaseName: "rustic:planks", BaseData: 1}) * 6, 
  [[<rustic:planks:1>, <rustic:planks:1>, <rustic:planks:1>]]
);

# [Olive Wood Planks] from [Slab_ Olive Wood Planks]
craft.make(<rustic:planks>, ["#", "#"], {
  "#": <architecturecraft:shape>.withTag({Shape: 90, BaseName: "rustic:planks", BaseData: 0}), # Slab: Olive Wood Planks
});

# [Ironwood Planks] from [Slab_ Ironwood Planks]
craft.make(<rustic:planks:1>, ["S", "S"], {
  "S": <architecturecraft:shape>.withTag({Shape: 90, BaseName: "rustic:planks", BaseData: 1}), # Slab: Ironwood Planks
});
// ------------------------------------------------------------ 