/**
 * @file Remove all items and their OreDicts BEFORE other scripts loads
 * to prevent iterating over purged items
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

#priority 3000
#ignoreBracketErrors

import crafttweaker.item.IItemStack;
	
# MFE -> MFSU Upgrade Kit removal
utils.rh(<ic2:upgrade_kit>);

# Industrial Diamond (Replaced with regular diamond)
utils.rh(<ic2:crafting:19>);
utils.rh(<ic2:ingot:8>);

# Unused dusts
utils.rh(<ic2:ingot:3>);
utils.rh(<ic2:dust:4>);
utils.rh(<ic2:dust:7>);
utils.rh(<ic2:dust:10>);
utils.rh(<ic2:dust:12>);
utils.rh(<ic2:dust:14>);
utils.rh(<ic2:dust:17>);
utils.rh(<ic2:dust:25>);
utils.rh(<ic2:nuclear:6>);
utils.rh(<ic2:nuclear:8>);
utils.rh(<ic2:nuclear:9>);
utils.rh(<ic2:resource:8>); # Steel blocks
utils.rh(<ic2:resource:6>); # Copper blocks
utils.rh(<ic2:resource:9>); # Tin blocks
utils.rh(<ic2:resource:15>); # Silver blocks
utils.rh(<ic2:resource:7>); # Lead blocks
utils.rh(<ic2:misc_resource>); # Ashes
utils.rh(<ic2:misc_resource:5>); # Slag
utils.rh(<openblocks:generic:1>); # Crane ingredient
utils.rh(<openblocks:generic:2>);
utils.rh(<openblocks:generic:3>);
utils.rh(<openblocks:generic:4>);
utils.rh(<openblocks:generic:5>);
utils.rh(<openblocks:cursor>);
utils.rh(<actuallyadditions:item_misc:17>);
utils.rh(<avaritia:compressed_crafting_table>);
utils.rh(<avaritia:double_compressed_crafting_table>);
utils.rh(<avaritia:resource>); # Diamond Lattice

# Purge saltpeter and sulfur
utils.rh(<bloodmagic:component:24>);
utils.rh(<bloodmagic:component:23>);

# TC nuggets
for i in 0 .. 5 {
	utils.rh(<thaumcraft:nugget>.definition.makeStack(i));
}


					
# *======= Metal Nuggets =======*

utils.rh(<immersiveengineering:metal:29>);
utils.rh(<immersiveengineering:metal:20>);
utils.rh(<immersiveengineering:metal:21>);
utils.rh(<immersiveengineering:metal:22>);
utils.rh(<immersiveengineering:metal:23>);
utils.rh(<immersiveengineering:metal:24>);
utils.rh(<immersiveengineering:metal:26>);
utils.rh(<immersiveengineering:metal:27>);
utils.rh(<immersiveengineering:metal:28>);
utils.rh(<extendedcrafting:material:128>);
utils.rh(<extendedcrafting:material:129>);
utils.rh(<opencomputers:material:29>); // Diamond nugget
utils.rh(<opencomputers:material>);

# Remove Refined storage cables
if(isNull(loadedMods["refinedstorage"])) {
	utils.rh(<immersivecables:coil_block:3>);
	utils.rh(<immersivecables:wire_coil:3>);
}

/*Inject_js(
(getUnchangedFurnaceRecipes()??[])
.filter((r) => isJEIBlacklisted(r.in_id, r.in_meta) && !isPurged(r.input))
.map(({input})=>[`furnace.remove(<*>, ${input});`])
)*/
furnace.remove(<*>, <actuallyadditions:item_dust:5>);
furnace.remove(<*>, <biomesoplenty:gem_ore:7>);
furnace.remove(<*>, <enderio:item_material:33>);
furnace.remove(<*>, <forestry:resources:1>);
furnace.remove(<*>, <forestry:resources:2>);
furnace.remove(<*>, <ic2:dust:8>);
furnace.remove(<*>, <ic2:dust>);
furnace.remove(<*>, <ic2:resource:1>);
furnace.remove(<*>, <ic2:resource:2>);
furnace.remove(<*>, <ic2:resource:3>);
furnace.remove(<*>, <ic2:resource:4>);
furnace.remove(<*>, <iceandfire:sapphire_ore:*>);
furnace.remove(<*>, <iceandfire:silver_ore:*>);
furnace.remove(<*>, <immersiveengineering:metal:9>);
furnace.remove(<*>, <immersiveengineering:metal:10>);
furnace.remove(<*>, <immersiveengineering:metal:11>);
furnace.remove(<*>, <immersiveengineering:metal:12>);
furnace.remove(<*>, <immersiveengineering:metal:13>);
furnace.remove(<*>, <immersiveengineering:metal:15>);
furnace.remove(<*>, <immersiveengineering:metal:16>);
furnace.remove(<*>, <immersiveengineering:metal:17>);
furnace.remove(<*>, <immersiveengineering:metal:18>);
furnace.remove(<*>, <immersiveengineering:metal:19>);
furnace.remove(<*>, <immersiveengineering:ore:2>);
furnace.remove(<*>, <immersiveengineering:ore:3>);
furnace.remove(<*>, <immersiveengineering:ore:4>);
furnace.remove(<*>, <immersiveengineering:ore>);
furnace.remove(<*>, <twilightforest:raw_venison:*>);
/**/

