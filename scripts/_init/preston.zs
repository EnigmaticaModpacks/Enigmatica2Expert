import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.jei.JEI.removeAndHide as rh;

#priority 3000
#modloaded preston

# Make shapeless crafts for specified block up to level for Preston mod
# warning - compressing should be called only once
global compressIt as function(IItemStack, int)IItemStack = 
    function (item as IItemStack, maxLevel as int) as IItemStack  {
  var o = item;
  val meta = item.damage as short;
  for i in 1 to maxLevel+1 {
    val compressed = <preston:compressed_block>.withTag({
      stack: {id: item.definition.id, Count: 1 as byte, Damage: meta}, level: i
    });
    mods.jei.JEI.addItem(compressed);
    recipes.addShapeless(compressed, [o, o, o, o, o, o, o, o, o]);
    recipes.addShapeless(o * 9, [compressed]);
    o = compressed;
  }
	return o;
};
