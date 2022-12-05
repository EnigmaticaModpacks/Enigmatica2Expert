import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;

#modloaded tconevo

for item in loadedMods["tconevo"].items {
  for ore in item.ores {
    if (ore.name.startsWith("gear")) recipes.remove(item);
  }
}

# [Ghostwood Shard]*8 from [Dreadwood Log]
craft.make(<tconstruct:shard>.withTag({Material: "ghostwood"}) * 16, ["##"], {
  "#": <iceandfire:dreadwood_log>, # Dreadwood Log
});

# [Ghostwood Shard]*4 from [Dreadwood Planks]
craft.make(<tconstruct:shard>.withTag({Material: "ghostwood"}) * 8, ["# ", " #"], {
  "#": <iceandfire:dreadwood_planks>, # Dreadwood Planks
});

# [Darkwood Shard]*8 from [Lightwood Wood]
craft.make(<tconstruct:shard>.withTag({Material: "darkwood"}) * 16, ["##"], {
  "#": <advancedrocketry:alienwood>, # Lightwood Wood
});

# [Darkwood Shard]*4 from [Lightwood planks]
craft.make(<tconstruct:shard>.withTag({Material: "darkwood"}) * 8, ["# ", " #"], {
  "#": <advancedrocketry:planks>, # Lightwood planks
});

mods.tconstruct.Casting.addTableRecipe(
  <tconevo:metal:30>, # [Sentient Ingot]
  <tconevo:material>, # Coalescence Matrix
  <liquid:raw_will>, # Demonic Will
1000);
