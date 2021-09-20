import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.cyclicmagic.Hydrator;  
import mods.cyclicmagic.Solidifier;  
import mods.cyclicmagic.Dehydrator;
import crafttweaker.data.IData;
#modloaded cyclicmagic

# *======= Recipes =======*

# Removing Simple Block Miner
	utils.rh(<cyclicmagic:block_miner>);

# Redstone Clock
	recipes.remove(<cyclicmagic:clock>);
	recipes.addShapedMirrored("Cyclic Redstone Clock", 
	<cyclicmagic:clock>, 
	[[<ore:ingotFakeIron>, <ore:circuitAdvanced>, <ore:ingotFakeIron>],
	[<ore:circuitBasic>, <extrautils2:redstoneclock>, <ore:circuitBasic>], 
	[<ore:ingotFakeIron>, <ore:circuitAdvanced>, <ore:ingotFakeIron>]]);

# [Fluid Storage Tank] from [Tank][+3]
craft.remake(<cyclicmagic:block_storeempty>, ["pretty",
  "□ ▬ □",
  "п T п",
  "□ ▬ □"], {
  "□": <ore:plateAluminium>,  # Aluminum Plate
  "T": <enderio:block_omni_reservoir>,     # Tank
  "▬": <ore:ingotBrickSeared>,# Seared Brick
  "п": <ore:plateCopper>,     # Copper Plate
});

# Charms
	recipes.remove(<cyclicmagic:charm_fire>);
	recipes.addShapedMirrored("Fire Charm", 
	<cyclicmagic:charm_fire>, 
	[[<tconstruct:edible:34>, <minecraft:potion>.withTag({Potion: "minecraft:fire_resistance"}), <tconstruct:edible:34>],
	[<ore:powderBlaze>, <extrautils2:goldenlasso:1>.withTag({Animal:{id:"minecraft:blaze"}}), <ore:powderBlaze>], 
	[<tconstruct:edible:34>, <minecraft:potion>.withTag({Potion: "minecraft:fire_resistance"}), <tconstruct:edible:34>]]);

	recipes.remove(<cyclicmagic:charm_water>);
	recipes.addShapedMirrored("Water Charm", 
	<cyclicmagic:charm_water>, 
	[[<minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>],
	[<mekanism:gastank>, <extrautils2:goldenlasso>.withTag({Animal:{id:"minecraft:squid"}}), <mekanism:gastank>], 
	[<minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>]]);
	
	recipes.remove(<cyclicmagic:charm_antidote>);
	recipes.addShapedMirrored("Antidote Charm", 
	<cyclicmagic:charm_antidote>, 
	[[<ore:listAllmilk>, <ore:listAllmilk>, <ore:listAllmilk>],
	[<minecraft:poisonous_potato>, <extrautils2:goldenlasso:1>.withTag({Animal:{id:"minecraft:witch"}}), <minecraft:poisonous_potato>], 
	[<ore:listAllmilk>, <ore:listAllmilk>, <ore:listAllmilk>]]);

	recipes.remove(<cyclicmagic:charm_wing>);
	recipes.addShapedMirrored("Wing Charm", 
	<cyclicmagic:charm_wing>, 
	[[<ore:feather>, <ore:feather>, <ore:feather>],
	[<minecraft:rabbit_foot>, <extrautils2:goldenlasso>.withTag({Animal:{id:"minecraft:chicken"} }), <minecraft:rabbit_foot>], 
	[<ore:feather>, <ore:feather>, <ore:feather>]]);
	
# Speed Charm + Elythra is too OP
<cyclicmagic:charm_speed>.maxDamage = 100;
# [Speed Charm] from [Golden Lasso][+3]
craft.remake(<cyclicmagic:charm_speed>, ["pretty",
  "A S A",
  "H G H",
  "A S A"], {
  "A": <quark:glowshroom>, # Glowshroom
  "S": <actuallyadditions:item_solidified_experience>, # Solidified Experience
  "G": <extrautils2:goldenlasso>.withTag({Animal: {id: "minecraft:horse"}}), # Golden Lasso
  "H": <ore:foodCake>,    # Holiday Cake
});


# Harvester
	recipes.remove(<cyclicmagic:harvester_block>);
	recipes.addShaped("Cyclic Harvester", 
	<cyclicmagic:harvester_block>, 
	[[<ore:gemEmerald>, <minecraft:dispenser>, <ore:gemEmerald>],
	[<ore:gemQuartz>, <ic2:resource:13>, <ore:gemQuartz>], 
	[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>]]);

