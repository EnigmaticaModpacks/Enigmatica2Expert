import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.item.IIngredient;

#modloaded randomthings

# OpenBlocks Scaffolding / Random Things Block of Sticks
	recipes.remove(<randomthings:blockofsticks>);
	recipes.addShaped("Random Things Block of Sticks", 
	<randomthings:blockofsticks> * 8, 
	[[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>],
	[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>], 
	[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>]]);

# Ender bucket recipe change
recipes.remove(<randomthings:enderbucket>);
recipes.addShaped("ender_bucket1",
	<randomthings:enderbucket>,
	[[<minecraft:ender_pearl>],
	[<minecraft:bucket>]]);
recipes.addShaped("ender_bucket2",
	<randomthings:enderbucket>,
	[[<ore:plateIron>, <minecraft:ender_pearl>, <ore:plateIron>],
	[null, <ore:plateIron>, null]]);

# Precious emerald from emerald in blueslime
scripts.wrap.inworldcrafting.FluidToItem.transform(<randomthings:ingredient:9> * 2, <fluid:blueslime>, [<ore:oreEmerald>]);

# Floo dust
remakeEx(<randomthings:ingredient:7>*8, [
	[<ore:enderpearl>, <ore:alloyBasic>, null], 
	[<ore:gunpowder>, <ore:cropBean>, null]
]);
recipes.addShaped("Floo Dust 64", <randomthings:ingredient:7>*64, [
	[<appliedenergistics2:material:46>, <ore:alloyBasic>, null], 
	[<ore:gunpowder>, <ore:cropBean>, null]
]);

# Lubricient
craft.reshapeless(<randomthings:ingredient:6> * 4, 'ABC', {
	A: <minecraft:wheat_seeds>,
	B: <minecraft:potion>.withTag({Potion: "minecraft:water"}),
	C: <ore:cropBean>,
	});

# Time in bottle
remake("randomthings_timeinabottle", <randomthings:timeinabottle>, [
	[null, <animania:milk_bottle>, null], 
	[<randomthings:ingredient:13>, <minecraft:clock>, <randomthings:ingredient:13>], 
	[<animania:milk_bottle>, <extrautils2:klein>, <animania:milk_bottle>]
]);

# Illuminator
recipes.remove(<randomthings:spectreilluminator>);
recipes.addShaped(<randomthings:spectreilluminator>, [
	[null, <randomthings:ingredient:2>, null],
	[<randomthings:ingredient:2>, <extrautils2:suncrystal>, <randomthings:ingredient:2>],
	[null, <randomthings:ingredient:2>, null]]);

# Spectre Key
val ectoplasm = <randomthings:ingredient:2>;
recipes.remove(<randomthings:spectrekey>);
scripts.wrap.actuallyadditions.Empowerer.addRecipe(<randomthings:spectrekey>, 
	<storagedrawers:shroud_key>, ectoplasm, ectoplasm, ectoplasm, ectoplasm,
	25000, 100, [1.0, 0.0, 0.0]);
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<randomthings:spectrekey>, 100000, 1000000, 
	<storagedrawers:shroud_key>, [ectoplasm, ectoplasm, ectoplasm, ectoplasm]);

# Spectre Anchor
recipes.removeShaped(<randomthings:spectreanchor>);
recipes.addShaped(<randomthings:spectreanchor>, [
	[<randomthings:ingredient:2>],
	[<tombmanygraves:death_list>],
	[<randomthings:rezstone>]]);

# Spectre Ingot
recipes.remove(<randomthings:ingredient:3>);
scripts.process.alloy([
	<ore:ingotUnstable>,
	<randomthings:ingredient:2>,
	<thermalfoundation:material:134>
	] as IItemStack[], <randomthings:ingredient:3>, "No exceptions");
mods.rt.RandomThingsTweaker.addImbuingRecipe(
	<thermalfoundation:material:134>, 
	<extrautils2:unstableingots>, 
	<forestry:phosphor>, 
	<randomthings:ingredient:2>, 
	<randomthings:ingredient:3>
);


# Spectre Charger Tier 1
recipes.remove(<randomthings:spectrecharger>);
recipes.addShaped(<randomthings:spectrecharger>, [
	[<deepmoblearning:soot_covered_plate>, <enderio:block_electric_light>, <deepmoblearning:soot_covered_plate>],
	[<randomthings:ingredient:3>, <extrautils2:powertransmitter>, <randomthings:ingredient:3>]]);

# Spectre Charger Tier 2
recipes.remove(<randomthings:spectrecharger:1>);
recipes.addShaped(<randomthings:spectrecharger:1>, [
	[<deepmoblearning:soot_covered_plate>, <randomthings:spectrecharger>, <deepmoblearning:soot_covered_plate>],
	[<ore:ingotRedstoneAlloy>, <randomthings:spectrecharger>, <ore:ingotRedstoneAlloy>]]);

# Spectre Charger Tier 3
recipes.remove(<randomthings:spectrecharger:2>);
recipes.addShaped(<randomthings:spectrecharger:2>, [
	[<deepmoblearning:soot_covered_plate>, <randomthings:spectrecharger:1>, <deepmoblearning:soot_covered_plate>],
	[<ore:itemEnderCrystalPowder>, <randomthings:spectrecharger:1>, <ore:itemEnderCrystalPowder>]]);

