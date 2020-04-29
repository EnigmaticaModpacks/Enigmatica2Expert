import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.liquid.ILiquidDefinition;
import mods.jei.JEI.removeAndHide as rh;
import mods.tcomplement.highoven.HighOven;
import mods.tcomplement.highoven.MixRecipeBuilder;
import mods.nuclearcraft.alloy_furnace.removeRecipeWithOutput as ncAlloyRm;

#modloaded tconstruct

print("--- loading TinkersConstruct.zs ---");

# Removing Bronze / Steel dupes
	mods.tconstruct.Melting.removeRecipe(<liquid:bronze>, <ic2:pipe>);
	mods.tconstruct.Melting.removeRecipe(<liquid:steel>, <ic2:pipe:1>);

# Prevent Smart Output from instantly breaking (setting it to same hardness as Smeltery Controllers)
	<mctsmelteryio:machine:1>.hardness = <tconstruct:smeltery_controller>.hardness;

# Cobalt Block Unification
	mods.tconstruct.Casting.removeBasinRecipe(<chisel:blockcobalt>);
	mods.tconstruct.Casting.addBasinRecipe(<tconstruct:metal>, null, <liquid:cobalt>, 1296);
	
# Item Rack
	rh(<tconstruct:rack>);
	
# Blank Cast Resmelting
	mods.tconstruct.Melting.addRecipe(<liquid:alubrass> * 144, <tconstruct:cast>);

# Firewood
	recipes.remove(<tconstruct:firewood:1>);
	recipes.addShapedMirrored("Firewood", 
	<tconstruct:firewood:1>, 
	[[<tconstruct:firewood>, <bloodmagic:component:1>, <tconstruct:firewood>],
	[<bloodmagic:lava_crystal>, <tconstruct:firewood>, <bloodmagic:lava_crystal>], 
	[<tconstruct:firewood>, <bloodmagic:component:1>, <tconstruct:firewood>]]);

# Reinforcement Modifier
	recipes.remove(<tconstruct:materials:14>);
	recipes.addShapedMirrored("Reinforcement Modifier",
	<tconstruct:materials:14> * 2, 
	[[<ore:blockSheetmetalGold>, <ore:plateDenseObsidian>, <ore:blockSheetmetalGold>],
	[<ore:blockSheetmetalGold>, <ic2:casing:2>, <ore:blockSheetmetalGold>],
	[<ore:blockSheetmetalGold>, <ore:plateDenseObsidian>, <ore:blockSheetmetalGold>]]);

# Faster Alumite Alloying
	mods.tconstruct.Alloy.removeRecipe(<liquid:alumite>);
	mods.tconstruct.Alloy.addRecipe(<liquid:alumite> * 432, [<liquid:aluminum> * 720, <liquid:iron> * 288,  <liquid:obsidian> * 288]);
	mods.tconstruct.Alloy.addRecipe(<liquid:alumite> * 864, [<liquid:aluminum> * 1440, <liquid:iron> * 576,  <liquid:obsidian> * 576]);

# Faster Osmiridium Alloying
	mods.tconstruct.Alloy.removeRecipe(<liquid:osmiridium>);
	mods.tconstruct.Alloy.addRecipe(<liquid:osmiridium> * 144, [<liquid:osmium> * 72, <liquid:iridium> * 72]);

# Faster Bronze Alloying
	mods.tconstruct.Alloy.removeRecipe(<liquid:bronze>);

	mods.tconstruct.Alloy.addRecipe(<liquid:bronze> * 288, [<liquid:tin> * 72, <liquid:copper> * 216]);
	mods.tconstruct.Alloy.addRecipe(<liquid:bronze> * 576, [<liquid:tin> * 144, <liquid:copper> * 432]);

	mods.tconstruct.Alloy.removeRecipe(<liquid:alubrass>);

	mods.tconstruct.Alloy.addRecipe(<liquid:alubrass> * 288, [<liquid:copper> * 72, <liquid:aluminum> * 216]);
	mods.tconstruct.Alloy.addRecipe(<liquid:alubrass> * 576, [<liquid:copper> * 144, <liquid:aluminum> * 432]);