# [Forester] from [Conglomerate Of Coal][+3]
craft.remake(<cyclicmagic:block_forester>, ["pretty",
  "▲ § ▲",
  "# ☺ #",
  "# # #"], {
  "▲": <ore:dustAsh>,                         # Ash
  "#": <forestry:wood_pile>,                  # Wood Pile
  "§": <randomthings:slimecube>,              # Slime Cube
  "☺": <contenttweaker:conglomerate_of_coal>, # Conglomerate Of Coal
});

# Diamond Anvil
	recipes.remove(<cyclicmagic:block_anvil>);
	recipes.addShaped("Diamond Anvil", 
	<cyclicmagic:block_anvil>, 
	[[<ore:gemDiamondRat>, <ore:plateDenseObsidian>, <ore:gemDiamondRat>],
	[<ore:dustRedstone>, <actuallyadditions:block_item_repairer>, <ore:dustRedstone>], 
	[<ore:blockFakeIron>, <ore:blockFakeIron>, <ore:blockFakeIron>]]);
	
# Explosionproof Cyclic Glass
	recipes.remove(<cyclicmagic:glass_strong>);
	recipes.addShaped("Cyclic Strong Glass", 
	<cyclicmagic:glass_strong>*8, 
	[[<extrautils2:decorativeglass:3>, <extrautils2:decorativeglass:3>, <extrautils2:decorativeglass:3>], 
	[<extrautils2:decorativeglass:3>, <enderio:block_reinforced_obsidian>, <extrautils2:decorativeglass:3>], 
	[<extrautils2:decorativeglass:3>, <extrautils2:decorativeglass:3>, <extrautils2:decorativeglass:3>]
	]);
	
# Climbing Gloves
remakeEx(<cyclicmagic:glove_climb>, [
	[<rats:feral_rat_claw>, <rats:feral_rat_claw>, null],
	[<rats:feral_rat_claw>, <ic2:misc_resource:4>, <harvestcraft:hardenedleatheritem>],
	[null, <harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>]]);

# Igniter
remakeEx(<randomthings:igniter>, [
	[<ore:gearSteel>, <ore:gearSteel>, <ore:netherrack>],
	[<minecraft:dispenser>, <iceandfire:fire_dragon_blood>, <ore:netherrack>],
	[<ore:gearSteel>, <ore:gearSteel>, <ore:netherrack>]]);

	
# Scepters harder
recipes.remove(<cyclicmagic:tool_swap_match>);
recipes.remove(<cyclicmagic:tool_swap>);
recipes.remove(<cyclicmagic:cyclic_wand_build>);
recipes.addShaped(<cyclicmagic:tool_swap>, [[null, <ore:dustDimensional>, <appliedenergistics2:material:10>],[null, <redstonearsenal:material:192>, <ore:dustDimensional>], [<enderio:block_reinforced_obsidian>, null, null]]);
recipes.addShaped(<cyclicmagic:tool_swap_match>, [[null, <ore:dustDimensional>, <randomthings:ingredient:9>],[null, <redstonearsenal:material:192>, <ore:dustDimensional>], [<enderio:block_reinforced_obsidian>, null, null]]);
recipes.addShaped(<cyclicmagic:cyclic_wand_build>, [[null, <ore:dustDimensional>, <ore:gemDiamondRat>],[null, <redstonearsenal:material:192>, <ore:dustDimensional>], [<ore:blockBone>, null, null]]);


remakeEx(<cyclicmagic:battery>, [
	[<ore:clay>, <ore:blockRedstone>, <ore:clay>],
	[<ore:blockRedstone>, <rats:charged_creeper_chunk>, <ore:blockRedstone>],
	[<ore:clay>, <ore:blockRedstone>, <ore:clay>]]);

# Clear tank
recipes.addShapeless("Cyclic tank clear", <cyclicmagic:block_storeempty>, [<cyclicmagic:block_storeempty>]);

# Harder shears
recipes.remove(<cyclicmagic:shears_obsidian>);
recipes.addShaped("Cyclic Shears", <cyclicmagic:shears_obsidian>, [
	[null, <ore:ingotRefinedObsidian>, null],
	[<ore:ingotRefinedObsidian>, <minecraft:shears>, <ore:ingotRefinedObsidian>],
	[null, <ore:ingotRefinedObsidian>, null]]);

