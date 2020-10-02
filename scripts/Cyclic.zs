import mods.jei.JEI.removeAndHide as rh;
#modloaded cyclicmagic

# Removing Obsidian -> Lava
mods.cyclicmagic.Melter.removeShapedRecipe("lava", 1000);

# Removing Simple Block Miner
	rh(<cyclicmagic:block_miner>);
	
# User
	recipes.remove(<cyclicmagic:block_user>);
	recipes.addShapedMirrored("Cyclic User", 
	<cyclicmagic:block_user>, 
	[[<ore:ingotGold>, <ore:ingotRefinedObsidian>, <ore:ingotGold>],
	[<minecraft:golden_pickaxe>, <computercraft:turtle_expanded>, <minecraft:golden_axe>], 
	[<ore:compressed2xCobblestone>, <ore:compressed2xCobblestone>, <ore:compressed2xCobblestone>]]);
	recipes.addShapeless("Cyclic User2", 
	<cyclicmagic:block_user> * 2, 
	[<integratedtunnels:part_player_simulator_item>.anyDamage(), <integratedtunnels:part_player_simulator_item>.anyDamage()]);

# Redstone Clock
	recipes.remove(<cyclicmagic:clock>);
	recipes.addShapedMirrored("Cyclic Redstone Clock", 
	<cyclicmagic:clock>, 
	[[<ore:ingotIron>, <ore:circuitAdvanced>, <ore:ingotIron>],
	[<ore:circuitBasic>, <extrautils2:redstoneclock>, <ore:circuitBasic>], 
	[<ore:ingotIron>, <ore:circuitAdvanced>, <ore:ingotIron>]]);

# Fluid Storage Tank
	recipes.remove(<cyclicmagic:block_storeempty>);
	recipes.addShapedMirrored("Cyclic Fluid Storage Tank", 
	<cyclicmagic:block_storeempty>, 
	[[<ore:plateAluminium>, <ore:blockGlass>, <ore:plateAluminium>],
	[<ore:blockGlass>, <thermalexpansion:tank>.anyDamage(), <ore:blockGlass>], 
	[<ore:plateAluminium>, <ore:blockGlass>, <ore:plateAluminium>]]);

# Charms
	recipes.remove(<cyclicmagic:charm_air>);
	recipes.addShapedMirrored("Air Charm", 
	<cyclicmagic:charm_air>, 
	[[<actuallyadditions:item_misc:15>, <bloodmagic:slate:2>, <actuallyadditions:item_misc:15>],
	[<openblocks:generic>, <extrautils2:goldenlasso>.withTag({Animal:{id:"minecraft:bat"}}), <openblocks:generic>],
	[<actuallyadditions:item_misc:15>, <bloodmagic:slate:2>, <actuallyadditions:item_misc:15>]]);
	
	recipes.remove(<cyclicmagic:charm_fire>);
	recipes.addShapedMirrored("Fire Charm", 
	<cyclicmagic:charm_fire>, 
	[[<tconstruct:edible:34>, <minecraft:potion>.withTag({Potion: "minecraft:fire_resistance"}), <tconstruct:edible:34>],
	[<ore:powderBlaze>, <extrautils2:goldenlasso:1>.withTag({Animal:{id:"minecraft:blaze"}}), <ore:powderBlaze>], 
	[<tconstruct:edible:34>, <minecraft:potion>.withTag({Potion: "minecraft:fire_resistance"}), <tconstruct:edible:34>]]);

	recipes.remove(<cyclicmagic:charm_boat>);
	recipes.addShapedMirrored("Sailor Charm", 
	<cyclicmagic:charm_boat>, 
	[[<ore:listAllsugar>, <ore:listAllsugar>, <ore:listAllsugar>],
	[<ore:boat>, <extrautils2:goldenlasso:1>, <ore:boat>], 
	[<ore:listAllsugar>, <ore:listAllsugar>, <ore:listAllsugar>]]);
	
	recipes.remove(<cyclicmagic:charm_void>);
	recipes.addShapedMirrored("Void Charm", 
	<cyclicmagic:charm_void>, 
	[[<ore:bEnderAirBottle>, <cyclicmagic:ender_eye_orb>, <ore:bEnderAirBottle>],
	[<cyclicmagic:ender_eye_orb>, <extrautils2:goldenlasso:1>.withTag({Animal:{id:"minecraft:enderman"}}), <cyclicmagic:ender_eye_orb>], 
	[<ore:bEnderAirBottle>, <cyclicmagic:ender_eye_orb>, <ore:bEnderAirBottle>]]);
	
	recipes.remove(<cyclicmagic:charm_water>);
	recipes.addShapedMirrored("Water Charm", 
	<cyclicmagic:charm_water>, 
	[[<minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>],
	[<mekanism:gastank>, <extrautils2:goldenlasso>.withTag({Animal:{id:"minecraft:squid"}}), <mekanism:gastank>], 
	[<minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>]]);
	
	recipes.remove(<cyclicmagic:charm_antidote>);
	recipes.addShapedMirrored("Antidote Charm", 
	<cyclicmagic:charm_antidote>, 
	[[<ore:listAllmilk>, <ore:listAllmilk>, <ore:listAllmilk>],
	[<minecraft:poisonous_potato>, <extrautils2:goldenlasso:1>.withTag({Animal:{id:"minecraft:witch"}}), <minecraft:poisonous_potato>], 
	[<ore:listAllmilk>, <ore:listAllmilk>, <ore:listAllmilk>]]);

	recipes.remove(<cyclicmagic:charm_wing>);
	recipes.addShapedMirrored("Wing Charm", 
	<cyclicmagic:charm_wing>, 
	[[<ore:feather>, <ore:feather>, <ore:feather>],
	[<minecraft:rabbit_foot>, <extrautils2:goldenlasso>.withTag({Animal:{id:"minecraft:chicken"} }), <minecraft:rabbit_foot>], 
	[<ore:feather>, <ore:feather>, <ore:feather>]]);
	
	recipes.remove(<cyclicmagic:charm_speed>);
	recipes.addShaped("Speed Charm", 
	<cyclicmagic:charm_speed>, 
	[[null, <minecraft:potion>.withTag({Potion: "minecraft:swiftness"}), null],
	[<ore:foodCake>, <extrautils2:goldenlasso>.withTag({Animal:{id:"minecraft:horse"} }), <ore:foodCake>], 
	[null, <minecraft:potion>.withTag({Potion: "minecraft:swiftness"}), null]]);

