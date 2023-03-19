
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

// ---------------------------
// Entity brewing
// ---------------------------
for output, ingrs in {
  # [Random Peacock] from [Ground Turkey]*2[+3]
  <animania:entity_egg_peacock_random> * 4 : [
    <harvestcraft:groundturkeyitem>,   # Ground Turkey
    <mysticalagriculture:crafting:24>, # Mystical Feather
    <rats:feathery_wing>,              # Feathery Wing
  ],

  # [Random Rabbit] from [Ground Rabbit]*2[+2]
  <animania:entity_egg_rabbit_random> * 4 : [
    <harvestcraft:groundrabbititem>, # Ground Rabbit
    <minecraft:rabbit_foot>,         # Rabbit's Foot
    <tconstruct:edible:15>,          # Rabbit Jerky
  ],

  # [Random Cow] from [Ground Beef]*2[+2]
  <animania:entity_egg_cow_random> * 4 : [
    <harvestcraft:groundbeefitem>,  # Ground Beef
    <cookingforblockheads:cow_jar>, # Cow in a Jar
    <ore:blockCheese>,              # Block of Cheese
  ],

  # [Random Pig] from [Ground Pork]*2[+2]
  <animania:entity_egg_pig_random> * 4 : [
    <harvestcraft:groundporkitem>, # Ground Pork
    <tconstruct:edible>,           # Bacon
    <ore:nuggetPigiron>,           # Pigiron Nugget
  ],

  # [Random Chicken] from [Ground Chicken]*2[+2]
  <animania:entity_egg_chicken_random> * 4 : [
    <harvestcraft:groundchickenitem>, # Ground Chicken
    <tconstruct:edible:12>,           # Chicken Jerky
    <ore:blockMeatChicken>,           # Single Compressed Chicken
  ],

  # [Random Goat] from [Ground Venison]*2[+2]
  <animania:entity_egg_goat_random> * 4 : [
    <harvestcraft:groundvenisonitem>, # Ground Venison
    <ore:boneWither>,                 # Necrotic Bone
    <endreborn:food_ender_flesh>,     # Mysical Flesh
  ],

  # [Random Sheep] from [Ground Mutton]*2[+2]
  <animania:entity_egg_sheep_random> * 4 : [
    <harvestcraft:groundmuttonitem>,    # Ground Mutton
    <ore:wool>,                         # White Wool
    <harvestcraft:hardenedleatheritem>, # Hardened Leather
  ],

  # Hamster
  <animania:entity_egg_hamster> * 4 : [
    <ore:foodGroundnutmeg>,
    <animania:hamster_food>,
    <animania:hamster_ball_clear>,
  ],

  # Frog
  <animania:entity_egg_frog> : [
    <quark:golden_frog_leg>,    # Golden Frog Leg
    <ore:ballMud>,              # Mud Ball
    <harvestcraft:frograwitem>, # Raw Frog
  ],

  # Dart Frog
  <animania:entity_egg_dart_frog> : [
    <quark:golden_frog_leg>,    # Golden Frog Leg
    <ore:plantPoisonivy>,       # Poison Ivy
    <harvestcraft:frograwitem>, # Raw Frog
  ],

  # Small worm
  <iceandfire:iceandfire.deathworm_egg> : [
    <twilightforest:moonworm>,
    <ore:animaniaEggs>,
    <actuallyadditions:item_worm>,
  ],

  # Big worm
  <iceandfire:iceandfire.deathworm_egg:1> : [
    <twilightforest:moonworm>,
    <iceandfire:iceandfire.deathworm_egg>,
    <actuallyadditions:item_worm>,
  ],

  # [Jungle Myrmex Egg]
  <iceandfire:myrmex_jungle_egg> : [
    <randomthings:weatheregg:1>,
    <twilightforest:cicada>,
    <ore:deathwormChitin>,
  ],

  # [Desert Myrmex Egg]
  <iceandfire:myrmex_desert_egg> : [
    <randomthings:weatheregg>,
    <twilightforest:cicada>,
    <ore:deathwormChitin>,
  ],

  # [Jungle Myrmex Queen Egg]
  <iceandfire:myrmex_jungle_egg:4> : [
    <ore:carminite>,
    <twilightforest:cicada>,
    <iceandfire:myrmex_jungle_resin>,
  ],

  # [Desert Myrmex Queen Egg]
  <iceandfire:myrmex_desert_egg:4> : [
    <ore:carminite>,
    <twilightforest:cicada>,
    <iceandfire:myrmex_desert_resin>,
  ],

  # Hippogryphs
  <iceandfire:hippogryph_egg:0> : [<ore:foodGroundduck>, <animania:raw_horse>, <animania:wool:1>],
  <iceandfire:hippogryph_egg:1> : [<ore:foodGroundduck>, <animania:raw_horse>, <animania:wool:0>],
  <iceandfire:hippogryph_egg:2> : [<ore:foodGroundduck>, <animania:raw_horse>, <animania:wool:2>],
  <iceandfire:hippogryph_egg:3> : [<ore:foodGroundduck>, <animania:raw_horse>, <animania:wool:4>],
  <iceandfire:hippogryph_egg:4> : [<ore:foodGroundduck>, <animania:raw_horse>, <animania:wool:3>],
  <iceandfire:hippogryph_egg:5> : [<ore:foodGroundduck>, <animania:raw_horse>, <animania:wool:6>],
  <iceandfire:hippogryph_egg:6> : [<ore:foodGroundduck>, <animania:raw_horse>, <animania:wool:5>],

} as IIngredient[][IItemStack] {
  mods.rustic.Condenser.addRecipe(output, ingrs, <scalinghealth:heartdust>, <tconstruct:edible:33>, <fluid:wine> * 1000, 40);
}