# Harder Sleeping mat
recipes.remove(<cyclicmagic:sleeping_mat>);
recipes.addShapeless("Cyclic Sleep Mat", <cyclicmagic:sleeping_mat>, [
	utils.tryCatch("travelersbackpack:sleeping_bag_bottom", <minecraft:rabbit_hide>), <ore:leather>]);

# Lower durab of glowes (default is 6000)
<cyclicmagic:glove_climb>.maxDamage = 3000;

# [Void_Charm] from [Slime_Cube][+3]
craft.remake(<cyclicmagic:charm_void>, ["pretty",
  "▲ ◊ ▲",
  "◊ § ◊",
  "▲ ◊ ▲"], {
  "▲": <ore:dustEnderEye>,          # Ender Eye Dust
  "§": <ore:dyePurple>,
  "◊": <ore:quicksilver>,
});

# [Sailor_Charm] from [Heart_Crystal_Shard][+2]
craft.remake(<cyclicmagic:charm_boat>, ["pretty",
  "A A A",
  "b ☼ b",
  "A A A"], {
  "A": <ore:listAllsugar>,          # Sugar
  "b": <ore:boat>,                  # Oak Boat
  "☼": <scalinghealth:crystalshard> # Heart Crystal Shard
});

# ---------------- Animals

# [Monster Ball*2] from [Heart Crystal Shard][+3]
craft.remake(<cyclicmagic:magic_net> * 2, ["pretty",
  "S G S",
  "G ☼ G",
  "C G C"], {
  "C": <ore:nuggetCobalt>,           # Cobalt Nugget
  "S": <minecraft:snowball>,         # Snowball
  "G": <minecraft:tallgrass:*>,      # Grass
  "☼": <scalinghealth:crystalshard>, # Heart Crystal Shard
});

# [Apple_of_Lofty_Stature] from [Mending_Moss][+2]
craft.reshapeless(<cyclicmagic:food_step>, "PMr", {
  "P": <ore:cropApple>,
  "r": <randomthings:ingredient:9>, # Precious Emerald
  "M": <tconstruct:materials:19>    # Mending Moss
});

# [Fan] from [Hamster_Wheel][+3]
craft.remake(<cyclicmagic:fan>, ["pretty",
  "  B  ",
  "L H L",
  "R R R"], {
  "R": <extrautils2:decorativesolidwood>,# Magical Planks
  "B": <randomthings:ingredient:13>,     # Blackout Powder
  "H": <animania:block_hamster_wheel>,   # Hamster Wheel
  "L": <rats:little_black_squash_balls>  # Little Black Squash Balls
});

# [Item Collector] from [Print_Press_Plate][+3]
craft.remake(<cyclicmagic:block_vacuum>, ["pretty",
  "R B R",
  "R P R",
  "R ▲ R"], {
  "P": <bibliocraft:enchantedplate:*>,   # Print Press Plate
  "R": <extrautils2:decorativesolidwood>,# Magical Planks
  "▲": <ore:dustSkyStone>,               # Sky Stone Dust
  "B": <randomthings:ingredient:13>      # Blackout Powder
});



# [Player_Launcher] from [Slimesling][+2]
craft.remake(<cyclicmagic:tool_launcher>, ["pretty",
  "  # #",
  "  S #",
  "s    "], {
  "#": <randomthings:spectreplank>,
  "s": <quark:slime_bucket>,
  "S": <tconstruct:slimesling:*>.anyDamage() # Slimesling
});

# [Storage_Bag] from [Crystallized_Amber][+2]
craft.remake(<cyclicmagic:storage_bag>, ["pretty",
  "  B  ",
  "M C M",
  "B B B"], {
  "B": <actuallyadditions:item_hairy_ball>, # Ball of Fur
  "C": <cyclicmagic:crystallized_amber>,    # Crystallized Amber
  "M": <extrautils2:decorativesolidwood>    # Magical Planks
});


# [Ender_Orb] from [Cheese_Wheel_(Friesian)][+2]
craft.remake(<cyclicmagic:ender_pearl_reuse>, ["pretty",
  "☼ ▲ ☼",
  "▲ W ▲",
  "☼ ▲ ☼"], {
  "▲": <ore:dustEnderEye>,          # Ender Eye Dust
  "W": <ore:cheeseWheels>,          # Cheese Wheel (Friesian)
  "☼": <scalinghealth:crystalshard> # Heart Crystal Shard
});

