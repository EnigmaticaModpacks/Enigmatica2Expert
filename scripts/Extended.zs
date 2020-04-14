import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.jei.JEI.removeAndHide as rh;
import mods.immersivetweaker.Recycling;
import mods.inworldcrafting.FluidToItem.transform as fti;
import mods.tcomplement.highoven.HighOven;
import mods.tcomplement.highoven.MixRecipeBuilder;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;

import mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput as ncAlloyRm;

#priority -1


# ###################################
# *======= Slime Boots =======*
function remakeSlimeBoots(name as string, item as IItemStack, primary as IIngredient){
	remake("Slime Boots " ~ name, item, 
		[[<ore:slimeballGreen>, <ore:slimeballBlue>, <ore:slimeballPurple>],
		[<ore:slimeballBlood>, <minecraft:wool:*>, <ore:slimeballMagma>], 
		[primary, <minecraft:leather_boots>.anyDamage(), primary]]);
}

remakeSlimeBoots("Green",  <tconstruct:slime_boots>,   <tconstruct:slime_congealed>);
remakeSlimeBoots("Blue",   <tconstruct:slime_boots:1>, <tconstruct:slime_congealed:1>);
remakeSlimeBoots("Purple", <tconstruct:slime_boots:2>, <tconstruct:slime_congealed:2>);
remakeSlimeBoots("Red",    <tconstruct:slime_boots:3>, <tconstruct:slime_congealed:3>);
remakeSlimeBoots("Orange", <tconstruct:slime_boots:4>, <tconstruct:slime_congealed:4>);

# ###################################
# Ring Of The Flying Squid
	remake("Ring Of The Flying Squid",
	<extrautils2:chickenring:1>, 
	[[<extrautils2:ineffableglass>, <minecraft:elytra>.anyDamage(), <extrautils2:ineffableglass>],
	[<ore:plateDenseGold>, <actuallyadditions:item_misc:19>, <ore:plateDenseGold>], 
	[<minecraft:golden_apple>, <extrautils2:chickenring>, <minecraft:golden_apple>]]);

# Angel Ring
for i in 0 to 6 {
	recipes.removeByRecipeName("extrautils2:angel_ring_" ~ i); # Remove shaped
}
recipes.addShaped("Angel Ring", 
	<extrautils2:angelring>, [
	[<ore:plateDenseGold>, <botania:flighttiara:*>, <ore:plateDenseGold>], 
	[<environmentaltech:modifier_creative_flight>, <extendedcrafting:material:40>, <environmentaltech:modifier_creative_flight>], 
	[<ore:plateDenseGold>, <extrautils2:chickenring:1>, <ore:plateDenseGold>]
]);
	


# ###################################
# Slime Slings
function remakeSlimeSlings(name as string, item as IItemStack, primary as IIngredient){
	remake("Slime Sling " ~ name, item, [
		[<ore:slimeball>, null, <ore:slimeball>], 
		[<ore:slimeball>, <cyclicmagic:tool_launcher>.anyDamage(), <ore:slimeball>], 
		[null, primary, null]
	]);
}

remakeSlimeSlings("Green",  <tconstruct:slimesling>,   <tconstruct:slime_congealed>);
remakeSlimeSlings("Blue",   <tconstruct:slimesling:1>, <tconstruct:slime_congealed:1>);
remakeSlimeSlings("Purple", <tconstruct:slimesling:2>, <tconstruct:slime_congealed:2>);
remakeSlimeSlings("Red",    <tconstruct:slimesling:3>, <tconstruct:slime_congealed:3>);
remakeSlimeSlings("Magma",  <tconstruct:slimesling:4>, <tconstruct:slime_congealed:4>);


# ###################################
# Omni directional
var connector = <integrateddynamics:part_connector_omni_directional_item>;
var part = <integrateddynamics:logic_director>;
var mono = <integrateddynamics:part_connector_mono_directional_item>;
recipes.remove(connector);

recipes.addShaped("part_connector_omni_directional_item_11", connector * 3, [
	[part, <enderstorage:ender_storage>, part], 
	[mono, connector, mono],
	[null, part, null]]);

recipes.addShaped("part_connector_omni_directional_item", connector * 2, [
	[part, <enderstorage:ender_storage>, part], 
	[mono, <integrateddynamics:cable>, mono], 
	[null, part, null]]);

# interface_crafting
recipes.remove(<integratedcrafting:part_interface_crafting_item>);
recipes.addShaped("part_interface_crafting_item", 
	<integratedcrafting:part_interface_crafting_item>, 
	[[<ore:ingotIron>, <appliedenergistics2:crafting_unit>, <ore:ingotIron>], 
	[<integrateddynamics:variable_transformer>, <integrateddynamics:crystalized_menril_block>, <integrateddynamics:variable_transformer:1>], 
	[<ore:ingotIron>, <appliedenergistics2:crafting_unit>, <ore:ingotIron>]]);

# terminal_storage
recipes.remove(<integratedterminals:part_terminal_storage_item>);
	recipes.addShaped("part_terminal_storage_item", 
	<integratedterminals:part_terminal_storage_item>, 
	[[<ore:dustGlowstone>, <integratedterminals:menril_glass>, <ore:dustGlowstone>], 
	[<integrateddynamics:variable_transformer>, <integrateddynamics:part_display_panel_item>, <integrateddynamics:variable_transformer:1>], 
	[<ore:dustGlowstone>, <rftools:storage_scanner>, <ore:dustGlowstone>]]);


