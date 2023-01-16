import crafttweaker.item.IItemStack;
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
		"for.honey",
		"honey"
	] as string[];

	var oxygen = [
		"oxygen",
		"liquidoxygen",
		"ic2oxygen"
	] as string[];

	fluidDict(hydrogen);
	fluidDict(honey);
	fluidDict(oxygen);

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
	mods.immersiveengineering.MetalPress.addRecipe(<thermalfoundation:material:26>, <minecraft:diamond>, <immersiveengineering:mold:1>, 10000, 4);

# Black Hole Tank
	recipes.remove(<industrialforegoing:black_hole_tank>);
	recipes.addShapedMirrored("Black Hole Tank", <industrialforegoing:black_hole_tank>, 
	[[<ore:itemRubber>, <actuallyadditions:item_crystal_empowered:3>, <ore:itemRubber>],
	[<teslacorelib:machine_case>, <botania:blackholetalisman>.reuse(), <teslacorelib:machine_case>], 
	[<mekanism:plasticblock:8>, <mekanism:machineblock2:11>.withTag({tier: 3})|<mekanism:machineblock2:11>.withTag({tier: 3, mekData:{}})|<mekanism:machineblock2:11>.withTag({tier: 3, mekData:{security:0}}), <mekanism:plasticblock:8>]]);

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
	recipes.remove(<industrialforegoing:mob_imprisonment_tool>);
	recipes.addShaped("Mob Imprisonment Tool",
	<industrialforegoing:mob_imprisonment_tool>, 
	[[<ore:itemRubber>, <ore:enderpearl>, <ore:itemRubber>],
	[<ore:enderpearl>, <minecraft:ghast_tear>, <ore:enderpearl>], 
	[<ore:itemRubber>, <ore:enderpearl>, <ore:itemRubber>]]);

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
	[<ore:nuggetIron>, <ore:ingotIron>, <ore:blockIron>]]);
	
	recipes.remove(<industrialforegoing:fluiddictionary_converter>);
	recipes.addShaped("Industrialforegoing Fluiddictionary Converter",
	<industrialforegoing:fluiddictionary_converter>,
	[[<ore:itemRubber>, <ore:itemRubber>, <ore:itemRubber>], 
	[<ore:blockGlass>, <ore:oreIron>, <ore:blockGlass>], 
	[<minecraft:bucket>, <ore:gearIron>, <minecraft:bucket>]]);


# Oredict Belts Recipes
	recipes.remove(<industrialforegoing:conveyor>);
	recipes.addShaped(<industrialforegoing:conveyor> * 4, [
		[<ore:itemRubber>, <ore:itemRubber>, <ore:itemRubber>], 
		[<ore:ingotIron>, <minecraft:redstone>, <ore:ingotIron>], 
		[<ore:itemRubber>, <ore:itemRubber>, <ore:itemRubber>]]);

	recipes.remove(<industrialforegoing:conveyor_upgrade>);
	recipes.addShaped(<industrialforegoing:conveyor_upgrade>, [
		[<ore:ingotIron>, <ore:itemRubber>, <ore:ingotIron>], 
		[<ore:ingotIron>, <minecraft:dispenser>, <ore:ingotIron>], 
		[<ore:ingotIron>, <industrialforegoing:conveyor:*>, <ore:ingotIron>]]);
	recipes.remove(<industrialforegoing:conveyor_upgrade:1>);
	
	recipes.addShaped(<industrialforegoing:conveyor_upgrade:1>, [
		[<ore:ingotIron>, <ore:itemRubber>, <ore:ingotIron>], 
		[<ore:ingotIron>, <minecraft:hopper>, <ore:ingotIron>], 
		[<ore:ingotIron>, <industrialforegoing:conveyor:*>, <ore:ingotIron>]]);

# More sludge outputs
mods.industrialforegoing.SludgeRefiner.add(<rustic:fertile_soil>, 10);
mods.industrialforegoing.SludgeRefiner.add(<thermalfoundation:material:816>, 10);
mods.industrialforegoing.SludgeRefiner.add(<forestry:fertilizer_bio>, 10);
mods.industrialforegoing.SludgeRefiner.add(<forestry:mulch>, 10);
mods.industrialforegoing.SludgeRefiner.add(<thaumcraft:nugget:10>, 10);


# Stackable black hole tanks
<industrialforegoing:black_hole_unit>.maxStackSize = 64;
<industrialforegoing:black_hole_tank>.maxStackSize = 64;