# [Ender_Orb_Translocator] from [Cheese_Wheel_(Friesian)][+2]
craft.remake(<cyclicmagic:ender_pearl_mounted>, ["pretty",
  "T ▲ T",
  "▲ W ▲",
  "T ▲ T"], {
  "▲": <ore:dustEnderEye>,   # Ender Eye Dust
  "T": <ore:dustDimensional>,
  "W": <ore:cheeseWheels>    # Cheese Wheel (Friesian)
});


craft.remake(<cyclicmagic:sprout_seed> * 4, ["pretty",
  "1 2 3",
  "R F R",
  "4 5 6"], {
  "R": <forestry:refractory_wax>,     # Refractory Wax
  "F": <randomthings:fertilizeddirt>, # Fertilized Dirt
  "W": <ore:listAllseed>,             # Seeds
  "1": <exnihilocreatio:item_seed_spruce>,
  "2": <exnihilocreatio:item_seed_acacia>,
  "3": <exnihilocreatio:item_seed_birch>,
  "4": <exnihilocreatio:item_seed_darkoak>,
  "5": <exnihilocreatio:item_seed_oak>,
  "6": <exnihilocreatio:item_seed_jungle>,
});

# [Crystallized_Obsidian*2] from [Weather_Egg_<Rain>][+3]
craft.remake(<cyclicmagic:crystallized_obsidian> * 2, ["pretty",
  "  M  ",
  "□ W □",
  "C C C"], {
  "□": <integratedterminals:chorus_glass>,
  "C": <biomesoplenty:crystal>,     # Crystallized Obsidian
  "W": <randomthings:weatheregg:1>, # Weather Egg <Rain>
  "M": <tconstruct:materials:19>,   # Mending Moss
});

# [Crystallized_Amber*2] from [Weather_Egg_<Sun>][+3]
craft.remake(<cyclicmagic:crystallized_amber> * 2, ["pretty",
  "  M  ",
  "◘ W ◘",
  "□ □ □"], {
  "□": <ore:blockAmber>,          # Block of Amber
  "W": <randomthings:weatheregg>, # Weather Egg <Sun>
  "◘": <integratedterminals:chorus_glass>,
  "M": <tconstruct:materials:19>  # Mending Moss
});


# [Automated_User] from [Weather_Egg_<Storm>][+3]
craft.remake(<cyclicmagic:block_user>, ["pretty",
  "  ◊  ",
  "C W C",
  "# # #"], {
  "#": <randomthings:spectrelog>,
  "C": <rats:charged_creeper_chunk>, # Charged Creeper Chunk
  "W": <randomthings:weatheregg:2>,  # Weather Egg <Storm>
  "◊": <ore:gemPearl>                # Shulker Pearl
});

# [Sprinkler*2] from [Fertilized_Dirt][+3]
craft.remake(<cyclicmagic:sprinkler> * 2, ["pretty",
  "A A A",
  "  F  ",
  "M t M"], {
  "A": <ore:listAllwater>,                    # Water Bucket
  "t": <contenttweaker:conglomerate_of_coal>,
  "F": <randomthings:fertilizeddirt>,         # Fertilized Dirt
  "M": <extrautils2:decorativesolidwood>,     # Magical Planks
});


# [Pharos_Beacon] from [Spectre_Illuminator][+3]
craft.remake(<cyclicmagic:beacon_potion>, ["pretty",
  "□ B □",
  "□ S □",
  "▬ ▬ ▬"], {
  "□": <ore:fusedQuartz>,
  "B": <biomesoplenty:jar_filled:1>,      # Blue Fire Jar
  "S": <randomthings:spectreilluminator>, # Spectre Illuminator
  "▬": <ore:ingotPulsatingIron>           # Pulsating Iron Ingot
});

# [Air_Charm] from [Ender_Orb][+3]
<cyclicmagic:charm_air>.maxDamage = 1000;
craft.remake(<cyclicmagic:charm_air>, ["pretty",
  "B I B",
  "G E G",
  "B I B"], {
  "B": <actuallyadditions:item_misc:15>, # Bat's Wing
  "E": <cyclicmagic:ender_pearl_reuse>.anyDamage(),  # Ender Orb
  "G": utils.tryCatch("openblocks:generic", <enderio:item_material:6>), # Glider Wing
  "I": <twilightforest:ice_bomb>         # Ice Bomb
});


