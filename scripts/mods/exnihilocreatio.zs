import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
#modloaded exnihilocreatio

# Make baits stackable
for i in 0 .. 13 {
	itemUtils.getItem('excompressum:bait', i).maxStackSize = 64;
}

# End Cake
	recipes.remove(<exnihilocreatio:block_end_cake>);
	recipes.addShaped("End Cake", 
	<exnihilocreatio:block_end_cake>, 
	[[<ore:foodCake>, <actuallyadditions:block_misc:8>, <ore:foodCake>],
	[<actuallyadditions:block_misc:8>, <minecraft:end_crystal>, <actuallyadditions:block_misc:8>], 
	[<ore:foodCake>, <actuallyadditions:block_misc:8>, <ore:foodCake>]]);

# Stone Barrel
	recipes.remove(<exnihilocreatio:block_barrel1>);
	recipes.addShaped("Stone Barrel", 
	<exnihilocreatio:block_barrel1>, 
	[[<minecraft:stone>, null, <minecraft:stone>],
	[<minecraft:stone>, null, <minecraft:stone>], 
	[<minecraft:stone>, <ore:obsidian>, <minecraft:stone>]]);

# Normal -> Crushed -> Compressed -> Crushed Compressed -> Double Crushed
val crushingInMachines = [
	[<minecraft:netherrack>               , <exnihilocreatio:block_netherrack_crushed>],
	[<minecraft:sand>                     , <exnihilocreatio:block_dust>              ],
	[<minecraft:netherrack>               , <exnihilocreatio:block_netherrack_crushed>],
	[<minecraft:end_stone>                , <exnihilocreatio:block_endstone_crushed>  ],
	[<minecraft:stone:5>                  , <exnihilocreatio:block_andesite_crushed>, <contenttweaker:compressed_andesite>, <contenttweaker:compressed_crushed_andesite>, <biomesoplenty:dried_sand>],
	[<minecraft:stone:3>                  , <exnihilocreatio:block_diorite_crushed> , <contenttweaker:compressed_diorite>,  <contenttweaker:compressed_crushed_diorite> , <biomesoplenty:white_sand>],
	[<minecraft:stone:1>                  , <exnihilocreatio:block_granite_crushed> , <contenttweaker:compressed_granite>,  <contenttweaker:compressed_crushed_granite>],
	[<appliedenergistics2:sky_stone_block>, <exnihilocreatio:block_skystone_crushed>, <contenttweaker:compressed_skystone>, <contenttweaker:compressed_crushed_skystone>],
	[<rats:garbage_pile>                  , null                                    , <contenttweaker:compressed_garbage_pile>],
	[<biomesoplenty:dried_sand>	          , null                                    , <contenttweaker:compressed_dried_sand>],
	[<quark:gravisand>         	          , null                                    , <contenttweaker:compressed_gravisand> ],
	[<minecraft:sand:1>        	          , null                                    , <contenttweaker:compressed_red_sand>  ],
	[<biomesoplenty:white_sand>	          , null                                    , <contenttweaker:compressed_white_sand>],
] as IItemStack[][];
for i, inputArr in crushingInMachines {
	val normal     = inputArr[0];
	val crushed    = inputArr[1];
	if(!isNull(normal) && !isNull(crushed)) mods.thermalexpansion.Pulverizer.addRecipe(crushed, normal, 2000);

	if(inputArr.length >= 3) {
		val compressed = inputArr[2];
		utils.compact(normal, compressed);

		if(inputArr.length >= 4) {
			val crushComps = inputArr[3];
			utils.compact(crushed, crushComps);
			scripts.process.crush(compressed, crushed * 9, "only: SagMill");

			if(inputArr.length >= 5) {
				val doubleCrushed = inputArr[4];
				scripts.process.crush(crushComps, doubleCrushed * 9, "only: SagMill Pulverizer");
			}
		}
	}
}