# ###################################
# Ore Excavation
recipes.remove(<oeintegration:excavatemodifier>);
val kitWheels = <tconstruct:sharpening_kit>.withTag({Material: "stone"});
recipes.addShaped("excavatemodifier", <oeintegration:excavatemodifier>, [
	[<rats:little_black_squash_balls>, <tconstruct:excavator_head>.withTag({Material: "bronze"}), <rats:little_black_squash_balls>], 
	[<ore:compressed3xDirt>, <ore:compressed3xCobblestone>, <ore:compressed3xNetherrack>], 
	[kitWheels, kitWheels, kitWheels]
]);



# ######################################################################
#
# RFTools storages
#
# ######################################################################

// recipes.removeByRecipeName("rftools:storage_module_0");
// recipes.removeByRecipeName("rftools:storage_module_1");
// recipes.removeByRecipeName("rftools:storage_module_2");

// recipes.addShaped("rftools:storage_module_0", <rftools:storage_module>, [[null, <ore:chest>, null], [<minecraft:gold_nugget>, <minecraft:iron_ingot>, <minecraft:gold_nugget>], [<minecraft:quartz>, <minecraft:redstone>, <minecraft:quartz>]]);
// recipes.addShaped("rftools:storage_module_1", <rftools:storage_module:1>, [[null, <ore:chest>, null], [<minecraft:gold_ingot>, <rftools:storage_module>, <minecraft:gold_ingot>], [<minecraft:quartz>, <minecraft:redstone>, <minecraft:quartz>]]);
// recipes.addShaped("rftools:storage_module_2", <rftools:storage_module:2>, [[null, <ore:chest>, null], [<minecraft:gold_block>, <rftools:storage_module:1>, <minecraft:gold_block>], [<minecraft:quartz_block>, <minecraft:redstone_block>, <minecraft:quartz_block>]]);

# Remove Sieves
recipes.remove(<exnihilocreatio:item_mesh:*>);

# ######################################################################
#
# Conarm
#
# ######################################################################

function remakeResistance(name as string, item as IItemStack, primary as IIngredient){
	remake(name, item, 
		[[<ore:blockDarkSteel>, primary, <ore:blockDarkSteel>],
		[  primary, <ore:myrmexResinGlass>, primary], 
		[<ore:blockDarkSteel>, primary, <ore:blockDarkSteel>]]);
}

remakeResistance("conarm_resist_mat", 	    <conarm:resist_mat>,	   <ore:dragonsteelIngot>);
remakeResistance("conarm_resist_mat_fire",  <conarm:resist_mat_fire>,  <ore:dragonscaleBlock>);
remakeResistance("conarm_resist_mat_proj",  <conarm:resist_mat_proj>,  <ore:deathwormChitin>);
remakeResistance("conarm_resist_mat_blast", <conarm:resist_mat_blast>, <ore:seaSerpentScaleBlock>);


# ######################################################################
#
# Misc
#
# ######################################################################

# Blood stone from moon stone in Life Essense
fti(<randomthings:rezstone>, <fluid:lifeessence>, <extrautils2:ingredients:5>);

# Precious emerald from emerald in blueslime
fti(<randomthings:ingredient:9>, <fluid:blueslime>, <ore:oreEmerald>);

# Remove excess mesh
rh(<excompressum:iron_mesh>);

# Remove Refined storage cables
rh(<immersivecables:coil_block:3>);
rh(<immersivecables:wire_coil:3>);


# Make Quicksand
mods.inworldcrafting.FluidToFluid.transform(<liquid:sand>, <liquid:blueslime>, <ore:soulSand>);

# Sandwiches
var anyDragonsteelSword as IIngredient = <tconstruct:large_sword_blade>.withTag({Material: "dragonsteel_fire"}) |
	<tconstruct:large_sword_blade>.withTag({Material: "dragonsteel_ice"});
remakeEx(<culinaryconstruct:sandwich_station>, [
	[<nuclearcraft:moresmore>, anyDragonsteelSword, <nuclearcraft:moresmore>], 
	[<cookingforblockheads:counter>, <cookingforblockheads:cooking_table>, <cookingforblockheads:counter>], 
	[<cookingforblockheads:counter>, <cookingforblockheads:counter>, <cookingforblockheads:counter>]
]);

# Floo dust
remakeEx(<randomthings:ingredient:7>*8, [
	[<ore:enderpearl>, <ore:alloyBasic>, null], 
	[<ore:gunpowder>, <ore:cropBean>, null]
]);
recipes.addShaped("Floo Dust 64", <randomthings:ingredient:7>*64, [
	[<appliedenergistics2:material:46>, <ore:alloyBasic>, null], 
	[<ore:gunpowder>, <ore:cropBean>, null]
]);

# Lubricient
remakeEx(<randomthings:ingredient:6> * 4, [
	[<minecraft:wheat_seeds>, <minecraft:potion>.withTag({Potion: "minecraft:water"})], 
	[null, <ore:cropBean>]
	]);


