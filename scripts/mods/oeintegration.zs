#modloaded oeintegration

# [Excavate Modifier] from [Double Compressed Cobblestone][+1]
craft.remake(<oeintegration:excavatemodifier>, ["pretty",
  "‚ ‚ ‚",
  "‚ ░ ‚",
  "‚ ‚ ‚"], {
  "‚": <ore:nuggetBronze>,            # Bronze Nugget
  "░": <ore:compressed2xCobblestone>, # Double Compressed Cobblestone
});


# [Enchanted Book] from [Excavate Modifier]
recipes.addShapeless(<minecraft:enchanted_book>.withTag({StoredEnchantments:
	<enchantment:oeintegration:oreexcavation>.makeEnchantment(1).makeTag().ench}),
	[<oeintegration:excavatemodifier>]
);