# Make saplings with MA essence
recipes.addShaped("Spectre Saplings", <randomthings:spectresapling> * 10, [
	[null, <mysticalagriculture:nature_essence>, null],
	[<mysticalagriculture:wood_essence>, <randomthings:ingredient:2>, <mysticalagriculture:wood_essence>],
	[null, <mysticalagriculture:nature_essence>, null]]);

# Oxygen bottle
scripts.wrap.thermalexpansion.Transposer.addFillRecipe(<randomthings:bottleofair>, <minecraft:glass_bottle>, <liquid:oxygen> * 1000, 25000);

# Lesser Magic Bean
craft.remake(<randomthings:beans:1>, ["pretty",
	"x x x",
	"x O x",
	"x x x"], {
	x: <ore:blockGold>,
	O: <ore:cropBean>,
});

# Player Interface (used Nether Star)
craft.remake(<randomthings:playerinterface>, ["pretty",
	"B A B",
	"B O B",
	"B C B"], {
	A: <cyclicmagic:ender_eye_orb>,
	C: <randomthings:ingredient:9>,
	O: <enderstorage:ender_storage>,
	B: <fluxnetworks:flux>,
});

# Imbuer
craft.remake(<randomthings:imbuingstation>, ["pretty",
	"A B A",
	"C D C",
	"A E A"], {
	A: <forestry:wood_pile>,
	B: <minecraft:water_bucket>,
	C: <ore:dustHydratedCoal>,
	D: <tconstruct:materials:18>,
	E: <rats:raw_plastic>,
});


# Blood stone from moon stone
scripts.wrap.inworldcrafting.FluidToItem.transform(<randomthings:rezstone>, <fluid:blood>, [<extrautils2:ingredients:5>]);
<randomthings:rezstone>.maxStackSize = 64;

# [Blackout_Powder*4] from [Bio_Coal][+2]
craft.reshapeless(<randomthings:ingredient:13>, "F☺▲", {
  "▲": <ore:dustAsh>,                   # Ash
  "F": <fluxnetworks:flux>,             # Flux
  "☺": <actuallyadditions:item_misc:22>, # Bio Coal
  remove: <randomthings:ingredient:13> * 4
});

# [Slime_Cube] from [Mending_Moss][+2]
craft.remake(<randomthings:slimecube>, ["pretty",
  "s R s",
  "R M R",
  "s R s"], {
  "R": <rats:rat_diamond>,       # Rat Diamond
  "s": <ore:slimecrystalGreen>,  # Green Slime Crystal
  "M": <tconstruct:materials:19> # Mending Moss
});

# [Peace_Candle] from [Crystallized_Amber][+2]
craft.remake(<randomthings:peacecandle>, ["pretty",
  "  ☼  ",
  "☺ C ☺",
  "  ☺  "], {
  "C": <cyclicmagic:crystallized_amber>,      # Crystallized Amber
  "☺": <contenttweaker:conglomerate_of_coal>, # Conglomerate Of Coal
  "☼": <extrautils2:suncrystal>               # Sun Crystal
});

# [Fertilized_Dirt*2] from [Slop_Bucket][+3]
craft.remake(<randomthings:fertilizeddirt> * 8, ["pretty",
  "  i  ",
  "d ~ d",
  "  R  "], {
  "R": <minecraft:rotten_flesh>, # Rotten Flesh
  "d": <ore:fertilizer>,
  "i": <ore:dirt>,
  "~": Bucket("slop"), # Slop Bucket
  remove: <randomthings:fertilizeddirt> * 2
});



var weatherIngrs = {
  "a": <ore:feather>,               # Feather
  "B": <ore:itemBeeswax>,           # Beeswax
  "C": <forestry:pollen:1>,         # Crystalline Pollen Cluster
  "f": <minecraft:double_plant>,    # Poppy
  "l": <randomthings:ingredient:13>,# Blackout Powder
  "e": <ore:animaniaEggs>,
} as IIngredient[string];

# [Weather_Egg_<Sun>*2] from [Egg][+3]
craft.remake(<randomthings:weatheregg> * 2, ["pretty",
  "B f B",
  "l e l",
  "B f B"], weatherIngrs
);

# [Weather_Egg_<Rain>*2] from [Egg][+3]
craft.remake(<randomthings:weatheregg:1> * 2, ["pretty",
  "B C B",
  "l e l",
  "B C B"], weatherIngrs
);

# [Weather_Egg_<Storm>*2] from [Egg][+3]
craft.remake(<randomthings:weatheregg:2> * 2, ["pretty",
  "B a B",
  "l e l",
  "B a B"], weatherIngrs
);

# Spectre string harder
recipes.remove(<randomthings:ingredient:12>);
scripts.wrap.inworldcrafting.FluidToItem.transform(<randomthings:ingredient:12> * 4, <fluid:liquid_sunshine>, [
	<forestry:phosphor>,
	<randomthings:ingredient:2>,
	<mysticalagriculture:crafting:23>,
]);