# Ender book
recipes.remove(<cyclicmagic:book_ender>);
recipes.addShaped(<cyclicmagic:book_ender>, [
	[<randomthings:flootoken>, <rats:ratlantean_flame>, <randomthings:flootoken>], 
	[<randomthings:flootoken>, <minecraft:book>, <randomthings:flootoken>], 
	[<randomthings:flootoken>, <randomthings:flootoken>, <randomthings:flootoken>]
]);

/* 
# Add a recyclable item 
Recycling.allowItemForRecycling(<minecraft:iron_horse_armor>); 

# Prevent an item from being outputted 
Recycling.makeStackInvalidRecyclingOutput(<minecraft:iron_ingot>);
 */


# Infusion crystals
//recipes.replaceAllOccurences(IIngredient toReplace, IIngredient replaceWith, @Optional IIngredient forOutput);
recipes.replaceAllOccurences(<ore:gemDiamond>, <mysticalagriculture:infusion_crystal>.anyDamage(), <matc:inferiumcrystal>);

# Upgrade for laser (laser is deprecated)
rh(<tmemes:electric_upgrade:1>);

# Dislocator
recipes.remove(<draconicevolution:dislocator>);
#mods.rt.RandomThingsTweaker.addAnvilRecipe(<cyclicmagic:book_ender>, <draconicevolution:draconium_block>, <draconicevolution:dislocator>, 5);
makeEx(<draconicevolution:dislocator>, [[null, <rftools:infused_enderpearl>, null],[<mekanism:portableteleporter>, <cyclicmagic:ender_pearl_reuse>.anyDamage(), <mekanism:portableteleporter>], [null, <rftools:infused_enderpearl>, null]]);

# Telekinetic alloy
recipes.remove(<cd4017be_lib:m:402>);
recipes.addShapeless(<cd4017be_lib:m:402>, [<ore:dustDiamond>, <ore:dustLapis>, <randomthings:ingredient:7>]);
# Telekinetic Actuator
remakeEx(<cd4017be_lib:m:401>, [[<cd4017be_lib:m:402>, <mekanism:ingot:3>, <cd4017be_lib:m:402>],[<rs_ctr:wire_e>, <opencomputers:upgrade:20>, <rs_ctr:wire_e>], [<cd4017be_lib:m:402>, <mekanism:ingot:3>, <cd4017be_lib:m:402>]]);


# Peacock fan
recipes.addShaped(<twilightforest:peacock_fan>, [
	[<ore:peacockFeathers>, <ore:peacockFeathers>, null], 
	[<forestry:oak_stick>, <forestry:oak_stick>, <ore:peacockFeathers>], 
	[<ore:slimecrystalBlue>, <forestry:oak_stick>, <ore:peacockFeathers>]
]);

# Nuclearcraft Speed and Energy upgrades
recipes.remove(<nuclearcraft:upgrade>);
makeEx(<nuclearcraft:upgrade>*2, [
	[<ore:blockSheetmetalIron>, <ore:itemCompressedRedstone>, <ore:blockSheetmetalIron>], 
	[<ore:itemCompressedRedstone>, 
		<rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:speed", Duration: 9600, Amplifier: 0}]}) | 
		<rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:speed", Duration: 1800, Amplifier: 1}]}), 
	<ore:itemCompressedRedstone>], 
	[<ore:blockSheetmetalIron>, <ore:itemCompressedRedstone>, <ore:blockSheetmetalIron>]
]);
recipes.remove(<nuclearcraft:upgrade:1>);
makeEx(<nuclearcraft:upgrade:1>*2, [
	[<ore:blockSheetmetalGold>, <ore:itemCompressedObsidian>, <ore:blockSheetmetalGold>], 
	[<ore:itemCompressedObsidian>, 
		<rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:haste", Duration: 9600, Amplifier: 0}]}) | 
		<rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:haste", Duration: 1800, Amplifier: 1}]}), 
	<ore:itemCompressedObsidian>], 
	[<ore:blockSheetmetalGold>, <ore:itemCompressedObsidian>, <ore:blockSheetmetalGold>]
]);


# Mekanism Induction difficult
remakeEx(<mekanism:basicblock2:4>.withTag({tier: 3}), [[<mekanism:tierinstaller:3>, <mekanism:basicblock2:4>.withTag({tier: 2}), <mekanism:tierinstaller:3>],[<mekanism:basicblock2:4>.withTag({tier: 2}), <mekanism:energycube>.withTag({tier: 3}), <mekanism:basicblock2:4>.withTag({tier: 2})], [<mekanism:tierinstaller:3>, <mekanism:basicblock2:4>.withTag({tier: 2}), <mekanism:tierinstaller:3>]]);
remakeEx(<mekanism:basicblock2:4>.withTag({tier: 2}), [[<ore:circuitElite>, 	 <mekanism:basicblock2:4>.withTag({tier: 1}), <ore:circuitElite>],[<mekanism:basicblock2:4>.withTag({tier: 1}), <mekanism:energycube>.withTag({tier: 2}), <mekanism:basicblock2:4>.withTag({tier: 1})], [<ore:circuitElite>, <mekanism:basicblock2:4>.withTag({tier: 1}), <ore:circuitElite>]]);
remakeEx(<mekanism:basicblock2:4>.withTag({tier: 1}), [[<ore:circuitAdvanced>, <mekanism:basicblock2:4>.withTag({tier: 0}), <ore:circuitAdvanced>],[<mekanism:basicblock2:4>.withTag({tier: 0}), <mekanism:energycube>.withTag({tier: 1}), <mekanism:basicblock2:4>.withTag({tier: 0})], [<ore:circuitAdvanced>, <mekanism:basicblock2:4>.withTag({tier: 0}), <ore:circuitAdvanced>]]);
remakeEx(<mekanism:basicblock2:4>.withTag({tier: 0}), [[<ore:circuitBasic>,	 <nuclearcraft:lithium_ion_cell>, <ore:circuitBasic>],[<nuclearcraft:lithium_ion_cell>, <mekanism:energycube>.withTag({tier: 0}), <nuclearcraft:lithium_ion_cell>], [<ore:circuitBasic>, <nuclearcraft:lithium_ion_cell>, <ore:circuitBasic>]]);

