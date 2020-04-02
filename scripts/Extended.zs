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
recipes.replaceAllOccurences(<ore:gemDiamond>, <mysticalagriculture:infusion_crystal>, <matc:inferiumcrystal>);

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
remakeEx(<cd4017be_lib:m:401>, [[<cd4017be_lib:m:402>, <rftools:machine_base>, <cd4017be_lib:m:402>],[<rs_ctr:wire_e>, <opencomputers:upgrade:20>, <rs_ctr:wire_e>], [<cd4017be_lib:m:402>, <mekanism:ingot:3>, <cd4017be_lib:m:402>]]);


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
# Little Tiles
#
# ######################################################################

# Fix recipe
var littletilesTable = <littletiles:premade>.withTag({tiles: [{boxes: [[2, 14, 4, 11, 16, 5] as int[], [0, 14, 4, 2, 16, 16] as int[], [0, 14, 3, 11, 16, 4] as int[], [11, 14, 3, 13, 16, 16] as int[], [10, 2, 6, 11, 4, 16] as int[], [10, 11, 6, 11, 13, 16] as int[], [2, 2, 6, 3, 4, 16] as int[], [2, 11, 6, 3, 13, 16] as int[], [3, 15, 0, 4, 16, 1] as int[], [3, 11, 0, 4, 14, 1] as int[], [2, 14, 30, 11, 16, 32] as int[], [0, 14, 16, 2, 16, 32] as int[], [11, 14, 16, 13, 16, 32] as int[], [10, 2, 16, 11, 4, 29] as int[], [10, 11, 16, 11, 13, 29] as int[], [2, 2, 16, 3, 4, 29] as int[], [2, 11, 16, 3, 13, 29] as int[], [9, 4, 28, 10, 11, 29] as int[], [9, 4, 22, 10, 11, 23] as int[], [9, 4, 16, 10, 11, 17] as int[], [3, 11, 16, 10, 12, 17] as int[], [15, 15, 26, 16, 16, 27] as int[], [15, 11, 26, 16, 14, 27] as int[], [3, 3, 28, 10, 4, 29] as int[], [3, 4, 16, 4, 5, 29] as int[], [3, 5, 16, 4, 11, 17] as int[], [3, 5, 28, 4, 11, 29] as int[], [4, 4, 16, 9, 5, 28] as int[]], tile: {block: "minecraft:planks:1"}}, {boxes: [[0, 0, 4, 13, 3, 6] as int[], [1, 14, 1, 6, 16, 2] as int[], [0, 11, 4, 13, 14, 6] as int[], [1, 3, 4, 3, 11, 6] as int[], [10, 3, 4, 12, 11, 6] as int[], [3, 15, 5, 10, 16, 16] as int[], [10, 15, 6, 11, 16, 13] as int[], [10, 15, 14, 11, 16, 16] as int[], [2, 15, 6, 3, 16, 13] as int[], [2, 15, 14, 3, 16, 16] as int[], [0, 11, 29, 13, 14, 31] as int[], [14, 14, 23, 15, 16, 30] as int[], [10, 3, 29, 12, 11, 31] as int[], [0, 0, 29, 13, 3, 31] as int[], [1, 3, 29, 3, 11, 31] as int[], [10, 15, 16, 11, 16, 21] as int[], [10, 15, 22, 11, 16, 29] as int[], [2, 15, 16, 3, 16, 21] as int[], [2, 15, 22, 3, 16, 29] as int[], [3, 15, 16, 10, 16, 30] as int[]], tile: {block: "minecraft:planks"}}, {boxes: [[3, 3, 6, 10, 4, 16] as int[], [3, 11, 17, 10, 12, 29] as int[], [3, 3, 16, 10, 4, 28] as int[], [3, 5, 17, 9, 11, 28] as int[], [4, 5, 16, 9, 11, 17] as int[], [4, 4, 28, 9, 11, 29] as int[], [9, 4, 17, 10, 11, 22] as int[], [9, 4, 23, 10, 11, 28] as int[]], tile: {block: "minecraft:planks:2"}}, {boxes: [[13, 8, 6, 14, 14, 7] as int[], [13, 8, 9, 14, 10, 12] as int[], [13, 10, 10, 14, 11, 11] as int[], [5, 9, 2, 6, 11, 3] as int[], [6, 10, 2, 8, 11, 3] as int[], [7, 9, 2, 8, 10, 3] as int[]], tile: {block: "minecraft:iron_block"}}, {boxes: [[1, 14, 2, 2, 15, 3] as int[], [5, 14, 2, 6, 15, 3] as int[], [3, 14, 0, 4, 15, 1] as int[], [3, 14, 2, 4, 15, 3] as int[], [5, 14, 0, 6, 15, 1] as int[], [1, 14, 0, 2, 15, 1] as int[], [11, 14, 2, 12, 15, 3] as int[], [7, 14, 2, 8, 15, 3] as int[], [13, 14, 5, 14, 15, 6] as int[], [13, 14, 9, 14, 15, 10] as int[], [13, 14, 28, 14, 15, 29] as int[], [15, 14, 28, 16, 15, 29] as int[], [13, 14, 24, 14, 15, 25] as int[], [15, 14, 24, 16, 15, 25] as int[], [13, 14, 26, 14, 15, 27] as int[], [15, 14, 26, 16, 15, 27] as int[]], tile: {color: -13421773, block: "littletiles:ltcoloredblock:10"}}, {bBox: [9, 8, 2, 12, 10, 4] as int[], tile: {color: -15395563, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[13, 15, 5, 14, 16, 7] as int[], [13, 13, 5, 14, 14, 6] as int[], [13, 11, 10, 14, 15, 11] as int[], [13, 9, 4, 14, 15, 5] as int[], [13, 8, 5, 14, 9, 6] as int[], [10, 10, 2, 11, 15, 3] as int[], [6, 11, 2, 7, 15, 3] as int[]], tile: {color: -12020497, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[10, 15, 5, 11, 16, 6] as int[], [2, 15, 5, 3, 16, 6] as int[], [10, 15, 13, 11, 16, 14] as int[], [2, 15, 13, 3, 16, 14] as int[], [10, 15, 29, 11, 16, 30] as int[], [2, 15, 29, 3, 16, 30] as int[], [10, 15, 21, 11, 16, 22] as int[], [2, 15, 21, 3, 16, 22] as int[]], tile: {color: -14606047, block: "minecraft:planks"}}, {boxes: [[10, 8, 24, 11, 9, 25] as int[], [10, 8, 20, 11, 9, 21] as int[]], tile: {color: -14606047, block: "littletiles:ltcoloredblock:10"}}], min: [0, 0, 0] as int[], size: [16, 16, 32] as int[], count: 96, structure: {id: "workbench"}});
mods.jei.JEI.addItem(littletilesTable);
recipes.addShaped(littletilesTable, [
	[<minecraft:planks>, <minecraft:planks>, <minecraft:planks>], 
	[<minecraft:planks>, <littletiles:wrench>, <minecraft:planks>], 
	[<minecraft:planks>, <minecraft:planks>, <minecraft:planks>]]);

