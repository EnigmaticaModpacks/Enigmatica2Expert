/*

Add recipes and mechanic of dev/null/ that never ends

*/

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;

#modloaded openblocks

events.onPlayerInteractBlock(function(e as crafttweaker.event.PlayerInteractBlockEvent) {
  if(
    isNull(e.world)
    || isNull(e.player)
    || isNull(e.item)
    || e.item.definition.id != 'openblocks:dev_null'
    || isNull(e.item.tag)
    || isNull(e.item.tag.Unbreakable)
    || isNull(e.item.tag.inventory)
    || isNull(e.item.tag.inventory.Items)
    || e.item.tag.inventory.Items.length <= 0
    || isNull(e.item.tag.inventory.Items[0])
    || isNull(e.item.tag.inventory.Items[0].Count)
    || e.item.tag.inventory.Items[0].Count.asInt() >= 65
    || isNull(e.item.tag.infinite)
  ) return;

  // Check if this dev/null/ provide infinite exact this block to prevent replacing
  val infinite = IItemStack.fromData(e.item.tag.infinite);
  val current = IItemStack.fromData(e.item.tag.inventory.Items[0]);
  if(isNull(infinite) || isNull(current) || !(infinite has current || current has infinite)) return;

  e.item.mutable().updateTag({
    inventory: e.item.tag.inventory + {
      Items: [e.item.tag.inventory.Items[0] + {Count: e.item.tag.inventory.Items[0].Count.asInt() + 1}]
    }
  });
});

function addInfinityDevNull(item as IItemStack, ingredient as IIngredient) as void {
  recipes.addShapeless(
    'dev_null '~item.definition.id.replaceAll(":", "_")~'_'~item.damage,
    <openblocks:dev_null>.withTag({
      infinite: item as IData,
      ench: [{}],
      enchantmentColor: 4408131,
      Unbreakable: 1 as byte,
      inventory: {size: 1, Items: [{
        Slot: 0 as byte, id: item.definition.id, Count: 64, Damage: item.damage as short
      }
    ]}}),
    [
      <openblocks:dev_null>.withTag({
        inventory: {size: 1, Items: [{
          Slot: 0 as byte, id: item.definition.id, Count: 64, Damage: item.damage as short
        }
      ]}}),
      ingredient,
    ]
  );
}

addInfinityDevNull(<minecraft:cobblestone>, <biomesoplenty:coral:*>);
addInfinityDevNull(<cyclicmagic:block_fragile_weak>, <biomesoplenty:coral:*>);

for i in 0 .. 16 {
  addInfinityDevNull(<chisel:cobblestone>.definition.makeStack(i), <biomesoplenty:coral:*>);
}
for i in 0 .. 10 {
  addInfinityDevNull(<chisel:cobblestone1>.definition.makeStack(i), <biomesoplenty:coral:*>);
  addInfinityDevNull(<chisel:cobblestone2>.definition.makeStack(i), <biomesoplenty:coral:*>);
}

/*

<openblocks:dev_null>.withTag({
  openedInGui: 257974928, Unbreakable: 1 as byte, inventory: {size: 1, Items: [{Slot: 0 as byte, id: "minecraft:cobblestone", Count: 47, Damage: 0 as short}]}})

<openblocks:dev_null>.withTag(
  {
    openedInGui: 257974928,
    ench: [{lvl: 1, id: 1}],
    enchantmentColor: 4408131,
    Unbreakable: 1 as byte,
    inventory: {size: 1, Items: [{Slot: 0 as byte, id: "minecraft:cobblestone", Count: 470, Damage: 0 as short}]}
})
*/
