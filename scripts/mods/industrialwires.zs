#modloaded industrialwires

# Remake all relays to x8 (from x4)

val wireIngrs = {
  "-": <ore:ingotTin>,                            # Tin Ingot
  "R": <ore:itemRubber>,                          # Plastic
  "‗": <ore:ingotCopper>,                         # Copper Ingot
  "_": <ore:ingotGold>,                           # Gold Ingot
  "▬": <ore:ingotFakeIron>,                       # Iron Ingot
  "I": <immersiveengineering:stone_decoration:8>, # Insulating Glass
  "n": <ore:itemInsulatedGlassCable>,             # Glass Fibre Cable
  "⌃": <appliedenergistics2:material:10>,         # Pure Certus Quartz Crystal
  "■": <mekanism:plasticblock:*>,                 # Plastic Block
} as crafttweaker.item.IIngredient[string];

# [Tin Wire Relay] from [Tin Ingot][+1]
craft.remake(<industrialwires:ic2_connector:1> * 8, [" - ", "R-R"], wireIngrs);

# [Copper Wire Relay] from [Copper Ingot][+1]
craft.remake(<industrialwires:ic2_connector:3> * 8, [" ‗ ", "R‗R"], wireIngrs);

# [Gold Wire Relay] from [Gold Ingot][+1]
craft.remake(<industrialwires:ic2_connector:5> * 8, [" _ ", "R_R"], wireIngrs);

# [Universal HV Wire Relay] from [Iron Ingot][+1]
craft.remake(<industrialwires:ic2_connector:7> * 8, ["pretty",
  "  ▬  ",
  "I ▬ I",
  "I ▬ I"], wireIngrs
);

# Harder to make "switch" connections a challenge
# [Glass Fiber Wire Relay] from [Pure Certus Quartz Crystal]*2[+3]
craft.remake(<industrialwires:ic2_connector:9> * 8, ["pretty",
  "  n  ",
  "I ⌃ I",
  "I ■ I"], wireIngrs
);