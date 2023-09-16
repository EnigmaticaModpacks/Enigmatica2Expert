#modloaded rftoolsdim

// Create oredict with all dimlets
<ore:dimlet>.add([
	<rftoolsdim:dimlet_base:0>,
	<rftoolsdim:dimlet_control_circuit:0>,
	<rftoolsdim:dimlet_control_circuit:1>,
	<rftoolsdim:dimlet_control_circuit:2>,
	<rftoolsdim:dimlet_control_circuit:3>,
	<rftoolsdim:dimlet_control_circuit:4>,
	<rftoolsdim:dimlet_control_circuit:5>,
	<rftoolsdim:dimlet_control_circuit:6>,
	<rftoolsdim:dimlet_energy_module:0>,
	<rftoolsdim:dimlet_energy_module:1>,
	<rftoolsdim:dimlet_energy_module:2>,
	<rftoolsdim:dimlet_memory_unit:0>,
	<rftoolsdim:dimlet_memory_unit:1>,
	<rftoolsdim:dimlet_memory_unit:2>,
	<rftoolsdim:dimlet_type_controller:0>,
	<rftoolsdim:dimlet_type_controller:1>,
	<rftoolsdim:dimlet_type_controller:2>,
	<rftoolsdim:dimlet_type_controller:3>,
	<rftoolsdim:dimlet_type_controller:4>,
	<rftoolsdim:dimlet_type_controller:5>,
	<rftoolsdim:dimlet_type_controller:6>,
	<rftoolsdim:dimlet_type_controller:7>,
	<rftoolsdim:dimlet_type_controller:8>,
	<rftoolsdim:dimlet_type_controller:9>,
	<rftoolsdim:dimlet_type_controller:10>,
	<rftoolsdim:dimlet_type_controller:11>,
	<rftoolsdim:dimlet_type_controller:12>,
	<rftoolsdim:dimlet_type_controller:13>,
	<rftoolsdim:dimlet_type_controller:14>,
]);

scripts.jei.crafting_hints.addInsOutCatl([<rftoolsdim:dimlet_parcel>], <ore:dimlet>.firstItem);

# *======= Recipes =======*
	
# [Dimension Builder] from [Basic Fusion Crafting Injector][+8]
craft.remake(<rftoolsdim:dimension_builder>, ["pretty",
  "A i E",
  "o B V",
  "S I D"], {
  "A": <ic2:te:57>,                                 # Advanced Miner
  "i": <exnihilocreatio:item_mesh:4>,               # Diamond Stiffened Mesh
  "E": <avaritia:endest_pearl>,                     # Endest Pearl
  "o": <environmentaltech:void_ore_miner_cont_6:*>, # Void Ore Miner Controller Tier 6
  "B": <draconicevolution:crafting_injector>,       # Basic Fusion Crafting Injector
  "V": <environmentaltech:void_res_miner_cont_6:*>, # Void Resource Miner Controller Tier 6
  "S": <rftools:shape_card:3>,                      # Shape Card (Silk Quarry)
  "I": <industrialforegoing:infinity_drill:*>,      # Infinity Drill
  "D": <mekanism:machineblock:4>,                   # Digital Miner
});

# Dimension Editor
	recipes.remove(<rftoolsdim:dimension_editor>);
	recipes.addShapedMirrored("Dimension Editor", 
	<rftoolsdim:dimension_editor>, 
	[[<rftools:machine_base>, <draconicevolution:crafting_injector>, <rftools:machine_base>],
	[<rftools:machine_frame>, <thermalexpansion:frame:148>, <rftools:machine_frame>], 
	[<rftools:machine_base>, <draconicevolution:crafting_injector>, <rftools:machine_base>]]);

# Dimlet Workbench
	recipes.remove(<rftoolsdim:dimlet_workbench>);
	recipes.addShapedMirrored("Dimlet Workbench", 
	<rftoolsdim:dimlet_workbench>, 
	[[<vaultopic:vice>, <rftoolsdim:dimlet_base>, <vaultopic:vice>],
	[<rftools:crafter3>.anyDamage(), <thermalexpansion:frame:148>, <rftools:crafter3>.anyDamage()], 
	[<vaultopic:vice>, utils.tryCatch(itemUtils.getItem("rftoolscontrol:workbench", 32767), <rftools:crafter3:*>), <vaultopic:vice>]]);

# [Dimension Enscriber] from [Dimension Enscriber Prototype][+3]
craft.remake(<rftoolsdim:dimension_enscriber>, ["pretty",
  "P Ϟ P",
  "Ϟ D Ϟ",
  "P W P"], {
  "P": <draconicevolution:particle_generator>,  # Particle Generator
  "Ϟ": <draconicevolution:energy_storage_core>, # Energy Core
  "D": <rftdimtweak:dimension_enscriber>,       # Dimension Enscriber Prototype
  "W": <draconicevolution:wyvern_energy_core>,
});

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
	
	
	