# [auto_crafter] from [Conglomerate_Of_Sun][+4]
craft.remake(<cyclicmagic:auto_crafter>, ["pretty",
  "s B s",
  "E C E",
  "▬ ▬ ▬"], {
  "B": <biomesoplenty:jar_filled:1>,         # Blue Fire Jar
  "s": <quark:slime_bucket>,
  "C": <contenttweaker:conglomerate_of_sun>, # Conglomerate Of Sun
  "E": <contenttweaker:empowered_phosphor>,  # Empowered Phosphor
  "▬": <ore:ingotBlackIron>                  # Black Iron Ingot
});



# [Empty_Heart_Container] from [Conglomerate_Of_Life][+2]
craft.remake(<cyclicmagic:heart_toxic>, ["pretty",
  "☼ S ☼",
  "☼ C ☼",
  "☼ ☼ ☼"], {
  "S": <iceandfire:siren_tear>,               # Siren Tear
  "C": <contenttweaker:conglomerate_of_life>, # Conglomerate Of Life
  "☼": <scalinghealth:crystalshard>           # Heart Crystal Shard
});

# [Corrupted_Chorus_Fruit*4] from [Fermented_Spider_Eye][+3]
craft.remake(<cyclicmagic:corrupted_chorus> * 4, ["pretty",
  "P S P",
  "C F C",
  "P S P"], {
  "P": <minecraft:chorus_fruit>,
  "C": <ore:fruitForestry>,             # Cherry
  "S": <rats:string_cheese>,            # String Cheese
  "F": <minecraft:fermented_spider_eye>,# Fermented Spider Eye
});

# [Glowing_Chorus_Fruit] from [Crystallized_Obsidian_Bucket][+1]
recipes.remove(<cyclicmagic:glowing_chorus> * 8);
scripts.wrap.inworldcrafting.FluidToItem.transform(<cyclicmagic:glowing_chorus>, <fluid:flux_goo>, [<cyclicmagic:corrupted_chorus>]);

# [Ender_Wing] from [Golden_Egg][+4]
craft.remake(<cyclicmagic:tool_warp_spawn>, ["pretty",
  "  f B",
  "▬ G f",
  "P ▬  "], {
  "P": <forestry:crafting_material:1>,      # Pulsating Mesh
  "B": <actuallyadditions:item_hairy_ball>, # Ball of Fur
  "f": <ore:peacockFeathers>,
  "G": <randomthings:ingredient:11>,        # Golden Egg
  "▬": <ore:ingotGold>                      # Gold Ingot
});

# [Ender_Wing_Prime] from [Golden_Egg][+4]
craft.remake(<cyclicmagic:tool_warp_home>, ["pretty",
  "  f S",
  "▬ G f",
  "P ▬  "], {
  "P": <forestry:crafting_material:1>, # Pulsating Mesh
  "S": <rats:string_cheese>,           # String Cheese
  "f": <ore:peacockFeathers>,
  "G": <randomthings:ingredient:11>,   # Golden Egg
  "▬": <ore:ingotGold>                 # Gold Ingot
});

# [Automatic_Fishing_Net] from [Slime_Cube][+2]
craft.remake(<cyclicmagic:block_fishing>, ["pretty",
  "R W R",
  "W § W",
  "R W R"], {
  "R": <ore:myrmexResin>,              # Desert Myrmex Resin Chunk
  "W": <forestry:crafting_material:3>, # Woven Silk
  "§": <randomthings:slimecube>        # Slime Cube
});

# [Fire_Starter] from [Crystallized_Amber][+4]
craft.remake(<cyclicmagic:fire_starter>, ["pretty",
  "R B R",
  "▲ C ▲",
  "R ☺ R"], {
  "R": <forestry:refractory_wax>,            # Refractory Wax
  "▲": <mechanics:fuel_dust_tiny>,           # Tiny Pile of Heavy Fuel Dust
  "B": <biomesoplenty:jar_filled:1>,         # Blue Fire Jar
  "C": <cyclicmagic:crystallized_amber>,     # Crystallized Amber
  "☺": <contenttweaker:conglomerate_of_coal> # Conglomerate Of Coal
});

# [Hydrator] from [Ectoplasm][+3]
craft.remake(<cyclicmagic:block_hydrator>, ["pretty",
  "A B A",
  "A E A",
  "M M M"], {
  "A": <ore:listAllwater>,               # Water Bucket
  "B": <rats:little_black_squash_balls>, # Little Black Squash Balls
  "E": <randomthings:ingredient:2>,      # Ectoplasm
  "M": <extrautils2:decorativesolidwood> # Magical Planks
});

