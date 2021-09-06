import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.item.IIngredient;
import mods.ic2.ScrapBox;
#modloaded ic2


# Hydrated Coal Dust recipe consumes containers that can store 1000mB + liquid, this fixes that
	recipes.remove(<ic2:dust:3>);
	scripts.wrap.inworldcrafting.FluidToItem.transform(<ic2:dust:3>, <fluid:water>, [<ore:dustCoal>]);
	// recipes.addShapeless("ic2_hydrated_coal_dust_liquid_fix", 
	// <ic2:dust:3>, 
	// [<ore:dustCoal>,<liquid:water> * 1000]);

# Removing IC2 coal coke
	recipes.remove(<ic2:coke>);
	
# Batch Crafter, unintended behaviour
	recipes.remove(<ic2:te:89>);

# Jetpacks	
	recipes.remove(<ic2:jetpack_electric>.anyDamage());
	recipes.remove(<ic2:jetpack:27>.anyDamage());

	recipes.addShapedMirrored("IC2 Electric Jetpack", 
	<ic2:jetpack_electric>, 
	[[<ic2:casing:5>, <minecraft:elytra>.anyDamage(), <ic2:casing:5>],
	[<ore:circuitAdvanced>, <ic2:batpack>.anyDamage(), <ore:circuitAdvanced>], 
	[<ic2:casing:5>, null, <ic2:casing:5>]]);
	
	recipes.addShapedMirrored("IC2 Jetpack", 
	<ic2:jetpack:27>, 
	[[<ic2:casing:5>, <minecraft:elytra>.anyDamage(), <ic2:casing:5>],
	[<ore:circuitAdvanced>, <ic2:te:29>, <ore:circuitAdvanced>], 
	[<ic2:casing:5>, null, <ic2:casing:5>]]);

# Hazmat/Rubber Armor
	recipes.addShaped("Hazmat ", <ic2:hazmat_helmet>, 
	[[<ore:dyeOrange>, <ore:dyeOrange>, <ore:dyeOrange>],
	[<ore:itemRubber>, <ore:blockGlass>, <ore:itemRubber>], 
	[<ore:itemRubber>, <ore:barsIron>, <ore:itemRubber>]]);

	recipes.addShaped("Hazmat Chest", <ic2:hazmat_chestplate>, 
	[[<ore:itemRubber>, null, <ore:itemRubber>],
	[<ore:itemRubber>, <ore:dyeOrange>, <ore:itemRubber>], 
	[<ore:itemRubber>, <ore:dyeOrange>, <ore:itemRubber>]]);

	recipes.addShaped("Hazmat Leggings", <ic2:hazmat_leggings>,
	 [[<ore:itemRubber>, <ore:dyeOrange>, <ore:itemRubber>],
	 [<ore:itemRubber>, null, <ore:itemRubber>],
	  [<ore:itemRubber>, null, <ore:itemRubber>]]);

	recipes.addShaped("Hazmat Boots", <ic2:rubber_boots>, 
	[[<ore:itemRubber>, null, <ore:itemRubber>],
	[<ore:itemRubber>, null, <ore:itemRubber>], 
	[<ore:itemRubber>, <ore:dyeBlack>, <ore:itemRubber>]]);


# Clay Dust 
	recipes.addShapeless("Clay Dust", 
	<ic2:dust:1>, [<minecraft:clay>, <ore:craftingToolForgeHammer>]);

# Bronze
	recipes.remove(<ic2:resource:5>);
	recipes.remove(<ic2:ingot:1>);
	
# Batch Crafter
	recipes.remove(<ic2:te:89>);
	recipes.addShaped("Batch Crafter", <ic2:te:89>, 
	[[null, <ic2:te:88>, null],
	[<ore:circuitAdvanced>, <ic2:resource:13>, <ore:circuitAdvanced>], 
	[<ore:craftingToolForgeHammer>, <thermalfoundation:wrench>.anyDamage(), <ore:craftingToolForgeHammer>]]);

# Jetpack Attachment Plate, recipe needs oredict
	recipes.remove(<ic2:crafting:37>);
	recipes.addShapedMirrored("Jetpack Attachment Plate", 
	<ic2:crafting:37>, 
	[[<ore:nuggetIridium>, <ic2:crafting:3>, <ore:nuggetIridium>],
	[<ic2:crafting:15>, <ore:plateSteel>, <ic2:crafting:15>], 
	[<ore:nuggetIridium>, <ic2:crafting:3>, <ore:nuggetIridium>]]);
	
