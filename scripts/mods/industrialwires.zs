#modloaded industrialwires

# Harder to make "switch" connections a challenge
# [Glass Fiber Wire Relay*4] from [Pure Certus Quartz Crystal][+3]
craft.remake(<industrialwires:ic2_connector:9> * 4, ["pretty",
  "  n  ",
  "I ⌃ I",
  "I ■ I"], {
  "■": <mekanism:plasticblock:*>, # Black Plastic Block
  "⌃": <ore:crystalPureCertusQuartz>, # Pure Certus Quartz Crystal
  "I": <immersiveengineering:stone_decoration:8>, # Insulating Glass
  "n": <ore:itemInsulatedGlassCable>, # Glass Fibre Cable
});