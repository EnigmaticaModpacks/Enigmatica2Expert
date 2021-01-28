import mods.jei.JEI.removeAndHide as rh;
#modloaded exnihilocreatio

# End Cake
	recipes.remove(<exnihilocreatio:block_end_cake>);
	recipes.addShaped("End Cake", 
	<exnihilocreatio:block_end_cake>, 
	[[<ore:foodCake>, <actuallyadditions:block_misc:8>, <ore:foodCake>],
	[<actuallyadditions:block_misc:8>, <minecraft:end_crystal>, <actuallyadditions:block_misc:8>], 
	[<ore:foodCake>, <actuallyadditions:block_misc:8>, <ore:foodCake>]]);

# Wooden Hammer (conflict with C&B Wrench)
	recipes.remove(<exnihilocreatio:hammer_wood>);
	recipes.addShapedMirrored("ExNihilo Wooden Hammer", 
	<exnihilocreatio:hammer_wood>, 
	[[null, <ore:plankWood>, <ore:stickWood>],
	[null, <ore:stickWood>, <ore:plankWood>], 
	[<ore:stickWood>, null, null]]);

# Stone Barrel
	recipes.remove(<exnihilocreatio:block_barrel1>);
	recipes.addShaped("Stone Barrel", 
	<exnihilocreatio:block_barrel1>, 
	[[<minecraft:stone>, null, <minecraft:stone>],
	[<minecraft:stone>, null, <minecraft:stone>], 
	[<minecraft:stone>, <ore:obsidian>, <minecraft:stone>]]);

# Netherrack -> Crushed Netherrack recipe
	scripts.wrap.thermalexpansion.Pulverizer.addRecipe(<exnihilocreatio:block_netherrack_crushed>, <minecraft:netherrack>, 2000);

# Sand -> Dust
	scripts.wrap.thermalexpansion.Pulverizer.addRecipe(<exnihilocreatio:block_dust>, <minecraft:sand>, 2000);

# Netherrack -> Crushed Netherrack
	scripts.wrap.thermalexpansion.Pulverizer.addRecipe(<exnihilocreatio:block_netherrack_crushed>, <minecraft:netherrack>, 2000);

# End Stone -> Crushed End Stone
	scripts.wrap.thermalexpansion.Pulverizer.addRecipe(<exnihilocreatio:block_endstone_crushed>, <minecraft:end_stone>, 2000);

# Sieve
	recipes.remove(<exnihilocreatio:block_sieve>);
	recipes.addShaped("Ex Nihilo Sieve",
	<exnihilocreatio:block_sieve>, [
	[<ore:plankWood>, null, <ore:plankWood>],
	[<botania:livingrock0slab>, <ore:alloyAdvanced>, <botania:livingrock0slab>],
	[<ore:stickTreatedWood>, null, <ore:stickTreatedWood>]]);

# Heavy Sieves
	recipes.remove(<excompressum:heavy_sieve>);
	recipes.remove(<excompressum:heavy_sieve:1>);
	recipes.remove(<excompressum:heavy_sieve:2>);
	recipes.remove(<excompressum:heavy_sieve:3>);
	recipes.remove(<excompressum:heavy_sieve:4>);
	recipes.remove(<excompressum:heavy_sieve:5>);
	
	recipes.addShaped(<excompressum:heavy_sieve>, [[<minecraft:log>, null, <minecraft:log>],[<minecraft:log>, <exnihilocreatio:block_sieve>, <minecraft:log>], [<ore:stickWood>, null, <ore:stickWood>]]);
	recipes.addShaped(<excompressum:heavy_sieve:1>, [[<minecraft:log:1>, null, <minecraft:log:1>],[<minecraft:log:1>, <exnihilocreatio:block_sieve>, <minecraft:log:1>], [<ore:stickWood>, null, <ore:stickWood>]]);
	recipes.addShaped(<excompressum:heavy_sieve:2>, [[<minecraft:log:2>, null, <minecraft:log:2>],[<minecraft:log:2>, <exnihilocreatio:block_sieve>, <minecraft:log:2>], [<ore:stickWood>, null, <ore:stickWood>]]);
	recipes.addShaped(<excompressum:heavy_sieve:3>, [[<minecraft:log:3>, null, <minecraft:log:3>],[<minecraft:log:3>, <exnihilocreatio:block_sieve>, <minecraft:log:3>], [<ore:stickWood>, null, <ore:stickWood>]]);
	recipes.addShaped(<excompressum:heavy_sieve:4>, [[<minecraft:log2>, null, <minecraft:log2>],[<minecraft:log2>, <exnihilocreatio:block_sieve>, <minecraft:log2>], [<ore:stickWood>, null, <ore:stickWood>]]);
	recipes.addShaped(<excompressum:heavy_sieve:5>, [[<minecraft:log2:1>, null, <minecraft:log2:1>],[<minecraft:log2:1>, <exnihilocreatio:block_sieve>, <minecraft:log2:1>], [<ore:stickWood>, null, <ore:stickWood>]]);
	