var littletilesExporter = <littletiles:premade>.withTag({tiles: [{boxes: [[1, 0, 14, 15, 1, 15] as int[], [1, 0, 12, 15, 1, 13] as int[], [1, 0, 10, 15, 1, 11] as int[], [1, 0, 1, 15, 1, 2] as int[], [1, 0, 3, 15, 1, 4] as int[], [1, 0, 5, 15, 1, 6] as int[], [1, 1, 1, 15, 2, 15] as int[], [8, 13, 13, 11, 14, 14] as int[], [8, 13, 10, 11, 14, 11] as int[], [8, 13, 6, 11, 14, 7] as int[], [8, 13, 2, 11, 14, 3] as int[]], tile: {color: -8684677, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[12, 2, 13, 13, 3, 14] as int[], [12, 2, 7, 13, 3, 8] as int[], [13, 2, 7, 14, 5, 14] as int[], [6, 12, 10, 9, 13, 11] as int[], [10, 12, 10, 13, 13, 11] as int[], [10, 12, 2, 14, 13, 3] as int[], [10, 12, 6, 14, 13, 7] as int[], [5, 12, 2, 9, 13, 3] as int[], [5, 12, 6, 9, 13, 7] as int[], [6, 12, 13, 9, 13, 14] as int[], [10, 12, 13, 13, 13, 14] as int[]], tile: {color: -6513508, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[14, 3, 12, 15, 4, 13] as int[], [14, 3, 10, 15, 4, 11] as int[], [8, 13, 3, 9, 14, 6] as int[], [8, 13, 7, 9, 14, 10] as int[], [8, 13, 11, 9, 14, 13] as int[], [8, 11, 9, 9, 13, 10] as int[]], tile: {color: -15132391, block: "littletiles:ltcoloredblock:10"}}, {bBox: [14, 3, 8, 15, 4, 9] as int[], tile: {color: -6946816, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[9, 2, 12, 10, 5, 15] as int[], [7, 2, 12, 8, 5, 15] as int[], [5, 2, 12, 6, 5, 15] as int[]], tile: {color: -8698314, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[8, 2, 12, 9, 5, 15] as int[], [6, 2, 12, 7, 5, 15] as int[], [4, 2, 12, 5, 5, 15] as int[], [11, 3, 13, 12, 4, 14] as int[], [12, 3, 12, 13, 4, 14] as int[], [1, 3, 13, 3, 4, 14] as int[], [9, 2, 8, 10, 4, 9] as int[], [6, 2, 9, 10, 3, 10] as int[], [8, 6, 9, 9, 11, 10] as int[], [8, 6, 6, 9, 7, 9] as int[], [12, 3, 8, 13, 7, 9] as int[], [12, 6, 6, 13, 7, 8] as int[], [9, 6, 6, 12, 7, 7] as int[], [3, 2, 2, 4, 3, 4] as int[], [3, 2, 7, 4, 3, 11] as int[], [2, 2, 10, 3, 3, 11] as int[], [1, 2, 10, 2, 3, 14] as int[], [6, 2, 2, 7, 3, 9] as int[], [3, 2, 1, 7, 3, 2] as int[]], tile: {color: -6530747, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[10, 2, 12, 11, 5, 15] as int[], [3, 2, 12, 4, 5, 15] as int[], [8, 5, 7, 11, 6, 10] as int[], [12, 3, 2, 13, 4, 6] as int[]], tile: {color: -12961222, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[7, 2, 10, 8, 4, 11] as int[], [10, 2, 10, 11, 4, 11] as int[], [10, 2, 7, 11, 4, 8] as int[], [7, 4, 7, 11, 5, 11] as int[], [2, 2, 2, 3, 4, 3] as int[], [3, 3, 2, 5, 4, 3] as int[], [2, 3, 3, 5, 4, 9] as int[], [2, 2, 8, 3, 3, 9] as int[], [4, 2, 8, 5, 3, 9] as int[], [4, 2, 2, 5, 3, 3] as int[], [7, 2, 7, 8, 4, 8] as int[]], tile: {color: -10790053, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[9, 12, 9, 10, 13, 14] as int[], [9, 12, 1, 10, 13, 8] as int[], [9, 6, 8, 10, 13, 9] as int[]], tile: {color: -4342339, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[11, 3, 10, 13, 4, 11] as int[], [6, 3, 11, 12, 4, 12] as int[], [6, 4, 11, 7, 6, 12] as int[], [6, 5, 12, 7, 6, 13] as int[], [3, 5, 13, 7, 6, 14] as int[]], tile: {color: -14142117, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[3, 5, 3, 4, 6, 4] as int[], [3, 5, 5, 4, 6, 6] as int[], [3, 5, 7, 4, 6, 8] as int[]], tile: {block: "littletiles:lttransparentcoloredblock:2"}}, {boxes: [[3, 4, 3, 4, 5, 4] as int[], [3, 4, 5, 4, 5, 6] as int[], [3, 4, 7, 4, 5, 8] as int[]], tile: {color: -6537695, block: "littletiles:ltcoloredblock"}}, {boxes: [[8, 3, 1, 14, 4, 2] as int[], [7, 2, 1, 8, 5, 5] as int[], [8, 4, 1, 14, 5, 5] as int[], [13, 4, 5, 14, 5, 6] as int[], [13, 3, 6, 14, 5, 7] as int[], [7, 4, 5, 13, 5, 7] as int[], [7, 2, 5, 8, 4, 7] as int[], [8, 2, 1, 14, 3, 7] as int[], [8, 3, 6, 13, 4, 7] as int[], [8, 3, 2, 12, 4, 6] as int[]], tile: {color: -12040120, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[8, 5, 3, 9, 6, 5] as int[], [10, 5, 2, 12, 6, 3] as int[], [12, 5, 3, 13, 6, 4] as int[], [12, 5, 5, 13, 6, 6] as int[], [9, 5, 5, 10, 6, 6] as int[]], tile: {color: -6450832, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[8, 5, 2, 10, 6, 3] as int[], [12, 5, 2, 13, 6, 3] as int[], [12, 5, 4, 13, 6, 5] as int[], [10, 5, 5, 12, 6, 6] as int[], [8, 5, 5, 9, 6, 6] as int[]], tile: {color: -8228786, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[9, 5, 3, 10, 6, 4] as int[], [11, 5, 4, 12, 6, 5] as int[]], tile: {color: -4024219, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[9, 5, 4, 11, 6, 5] as int[], [11, 5, 3, 12, 6, 4] as int[]], tile: {color: -2372171, block: "littletiles:ltcoloredblock:10"}}, {bBox: [10, 5, 3, 11, 6, 4] as int[], tile: {color: -2836856, block: "littletiles:ltcoloredblock:10"}}], min: [1, 0, 1] as int[], size: [14, 14, 14] as int[], count: 105, structure: {id: "exporter"}});
mods.jei.JEI.addItem(littletilesExporter);
recipes.addShaped(littletilesExporter, [
	[<minecraft:planks>, <minecraft:iron_bars>, <minecraft:planks>], 
	[<minecraft:iron_ingot>, <littletiles:recipe>, <minecraft:iron_ingot>], 
	[<minecraft:iron_ingot>, <minecraft:redstone>, <minecraft:iron_ingot>]]);

