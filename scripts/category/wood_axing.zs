/*

When you break block with special axe it output planks

*/

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.block.IBlock;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.event.BlockHarvestDropsEvent;

#priority -1
#loader crafttweaker reloadableevents

static axes as int[IIngredient] = {
  <twilightforest:ironwood_axe:*> : 4,
  <twilightforest:knightmetal_axe:*> : 5,
  <twilightforest:steeleaf_axe:*> : 6,
  <twilightforest:minotaur_axe_gold:*> : 7,
  <twilightforest:minotaur_axe:*> : 8,
} as int[IIngredient];

static axeTraits as int[string] = {
  axing: 4,
  axing2: 6,
} as int[string];

static oreStick as IItemStack[string] = {
  plankWood: <minecraft:stick>,
  plankTreatedWood: <immersiveengineering:material>,
} as IItemStack[string];

function setDrops(e as BlockHarvestDropsEvent, value as int) as void {
  val log = e.drops[0].stack.anyAmount();
  var output = scripts.category.wood.logPlank[log];

  // Try to convert Plank => Sticks
  if(isNull(output)) {
    if(isNull(log) || isNull(log.ores) || log.ores.length == 0) return;
    for ore in log.ores {
      output = oreStick[ore.name];
      if(!isNull(output)) break;
    }
  }

  if(isNull(output)) return;
  // val fortuneBonus = pow((e.fortuneLevel * value * 2) as double, 0.5d) as int;
  val fortuneBonus = e.fortuneLevel;
  e.drops = [(output * (value + fortuneBonus)) % 100];
}

events.onBlockHarvestDrops(function(e as BlockHarvestDropsEvent) {
  if(isNull(e.player) || isNull(e.player.world) || e.player.world.remote) return;
  if(isNull(e.player.currentItem)) return;
  if(e.silkTouch || e.dropChance <= 0 || isNull(e.drops) || e.drops.length <= 0) return;

  for axe, value in axes {
    if(axe has e.player.currentItem) {
      return setDrops(e, value);
    }
  }

  if(
    !isNull(e.player.currentItem.tag)
    && !isNull(e.player.currentItem.tag.TinkerData)
    && !isNull(e.player.currentItem.tag.Traits)
    && !isNull(e.player.currentItem.tag.Traits.asList())
  ) {
    for trait in e.player.currentItem.tag.Traits.asList() {
      for traitNeed, value in axeTraits {
        if(trait != traitNeed) continue;
        return setDrops(e, value);
      }
    }
  }
});