# Tinkers' Complement Melter
	recipes.remove(<tcomplement:melter>);
	recipes.addShaped("TiC Complement", 
	<tcomplement:melter>, 
	[[<ore:blockSeared>, <tconstruct:seared_tank>, <ore:blockSeared>],
	[<ore:blockSeared>, <tconstruct:smeltery_controller>, <ore:blockSeared>], 
	[<ore:blockSeared>, <ore:blockSeared>, <ore:blockSeared>]]);	

# Large Plates in Immersive Engineering Metal Press
	#OutputStack, InputStack, MoldStack, Energy, SizeValue
	mods.immersiveengineering.MetalPress.addRecipe(<tconstruct:large_plate>.withTag({Material: "xu_demonic_metal"}), <extrautils2:simpledecorative:1>, <immersiveengineering:mold>, 16000, 1);
	mods.immersiveengineering.MetalPress.addRecipe(<tconstruct:large_plate>.withTag({Material: "lead"}), <thermalfoundation:storage:3>, <immersiveengineering:mold>, 16000, 1);
	mods.immersiveengineering.MetalPress.addRecipe(<tconstruct:large_plate>.withTag({Material: "iron"}), <minecraft:iron_block>, <immersiveengineering:mold>, 16000, 1);
	mods.immersiveengineering.MetalPress.addRecipe(<tconstruct:large_plate>.withTag({Material: "electrum"}), <thermalfoundation:storage_alloy:1>, <immersiveengineering:mold>, 16000, 1);
	mods.immersiveengineering.MetalPress.addRecipe(<tconstruct:large_plate>.withTag({Material: "flint"}), <excompressum:compressed_block:5>, <immersiveengineering:mold>, 16000, 1);
	
	mods.immersiveengineering.MetalPress.addRecipe(<tconstruct:tool_rod>.withTag({Material: "ardite"}), <tconstruct:ingots:1>, <immersiveengineering:mold:2>, 4000, 1);

# EFLN
	recipes.remove(<tconstruct:throwball:1>);
	recipes.addShapedMirrored("EFLN", 
	<tconstruct:throwball:1> * 3, 
	[[<ore:dustSulfur>, <ore:gunpowder>, <ore:dustSulfur>],
	[<ore:gunpowder>, <excompressum:compressed_block:5>, <ore:gunpowder>], 
	[<ore:dustSulfur>, <ore:gunpowder>, <ore:dustSulfur>]]);

# Removing the ability to smelt dusts into ingots, for Signalum, Lumium, Enderium and Refined Obsidian
	mods.tconstruct.Melting.removeRecipe(<liquid:signalum>, <thermalfoundation:material:101>);
	mods.tconstruct.Melting.removeRecipe(<liquid:lumium>, <thermalfoundation:material:102>);
	mods.tconstruct.Melting.removeRecipe(<liquid:enderium>, <thermalfoundation:material:103>);
	mods.tconstruct.Melting.removeRecipe(<liquid:refinedobsidian>, <mekanism:otherdust:5>);
# Removing the ability to smelt redstone/glowstone to make EnderIO alloys
	for item in <ore:dustRedstone>.items { mods.tconstruct.Melting.removeRecipe(<liquid:redstone>, item); }
	for item in <ore:blockRedstone>.items { mods.tconstruct.Melting.removeRecipe(<liquid:redstone>, item); }
	for item in <ore:dustGlowstone>.items { mods.tconstruct.Melting.removeRecipe(<liquid:glowstone>, item); }
	for item in <ore:blockGlowstone>.items { mods.tconstruct.Melting.removeRecipe(<liquid:glowstone>, item); }

# Removing the ability to melt coal
val coals as IItemStack[] = [

	<bigreactors:ingotmetals:2>,
	<bigreactors:dustmetals:2>,
	<minecraft:coal>,
	<minecraft:coal_block>,
	<thermalfoundation:material:768>,
	<bigreactors:blockmetals:2>,
	<nuclearcraft:ingot_block:8>,
	<nuclearcraft:ingot:8>,
	<nuclearcraft:dust:8>
	
];