# Remove oredict entries
<ore:oreAluminium>.remove(<exnihilocreatio:item_ore_aluminium:1>);

# *======= Remove & Hide =======*

# Uncompressed Coal
	utils.rh(<excompressum:uncompressed_coal>);

# Duplicate compressed blocks
	utils.rh(<excompressum:compressed_block:2>);
	utils.rh(<excompressum:compressed_block:3>);
	utils.rh(<excompressum:compressed_block:4>);
	utils.rh(<excompressum:compressed_block:1>);
	utils.rh(<excompressum:compressed_block:9>);
	
# Crucibles
	utils.rh(<excompressum:wooden_crucible>);
	utils.rh(<excompressum:wooden_crucible:1>);
	utils.rh(<excompressum:wooden_crucible:2>);
	utils.rh(<excompressum:wooden_crucible:3>);
	utils.rh(<excompressum:wooden_crucible:4>);
	utils.rh(<excompressum:wooden_crucible:5>);
	
	utils.rh(<exnihilocreatio:block_crucible>);
	utils.rh(<exnihilocreatio:block_crucible_wood>);
	utils.rh(<exnihilocreatio:block_crucible:1>);
	
# Ex Nihilo Dusts
	utils.rh(<exnihilocreatio:item_ore_gold:2>);
	utils.rh(<exnihilocreatio:item_ore_iron:2>);
	utils.rh(<exnihilocreatio:item_ore_copper:2>);
	utils.rh(<exnihilocreatio:item_ore_tin:2>);
	utils.rh(<exnihilocreatio:item_ore_aluminium:2>);
	utils.rh(<exnihilocreatio:item_ore_lead:2>);
	utils.rh(<exnihilocreatio:item_ore_silver:2>);
	utils.rh(<exnihilocreatio:item_ore_nickel:2>);

# Remove excess mesh
	utils.rh(<excompressum:iron_mesh>);
	

# Remove Sieves (defined in CompactMachines)
recipes.remove(<exnihilocreatio:item_mesh:2>);
recipes.remove(<exnihilocreatio:item_mesh:3>);
recipes.remove(<exnihilocreatio:item_mesh:4>);

# [Artificial_Hive] from [Hay_Bale][+1]
craft.remake(<exnihilocreatio:hive>, ["pretty",
  "B B B",
  "b H b",
  "B B B"], {
  B: <ore:itemBeeswax>,    # Beeswax
  H: <minecraft:hay_block>,# Hay Bale
	b: <rustic:bee>
});

craft.remake(<exnihilocreatio:hive> * 2, ["pretty",
  "B B B",
  "b H b",
  "B B B"], {
  B: <ore:itemBeeswax>,    # Beeswax
  H: <harvestcraft:beehive>,
	b: <rustic:bee>
});

// Remove Burn Time to prevent confusing in JEI categories
furnace.setFuel(<exnihilocreatio:hive:1>, 0);

#-------------------------------------------------------------------------
# Remake heavy sieves
#-------------------------------------------------------------------------
val heavySieveIngrs = {
	<excompressum:heavy_sieve:0> : <minecraft:log>,
	<excompressum:heavy_sieve:1> : <minecraft:log:1>,
	<excompressum:heavy_sieve:2> : <minecraft:log:2>,
	<excompressum:heavy_sieve:3> : <minecraft:log:3>,
	<excompressum:heavy_sieve:4> : <minecraft:log2>,
	<excompressum:heavy_sieve:5> : <minecraft:log2:1>,
} as IIngredient[IItemStack];

for out, inp in heavySieveIngrs {
	# [Heavy Birch Sieve] from [Sieve][+3]
	craft.remake(out, ["pretty",
		"  ¤  ",
		"▬ S ▬",
		"#   #"], {
		"#": inp,
		"S": <exnihilocreatio:block_sieve>, # Sieve
		"¤": <ore:gearMithril>,             # Mana Infused Gear
		"▬": <ore:ingotHeavy>,              # Heavy Ingot
	});
}
#-------------------------------------------------------------------------