var spectreIngrs = {
  "♥": <randomthings:spectrecoil_redstone>,   # Redstone Spectre Coil
  "p": <randomthings:spectrecoil_normal>,     # Spectre Coil
  "□": <ore:fusedQuartz>,
  "e": <ore:eyeofredstone>,                   # Eye of Redstone
  "E": <ore:pearlEnderEye>,                   # Eye of Ender
  "I": <twilightforest:ice_bomb>,             # Ice Bomb
  "▬": <randomthings:ingredient:3>,           # Spectre Ingot
  "o": <cyclicmagic:soulstone>,               # Soulstone
  "P": <forestry:crafting_material:1>,        # Pulsating Mesh
  "S": <randomthings:ingredient:12>,          # Spectre String
  "i": <contenttweaker:conglomerate_of_coal>,
  "l": <contenttweaker:conglomerate_of_life>,
  "t": <contenttweaker:conglomerate_of_sun>,
  "C": <cyclicmagic:crystallized_obsidian>, # Crystallized Obsidian
} as IIngredient[string];

# [Spectre_Coil] from [Ice_Bomb][+4]
craft.remake(<randomthings:spectrecoil_normal>, ["pretty",
  "S ▬ S",
  "P I P",
  "S i S"], spectreIngrs
);

# [Redstone_Spectre_Coil] from [Spectre_Coil][+4]
craft.remake(<randomthings:spectrecoil_redstone>, ["pretty",
  "S ▬ S",
  "e p e",
  "S l S"], spectreIngrs
);

# [Ender_Spectre_Coil] from [Redstone_Spectre_Coil][+4]
craft.remake(<randomthings:spectrecoil_ender>, ["pretty",
  "S ▬ S",
  "E ♥ E",
  "S t S"], spectreIngrs
);

# [Spectre_Lens] from [Hardened_Copper_Glass][+2]
craft.remake(<randomthings:spectrelens>, ["S□S", "▬▬▬"], spectreIngrs);

# [Spectre_Energy_Injector] from [Soulstone][+3]
craft.remake(<randomthings:spectreenergyinjector>, ["pretty",
  "□ □ □",
  "□ o □",
  "▬ p ▬"], spectreIngrs
);

# ----------------------------
# Tools
# ----------------------------
utils.rh(<randomthings:spectrepickaxe>);
utils.rh(<randomthings:spectreaxe>);
utils.rh(<randomthings:spectreshovel>);
utils.rh(<randomthings:spectresword>);


# ----------------------------

# [Nature_Core] from [Soulstone][+2]
craft.make(<randomthings:naturecore>, ["pretty",
  "# § #",
  "§ S §",
  "# § #"], {
  "#": <forestry:logs.1:3> | <forestry:logs.6>, # Any sequoia
  "S": <cyclicmagic:soulstone>, # Soulstone
  "§": <randomthings:slimecube> # Slime Cube
});

# Cheaper (used ender pearl)
# [Returning_Block_of_Sticks*8] from [Floo_Powder][+1]
craft.remake(<randomthings:blockofsticks:1> * 8, ["pretty",
  "□ □ □",
  "□ F □",
  "□ □ □"], {
  "□": <randomthings:blockofsticks>, # Block of Sticks
  "F": <randomthings:ingredient:7>   # Floo Powder
});

# [Eclipsed_Clock] from [Spectre_Illuminator][+2]
craft.remake(<randomthings:eclipsedclock>, ["pretty",
  "B O B",
  "O S O",
  "B O B"], {
  "B": <randomthings:ingredient:13>,      # Blackout Powder
  "S": <randomthings:spectreilluminator>, # Spectre Illuminator
  "O": <bibliocraft:clock:*>              # Oak Clock
});

# Remove all default imbue recipes
mods.rt.RandomThingsTweaker.removeAllImbuingRecipes();

# Remake imbues, make them way cheaper
mods.rt.RandomThingsTweaker.addImbuingRecipe(
	<actuallyadditions:item_misc:11>,
	<tconstruct:edible:4>,
	<actuallyadditions:item_misc:10>,
	<minecraft:potion>.withTag({Potion: "minecraft:water"}),
	<randomthings:imbue>
);
mods.rt.RandomThingsTweaker.addImbuingRecipe(
	<minecraft:red_mushroom>,
	<minecraft:potato>,
	<minecraft:brown_mushroom>,
	<minecraft:potion>.withTag({Potion: "minecraft:water"}),
	<randomthings:imbue:1>
);
mods.rt.RandomThingsTweaker.addImbuingRecipe(
	<harvestcraft:beanitem>,
	<minecraft:dye:4>,
	<minecraft:glowstone_dust>,
	<minecraft:potion>.withTag({Potion: "minecraft:water"}),
	<randomthings:imbue:2>
);
mods.rt.RandomThingsTweaker.addImbuingRecipe(
	<minecraft:netherbrick>,
	<iceandfire:wither_shard>,
	<minecraft:soul_sand>,
	<minecraft:potion>.withTag({Potion: "minecraft:water"}),
	<randomthings:imbue:3>
);