#  Overclocker Upgrade
	recipes.remove(<ic2:upgrade>);
	scripts.wrap.forestry.Carpenter.addRecipe(<ic2:upgrade> * 2, 
	[[<ore:plateTin>, <ore:plateTin>, <ore:plateTin>],
	[<ic2:cable>, <ore:circuitBasic>, <ic2:cable>],
	[<ore:plateTin>, <ore:plateTin>, <ore:plateTin>]], 40, <liquid:ic2coolant> * 3000);

# Iridium Reinforced Plate, recipe needs oredict
	recipes.remove(<ic2:crafting:4>);
	recipes.addShapedMirrored("Iridium Reinforced Plate", 
	<ic2:crafting:4>, 
	[[<ore:ingotIridium>, <ic2:crafting:3>, <ore:ingotIridium>],
	[<ic2:crafting:3>, <ore:gemDiamondRat>, <ic2:crafting:3>], 
	[<ore:ingotIridium>, <ic2:crafting:3>, <ore:ingotIridium>]]);

# Reactor Chamber
	recipes.remove(<ic2:te:24>);
	recipes.addShaped("IC2 Reactor Chamber", 
	<ic2:te:24> * 2, 
	[[null, <ore:plateDenseLead>, null],
	[<ore:plateDenseLead>, <ic2:resource:12>, <ore:plateDenseLead>], 
	[null, <ore:plateDenseLead>, null]]);

# Basic Machine Casing
	recipes.remove(<ic2:resource:12>);
	recipes.addShapedMirrored("Basic Machine Casing1", 
	<ic2:resource:12> * 4, 
	[[<ore:plateAluminum>, <tconstruct:large_plate>.withTag({Material: "iron"}), <ore:plateAluminum>],
	[<tconstruct:large_plate>.withTag({Material: "iron"}), null, <tconstruct:large_plate>.withTag({Material: "iron"})], 
	[<ore:plateAluminum>, <tconstruct:large_plate>.withTag({Material: "iron"}), <ore:plateAluminum>]]);
	
	recipes.addShapedMirrored("Basic Machine Casing2", 
	<ic2:resource:12> * 4, 
	[[<ore:plateAluminium>, <ore:plateDenseIron>, <ore:plateAluminium>],
	[<ore:plateDenseIron>, null, <ore:plateDenseIron>], 
	[<ore:plateAluminium>, <ore:plateDenseIron>, <ore:plateAluminium>]]);
	
	recipes.addShapedMirrored("Basic Machine Casing3", 
	<ic2:resource:12> * 4, 
	[[<ore:plateAluminium>, <ore:plateDenseTin>, <ore:plateAluminium>],
	[<ore:plateDenseTin>, null, <ore:plateDenseTin>], 
	[<ore:plateAluminium>, <ore:plateDenseTin>, <ore:plateAluminium>]]);

# Reinforced Stone
	recipes.addShapedMirrored("Reinforced Stone", 
	<ic2:resource:11> * 16, 
	[[<minecraft:stone:*>, <tconstruct:soil>, <minecraft:stone:*>],
	[<tconstruct:soil>, <ore:dustClay>, <tconstruct:soil>], 
	[<minecraft:stone:*>, <tconstruct:soil>, <minecraft:stone:*>]]);
	
# MFE -> MFSU Upgrade Kit removal
	utils.rh(<ic2:upgrade_kit>);
	
# Industrial Diamond (Replaced with regular diamond)
	utils.rh(<ic2:crafting:19>);
	utils.rh(<ic2:ingot:8>);

# Unused dusts
utils.rh(<ic2:dust:4>);
utils.rh(<ic2:dust:7>);
utils.rh(<ic2:dust:10>);
utils.rh(<ic2:dust:12>);
utils.rh(<ic2:dust:14>);
utils.rh(<ic2:dust:16>);
utils.rh(<ic2:dust:17>);
utils.rh(<ic2:dust:23>);
utils.rh(<ic2:dust:25>);
utils.rh(<ic2:dust:36>);
utils.rh(<ic2:nuclear:6>);
utils.rh(<ic2:nuclear:8>);
utils.rh(<ic2:nuclear:9>);
utils.rh(<ic2:resource:8>); # Steel blocks
utils.rh(<ic2:resource:6>); # Copper blocks
utils.rh(<ic2:resource:9>); # Tin blocks
utils.rh(<ic2:resource:15>); # Silver blocks
utils.rh(<ic2:resource:7>); # Lead blocks

