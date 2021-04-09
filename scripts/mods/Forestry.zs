import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.jei.JEI.removeAndHide as rh;
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

# Refined Circuit Board
	mods.forestry.Carpenter.removeRecipe(<forestry:chipsets:3>);
	scripts.wrap.forestry.Carpenter.addRecipe(<forestry:chipsets:3>.withTag({T: 3 as short}), 
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
rh(<forestry:charcoal>);

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
rh(<forestry:greenhouse>);
rh(<forestry:greenhouse:3>);
rh(<forestry:greenhouse:4>);
rh(<forestry:greenhouse:5>);	
rh(<forestry:climatiser>);
rh(<forestry:climatiser:1>);
rh(<forestry:climatiser:2>);
rh(<forestry:climatiser:3>);
rh(<forestry:climatiser:4>);

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

# Simplify Alviery because its feels too grindy for so low value
# [Alveary*14] from [Impregnated Casing][+1]
craft.remake(<forestry:alveary.plain> * 14, ["pretty",
  "S S S",
  "S I S",
  "S S S"], {
  "S": <forestry:crafting_material:6>, # Scented Paneling
  "I": <forestry:impregnated_casing>,  # Impregnated Casing
  remove: <forestry:alveary.plain>,    # Alveary
});

# Use OreDict recipe for impregnated stick
mods.forestry.Carpenter.removeRecipe(<forestry:oak_stick>);
scripts.wrap.forestry.Carpenter.addRecipe(<forestry:oak_stick> * 2, [[<ore:logWood>],[<ore:logWood>]], 40, <liquid:oliveoil> * 100);
scripts.wrap.forestry.Carpenter.addRecipe(<forestry:oak_stick> * 2, [[<ore:logWood>],[<ore:logWood>]], 40, <liquid:seed.oil> * 100);

# Use OreDict recipe for Impregnated Casing
val imprCasingGrid = Grid(["AAA","A A","AAA"], {A:<ore:logWood>}).shaped();
mods.forestry.Carpenter.removeRecipe(<forestry:impregnated_casing>);
scripts.wrap.forestry.Carpenter.addRecipe(<forestry:impregnated_casing>, imprCasingGrid, 40, <liquid:oliveoil> * 250);
scripts.wrap.forestry.Carpenter.addRecipe(<forestry:impregnated_casing>, imprCasingGrid, 40, <liquid:seed.oil> * 250);

# Way cheaper instead using Royal Jelly and Pollen Cluster to descrease grind
# [Scented Paneling] from [Honeydew][+2]
val scentPanelGrid = Grid(["pretty",
	"  H  ",
	"# # #",
	"B   B"], {
	"B": <ore:itemBeeswax>,  # Beeswax
	"#": <ore:plankWood>,    # Oak Wood Planks
	"H": <ore:dropHoneydew>, # Honeydew
}).shaped();

mods.forestry.Carpenter.removeRecipe(<forestry:crafting_material:6>);
scripts.wrap.forestry.Carpenter.addRecipe(<forestry:crafting_material:6>, scentPanelGrid, 40, <liquid:for.honey> * 500);
scripts.wrap.forestry.Carpenter.addRecipe(<forestry:crafting_material:6>, scentPanelGrid, 40, <liquid:honey>     * 500);

<forestry:wax_cast>.maxDamage = 32;

# [Advanced Analyzer] from [Analyzer][+2]
craft.remake(<requious:adv_bee_analyzer>, ["pretty",
  "S t S",
  "S A S"], {
  "A": <forestry:analyzer>,            # Analyzer
  "S": <forestry:crafting_material:6>, # Scented Paneling
  "t": <forestry:propolis:1>,          # Sticky Propolis
});

# Just remake recipe, because different propolis wont actually work
recipes.remove(<forestry:bituminous_peat>);
recipes.addShaped("forestry_bituminous_peat", <forestry:bituminous_peat>, [[null, <ore:dustAsh>, null], [<forestry:peat:*>, <forestry:propolis:*>, <forestry:peat:*>], [null, <ore:dustAsh>, null]]);