for item in coals {
	mods.tconstruct.Melting.removeRecipe(<liquid:coal>, item);
}

# Remove Ender Pearl Melting (to remove the ability to alloy Enderium)
	mods.tconstruct.Melting.removeRecipe(<liquid:ender>);
	
# Gear Cast
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <exnihilocreatio:item_material:7>, <liquid:gold>, 288, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <exnihilocreatio:item_material:7>, <liquid:alubrass>, 144, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <exnihilocreatio:item_material:7>, <liquid:brass>, 144, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:22>, <liquid:gold>, 288, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:22>, <liquid:alubrass>, 144, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:22>, <liquid:brass>, 144, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:23>, <liquid:gold>, 288, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:23>, <liquid:alubrass>, 144, true);
	mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <thermalfoundation:material:23>, <liquid:brass>, 144, true);

# Add Cyanite melting recipe
	mods.tconstruct.Melting.addRecipe(<liquid:cyanite> * (144*9), <ore:blockCyanite>, 700);
	mods.tconstruct.Melting.addRecipe(<liquid:cyanite> * 144, <ore:ingotCyanite> | <ore:dustCyanite>, 450);
	
	mods.tconstruct.Casting.addBasinRecipe(<bigreactors:blockmetals:3>, null, <liquid:plutonium>, 1296);


# Slime Boots
	recipes.remove(<tconstruct:slime_boots:*>);
	function remakeSlimeBoots(name as string, item as IItemStack, primary as IIngredient){
		make("Slime Boots " ~ name, item, [
			[<ore:slimeball>, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 34 as short}]}), <ore:slimeball>], 
			[primary, <minecraft:leather_boots>.anyDamage(), primary]]);
	}

	remakeSlimeBoots("Green",  <tconstruct:slime_boots>,   <tconstruct:slime_congealed>);
	remakeSlimeBoots("Blue",   <tconstruct:slime_boots:1>, <tconstruct:slime_congealed:1>);
	remakeSlimeBoots("Purple", <tconstruct:slime_boots:2>, <tconstruct:slime_congealed:2>);
	remakeSlimeBoots("Red",    <tconstruct:slime_boots:3>, <tconstruct:slime_congealed:3>);
	remakeSlimeBoots("Orange", <tconstruct:slime_boots:4>, <tconstruct:slime_congealed:4>);

# Slime Slings
	recipes.remove(<tconstruct:slimesling:*>);
	function remakeSlimeSlings(name as string, item as IItemStack, primary as IIngredient){
		make("Slime Sling " ~ name, item, [
			[<ore:slimeball>, null, <ore:slimeball>], 
			[<ore:slimeball>, <cyclicmagic:slingshot_weapon>.anyDamage(), <ore:slimeball>], 
			[null, primary, null]
		]);
	}

	remakeSlimeSlings("Green",  <tconstruct:slimesling>,   <tconstruct:slime_congealed>);
	remakeSlimeSlings("Blue",   <tconstruct:slimesling:1>, <tconstruct:slime_congealed:1>);
	remakeSlimeSlings("Purple", <tconstruct:slimesling:2>, <tconstruct:slime_congealed:2>);
	remakeSlimeSlings("Red",    <tconstruct:slimesling:3>, <tconstruct:slime_congealed:3>);
	remakeSlimeSlings("Magma",  <tconstruct:slimesling:4>, <tconstruct:slime_congealed:4>);


# Recipes to remove 
rh(<mctsmelteryio:powdered_fuel>);

