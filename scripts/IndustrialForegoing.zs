import crafttweaker.item.IItemStack;
import mods.industrialforegoing.LaserDrill;
import mods.industrialforegoing.BioReactor;
#modloaded industrialforegoing teslacorelib
print("--- loading IndustrialForegoing.zs ---");

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
	[<teslacorelib:machine_case>, <botania:blackholetalisman>, <teslacorelib:machine_case>], 
	[<mekanism:plasticblock:8>, <mekanism:machineblock2:11>.withTag({tier: 3, mekData:{}})|<mekanism:machineblock2:11>.withTag({tier: 3, mekData:{security:0}}), <mekanism:plasticblock:8>]]);

# Black Hole Unit
	recipes.remove(<industrialforegoing:black_hole_unit>);
	recipes.addShapedMirrored("Black Hole Unit", <industrialforegoing:black_hole_unit>, 
	[[<ore:itemRubber>, <actuallyadditions:item_crystal_empowered:3>, <ore:itemRubber>],
	[<teslacorelib:machine_case>, <botania:blackholetalisman>, <teslacorelib:machine_case>], 
	[<mekanism:plasticblock:8>, <mekanism:basicblock:6>.withTag({tier: 3})|<mekanism:basicblock:6>.withTag({tier: 3, mekData: {itemCount: 0}}), <mekanism:plasticblock:8>]]);

# Black Hole Controller
	recipes.remove(<industrialforegoing:black_hole_controller>);
	recipes.addShapedMirrored("Black Hole Controller", <industrialforegoing:black_hole_controller>, 
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

/* Deprecated, now handled by configs

//LaserDrill.remove(IItemStack output);
	LaserDrill.remove(<thermalfoundation:ore:4>);
	LaserDrill.remove(<draconicevolution:draconium_ore>);
	LaserDrill.remove(<bigreactors:brore>);
	LaserDrill.remove(<exnihilocreatio:item_ore_cobalt:1>);
	LaserDrill.remove(<exnihilocreatio:item_ore_ardite:1>);
	LaserDrill.remove(<thermalfoundation:ore_fluid:2>);
	LaserDrill.remove(<thermalfoundation:ore_fluid:3>);
	LaserDrill.remove(<thermalfoundation:ore_fluid:4>);
	LaserDrill.remove(<mysticalagriculture:prosperity_ore>);
	LaserDrill.remove(<rftools:dimensional_shard_ore:1>);
	LaserDrill.remove(<rftools:dimensional_shard_ore:2>);

	LaserDrill.add(12, <immersiveengineering:ore:1>, 10);
	LaserDrill.add(11, <tconstruct:ore>, 3);
	LaserDrill.add(4, <tconstruct:ore:1>, 3);
*/
	
# *======= BioReactor =======*

//BioReactor.add(IItemStack input);
#BioReactor.add(<minecraft:diamond>);

//BioReactor.remove(IItemStack input);
#BioReactor.remove(<minecraft:diamond>);

# *======= Laser Drill =======*

//LaserDrill.add(int itemLensMetaColor, IItemStack output, int ItemWeight);
#LaserDrill.add(1, <minecraft:stone>, 10);

//LaserDrill.remove(IItemStack output);
#LaserDrill.remove(<minecraft:stone>);

# *======= Sludge Refiner =======*

//SludgeRefiner.add(IItemStack output, int ItemWeight);
#SludgeRefiner.add(<minecraft:wheat_seeds>, 10);

//SludgeRefiner.remove(IItemStack output);
#SludgeRefiner.remove(<minecraft:wheat_seeds>);

	print("--- IndustrialForegoing.zs initialized ---");
