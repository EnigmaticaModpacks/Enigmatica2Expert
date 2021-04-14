import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
#modloaded exnihilocreatio

# End Cake
	recipes.remove(<exnihilocreatio:block_end_cake>);
	recipes.addShaped("End Cake", 
	<exnihilocreatio:block_end_cake>, 
	[[<ore:foodCake>, <actuallyadditions:block_misc:8>, <ore:foodCake>],
	[<actuallyadditions:block_misc:8>, <minecraft:end_crystal>, <actuallyadditions:block_misc:8>], 
	[<ore:foodCake>, <actuallyadditions:block_misc:8>, <ore:foodCake>]]);

# Stone Barrel
	recipes.remove(<exnihilocreatio:block_barrel1>);
	recipes.addShaped("Stone Barrel", 
	<exnihilocreatio:block_barrel1>, 
	[[<minecraft:stone>, null, <minecraft:stone>],
	[<minecraft:stone>, null, <minecraft:stone>], 
	[<minecraft:stone>, <ore:obsidian>, <minecraft:stone>]]);

# Normal -> Crushed -> Compressed -> Crushed Compressed
val crushingInMachines = [
	[<minecraft:netherrack>               , <exnihilocreatio:block_netherrack_crushed>],
	[<minecraft:sand>                     , <exnihilocreatio:block_dust>              ],
	[<minecraft:netherrack>               , <exnihilocreatio:block_netherrack_crushed>],
	[<minecraft:end_stone>                , <exnihilocreatio:block_endstone_crushed>  ],
	[<minecraft:stone:5>                  , <exnihilocreatio:block_andesite_crushed>, <contenttweaker:compressed_andesite>, <contenttweaker:compressed_crushed_andesite>, <biomesoplenty:dried_sand>],
	[<minecraft:stone:3>                  , <exnihilocreatio:block_diorite_crushed> , <contenttweaker:compressed_diorite>,  <contenttweaker:compressed_crushed_diorite> , <biomesoplenty:white_sand>],
	[<minecraft:stone:1>                  , <exnihilocreatio:block_granite_crushed> , <contenttweaker:compressed_granite>,  <contenttweaker:compressed_crushed_granite> , <minecraft:sand:1>],
	[<appliedenergistics2:sky_stone_block>, <exnihilocreatio:block_skystone_crushed>, <contenttweaker:compressed_skystone>, <contenttweaker:compressed_crushed_skystone>],
] as IItemStack[][];
for i, inputArr in crushingInMachines {
	val normal     = inputArr[0];
	val crushed    = inputArr[1];
	scripts.wrap.thermalexpansion.Pulverizer.addRecipe(crushed, normal, 2000);

	if(inputArr.length > 2) {
		val compressed = inputArr[2];
		val crushComps = inputArr[3];
		utils.compact(normal, compressed);
		utils.compact(crushed, crushComps);
		scripts.process.crush(compressed, crushed * 9, "only: SagMill", null, null);

		if(inputArr.length > 4) {
			scripts.process.crush(compressed, inputArr[4], "only: SagMill Pulverizer", null, null);
		}
	}
}

# Sieve
	recipes.remove(<exnihilocreatio:block_sieve>);
	recipes.addShaped("Ex Nihilo Sieve",
	<exnihilocreatio:block_sieve>, [
	[<ore:plankWood>, null, <ore:plankWood>],
	[<botania:livingrock0slab>, <ore:alloyAdvanced>, <botania:livingrock0slab>],
	[<ore:stickTreatedWood>, null, <ore:stickTreatedWood>]]);

# Remove oredict entries
<ore:oreAluminium>.remove(<exnihilocreatio:item_ore_aluminium:1>);

# Ex Nihilo dust conversion to ores
	val orePieces as string[] = [
		"Ardite" , "Cobalt"   , "Nickel" , "Silver"   ,
		"Lead"   , "Aluminium", "Tin"    , "Copper"   ,
		"Iron"   , "Gold"     , "Thorium", "Magnesium",
		"Lithium", "Boron"    , "Uranium", "Osmium"
	] as string[];

	for i in 0 to orePieces.length {
		val name = orePieces[i];
		val oreBlock = oreDict.get("ore" ~ name);
		val p = oreDict.get("piece" ~ name);

		if (!isNull(oreBlock) && !isNull(p)) {
			recipes.addShapeless("Ex Nihilo " ~ name ~ " x4", oreBlock.firstItem, [p, p, p, p]);
			recipes.addShapeless("Ex Nihilo " ~ name ~ " x8", oreBlock.firstItem * 2, [p, p, p, p, p, p, p, p]);
		}
	}

# *======= Remove & Hide =======*

# Uncompressed Coal
	utils.rh(<excompressum:uncompressed_coal>);

# Duplicate compressed blocks
	utils.rh(<excompressum:compressed_block:2>);
	utils.rh(<excompressum:compressed_block:3>);
	utils.rh(<excompressum:compressed_block:4>);
	utils.rh(<excompressum:compressed_block:1>);
	utils.rh(<excompressum:compressed_block:9>);
	