# Harvester
	recipes.remove(<cyclicmagic:harvester_block>);
	recipes.addShaped("Cyclic Harvester", 
	<cyclicmagic:harvester_block>, 
	[[<ore:gemEmerald>, <minecraft:dispenser>, <ore:gemEmerald>],
	[<ore:gemQuartz>, <ic2:resource:13>, <ore:gemQuartz>], 
	[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>]]);

# Forester
	recipes.remove(<cyclicmagic:block_forester>);
	recipes.addShaped("Cyclic Forester", 
	<cyclicmagic:block_forester>, 
	[[<ore:logWood>, <minecraft:dispenser>, <ore:logWood>],
	[<minecraft:diamond_axe>, <ic2:resource:12>, <minecraft:diamond_axe>], 
	[<minecraft:furnace>, <minecraft:furnace>, <minecraft:furnace>]]);

# Cyclic Storage Bag
	recipes.remove(<cyclicmagic:storage_bag>);
	recipes.addShaped("Storage Bag", 
	<cyclicmagic:storage_bag>, 
	[[<ore:leather>, <ore:string>, <ore:leather>],
	[<ore:leather>, <ore:blockGold>, <ore:leather>], 
	[<ore:leather>, <ore:blockRedstone>, <ore:leather>]]);

# Diamond Anvil
	recipes.remove(<cyclicmagic:block_anvil>);
	recipes.addShaped("Diamond Anvil", 
	<cyclicmagic:block_anvil>, 
	[[<ore:gemDiamond>, <ore:plateDenseObsidian>, <ore:gemDiamond>],
	[<ore:dustRedstone>, <actuallyadditions:block_item_repairer>, <ore:dustRedstone>], 
	[<ore:blockIron>, <ore:blockIron>, <ore:blockIron>]]);
	
# Explosionproof Cyclic Glass
	recipes.remove(<cyclicmagic:glass_strong>);
	recipes.addShaped("Cyclic Strong Glass", 
	<cyclicmagic:glass_strong>*8, 
	[[<extrautils2:decorativeglass:3>, <extrautils2:decorativeglass:3>, <extrautils2:decorativeglass:3>], 
	[<extrautils2:decorativeglass:3>, <enderio:block_reinforced_obsidian>, <extrautils2:decorativeglass:3>], 
	[<extrautils2:decorativeglass:3>, <extrautils2:decorativeglass:3>, <extrautils2:decorativeglass:3>]
	]);

# Clear tank
recipes.addShapeless("Cyclic tank clear", <cyclicmagic:block_storeempty>, [<cyclicmagic:block_storeempty>]);