import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Functions;
import crafttweaker.data.IData;
import mods.jei.JEI.removeAndHide as rh;


# Remove old drop and add new
function tweak(table as string, poolStr as string, entryToRemove as string, itemToRemove as IItemStack, itemToAdd as IItemStack, minMax as int[]) {
  
  # Current pool
  var pool = loottweaker.LootTweaker.getTable(table).getPool(poolStr);

  # Remove old drops if specified
  if(!isNull(entryToRemove)) 
    pool.removeEntry(entryToRemove);

  # Add new drops
  if(!isNull(itemToAdd)) {
    if (!isNull(utils.smelt(itemToAdd))) {
      # Add with smelting function (if smelted item exist)
      pool.addItemEntryHelper(itemToAdd, 1, 0, [
        Functions.setCount(minMax[0], minMax[1]), 
        Functions.lootingEnchantBonus(0, minMax[1] / 3, 0), 
        Functions.parse({"function": "minecraft:furnace_smelt","conditions": [
          {"properties": {"minecraft:on_fire": true}, 
          "entity": "this", "condition": "minecraft:entity_properties"}
          ]})
      ], []);
    } else {
      # Add non-smelt function
      pool.addItemEntryHelper(itemToAdd, 1, 0, [
        Functions.setCount(minMax[0], minMax[1]), 
        Functions.lootingEnchantBonus(0, 1, 0)
      ], []);
    }
  }
  
  # Remove old item from JEI and crafts
  # usually need when unify meat
  if (!isNull(itemToRemove)) {
    var smelted = utils.smelt(itemToRemove);
    if (!isNull(smelted)) {
      furnace.remove(smelted);
      rh(smelted);
    }
    rh(itemToRemove);
  }
}

tweak("betteranimalsplus:deer","deer-venison","betteranimalsplus:venisonraw", <betteranimalsplus:venisonraw>, <harvestcraft:venisonrawitem>, [1,3]);
tweak("betteranimalsplus:reindeer","reindeer","betteranimalsplus:venisonraw", <betteranimalsplus:venisonraw>, <harvestcraft:venisonrawitem>, [1,3]);
tweak("betteranimalsplus:moose","moose-venison","betteranimalsplus:venisonraw", <betteranimalsplus:venisonraw>, <harvestcraft:venisonrawitem>, [2,5]);
tweak("betteranimalsplus:nautilus","nautilus","minecraft:fish", null, <harvestcraft:oysterrawitem>, [1,3]);
tweak("betteranimalsplus:hirschgeist","hirschgeist", null, null, <randomthings:ingredient:2>, [5,15]);
tweak("betteranimalsplus:crab","crab","betteranimalsplus:crab_meat_raw", <betteranimalsplus:crab_meat_raw>, <harvestcraft:crabrawitem>, [1,3]);
tweak("quark:entities/crab","legs","quark:crab_leg", <quark:crab_leg>, <harvestcraft:crabrawitem>, [1,3]);
tweak("twilightforest:entities/helmet_crab","fish","minecraft:fish", null, <harvestcraft:crabrawitem>, [1,3]);
tweak("twilightforest:entities/deer","meat","twilightforest:raw_venison", <twilightforest:raw_venison>, <harvestcraft:venisonrawitem>, [1,3]);
tweak("emberroot:entity/golem_blue","main","minecraft:iron_nugget", null, <thermalfoundation:material:16>, [1,3]);
tweak("emberroot:entity/golem_green","main","minecraft:gunpowder", null, <mysticalagriculture:crafting:40>, [1,3]);
tweak("emberroot:entity/golem_orange","main","minecraft:coal", null, <mekanism:nugget:3>, [1,3]);
tweak("emberroot:entity/golem_purple","main","minecraft:spider_eye", null, <mechanics:heavy_nugget>, [1,3]);
tweak("emberroot:entity/golem_red","main","minecraft:redstone", null, <enderio:item_alloy_nugget:3>, [1,3]);
tweak("emberroot:entity/golem_yellow","main","minecraft:gold_nugget", null, <thermalfoundation:material:228>, [1,3]);
tweak("emberroot:entity/skeleton_frozen","main","minecraft:ice", null, <mctsmelteryio:iceball>, [3,6]);
tweak("emberroot:entity/sprite_mini","main","minecraft:rotten_flesh", null, <mysticalagriculture:nature_essence>, [1,3]);
tweak("emberroot:entity/sprite_normal","main","minecraft:rotten_flesh", null, <mysticalagriculture:sapphire_essence>, [1,3]);
tweak("emberroot:entity/sprite_greater","main",null, null, <mysticalagriculture:ender_amethyst_essence>, [1,3]);
tweak("emberroot:entity/sprite_boss","main",null, null, <mysticalagriculture:terrasteel_essence>, [2,9]);


# Tallow
mods.thaumcraft.Crucible.removeRecipe(<thaumcraft:tallow>);
scripts.wrap.thaumcraft.Crucible.registerRecipe("Tallow from rotten flesh", "HEDGEALCHEMY@1", <thaumcraft:tallow>,   <minecraft:rotten_flesh>*4, [<aspect:ignis>]);
scripts.wrap.thaumcraft.Crucible.registerRecipe("Tallow from blubber",      "HEDGEALCHEMY@1", <thaumcraft:tallow>*8, <betteranimalsplus:blubber>, [<aspect:ignis>*4]);
scripts.process.squeeze(<betteranimalsplus:blubber>, <liquid:lubricant> * 50, "except: CrushingTub Squeezer MechanicalSqueezer", null);

# This crab is unobtainable
rh(<betteranimalsplus:crab_meat_cooked>);
furnace.remove(<betteranimalsplus:crab_meat_cooked>);