# Iridium TiC Compat
	scripts.wrap.tconstruct.Melting.addRecipe(<liquid:iridium> * 144, <ic2:misc_resource:1>, 500);
	scripts.wrap.tconstruct.Melting.addRecipe(<liquid:iridium> * 16, <ic2:misc_resource:2>, 200);

# Lapis Dust
	recipes.remove(<ic2:dust:9>);

# Diamond Dust
	recipes.remove(<ic2:dust:5>);
	
# IC2 Block Cutting blades
val envelop = ["aaa","aBa","aaa"] as string[];
craft.remake(<ic2:block_cutting_blade>,   envelop, {B:<ore:stone>,         a:<tconstruct:large_sword_blade>.withTag({Material: "iron"})});
craft.remake(<ic2:block_cutting_blade:1>, envelop, {B:<ore:blockFakeIron>, a:<tconstruct:large_sword_blade>.withTag({Material: "steel"})});
craft.remake(<ic2:block_cutting_blade:2>, envelop, {B:<ore:blockDiamond>,  a:<tconstruct:large_sword_blade>.withTag({Material: "alumite"})});

# New Scraps
ScrapBox.addDrop(<appliedenergistics2:material:6>, 4.0F);
ScrapBox.addDrop(<thermalfoundation:diagram_redprint>, 3.1F);
ScrapBox.addDrop(<thermalfoundation:material:864>, 2.8F);
ScrapBox.addDrop(<mekanism:substrate>, 2.4F);
ScrapBox.addDrop(<mekanismgenerators:hohlraum>, 2.1F);
ScrapBox.addDrop(<rftools:syringe>, 1.7F);
ScrapBox.addDrop(<mekanism:mufflingupgrade>, 1.5F);
ScrapBox.addDrop(<industrialforegoing:plastic>, 1.1F);
ScrapBox.addDrop(<mekanism:polyethene:2>, 0.9F);
ScrapBox.addDrop(<nuclearcraft:upgrade:1>, 0.9F);
ScrapBox.addDrop(<nuclearcraft:upgrade>, 0.9F);
ScrapBox.addDrop(<appliedenergistics2:material:52>, 0.6F);
ScrapBox.addDrop(<immersiveengineering:material:5>, 0.6F);
ScrapBox.addDrop(<extrautils2:decorativesolid:3>, 0.4F);
ScrapBox.addDrop(<extrautils2:decorativesolid:7>, 0.4F);
ScrapBox.addDrop(<immersiveengineering:stone_decoration:8>, 0.4F);
ScrapBox.addDrop(<industrialforegoing:pink_slime>, 0.3F);
ScrapBox.addDrop(<rftools:shape_card>, 0.3F);
ScrapBox.addDrop(<appliedenergistics2:fluix_block>, 0.2F);
ScrapBox.addDrop(<actuallyadditions:item_crystal_shard:1>, 0.1F);
ScrapBox.addDrop(<actuallyadditions:item_crystal_shard:2>, 0.1F);
ScrapBox.addDrop(<actuallyadditions:item_crystal_shard:3>, 0.1F);
ScrapBox.addDrop(<actuallyadditions:item_crystal_shard:4>, 0.1F);
ScrapBox.addDrop(<actuallyadditions:item_crystal_shard:5>, 0.1F);
ScrapBox.addDrop(<actuallyadditions:item_crystal_shard>, 0.1F);
ScrapBox.addDrop(<extrautils2:klein>, 0.1F);
ScrapBox.addDrop(<immersiveengineering:material:26>, 0.1F);
ScrapBox.addDrop(<psi:cad_colorizer_:17>, 0.1F);
ScrapBox.addDrop(<thermalexpansion:frame:64>, 0.05F);
ScrapBox.addDrop(<rftoolsdim:dimlet_parcel>, 0.03F);
ScrapBox.addDrop(<forestry:chipsets:0>.withTag({T:0 as short}), 0.1F);
ScrapBox.addDrop(<forestry:chipsets:1>.withTag({T:1 as short}), 0.06F);
ScrapBox.addDrop(<forestry:chipsets:2>.withTag({T:2 as short}), 0.04F);
ScrapBox.addDrop(<forestry:chipsets:3>.withTag({T:3 as short}), 0.01F);