# Tablet
remakeEx(<mekanism:energytablet>, [[<ore:alloyAdvanced>, <ore:plateDenseCopper>, <ore:alloyAdvanced>],[<ore:dustLithium>, <ore:plateDenseGold>, <ore:dustLithium>], [<ore:alloyAdvanced>, <ore:plateDenseCopper>, <ore:alloyAdvanced>]]);


# Mek induction
remakeEx(<mekanism:basicblock2:3>.withTag({tier: 0}), [
	[<enderio:block_cap_bank:1>, <ore:battery>, <enderio:block_cap_bank:1>], 
	[<ore:battery>, <mekanism:energycube>.withTag({tier: 0}), <ore:battery>], 
	[<enderio:block_cap_bank:1>, <ore:battery>, <enderio:block_cap_bank:1>]
]);
remakeEx(<mekanism:basicblock2:3>.withTag({tier: 1}), [
	[<enderio:block_cap_bank:2>, <mekanism:basicblock2:3>.withTag({tier: 0}), <enderio:block_cap_bank:2>], 
	[<mekanism:basicblock2:3>.withTag({tier: 0}), <mekanism:energycube>.withTag({tier: 1}), <mekanism:basicblock2:3>.withTag({tier: 0})], 
	[<enderio:block_cap_bank:2>, <mekanism:basicblock2:3>.withTag({tier: 0}), <enderio:block_cap_bank:2>]
]);
remakeEx(<mekanism:basicblock2:3>.withTag({tier: 2}), [
	[<enderio:block_cap_bank:3>, <mekanism:basicblock2:3>.withTag({tier: 1}), <enderio:block_cap_bank:3>], 
	[<mekanism:basicblock2:3>.withTag({tier: 1}), <mekanism:energycube>.withTag({tier: 2}), <mekanism:basicblock2:3>.withTag({tier: 1})], 
	[<enderio:block_cap_bank:3>, <mekanism:basicblock2:3>.withTag({tier: 1}), <enderio:block_cap_bank:3>]
]);
remakeEx(<mekanism:basicblock2:3>.withTag({tier: 3}), [
	[<draconicevolution:draconium_capacitor:1>, <mekanism:basicblock2:3>.withTag({tier: 2}), <draconicevolution:draconium_capacitor:1>], 
	[<mekanism:basicblock2:3>.withTag({tier: 2}), <mekanism:energycube>.withTag({tier: 3}), <mekanism:basicblock2:3>.withTag({tier: 2})], 
	[<draconicevolution:draconium_capacitor:1>, <mekanism:basicblock2:3>.withTag({tier: 2}), <draconicevolution:draconium_capacitor:1>]
]);

# IC2 Block Cutting blades
# result as IItemStack, itemCenter as IIngredient, itemAround as IIngredient
remakeEnvelop(<ic2:block_cutting_blade>,   <ore:stone>,        <tconstruct:large_sword_blade>.withTag({Material: "iron"}));
remakeEnvelop(<ic2:block_cutting_blade:1>, <ore:blockIron>,    <tconstruct:large_sword_blade>.withTag({Material: "steel"}));
remakeEnvelop(<ic2:block_cutting_blade:2>, <ore:blockDiamond>, <tconstruct:large_sword_blade>.withTag({Material: "alumite"}));


# ######################################################################
#
# MCT Smeltery IO
#
# ######################################################################

remakeEx(<mctsmelteryio:upgrade>, [[<minecraft:dye:4>, <minecraft:dye:4>, <minecraft:dye:4>], [<ore:ingotAluminum> | <ore:ingotLead>, <minecraft:paper>, <ore:ingotAluminum> | <ore:ingotLead>], [<minecraft:dye:4>, <minecraft:dye:4>, <minecraft:dye:4>]]);
remakeEx(<mctsmelteryio:upgrade:1>, [[<ore:ingotCopper>, <minecraft:chest>, <ore:ingotCopper>], [<minecraft:chest>, <mctsmelteryio:upgrade>, <minecraft:chest>], [<ore:ingotCopper>, <minecraft:chest>, <ore:ingotCopper>]]);
remakeEx(<mctsmelteryio:upgrade:2>, [[<ore:ingotAluminum>, <minecraft:iron_ingot>, <ore:ingotAluminum>], [<minecraft:iron_ingot>, <mctsmelteryio:upgrade:1>, <minecraft:iron_ingot>], [<ore:ingotAluminum>, <minecraft:iron_ingot>, <ore:ingotAluminum>]]);
remakeEx(<mctsmelteryio:upgrade:3>, [[<ore:nuggetKnightslime>, <ore:ingotGold>, <ore:nuggetKnightslime>], [<ore:ingotGold>, <mctsmelteryio:upgrade:2>, <ore:ingotGold>], [<ore:nuggetKnightslime>, <ore:ingotGold>, <ore:nuggetKnightslime>]]);
remakeEx(<mctsmelteryio:upgrade:4>, [[<ore:nuggetManyullyn>, <ore:gemDiamond>, <ore:nuggetManyullyn>], [<ore:gemDiamond>, <mctsmelteryio:upgrade:3>, <ore:gemDiamond>], [<ore:nuggetManyullyn>, <ore:gemDiamond>, <ore:nuggetManyullyn>]]);

