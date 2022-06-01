#modloaded oeintegration

# [Excavate Modifier] from [Triple Compressed Cobblestone][+1]
craft.remake(<oeintegration:excavatemodifier>, ["pretty",
  "  □  ",
  "□ ░ □",
  "  □  "], {
  "□": <ore:plateBronze>,             # Bronze Plate
  "░": <ore:compressed3xCobblestone>, # Triple Compressed Cobblestone
});


# [Enchanted Book] from [Excavate Modifier]
recipes.addShapeless(<minecraft:enchanted_book>.withTag({StoredEnchantments:
	<enchantment:oeintegration:oreexcavation>.makeEnchantment(1).makeTag().ench}),
	[<oeintegration:excavatemodifier>]
);