# Energy crystal compat
scripts.process.compress(<ic2:dust:6> * 9, <ic2:energy_crystal:27>, "except: compressor");

# Harder wooden box
craft.remake(<ic2:te:111>, ["pretty",
		"A B A",
		"B C B",
		"A B A"], {
	A: <ore:logWood>,
	B: <ore:plankWood>,
	C: <quark:iron_button>,
	});

# Construction foam
# Remove CF Powder but replace it with Building Gadget's powder
scripts.process.solution([<buildinggadgets:constructionpaste>], [<fluid:water> * 4000], [<fluid:ic2construction_foam> * 4000], null, "Except: highoven");

# [Solar Panel] from [Pulverized Coal][+3]
craft.remake(<ic2:te:8>, ["pretty",
  "◊ ◊ ◊",
  "□ © □",
  "□ B □"], {
  "□": <ore:plateIron>, # Iron Plate
  "B": <ore:circuitBasic>, # Electronic Circuit
  "©": <ore:dustCoal>, # Pulverized Coal
  "◊": <ore:gemLapis>, # Lapis Lazuli
});

# [Solar Panel] batch crafting
scripts.processUtils.avdRockXmlRecipeEx(
	"PrecisionAssembler", [
	<ore:plateIron> * 64,
	<ore:gemLapis> * 48,
	<ore:circuitBasic> * 16,
	<ore:dustCoal> * 16,
], null, [<ic2:te:8> * 16], null, {power: 120000, timeRequired: 100});
	
# Remove Recycler (replaced by Modular Machine)
recipes.remove(<ic2:te:48>);

# [Solar Helmet] from [Solar Panel][+2]
craft.remake(<ic2:solar_helmet>, ["pretty",
  "  I  ",
  "  2  ",
  "C C C"], {
  "2": <ore:ic2SolarPanel>, # Solar Panel
  "C": <ore:itemCopperCable>, # Insulated Copper Cable
  "I": <conarm:helmet_core>.withTag({Material: "iron"}), # Iron Helmet Core
});

# Crafts from ini file
for out, inp in {
	<advancedrocketry:productplate:1>: <ore:ingotTitaniumIridium>,
	<advancedrocketry:productplate>  : <ore:ingotTitaniumAluminide>,
	<immersiveengineering:metal:35>  : <ore:ingotUranium>,
	<libvulpes:productplate:3>       : <ore:ingotSilicon>,
	<libvulpes:productplate:7>       : <ore:ingotTitanium>,
	<redstonearsenal:material:128>   : <ore:ingotElectrumFlux>,
	<thermalfoundation:material:322> : <ore:ingotSilver>,
	<thermalfoundation:material:324> : <ore:ingotAluminum>,
	<thermalfoundation:material:325> : <ore:ingotNickel>,
	<thermalfoundation:material:326> : <ore:ingotPlatinum>,
	<thermalfoundation:material:327> : <ore:ingotIridium>,
	<thermalfoundation:material:328> : <ore:ingotMithril>,
	<thermalfoundation:material:353> : <ore:ingotElectrum>,
	<thermalfoundation:material:354> : <ore:ingotInvar>,
	<thermalfoundation:material:356> : <ore:ingotConstantan>,
	<thermalfoundation:material:357> : <ore:ingotSignalum>,
	<thermalfoundation:material:358> : <ore:ingotLumium>,
	<thermalfoundation:material:359> : <ore:ingotEnderium>,
} as IIngredient[IItemStack] {
	scripts.wrap.ic2.MetalFormer.addRollingRecipe(out, inp);
}

# Remake Dust compession recipes
function tinyDustFix(a as IItemStack, b as IItemStack) as void {
	recipes.addShapeless("Pack " ~ a.displayName, b, [a,a,a,a,a,a,a,a,a]);
}

tinyDustFix(<ic2:dust:19>, <thermalfoundation:material:64>);
tinyDustFix(<ic2:dust:20>, <thermalfoundation:material:1>);
tinyDustFix(<ic2:dust:22>, <ic2:dust:9>);
tinyDustFix(<ic2:dust:25>, <thermalfoundation:material:770>);
tinyDustFix(<ic2:dust:26>, <thermalfoundation:material:66>);
tinyDustFix(<ic2:dust:28>, <thermalfoundation:material:65>);

