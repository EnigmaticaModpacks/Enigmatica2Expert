import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.industrialforegoing.BioReactor;
import mods.industrialforegoing.ProteinReactor;
import mods.industrialforegoing.FluidDictionary;
#modloaded industrialforegoing teslacorelib


function fluidDict(ins as string[]) {
	for one in ins {
		for two in ins {
			if(one != two) {
				FluidDictionary.add(one, two, 1);
			}
		}
	}
}

# FluidDictionary Recipes
	FluidDictionary.add("seed.oil", "seed_oil", 1);
	FluidDictionary.add("seed_oil", "seed.oil", 1);

	FluidDictionary.add("sulfuric_acid", "sulfuricacid", 1);
	FluidDictionary.add("sulfuricacid", "sulfuric_acid", 1);

	FluidDictionary.add("ic2hydrogen", "hydrogen", 1);

	var hydrogen = [
		"hydrogen",
		"liquidhydrogen",
		"ic2hydrogen"
	] as string[];

	var honey = [
		"animania_honey",
		"for.honey",
		"honey"
	] as string[];

	fluidDict(hydrogen);
	fluidDict(honey);

	fluidDict(["ic2milk", "milk"]);
	fluidDict(["if.protein", "protein"]);

# Protein Reactor, additional entires
	for item in <ore:listAllmeatraw>.items {
		ProteinReactor.add(item);
	}
	
# BioReactor, additional entries
	val otherCrops = [
		<harvestcraft:breadfruititem>,
		<harvestcraft:mustardseedsitem>,
		<harvestcraft:spiceleafitem>,
		<harvestcraft:gingeritem>,
		<harvestcraft:garlicitem>,
		<harvestcraft:peanutitem>,
		<harvestcraft:oatsitem>,
		<harvestcraft:barleyitem>,
		<harvestcraft:chilipepperitem>,
		<harvestcraft:pecanitem>,
		<harvestcraft:pistachioitem>,
		<harvestcraft:almonditem>,
		<harvestcraft:kenafitem>,
		<harvestcraft:milletitem>,
		<harvestcraft:cashewitem>,
		<harvestcraft:sisalitem>,
		<harvestcraft:quinoaitem>,
		<harvestcraft:juteitem>,
		<harvestcraft:flaxitem>,
		<harvestcraft:amaranthitem>,
		<harvestcraft:kaleitem>,
		<harvestcraft:chestnutitem>,
		<harvestcraft:walnutitem>
	] as IItemStack[];

	for crop in otherCrops {
		BioReactor.add(crop);
	}

    for seed in <ore:listAllseed>.items {
        BioReactor.add(seed);
    }
	
	for veggie in <ore:listAllveggie>.items {
		BioReactor.add(veggie);
	}
	
	for fruit in <ore:listAllfruit>.items {
		BioReactor.add(fruit);
	}

# Diamond Gear
	scripts.wrap.immersiveengineering.MetalPress.addRecipe(<thermalfoundation:material:26>, <minecraft:diamond>, <immersiveengineering:mold:1>, 10000, 4);

# Black Hole Tank
	recipes.removeByRecipeName("industrialforegoing:black_hole_tank");
	recipes.addShapedMirrored("Black Hole Tank", <industrialforegoing:black_hole_tank>, 
	[[<ore:sheetSteel>, <mekanism:plasticblock:8>, <ore:sheetSteel>],
	[<extrautils2:drum:3>, <botania:blackholetalisman>.reuse(), <extrautils2:drum:3>], 
	[<ore:sheetSteel>, <mekanism:plasticblock:8>, <ore:sheetSteel>]]);

# Black Hole Unit
	recipes.remove(<industrialforegoing:black_hole_unit>);
	recipes.addShapedMirrored("Black Hole Unit", <industrialforegoing:black_hole_unit>, 
	[[<ore:itemRubber>, <actuallyadditions:item_crystal_empowered:3>, <ore:itemRubber>],
	[<teslacorelib:machine_case>, <botania:blackholetalisman>.reuse(), <teslacorelib:machine_case>], 
	[<mekanism:plasticblock:8>, <mekanism:basicblock:6>.withTag({tier: 3})|<mekanism:basicblock:6>.withTag({tier: 3, mekData: {itemCount: 0}}), <mekanism:plasticblock:8>]]);

# Black Hole Controller
	recipes.remove(<industrialforegoing:black_hole_controller_reworked>);
	recipes.addShapedMirrored("Black Hole Controller", <industrialforegoing:black_hole_controller_reworked>, 
	[[<ore:itemRubber>, <actuallyadditions:block_crystal_empowered:3>, <ore:itemRubber>],
	[<advancedrocketry:ic:3>, <storagedrawers:controller>, <advancedrocketry:ic:3>], 
	[<mekanism:plasticblock:8>, <mekanism:plasticblock:8>, <mekanism:plasticblock:8>]]);
	
