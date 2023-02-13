import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import scripts.craft.grid.Grid;
import mods.jei.JEI.removeAndHide as rh;
#modloaded forestry

# Fixing fruit juice amount from tomatos
for tomato in <ore:cropTomato>.items {
	mods.forestry.Squeezer.removeRecipe(<liquid:juice>, [tomato]);	
	mods.forestry.Squeezer.addRecipe(<liquid:juice> * 100, [tomato], 100);
}

# Forester's Manual
	recipes.remove(<forestry:book_forester>);
	recipes.addShapeless("Foresters Manual", 
	<forestry:book_forester>, 
	[<minecraft:book>, <ore:treeSapling>, <ore:treeSapling>]);

	
# Refined Circuit Board
	mods.forestry.Carpenter.removeRecipe(<forestry:chipsets:3>);
	mods.forestry.Carpenter.addRecipe(<forestry:chipsets:3>.withTag({T: 3 as short}), 
	[[<appliedenergistics2:material:17>, <forestry:chipsets>.withTag({T:0 as short}, false), <appliedenergistics2:material:17>],
	[<ore:circuitUltimate>, <forestry:chipsets:1>.withTag({T:1 as short}, false), <ore:circuitUltimate>],
	[<appliedenergistics2:material:17>, <forestry:chipsets:2>.withTag({T:2 as short}, false), <appliedenergistics2:material:17>]], 
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
	
# *======= Carpenter =======*

//mods.forestry.Carpenter.addRecipe(IItemStack output, IIngredient[][] ingredients, int packagingTime, @Optional ILiquidStack fluidInput, @Optional IItemStack box)
#mods.forestry.Carpenter.addRecipe(<minecraft:redstone> * 9, [[<minecraft:redstone_block>]], 30);
#mods.forestry.Carpenter.addRecipe(<minecraft:gold_ingot>, [[<minecraft:gold_block>]], 30, <liquid:for.honey> * 100);
#mods.forestry.Carpenter.addRecipe(<minecraft:redstone_block>, [[<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>],[<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>],[<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>]], 60, <liquid:water> * 200, <minecraft:stone>);


# Use OreDict recipe for Impregnated Casing
val imprCasingGrid = Grid(["AAA","A A","AAA"], {A:<ore:logWood>}).shaped();
mods.forestry.Carpenter.removeRecipe(<forestry:impregnated_casing>);
mods.forestry.Carpenter.addRecipe(<forestry:impregnated_casing>, imprCasingGrid, 40, <liquid:oliveoil> * 250);
mods.forestry.Carpenter.addRecipe(<forestry:impregnated_casing>, imprCasingGrid, 40, <liquid:seed.oil> * 250);

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

# Remove pulp recipe
mods.forestry.Carpenter.removeRecipe(<forestry:wood_pulp>);
mods.forestry.Carpenter.addRecipe(<thermalfoundation:material:800>, [[<ore:logWood>]], 40, <liquid:water> * 250);

mods.forestry.Carpenter.removeRecipe(<forestry:letters>);
mods.forestry.Carpenter.addRecipe(<forestry:letters>, Grid(["AAA","AAA"], {A: <thermalfoundation:material:800>}).shaped(), 40, <liquid:water> * 250);

# *======= Squeezer =======*

//mods.forestry.Squeezer.addRecipe(ILiquidStack fluidOutput, IItemStack[] ingredients, int timePerItem, @Optional WeightedItemStack itemOutput);
//mods.forestry.Squeezer.addRecipe(<liquid:lava>, <minecraft:redstone>, 120);
#mods.forestry.Squeezer.addRecipe(<liquid:lava>, <minecraft:obsidian>, 120, <minecraft:redstone> % 20);

# Simplify andvanced bags
val bagNames = [
	"miner",
	"digger",
	"forester",
	"hunter",
	"adventurer",
	"builder",
] as string[];

for name in bagNames {
	val splBag = itemUtils.getItem("forestry:"~name~"_bag");
	val advBag = itemUtils.getItem("forestry:"~name~"_bag_t2");
	mods.forestry.Carpenter.removeRecipe(advBag);

	mods.forestry.Carpenter.addRecipe(advBag, [
		[<quark:gold_button>], # Gold Button
		[splBag],
		[<forestry:crafting_material:2>] # Silk Wisp
	], 40, <liquid:water> * 250);
}

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

recipes.remove(<forestry:capsule>);
recipes.addShaped("Wax Capsules",
	<forestry:capsule> * 4,
	[[null,null,null],
	[<ore:itemBeeswax>,<ore:itemBeeswax>,<ore:itemBeeswax>],
	[null,null,null]]);