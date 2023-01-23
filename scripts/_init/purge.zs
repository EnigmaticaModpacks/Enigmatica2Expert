/**
 * @file Remove all items and their OreDicts BEFORE other scripts loads
 * to prevent iterating over purged items
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

#priority 3000
#ignoreBracketErrors
	
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
utils.rh(<bhc:wither_bone>);
utils.rh(<avaritia:compressed_crafting_table>);
utils.rh(<avaritia:double_compressed_crafting_table>);

// BoP Ethereal wood (unobtainable)
utils.rh(<biomesoplenty:log_1:4>);
utils.rh(<biomesoplenty:leaves_1:11>);
utils.rh(<biomesoplenty:planks_0:4>);
utils.rh(<biomesoplenty:ethereal_stairs>);
utils.rh(<biomesoplenty:wood_slab_0:4>);
utils.rh(<biomesoplenty:ethereal_fence>);
utils.rh(<biomesoplenty:ethereal_fence_gate>);
utils.rh(<biomesoplenty:ethereal_door:*>);
utils.rh(<biomesoplenty:sapling_0:7>);
utils.rh(<biomesoplenty:boat_ethereal:*>);

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
furnace.remove(<*>, <bigreactors:dustgraphite>);
furnace.remove(<*>, <bigreactors:oreyellorite>);
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
furnace.remove(<*>, <immersiveengineering:ore:1>);
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
utils.rh(<appliedenergistics2:material:40>);
utils.rh(<mysticalagriculture:chunk>);
utils.rh(<mysticalagriculture:chunk:1>);
utils.rh(<mysticalagriculture:chunk:2>);
utils.rh(<mysticalagriculture:chunk:3>);
utils.rh(<mysticalagriculture:chunk:4>);
utils.rh(<mysticalagradditions:insanium:4>);

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

# Purge removed items from furnace
for item in itemUtils.getItemsByRegexRegistryName("thermalfoundation:((tool|armor)\\.|horse_armor_).*") {
	furnace.remove(<*>, item);
}