# Speed upgrade
remakeEx(<mctsmelteryio:upgrade:6>, [
	[<ore:gemEmerald>, <ore:listAllsugar>, <ore:gemEmerald>], 
	[<ic2:upgrade>, <mctsmelteryio:upgrade>, <ic2:upgrade>], 
	[<ore:gemEmerald>, <ore:listAllsugar>, <ore:gemEmerald>]
]);

# Some replications with time
recipes.addShapeless(
	"Timecraft Pulsating Mesh"        /* Name of recipe */, 
	(<forestry:crafting_material:1>*2)/* Output stack */.withLore(["Consume " ~ 
	"4 Hours"                   	    /* Tooltip text */ ~" from bottle"]), [<randomthings:timeinabottle>.marked("timeinabottle").transformNew(function(item) {return item.updateTag({timeData: {storedTime: item.tag.timeData.storedTime - 
	20*60*60*4 	 	              	    /* Consumed Time (ticks) */}});	}),
	<forestry:crafting_material:1>    /* Input stack list [,] */], function(out, ins, cInfo) {	if(ins.timeinabottle.tag.timeData.storedTime >= 
	20*60*60*4	 	              	    /* Same as above */) { return 
	(<forestry:crafting_material:1>*2)/* Output stack */; }	return null; },	null);


# Remove redstone wire recipe 
recipes.removeByRecipeName("cd4017be_lib:rs_ctr/wire");


# ######################################################################
#
# Extra Utilities
#
# ######################################################################

# Reinforced Drum
recipes.remove(<extrautils2:drum:2>);
recipes.addShapedMirrored("Reinforced Drum",
	<extrautils2:drum:2>, [
		[<thermalfoundation:upgrade:33>, <botania:storage:3>, <thermalfoundation:upgrade:33>],
		[<extrautils2:drum:1>, <extrautils2:drum:1>, <extrautils2:drum:1>], 
		[<thermalfoundation:upgrade:33>, <botania:storage:3>, <thermalfoundation:upgrade:33>]
	]);

# Gargantuan Drum
var demonPlate = <tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"});
recipes.remove(<extrautils2:drum:3>);
recipes.addShapedMirrored("Gargantuan Drum",
	<extrautils2:drum:3>, [
		[demonPlate, <liquid:high_pressure_steam>*1000, demonPlate],
		[<extrautils2:drum:2>, <extrautils2:drum:2>, <extrautils2:drum:2>], 
		[demonPlate, <liquid:high_pressure_steam>*1000, demonPlate]
		]);

# Environ Tech Photovoltatic cell
recipes.remove(<environmentaltech:photovoltaic_cell>);
recipes.addShaped(<environmentaltech:photovoltaic_cell>, [
		[<ic2:crafting:4>, <ic2:crafting:4>, <ic2:crafting:4>],
		[<actuallyadditions:block_crystal_empowered:1>, <actuallyadditions:block_crystal_empowered:1>, <actuallyadditions:block_crystal_empowered:1>], 
		[<ic2:crafting:4>, <ic2:crafting:4>, <ic2:crafting:4>]
	]);
recipes.addShaped(<environmentaltech:photovoltaic_cell>, [
		[<advancedrocketry:productsheet:1>, <advancedrocketry:productsheet:1>, <advancedrocketry:productsheet:1>],
		[<ic2:plate:13>, <ic2:plate:13>, <ic2:plate:13>], 
		[<advancedrocketry:productsheet:1>, <advancedrocketry:productsheet:1>, <advancedrocketry:productsheet:1>]
	]);


 


# ######################################################################
#
# Gas Trophy Frame
#
# ######################################################################

# Trophy itself
var creativeGasTankFrame = <simple_trophies:trophy>.withTag({
	TrophyItem:{id:"mekanism:gastank",Count:1 as byte, Damage:0 as short},
	TrophyName:"Creative Gas Tank Frame",
	TrophyVariant:"gold"
});

# Add to JEI and apply Information
mods.jei.JEI.addItem(creativeGasTankFrame);
mods.jei.JEI.addDescription(creativeGasTankFrame, "Craft with 9 DIFFERENT gases");

