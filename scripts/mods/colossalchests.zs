#modloaded colossalchests

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

# [Uncolossal Chest]*2 from [Oak Chest][+3]
craft.remake(<colossalchests:uncolossal_chest> * 2, ["pretty",
  "M e M",
  "D c D",
  "M e M"], {
  "c": <ore:chest>,                       # Oak Chest
  "D": <tconstruct:materials:2>,          # Dried Brick
  "e": <minecraft:deadbush>,              # Dead Bush
  "M": <extrautils2:decorativesolidwood>, # Magical Planks
});

# [Chest Upgrade Tool] from [Cobweb][+2]
recipes.removeByRecipeName("colossalchests:upgrade_tool");
craft.make(<colossalchests:upgrade_tool>, ["pretty",
  "  P  ",
  "╱ C ╱"], {
  "P": <biomesoplenty:coral:*>, # Pink Coral
  "╱": <ore:stickAluminium>,  # Aluminium Rod
  "C": <minecraft:web>,       # Cobweb
});

val chestIngrs = [
  [<tconstruct:firewood>, <compactmachines3:wallbreakable>],
  [<thermalfoundation:material:320>, <ic2:te:113>],
  [<thermalfoundation:material:32>, <ironchest:iron_chest>],
  [<thermalfoundation:material:322>, <ironchest:iron_chest>],
  [<thermalfoundation:material:33>, <ironchest:iron_chest:1>],
  [<mekanism:compresseddiamond>, <ironchest:iron_chest:2>],
  [<ic2:plate:6>, <ironchest:iron_chest:6>],
] as IIngredient[][];

for i, arr in chestIngrs {
  val currWall = <colossalchests:chest_wall>.definition.makeStack(i);
  val primary   = arr[0];
  val secondary = arr[1];
  val prevWall = (i==0) ? <colossalchests:uncolossal_chest> : <colossalchests:chest_wall>.definition.makeStack(i - 1);

  # [Colossal Chest Core] from [Blasted Coal][+1]
  recipes.addShapeless(<colossalchests:colossal_chest>.definition.makeStack(i), [
    currWall, <contenttweaker:blasted_coal>, # Blasted Coal
  ]);

  if (i>0) {
    recipes.addShapeless(<colossalchests:colossal_chest>.definition.makeStack(i), [
      <colossalchests:colossal_chest>.definition.makeStack(i - 1), primary
    ]);
  }

  # [Colossal Chest Interface] from [Lormyte Block][+1]
  craft.reshapeless(<colossalchests:interface>.definition.makeStack(i), 
    "C■", {
    "C": currWall,
    "■": <endreborn:block_decorative_lormyte>, # Lormyte Block
  });

  # [Colossal Chest Wall] from [Chest Upgrade Tool][+4]
  craft.remake(currWall, ["pretty",
    "□ C □",
    "B h B",
    "□ U □"], {
    "□": primary,
    "B": secondary,
    "C": prevWall,
    "U": <colossalchests:uncolossal_chest>, # Uncolossal Chest
    "h": <colossalchests:upgrade_tool>,     # Chest Upgrade Tool
  });
}