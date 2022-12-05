#modloaded rftoolsdim

# *======= Recipes =======*
	
# Dimension Builder
	recipes.remove(<rftoolsdim:dimension_builder>);
	recipes.addShapeless("Dimension Builder", 
	<rftoolsdim:dimension_builder>, 
	[<ic2:te:57>,<exnihilocreatio:item_mesh:4>, <avaritia:endest_pearl>,
	<environmentaltech:void_ore_miner_cont_6>,<draconicevolution:awakened_core>,<environmentaltech:void_res_miner_cont_6>.anyDamage(),
	<rftools:shape_card:3>,<industrialforegoing:infinity_drill>.anyDamage(), <mekanism:machineblock:4>]);

# Dimension Editor
	recipes.remove(<rftoolsdim:dimension_editor>);
	recipes.addShapedMirrored("Dimension Editor", 
	<rftoolsdim:dimension_editor>, 
	[[<rftools:machine_base>, <draconicevolution:draconic_core>, <rftools:machine_base>],
	[<rftools:machine_frame>, <thermalexpansion:frame:148>, <rftools:machine_frame>], 
	[<rftools:machine_base>, <draconicevolution:draconic_core>, <rftools:machine_base>]]);

# Dimlet Workbench
	recipes.remove(<rftoolsdim:dimlet_workbench>);
	recipes.addShapedMirrored("Dimlet Workbench", 
	<rftoolsdim:dimlet_workbench>, 
	[[<vaultopic:vice>, <rftoolsdim:dimlet_base>, <vaultopic:vice>],
	[<rftools:crafter3>.anyDamage(), <thermalexpansion:frame:148>, <rftools:crafter3>.anyDamage()], 
	[<vaultopic:vice>, utils.tryCatch(itemUtils.getItem("rftoolscontrol:workbench", 32767), <rftools:crafter3:*>), <vaultopic:vice>]]);

# Dimension Enscriber
if(isNull(loadedMods["rftdimtweak"])) {
	craft.remake(<rftoolsdim:dimension_enscriber>, ["pretty",
		"M E M",
		"A ◘ A",
		"M D M"], {
		"A": utils.tryCatch("ae2stuff:inscriber", <appliedenergistics2:inscriber>), # Advanced Inscriber
		"D": <draconicevolution:draconic_core>, # Draconic Core
		"E": <rftoolsdim:empty_dimension_tab>,  # Empty Dimension Tab
		"◘": <thermalexpansion:frame:148>,      # Resonant Cell Frame (Full)
		"M": <rftools:machine_base>,            # Machine Base
	});
}

# Phased Field Generator
	recipes.remove(<rftoolsdim:phased_field_generator>);
	recipes.addShapedMirrored("Phased Field Generator", 
	<rftoolsdim:phased_field_generator>, 
	[[<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4 as short, id: 0 as short}]}), <ore:blockDimensionalShard>, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4 as short, id: 3 as short}]})],
	[<ore:blockDimensionalShard>, <rftools:advanced_charged_porter>.anyDamage(), <ore:blockDimensionalShard>], 
	[<rftools:block_protector>.anyDamage(), <ore:blockDimensionalShard>, <rftools:block_protector>.anyDamage()]]);

# Empty Dimension Tab
	recipes.remove(<rftoolsdim:empty_dimension_tab>);
	recipes.addShapedMirrored("Empty Dimension Tab", 
	<rftoolsdim:empty_dimension_tab>, 
	[[<harvestcraft:pampaperbark>, <extendedcrafting:material:3>, <harvestcraft:pampaperbark>],
	[<extendedcrafting:material:3>, <extendedcrafting:trimmed:4>, <extendedcrafting:material:3>], 
	[<harvestcraft:pampaperbark>, <extendedcrafting:material:3>, <harvestcraft:pampaperbark>]]);

# Efficiency Essence
	recipes.remove(<rftoolsdim:efficiency_essence>);
	recipes.addShapedMirrored("Efficiency Essence", 
	<rftoolsdim:efficiency_essence>, 
	[[<ore:ingotEnderEnhanced>, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5 as short, id: 32 as short}]}), <ore:ingotEnderEnhanced>],
	[<ore:blockDimensionalShard>, <extendedcrafting:material:12>, <ore:blockDimensionalShard>], 
	[<ore:ingotEnderEnhanced>, <avaritia:endest_pearl>, <ore:ingotEnderEnhanced>]]);

# Mediocre Efficiency Essence
	recipes.remove(<rftoolsdim:mediocre_efficiency_essence>);
	recipes.addShapedMirrored("Mediocre Efficiency Essence", 
	<rftoolsdim:mediocre_efficiency_essence>, 
	[[<ore:ingotEnderEnhanced>, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4 as short, id: 32 as short}]}), <ore:ingotEnderEnhanced>],
	[<ore:gemDimensionalShard>, <extendedcrafting:material:12>, <ore:gemDimensionalShard>], 
	[<ore:ingotEnderEnhanced>, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4 as short, id: 32 as short}]}), <ore:ingotEnderEnhanced>]]);
	
	
	