# [Auto Sieve] from [Sieve][+4]
craft.remake(<excompressum:auto_sieve>, ["pretty",
  "  A  ",
  "□ S □",
  "◊ ■ ◊"], {
  "A": <exnihilocreatio:item_material:3>, # Ancient Spores
  "□": <ore:plateInvar>,                  # Invar Plate
  "S": <exnihilocreatio:block_sieve>,     # Sieve
  "◊": <ore:gemTanzanite>,                # Tanzanite
  "■": <libvulpes:motor>,                 # Motor
});

# [Mana Sieve] from [Sieve][+4]
craft.remake(<excompressum:mana_sieve>, ["pretty",
  "  A  ",
  "■ S ■",
  "◊ ▄ ◊"], {
  "A": <exnihilocreatio:item_material:3>, # Ancient Spores
  "■": <botania:storage>,                 # Block of Manasteel
  "S": <exnihilocreatio:block_sieve>,     # Sieve
  "◊": <ore:gemEmerald>,
  "▄": <libvulpes:advancedmotor>,         # Advanced Motor
});

# [Auto Heavy Sieve] from [Heavy Dark Oak Sieve][+4]
craft.remake(<excompressum:auto_heavy_sieve>, ["pretty",
  "  A  ",
  "□ H □",
  "■ ▄ ■"], {
  "A": <exnihilocreatio:item_material:3>, # Ancient Spores
  "□": <ore:plateTitaniumIridium>,        # Titanium Iridium Alloy Plate
  "H": <excompressum:heavy_sieve:*>,      # Heavy Dark Oak Sieve
  "■": <ore:blockTanzanite>,              # Block of Tanzanite
  "▄": <libvulpes:enhancedmotor>,         # Enhanced Motor
});

# [Auto Hammer] from [Cobalt Sledge Hammer Head][+2]
craft.remake(<excompressum:auto_hammer>, ["pretty",
  "M I M",
  "M C M",
  "M I M"], {
  "C": <tcomplement:sledge_head>.withTag({Material: "cobalt"}), # Cobalt Sledge Hammer Head
  "I": <minecraft:iron_trapdoor>,         # Iron Trapdoor
  "M": <extrautils2:decorativesolidwood>, # Magical Planks
});

# [Auto Compressed Hammer] from [Cobalt Hammer Head][+4]
craft.remake(<excompressum:auto_compressed_hammer>, ["pretty",
  "  A  ",
  "□ C □",
  "◊ ■ ◊"], {
  "A": <exnihilocreatio:item_material:3>, # Ancient Spores
  "□": <ore:plateInvar>,                  # Invar Plate
  "C": <tconstruct:hammer_head>.withTag({Material: "cobalt"}), # Cobalt Hammer Head
  "◊": <ore:gemTanzanite>,                # Tanzanite
  "■": <libvulpes:advancedmotor>,         # Advanced Motor
});

# Remake pebbles to accept half of any pebble
recipes.removeByRecipeName("exnihilocreatio:cobblestone");
recipes.removeByRecipeName("exnihilocreatio:stone_1");
recipes.removeByRecipeName("exnihilocreatio:stone_3");
recipes.removeByRecipeName("exnihilocreatio:stone_5");
val pebbleList = [
	<exnihilocreatio:item_pebble>  , <minecraft:cobblestone>,
	<exnihilocreatio:item_pebble:1>, <minecraft:stone:1>    ,
	<exnihilocreatio:item_pebble:2>, <minecraft:stone:3>    ,
	<exnihilocreatio:item_pebble:3>, <minecraft:stone:5>    ,
] as IItemStack[];
for i, item in pebbleList {
	if(i%2==0) continue;
	val peb = pebbleList[i - 1];
	recipes.addShaped("Pebble x1 "~i, item    , [[peb, peb], [<ore:pebble>, <ore:pebble>]]);
}