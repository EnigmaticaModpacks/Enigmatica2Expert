import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import crafttweaker.item.IItemStack as IItemStack;
#modloaded loottweaker

#ignoreBracketErrors

# *======= Variables =======*
val cyclops_cave_pool            = loottweaker.LootTweaker.getTable("iceandfire:cyclops_cave").getPool("cyclops_cave");
val fire_dragon_female_cave_pool = loottweaker.LootTweaker.getTable("iceandfire:fire_dragon_female_cave").getPool("fire_dragon_cave");
val fire_dragon_male_cave_pool   = loottweaker.LootTweaker.getTable("iceandfire:fire_dragon_male_cave").getPool("fire_dragon_cave");
val ice_dragon_female_cave_pool  = loottweaker.LootTweaker.getTable("iceandfire:ice_dragon_female_cave").getPool("ice_dragon_cave");
val ice_dragon_male_cave_pool    = loottweaker.LootTweaker.getTable("iceandfire:ice_dragon_male_cave").getPool("ice_dragon_cave");

val caveloot = [
	<environmentaltech:litherite_crystal>,
	<bigreactors:ingotblutonium>,
	<ic2:nuclear:7>,
	<minecraft:gold_block>,
	<thermalfoundation:material:70>,
	<extendedcrafting:storage>,
	<nuclearcraft:uranium:8>,
	<nuclearcraft:neptunium>,
	<nuclearcraft:plutonium>,
	<nuclearcraft:californium:4>,
	<nuclearcraft:californium:12>,
	<nuclearcraft:curium>,
	<actuallyadditions:block_crystal>,
	<actuallyadditions:block_crystal:1>,
	<actuallyadditions:block_crystal:2>,
	<actuallyadditions:block_crystal:3>,
	<actuallyadditions:block_crystal:4>,
	<actuallyadditions:item_crystal_empowered>,
	<actuallyadditions:item_crystal_empowered:1>,
	<actuallyadditions:item_crystal_empowered:2>,
	<actuallyadditions:item_crystal_empowered:3>,
	<actuallyadditions:item_crystal_empowered:4>,
	<actuallyadditions:item_crystal_empowered:5>,
	<botania:manaring>,
	<botania:auraring>,
	<botania:magnetring>,
	<mysticalagriculture:prudentium_apple>,
	<mysticalagriculture:intermedium_apple>,
	<mysticalagriculture:superium_apple>,
	<botania:brewvial>.withTag({brewKey: "bloodthirst"}),
	<botania:brewvial>.withTag({brewKey: "overload"}),
	<botania:brewvial>.withTag({brewKey: "invisibility"}),
	<botania:brewvial>.withTag({brewKey: "regen"}),
	<botania:brewvial>.withTag({brewKey: "speed"}),
	<botania:brewvial>.withTag({brewKey: "clear"}),
	<botania:brewflask>.withTag({brewKey: "strength"}),
	<biomesoplenty:gem:6>,
] as IItemStack[];

for item in caveloot {
	cyclops_cave_pool.addItemEntry(item, 3);
	fire_dragon_female_cave_pool.addItemEntry(item, 3);
	fire_dragon_male_cave_pool.addItemEntry(item, 3);
	ice_dragon_female_cave_pool.addItemEntry(item, 3);
	ice_dragon_male_cave_pool.addItemEntry(item, 3);
}

# *======= Myrmex =======*

function addLootList(table as string, pool as string, map as int[IItemStack]) {
	val loot_pool = loottweaker.LootTweaker.getTable(table).getPool(pool);
	for item, weight in map {
		if(isNull(item)) continue;
		loot_pool.addItemEntry(item, weight);
	}
}

