import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import scripts.craft.grid.Grid;
#modloaded forestry

# Fixing fruit juice amount from tomatos
for tomato in <ore:cropTomato>.items {
	mods.forestry.Squeezer.removeRecipe(<liquid:juice>, [tomato]);	
	scripts.wrap.forestry.Squeezer.addRecipe(<liquid:juice> * 100, [tomato], 100);
}

# Forester's Manual
	recipes.remove(<forestry:book_forester>);
	recipes.addShapeless("Foresters Manual", 
	<forestry:book_forester>, 
	[<minecraft:book>, <ore:treeSapling>, <ore:treeSapling>]);

# Intricate Circuit Board
mods.forestry.Carpenter.removeRecipe(<forestry:chipsets:3>);
scripts.wrap.forestry.Carpenter.addRecipe(<forestry:chipsets:3>.withTag({T: 3 as short}), 
  scripts.craft.grid.Grid(["pretty",
	"◊ B ◊",
  "◊ E ◊",
  "◊ R ◊"], {
  "B": <forestry:chipsets:0>.withTag({T: 0 as short}, false), # Basic Circuit Board
  "R": <forestry:chipsets:2>.withTag({T: 2 as short}, false), # Refined Circuit Board
  "E": <forestry:chipsets:1>.withTag({T: 1 as short}, false), # Enhanced Circuit Board
  "◊": <ore:gemAmber>, # Amber
	}).shaped(), 40, <liquid:water> * 1000);

# Sturdy Casing
	recipes.remove(<forestry:sturdy_machine>);
	recipes.addShapedMirrored("Sturdy Casing", 
	<forestry:sturdy_machine> * 2, 
	[[<ore:gearCopper>, <ore:ingotBronze>, <ore:gearCopper>],
	[<ore:ingotBronze>, null, <ore:ingotBronze>], 
	[<ore:gearBronze>, <ore:ingotBronze>, <ore:gearBronze>]]);


# [Hardened Casing] from [Sturdy Casing][+1]
mods.forestry.Carpenter.removeRecipe(<forestry:hardened_machine>);
scripts.wrap.forestry.Carpenter.addRecipe(<forestry:hardened_machine>, 
  scripts.craft.grid.Grid(["pretty",
  "◊   ◊",
  "  ⌂  ",
  "◊   ◊"], {
  "◊": <ore:gemDiamondRat>,       # Rat Diamond
  "⌂": <forestry:sturdy_machine>, # Sturdy Casing
}).shaped(), 40, <liquid:water> * 5000);


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
        scripts.wrap.forestry.Fermenter.addRecipe(<liquid:biomass>, thing, liquid, 50, ratio);
    }
}

#Make melons give fruit juice
scripts.wrap.forestry.Squeezer.addRecipe(<liquid:juice> * 15, [<minecraft:melon>], 8);

# Remove and hide charcoal block
utils.rh(<forestry:charcoal>);

# Remove pulp recipe
mods.forestry.Carpenter.removeRecipe(<forestry:wood_pulp>);
scripts.wrap.forestry.Carpenter.addRecipe(<thermalfoundation:material:800>, [[<ore:logWood>]], 40, <liquid:water> * 250);

mods.forestry.Carpenter.removeRecipe(<forestry:letters>);
scripts.wrap.forestry.Carpenter.addRecipe(<forestry:letters>, Grid(["AAA","AAA"], {A: <thermalfoundation:material:800>}).shaped(), 40, <liquid:water> * 250);

# Fertilizer ask less sand but more Apatite
# [Fertilizer*8] from [Sand][+1]
craft.remake(<forestry:fertilizer_compound> * 8, 
	["◊", "s", "◊"], {
  "s": <ore:sand>,      # Sand
  "◊": <ore:gemApatite> # Apatite
});

# [Fertilizer*16] from [Apatite][+1]
craft.remake(<forestry:fertilizer_compound> * 16, ["pretty",
  "▲ ◊ ▲",
  "▲ ▲ ▲",
  "▲ ◊ ▲"], {
  "▲": <ore:dustAsh>,   # Ash
  "◊": <ore:gemApatite> # Apatite
});

// Disabling Greenhouse
utils.rh(<forestry:greenhouse>);
utils.rh(<forestry:greenhouse:3>);
utils.rh(<forestry:greenhouse:4>);
utils.rh(<forestry:greenhouse:5>);	
utils.rh(<forestry:climatiser>);
utils.rh(<forestry:climatiser:1>);
utils.rh(<forestry:climatiser:2>);
utils.rh(<forestry:climatiser:3>);
utils.rh(<forestry:climatiser:4>);

