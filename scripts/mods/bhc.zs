#modloaded bhc

# [Relic Apple]*2 from [Exhausting Apple][+2]
craft.reshapeless(<bhc:relic_apple> * 2, "q§M", {
  "q": <ore:quicksilver>,              # Quicksilver
  "§": <scalingfeast:exhaustingapple>, # Exhausting Apple
  "M": <extrautils2:magicapple>,       # Magical Apple
});

# [Heart Amulet] from [Cobweb][+2]
craft.remake(<bhc:heart_amulet>, ["pretty",
  "H   H",
  "H C H",
  "  ▲  "], {
  "H": <ore:fiberHemp>,           # Industrial Hemp Fiber
  "C": <minecraft:web>,           # Cobweb
  "▲": <scalinghealth:heartdust>, # Heart Dust
});


# [Red Heart] from [Heart Dust]
furnace.addRecipe(<bhc:red_heart>, <scalinghealth:heartdust>);

# [Yellow Heart] from [Ratlantean Spirit Flame]
mods.rats.recipes.addGemcutterRatRecipe(<rats:ratlantean_flame>, <bhc:yellow_heart>);

# [Green Heart]*2 from [Arcane Technology]
mods.rats.recipes.addChefRatRecipe(<rats:arcane_technology>, <bhc:green_heart> * 2);

# [Blue Heart]*3 from [Psionic Rat Brain]
mods.rats.recipes.addArcheologistRatRecipe(<rats:psionic_rat_brain>, <bhc:blue_heart> * 3);

# [Yellow Heart Canister] from [Sun Crystal][+3]
craft.reshapeless(<bhc:yellow_heart_canister>, "R∩H*", {
  "R": <bhc:red_heart_canister>,             # Red Heart Canister
  "∩": <rats:charged_creeper_chunk>,         # Charged Creeper Chunk
  "H": <bhc:yellow_heart>,                   # Yellow Heart
  "*": <extrautils2:suncrystal>, # Sun Crystal
});

# [Green Heart Canister] from [Xorcite Shard][+3]
craft.reshapeless(<bhc:green_heart_canister>, "Y□H◊", {
  "Y": <bhc:yellow_heart_canister>, # Yellow Heart Canister
  "□": <ore:plateMithril>,          # Mana Infused Plate
  "H": <bhc:green_heart>,           # Green Heart
  "◊": <ore:gemXorcite>,            # Xorcite Shard
});

# [Blue Heart Canister] from [Corrupted Glitch Heart][+3]
craft.reshapeless(<bhc:blue_heart_canister>, "GTH§", {
  "G": <bhc:green_heart_canister>,     # Green Heart Canister
  "T": <minecraft:totem_of_undying>,   # Totem of Undying
  "H": <bhc:blue_heart>,               # Blue Heart
  "§": <deepmoblearning:glitch_heart>, # Corrupted Glitch Heart
});
