import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.item.WeightedItemStack;
#modloaded biomesoplenty

# Poison bucket recipe fix (bucket could be duped)
	recipes.remove(Bucket("poison"));
	recipes.addShapeless("biomesoplenty_forge_bucketfilled_poison_dupefix", Bucket("poison"), 
	[<minecraft:water_bucket>.noReturn(), <minecraft:spider_eye:*>, <minecraft:poisonous_potato:*>, <minecraft:sugar:*>]);

# Terrestrial Artifact
	<biomesoplenty:terrestrial_artifact>.maxStackSize = 64;

# Honey
	recipes.addShapeless(<biomesoplenty:honey_block> * 3, [<biomesoplenty:hive:3>, <biomesoplenty:hive:3>, <biomesoplenty:hive:3>, <biomesoplenty:hive:3>, <biomesoplenty:hive:3>, <biomesoplenty:hive:3>, <biomesoplenty:hive:3>, <biomesoplenty:hive:3>, <biomesoplenty:hive:3>]);
	recipes.addShapeless(<biomesoplenty:hive:3>, [<biomesoplenty:hive:1>, <biomesoplenty:filled_honeycomb>]);
	recipes.addShapeless(<biomesoplenty:hive:1>, [<biomesoplenty:hive:2>, <biomesoplenty:filled_honeycomb>]);
	
# "Meat"
	var rawMeat = [
		(<harvestcraft:turkeyrawitem>) % 5,
		(<minecraft:mutton> % 10),
		(<minecraft:rabbit> % 5),
		(<minecraft:chicken> % 10),
		(<minecraft:porkchop> % 10),
		(<minecraft:beef> % 10),
		<harvestcraft:venisonrawitem> % 5,
		<harvestcraft:duckrawitem> % 5,
		<rats:raw_rat> % 5,
	] as WeightedItemStack[];
	scripts.wrap.forestry.Centrifuge.addRecipe(rawMeat, <biomesoplenty:flesh>, 100);
	scripts.wrap.thermalexpansion.Centrifuge.addRecipe([rawMeat[0], rawMeat[1], rawMeat[2], rawMeat[3]
		] as WeightedItemStack[],<biomesoplenty:flesh>, null, 2000);

# Honey Block -> Honey Drop
	scripts.wrap.forestry.Centrifuge.addRecipe([(<forestry:honey_drop> * 5) % 80, (<thermalfoundation:material:99> % 25), (<thermalfoundation:material:100> % 25)], <biomesoplenty:honey_block>, 100);
	scripts.wrap.thermalexpansion.Centrifuge.addRecipe([(<forestry:honey_drop>) * 5 % 80, <thermalfoundation:material:99> % 25, <thermalfoundation:material:100> % 25], <biomesoplenty:honey_block>, null, 2000);

# Ender Amethyst
	recipes.addShaped("Ender Amethyst", 
	<biomesoplenty:gem>, 
	[[<ore:ingotElvenElementium>, <ore:ingotElvenElementium>, <ore:ingotElvenElementium>],
	[<ore:ingotElvenElementium>, <biomesoplenty:terrestrial_artifact>, <ore:ingotElvenElementium>], 
	[<ore:ingotElvenElementium>, <ore:ingotElvenElementium>, <ore:ingotElvenElementium>]]);

# [Terrestrial Artifact] from [Empowered Palis Crystal][+6]
craft.remake(<biomesoplenty:terrestrial_artifact>, ["pretty",
  "S S S",
  "p * o",
  "E ☼ m"], {
  "S": <actuallyadditions:item_solidified_experience>, # Solidified Experience
  "p": <actuallyadditions:item_crystal_empowered>,     # Empowered Restonia Crystal
  "E": <actuallyadditions:item_crystal_empowered:3>,   # Empowered Void Crystal
  "*": <actuallyadditions:item_crystal_empowered:1>,   # Empowered Palis Crystal
  "☼": <actuallyadditions:item_crystal_empowered:4>,   # Empowered Emeradic Crystal
  "m": <actuallyadditions:item_crystal_empowered:5>,   # Empowered Enori Crystal
  "o": <actuallyadditions:item_crystal_empowered:2>,   # Empowered Diamatine Crystal
});

# [Terrestrial Artifact Block] from [Empowered Palis Crystal Block][+6]
craft.remake(<contenttweaker:terrestrial_artifact_block>, ["pretty",
  "S S S",
  "◘ ◙ *",
  "■ □ ☼"], {
  "S": <actuallyadditions:item_solidified_experience>, # Solidified Experience
  "■": <actuallyadditions:block_crystal_empowered:3>,  # Empowered Void Crystal Block
  "□": <actuallyadditions:block_crystal_empowered:4>,  # Empowered Emeradic Crystal Block
  "◘": <actuallyadditions:block_crystal_empowered>,    # Empowered Restonia Crystal Block
  "◙": <actuallyadditions:block_crystal_empowered:1>,  # Empowered Palis Crystal Block
  "*": <actuallyadditions:block_crystal_empowered:2>,  # Empowered Diamatine Crystal Block
  "☼": <actuallyadditions:block_crystal_empowered:5>,  # Empowered Enori Crystal Block
});

