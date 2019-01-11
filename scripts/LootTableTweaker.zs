import mods.ltt.LootTable;

var itemsToRemove as string[] = [
	
	"actuallyadditions:block_misc:4",
	
	"forestry:broken_bronze_shovel",
	"forestry:broken_bronze_pickaxe",
	"forestry:kit_pickaxe",
	"forestry:kit_shovel",
	
	"ic2:ingot:2",
	"ic2:ingot:6",
	"ic2:bronze_pickaxe",
	"ic2:filled_tin_can",
	
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