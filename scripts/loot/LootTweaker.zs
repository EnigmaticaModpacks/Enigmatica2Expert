import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;
import crafttweaker.item.IItemStack;

var itemsToRemove as string[] = [
	
	"actuallyadditions:block_misc:4",
	"actuallyadditions:item_misc:5",
	
	"forestry:broken_bronze_shovel",
	"forestry:broken_bronze_pickaxe",
	"forestry:kit_pickaxe",
	"forestry:kit_shovel",
	
	"ic2:ingot",
	"ic2:bronze_pickaxe",
	"ic2:filled_tin_can",
	"ic2:bronze_boots",
	"ic2:bronze_chestplate", 
	"ic2:bronze_leggings", 
	"ic2:bronze_helmet",
	"ic2:bronze_sword",
	
	"iceandfire:armor_silver_metal_helmet",
	"iceandfire:armor_silver_metal_chestplate",
	"iceandfire:armor_silver_metal_leggings",
	"iceandfire:armor_silver_metal_boots",
	"iceandfire:silver_nugget",
	"iceandfire:silver_ingot",
	"iceandfire:sapphire_gem",
	"iceandfire:silver_sword",
	
	"immersiveengineering:pickaxe_steel",
	"immersiveengineering:shovel_steel",
	"immersiveengineering:axe_steel",
	"immersiveengineering:sword_steel",
	
	"minecraft:iron_pickaxe",
	"minecraft:iron_sword",
	"minecraft:milk_bucket",
	"minecraft:name_tag",
	"minecraft:obsidian",
	"minecraft:water_bucket",

	"minecraft:golden_helmet",
	"minecraft:golden_chestplate",
	"minecraft:golden_leggings",
	"minecraft:golden_boots",
	"minecraft:iron_helmet",
	"minecraft:iron_chestplate",
	"minecraft:iron_leggings",
	"minecraft:iron_boots",
	"minecraft:diamond_helmet",
	"minecraft:diamond_chestplate",
	"minecraft:diamond_leggings",
	"minecraft:diamond_boots",
	"minecraft:leather_helmet",
	"minecraft:leather_chestplate",
	"minecraft:leather_leggings",
	"minecraft:leather_boots",

	"twilightforest:uncrafting_table",
	"enderio:item_dark_steel_sword",
	"enderio:item_travel_staff",
	"enderio:item_material:9",
	"cyclicmagic:book_ender",

	"minecraft:golden_hoe",
	"minecraft:diamond_hoe",
	"minecraft:iron_hoe",
	"minecraft:stone_hoe",
	"minecraft:wooden_hoe",
	"minecraft:golden_axe",
	"minecraft:golden_pickaxe",
	"minecraft:golden_shovel",
	"minecraft:golden_sword",
	"minecraft:diamond_axe",
	"minecraft:diamond_pickaxe",
	"minecraft:diamond_shovel",
	"minecraft:diamond_sword",
	"minecraft:stone_axe",
	"minecraft:stone_pickaxe",
	"minecraft:stone_shovel",
	"minecraft:stone_sword",
	"minecraft:wooden_axe",
	"minecraft:wooden_pickaxe",
	"minecraft:wooden_shovel",
	"minecraft:wooden_sword",
	"minecraft:iron_sword",
	"minecraft:bow",
	"minecraft:iron_axe",
	"minecraft:iron_pickaxe",
	"minecraft:iron_shovel",
];

for item in itemsToRemove {
	mods.ltt.LootTable.removeGlobalItem(item);
}


val endermanPool = LootTweaker.getTable("minecraft:entities/enderman").getPool("main"); //Enderman (make enderpearls drop 100% of the time)
endermanPool.removeEntry("minecraft:ender_pearl"); //Remove main enderpearl entry
endermanPool.addItemEntryHelper(<minecraft:ender_pearl>, 1, 0, [Functions.lootingEnchantBonus(0, 1, 0)], [Conditions.killedByPlayer()]);


LootTweaker.getTable("astralsorcery:chest_shrine").getPool("astralsorcery:chest_shrine").addItemEntry(<astralsorcery:itemgrapplewand>, 3);

# More Zombie Pigman gold drop
LootTweaker.getTable("minecraft:entities/zombie_pigman").getPool("main")
.addItemEntryHelper(<minecraft:gold_ingot>, 1, 0, [Functions.lootingEnchantBonus(0, 1, 0)], [Conditions.killedByPlayer()]);

# Vex
LootTweaker.getTable("minecraft:entities/vex").getPool("main")
.addItemEntryHelper(<deepmoblearning:living_matter_overworldian>, 1, 0, [Functions.lootingEnchantBonus(0, 1, 0), Functions.setCount(0, 1)], [Conditions.killedByPlayer()]);

# Chronologist
<entity:endreborn:chronologist>.addPlayerOnlyDrop(<deepmoblearning:living_matter_extraterrestrial>, 1, 2);