# Machine Case
	recipes.remove(<teslacorelib:machine_case>);
	recipes.addShaped("Tesla Core Lib Machine Case",
	<teslacorelib:machine_case>, 
	[[<ic2:resource:11>, <ore:itemRubber>, <ic2:resource:11>],
	[<ore:itemRubber>, <ic2:resource:13>, <ore:itemRubber>], 
	[<ic2:resource:11>, <ore:itemRubber>, <ic2:resource:11>]]);
	
# Mob Duplicator
	recipes.remove(<industrialforegoing:mob_duplicator>);
	recipes.addShapedMirrored("Mob Duplicator", 
	<industrialforegoing:mob_duplicator>, 
	[[<ore:itemRubber>, <ore:itemRubber>, <ore:itemRubber>],
	[<exnihilocreatio:item_doll>, <teslacorelib:machine_case>, <exnihilocreatio:item_doll:1>], 
	[<ore:blockEmerald>, <thermalexpansion:frame:147>, <ore:blockEmerald>]]);

# Mob Imprisonment Tool
#	recipes.remove(<industrialforegoing:mob_imprisonment_tool>);
#	recipes.addShaped("Mob Imprisonment Tool",
#	<industrialforegoing:mob_imprisonment_tool>, 
#	[[<ore:itemRubber>, <ore:enderpearl>, <ore:itemRubber>],
#	[<ore:enderpearl>, <minecraft:ghast_tear>, <ore:enderpearl>], 
#	[<ore:itemRubber>, <ore:enderpearl>, <ore:itemRubber>]]);

# Laser Drill
	recipes.remove(<industrialforegoing:laser_drill>);
	recipes.addShaped("Laser Drill",
	<industrialforegoing:laser_drill>, 
	[[<ore:itemRubber>, <ore:blockRefinedGlowstone>, <ore:itemRubber>],
	[<ic2:glass>, <thermalexpansion:frame>, <ic2:glass>], 
	[<ore:gearDiamond>, <mekanismgenerators:reactorglass:1>, <ore:gearDiamond>]]);

# Laser Base
	recipes.remove(<industrialforegoing:laser_base>);
	recipes.addShaped("Laser Base",
	<industrialforegoing:laser_base>, 
	[[<ore:itemRubber>, <ore:blockRefinedGlowstone>, <ore:itemRubber>],
	[<ore:plateDenseGold>, <thermalexpansion:frame>, <ore:plateDenseGold>], 
	[<ore:gearDiamond>, <ore:blockOsmiridium>, <ore:gearDiamond>]]);

# Simplify Converter Recipes
	recipes.remove(<industrialforegoing:oredictionary_converter>);
	recipes.addShaped("Industrialforegoing Oredictionary Converter",
	<industrialforegoing:oredictionary_converter>, 
	[[<ore:itemRubber>, <ore:itemRubber>, <ore:itemRubber>], 
	[<ore:itemRubber>, <ore:oreIron>, <ore:itemRubber>], 
	[<ore:nuggetFakeIron>, <ore:ingotFakeIron>, <ore:blockFakeIron>]]);
	
	recipes.remove(<industrialforegoing:fluiddictionary_converter>);
	recipes.addShaped("Industrialforegoing Fluiddictionary Converter",
	<industrialforegoing:fluiddictionary_converter>,
	[[<ore:itemRubber>, <ore:itemRubber>, <ore:itemRubber>], 
	[<ore:blockGlass>, <ore:oreIron>, <ore:blockGlass>], 
	[<flopper:flopper>, <ore:gearIron>, <flopper:flopper>]]);

# Oredict Belts Recipes
# [White Conveyor Belt*32] from [Redstone][+2]
craft.remake(<industrialforegoing:conveyor> * 32, ["pretty",
  "R R R",
  "▬ ♥ ▬",
  "R R R"], {
  "R": <ore:itemRubber>, # Plastic
  "♥": <ore:dustRedstone>, # Redstone
  "▬": <ore:ingotFakeIron>, # Iron Alloy Ingot
  remove: <industrialforegoing:conveyor> * 4, # White Conveyor Belt
});

	recipes.remove(<industrialforegoing:conveyor_upgrade>);
	recipes.addShaped(<industrialforegoing:conveyor_upgrade>, [
		[<ore:ingotFakeIron>, <ore:itemRubber>, <ore:ingotFakeIron>], 
		[<ore:ingotFakeIron>, <minecraft:dispenser>, <ore:ingotFakeIron>], 
		[<ore:ingotFakeIron>, <industrialforegoing:conveyor:*>, <ore:ingotFakeIron>]]);
	recipes.remove(<industrialforegoing:conveyor_upgrade:1>);
	
	recipes.addShaped(<industrialforegoing:conveyor_upgrade:1>, [
		[<ore:ingotFakeIron>, <ore:itemRubber>, <ore:ingotFakeIron>], 
		[<ore:ingotFakeIron>, <minecraft:hopper>, <ore:ingotFakeIron>], 
		[<ore:ingotFakeIron>, <industrialforegoing:conveyor:*>, <ore:ingotFakeIron>]]);


