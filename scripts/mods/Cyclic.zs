import mods.jei.JEI.removeAndHide as rh;
#modloaded cyclicmagic

# *======= Recipes =======*

# Removing Simple Block Miner
	rh(<cyclicmagic:block_miner>);

# Redstone Clock
	recipes.remove(<cyclicmagic:clock>);
	recipes.addShapedMirrored("Cyclic Redstone Clock", 
	<cyclicmagic:clock>, 
	[[<ore:ingotIron>, <ore:circuitAdvanced>, <ore:ingotIron>],
	[<ore:circuitBasic>, <extrautils2:redstoneclock>, <ore:circuitBasic>], 
	[<ore:ingotIron>, <ore:circuitAdvanced>, <ore:ingotIron>]]);

# Fluid Storage Tank
	recipes.remove(<cyclicmagic:block_storeempty>);
	recipes.addShapedMirrored("Cyclic Fluid Storage Tank", 
	<cyclicmagic:block_storeempty>, 
	[[<ore:plateAluminium>, <ore:blockGlass>, <ore:plateAluminium>],
	[<ore:blockGlass>, <thermalexpansion:tank>.anyDamage(), <ore:blockGlass>], 
	[<ore:plateAluminium>, <ore:blockGlass>, <ore:plateAluminium>]]);

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
	
	recipes.remove(<cyclicmagic:charm_speed>);
	recipes.addShaped("Speed Charm", 
	<cyclicmagic:charm_speed>, 
	[[null, <minecraft:potion>.withTag({Potion: "minecraft:swiftness"}), null],
	[<ore:foodCake>, <extrautils2:goldenlasso>.withTag({Animal:{id:"minecraft:horse"} }), <ore:foodCake>], 
	[null, <minecraft:potion>.withTag({Potion: "minecraft:swiftness"}), null]]);

# Harvester
	recipes.remove(<cyclicmagic:harvester_block>);
	recipes.addShaped("Cyclic Harvester", 
	<cyclicmagic:harvester_block>, 
	[[<ore:gemEmerald>, <minecraft:dispenser>, <ore:gemEmerald>],
	[<ore:gemQuartz>, <ic2:resource:13>, <ore:gemQuartz>], 
	[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>]]);

# Forester
	recipes.remove(<cyclicmagic:block_forester>);
	recipes.addShaped("Cyclic Forester", 
	<cyclicmagic:block_forester>, 
	[[<ore:logWood>, <minecraft:dispenser>, <ore:logWood>],
	[<minecraft:diamond_axe>, <ic2:resource:12>, <minecraft:diamond_axe>], 
	[<minecraft:furnace>, <minecraft:furnace>, <minecraft:furnace>]]);

# Diamond Anvil
	recipes.remove(<cyclicmagic:block_anvil>);
	recipes.addShaped("Diamond Anvil", 
	<cyclicmagic:block_anvil>, 
	[[gemDiamondRat, <ore:plateDenseObsidian>, gemDiamondRat],
	[<ore:dustRedstone>, <actuallyadditions:block_item_repairer>, <ore:dustRedstone>], 
	[<ore:blockIron>, <ore:blockIron>, <ore:blockIron>]]);
	
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
recipes.addShaped(<cyclicmagic:tool_swap>, [[null, <cd4017be_lib:m:402>, <appliedenergistics2:material:10>],[null, <redstonearsenal:material:192>, <cd4017be_lib:m:402>], [<enderio:block_reinforced_obsidian>, null, null]]);
recipes.addShaped(<cyclicmagic:tool_swap_match>, [[null, <cd4017be_lib:m:402>, <randomthings:ingredient:9>],[null, <redstonearsenal:material:192>, <cd4017be_lib:m:402>], [<enderio:block_reinforced_obsidian>, null, null]]);
recipes.addShaped(<cyclicmagic:cyclic_wand_build>, [[null, <cd4017be_lib:m:402>, gemDiamondRat],[null, <redstonearsenal:material:192>, <cd4017be_lib:m:402>], [<ore:blockBone>, null, null]]);


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
	<travelersbackpack:sleeping_bag_bottom>, <ore:leather>]);

# Lower durab of glowes (default is 6000)
<cyclicmagic:glove_climb>.maxDamage = 3000;

# [Void_Charm] from [Slime_Cube][+3]
craft.remake(<cyclicmagic:charm_void>, ["pretty",
  "▲ ◊ ▲",
  "◊ § ◊",
  "▲ ◊ ▲"], {
  "▲": <ore:dustEnderEye>,          # Ender Eye Dust
  "§": <randomthings:slimecube>,    # Slime Cube
  "◊": <ore:gemPearl>,              # Shulker Pearl
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



# Soul stone as T3 crafting ingredient
recipes.remove(<cyclicmagic:soulstone>);
mods.rockytweaks.Anvil.addRecipe(<cyclicmagic:ender_pearl_mounted>, <cyclicmagic:crystallized_obsidian>, <cyclicmagic:soulstone>, 50);


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
  "R": <sonarcore:reinforcedstoneblock>, # Reinforced Stone
  "B": <randomthings:ingredient:13>,     # Blackout Powder
  "H": <animania:block_hamster_wheel>,   # Hamster Wheel
  "L": <rats:little_black_squash_balls>  # Little Black Squash Balls
});

# [Item_Collector] from [Print_Press_Plate][+3]
craft.remake(<cyclicmagic:block_vacuum>, ["pretty",
  "R B R",
  "R P R",
  "R ▲ R"], {
  "P": <bibliocraft:printplate>,         # Print Press Plate
  "R": <sonarcore:reinforcedstoneblock>, # Reinforced Stone
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
  "T": <cd4017be_lib:m:402>, # Telekinetic Alloy
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
  remove: <cyclicmagic:sprout_seed> * 2
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
  remove: <cyclicmagic:crystallized_obsidian>
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
	remove: <cyclicmagic:sprinkler>,
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
craft.remake(<cyclicmagic:charm_air>, ["pretty",
  "B I B",
  "G E G",
  "B I B"], {
  "B": <actuallyadditions:item_misc:15>, # Bat's Wing
  "E": <cyclicmagic:ender_pearl_reuse>.anyDamage(),  # Ender Orb
  "G": <openblocks:generic>,             # Glider Wing
  "I": <twilightforest:ice_bomb>         # Ice Bomb
});


# [Uncrafting_Grinder] from [Conglomerate_Of_Sun][+4]
craft.remake(<cyclicmagic:uncrafting_block>, ["pretty",
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
	remove: <cyclicmagic:corrupted_chorus> * 3
});

# [Glowing_Chorus_Fruit] from [Crystallized_Obsidian_Bucket][+1]
recipes.remove(<cyclicmagic:glowing_chorus> * 8);
mods.inworldcrafting.FluidToItem.transform(<cyclicmagic:glowing_chorus>, <fluid:crystal>, [<cyclicmagic:corrupted_chorus>]);