# [Solidifier] from [Ectoplasm][+3]
craft.remake(<cyclicmagic:solidifier>, ["pretty",
  "P B P",
  "P E P",
  "M M M"], {
  "P": <ore:brickPeat>,                  # Peat
  "B": <randomthings:ingredient:13>,     # Blackout Powder
  "E": <randomthings:ingredient:2>,      # Ectoplasm
  "M": <extrautils2:decorativesolidwood> # Magical Planks
});

# ---------------------------------------------
# Cyclic machines rework
# https://github.com/Lothrazar/Cyclic/tree/trunk/1.12/scripts_zen_example

/*

  📮 Packager

*/
for it in [
  <minecraft:dirt:1>      , <minecraft:iron_block>       , <minecraft:iron_ingot>   ,
  <minecraft:gold_block>  , <minecraft:gold_ingot>       , <minecraft:melon_block>  ,
  <minecraft:coal_block>  , <minecraft:redstone_block>   , <minecraft:glowstone>    ,
  <minecraft:brick_block> , <minecraft:nether_brick>     , <minecraft:quartz_block> ,
  <minecraft:hay_block>   , <minecraft:emerald_block>    , <minecraft:diamond_block>,
  <minecraft:magma>       , <minecraft:nether_wart_block>, <minecraft:slime>        ,
  <minecraft:purpur_block>, <minecraft:clay>             , <minecraft:snow>         ,
  <minecraft:prismarine>  , <minecraft:sandstone>        , <minecraft:red_sandstone>,
  <minecraft:lapis_block> , <minecraft:bone_block>       ,
] as IItemStack[] {
  mods.cyclicmagic.Packager.removeRecipe(it);
}

val sa = <minecraft:sand> * 4;
val gr = <minecraft:gravel> * 4;
val packagerList = [
  [<minecraft:concrete_powder> * 8   ], [sa, gr, <ore:dyeWhite>.firstItem],
  [<minecraft:concrete_powder:1> * 8 ], [sa, gr, <ore:dyeOrange>.firstItem],
  [<minecraft:concrete_powder:2> * 8 ], [sa, gr, <ore:dyeMagenta>.firstItem],
  [<minecraft:concrete_powder:3> * 8 ], [sa, gr, <ore:dyeLightBlue>.firstItem],
  [<minecraft:concrete_powder:4> * 8 ], [sa, gr, <ore:dyeYellow>.firstItem],
  [<minecraft:concrete_powder:5> * 8 ], [sa, gr, <ore:dyeLime>.firstItem],
  [<minecraft:concrete_powder:6> * 8 ], [sa, gr, <ore:dyePink>.firstItem],
  [<minecraft:concrete_powder:7> * 8 ], [sa, gr, <ore:dyeGray>.firstItem],
  [<minecraft:concrete_powder:8> * 8 ], [sa, gr, <ore:dyeLightGray>.firstItem],
  [<minecraft:concrete_powder:9> * 8 ], [sa, gr, <ore:dyeCyan>.firstItem],
  [<minecraft:concrete_powder:10> * 8], [sa, gr, <ore:dyePurple>.firstItem],
  [<minecraft:concrete_powder:11> * 8], [sa, gr, <ore:dyeBlue>.firstItem],
  [<minecraft:concrete_powder:12> * 8], [sa, gr, <ore:dyeBrown>.firstItem],
  [<minecraft:concrete_powder:13> * 8], [sa, gr, <ore:dyeGreen>.firstItem],
  [<minecraft:concrete_powder:14> * 8], [sa, gr, <ore:dyeRed>.firstItem],
  [<minecraft:concrete_powder:15> * 8], [sa, gr, <ore:dyeBlack>.firstItem],

  [<mctsmelteryio:iceball>   ], [<minecraft:snow> * 2     ],
  [<mctsmelteryio:iceball>   ], [<minecraft:snowball> * 8 ],
  [<rats:token_fragment>     ], [<rats:tiny_coin> * 9     ],
  [<rats:token_piece>        ], [<rats:token_fragment> * 9],
  [<rats:chunky_cheese_token>], [<rats:token_piece> * 9   ],
  
  [<environmentalmaterials:alabaster> * 4], [<minecraft:cobblestone> * 4, <minecraft:dye:15>                   * 5],
  [<environmentalmaterials:alabaster> * 4], [<minecraft:cobblestone> * 4, <biomesoplenty:white_dye>            * 5],
  [<environmentalmaterials:alabaster> * 4], [<minecraft:cobblestone> * 4, <thermalfoundation:dye:15>           * 5],
  [<environmentalmaterials:alabaster> * 4], [<minecraft:cobblestone> * 4, <botania:dye>                        * 5],
  [<environmentalmaterials:alabaster> * 4], [<minecraft:cobblestone> * 4, <industrialforegoing:artificial_dye> * 5],
  [<environmentalmaterials:alabaster> * 4], [<minecraft:cobblestone> * 4, <quark:root_dye:2>                   * 5],

  [<nuclearcraft:part:1>], [<ore:plateLead>.firstItem, <ic2:casing:4>, <ore:ingotGraphite>.firstItem * 2, <ore:ingotTough>.firstItem * 4, <minecraft:redstone> * 4],
  [<nuclearcraft:part>], [<ore:plateLead>.firstItem, <ic2:casing:4>, <ore:ingotGraphite>.firstItem * 2],
] as IItemStack[][];

