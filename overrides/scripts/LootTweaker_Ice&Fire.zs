import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import crafttweaker.item.IItemStack as IItemStack;
#modloaded loottweaker


# *======= Variables =======*

	val cyclops_cave = LootTweaker.getTable("iceandfire:cyclops_cave");
	val cyclops_cave_pool = cyclops_cave.getPool("cyclops_cave");

	val fire_dragon_female_cave = LootTweaker.getTable("iceandfire:fire_dragon_female_cave");
	val fire_dragon_female_cave_pool = fire_dragon_female_cave.getPool("fire_dragon_cave");
    
    val fire_dragon_male_cave = LootTweaker.getTable("iceandfire:fire_dragon_male_cave");
	val fire_dragon_male_cave_pool = fire_dragon_male_cave.getPool("fire_dragon_cave");
	
	val ice_dragon_female_cave = LootTweaker.getTable("iceandfire:ice_dragon_female_cave");
	val ice_dragon_female_cave_pool = ice_dragon_female_cave.getPool("ice_dragon_cave");
    
    val ice_dragon_male_cave = LootTweaker.getTable("iceandfire:ice_dragon_male_cave");
	val ice_dragon_male_cave_pool = ice_dragon_male_cave.getPool("ice_dragon_cave");
	
	val caveloot = [
	<environmentaltech:litherite_crystal>,
	<enderio:item_alloy_endergy_ingot:2>,
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
	<botania:brewflask>.withTag({brewKey: "strength"})
	] as IItemStack[];
	
	for item in caveloot {
	
	cyclops_cave_pool.addItemEntry(item, 3);
	fire_dragon_female_cave_pool.addItemEntry(item, 3);
    fire_dragon_male_cave_pool.addItemEntry(item, 3);
	ice_dragon_female_cave_pool.addItemEntry(item, 3);
    ice_dragon_male_cave_pool.addItemEntry(item, 3);
	
	}
	
		