import mods.ltt.LootTable;

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
	
	"randomthings:spectrecoil_number",

	"twilightforest:uncrafting_table"
];

for item in itemsToRemove {
	LootTable.removeGlobalItem(item);
}