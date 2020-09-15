import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;
import crafttweaker.item.IItemStack;

var itemsToRemove as string[] = [
	
	"actuallyadditions:block_misc:4",
	
	"forestry:broken_bronze_shovel",
	"forestry:broken_bronze_pickaxe",
	"forestry:kit_pickaxe",
	"forestry:kit_shovel",
	
	"ic2:ingot:1",
	"ic2:ingot:2",
	"ic2:ingot:6",
	"ic2:bronze_pickaxe",
	"ic2:filled_tin_can",
	"ic2:bronze_boots",
	"ic2:bronze_chestplate", 
	"ic2:bronze_leggings", 
	"ic2:bronze_helmet",
	
	"iceandfire:armor_silver_metal_helmet",
	"iceandfire:armor_silver_metal_chestplate",
	"iceandfire:armor_silver_metal_leggings",
	"iceandfire:armor_silver_metal_boots",
	
	"immersiveengineering:pickaxe_steel",
	"immersiveengineering:shovel_steel",
	"immersiveengineering:axe_steel",
	"immersiveengineering:sword_steel",
	
	"minecraft:iron_ingot",
	"minecraft:gold_ingot",
	"minecraft:iron_pickaxe",
	"minecraft:iron_sword",
	"minecraft:milk_bucket",
	"minecraft:obsidian",
	"minecraft:water_bucket",

	"twilightforest:uncrafting_table",
	"enderio:item_dark_steel_sword",
	"enderio:item_travel_staff",
	"cyclicmagic:book_ender"
];

for item in itemsToRemove {
	mods.ltt.LootTable.removeGlobalItem(item);
}


val enderman = LootTweaker.getTable("minecraft:entities/enderman"); //Enderman (make enderpearls drop 100% of the time)
enderman.getPool("main").removeEntry("minecraft:ender_pearl"); //Remove main enderpearl entry
enderman.getPool("main").addItemEntryHelper(<minecraft:ender_pearl>, 1, 0, [Functions.lootingEnchantBonus(0, 1, 0)], [Conditions.killedByPlayer()], "minecraft:ender_pearl");