# Remove oredict entries
<ore:oreAluminium>.remove(<exnihilocreatio:item_ore_aluminium:1>);

# Ex Nihilo dust conversion to ores
	val orePieces as string[] = [
		"Ardite", "Cobalt", "Nickel", "Silver",
		"Lead", "Aluminium", "Tin", "Copper",
		"Iron", "Gold", "Thorium", "Magnesium",
		"Lithium", "Boron", "Uranium", "Osmium"
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
	rh(<excompressum:uncompressed_coal>);

# Duplicate compressed blocks
	rh(<excompressum:compressed_block:2>);
	rh(<excompressum:compressed_block:3>);
	rh(<excompressum:compressed_block:4>);
	rh(<excompressum:compressed_block:1>);
	rh(<excompressum:compressed_block:9>);
	
# Crucibles
	rh(<excompressum:wooden_crucible>);
	rh(<excompressum:wooden_crucible:1>);
	rh(<excompressum:wooden_crucible:2>);
	rh(<excompressum:wooden_crucible:3>);
	rh(<excompressum:wooden_crucible:4>);
	rh(<excompressum:wooden_crucible:5>);
	
	rh(<exnihilocreatio:block_crucible>);
	rh(<exnihilocreatio:block_crucible_wood>);
	rh(<exnihilocreatio:block_crucible:1>);
	
# Ex Nihilo Dusts
	rh(<exnihilocreatio:item_ore_gold:2>);
	rh(<exnihilocreatio:item_ore_iron:2>);
	rh(<exnihilocreatio:item_ore_copper:2>);
	rh(<exnihilocreatio:item_ore_tin:2>);
	rh(<exnihilocreatio:item_ore_aluminium:2>);
	rh(<exnihilocreatio:item_ore_lead:2>);
	rh(<exnihilocreatio:item_ore_silver:2>);
	rh(<exnihilocreatio:item_ore_nickel:2>);

# Remove excess mesh
	rh(<excompressum:iron_mesh>);
	

# Remove Sieves (defined in CompactMachines)
recipes.remove(<exnihilocreatio:item_mesh:2>);
recipes.remove(<exnihilocreatio:item_mesh:3>);
recipes.remove(<exnihilocreatio:item_mesh:4>);

# Compressed Contenttweaker blocks
utils.compact(<exnihilocreatio:block_andesite_crushed>, <contenttweaker:compressed_crushed_andesite>);
utils.compact(<exnihilocreatio:block_diorite_crushed> , <contenttweaker:compressed_crushed_diorite>);
utils.compact(<exnihilocreatio:block_skystone_crushed>, <contenttweaker:compressed_crushed_skystone>);
utils.compact(<exnihilocreatio:block_granite_crushed> , <contenttweaker:compressed_crushed_granite>);

# [Artificial_Hive] from [Hay_Bale][+1]
craft.remake(<exnihilocreatio:hive>, ["pretty",
  "B B B",
  "b H b",
  "B B B"], {
  B: <ore:itemBeeswax>,    # Beeswax
  H: <minecraft:hay_block>,# Hay Bale
	b: <rustic:bee>
});