# Gases to previve. Not actual gases that used to craft
var allGasesNames as string[] = ["hydrogen", "oxygen", "water", "chlorine", "sulfurdioxide", "sulfurtrioxide", "sulfuricacid", "hydrogenchloride", "ethene", "sodium", "brine", "deuterium", "tritium", "fusionfuel", "lithium", "liquidosmium", "cleanIron", "iron", "cleanGold", "gold", "cleanOsmium", "osmium", "cleanCopper", "copper", "cleanTin", "tin", "cleanSilver", "silver", "cleanLead", "lead", "slurryCleanAluminium", "slurryCleanArdite", "slurryCleanAstralStarmetal", "slurryCleanBoron", "slurryCleanCobalt", "slurryCleanDraconium", "slurryCleanIridium", "slurryCleanLithium", "slurryCleanMagnesium", "slurryCleanMithril", "slurryCleanNickel", "slurryCleanPlatinum", "slurryCleanThorium", "slurryCleanTitanium", "slurryCleanUranium", "slurryAluminium", "slurryArdite", "slurryAstralStarmetal", "slurryBoron", "slurryCobalt", "slurryDraconium", "slurryIridium", "slurryLithium", "slurryMagnesium", "slurryMithril", "slurryNickel", "slurryPlatinum", "slurryThorium", "slurryTitanium", "slurryUranium"] as string[];

# Gas Ingredients (can use even gas tank without any gas)
var gt as IIngredient = <mekanism:gastank>.withTag({tier: 3, mekData: { stored: {amount: 512000/* , gasName: allGasesNames[0] */}}}) as IIngredient;
for i in 0 to allGasesNames.length {
  if (!isNull(mods.mekanism.MekanismHelper.getGas(allGasesNames[i]))) {
    gt = gt.or( <mekanism:gastank>.withTag({tier: 3, mekData: { stored: {amount: 512000, gasName: allGasesNames[i]}}}) );
  }
}

# Create list of 9 gases and mark them
var ingList as IIngredient[] = [] as IIngredient[];
for i in 0 to 9 {
  ingList += gt.marked("g"~i);
}

# Get gas name from IItemStack
function getGas(item as IItemStack) as string {
  if (!isNull(item) && !isNull(item.tag) && !isNull(item.tag.mekData) && !isNull(item.tag.mekData.stored) && !isNull(item.tag.mekData.stored.gasName)) {
    return item.tag.mekData.stored.gasName.asString();
  }
  return "";
}

# Add Shapeless Gas Tank recipe
recipes.addShapeless("Creative Gas Tank Frame", 
  creativeGasTankFrame.withLore(["Craft with 9 DIFFERENT gases"]), 
  ingList, 
  
  function(out, ins, cInfo) {
    for i in 0 to 8 {
      for j in (i+1) to 9 {
        if (getGas(ins["g"~i]) == getGas(ins["g"~j])) {
          return null; # We found gas duplicate, return nothing
        }
      }
    }
    return out;
  }, 
  null);

# ######################################################################
#
# JEI
#
# ######################################################################

# All items are hidden, so show only original
// mods.jei.JEI.addItem(<openblocks:tank>);
// mods.jei.JEI.addItem(<enderio:item_soul_vial>);
// mods.jei.JEI.addItem(<rftools:syringe>);

function hideAllExceptOriginal(orig as IItemStack) as string {
	for item in orig.definition.subItems {
    if (!isNull(item.tag.mobID) || !isNull(item.tag.tank) || !isNull(item.tag.entityId)) {
        mods.jei.JEI.hide(item);
    }
	}
}

hideAllExceptOriginal(<enderio:item_soul_vial>);
hideAllExceptOriginal(<openblocks:tank>);
hideAllExceptOriginal(<rftools:syringe>);

# ######################################################################
#
# EnderIO
#
# ######################################################################

# Lava Heat Exchanger
var machineCaseVariant = <nuclearcraft:part:10> | <teslacorelib:machine_case> | <actuallyadditions:block_misc:9> | <mekanism:basicblock:8>;
recipes.remove(<enderio:block_lava_generator>);
recipes.addShaped(<enderio:block_lava_generator>, [
	[<ore:ingotBrickNetherGlazed>, <ore:ingotBrickNetherGlazed>, <ore:ingotBrickNetherGlazed>], 
	[<ore:ingotBrickNetherGlazed>, machineCaseVariant, <ore:ingotBrickNetherGlazed>], 
	[<ore:ingotBrickNetherGlazed>, <enderio:block_tank>, <ore:ingotBrickNetherGlazed>]]);

# Nethercotta
// mods.immersiveengineering.ArcFurnace.addRecipe(IItemStack output, IIngredient input, IItemStack slag, int time, int energyPerTick, @Optional IIngredient[] additives, @Optional String specialRecipeType);
mods.immersiveengineering.ArcFurnace.addRecipe(<enderio:item_material:72>, <ore:ingotBrickNether>, <immersiveengineering:material:7>, 20*4, 2560, [<ore:cropNetherWart>*4, <ore:clay>*6], "Alloying");

# ######################################################################
#
# 
#
# ######################################################################

# Remove unused items
rh(<cd4017be_lib:rrwi>);
rh(<cd4017be_lib:m>);

