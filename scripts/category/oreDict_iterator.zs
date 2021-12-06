#priority -10

import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

static beneficateOptions as IData = {
  exceptions: "Pulverizer StarlightInfuser",
  meltingExceptions: scripts._init.variables.meltingExceptions
} as IData;

function getOreName(name as string, part as string) as string {
  if(name.matches(part ~ "[A-Z]\\w+")) return name.substring(part.length);
  return null;
}

# Pairs of ore names and respective liquid
val ore_liquid_exceptions = {
  Aluminium:       "aluminum",
  AstralStarmetal: "starmetal",
} as string[string];

for ore_entry in oreDict {
	val name = ore_entry.name;

  # Ex Nihilo ore pieces conversion to ores
  var
  ore_name = getOreName(name, "piece");
	if (!isNull(ore_name)) {
    if(ore_name == 'Aluminum') continue;
		val oreBlock = oreDict.get("ore" ~ ore_name);
		if(isNull(oreBlock) || oreBlock.empty) continue;

		val p = ore_entry;
		recipes.addShaped("Ex Nihilo " ~ name ~ " x8", oreBlock.firstItem * 2, [[p, p, p], [p, p, p], [p, p, p]]);
		scripts.process.compress(p * 4, oreBlock.firstItem, "except: Compressor");
    continue;
	}


  # Native clusters processing
  ore_name = getOreName(name, "cluster");
	if (!isNull(ore_name)) {
    if(ore_name == 'Aluminum') continue;
    scripts.process.beneficiate(ore_entry, ore_name, 3, beneficateOptions);

    # Fix gems melting recipes
    # 	Standart JAOPCA's furnace recipes for Ores that outputs
    # gems instead of ingots have empty output, so add it forced
    var smelted = utils.smelt(ore_entry);
    if (isNull(smelted)) {
      furnace.remove(<*>, ore_entry);
      var gem = utils.getSomething(ore_name, ["gem", "dust", "any"], 2);
      if(!isNull(gem)) furnace.addRecipe(gem, ore_entry);
    }

    scripts.magicProcessing.magicProcessing(ore_entry, ore_name);
    continue;
  }

  # Crushed Ore Smeltery compat
  ore_name = getOreName(name, "crushed");
	if (!isNull(ore_name)) {
    if(ore_name == 'Aluminum') continue;
    val exception = ore_liquid_exceptions[ore_name];
    val liquid = game.getLiquid(isNull(exception) ? ore_name.toLowerCase() : exception);
    if(isNull(liquid)) continue;

    scripts.wrap.tconstruct.Melting.addRecipe(liquid * 144, ore_entry);
    continue;
  }

  # Dense plates in Thermal Expansion Compactor
  ore_name = getOreName(name, "plateDense");
	if (!isNull(ore_name)) {
    if(ore_name == 'Aluminum') continue;
		val inpOre = (ore_name == "Obsidian")
			? (<minecraft:obsidian> * 4) as IIngredient
			: oreDict["block"~ore_name];
		if(inpOre.items.length <= 0) continue;
		scripts.process.compress(inpOre, ore_entry.firstItem, "only: Compactor");
    continue;
	}
}