# Crystal memory crafts
function crystalRecipe(name as string, item as IItemStack, ingrs as IIngredient[]) {
	recipes.remove(item);
	recipes.addShapeless(name, <ic2:crystal_memory>.withTag({Pattern: {id: item.definition.id, Count: 1 as byte, Damage: item.damage as short}}), ingrs);
	scripts.category.tooltip_utils.desc.both(item, "crystal_memory");
}

crystalRecipe("[Shape Card] crystal", <rftools:shape_card>,      [<ore:circuitElite>, <immersiveengineering:blueprint>.withTag({blueprint: "molds"}), <ic2:crystal_memory>, <ore:paper>, <ore:paper>]);
crystalRecipe("[Base Addon] crystal", <teslacorelib:base_addon>, [<industrialforegoing:plastic>, <industrialforegoing:plastic>, <ic2:crystal_memory>, <ore:paper>, <ore:paper>]);

# [Replicator] from [Energium Ingot][+3]
craft.remake(<ic2:te:63>, ["pretty",
  "C ▬ C",
  "C ▬ C",
  "M M M"], {
  "C": <ic2:containment_plating>, # Containment Reactor Plating
  "▬": <ore:ingotEnergium>,       # Energium Ingot
  "M": <ic2:te:75>,   # MFSU
});

# [Heat-Capacity Reactor Plating] from [Dense Copper Plate][+1]
craft.reshapeless(<ic2:heat_plating>, "п□", {
  "□": <ore:plateDenseCopper>, # Dense Copper Plate
  "п": <ore:plateLead>,        # Lead Plate
});

# [Containment Reactor Plating] from [Lead Plate][+1]
craft.reshapeless(<ic2:containment_plating>, "п□□□", {
  "□": <ore:plateAdvancedAlloy>, # Advanced Alloy
  "п": <ore:plateLead>, # Lead Plate
});

# Reprocess plutonium
mods.nuclearcraft.decay_hastener.addRecipe([<ic2:nuclear:3>, <nuclearcraft:uranium:4>, 2.0, 2.0]);
mods.nuclearcraft.decay_hastener.addRecipe([<ic2:nuclear:7>, <nuclearcraft:uranium:6>, 2.0, 2.0]);

# Batch crafting recipe for reflector, skipping microcraftings
scripts.processUtils.avdRockXmlRecipeEx("PrecisionAssembler", [
	<ore:plateCopper> * 64, # Copper Plate
	<ore:dustTin> * 64,     # Pulverized Tin
	<ore:dustCoal> * 64,    # Pulverized Coal
	<ic2:crafting:4>,       # Iridium Reinforced Plate
], null,
	[<ic2:iridium_reflector>], null, {power: 160000, timeRequired: 80}
);

# [Quad Fuel Rod (Uranium)] from [Enriched Uranium Nuclear Fuel]*4[+1]
mods.cyclicmagic.Packager.addRecipe(<ic2:quad_uranium_fuel_rod>, [
	<ic2:nuclear> * 4,            # Enriched Uranium Nuclear Fuel
	<bigreactors:reactorfuelrod>, # Reactor Fuel Rod (Legacy)
]);

# [Quad Fuel Rod (MOX)] from [MOX Nuclear Fuel]*4[+1]
mods.cyclicmagic.Packager.addRecipe(<ic2:quad_mox_fuel_rod>, [
	<ic2:nuclear:4> * 4,          # MOX Nuclear Fuel
	<bigreactors:reactorfuelrod>, # Reactor Fuel Rod (Legacy)
]);

# Milk Powder
scripts.process.evaporate(<fluid:milk> * 250, <ic2:dust:33>, "No exceptions");
scripts.process.solution([<ic2:dust:33>], [<fluid:water> * 250], [<fluid:milk> * 250], null, "Except: highoven");

# Stone dust alt usage
furnace.addRecipe(<tconstruct:materials>, <ore:dustStone>);

# [Treated Wood Planks]*8 from [Creosote Bucket][+1]
craft.remake(<immersiveengineering:treated_wood> * 8, ["pretty",
  "# # #",
  "# ~ #",
  "# # #"], {
  "#": <ore:plankWood>, # Oak Wood Planks
  "~": Bucket("ic2creosote"), # Creosote Bucket
});
