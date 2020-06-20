import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;

#modloaded randomthings

# Ender bucket recipe change
recipes.remove(<randomthings:enderbucket>);
recipes.addShaped("ender_bucket1",
	<randomthings:enderbucket>,
	[[<minecraft:ender_pearl>],
	[<minecraft:bucket>]]);
recipes.addShaped("ender_bucket2",
	<randomthings:enderbucket>,
	[[<ore:plateIron>, <minecraft:ender_pearl>, <ore:plateIron>],
	[null, <ore:plateIron>, null]]);

# Blood stone from moon stone in Life Essense
mods.inworldcrafting.FluidToItem.transform(<randomthings:rezstone>, <fluid:lifeessence>, [<extrautils2:ingredients:5>]);

# Precious emerald from emerald in blueslime
mods.inworldcrafting.FluidToItem.transform(<randomthings:ingredient:9>, <fluid:blueslime>, [<ore:oreEmerald>]);

# Floo dust
remakeEx(<randomthings:ingredient:7>*8, [
	[<ore:enderpearl>, <ore:alloyBasic>, null], 
	[<ore:gunpowder>, <ore:cropBean>, null]
]);
recipes.addShaped("Floo Dust 64", <randomthings:ingredient:7>*64, [
	[<appliedenergistics2:material:46>, <ore:alloyBasic>, null], 
	[<ore:gunpowder>, <ore:cropBean>, null]
]);

# Lubricient
remakeEx(<randomthings:ingredient:6> * 4, [
	[<minecraft:wheat_seeds>, <minecraft:potion>.withTag({Potion: "minecraft:water"})], 
	[null, <ore:cropBean>]
	]);


# Ender book
recipes.remove(<cyclicmagic:book_ender>);
recipes.addShaped(<cyclicmagic:book_ender>, [
	[<randomthings:flootoken>, <rats:ratlantean_flame>, <randomthings:flootoken>], 
	[<randomthings:flootoken>, <minecraft:book>, <randomthings:flootoken>], 
	[<randomthings:flootoken>, <randomthings:flootoken>, <randomthings:flootoken>]
]);

# Time in bottle
remake("randomthings_timeinabottle", <randomthings:timeinabottle>, [
	[null, <animania:milk_bottle>, null], 
	[<rats:little_black_squash_balls>, <minecraft:clock>, <rats:little_black_squash_balls>], 
	[<animania:milk_bottle>, <extrautils2:klein>, <animania:milk_bottle>]
]);

# Illuminator
recipes.remove(<randomthings:spectreilluminator>);
recipes.addShaped(<randomthings:spectreilluminator>, [
	[null, <randomthings:ingredient:2>, null],
	[<randomthings:ingredient:2>, <extrautils2:suncrystal>, <randomthings:ingredient:2>],
	[null, <randomthings:ingredient:2>, null]]);

# Energy Injector
recipes.remove(<randomthings:spectreenergyinjector>);
recipes.addShaped(<randomthings:spectreenergyinjector>, [
	[<ic2:glass>, <ic2:glass>, <ic2:glass>],
	[<ic2:glass>, <thermalexpansion:frame:128>, <ic2:glass>],
	[<randomthings:ingredient:3>, <ore:plateDenseObsidian>, <randomthings:ingredient:3>]]);

# Spectre Key
val ectoplasm = <randomthings:ingredient:2>;
recipes.remove(<randomthings:spectrekey>);
mods.actuallyadditions.Empowerer.addRecipe(<randomthings:spectrekey>, 
	<storagedrawers:shroud_key>, ectoplasm, ectoplasm, ectoplasm, ectoplasm,
	25000, 100, [1.0, 0.0, 0.0]);
mods.extendedcrafting.CombinationCrafting.addRecipe(<randomthings:spectrekey>, 100000, 1000000, 
	<storagedrawers:shroud_key>, [ectoplasm, ectoplasm, ectoplasm, ectoplasm]);

