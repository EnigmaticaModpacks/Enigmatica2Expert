import mods.ltt.LootTable;
import loottweaker.LootTweaker as ltt;

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

#Bunch of individual removals due to things being stubborn by MorganSimic
#remove IC2 Copper/Tin Ingots from all loot sources

var lootsource = [	"simple_dungeon",
					"village_blacksmith",
					"abandoned_mineshaft",
					"desert_pyramid",
					"end_city_treasure",
					"igloo_chest",
					"jungle_temple",
					"nether_bridge",
					"stronghold_corridor",
					"stronghold_crossing",
					"stronghold_library",
				   ] as string[];

for source in lootsource {
var wordIC2 = "ic2:chests/" + source;
var poolIC2 = ltt.getTable(wordIC2).getPool("ic2");
poolIC2.removeEntry("copper_ingot");
poolIC2.removeEntry("tin_ingot");

}

#Village Blacksmith removal

var ic2smith = ltt.getTable("ic2:chests/village_blacksmith").getPool("ic2");
var EIOsmith = ltt.getTable("enderio:chests/village_blacksmith").getPool("Ender IO");

#IC2 bronze sword
ic2smith.removeEntry("ic2:bronze_sword");

#IC2 bronze ingot
ic2smith.removeEntry("bronze_ingot");

#EIO wooden gear
EIOsmith.removeEntry("enderio:item_material:9");

#EIO stone gear
EIOsmith.removeEntry("enderio:item_material:10");

#simple_dungeon removal

#EIO wooden gear
ltt.getTable("enderio:chests/simple_dungeon").getPool("Ender IO").removeEntry("enderio:item_material:9");

#desert_pyramid removal

#IC2 bronze_sword
ltt.getTable("ic2:chests/desert_pyramid").getPool("ic2").removeEntry("ic2:bronze_sword");

#abandoned_mineshaft removal

#EIO wooden gear
ltt.getTable("enderio:chests/abandoned_mineshaft").getPool("Ender IO").removeEntry("enderio:item_material:9");

#end_city_treasure removal

#ic2 bronze_sword
ltt.getTable("ic2:chests/end_city_treasure").getPool("ic2").removeEntry("ic2:bronze_sword");

#cyclic building scepter
ltt.getTable("minecraft:chests/end_city_treasure").getPool("main").removeEntry("cyclicmagic:item.cyclic_wand_build");

#igloo_chest removal

#ic2 bronze_sword
ltt.getTable("ic2:chests/igloo_chest").getPool("ic2").removeEntry("ic2:bronze_sword");

#vanilla stone axe
ltt.getTable("minecraft:chests/igloo_chest").getPool("main").removeEntry("minecraft:stone_axe");

#nether_bridge removal

#cyclic building scepter
ltt.getTable("minecraft:chests/nether_bridge").getPool("main").removeEntry("cyclicmagic:item.cyclic_wand_build");

#stronghold_corridor removal

#ic2 bronze_sword
ltt.getTable("ic2:chests/stronghold_corridor").getPool("ic2").removeEntry("ic2:bronze_sword");

#stronghold_crossing removal

#ic2 bronze_sword
ltt.getTable("ic2:chests/stronghold_crossing").getPool("ic2").removeEntry("ic2:bronze_sword");

#stronghold_library removal

#ic2 bronze_sword
ltt.getTable("ic2:chests/stronghold_library").getPool("ic2").removeEntry("ic2:bronze_sword");

#cyclic building scepter
ltt.getTable("minecraft:chests/stronghold_library").getPool("main").removeEntry("cyclicmagic:item.cyclic_wand_build");

#immersive engineering village metal removal

var MetalToRemove = [	"copper_ingot",
						"aluminium_ingot",
						"lead_nugget",
						"silver_nugget",
						"nugget_nickel"
					] as string[];

for thing in MetalToRemove {
ltt.getTable("immersiveengineering:chests/engineers_house").getPool("immersiveengineering:engineers_village_house_0").removeEntry(thing);
}

#myrmex loot chest removal
var myrmexchest = ltt.getTable("iceandfire:myrmex_loot_chest").getPool("myrmex_loot_chest");

#silver ingot
myrmexchest.removeEntry("iceandfire:silver_ingot");

#silver nugget
myrmexchest.removeEntry("iceandfire:silver_nugget");

#ice dragon cave male removal

#sapphire
ltt.getTable("iceandfire:ice_dragon_male_cave").getPool("ice_dragon_cave").removeEntry("iceandfire:sapphire_gem");

#ice_dragon_female_cave

var dragoncave = ltt.getTable("iceandfire:ice_dragon_female_cave").getPool("ice_dragon_cave");

#silver
dragoncave.removeEntry("iceandfire:silver_ingot");
dragoncave.removeEntry("iceandfire:silver_nugget");
dragoncave.removeEntry("iceandfire:silver_sword");

#sapphire
dragoncave.removeEntry("iceandfire:sapphire_gem");

#iceandfire mausoleum removal

#sapphire
ltt.getTable("iceandfire:mausoleum_chest").getPool("mausoleum_chest").removeEntry("iceandfire:sapphire_gem");
ltt.getTable("iceandfire:mausoleum_chest").getPool("mausoleum_chest").removeEntry("iceandfire:silver_ingot");

#woodland mansion removal

#EIO stone gear
ltt.getTable("enderio:chests/woodland_mansion").getPool("Ender IO").removeEntry("enderio:item_material:10");



#Use this command to give loot chests with the according dungeon loot to test
#/give @p bq_standard:loot_chest 1 103 {loottable: "minecraft:chests/jungle_temple", hideLootInfo: 1b}