# Scepters harder
recipes.remove(<cyclicmagic:tool_swap_match>);
recipes.remove(<cyclicmagic:tool_swap>);
recipes.remove(<cyclicmagic:cyclic_wand_build>);
recipes.addShaped(<cyclicmagic:tool_swap>, [[null, <cd4017be_lib:m:402>, <appliedenergistics2:material:10>],[null, <redstonearsenal:material:192>, <cd4017be_lib:m:402>], [<enderio:block_reinforced_obsidian>, null, null]]);
recipes.addShaped(<cyclicmagic:tool_swap_match>, [[null, <cd4017be_lib:m:402>, <randomthings:ingredient:9>],[null, <redstonearsenal:material:192>, <cd4017be_lib:m:402>], [<enderio:block_reinforced_obsidian>, null, null]]);
recipes.addShaped(<cyclicmagic:cyclic_wand_build>, [[null, <cd4017be_lib:m:402>, <minecraft:diamond>],[null, <redstonearsenal:material:192>, <cd4017be_lib:m:402>], [<ore:blockBone>, null, null]]);


# Cyclic Vacuum hopper
recipes.remove(<cyclicmagic:block_vacuum>);
recipes.addShaped(<cyclicmagic:block_vacuum>, [
	[<ore:slabSheetmetalIron>, <ore:plateLapis>, <ore:slabSheetmetalIron>], 
	[<sonarcore:reinforcedstoneblock>, <actuallyadditions:block_misc:4>, <sonarcore:reinforcedstoneblock>], 
	[<sonarcore:reinforcedstoneblock>, <appliedenergistics2:material:45>,<sonarcore:reinforcedstoneblock>]
]);

# User Alternative
recipes.addShapedMirrored(<cyclicmagic:block_user>, 
	[[<ore:ingotGold>, <ore:ingotRefinedObsidian>, <ore:ingotGold>],
	[<minecraft:golden_pickaxe>, <ore:circuitUltimate>, <minecraft:golden_axe>], 
	[<ore:compressed2xCobblestone>, <ore:compressed2xCobblestone>, <ore:compressed2xCobblestone>]]);


# Mekanism Fusion Reactor
recipes.remove(<mekanismgenerators:reactor>);
recipes.addShaped(<mekanismgenerators:reactor>, [
		[<advancedrocketry:intake>, <mekanism:gastank>.withTag({tier: 3}), <advancedrocketry:intake>],
		[<mekanismgenerators:reactor:2>, <nuclearcraft:fusion_core>, <mekanismgenerators:reactor:2>], 
		[<nuclearcraft:lithium_ion_battery_elite>, <nuclearcraft:lithium_ion_battery_elite>, <nuclearcraft:lithium_ion_battery_elite>]
	]);


// mods.nuclearcraft.alloy_furnace.addRecipe(IIngredient itemInput1, IIngredient itemInput2, IIngredient itemOutput, {double timeMultiplier, double powerMultiplier, double processRadiation});
// mods.nuclearcraft.alloy_furnace.removeRecipeWithInput(IIngredient itemInput1, IIngredient itemInput2);
// mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput(IIngredient itemOutput);

# Remove Unused alloy recipes
ncAlloyRm(<enderio:item_alloy_ingot>);
ncAlloyRm(<enderio:item_alloy_ingot:1>);
ncAlloyRm(<enderio:item_alloy_ingot:2>);
ncAlloyRm(<enderio:item_alloy_ingot:3>);
ncAlloyRm(<enderio:item_alloy_ingot:4>);
ncAlloyRm(<enderio:item_alloy_ingot:5>);
ncAlloyRm(<enderio:item_alloy_ingot:6>);
ncAlloyRm(<enderio:item_alloy_ingot:7>);
ncAlloyRm(<enderio:item_alloy_ingot:8>);
ncAlloyRm(<enderio:item_alloy_ingot:9>*3);
ncAlloyRm(<enderio:item_material:14>);
ncAlloyRm(<enderio:item_material:15>);

# Add Cyanite melting recipe
mods.tconstruct.Melting.addRecipe(<liquid:cyanite> * (144*9), <ore:blockCyanite>, 700);
mods.tconstruct.Melting.addRecipe(<liquid:cyanite> * 144, <ore:ingotCyanite> | <ore:dustCyanite>, 450);


# High Oven instead of Alloy Smelter
function addHighOvenRecipe(output as ILiquidStack , input as ILiquidStack , temp as int, 
		oxidizer as IIngredient, outputChance as int, 
		reducer as IIngredient, inputChance as int, 
		purifier as IIngredient, purifierChance as int) {

	var builder = HighOven.newMixRecipe(output, input, temp);

	if (!isNull(oxidizer)) { builder.addOxidizer(oxidizer, outputChance); }
	if (!isNull(reducer))  { builder.addReducer(reducer, inputChance); }
	if (!isNull(purifier)) { builder.addPurifier(purifier, purifierChance); }
	builder.register();
}

# Blutonium
addHighOvenRecipe(<liquid:plutonium> * (144*3), <liquid:cyanite> * (144*6), 2000, 
	<ic2:nuclear:7>, 100, <actuallyadditions:block_crystal_empowered:1>, 75, <ore:blockMithril>, 66);

//mods.tconstruct.Casting.addBasinRecipe(IItemStack output, IIngredient cast, ILiquidStack fluid, int amount, @Optional boolean consumeCast, @Optional int time);
mods.tconstruct.Casting.addBasinRecipe(<bigreactors:blockmetals:3>, null, <liquid:plutonium>, 1296);

