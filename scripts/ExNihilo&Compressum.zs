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
	mods.thermalexpansion.Pulverizer.addRecipe(<exnihilocreatio:block_netherrack_crushed>, <minecraft:netherrack>, 2000);

# Sand -> Dust
	mods.thermalexpansion.Pulverizer.addRecipe(<exnihilocreatio:block_dust>, <minecraft:sand>, 2000);

# Netherrack -> Crushed Netherrack
	mods.thermalexpansion.Pulverizer.addRecipe(<exnihilocreatio:block_netherrack_crushed>, <minecraft:netherrack>, 2000);

# End Stone -> Crushed End Stone
	mods.thermalexpansion.Pulverizer.addRecipe(<exnihilocreatio:block_endstone_crushed>, <minecraft:end_stone>, 2000);

# Sieve
	recipes.remove(<exnihilocreatio:block_sieve>);
	recipes.addShaped("Ex Nihilo Sieve",
	<exnihilocreatio:block_sieve>, 
	[[<ore:plateNickel>, <ore:itemEnrichedAlloy>, <ore:plateNickel>],
	[<ore:plankWood>, <ore:gearMithril>, <ore:plankWood>], 
	[<ore:stickWood>, null, <ore:stickWood>]]);

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
	
# Ex Nihilo dust conversion to ores
	recipes.addShapeless("Ex Nihilo Ardite", <tconstruct:ore:1>, [<ore:pieceArdite>, <ore:pieceArdite>, <ore:pieceArdite>, <ore:pieceArdite>]);
	recipes.addShapeless("Ex Nihilo Cobalt", <tconstruct:ore>, [<ore:pieceCobalt>, <ore:pieceCobalt>, <ore:pieceCobalt>, <ore:pieceCobalt>]);
	recipes.addShapeless("Ex Nihilo Nickel", <thermalfoundation:ore:5>, [<ore:pieceNickel>, <ore:pieceNickel>, <ore:pieceNickel>, <ore:pieceNickel>]);
	recipes.addShapeless("Ex Nihilo Silver", <thermalfoundation:ore:2>, [<ore:pieceSilver>, <ore:pieceSilver>, <ore:pieceSilver>, <ore:pieceSilver>]);
	recipes.addShapeless("Ex Nihilo Lead", <thermalfoundation:ore:3>, [<ore:pieceLead>, <ore:pieceLead>, <ore:pieceLead>, <ore:pieceLead>]);
	recipes.addShapeless("Ex Nihilo Aluminomnomnom", <thermalfoundation:ore:4>, [<ore:pieceAluminum>, <ore:pieceAluminum>, <ore:pieceAluminum>, <ore:pieceAluminum>]);
	recipes.addShapeless("Ex Nihilo Tin", <thermalfoundation:ore:1>, [<ore:pieceTin>, <ore:pieceTin>, <ore:pieceTin>, <ore:pieceTin>]);
	recipes.addShapeless("Ex Nihilo Copper", <thermalfoundation:ore>, [<ore:pieceCopper>, <ore:pieceCopper>, <ore:pieceCopper>, <ore:pieceCopper>]);
	recipes.addShapeless("Ex Nihilo Iron", <minecraft:iron_ore>, [<ore:pieceIron>, <ore:pieceIron>, <ore:pieceIron>, <ore:pieceIron>]);
	recipes.addShapeless("Ex Nihilo Gold", <minecraft:gold_ore>, [<ore:pieceGold>, <ore:pieceGold>, <ore:pieceGold>, <ore:pieceGold>]);
	recipes.addShapeless("Ex Nihilo JAOPCA Thorium", <nuclearcraft:ore:3>, [<ore:pieceThorium>, <ore:pieceThorium>, <ore:pieceThorium>, <ore:pieceThorium>]);
	recipes.addShapeless("Ex Nihilo JAOPCA Magnesium", <nuclearcraft:ore:7>, [<ore:pieceMagnesium>, <ore:pieceMagnesium>, <ore:pieceMagnesium>, <ore:pieceMagnesium>]);
	recipes.addShapeless("Ex Nihilo JAOPCA Lithium", <nuclearcraft:ore:6>, [<ore:pieceLithium>, <ore:pieceLithium>, <ore:pieceLithium>, <ore:pieceLithium>]);
	recipes.addShapeless("Ex Nihilo JAOPCA Boron", <nuclearcraft:ore:5>, [<ore:pieceBoron>, <ore:pieceBoron>, <ore:pieceBoron>, <ore:pieceBoron>]);
	recipes.addShapeless("Ex Nihilo JAOPCA Uranium", <immersiveengineering:ore:5>, [<ore:pieceUranium>, <ore:pieceUranium>, <ore:pieceUranium>, <ore:pieceUranium>]);
	recipes.addShapeless("Ex Nihilo JAOPCA Osmium", <mekanism:oreblock>, [<ore:pieceOsmium>,<ore:pieceOsmium>,<ore:pieceOsmium>,<ore:pieceOsmium>]);

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
	
# Ex Nihilo Ore chunks - Replacing with "real" ore
	rh(<exnihilocreatio:item_ore_gold:1>);
	rh(<exnihilocreatio:item_ore_iron:1>);
	rh(<exnihilocreatio:item_ore_copper:1>);
	rh(<exnihilocreatio:item_ore_tin:1>);
	rh(<exnihilocreatio:item_ore_aluminum:1>);
	rh(<exnihilocreatio:item_ore_lead:1>);
	rh(<exnihilocreatio:item_ore_silver:1>);
	rh(<exnihilocreatio:item_ore_nickel:1>);
	rh(<exnihilocreatio:item_ore_ardite:1>);
	rh(<exnihilocreatio:item_ore_cobalt:1>);
	rh(<jaopca:item_hunkosmium>);
	rh(<jaopca:item_hunkboron>);
	rh(<jaopca:item_hunklithium>);
	rh(<jaopca:item_hunkmagnesium>);
	rh(<jaopca:item_hunkthorium>);
	rh(<jaopca:item_hunkuranium>);
# Ex Nihilo Dusts
	rh(<exnihilocreatio:item_ore_gold:2>);
	rh(<exnihilocreatio:item_ore_iron:2>);
	rh(<exnihilocreatio:item_ore_copper:2>);
	rh(<exnihilocreatio:item_ore_tin:2>);
	rh(<exnihilocreatio:item_ore_aluminum:2>);
	rh(<exnihilocreatio:item_ore_lead:2>);
	rh(<exnihilocreatio:item_ore_silver:2>);
	rh(<exnihilocreatio:item_ore_nickel:2>);

# Remove excess mesh
	rh(<excompressum:iron_mesh>);


# [Artificial Hive] from [Hay Bale][+1]
craft.remake(<exnihilocreatio:hive>, ["pretty",
  "B B B",
  "b H b",
  "B B B"], {
  B: <ore:itemBeeswax>,    # Beeswax
  H: <minecraft:hay_block>,# Hay Bale
	b: <rustic:bee>
});

# Remove Burn Time to prevent confusing in JEI categories
furnace.setFuel(<exnihilocreatio:hive:1>, 0);

# Re-add Sawdust to Hammered logs
//mods.exnihilocreatio.Hammer.addRecipe(IIngredient input, IItemStack output, Int tool level, Float chance, Float fortune chance);
//mods.exnihilocreatio.Hammer.addRecipe(<ore:logWood>, <thermalfoundation:material:800>, 0, 1, 0.5); Change not going through