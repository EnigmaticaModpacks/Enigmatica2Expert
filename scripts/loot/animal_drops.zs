import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Functions;
import loottweaker.vanilla.loot.Conditions;
import crafttweaker.data.IData;

#priority 10

# Remove old drop and add new
function tweak(table as string, poolStr as string, entryToRemove as string, itemToRemove as IItemStack, itemsToAdd as IItemStack[], minMax as int[]) {
  
  # Current pool
  var pool = loottweaker.LootTweaker.getTable(table).getPool(poolStr);

  # Remove old drops if specified
  if(!isNull(entryToRemove)) 
    pool.removeEntry(entryToRemove);

  # Add new drops
  if(!isNull(itemsToAdd)) {
    for itemToAdd in itemsToAdd {
      val smelted = utils.smelt(itemToAdd);
      if (!isNull(smelted)) {
        # Add with smelting function (if smelted item exist)
        pool.addItemEntry(smelted, 1, 0, [
          Functions.setCount(minMax[0], minMax[1]), 
          Functions.lootingEnchantBonus(0, 1, 0)
        ], [{condition: "entity_properties", entity: "this", properties: {"on_fire": true}}]);
      } else {
        # Add non-smelt function
        pool.addItemEntry(itemToAdd, 1, 0, [
          Functions.setCount(minMax[0], minMax[1]), 
          Functions.lootingEnchantBonus(0, 1, 0)
        ], []);
      }
    }
  }
  
  # Remove old item from JEI and crafts
  # usually need when unify meat
  if (!isNull(itemToRemove)) {
    var smelted = utils.smelt(itemToRemove);
    if (!isNull(smelted)) {
      furnace.remove(smelted);
      utils.rh(smelted);
    }
    utils.rh(itemToRemove);
  }
}

tweak("quark:entities/crab","legs","quark:crab_leg", <quark:crab_leg>, [<harvestcraft:crabrawitem>], [1,3]);
tweak("twilightforest:entities/helmet_crab","fish","minecraft:fish", null, [<harvestcraft:crabrawitem>], [1,3]);
tweak("twilightforest:entities/deer","meat","twilightforest:raw_venison", <twilightforest:raw_venison>, [<harvestcraft:venisonrawitem>], [1,3]);
tweak("emberroot:entity/golem_blue","main","minecraft:iron_nugget", null, [<thermalfoundation:material:16>], [1,3]);
tweak("emberroot:entity/golem_green","main","minecraft:gunpowder", null, [<mysticalagriculture:crafting:40>], [1,3]);
tweak("emberroot:entity/golem_orange","main","minecraft:coal", null, [<mekanism:nugget:3>], [1,3]);
tweak("emberroot:entity/golem_purple","main","minecraft:spider_eye", null, [<mechanics:heavy_nugget>], [1,3]);
tweak("emberroot:entity/golem_red","main","minecraft:redstone", null, [<enderio:item_alloy_nugget:3>], [1,3]);
tweak("emberroot:entity/golem_yellow","main","minecraft:gold_nugget", null, [<thermalfoundation:material:228>], [1,3]);
tweak("emberroot:entity/skeleton_frozen","main","minecraft:ice", null, [<mctsmelteryio:iceball>], [3,6]);
tweak("emberroot:entity/sprite_mini","main","minecraft:rotten_flesh", null, [<mysticalagriculture:nature_essence>], [1,3]);
tweak("emberroot:entity/sprite_normal","main","minecraft:rotten_flesh", null, [<mysticalagriculture:dye_essence>], [1,3]);
tweak("emberroot:entity/sprite_greater","main",null, null, [<mysticalagriculture:platinum_essence>], [1,3]);
tweak("emberroot:entity/sprite_boss","main",null, null, [<mysticalagriculture:ender_amethyst_essence>], [6,12]);
tweak("randomthings:beanpod","Diamond","minecraft:diamond", null, [<biomesoplenty:gem:1>, <biomesoplenty:gem:2>, <biomesoplenty:gem:3>, <biomesoplenty:gem:4>, <biomesoplenty:gem:5>, <biomesoplenty:gem:6>], [0,1]);