# EnderIO simple alloys
addHighOvenRecipe(<liquid:construction_alloy>*144  ,<liquid:iron>*48         , 1800  , <ore:dustBedrock>  , 50  , <ore:dustLead>      , 100  , null            , 100);
addHighOvenRecipe(<liquid:dark_steel> *144         ,<liquid:steel>*144       , 4400 , <ore:dustBedrock>  , 50  , <ore:dustObsidian>  , 100  , null            , 100);
addHighOvenRecipe(<liquid:end_steel> *144          ,<liquid:dark_steel>*144  , 5200 , <ore:dustBedrock>  , 50  , <ore:dustEndstone>  , 100  , <ore:obsidian>  , 100);

# Oxidisers on choose
val ox as IIngredient = <ore:dustCyanite> | <ore:itemSlagRich> | <ore:dustPsi>;

# EnderIO hard alloys
addHighOvenRecipe(<liquid:soularium> *144          ,<liquid:gold>*144           , 3400 , <ore:dustBedrock>  , 50  , <mysticalagriculture:crafting:28>, 100, ox, 25);
addHighOvenRecipe(<liquid:electrical_steel> *144   ,<liquid:steel>*144          , 2000 , <ore:dustBedrock>  , 50  , <ore:itemSilicon>                , 100, ox, 25);
addHighOvenRecipe(<liquid:energetic_alloy> *144    ,<liquid:gold>*144           , 2400 , <ore:dustBedrock>  , 50  , <ore:dustEnergetic>              , 100, ox, 25);
addHighOvenRecipe(<liquid:vibrant_alloy> *144      ,<liquid:energetic_alloy>*144, 3600 , <ore:dustBedrock>  , 50  , <ore:dustEnderPearl>             , 100, ox, 25);
addHighOvenRecipe(<liquid:redstone_alloy> *144     ,<liquid:tin>*144            , 2400 , <ore:dustBedrock>  , 50  , <ore:dustRedstone>               , 100, ox, 25);
addHighOvenRecipe(<liquid:conductive_iron> *144    ,<liquid:iron>*144           , 2800 , <ore:dustBedrock>  , 50  , <ore:dustRedstone>               , 100, ox, 25);
addHighOvenRecipe(<liquid:pulsating_iron> *144     ,<liquid:silver>*144         , 4000, <ore:dustBedrock>  , 50  , <ore:dustEnderPearl>             , 100, ox, 25);

# mob_imprisonment_tool
recipes.remove(<industrialforegoing:mob_imprisonment_tool>);
recipes.addShaped(<industrialforegoing:mob_imprisonment_tool>, [
	[<ic2:sheet:1>, <ic2:sheet:1>, <ic2:sheet:1>],
	[<mekanism:plasticblock:*>, <quark:soul_powder>, <mekanism:plasticblock:*>], 
	[<ic2:sheet:1>, <ic2:sheet:1>, <ic2:sheet:1>]
]);

# Rustic Evaporating Basin
mods.rustic.EvaporatingBasin.addRecipe(<scalinghealth:heartdust>, <liquid:lifeessence>*100);
mods.rustic.EvaporatingBasin.addRecipe(<scalinghealth:heartdust>, <liquid:blood>*5000);

# Rustic Crushing tub
# mods.rustic.CrushingTub.addRecipe(output as ILiquidStack, byproduct as IItemStack, input as IItemStack);
mods.rustic.CrushingTub.addRecipe(<liquid:purpleslime>*1000, <tconstruct:slime_vine_purple>, <tconstruct:slime_sapling:1>);
mods.rustic.CrushingTub.addRecipe(<liquid:purpleslime>*100, null, <tconstruct:slime_vine_purple>);

# Tool Belts
remakeEx(<toolbelt:pouch>, [
	[<ore:string>, <quark:gold_button>, <ore:string>],
	[<harvestcraft:hardenedleatheritem>, <immersiveengineering:wooden_device0>, <harvestcraft:hardenedleatheritem>], 
	[<harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>]]);
remakeEx(<toolbelt:belt>, [
	[null, <botania:knockbackbelt>, null],
	[<harvestcraft:hardenedleatheritem>, <quark:iron_button>, <harvestcraft:hardenedleatheritem>], 
	[<harvestcraft:hardenedleatheritem>, null, <harvestcraft:hardenedleatheritem>]
	]);



/* 
mods.inworldcrafting.

FluidToItem.transform(IItemStack output, ILiquidStack inputFluid,
	IIngredient[] inputItems, @Optional boolean consume);

FluidToFluid.transform(ILiquidStack output, ILiquidStack inputFluid,
	IIngredient[] inputItems, @Optional boolean consume);

FireCrafting.addRecipe(IItemStack output, IIngredient inputItem, @Optional int ticks);

ExplosionCrafting.explodeItemRecipe(IItemStack output, IIngredient inputItem, @Optional int survicechance);

 */


/* 
---------------------
ITEMS OF INTEREST
---------------------
<biomesoplenty:jar_filled:1>
<twilightforest:firefly>
<twilightforest:raw_venison>
<twilightforest:cooked_venison>
<randomthings:spectreilluminator>
<extrautils2:decorativesolid:7> # Quartzburnt
<forge:bucketfilled>.withTag({FluidName: "hot_spring_water", Amount: 1000})
<forge:bucketfilled>.withTag({FluidName: "liquid_sunshine", Amount: 1000})
<forge:bucketfilled>.withTag({FluidName: "blockfluiddirt", Amount: 1000})
 */