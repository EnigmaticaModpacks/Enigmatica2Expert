import mods.jei.JEI.removeAndHide as rh;
#modloaded cyclicmagic

# *======= Recipes =======*

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

# Diamond Anvil
	recipes.remove(<cyclicmagic:block_anvil>);
	recipes.addShaped("Diamond Anvil", 
	<cyclicmagic:block_anvil>, 
	[[gemDiamondRat, <ore:plateDenseObsidian>, gemDiamondRat],
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
	
# Climbing Gloves
remakeEx(<cyclicmagic:glove_climb>, [
	[<rats:feral_rat_claw>, <rats:feral_rat_claw>, null],
	[<rats:feral_rat_claw>, <ic2:misc_resource:4>, <harvestcraft:hardenedleatheritem>],
	[null, <harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>]]);

# Igniter
remakeEx(<randomthings:igniter>, [
	[<ore:gearSteel>, <ore:gearSteel>, <ore:netherrack>],
	[<minecraft:dispenser>, <iceandfire:fire_dragon_blood>, <ore:netherrack>],
	[<ore:gearSteel>, <ore:gearSteel>, <ore:netherrack>]]);

	
# Scepters harder
recipes.remove(<cyclicmagic:tool_swap_match>);
recipes.remove(<cyclicmagic:tool_swap>);
recipes.remove(<cyclicmagic:cyclic_wand_build>);
recipes.addShaped(<cyclicmagic:tool_swap>, [[null, <cd4017be_lib:m:402>, <appliedenergistics2:material:10>],[null, <redstonearsenal:material:192>, <cd4017be_lib:m:402>], [<enderio:block_reinforced_obsidian>, null, null]]);
recipes.addShaped(<cyclicmagic:tool_swap_match>, [[null, <cd4017be_lib:m:402>, <randomthings:ingredient:9>],[null, <redstonearsenal:material:192>, <cd4017be_lib:m:402>], [<enderio:block_reinforced_obsidian>, null, null]]);
recipes.addShaped(<cyclicmagic:cyclic_wand_build>, [[null, <cd4017be_lib:m:402>, gemDiamondRat],[null, <redstonearsenal:material:192>, <cd4017be_lib:m:402>], [<ore:blockBone>, null, null]]);


# Vacuum hopper
recipes.remove(<cyclicmagic:block_vacuum>);
recipes.addShaped(<cyclicmagic:block_vacuum>, [
	[<sonarcore:reinforcedstoneblock>, <ore:plateLapis>, <sonarcore:reinforcedstoneblock>], 
	[<sonarcore:reinforcedstoneblock>, <actuallyadditions:block_misc:4>, <sonarcore:reinforcedstoneblock>], 
	[<sonarcore:reinforcedstoneblock>, <appliedenergistics2:material:45>,<sonarcore:reinforcedstoneblock>]
]);

# User Alternative
recipes.addShapedMirrored(<cyclicmagic:block_user>, 
	[[<ore:ingotGold>, <ore:ingotRefinedObsidian>, <ore:ingotGold>],
	[<minecraft:golden_pickaxe>, <ore:circuitUltimate>, <minecraft:golden_axe>], 
	[<ore:compressed2xCobblestone>, <ore:compressed2xCobblestone>, <ore:compressed2xCobblestone>]]);

# Player Launcher
remakeEx(<cyclicmagic:tool_launcher>, [
	[null, <ore:nuggetRefinedGlowstone>, <ore:nuggetRefinedGlowstone>],
	[<ore:peacockFeathers>, <tconstruct:slimesling:*>.anyDamage(), <ore:nuggetRefinedGlowstone>],
	[<ore:nuggetUnstable>, <ore:peacockFeathers>, null]]);

remakeEx(<cyclicmagic:battery>, [
	[<ore:clay>, <ore:blockRedstone>, <ore:clay>],
	[<ore:blockRedstone>, <rats:charged_creeper_chunk>, <ore:blockRedstone>],
	[<ore:clay>, <ore:blockRedstone>, <ore:clay>]]);

# Clear tank
recipes.addShapeless("Cyclic tank clear", <cyclicmagic:block_storeempty>, [<cyclicmagic:block_storeempty>]);

# Pharos beacon
remakeEx(<cyclicmagic:beacon_potion>, [
	[<extrautils2:ineffableglass:2>, <biomesoplenty:jar_filled:1>, <extrautils2:ineffableglass:2>],
	[<mekanism:basicblock:15>, <extendedcrafting:material:40>, <mekanism:basicblock:15>],
	[<ore:blockPulsatingIron>, <ore:blockPulsatingIron>, <ore:blockPulsatingIron>]]);

# Harder shears
recipes.remove(<cyclicmagic:shears_obsidian>);
recipes.addShaped("Cyclic Shears", <cyclicmagic:shears_obsidian>, [
	[null, <ore:ingotRefinedObsidian>, null],
	[<ore:ingotRefinedObsidian>, <minecraft:shears>, <ore:ingotRefinedObsidian>],
	[null, <ore:ingotRefinedObsidian>, null]]);

# Harder Sleeping mat
recipes.remove(<cyclicmagic:sleeping_mat>);
recipes.addShapeless("Cyclic Sleep Mat", <cyclicmagic:sleeping_mat>, [
	<travelersbackpack:sleeping_bag_bottom>, <ore:leather>]);

# Bag
craft.remake(<cyclicmagic:storage_bag>, ["pretty",
		'  ▬  ',
		'○ □ ○',
		'○ ○ ○'], {
	'○': <thaumictinkerer:spellbinding_cloth>.anyDamage(),
	'▬': <fluxnetworks:flux>,
	'□': <tconstruct:bow_string:*>
});