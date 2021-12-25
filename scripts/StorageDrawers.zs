#modloaded storagedrawers


# *======= Recipes =======*

# Drawer Controller
	recipes.remove(<storagedrawers:controller>);
	recipes.addShaped("Drawer Controller", 
	<storagedrawers:controller>, 
	[[<ic2:resource:11>, <ic2:resource:11>, <ic2:resource:11>],
	[<immersiveengineering:metal_decoration0:3>, <ore:drawerBasic>, <immersiveengineering:metal_decoration0:3>], 
	[<appliedenergistics2:smooth_sky_stone_block>, <ore:gemDiamond>, <appliedenergistics2:smooth_sky_stone_block>]]);

# Drawer 1x1
	recipes.addShapedMirrored("Drawer 1x1",
	<storagedrawers:basicdrawers>, 
	[[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],
	[null, <ore:chest>, null], 
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]]);
	
# Drawer 1x2
	recipes.addShapedMirrored("Drawer 1x2",
	<storagedrawers:basicdrawers:1> * 2, 
	[[<ore:plankWood>, <ore:chest>, <ore:plankWood>],
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], 
	[<ore:plankWood>, <ore:chest>, <ore:plankWood>]]);

# Drawer 2x2
	recipes.addShapedMirrored("Drawer 2x2", 
	<storagedrawers:basicdrawers:2> * 4, 
	[[<ore:chest>, <ore:plankWood>, <ore:chest>],
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], 
	[<ore:chest>, <ore:plankWood>, <ore:chest>]]);

# Half Drawer 1x2
	recipes.addShapedMirrored("Half Drawer 1x2", 
	<storagedrawers:basicdrawers:3> * 2, 
	[[<ore:slabWood>, <ore:chest>, <ore:slabWood>],
	[<ore:slabWood>, <ore:slabWood>, <ore:slabWood>], 
	[<ore:slabWood>, <ore:chest>, <ore:slabWood>]]);

# Half Drawer 2x2
	recipes.addShapedMirrored("Half Drawer 2x2", 
	<storagedrawers:basicdrawers:4> * 4, 
	[[<ore:chest>, <ore:slabWood>, <ore:chest>],
	[<ore:slabWood>, <ore:slabWood>, <ore:slabWood>], 
	[<ore:chest>, <ore:slabWood>, <ore:chest>]]);

# Trim
	recipes.addShapedMirrored("Trim", 
	<storagedrawers:trim> * 4, 
	[[<ore:stickWood>, <ore:plankWood>, <ore:stickWood>],
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], 
	[<ore:stickWood>, <ore:plankWood>, <ore:stickWood>]]);

# [Creative Storage Upgrade] from [Black Hole Unit][+3]
craft.remake(<storagedrawers:upgrade_creative>, ["pretty",
  "# S #",
  "U B U",
  "# S #"], {
  "B": <industrialforegoing:black_hole_unit>, # Black Hole Unit
  "#": <ore:stickWood>,                       # Stick
  "S": <storagedrawers:upgrade_storage:3>,    # Storage Upgrade (IV)
  "U": <storagedrawers:upgrade_template>      # Upgrade Template
});
		