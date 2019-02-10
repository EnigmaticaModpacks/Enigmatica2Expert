import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

import mods.jei.JEI.removeAndHide as rh;
#modloaded forestry
print("--- loading Forestry.zs ---");
	
# *======= Recipes =======*

# Forester's Manual
	recipes.remove(<forestry:book_forester>);
	recipes.addShapeless("Foresters Manual", 
	<forestry:book_forester>, 
	[<minecraft:book>, <ore:treeSapling>, <ore:treeSapling>]);

	
# Refined Circuit Board
	mods.forestry.Carpenter.removeRecipe(<forestry:chipsets:3>);
	mods.forestry.Carpenter.addRecipe(<forestry:chipsets:3>.withTag({T: 3 as short}), 
	[[<appliedenergistics2:material:17>, <forestry:chipsets>.withTag({}), <appliedenergistics2:material:17>],
	[<ore:circuitUltimate>, <forestry:chipsets:1>.withTag({}), <ore:circuitUltimate>],
	[<appliedenergistics2:material:17>, <forestry:chipsets:2>.withTag({}), <appliedenergistics2:material:17>]], 
	40, <liquid:water> * 1000);

# Sturdy Casing
	recipes.remove(<forestry:sturdy_machine>);
	recipes.addShapedMirrored("Sturdy Casing", 
	<forestry:sturdy_machine> * 2, 
	[[<ore:gearCopper>, <ore:ingotBronze>, <ore:gearCopper>],
	[<ore:ingotBronze>, null, <ore:ingotBronze>], 
	[<ore:gearBronze>, <ore:ingotBronze>, <ore:gearBronze>]]);

# Bee house
	recipes.remove(<forestry:bee_house>);
	
# Carpenter
	recipes.remove(<forestry:carpenter>);
	recipes.addShapedMirrored("Carpenter",
	<forestry:carpenter>, 
	[[<ore:plankTreatedWood>, <ore:listAllwater>, <ore:plankTreatedWood>],
	[<ore:plankTreatedWood>, <forestry:sturdy_machine>, <ore:plankTreatedWood>], 
	[<ore:plankTreatedWood>, <ore:listAllwater>, <ore:plankTreatedWood>]]);

# Fermenter
	recipes.remove(<forestry:fermenter>);
	recipes.addShapedMirrored("Fermenter", 
	<forestry:fermenter>, 
	[[<ore:plankTreatedWood>, <ore:gearBronze>, <ore:plankTreatedWood>],
	[<ore:blockGlass>, <forestry:sturdy_machine>, <ore:blockGlass>], 
	[<ore:plankTreatedWood>, <ore:gearBronze>, <ore:plankTreatedWood>]]);

# Squeezer
	recipes.remove(<forestry:squeezer>);
	recipes.addShapedMirrored("Squeezer", 
	<forestry:squeezer>, 
	[[<ore:plankTreatedWood>, <ore:blockGlass>, <ore:plankTreatedWood>],
	[<ore:gearTin>, <forestry:sturdy_machine>, <ore:gearTin>], 
	[<ore:plankTreatedWood>, <ore:blockGlass>, <ore:plankTreatedWood>]]);

# Thermionic Fabricator
	recipes.remove(<forestry:fabricator>);
	recipes.addShaped("Thermionic Fabricator", 
	<forestry:fabricator>, 
	[[<ore:gearGold>, <ore:blockGlass>, <ore:gearGold>],
	[<ore:blockGlass>, <forestry:hardened_machine>, <ore:blockGlass>], 
	[<ore:gearGold>, <forestry:impregnated_casing>, <ore:gearGold>]]);

# Removing shapeless bronze crafting recipe
	recipes.remove(<forestry:ingot_bronze>);
	