# mob_imprisonment_tool
recipes.remove(<industrialforegoing:mob_imprisonment_tool>);
recipes.addShaped(<industrialforegoing:mob_imprisonment_tool>, [
	[<ic2:sheet:1>, <ic2:sheet:1>, <ic2:sheet:1>],
	[<mekanism:plasticblock:*>, <quark:soul_powder>, <mekanism:plasticblock:*>], 
	[<ic2:sheet:1>, <ic2:sheet:1>, <ic2:sheet:1>]
]);

# [Mob Slaughter Factory] from [Machine Case][+4]
craft.remake(<industrialforegoing:mob_slaughter_factory>, ["pretty",
  "R T R",
  "F M F",
  "R □ R"], {
  "□": <ore:plateIridium>,
  "R": <ore:itemRubber>,                       # Plastic
  "T": <immersiveengineering:metal_device1:8>, # Tesla Coil
  "F": <redstonearsenal:material:224>,         # Fluxed Armor Plating
  "M": <teslacorelib:machine_case>,            # Machine Case
});

remake("Mob Crusher",   <industrialforegoing:mob_relocator>, [
	[<ore:itemRubber>, <redstonearsenal:tool.sword_flux>.anyDamage(), <ore:itemRubber>],
	[<randomthings:imbue:2>, <teslacorelib:machine_case>, <randomthings:imbue:2>],
	[<ore:gearGold>, <extrautils2:user>, <ore:gearGold>]]);

# More sludge outputs
scripts.wrap.industrialforegoing.SludgeRefiner.add(<rustic:fertile_soil>, 10);
scripts.wrap.industrialforegoing.SludgeRefiner.add(<thermalfoundation:material:816>, 10);
scripts.wrap.industrialforegoing.SludgeRefiner.add(<forestry:fertilizer_bio>, 10);
scripts.wrap.industrialforegoing.SludgeRefiner.add(<forestry:mulch>, 10);
scripts.wrap.industrialforegoing.SludgeRefiner.add(<thaumcraft:nugget:10>, 10);

# Fluid Extractor
scripts.wrap.industrialforegoing.Extractor.add(<integrateddynamics:menril_log>, <fluid:menrilresin> * 5);

# Stackable black hole tanks
<industrialforegoing:black_hole_unit>.maxStackSize = 64;
<industrialforegoing:black_hole_tank>.maxStackSize = 64;

# Harder as being best tree chopping magic box
# [Plant Gatherer] from [Machine Case][+4]
craft.remake(<industrialforegoing:crop_recolector>, ["pretty",
  "R ~ R",
  "□ M □",
  "R E R"], {
  "□": <ic2:block_cutting_blade:2>, # Block Cutting Blade (Diamond)
  "R": <ore:itemRubber>,            # Plastic
  "E": <ore:gearElectrumFlux>,      # Fluxed Electrum Gear
  "M": <teslacorelib:machine_case>, # Machine Case
  "~": Bucket("if.protein"), # Protein Bucket
});

# Remake IF addons to being much harder at huge (+12) ranges
for i, oreName in [
	"FakeIron",
	"Lead",
	"Osmium",
	"Invar",
	"Ardite",
	"RefinedGlowstone",
	"ElectricalSteel",
	"ElectrumFlux",
	"EssenceMetal",
	"Enderium",
	"Osmiridium",
	"Mirion",
] as string[] {
	val currentAddon = <industrialforegoing:range_addon>.definition.makeStack(i);

	# Main crafting method
	craft.remake(currentAddon, ["pretty",
		"▬ R ▬",
		"▬ □ ▬",
		"▬ R ▬"], {
		"□": <integratedterminals:menril_glass>,
		"R": <ore:itemRubber>,     # Plastic
		"▬": oreDict.get("ingot" ~ oreName),
	});

	if(i==0) continue;
	# Upgrade is 9x times cheaper
	craft.make(currentAddon, ["pretty",
		"▬ R ▬",
		"▬ □ ▬",
		"▬ R ▬"], {
		"□": <industrialforegoing:range_addon>.definition.makeStack(i - 1),
		"R": <ore:itemRubber>,     # Plastic
		"▬": oreDict.get("nugget" ~ oreName),
	});
}