# Remake upgrades match Tinkers/IO crafts
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

	
# *======= Fuels =======*

	<liquid:pyrotheum>.definition.temperature = 5300;
	<liquid:xu_demonic_metal>.definition.temperature = 4000;
	<liquid:sulfuricacid>.definition.temperature = 4000;
	<liquid:refined_fuel>.definition.temperature = 4100;
	<liquid:ic2uu_matter>.definition.temperature = 9300;
	<liquid:ic2pahoehoe_lava>.definition.temperature = 3800;
	<liquid:gasoline>.definition.temperature = 3900;
	<liquid:diesel>.definition.temperature = 3900;
	<liquid:astralsorcery.liquidstarlight>.definition.temperature = 3900;
	
	#NuclearCraft Specific
	<liquid:neutron>.definition.temperature = 10300;
	<liquid:boric_acid>.definition.temperature = 4000;
	<liquid:hydrofluoric_acid>.definition.temperature = 4000;
				
	mods.tconstruct.Fuel.registerFuel(<liquid:pyrotheum> * 25, 400);
	mods.tconstruct.Fuel.registerFuel(<liquid:xu_demonic_metal> * 25, 400);
	mods.tconstruct.Fuel.registerFuel(<liquid:sulfuricacid> * 25, 400);
	mods.tconstruct.Fuel.registerFuel(<liquid:refined_fuel> * 25, 600);
	mods.tconstruct.Fuel.registerFuel(<liquid:ic2uu_matter> * 25, 800);
	mods.tconstruct.Fuel.registerFuel(<liquid:ic2pahoehoe_lava> * 25, 400);
	mods.tconstruct.Fuel.registerFuel(<liquid:gasoline> * 25, 400);
	mods.tconstruct.Fuel.registerFuel(<liquid:diesel> * 25, 400);
	mods.tconstruct.Fuel.registerFuel(<liquid:astralsorcery.liquidstarlight> * 25, 600);
	
	#NuclearCraft Specific
	mods.tconstruct.Fuel.registerFuel(<liquid:neutron> * 25, 1200);
	mods.tconstruct.Fuel.registerFuel(<liquid:boric_acid> * 25, 400);
	mods.tconstruct.Fuel.registerFuel(<liquid:hydrofluoric_acid> * 25, 400);



# *======= High Oven =======*

# Remove cheap steel recipe
HighOven.removeMixRecipe(<liquid:steel>);

# Remove Unused alloy recipes
ncAlloyRm(<enderio:item_alloy_ingot>);
ncAlloyRm(<enderio:item_alloy_ingot:1>);
ncAlloyRm(<enderio:item_alloy_ingot:2>);
ncAlloyRm(<enderio:item_alloy_ingot:3>);
ncAlloyRm(<enderio:item_alloy_ingot:5>);
ncAlloyRm(<enderio:item_alloy_ingot:4>); # conductive Iron
ncAlloyRm(<enderio:item_alloy_ingot:7>);
ncAlloyRm(<enderio:item_alloy_ingot:8>);
ncAlloyRm(<enderio:item_alloy_ingot:9>*3);
ncAlloyRm(<enderio:item_material:14>);
ncAlloyRm(<enderio:item_material:15>);

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
addHighOvenRecipe(<liquid:plutonium> * (144*3), <liquid:cyanite> * (144*6), 3000, 
	<ic2:nuclear:7>, 100, <actuallyadditions:block_crystal_empowered:1>, 75, <ore:blockMithril>, 66);

# EnderIO simple alloys
addHighOvenRecipe(<liquid:construction_alloy>*144  ,<liquid:iron>*48         , 2700  , <ore:dustBedrock>  , 50  , <ore:dustLead>      , 100  , null            , 100);
addHighOvenRecipe(<liquid:dark_steel> *144         ,<liquid:steel>*144       , 6600 , <ore:dustBedrock>  , 50  , <ore:dustObsidian>  , 100  , null            , 100);
addHighOvenRecipe(<liquid:end_steel> *144          ,<liquid:dark_steel>*144  , 7800 , <ore:dustBedrock>  , 50  , <ore:dustEndstone>  , 100  , <ore:obsidian>  , 100);

# Oxidisers on choose
val ox as IIngredient = <ore:dustCyanite> | <ore:itemSlagRich> | <ore:dustPsi>;