# Spectre Anchor
recipes.remove(<randomthings:spectreanchor>);
recipes.addShaped(<randomthings:spectreanchor>, [
	[<randomthings:ingredient:2>],
	[<tombmanygraves:death_list>],
	[<randomthings:rezstone>]]);

# Spectre Ingot
recipes.remove(<randomthings:ingredient:3>);
scripts.process.alloy([
	<ore:ingotUnstable>,
	<randomthings:ingredient:2>,
	<thermalfoundation:material:134>
	] as IItemStack[], <randomthings:ingredient:3>, "No exceptions");

# Spectre Coil normal
recipes.remove(<randomthings:spectrecoil_normal>);

# Any rod
recipes.addShaped(<randomthings:spectrecoil_normal>, [
	[<ore:plateObsidian>, <randomthings:ingredient:12>, <ore:plateObsidian>],
	[<randomthings:ingredient:12>, <immersiveengineering:graphite_electrode>, <randomthings:ingredient:12>],
	[<ore:plateObsidian>, <randomthings:ingredient:3>, <ore:plateObsidian>]]);

# Spectre Coil redstone
recipes.remove(<randomthings:spectrecoil_redstone>);
recipes.addShaped(<randomthings:spectrecoil_redstone>, [
	[<ore:plateObsidian>, <randomthings:spectrecoil_normal>, <ore:plateObsidian>],
	[<actuallyadditions:item_crystal_empowered>, <immersiveengineering:graphite_electrode>.anyDamage(), <actuallyadditions:item_crystal_empowered>],
	[<ore:plateObsidian>, <randomthings:spectrecoil_normal>, <ore:plateObsidian>]]);

# Spectre Coil ender
recipes.remove(<randomthings:spectrecoil_ender>);
recipes.addShaped(<randomthings:spectrecoil_ender>, [
	[<ore:plateDenseObsidian>, <randomthings:spectrecoil_redstone>, <ore:plateDenseObsidian>],
	[<rftools:infused_enderpearl>, <immersiveengineering:graphite_electrode>.anyDamage(), <rftools:infused_enderpearl>],
	[<ore:plateDenseObsidian>, <randomthings:spectrecoil_redstone>, <ore:plateDenseObsidian>]]);


# Spectre Charger Tier 1
recipes.remove(<randomthings:spectrecharger>);
recipes.addShaped(<randomthings:spectrecharger>, [
	[<deepmoblearning:soot_covered_plate>, <enderio:block_electric_light>, <deepmoblearning:soot_covered_plate>],
	[<randomthings:ingredient:3>, <extrautils2:powertransmitter>, <randomthings:ingredient:3>]]);

# Spectre Charger Tier 2
recipes.remove(<randomthings:spectrecharger:1>);
recipes.addShaped(<randomthings:spectrecharger:1>, [
	[<deepmoblearning:soot_covered_plate>, <randomthings:spectrecharger>, <deepmoblearning:soot_covered_plate>],
	[<ore:ingotRedstoneAlloy>, <randomthings:spectrecharger>, <ore:ingotRedstoneAlloy>]]);

# Spectre Charger Tier 3
recipes.remove(<randomthings:spectrecharger:2>);
recipes.addShaped(<randomthings:spectrecharger:2>, [
	[<deepmoblearning:soot_covered_plate>, <randomthings:spectrecharger:1>, <deepmoblearning:soot_covered_plate>],
	[<ore:itemEnderCrystalPowder>, <randomthings:spectrecharger:1>, <ore:itemEnderCrystalPowder>]]);

# Spectre Lens
recipes.remove(<randomthings:spectrelens>);
recipes.addShaped(<randomthings:spectrelens>, [
	[<randomthings:ingredient:3>, <avaritia:resource>, <randomthings:ingredient:3>],
	[<ore:crystalLitherite>, <advancedrocketry:blocklens>, <ore:crystalLitherite>],
	[<randomthings:ingredient:3>, <avaritia:resource>, <randomthings:ingredient:3>]]);
