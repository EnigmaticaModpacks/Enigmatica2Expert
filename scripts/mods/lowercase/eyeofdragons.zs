#modloaded eyeofdragons

# New OreDict for Questbook
<ore:eyeOfDragon>.addItems([<eyeofdragons:eye_of_firedragon>, <eyeofdragons:eye_of_icedragon>]);

# [Eye of Fire Dragon]*16 from [Ender Eye Dust][+1]
craft.reshapeless(<eyeofdragons:eye_of_firedragon> * 16, "D▲", {
  "D": <iceandfire:fire_dragon_heart>,  # Fire Dragon Heart
  "▲": <ore:dustEnderEye>, # Ender Eye Dust
});

# [Eye of Ice Dragon]*16 from [Ender Eye Dust][+1]
craft.reshapeless(<eyeofdragons:eye_of_icedragon> * 16, "D▲", {
  "D": <iceandfire:ice_dragon_heart>,  # Ice Dragon Heart
  "▲": <ore:dustEnderEye>, # Ender Eye Dust
});