# *======= Metal Blocks =======*
recipes.remove(<mekanism:basicblock:12>);
recipes.remove(<mekanism:basicblock:1>);
recipes.remove(<mekanism:basicblock:3>);
recipes.remove(<mekanism:basicblock:5>);
recipes.remove(<mekanism:basicblock:13>);
recipes.remove(<forestry:resource_storage:3>);
recipes.remove(<forestry:resource_storage:1>);
recipes.remove(<forestry:resource_storage:2>);
recipes.remove(<tcomplement:storage>);
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
recipes.remove(<ic2:ingot:2>);
recipes.remove(<ic2:ingot:3>);
recipes.remove(<ic2:ingot:4>);
recipes.remove(<ic2:ingot:5>);
recipes.remove(<ic2:ingot:6>);
recipes.remove(<ic2:resource:5>);
utils.rh(<ic2:resource:5>); # Bronze
utils.rh(<ic2:ingot:1>);
# *============================*

utils.rh(<contenttweaker:item_ore_tungsten:1>);
utils.rh(<contenttweaker:item_ore_tungsten:3>);
utils.rh(<jaopca:block_blocktungsten>);
utils.rh(<jaopca:item_nuggettungsten>);
utils.rh(<enderio:item_owl_egg>, false);
utils.rh(<thermalfoundation:material:656>);
utils.rh(<ae2stuff:visualiser>);
utils.rh(<itemfilters:filter>);
utils.rh(<excompressum:ore_smasher>);
utils.rh(<forestry:gear_tin>);
utils.rh(<forestry:gear_bronze>);
utils.rh(<forestry:gear_copper>);
utils.rh(<forestry:greenhouse.window>);
utils.rh(<forestry:greenhouse.window_up>);
utils.rh(<appliedenergistics2:material:40>);
utils.rh(<mysticalagriculture:chunk>);
utils.rh(<mysticalagriculture:chunk:1>);
utils.rh(<mysticalagriculture:chunk:2>);
utils.rh(<mysticalagriculture:chunk:3>);
utils.rh(<mysticalagriculture:chunk:4>);
utils.rh(<mysticalagradditions:insanium:4>);
utils.rh(<mysticalagradditions:stuff:69>);
utils.rh(<immersiveengineering:ore:1>);
utils.rh(<qmd:ingot:3>); // Titanium Ingot

# Pams replacements
utils.rh(<harvestcraft:chilipepperitem>);
utils.rh(<harvestcraft:chilipepperseeditem>);
utils.rh(<harvestcraft:coffeebeanitem>);
utils.rh(<harvestcraft:coffeeseeditem>);
utils.rh(<harvestcraft:grapeitem>);
utils.rh(<harvestcraft:grapeseeditem>);
utils.rh(<harvestcraft:olive_sapling>);
utils.rh(<harvestcraft:oliveitem>);
utils.rh(<harvestcraft:pamolive>);
utils.rh(<harvestcraft:tomatoitem>);
utils.rh(<harvestcraft:tomatoseeditem>);
utils.rh(<harvestcraft:beanseeditem>);
utils.rh(<harvestcraft:beanitem>);

utils.rh(<thaumicwonders:eldritch_cluster:0>);
utils.rh(<thaumicwonders:eldritch_cluster:1>);
utils.rh(<thaumicwonders:eldritch_cluster:2>);
utils.rh(<thaumicwonders:eldritch_cluster:3>);
utils.rh(<thaumicwonders:eldritch_cluster:4>);
utils.rh(<thaumicwonders:eldritch_cluster:5>);
utils.rh(<thaumicwonders:eldritch_cluster:6>);
utils.rh(<thaumicwonders:eldritch_cluster:7>);
utils.rh(<thaumicwonders:eldritch_cluster:8>);

# Purge removed items from furnace
for item in itemUtils.getItemsByRegexRegistryName("thermalfoundation:((tool|armor)\\.|horse_armor_).*") {
	furnace.remove(<*>, item);
}

// Gears
val gearsToRemove = [
	<appliedenergistics2:material:40>,
	<thermalfoundation:material:22>,
	<thermalfoundation:material:23>,
	<thermalfoundation:material:24>,
	<thermalfoundation:material:25>,
	<thermalfoundation:material:26>,
	<thermalfoundation:material:27>,
	<thermalfoundation:material:256>,
	<thermalfoundation:material:257>,
	<thermalfoundation:material:258>,
	<thermalfoundation:material:259>,
	<thermalfoundation:material:260>,
	<thermalfoundation:material:261>,
	<thermalfoundation:material:262>,
	<thermalfoundation:material:263>,
	<thermalfoundation:material:264>,
	<thermalfoundation:material:288>,
	<thermalfoundation:material:289>,
	<thermalfoundation:material:290>,
	<thermalfoundation:material:291>,
	<thermalfoundation:material:292>,
	<thermalfoundation:material:293>,
	<thermalfoundation:material:294>,
	<thermalfoundation:material:295>,
	<redstonearsenal:material:96>,
	<jaopca:item_geardraconium>,
] as IItemStack[];

for items in gearsToRemove {
	recipes.remove(items);
}
