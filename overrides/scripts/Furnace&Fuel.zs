

# Removing duplicate recipes
	furnace.remove(<appliedenergistics2:material:5>, <enderio:item_material:33>);
	furnace.remove(<appliedenergistics2:material:5>, <actuallyadditions:item_dust:5>);
	furnace.remove(<appliedenergistics2:material:5>, <nuclearcraft:gem_dust:2>);

# Lithium Dust -> Ingots
	furnace.addRecipe(<nuclearcraft:ingot:6>, <ic2:dust:11>);

# Steel Blend
	furnace.addRecipe(<thermalfoundation:material:160>, <thermalfoundation:material:96>);

# Removing End Ores
	furnace.remove(<netherendingores:ore_end_vanilla:*>);
	furnace.remove(<netherendingores:ore_end_modded_1:*>);
	furnace.remove(<netherendingores:ore_other_1>);
	furnace.remove(<netherendingores:ore_nether_modded_1:2>);
	furnace.remove(<netherendingores:ore_nether_modded_1:4>);
	furnace.remove(<netherendingores:ore_nether_modded_1:13>);
	
# *======= Adding Burnables =======*

# Fire Charges
	furnace.setFuel(<minecraft:fire_charge>, 1200);
# Sulfur
	furnace.setFuel(<ore:dustSulfur>, 300);

# Rosin
	furnace.setFuel(<thermalfoundation:material:832>, 800);

# Apatite
	furnace.setFuel(<forestry:resource_storage>, 1000);
	furnace.setFuel(<forestry:apatite>, 100);
	
