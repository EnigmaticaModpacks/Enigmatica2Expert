	
# *======= Adding Burnables =======*

furnace.setFuel(<minecraft:fire_charge>, 1200);# Fire Charges
furnace.setFuel(<ore:dustSulfur>, 300);# Sulfur
furnace.setFuel(<thermalfoundation:material:832>, 800);# Rosin
furnace.setFuel(<forestry:resource_storage>, 1000); # Apatite
furnace.setFuel(<forestry:apatite>, 100);
	
# Set fuels for animal ingredients
furnace.setFuel(<randomthings:ingredient:13>, 1200); # Blackout Powder
furnace.setFuel(<rats:little_black_squash_balls>, 8000);
furnace.setFuel(<contenttweaker:conglomerate_of_coal>, 60000);
furnace.setFuel(<contenttweaker:blasted_coal>, 120000);
furnace.setFuel(<contenttweaker:empowered_phosphor>, 180000);
furnace.setFuel(<contenttweaker:saturated_phosphor>, 450000);

# Purge removed items from furnace
for item in itemUtils.getItemsByRegexRegistryName("thermalfoundation:((tool|armor)\\.|horse_armor_).*") {
	furnace.remove(<*>, item);
}