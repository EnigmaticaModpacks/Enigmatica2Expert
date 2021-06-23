import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

#priority 3000
#modloaded preston

zenClass Compressor {
  val hashed as int[IItemStack] = {};

  zenConstructor() { }

  function getStatic(item as IItemStack, lvl as int) as IItemStack {
    return <preston:compressed_block>.withTag({
        stack: {id: item.definition.id, Count: 1 as byte, Damage: item.damage as short}, level: lvl
      });
  }

  # Make shapeless crafts for specified block up to level for Preston mod
  function getCompressed(item as IItemStack, maxLevel as int) as IItemStack {
    if(isNull(item) || maxLevel==0) return null;

    val hashedIndex = hashed[item];
    if(!isNull(hashedIndex) && (hashedIndex as int) >= maxLevel) 
      return getStatic(item, maxLevel);

    val startIndex = isNull(hashedIndex)
      ? 1
      : hashedIndex as int;
    var o = startIndex > 1
      ? getStatic(item, startIndex - 1)
      : item;
    for i in startIndex to maxLevel+1 {
      val compressed = getStatic(item, i);
      mods.jei.JEI.addItem(compressed);
      recipes.addShapeless(compressed, [o, o, o, o, o, o, o, o, o]);
      recipes.addShapeless(o * 9, [compressed]);
      o = compressed;
    }
    hashed[item] = maxLevel;
    return o;
  }
}

static compressor as Compressor = Compressor();