# Buff light level of lit candles
<forestry:candle:1>.asBlock().definition.lightLevel = 0.95;

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

	scripts.wrap.forestry.Carpenter.addRecipe(advBag, [
		[<quark:gold_button>], # Gold Button
		[splBag],
		[<forestry:crafting_material:2>] # Silk Wisp
	], 40, <liquid:water> * 250);
}

# Use OreDict recipe for impregnated stick
mods.forestry.Carpenter.removeRecipe(<forestry:oak_stick>);
scripts.wrap.forestry.Carpenter.addRecipe(<forestry:oak_stick> * 2, [[<ore:logWood>],[<ore:logWood>]], 40, <liquid:oliveoil> * 100);
scripts.wrap.forestry.Carpenter.addRecipe(<forestry:oak_stick> * 2, [[<ore:logWood>],[<ore:logWood>]], 40, <liquid:seed.oil> * 100);

# Use OreDict recipe for Impregnated Casing
val imprCasingGrid = Grid(["AAA","A A","AAA"], {A:<ore:logWood>}).shaped();
mods.forestry.Carpenter.removeRecipe(<forestry:impregnated_casing>);
scripts.wrap.forestry.Carpenter.addRecipe(<forestry:impregnated_casing>, imprCasingGrid, 40, <liquid:oliveoil> * 250);
scripts.wrap.forestry.Carpenter.addRecipe(<forestry:impregnated_casing>, imprCasingGrid, 40, <liquid:seed.oil> * 250);

<forestry:wax_cast>.maxDamage = 32;

# [Advanced Analyzer] from [Analyzer][+2]
craft.remake(<requious:adv_bee_analyzer>, ["pretty",
  "S t S",
  "S A S"], {
  "A": <forestry:analyzer>,            # Analyzer
  "S": <forestry:crafting_material:6>, # Scented Paneling
  "t": <forestry:propolis:1>,          # Sticky Propolis
});

# Remake recipe, because original recipe cant actually accept any propolis (but shows any)
# [Bituminous Peat]*6 from [Propolis]*3[+2]
craft.reshapeless(<forestry:bituminous_peat> * 6, "▲r▲PPPPPP", {
  "▲": <ore:dustAsh>,         # Ash
  "r": <forestry:propolis:*>, # Propolis
  "P": <ore:brickPeat>,       # Peat
});

# Bitumen from peat
mods.rustic.CrushingTub.addRecipe(<liquid:oil> * 500, <thermalfoundation:material:892>, <forestry:bituminous_peat>);

# Honey drop on evaporation
mods.rustic.EvaporatingBasin.addRecipe(<forestry:honey_drop>, <liquid:animania_honey> * 1000);
mods.rustic.EvaporatingBasin.addRecipe(<forestry:honey_drop>, <liquid:for.honey>      * 1000);
mods.rustic.EvaporatingBasin.addRecipe(<forestry:honey_drop>, <liquid:honey>          * 1000);

# Way cheaper because its just a water
# [Rain Tank] from [Oak Log][+1]
craft.remake(<forestry:raintank>, ["pretty",
  "⌂   ⌂",
  "⌂ # ⌂"], {
  "⌂": <ic2:casing:3>,# Iron Item Casing
  "#": <ore:logWood>, # Oak Log
});

# Pipete clearing
recipes.addShapeless("Pipete clearing", <forestry:pipette>, [<forestry:pipette>]);

# Alt for players who hate bees
val RJ = <harvestcraft:royaljellyitem>; # Royal Jelly
scripts.wrap.actuallyadditions.Empowerer.addRecipe(<forestry:royal_jelly>, <actuallyadditions:item_worm>, RJ, RJ, RJ, RJ, 250000, 200, [1.0, 1.0, 0.0]);
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<forestry:royal_jelly>, 1000000, 1000000, <actuallyadditions:item_worm>, [RJ, RJ, RJ, RJ]);

# Dust -> Gem conversion
furnace.addRecipe(<forestry:apatite>, <jaopca:item_dustapatite>);

# [Portable Analyzer] from [Redstone][+2]
mods.forestry.Carpenter.removeRecipe(<forestry:portable_alyzer>);
craft.make(<forestry:portable_alyzer>, ["pretty",
  "⌂ G ⌂",
  "⌂ G ⌂",
  "⌂ ♥ ⌂"], {
  "⌂": <ic2:casing:3>,     # Iron Item Casing
  "G": <ore:paneGlass>,    # Glass Pane
  "♥": <ore:dustRedstone>, # Redstone
});