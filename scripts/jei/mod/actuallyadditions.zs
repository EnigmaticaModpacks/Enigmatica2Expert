#priority 950
#modloaded actuallyadditions

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.requious.SlotVisual;
import scripts.jei.requious.add as addRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:lens_of_the_miner>;
x.addJEICatalyst(<actuallyadditions:item_mining_lens>);
x.addJEICatalyst(<actuallyadditions:block_atomic_reconstructor>);
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
scripts.jei.requious.addInsOuts(x, [[0,0]], [[2,0]]);

// Default list:
// https://github.com/Ellpeck/ActuallyAdditions/blob/main/src/main/java/de/ellpeck/actuallyadditions/common/items/lens/LensMining.java

val endstoneList as int[IItemStack][] = [
/*Inject_js{
  const cfg = config('config/actuallyadditions.cfg').other
  const filtered = cfg['Mining Lens Blacklist'].map(l => l.split('@'))
  return cfg['Mining lens Extra Whitelist']
    .map((l) => {
      const [ore, w, t] = l.split('@')
      return t !== 's'
        ? undefined
        : `  {${
          getByOredict(ore).filter(o =>
            !filtered.some(f => f[0] === o.id && (f[1] ?? 0) == o.damage)
          ).map(o => o.commandString)
      }: ${w}},`
    }).filter(Boolean)
}*/
  {<netherendingores:ore_other_1:1>: 64},
  {<netherendingores:ore_end_modded_1>: 40},
  {<netherendingores:ore_end_vanilla:4>: 30},
  {<netherendingores:ore_other_1:5>: 20},
  {<netherendingores:ore_other_1:3>: 20},
  {<netherendingores:ore_end_vanilla:1>: 10},
/**/
] as int[IItemStack][];

for tuple in endstoneList {
  for output, weight in tuple {
    addRecipe(<assembly:lens_of_the_miner>, {[<minecraft:end_stone>] as IIngredient[] : [output * weight]});
  }
}
