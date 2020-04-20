import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;

#modloaded randomthings

	val itemsToRemove = [
	
	<randomthings:blockbreaker>,
	<randomthings:spectreblock>,
	<randomthings:spectrelens>,
	<randomthings:spectreenergyinjector>,
	<randomthings:spectrecoil_normal>,
	<randomthings:spectrecoil_redstone>,
	<randomthings:spectrecoil_ender>,
	<randomthings:spectrecoil_number>,
	<randomthings:spectrecoil_genesis>,
	<randomthings:spectreplank>,
	<randomthings:spectresapling>,
	<randomthings:spectrelog>,
	<randomthings:spectreleaf>,
	<randomthings:ingredient:3>,
	<randomthings:ingredient:12>,
	<randomthings:spectrekey>,
	<randomthings:spectreanchor>,
	<randomthings:spectresword>,
	<randomthings:spectrepickaxe>,
	<randomthings:spectreaxe>,
	<randomthings:spectreshovel>

	] as IItemStack[];
	
for item in itemsToRemove {
	rh(item);
}

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
fti(<randomthings:rezstone>, <fluid:lifeessence>, <extrautils2:ingredients:5>);

# Precious emerald from emerald in blueslime
fti(<randomthings:ingredient:9>, <fluid:blueslime>, <ore:oreEmerald>);

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