for i, l in packagerList {
  if(i%2==0) continue;
  if(l.length==1)
    mods.cyclicmagic.Packager.addRecipe(packagerList[i - 1][0], l[0]);
  else
    mods.cyclicmagic.Packager.addRecipe(packagerList[i - 1][0], l);
}


/*

  💧 Hydrator

*/

Hydrator.addRecipe(<thermalexpansion:florb>.withTag({Fluid: "water"}), [<thermalexpansion:florb>], 1000);

# Concrete
var concreteArr = [<minecraft:clay_ball>, <minecraft:gravel>] as IItemStack[];
Hydrator.addRecipe(<immersiveengineering:stone_decoration:5> * 4, concreteArr + (<minecraft:sand> * 2), 500);
for it in <ore:itemSlag>.items {
  Hydrator.addRecipe(<immersiveengineering:stone_decoration:5> * 6, concreteArr + (it * 2), 500);
}

# Asphalt Concrete
for bit in <ore:bitumen>.items {
  var aspConcreteArr = [bit, <minecraft:gravel>] as IItemStack[];
  Hydrator.addRecipe(<immersivepetroleum:stone_decoration> * 4, aspConcreteArr + (<minecraft:sand> * 2), 500);
  for it in <ore:itemSlag>.items {
    Hydrator.addRecipe(<immersivepetroleum:stone_decoration> * 6, aspConcreteArr + (it * 2), 500);
  }
}

# Super lubricient ice
for it in <ore:slimeball>.items {
  Hydrator.addRecipe(<randomthings:superlubricentice> * 16, [it, <minecraft:ice>], 1000);
}

# Decor blocks
Hydrator.removeShapedRecipe(<minecraft:cobblestone>);
Hydrator.addRecipe(<quark:iron_plate:1> * 3, [<minecraft:iron_ingot>], 125);
Hydrator.addRecipe(<quark:iron_plate:1>, [<quark:iron_plate>], 125);
Hydrator.addRecipe(<chisel:waterstone>, [<minecraft:stone>], 125);


# Misc
Hydrator.addRecipe(<actuallyadditions:item_misc:12>, [<actuallyadditions:item_misc:9>], 250);
Hydrator.addRecipe(<minecraft:ice>, [<thermalfoundation:material:1025>], 1000);
Hydrator.addRecipe(<biomesoplenty:mud>, [<minecraft:dirt>], 1000);

# Remove terracotta hydrating to prevent Infinity Furnace dupe
for i in 0 .. 16 {
  Hydrator.removeShapedRecipe(itemUtils.getItem("minecraft:stained_hardened_clay", i));
}

/*

  🌢 Dehydrator

*/

# Bug: Dehydrator always output only 100mb of water
// Dehydrator.addRecipe(<ae2fc:fluid_drop>.withTag({Fluid: "water"}), <mysticalagriculture:water_essence>, 250);


/*

  🙫 Solidifier

*/



# ---------------------------------------------


# [Sword_of_Atrophy] from [Crystal_Sword][+3]
craft.remake(<cyclicmagic:sword_weakness>, ["pretty",
  "    r",
  "☺ ☼  ",
  "C ☺  "], {
  "r": <cyclicmagic:crystallized_amber>,    # Crystallized Amber
  "C": <cyclicmagic:crystallized_obsidian>, # Crystallized Obsidian
  "☺": <contenttweaker:blasted_coal>,       # Blasted Coal
  "☼": <astralsorcery:itemcrystalsword>     # Crystal Sword
});

