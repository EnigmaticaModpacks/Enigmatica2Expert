#modloaded tinkersaddons

# [Amelioration Tome] from [Book][+1]
craft.reshapeless(<tinkersaddons:modifier_item>, "SB", {
  "B": <minecraft:book>,        # Book
  "S": <cyclicmagic:soulstone>, # Soulstone
});


# ----------------------------------------------------------
# Remake Toolkits
# ----------------------------------------------------------
val toolkitsMats = [
  "blockFakeIron", "pigiron"      , # [Iron Toolkit]
  "blockGold"    , "xu_evil_metal", # [Gold Toolkit]
  "blockDiamond" , "void_metal"   , # [Diamond Toolkit]
  "blockEnderium", "neutronium"   , # [Ender Toolkit]
] as string[];

val grid = ["pretty",
  "□ ■ □",
  "□ □ □",
] as string[];

for i, ore in toolkitsMats {
  if(i%2==1) continue;

  craft.remake(itemUtils.getItem("tinkersaddons:modifier_item", i / 2 + 1), grid, {
    "■": oreDict[ore],
    "□": <tconstruct:large_plate>.withTag({Material: toolkitsMats[i + 1]}),
  });
}