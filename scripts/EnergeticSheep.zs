#modloaded energeticsheep

# Charging regular wool
for i in 0 to 16 {
  mods.thermalexpansion.Infuser.addRecipe(
    <energeticsheep:energetic_wool>.definition.makeStack(i),
    <minecraft:wool>.definition.makeStack(i),
    (((15-i)*(500/15)) as int)+500);
}
