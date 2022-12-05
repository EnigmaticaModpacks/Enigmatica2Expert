#modloaded oeintegration

import crafttweaker.item.IIngredient;

# [Excavate Modifier] from [Triple Compressed Cobblestone][+1]
craft.remake(<oeintegration:excavatemodifier>, ["pretty",
  "  □  ",
  "□ ░ □",
  "  □  "], {
  "□": <ore:plateBronze>,             # Bronze Plate
  "░": <ore:compressed3xCobblestone>, # Triple Compressed Cobblestone
});


# [Enchanted Book] from [Excavate Modifier]
recipes.addShapeless('Excavator to book', Book(<enchantment:oeintegration:oreexcavation>),
	[<oeintegration:excavatemodifier>] as IIngredient[]
, function(out, ins, cInfo) {
    return Book(<enchantment:oeintegration:oreexcavation>);
}, null);