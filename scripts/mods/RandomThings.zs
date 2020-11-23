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
mods.inworldcrafting.FluidToItem.transform(<randomthings:ingredient:9> * 2, <fluid:blueslime>, [<ore:oreEmerald>]);

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
craft.reshapeless(<randomthings:ingredient:6> * 4, 'ABC', {
	A: <minecraft:wheat_seeds>,
	B: <minecraft:potion>.withTag({Potion: "minecraft:water"}),
	C: <ore:cropBean>,
	});

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
scripts.wrap.actuallyadditions.Empowerer.addRecipe(<randomthings:spectrekey>, 
	<storagedrawers:shroud_key>, ectoplasm, ectoplasm, ectoplasm, ectoplasm,
	25000, 100, [1.0, 0.0, 0.0]);
scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<randomthings:spectrekey>, 100000, 1000000, 
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
mods.rt.RandomThingsTweaker.addImbuingRecipe(
	<thermalfoundation:material:134>, 
	<extrautils2:unstableingots>, 
	<forestry:phosphor>, 
	<randomthings:ingredient:2>, 
	<randomthings:ingredient:3>
);

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

# Make saplings with MA essence
recipes.addShaped("Spectre Saplings", <randomthings:spectresapling> * 10, [
	[null, <mysticalagriculture:nature_essence>, null],
	[<mysticalagriculture:wood_essence>, <randomthings:ingredient:2>, <mysticalagriculture:wood_essence>],
	[null, <mysticalagriculture:nature_essence>, null]]);

# Oxygen bottle
scripts.wrap.thermalexpansion.Transposer.addFillRecipe(<randomthings:bottleofair>, <minecraft:glass_bottle>, <liquid:oxygen> * 1000, 25000);

# Lesser Magic Bean
craft.remake(<randomthings:beans:1>, ["pretty",
	"x x x",
	"x O x",
	"x x x"], {
	x: <ore:blockGold>,
	O: <ore:cropBean>,
});

# Player Interface (used Nether Star)
craft.remake(<randomthings:playerinterface>, ["pretty",
	"B A B",
	"B O B",
	"B C B"], {
	A: <cyclicmagic:ender_eye_orb>,
	C: <randomthings:ingredient:9>,
	O: <enderstorage:ender_storage>,
	B: <fluxnetworks:flux>,
});


# Slime cube simplify (used Nether Star)
craft.remake(<randomthings:slimecube>, ["pretty",
	"B B B",
	"B A B",
	"B B B"], {
	A: <ore:blockKnightslime>,
	B: <ore:slimecrystalGreen>,
});

# Imbuer
craft.remake(<randomthings:imbuingstation>, ["pretty",
	"A B A",
	"C D C",
	"A E A"], {
	A: <forestry:wood_pile>,
	B: <minecraft:water_bucket>,
	C: <ore:dustHydratedCoal>,
	D: <tconstruct:materials:18>,
	E: <rats:raw_plastic>,
});