var littletilesImporter = <littletiles:premade>.withTag({tiles: [{boxes: [[14, 0, 1, 15, 1, 2] as int[], [14, 0, 14, 15, 1, 15] as int[], [1, 0, 14, 2, 1, 15] as int[], [1, 0, 1, 2, 1, 2] as int[], [1, 1, 1, 15, 2, 15] as int[]], tile: {block: "minecraft:planks:1"}}, {boxes: [[13, 3, 8, 14, 4, 10] as int[], [13, 3, 10, 14, 5, 11] as int[], [13, 5, 9, 14, 6, 11] as int[], [13, 4, 8, 14, 5, 9] as int[]], tile: {block: "littletiles:ltcoloredblock:10"}}, {bBox: [4, 7, 13, 8, 8, 14] as int[], tile: {block: "minecraft:planks"}}, {boxes: [[9, 2, 1, 10, 3, 8] as int[], [5, 3, 5, 8, 4, 7] as int[], [5, 2, 1, 9, 3, 7] as int[], [8, 3, 1, 10, 4, 2] as int[], [8, 3, 6, 10, 4, 7] as int[], [10, 2, 7, 14, 3, 8] as int[], [3, 3, 1, 8, 4, 5] as int[], [3, 4, 1, 10, 5, 7] as int[], [13, 6, 8, 14, 7, 11] as int[], [13, 3, 7, 14, 7, 8] as int[], [13, 3, 11, 14, 7, 15] as int[], [12, 3, 7, 13, 7, 14] as int[], [3, 5, 13, 4, 7, 14] as int[], [3, 5, 7, 4, 6, 13] as int[], [4, 6, 13, 12, 7, 14] as int[], [3, 6, 7, 12, 7, 13] as int[], [4, 3, 7, 12, 6, 15] as int[], [3, 5, 14, 4, 6, 15] as int[], [3, 6, 14, 13, 7, 15] as int[], [3, 3, 7, 4, 5, 15] as int[], [12, 3, 14, 13, 6, 15] as int[], [3, 2, 7, 9, 3, 14] as int[], [4, 2, 14, 12, 3, 15] as int[], [2, 2, 7, 3, 7, 8] as int[], [2, 3, 8, 3, 7, 9] as int[], [2, 2, 14, 3, 7, 15] as int[], [2, 3, 13, 3, 7, 14] as int[], [2, 2, 9, 3, 7, 13] as int[], [4, 3, 6, 5, 4, 7] as int[], [3, 2, 6, 4, 4, 7] as int[], [3, 3, 5, 5, 4, 6] as int[], [4, 2, 5, 5, 3, 7] as int[], [4, 2, 2, 5, 3, 3] as int[], [3, 2, 1, 5, 3, 2] as int[], [3, 2, 3, 5, 3, 5] as int[], [9, 2, 8, 13, 3, 14] as int[], [13, 2, 14, 14, 3, 15] as int[], [13, 2, 9, 14, 3, 13] as int[], [10, 8, 8, 13, 9, 14] as int[]], tile: {color: -4342339, block: "littletiles:ltcoloredblock:10"}}, {bBox: [8, 3, 2, 9, 4, 6] as int[], tile: {color: -12961222, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[14, 5, 13, 15, 6, 14] as int[], [14, 5, 11, 15, 6, 12] as int[], [14, 3, 11, 15, 4, 12] as int[], [13, 8, 12, 14, 9, 13] as int[], [13, 8, 9, 14, 9, 10] as int[]], tile: {color: -12040120, block: "littletiles:ltcoloredblock:10"}}, {bBox: [14, 3, 13, 15, 4, 14] as int[], tile: {color: -6946816, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[13, 4, 9, 14, 5, 10] as int[], [13, 5, 8, 14, 6, 9] as int[], [6, 10, 3, 7, 11, 4] as int[], [2, 2, 2, 3, 6, 3] as int[], [1, 2, 2, 2, 3, 11] as int[], [1, 3, 10, 2, 5, 11] as int[], [1, 4, 11, 2, 5, 13] as int[], [3, 5, 2, 6, 6, 3] as int[], [5, 5, 3, 6, 11, 4] as int[]], tile: {color: -15132391, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[12, 2, 14, 13, 3, 15] as int[], [3, 2, 14, 4, 3, 15] as int[], [2, 2, 8, 3, 3, 9] as int[], [2, 2, 13, 3, 3, 14] as int[], [3, 2, 5, 4, 3, 6] as int[], [3, 2, 2, 4, 3, 3] as int[], [13, 2, 8, 14, 3, 9] as int[], [13, 2, 13, 14, 3, 14] as int[], [10, 2, 2, 14, 3, 6] as int[]], tile: {color: -8684677, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[10, 3, 2, 12, 4, 3] as int[], [12, 3, 3, 13, 4, 4] as int[], [12, 3, 5, 13, 4, 6] as int[], [9, 3, 5, 10, 4, 6] as int[]], tile: {color: -6450832, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[9, 3, 2, 10, 4, 3] as int[], [12, 3, 2, 13, 4, 3] as int[], [12, 3, 4, 13, 4, 5] as int[], [10, 3, 5, 12, 4, 6] as int[]], tile: {color: -8228786, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[9, 3, 3, 10, 4, 4] as int[], [11, 3, 4, 12, 4, 5] as int[]], tile: {color: -4024219, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[9, 3, 4, 11, 4, 5] as int[], [11, 3, 3, 12, 4, 4] as int[]], tile: {color: -2372171, block: "littletiles:ltcoloredblock:10"}}, {bBox: [10, 3, 3, 11, 4, 4] as int[], tile: {color: -2836856, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[5, 12, 5, 8, 13, 6] as int[], [5, 8, 5, 8, 9, 6] as int[], [4, 9, 5, 5, 12, 6] as int[], [5, 9, 4, 8, 12, 5] as int[], [8, 9, 5, 9, 12, 6] as int[]], tile: {color: -6513508, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[6, 10, 5, 7, 11, 7] as int[], [6, 5, 3, 7, 10, 4] as int[], [3, 7, 12, 4, 8, 15] as int[]], tile: {color: -10790053, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[2, 3, 5, 3, 4, 7] as int[], [1, 3, 6, 2, 4, 8] as int[], [1, 3, 8, 2, 6, 9] as int[]], tile: {color: -14142117, block: "littletiles:ltcoloredblock:10"}}, {bBox: [9, 7, 8, 13, 8, 14] as int[], tile: {color: -5197648, block: "littletiles:ltcoloredblock:10"}}, {boxes: [[9, 8, 11, 10, 9, 12] as int[], [8, 7, 11, 9, 9, 12] as int[], [5, 7, 11, 8, 8, 12] as int[], [5, 7, 7, 6, 8, 11] as int[], [5, 5, 6, 6, 8, 7] as int[]], tile: {color: -9430245, block: "littletiles:ltcoloredblock:10"}}], min: [1, 0, 1] as int[], size: [14, 13, 14] as int[], count: 104, structure: {id: "importer"}});
mods.jei.JEI.addItem(littletilesImporter);
recipes.addShaped(littletilesImporter, [
	[<minecraft:planks>, <minecraft:glass>, <minecraft:planks>], 
	[<minecraft:iron_ingot>, <littletiles:recipe>, <minecraft:iron_ingot>], 
	[<minecraft:iron_ingot>, <minecraft:redstone>, <minecraft:iron_ingot>]]);

