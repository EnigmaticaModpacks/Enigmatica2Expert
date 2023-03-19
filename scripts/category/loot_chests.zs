import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import crafttweaker.item.IItemStack;
import loottweaker.vanilla.loot.Functions;

#modloaded loottweaker

#ignoreBracketErrors

# *======= Variables =======*
val fire_dragon_female_cave_pool = loottweaker.LootTweaker.getTable("iceandfire:fire_dragon_female_cave").getPool("fire_dragon_cave");
val fire_dragon_male_cave_pool   = loottweaker.LootTweaker.getTable("iceandfire:fire_dragon_male_cave").getPool("fire_dragon_cave");
val ice_dragon_female_cave_pool  = loottweaker.LootTweaker.getTable("iceandfire:ice_dragon_female_cave").getPool("ice_dragon_cave");
val ice_dragon_male_cave_pool    = loottweaker.LootTweaker.getTable("iceandfire:ice_dragon_male_cave").getPool("ice_dragon_cave");

val caveloot = [
	<environmentaltech:litherite_crystal>,
	<ore:dustIrradiatedBorax>.firstItem,
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
	<botania:manaring>.withTag({mana: 500000}),
	<botania:auraring>,
	<botania:magnetring>,
	<mysticalagriculture:prudentium_apple>,
	<mysticalagriculture:intermedium_apple>,
	<mysticalagriculture:superium_apple>,
	<biomesoplenty:gem:6>,
	<thermalfoundation:storage_alloy>,
] as IItemStack[];

for item in caveloot {
	fire_dragon_female_cave_pool.addItemEntry(item, 3);
	fire_dragon_male_cave_pool.addItemEntry(item, 3);
	ice_dragon_female_cave_pool.addItemEntry(item, 3);
	ice_dragon_male_cave_pool.addItemEntry(item, 3);
}

function addLootList(table as string, pool as string, map as int[IItemStack], countMin as int = 0, countMax as int = 0) {
	val loot_pool = loottweaker.LootTweaker.getTable(table).getPool(pool);
	for item, weight in map {
		if(isNull(item)) continue;
		if(countMin <= 0 || countMax <= 0)
			loot_pool.addItemEntry(item, weight);
		else
			loot_pool.addItemEntryHelper(item, weight, 0, [Functions.setCount(countMin, max(countMin, countMax))], []);
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
	<ic2:nuclear:5>                         : 10,
	<hole_filler_mod:throwable_hole_filler> : 70,
	<cyclicmagic:corrupted_chorus>          : 5,
	<cyclicmagic:glowing_chorus>            : 5,
});

addLootList(
	"iceandfire:myrmex_desert_food_chest",
	"myrmex_desert_food_chest", {
	<animania:raw_prime_rabbit>                      : 10,
	<animania:raw_prime_peacock>                     : 10,
	<animania:raw_prime_beef>                        : 10,
	<animania:raw_prime_steak>                       : 10,
	<additionalcompression:cropwheat_compressed:1>   : 6,
	<additionalcompression:croppotato_compressed>    : 6,
	<additionalcompression:cropcarrot_compressed>    : 6,
	<additionalcompression:cropmelon_compressed:1>   : 6,
	<additionalcompression:cropapple_compressed>     : 6,
	<additionalcompression:cropsugarcane_compressed> : 6,
});

addLootList(
	"iceandfire:myrmex_jungle_food_chest",
	"myrmex_jungle_food_chest", {
	<animania:raw_prime_pork>                       : 10,
	<animania:raw_prime_bacon>                      : 10,
	<animania:raw_prime_chicken>                    : 10,
	<animania:raw_prime_mutton>                     : 10,
	<animania:raw_prime_chevon>                     : 10,
	<additionalcompression:meatporkchop_compressed> : 2,
	<additionalcompression:meatbeef_compressed>     : 2,
	<additionalcompression:meatchicken_compressed>  : 2,
	<additionalcompression:meatfish_compressed>     : 2,
	<additionalcompression:meatrotten_compressed>   : 2,
	<additionalcompression:spidereye_compressed>    : 2,
	<additionalcompression:egg_compressed>          : 2,
});

addLootList(
	"iceandfire:cyclops_cave",
	"cyclops_cave", {
	<enderio:item_material:2>          : 70,
	<enderio:item_material:35>         : 30,
	<enderio:item_material:68>         : 10,
	<qmd:semiconductor:1>              : 8,
	<rftools:storage_module:1>         : 6,
	<rftools:storage_module:2>         : 2,
	FluidCell("nutrient_distillation") : 20,
	FluidCell("ender_distillation")    : 10,
}, 1, 4);
addLootList(
	"iceandfire:cyclops_cave",
	"cyclops_cave", {
	<enderio:item_inventory_charger_basic>.withTag({"enderio.darksteel.upgrade.energyUpgrade": {level: 0, energy: 1000000}}) : 20,
	<enderio:item_inventory_charger>.withTag({"enderio.darksteel.upgrade.energyUpgrade": {level: 1, energy: 7500000}}) : 6,
	<enderio:item_inventory_charger_vibrant>.withTag({"enderio.darksteel.upgrade.energyUpgrade": {level: 3, energy: 125000000}}) : 2,
});

addLootList(
	"iceandfire:hydra_cave",
	"hydra_cave", {
	FluidCell("liquid_sunshine") : 1,
	<contenttweaker:empowered_phosphor> : 10,
	<thermalfoundation:material:229> : 50,
	<ic2:dust:28> : 22,
	<ic2:dust:2>  : 20,
	<ic2:dust:16> : 18,
	<ic2:dust:19> : 16,
	<ic2:dust:20> : 14,
	<ic2:dust:21> : 12,
	<ic2:dust:23> : 10,
	<ic2:dust:26> : 8,
	<ic2:dust:31> : 2,
	<ic2:dust:36> : 2,
}, 1, 10);

addLootList(
	"iceandfire:mausoleum_chest",
	"mausoleum_chest", {
	<conarm:resist_mat> * 4       : 3,
	<conarm:resist_mat_fire> * 10 : 3,
	<conarm:resist_mat_proj> * 10 : 3,
	<conarm:resist_mat_blast> * 10: 3,
	<botania:autocraftinghalo>    : 2,
	<forestry:carton> * 4         : 60,
	<danknull:dank_null_panel_2>  : 20,
	<danknull:dank_null_panel_3>  : 10,
	<danknull:dank_null_panel_4>  : 3,
});

addLootList(
	"quark:chests/pirate_chest",
	"quark:pirate_ship", {
	<cyclicmagic:dynamite_safe>   : 30,
	<cyclicmagic:dynamite_mining> : 10,
	<cyclicmagic:ender_tnt_6>     : 20,
	<ic2:dynamite>                : 60,
	<ic2:dynamite_sticky>         : 50,
	<quark:arrow_explosive>       : 80,
	<tconstruct:throwball:1>      : 5,
	<mekanism:obsidiantnt>        : 5,
}, 5, 64);

addLootList(
	"twilightforest:structures/hill_3/uncommon",
	"main", {
	<twilightforest:steeleaf_ingot> : 5,
}, 2, 8);