addLootList(
	"iceandfire:myrmex_trash_chest",
	"myrmex_trash_chest", {
	<harvestcraft:aridgarden>          : 20,
	<harvestcraft:frostgarden>         : 20,
	<harvestcraft:shadedgarden>        : 20,
	<harvestcraft:soggygarden>         : 20,
	<harvestcraft:tropicalgarden>      : 20,
	<harvestcraft:windygarden>         : 20,
	<randomthings:spectresapling>      : 3,
	<scalinghealth:heartdust>          : 10,
	<thermalfoundation:material:800>   : 40,
	<appliedenergistics2:material:46>  : 5,
	<enderio:block_infinity_fog>       : 15,
	<tconstruct:materials:18>          : 30,
	<thermalexpansion:florb>.withTag({Fluid: "blockfluiddirt"}) : 5,
	<mysticalagriculture:crafting>     : 50,
	<mysticalagriculture:nature_seeds> : 1,
	<mysticalagriculture:wood_seeds>   : 1,
	<mysticalagriculture:water_seeds>  : 1,
	<mysticalagriculture:ice_seeds>    : 1,
	<mysticalagriculture:zombie_seeds> : 1,
	<mysticalagriculture:stone_seeds>  : 1,
	<mysticalagriculture:dirt_seeds>   : 1,
	<exnihilocreatio:item_material:3>  : 40,
	<extrautils2:enderlilly>           : 5,
});

addLootList(
	"iceandfire:myrmex_loot_chest",
	"myrmex_loot_chest", {
	<thermalfoundation:material:198>        : 5,
	<thermalfoundation:material:194>        : 40,
	<mekanism:nugget:1>                     : 50,
	<plustic:osmiridiumnugget>              : 2,
	<minecraft:skull:4>                     : 30,
	<minecraft:skull>                       : 20,
	<betteranimalsplus:golden_goose_egg>    : 5,
	<animania:truffle>                      : 30,
	<randomthings:lotusseeds>               : 5,
	<randomthings:spectreanchor>            : 1,
	<enderio:block_enderman_skull:2>        : 10,
	<ic2:nuclear:1>                         : 10,
	<hole_filler_mod:throwable_hole_filler> : 70,
	<cyclicmagic:corrupted_chorus>          : 5,
	<cyclicmagic:glowing_chorus>            : 5,
});

addLootList(
	"iceandfire:myrmex_desert_food_chest",
	"myrmex_desert_food_chest", {
	<animania:raw_prime_rabbit> : 10,
	<animania:raw_prime_peacock> : 10,
	<animania:raw_prime_beef> : 10,
	<animania:raw_prime_steak> : 10,
	<scalingfeast:heartyshank> : 20,
	<scalingfeast:ironapple> : 10,
	<scalingfeast:enchantedironapple> : 2,
	<additionalcompression:cropwheat_compressed:1> : 6,
	<additionalcompression:croppotato_compressed> : 6,
	<additionalcompression:cropcarrot_compressed> : 6,
	<additionalcompression:cropmelon_compressed:1> : 6,
	<additionalcompression:cropapple_compressed> : 6,
	<additionalcompression:cropsugarcane_compressed> : 6,
});

addLootList(
	"iceandfire:myrmex_jungle_food_chest",
	"myrmex_jungle_food_chest", {
	<animania:raw_prime_pork> : 10,
	<animania:raw_prime_bacon> : 10,
	<animania:raw_prime_chicken> : 10,
	<animania:raw_prime_mutton> : 10,
	<animania:raw_prime_chevon> : 10,
	<scalingfeast:heartyshank> : 20,
	<scalingfeast:ironapple> : 10,
	<scalingfeast:enchantedironapple> : 2,
	<additionalcompression:meatporkchop_compressed> : 2,
	<additionalcompression:meatbeef_compressed> : 2,
	<additionalcompression:meatchicken_compressed> : 2,
	<additionalcompression:meatfish_compressed> : 2,
	<additionalcompression:meatrotten_compressed> : 2,
	<additionalcompression:spidereye_compressed> : 2,
	<additionalcompression:egg_compressed> : 2,
});