# Plank recipes, made by TrilexCom
	recipes.addShapeless(<forestry:planks.0> * 2, [<forestry:logs.0>]); 
	recipes.addShapeless(<forestry:planks.0:1> * 2, [<forestry:logs.0:1>]);
	recipes.addShapeless(<forestry:planks.0:2> * 2, [<forestry:logs.0:2>]);
	recipes.addShapeless(<forestry:planks.0:3> * 2, [<forestry:logs.0:3>]);    
	recipes.addShapeless(<forestry:planks.0:4> * 2, [<forestry:logs.1>]);    
	recipes.addShapeless(<forestry:planks.0:5> * 2, [<forestry:logs.1:1>]);    
	recipes.addShapeless(<forestry:planks.0:6> * 2, [<forestry:logs.1:2>]);    
	recipes.addShapeless(<forestry:planks.0:7> * 2, [<forestry:logs.1:3>]);
	recipes.addShapeless(<forestry:planks.0:8> * 2, [<forestry:logs.2>]); 
	recipes.addShapeless(<forestry:planks.1:2> * 2, [<forestry:logs.4:2>]);
	recipes.addShapeless(<forestry:planks.1:3> * 2, [<forestry:logs.4:3>]);
	recipes.addShapeless(<forestry:planks.1:4> * 2, [<forestry:logs.5>]);
	recipes.addShapeless(<forestry:planks.1:6> * 2, [<forestry:logs.5:2>]);
	recipes.addShapeless(<forestry:planks.1:5> * 2, [<forestry:logs.5:1>]);
	recipes.addShapeless(<forestry:planks.0:15> * 2, [<forestry:logs.3:3>]);
	recipes.addShapeless(<forestry:planks.0:11> * 2, [<forestry:logs.2:3>]);
	recipes.addShapeless(<forestry:planks.0:12> * 2, [<forestry:logs.3>]);
	recipes.addShapeless(<forestry:planks.0:13> * 2, [<forestry:logs.3:1>]);
	recipes.addShapeless(<forestry:planks.0:14> * 2, [<forestry:logs.3:2>]);
	recipes.addShapeless(<forestry:planks.1:7> * 2, [<forestry:logs.5:3>]);
	recipes.addShapeless(<forestry:planks.1:10> * 2, [<forestry:logs.6:2>]);
	recipes.addShapeless(<forestry:planks.1:9> * 2, [<forestry:logs.6:1>]);
	recipes.addShapeless(<forestry:planks.1:8> * 2, [<forestry:logs.6>]);
	recipes.addShapeless(<forestry:planks.1> * 2, [<forestry:logs.4>]);
	recipes.addShapeless(<forestry:planks.1:1> * 2, [<forestry:logs.4:1>]);
	recipes.addShapeless(<forestry:planks.0:9> * 2, [<forestry:logs.2:1>]);
	recipes.addShapeless(<forestry:planks.1:12> * 2, [<forestry:logs.7>]);
	recipes.addShapeless(<forestry:planks.0:10> * 2, [<forestry:logs.2:2>]);
	recipes.addShapeless(<forestry:planks.1:11> * 2, [<forestry:logs.6:3>]);
	
# *======= Carpenter =======*

//mods.forestry.Carpenter.addRecipe(IItemStack output, IIngredient[][] ingredients, int packagingTime, @Optional ILiquidStack fluidInput, @Optional IItemStack box)
#mods.forestry.Carpenter.addRecipe(<minecraft:redstone> * 9, [[<minecraft:redstone_block>]], 30);
#mods.forestry.Carpenter.addRecipe(<minecraft:gold_ingot>, [[<minecraft:gold_block>]], 30, <liquid:for.honey> * 100);
#mods.forestry.Carpenter.addRecipe(<minecraft:redstone_block>, [[<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>],[<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>],[<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>]], 60, <liquid:water> * 200, <minecraft:stone>);

//mods.forestry.Carpenter.removeRecipe(IItemStack output, @Optional ILiquidStack fluidInput);
#mods.forestry.Carpenter.removeRecipe(<forestry:portable_alyzer>);
#mods.forestry.Carpenter.removeRecipe(<forestry:wood_pulp>, <liquid:water>);

# *======= Centrifuge =======*

//mods.forestry.Centrifuge.addRecipe(WeightedItemStack[] output, IItemStack ingredients, int packagingTime);
#mods.forestry.Centrifuge.addRecipe([(<minecraft:redstone> * 9) % 80, <minecraft:gold_ingot> % 12], <minecraft:redstone_block>, 100);

//mods.forestry.Centrifuge.removeRecipe(IIngredient input);
#mods.forestry.Centrifuge.removeRecipe(<forestry:bee_combs:*>);


# *======= Fermenter =======*

//mods.forestry.Fermenter.addRecipe(ILiquidStack fluidOutput, IItemStack resource, ILiquidStack fluidInput, int fermentationValue, float fluidOutputModifier);
#mods.forestry.Fermenter.addRecipe(<liquid:lava>, <minecraft:obsidian>, <liquid:water>, 1000, 0.5);

//mods.forestry.Fermenter.removeRecipe(IIngredient input);
#mods.forestry.Fermenter.removeRecipe(<minecraft:reeds>);
#mods.forestry.Fermenter.removeRecipe(<liquid:water>);

#More Fermenter compat
val FermenterFluid = {
    <liquid:wildberryjuice> : 1.26,
    <liquid:ironberryjuice> : 1.00,
    <liquid:grapejuice>     : 1.50,
    <liquid:applejuice>     : 1.50,
    <liquid:for.honey>      : 1.50,
    <liquid:honey>          : 1.50,
    <liquid:water>          : 1.00
}   as float[ILiquidStack];