# EnderIO hard alloys
addHighOvenRecipe(<liquid:soularium> *144          ,<liquid:gold>*144           , 5100 , <ore:dustBedrock>  , 50  , <mysticalagriculture:crafting:28>, 100, ox, 25);
addHighOvenRecipe(<liquid:electrical_steel> *144   ,<liquid:steel>*144          , 3000 , <ore:dustBedrock>  , 50  , <ore:itemSilicon>                , 100, ox, 25);
addHighOvenRecipe(<liquid:energetic_alloy> *144    ,<liquid:gold>*144           , 3600 , <ore:dustBedrock>  , 50  , <ore:dustEnergetic>              , 100, ox, 25);
addHighOvenRecipe(<liquid:vibrant_alloy> *144      ,<liquid:energetic_alloy>*144, 5400 , <ore:dustBedrock>  , 50  , <ore:dustEnderPearl>             , 100, ox, 25);
addHighOvenRecipe(<liquid:redstone_alloy> *144     ,<liquid:tin>*144            , 3600 , <ore:dustBedrock>  , 50  , <ore:dustRedstone>               , 100, ox, 25);
addHighOvenRecipe(<liquid:conductive_iron> *144    ,<liquid:iron>*144           , 4200 , <ore:dustBedrock>  , 50  , <ore:dustRedstone>               , 100, ox, 25);
addHighOvenRecipe(<liquid:pulsating_iron> *144     ,<liquid:silver>*144         , 6000 , <ore:dustBedrock>  , 50  , <ore:dustEnder>                  , 100, ox, 25);


# *======= Alloying =======*

//mods.tconstruct.Alloy.addRecipe(ILiquidStack output, ILiquidStack[] inputs);
#mods.tconstruct.Alloy.addRecipe(<liquid:water> * 10, [<liquid:lava> * 10, <liquid:molten_iron> * 5]);

//mods.tconstruct.Alloy.removeRecipe(ILiquidStack output);
#mods.tconstruct.Alloy.removeRecipe(<liquid:water>);

# *======= Casting =======* Wrong Info on docs

//mods.tconstruct.Casting.addTableRecipe(IItemStack output, IItemStack cast, ILiquidStack fluid, int amount, @Optional boolean consumeCast);
#mods.tconstruct.Casting.addTableRecipe(<minecraft:gold_ingot>, <minecraft:iron_ingot>, <liquid:molten_gold>, 30, true);
#mods.tconstruct.Casting.addTableRecipe(<minecraft:gold_ingot>, <minecraft:gold_ingot>, <liquid:molten_gold>, 140);

//mods.tconstruct.Casting.addBasinRecipe(IItemStack output, IItemStack cast, ILiquidStack fluid, int amount, @Optional boolean consumeCast);
#mods.tconstruct.Casting.addBasinRecipe(<minecraft:gold_ingot>, <minecraft:iron_ingot>, <liquid:molten_gold>, 30, true);
#mods.tconstruct.Casting.addBasinRecipe(<minecraft:gold_ingot>, <minecraft:gold_ingot>, <liquid:molten_gold>, 140);

//mods.tconstruct.Casting.removeTableRecipe(IItemStack output);
#mods.tconstruct.Casting.removeTableRecipe(<minecraft:iron_ingot>);

//mods.tconstruct.Casting.removeBasinRecipe(IItemStack output);
#mods.tconstruct.Casting.removeBasinRecipe(<minecraft:gold_block>);

# *======= Drying =======*

//mods.tconstruct.Drying.addRecipe(IItemStack output, IItemStack input, int time);
#mods.tconstruct.Drying.addRecipe(<minecraft:leather>,<minecraft:rotten_flesh>, 100);

//mods.tconstruct.Drying.removeRecipe(IItemStack output);
#mods.tconstruct.Drying.removeRecipe(<minecraft:leather>);

# *======= Melting =======*

//mods.tconstruct.Melting.addRecipe(ILiquidStack output, IItemStack input, @Optional int temp);
#mods.tconstruct.Melting.addRecipe(<liquid:molten_gold> * 144,<minecraft:gold_ingot>);
#mods.tconstruct.Melting.addRecipe(<liquid:molten_iron> * 144,<minecraft:iron_ingot>, 500);

//mods.tconstruct.Melting.removeRecipe(ILiquidStack output);
#mods.tconstruct.Melting.removeRecipe(<liquid:molten_iron>);

	print("--- TinkersConstruct.zs initialized ---");