var littletilesChisel = <littletiles:chisel>.withTag({preview: {bBox: [0, 0, 0, 1, 1, 1] as int[], tile: {block: "minecraft:stone"}}});
recipes.remove(<littletiles:chisel>);
recipes.addShapeless(littletilesChisel, [<chiselsandbits:chisel_diamond>, <littletiles:recipe>]);

# Storage tiles
recipes.remove(<littletiles:ltstorageblocktile>);
recipes.addShaped(<littletiles:ltstorageblocktile>, [
	[<chisel:factory:6>, <chisel:factory:6>, <chisel:factory:6>], 
	[<chisel:factory:6>, <ore:chest>, <chisel:factory:6>], 
	[<chisel:factory:6>, <chisel:factory:6>, <chisel:factory:6>]]);


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

# EnderIO alloys
addHighOvenRecipe(<liquid:electrical_steel> *144   ,<liquid:steel>*(144*4)          , 500 , <ore:dustBedrock>  , 50  , <ore:itemSilicon>                  , 100  , null                , 100);
addHighOvenRecipe(<liquid:energetic_alloy> *144    ,<liquid:gold>*(144*4)           , 600 , <ore:dustBedrock>  , 50  , <ore:dustGlowstone>                , 100  , <ore:dustRedstone>  , 100);
addHighOvenRecipe(<liquid:vibrant_alloy> *144      ,<liquid:energetic_alloy>*(144*4), 900 , <ore:dustBedrock>  , 50  , <ore:dustEnderPearl>               , 100  , null                , 100);
addHighOvenRecipe(<liquid:redstone_alloy> *144     ,<liquid:tin>*(144*4)            , 600 , <ore:dustBedrock>  , 50  , <ore:itemSilicon>                  , 100  , <ore:dustRedstone>  , 100);
addHighOvenRecipe(<liquid:conductive_iron> *144    ,<liquid:iron>*(144*4)           , 700 , <ore:dustBedrock>  , 50  , <ore:dustRedstone>                 , 100  , null                , 100);
addHighOvenRecipe(<liquid:pulsating_iron> *144     ,<liquid:silver>*(144*4)         , 1000, <ore:dustBedrock>  , 50  , <ore:dustEnderPearl>               , 100  , null                , 100);
addHighOvenRecipe(<liquid:dark_steel> *144         ,<liquid:steel>*(144*4)          , 1100, <ore:dustBedrock>  , 50  , <ore:dustObsidian>                 , 100  , null                , 100);
addHighOvenRecipe(<liquid:soularium> *144          ,<liquid:gold>*(144*4)           , 850 , <ore:dustBedrock>  , 50  , <mysticalagriculture:crafting:28>  , 100  , null                , 100);
addHighOvenRecipe(<liquid:end_steel> *144          ,<liquid:dark_steel>*(144*4)     , 1300, <ore:dustBedrock>  , 50  , <ore:dustEndstone>                 , 100  , <ore:obsidian>      , 100);
addHighOvenRecipe(<liquid:construction_alloy>*144  ,<liquid:iron>*72                , 450 , <ore:dustBedrock>  , 50  , <ore:dustLead>                     , 100  , null                , 100);

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
<randomthings:flootoken>
<randomthings:spectreilluminator>
<extrautils2:decorativesolid:7> # Quartzburnt
<forge:bucketfilled>.withTag({FluidName: "hot_spring_water", Amount: 1000})
<forge:bucketfilled>.withTag({FluidName: "liquid_sunshine", Amount: 1000})
<forge:bucketfilled>.withTag({FluidName: "blockfluiddirt", Amount: 1000})
 */