# BoP Grass, Dirt, and Netherrack.
	recipes.addShaped("BoP Mycelial Netherrack", <biomesoplenty:grass:8> * 8, [[<ore:netherrack>, <ore:netherrack>, <ore:netherrack>],[<ore:netherrack>, <minecraft:mycelium>, <ore:netherrack>], [<ore:netherrack>, <ore:netherrack>, <ore:netherrack>]]);
	recipes.addShaped("BoP Flowering Grass", <biomesoplenty:grass:7> * 8, [[<minecraft:double_plant:*>, <ore:grass>, <minecraft:double_plant:*>],[<ore:grass>, <minecraft:red_flower:8>, <ore:grass>], [<minecraft:double_plant:*>, <ore:grass>, <minecraft:double_plant:*>]]);
	recipes.addShaped("BoP Overgrown Netherrack", <biomesoplenty:grass:6> * 8, [[<ore:netherrack>, <ore:netherrack>, <ore:netherrack>],[<ore:netherrack>, <ore:vine>, <ore:netherrack>], [<ore:netherrack>, <ore:netherrack>, <ore:netherrack>]]);
	recipes.addShaped("BoP Origin Grass", <biomesoplenty:grass:5> * 16, [[<ore:sand>, <ore:grass>, <ore:sand>],[<biomesoplenty:sapling_1>, <biomesoplenty:sapling_1>, <biomesoplenty:sapling_1>], [<ore:sand>, <ore:grass>, <ore:sand>]]);
	recipes.addShaped("BoP Silty Grass", <biomesoplenty:grass:4> * 8, [[<ore:sand>, <ore:grass>, <ore:sand>],[<ore:gravel>, <ore:dirt>, <ore:gravel>], [<ore:sand>, <ore:grass>, <ore:sand>]]);
	recipes.addShaped("BoP Sandy Grass", <biomesoplenty:grass:3> * 8, [[<ore:sand>, <ore:grass>, <ore:sand>],[<ore:grass>, <ore:dirt>, <ore:grass>], [<ore:sand>, <ore:grass>, <ore:sand>]]);
	recipes.addShaped("BoP Loamy Grass", <biomesoplenty:grass:2> * 8, [[<ore:grass>, <ore:grass>, <ore:grass>],[<ore:grass>, <ore:listAllwater>, <ore:grass>], [<ore:grass>, <ore:grass>, <ore:grass>]]);
	recipes.addShaped("BoP Silty Dirt", <biomesoplenty:dirt:2> * 8, [[<ore:sand>, <ore:dirt>, <ore:sand>],[<ore:gravel>, <ore:dirt>, <ore:gravel>], [<ore:sand>, <ore:dirt>, <ore:sand>]]);
	recipes.addShaped("BoP Sandy Dirt", <biomesoplenty:dirt:1> * 8, [[<ore:sand>, <ore:dirt>, <ore:sand>],[<ore:dirt>, <ore:dirt>, <ore:dirt>], [<ore:sand>, <ore:dirt>, <ore:sand>]]);
	recipes.addShaped("BoP Loamy Dirt", <biomesoplenty:dirt> * 8, [[<ore:dirt>, <ore:dirt>, <ore:dirt>],[<ore:dirt>, <ore:listAllwater>, <ore:dirt>], [<ore:dirt>, <ore:dirt>, <ore:dirt>]]);

# BoP Overgrown stone
	recipes.addShapeless("Overgrown Stone1", <biomesoplenty:grass:1>, [<minecraft:stone:*>, <minecraft:tallgrass:1>]);
	recipes.addShapeless("Overgrown Stone2", <biomesoplenty:grass:1>, [<minecraft:stone:*>, <ore:grass>]);
	recipes.addShapeless("Overgrown Stone3", <biomesoplenty:grass:1>, [<minecraft:stone:*>, <ore:vine>]);

	
# Amber Block
	utils.rh(<biomesoplenty:gem_block:7>);
	
# Terrestrial Artifact block
craft.shapeless(<contenttweaker:terrestrial_artifact_block>, "AAAAAAAAA", {A: <biomesoplenty:terrestrial_artifact>});
craft.shapeless(<biomesoplenty:terrestrial_artifact> * 9,   "A", {A: <contenttweaker:terrestrial_artifact_block>});

# To easy manage in inventory
<biomesoplenty:jar_filled:1>.maxStackSize = 64;

# Squeeze harming potion from Bramble
scripts.process.squeeze(
	[<biomesoplenty:bramble_plant>],
	<fluid:potion>.withTag({Potion: "minecraft:harming"}) * 150,
	"except: CrushingTub Squeezer MechanicalSqueezer TECentrifuge",
	null
);

# Make Crystal block harder to match its mining level
<biomesoplenty:crystal>.hardness = 50;

# Skyblock alts Hellbark Sapling and lava squeezing
scripts.wrap.inworldcrafting.FireCrafting.addRecipe(<biomesoplenty:sapling_1:4>, <ore:treeSapling>, 30);
scripts.process.squeeze([<biomesoplenty:log_2:7>], <liquid:lava> * 480, "only: Squeezer MechanicalSqueezer", null);
scripts.process.squeeze([<biomesoplenty:planks_0:11>], <liquid:lava> * 240, "only: Squeezer MechanicalSqueezer", null);
scripts.process.squeeze([<biomesoplenty:leaves_3:8>], <liquid:lava> * 240, "only: Squeezer MechanicalSqueezer", null);