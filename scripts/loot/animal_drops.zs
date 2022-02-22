import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Functions;
import loottweaker.vanilla.loot.Conditions;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityDefinition;

#priority 10

# Remove old drop and add new
function tweak(
  table as string,
  poolStr as string,
  entryToRemove as string,
  itemToRemove as IItemStack,
  itemsToAdd as IItemStack[],
  minMax as int[],
  isByPlayer as bool = false,
  poolWeight as int = 1
) {
  
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
        pool.addItemEntryHelper(smelted, poolWeight, 0, [
          Functions.setCount(minMax[0], minMax[1]), 
          Functions.lootingEnchantBonus(0, 1, 0)
        ], isByPlayer ? [Conditions.killedByPlayer(), {condition: "entity_properties", entity: "this", properties: {"on_fire": true}}] : [{condition: "entity_properties", entity: "this", properties: {"on_fire": true}}]);
      } else {
        # Add non-smelt function
        pool.addItemEntryHelper(itemToAdd, poolWeight, 0, [
          Functions.setCount(minMax[0], minMax[1]), 
          Functions.lootingEnchantBonus(0, 1, 0)
        ], isByPlayer ? [Conditions.killedByPlayer()] : []);
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

tweak("quark:entities/crab"                , "legs", "quark:crab_leg", <quark:crab_leg>, [<harvestcraft:crabrawitem>], [1,3]);
tweak("twilightforest:entities/helmet_crab", "fish", "minecraft:fish", null, [<harvestcraft:crabrawitem>], [1,3]);
tweak("twilightforest:entities/deer"       , "meat", "twilightforest:raw_venison", <twilightforest:raw_venison>, [<harvestcraft:venisonrawitem>], [1,3]);
tweak("minecraft:entities/elder_guardian"  , "pool3", "minecraft:gameplay/fishing/fish", null, [<enderio:item_material:56>], [1,2]);

/*Inject_js{
setBlockDrops('randomthings:beanpod', [...
  cmd.below.match(/tweak.*randomthings:beanpod.*null,\s*\[(.*)\],\s*\[0,1\]\);/)[1]
  .split(/\s*,\s{0,}/)
  .map((cap,i,arr)=>({
    stack: cap.match(/<([^>]+)>.{0,}/)[1],
    chance: (100/arr.length) | 0,
    luck: [0,1,2,3].map(()=>[0,1])
  })),
{stack: 'minecraft:iron_ingot', luck: [8,20]},
{stack: 'minecraft:gold_ingot', luck: [4,15]},
{stack: 'minecraft:emerald', luck: [0,2]},
{stack: 'randomthings:beans', luck: [4,8]},
])
return '# Done!'
}*/
# Done!
/**/
tweak("randomthings:beanpod", "Diamond", "minecraft:diamond", null, [<biomesoplenty:gem:1>, <biomesoplenty:gem:2>, <biomesoplenty:gem:3>, <biomesoplenty:gem:4>, <biomesoplenty:gem:5>, <biomesoplenty:gem:6>], [0,1]);


# Add drops
<entity:betteranimalsplus:zotzpyre>.addDrop(<harvestcraft:hardenedleatheritem> % 70, 1, 3);
<entity:betteranimalsplus:zotzpyre>.addPlayerOnlyDrop(<harvestcraft:netherwingsitem>, 1, 3);
<entity:minecraft:endermite>.addDrop(<appliedenergistics2:material:46>, 1, 3);
<entity:minecraft:endermite>.addPlayerOnlyDrop(<endreborn:wolframium_nugget>, 1, 6);
<entity:netherendingores:netherfish>.addPlayerOnlyDrop(<forestry:ash>, 3, 12);
<entity:emberroot:fairies>.addPlayerOnlyDrop(<astralsorcery:itemusabledust>, 1, 6);

# Add 2-3 more Rabbit Legs to Animania's rabbits
for entity in [
  <entity:animania:buck_chinchilla>,
  <entity:animania:buck_cottontail>,
  <entity:animania:buck_dutch>,
  <entity:animania:buck_havana>,
  <entity:animania:buck_jack>,
  <entity:animania:buck_lop>,
  <entity:animania:buck_new_zealand>,
  <entity:animania:buck_rex>,
  <entity:animania:doe_chinchilla>,
  <entity:animania:doe_cottontail>,
  <entity:animania:doe_dutch>,
  <entity:animania:doe_havana>,
  <entity:animania:doe_jack>,
  <entity:animania:doe_lop>,
  <entity:animania:doe_new_zealand>,
  <entity:animania:doe_rex>,
  <entity:animania:kit_chinchilla>,
  <entity:animania:kit_cottontail>,
  <entity:animania:kit_dutch>,
  <entity:animania:kit_havana>,
  <entity:animania:kit_jack>,
  <entity:animania:kit_lop>,
  <entity:animania:kit_new_zealand>,
  <entity:animania:kit_rex>,
] as IEntityDefinition[] {
  entity.addPlayerOnlyDrop(<minecraft:rabbit_foot>, 2, 3);
}