# [Sword_of_Decay] from [Crystal_Sword][+3]
craft.remake(<cyclicmagic:sword_slowness>, ["pretty",
  "    E",
  "☺ ☼  ",
  "C ☺  "], {
  "C": <cyclicmagic:crystallized_obsidian>, # Crystallized Obsidian
  "E": <contenttweaker:empowered_phosphor>, # Empowered Phosphor
  "☺": <contenttweaker:blasted_coal>,       # Blasted Coal
  "☼": <astralsorcery:itemcrystalsword>     # Crystal Sword
});

# [Sword_of_Evasion] from [Crystal_Sword][+3]
craft.remake(<cyclicmagic:sword_ender>, ["pretty",
  "    o",
  "☺ ☼  ",
  "C ☺  "], {
  "C": <cyclicmagic:crystallized_obsidian>, # Crystallized Obsidian
  "☺": <contenttweaker:blasted_coal>,       # Blasted Coal
  "☼": <astralsorcery:itemcrystalsword>,    # Crystal Sword
  "o": <cyclicmagic:corrupted_chorus>       # Corrupted Chorus Fruit
});

# Fix color of conveyor (was purple)
# [Conveyor_Belt] from [Clay][+2]
craft.remake(<cyclicmagic:plate_push> * 8, ["pretty",
  "▬ d ▬",
  "d c d",
  "▬ d ▬"], {
  "c": <ore:clay>,     # Clay
  "d": <ore:dyeLime>,
  "▬": <ore:ingotIron>, # Iron Ingot
});

# [Cobblestone] from [Pebble]
craft.make(<minecraft:cobblestone>, ["pretty",
  "r r r",
  "r   r",
  "r r r"], {
  "r": <ore:rock> # Pebble
});

# Harder recipe to balance teleporting from caves
# [Rod_of_Elevation] from [Escape_Rope][+3]
craft.remake(<cyclicmagic:tool_elevate>, ["pretty",
  "  ☼ M",
  "  E ☼",
  "╱    "], {
  "╱": <ore:rodBlaze>,               # Blaze Rod
  "E": <randomthings:escaperope>.anyDamage(), # Escape Rope
  "☼": <scalinghealth:crystalshard>, # Heart Crystal Shard
  "M": <tconstruct:materials:19>     # Mending Moss
});

# Remove because transcended by Conarm modifiers
utils.rh(<cyclicmagic:glowing_helmet>);

# [Water Candle] from [End Rod][+3]
craft.remake(<cyclicmagic:water_candle>, ["pretty",
  "  R  ",
  "▲ / ▲",
  "□ □ □"], {
  "□": <minecraft:light_weighted_pressure_plate>, # Weighted Pressure Plate (Light)
  "▲": <scalinghealth:heartdust>,                 # Heart Dust
  "R": <rats:rat_lantern>,                        # Rat Lantern
  "/": <minecraft:end_rod>,                       # End Rod
});

# [Experience Pylon] from [Mending Moss][+2]
craft.remake(<cyclicmagic:exp_pylon>, ["pretty",
  "S ▲ S",
  "S M S",
  "S ▲ S"], {
  "▲": <ore:dustEmerald>,         # Crushed Emerald
  "S": <ore:itemXP>, # Solidified Experience
  "M": <tconstruct:materials:19>, # Mending Moss
});

# [Empty Sack of Holding] from [Propolis][+2]
craft.remake(<cyclicmagic:chest_sack_empty>, ["pretty",
  "  s  ",
  "B P B",
  "B B B"], {
  "P": <forestry:propolis:*>, # Propolis
  "B": <ore:pelt>, # Brown Wolf Pelt
  "s": <ore:string>, # String
});

# [Ender Book] from [Tome of Knowledge][+3]
craft.remake(<cyclicmagic:book_ender>, ["pretty",
  "▬ S ▬",
  "R T R",
  "▬ S ▬"], {
  "R": <rats:ratlantean_flame>, # Ratlantean Spirit Flame
  "S": <cyclicmagic:soulstone>, # Soulstone
  "▬": <ore:ingotEndorium>,     # Endorium Ingot
  "T": <thermalfoundation:tome_experience>
    .withTag({Experience: 10000}, false)
    .only(function(item) { return
      !isNull(item.tag) &&
      !isNull(item.tag.Experience) &&
      item.tag.Experience.asInt() >= 10000
    ;}), # Tome of Knowledge
});