# Crucibles
	utils.rh(<excompressum:wooden_crucible>);
	utils.rh(<excompressum:wooden_crucible:1>);
	utils.rh(<excompressum:wooden_crucible:2>);
	utils.rh(<excompressum:wooden_crucible:3>);
	utils.rh(<excompressum:wooden_crucible:4>);
	utils.rh(<excompressum:wooden_crucible:5>);
	
	utils.rh(<exnihilocreatio:block_crucible>);
	utils.rh(<exnihilocreatio:block_crucible_wood>);
	utils.rh(<exnihilocreatio:block_crucible:1>);
	
# Ex Nihilo Dusts
	utils.rh(<exnihilocreatio:item_ore_gold:2>);
	utils.rh(<exnihilocreatio:item_ore_iron:2>);
	utils.rh(<exnihilocreatio:item_ore_copper:2>);
	utils.rh(<exnihilocreatio:item_ore_tin:2>);
	utils.rh(<exnihilocreatio:item_ore_aluminium:2>);
	utils.rh(<exnihilocreatio:item_ore_lead:2>);
	utils.rh(<exnihilocreatio:item_ore_silver:2>);
	utils.rh(<exnihilocreatio:item_ore_nickel:2>);

# Remove excess mesh
	utils.rh(<excompressum:iron_mesh>);
	

# Remove Sieves (defined in CompactMachines)
recipes.remove(<exnihilocreatio:item_mesh:2>);
recipes.remove(<exnihilocreatio:item_mesh:3>);
recipes.remove(<exnihilocreatio:item_mesh:4>);

# [Artificial_Hive] from [Hay_Bale][+1]
craft.remake(<exnihilocreatio:hive>, ["pretty",
  "B B B",
  "b H b",
  "B B B"], {
  B: <ore:itemBeeswax>,    # Beeswax
  H: <minecraft:hay_block>,# Hay Bale
	b: <rustic:bee>
});

// Remove Burn Time to prevent confusing in JEI categories
furnace.setFuel(<exnihilocreatio:hive:1>, 0);

#-------------------------------------------------------------------------
# Remake heavy sieves
#-------------------------------------------------------------------------
val heavySieveIngrs = {
	<excompressum:heavy_sieve:0> : <minecraft:log>,
	<excompressum:heavy_sieve:1> : <minecraft:log:1>,
	<excompressum:heavy_sieve:2> : <minecraft:log:2>,
	<excompressum:heavy_sieve:3> : <minecraft:log:3>,
	<excompressum:heavy_sieve:4> : <minecraft:log2>,
	<excompressum:heavy_sieve:5> : <minecraft:log2:1>,
} as IIngredient[IItemStack];

for out, inp in heavySieveIngrs {
	# [Heavy Birch Sieve] from [Sieve][+3]
	craft.remake(out, ["pretty",
		"  ¤  ",
		"▬ S ▬",
		"#   #"], {
		"#": inp,
		"S": <exnihilocreatio:block_sieve>, # Sieve
		"¤": <ore:gearMithril>,             # Mana Infused Gear
		"▬": <ore:ingotHeavy>,              # Heavy Ingot
	});
}
#-------------------------------------------------------------------------

# [Auto Sieve] from [Sieve][+4]
craft.remake(<excompressum:auto_sieve>, ["pretty",
  "  A  ",
  "□ S □",
  "◊ ■ ◊"], {
  "■": <libvulpes:enhancedmotor>,         # Enhanced Motor
  "□": <ore:plateTitaniumIridium>,        # Titanium Iridium Alloy Plate
  "A": <exnihilocreatio:item_material:3>, # Ancient Spores
  "S": <exnihilocreatio:block_sieve>,     # Sieve
  "◊": <ore:gemTanzanite>,                # Tanzanite
});

# [Mana Sieve] from [Sieve][+4]
craft.remake(<excompressum:mana_sieve>, ["pretty",
  "  A  ",
  "◊ S ◊",
  "■ ▄ ■"], {
  "■": <botania:storage>,                 # Block of Manasteel
  "A": <exnihilocreatio:item_material:3>, # Ancient Spores
  "S": <exnihilocreatio:block_sieve>,     # Sieve
  "▄": <libvulpes:advancedmotor>,         # Advanced Motor
  "◊": <ore:gemTanzanite>,                # Tanzanite
});

# [Auto Heavy Sieve] from [Heavy Birch Sieve][+4]
craft.remake(<excompressum:auto_heavy_sieve>, ["pretty",
  "  A  ",
  "T H T",
  "■ ▄ ■"], {
  "■": <ore:blockTanzanite>,              # Block of Tanzanite
  "A": <exnihilocreatio:item_material:3>, # Ancient Spores
  "T": <ore:sheetTitaniumIridium>,        # Titanium Iridium Alloy Sheet
  "▄": <libvulpes:elitemotor>,            # Elite Motor
  "H": <excompressum:heavy_sieve:*>,      # Heavy Birch Sieve
});