import mods.jei.JEI.removeAndHide as rh;

# Conversion recipe between Thaumic Tinkerer Black Quartz Block & Botania Block of Smokey Quartz
recipes.addShapeless(<botania:quartztypedark>, [<thaumictinkerer:black_quartz_block>]);
recipes.addShapeless(<thaumictinkerer:black_quartz_block>, [<botania:quartztypedark>]);

# Disk Platter / Iron Chain Link
	recipes.remove(<iceandfire:chain_link>);
	recipes.addShaped(<iceandfire:chain_link> * 2, 
	[[<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>],
	[<ore:nuggetIron>, null, <ore:nuggetIron>], 
	[<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>]]);

# Polished Marble / Marble Pavement
	recipes.remove(<quark:marble:1>);

# Chisel Lavastone / Environmental Tech Basalt
	recipes.remove(<chisel:lavastone>);
	recipes.addShapedMirrored("Chisel Lavastone", 
	<chisel:lavastone> * 16, 
	[[<ore:stone>, <ore:stone>, <ore:stone>],
	[<minecraft:lava_bucket>, <ore:stone>, <minecraft:lava_bucket>], 
	[<ore:stone>, <ore:stone>, <ore:stone>]]);

# OpenBlocks Scaffolding / Random Things Block of Sticks
	recipes.remove(<randomthings:blockofsticks>);
	recipes.addShaped("Random Things Block of Sticks", 
	<randomthings:blockofsticks> * 8, 
	[[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>],
	[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>], 
	[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>]]);
	
# Pam's Lemonade
	recipes.remove(<harvestcraft:lemonaideitem>);
	recipes.addShapeless(<harvestcraft:lemonaideitem>, [<ore:toolJuicer>, <ore:cropLemon>, <ore:listAllsugar>, <ore:listAllsugar>]);

# Cow Bait
	recipes.remove(<excompressum:bait:2>);
	recipes.addShapeless("Cow Bait", 
	<excompressum:bait:2>, [<ore:cropWheat>, <ore:cropWheat>, <ore:cropWheat>]);

# Pam's Cotton
	recipes.remove(<harvestcraft:cottonitem>);
		
# Soft Pretzel
	recipes.remove(<harvestcraft:softpretzelitem>);
	recipes.addShapeless("Soft Pretzel", 
	<harvestcraft:softpretzelitem>, 
	[<ore:toolBakeware>, <ore:foodDough>, <ore:foodButter>, 
	<ore:itemSalt>, <ore:itemSalt>]);

# Quark Polished Marble
val marble = <ore:stoneMarble>;
	recipes.removeShaped(<quark:marble:1>);
	recipes.addShaped("Polished Marble", <quark:marble:1> * 9, 
	[[marble, marble, marble],
	[marble, marble, marble],
	[marble, marble, marble]]);
	
# Mekanism Boiler Casing
	recipes.remove(<mekanism:basicblock2:7>);
	recipes.addShaped(<mekanism:basicblock2:7> * 8, 
	[[<ore:ingotSteel>, <ore:ingotSteel>, <ore:ingotSteel>],
	[<ore:ingotSteel>, <ore:ingotIron>, <ore:ingotSteel>], 
	[<ore:ingotSteel>, <ore:ingotSteel>, <ore:ingotSteel>]]);

# Applied Llamagistics Wood Gear
	recipes.remove(<appliedenergistics2:material:40>);
	recipes.addShaped("Applied Llamagistics Wood Gear", 
	<appliedenergistics2:material:40>, 
	[[null, <ore:plankWood>, null],
	[<ore:plankWood>, null, <ore:plankWood>], 
	[null, <ore:plankWood>, null]]);
	
# *======= Metal Blocks =======*

	recipes.remove(<mekanism:basicblock:12>);
	recipes.remove(<mekanism:basicblock:1>);
	recipes.remove(<mekanism:basicblock:3>);
	recipes.remove(<mekanism:basicblock:5>);
	recipes.remove(<mekanism:basicblock:13>);
	recipes.remove(<forestry:resource_storage:3>);
	recipes.remove(<forestry:resource_storage:1>);
	recipes.remove(<forestry:resource_storage:2>);
	recipes.remove(<forestry:charcoal:0>);
	recipes.remove(<chisel:block_charcoal2:1>);
	recipes.remove(<immersiveengineering:stone_decoration:3>);
	recipes.remove(<immersiveengineering:storage>);
	recipes.remove(<immersiveengineering:storage:1>);
	recipes.remove(<immersiveengineering:storage:2>);
	recipes.remove(<immersiveengineering:storage:3>);
	recipes.remove(<immersiveengineering:storage:4>);
	recipes.remove(<immersiveengineering:storage:7>);
	recipes.remove(<immersiveengineering:storage:8>);
	recipes.remove(<plustic:invarblock>);
	recipes.remove(<ic2:ingot:2>);
	recipes.remove(<ic2:ingot:3>);
	recipes.remove(<ic2:ingot:4>);
	recipes.remove(<ic2:ingot:5>);
	recipes.remove(<ic2:ingot:6>);
	recipes.remove(<ic2:resource:5>);

		