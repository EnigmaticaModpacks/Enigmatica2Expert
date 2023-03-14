import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;

# Tanks and such here retain their recipes.

var tanks as IItemStack[] = [
	<ic2:fluid_cell>,
	<thermalexpansion:florb:1>,
	<forestry:can>,
	<forestry:capsule>,
	<forestry:refractory>,
	<openblocks:tank>,
	<minecraft:bucket>
];

for item in tanks {
	mods.jei.JEI.addDescription(item,"Tanks and buckets have had their filled versions hidden in JEI, you can still fill them as you normally would.");
}