val thingsToferment = [
    <minecraft:carrot>,
    <harvestcraft:peanutitem>,
    <harvestcraft:waterchestnutitem>,
    <harvestcraft:sesameseedsitem>,
    <harvestcraft:curryleafitem>,
    <minecraft:beetroot>,
    <minecraft:melon>,
    <harvestcraft:gigapickleitem>,
    <harvestcraft:kaleitem>,
    <harvestcraft:agaveitem>,
    <harvestcraft:amaranthitem>,
    <harvestcraft:arrowrootitem>,
    <harvestcraft:quinoaitem>,
    <harvestcraft:sisalitem>,
    <harvestcraft:cassavaitem>,
    <harvestcraft:chickpeaitem>,
    <harvestcraft:elderberryitem>,
    <harvestcraft:flaxitem>,
    <harvestcraft:greengrapeitem>,
    <harvestcraft:huckleberryitem>,
    <harvestcraft:jicamaitem>,
    <harvestcraft:juteitem>,
    <harvestcraft:kenafitem>,
    <harvestcraft:kohlrabiitem>,
    <harvestcraft:lentilitem>,
    <harvestcraft:milletitem>,
    <harvestcraft:mulberryitem>,
    <harvestcraft:taroitem>
] as IItemStack[];

for thing in thingsToferment {
    for liquid, ratio in FermenterFluid {
        mods.forestry.Fermenter.addRecipe(<liquid:biomass>, thing, liquid, 50, ratio);
    }
}

# *======= Moisterner =======*

//mods.forestry.Moistener.addRecipe(IItemStack output, IItemStack input, int packagingTime); 
#mods.forestry.Moistener.addRecipe(<minecraft:mycelium>, <minecraft:grass>, 60); 

//mods.forestry.Moistener.removeRecipe(IIngredient output);
#mods.forestry.Moistener.removeRecipe(<minecraft:stonebrick:1>);

# *======= Squeezer =======*

//mods.forestry.Squeezer.addRecipe(ILiquidStack fluidOutput, IItemStack[] ingredients, int timePerItem, @Optional WeightedItemStack itemOutput);
//mods.forestry.Squeezer.addRecipe(<liquid:lava>, <minecraft:redstone>, 120);
#mods.forestry.Squeezer.addRecipe(<liquid:lava>, <minecraft:obsidian>, 120, <minecraft:redstone> % 20);

//mods.forestry.Squeezer.removeRecipe(ILiquidStack liquid, @Optional IIngredient[] ingredients);
#mods.forestry.Squeezer.removeRecipe(<liquid:juice>);
#mods.forestry.Squeezer.removeRecipe(<liquid:seed.oil>, [<minecraft:wheat_seeds>]);

#Make melons give fruit juice
mods.forestry.Squeezer.addRecipe(<liquid:juice> * 15, [<minecraft:melon>], 8);

# *======= Still =======*

//mods.forestry.Still.addRecipe(ILiquidStack fluidOutput, ILiquidStack fluidInput, int timePerUnit);
#mods.forestry.Still.addRecipe(<liquid:lava>, <liquid:water>, 200);

//mods.forestry.Still.removeRecipe(ILiquidStack output, @Optional ILiquidStack fluidInput);
#mods.forestry.Still.removeRecipe(<liquid:bio.ethanol>);
#mods.forestry.Still.removeRecipe(<liquid:refinedcanolaoil>,<liquid:canolaoil>);

# *======= Thermionic Fabricator =======*

//mods.forestry.ThermionicFabricator.addCast(IItemStack output, IIngredient[][] ingredients, ILiquidStack liquidStack, @Optional IItemStack plan);
#mods.forestry.ThermionicFabricator.addCast(<minecraft:glass_pane> * 4, [[<minecraft:dirt>,null,null],[null,null,null],[null,null,null]], <liquid: glass> * 200);
#mods.forestry.ThermionicFabricator.addCast(<minecraft:stained_glass:3>, [[<ore:dyeLightBlue>,null,null],[null,null,null],[null,null,null]], <liquid: glass> * 144, <forestry:wax_cast>);

//mods.forestry.ThermionicFabricator.removeCast(IIngredient product);
#mods.forestry.ThermionicFabricator.removeCast(<forestry:thermionic_tubes:5>);

//mods.forestry.ThermionicFabricator.addSmelting(ILiquidStack liquidStack, IItemStack itemInput, int meltingPoint);
#mods.forestry.ThermionicFabricator.addSmelting(<liquid:glass> * 120, <minecraft:stone>, 500);

//mods.forestry.ThermionicFabricator.removeSmelting(IIngredient itemInput);
#mods.forestry.ThermionicFabricator.removeSmelting(<minecraft:sand>);

print("--- Forestry.zs initialized ---");
