import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.item.IIngredient;
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

# Phosphor as melting mechannics
for input,output in {
	<ore:dustPyrotheum>      : <fluid:pyrotheum> * 250,
	<ore:dustCryotheum>      : <fluid:cryotheum> * 250,
	<ore:dustAerotheum>      : <fluid:aerotheum> * 250,
	<ore:dustPetrotheum>     : <fluid:petrotheum> * 250,
	<ore:blockRedstone>      : <fluid:redstone> * 900,
	<ore:glowstone>          : <fluid:glowstone> * 1000,
	<ore:materialEnderPearl> : <fluid:ender> * 250,
	
	<ore:blockCoal>
	|<ore:blockGraphite>     : <fluid:coal> * 900,
} as ILiquidStack[IIngredient]  {
	scripts.process.squeeze([<forestry:phosphor>, input], output, "only: ForestrySqueezer", null);
}

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

# ----------------------------------------------
# Bees rework
# ----------------------------------------------

# Buff Pulsating mesh output
mods.forestry.Carpenter.removeRecipe(<minecraft:ender_pearl>);
mods.forestry.Carpenter.addRecipe(<actuallyadditions:block_misc:6> * 4, 
	Grid(["AA","AA"], {A:<forestry:crafting_material:1>}).shaped(), 60);

# Buff propolis to slime (was 1 poor slime ball)
# [Knightslime_Nugget*3] from [Pollen_Cluster][+1]
recipes.removeByRecipeName("forestry:propolis_to_slime");
craft.remake(<tconstruct:nuggets:3> * 3, ["pretty",
  "P o P",
  "P o P",
  "P o P"], {
  "P": <forestry:propolis:*>, # Propolis
  "o": <forestry:pollen>      # Pollen Cluster
});

# Buff light level of lit candles
<forestry:candle:1>.asBlock().definition.lightLevel = 0.95;


# ---------------------------
# Remake old combs

function reprocessComb(comb as IItemStack, outputs as WeightedItemStack[]) as void {
	mods.forestry.Centrifuge.removeRecipe(comb);
	mods.forestry.Centrifuge.addRecipe(outputs, comb, 60);

	if(!comb.matches(<forestry:bee_combs:9>))
		mods.thermalexpansion.Centrifuge.removeRecipe(comb);
	scripts.wrap.thermalexpansion.Centrifuge.addRecipe(outputs, comb, null, 2000);
}

# [Frozen_Comb]
reprocessComb(<forestry:bee_combs:4>, [
	<forestry:beeswax> % 80,     # Beeswax
	<forestry:pollen:1> % 20,    # Crystalline Pollen Cluster
	<forestry:honey_drop> % 70,  # Honey Drop
	<mctsmelteryio:iceball> % 40 # Iceball
]);

# [Dripping_Comb]
reprocessComb(<forestry:bee_combs:5>, [
	<thermalfoundation:material:1> % 20, # Gold Dust
	<forestry:honeydew> % 100,  # Honeydew
	<forestry:honey_drop> % 40  # Honey Drop
]);

# [Parched_Comb]
reprocessComb(<forestry:bee_combs:7>, [
	<minecraft:blaze_powder> % 25, # Blaze Powder
	<forestry:beeswax> % 100,  # Beeswax
	<forestry:honey_drop> % 90 # Honey Drop
]);

# [Powdery_Comb]
reprocessComb(<forestry:bee_combs:10>, [
	<forestry:beeswax> % 20,     # Beeswaxer
	(<minecraft:gunpowder> * 4) % 100, # Gunpowder
	<forestry:honey_drop> % 20   # Honey Drop
]);

# [Mossy_Comb]
reprocessComb(<forestry:bee_combs:15>, [
	<forestry:beeswax> % 100,  # Beeswax
	<ic2:crafting:20> % 100,   # Plantball
	<forestry:honey_drop> % 90 # Honey Drop
]);

# [Mellow_Comb]
reprocessComb(<forestry:bee_combs:16>, [
	<minecraft:glowstone_dust> % 40, # Glowstone Dust
	<forestry:beeswax> % 20,   # Beeswax
	<forestry:honeydew> % 60   # Honeydew
]);

# [Cocoa_Comb]
reprocessComb(<forestry:bee_combs:1>, [
  <forestry:beeswax> % 80, # Beeswax
  <minecraft:dye:3> % 50, # Cocoa
  <nuclearcraft:dark_chocolate> % 20 # Dark Chocolate
]);

# [Irradiated_Comb]
reprocessComb(<forestry:bee_combs:9>, [
  <forestry:beeswax> % 50, # Beeswax
  <nuclearcraft:plutonium:14> % 2, # Tiny Clump of Plutonium-242
  <nuclearcraft:uranium:10> % 40   # Tiny Clump of Uranium-238
]);

# [Wheaten_Comb]
reprocessComb(<forestry:bee_combs:14>, [
  <forestry:beeswax> % 80, # Beeswax
  <harvestcraft:flouritem> % 100,
  <nuclearcraft:graham_cracker> % 20 # Graham Cracker
]);

# ---------------------------



