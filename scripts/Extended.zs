import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.jei.JEI.removeAndHide as rh;
import mods.immersivetweaker.Recycling;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;
import crafttweaker.event.CommandEvent;
import crafttweaker.player.IPlayer;


#priority -1


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
# Misc
#
# ######################################################################

# Remove Refined storage cables
rh(<immersivecables:coil_block:3>);
rh(<immersivecables:wire_coil:3>);

# Make Quicksand
mods.inworldcrafting.FluidToFluid.transform(<liquid:sand>, <liquid:blueslime>, [<ore:soulSand>]);
scripts.process.solution([<ore:soulSand>], [<liquid:blueslime>*1000], [<liquid:sand>*1000], null, "except: highoven");

# Sandwiches
# var anyDragonsteelSword as IIngredient = 
# 	<tconstruct:large_sword_blade>.withTag({Material: "dragonsteel_fire"}) |
# 	<tconstruct:large_sword_blade>.withTag({Material: "dragonsteel_ice"});
# remakeEx(<culinaryconstruct:sandwich_station>, [
# 	[<nuclearcraft:moresmore>, anyDragonsteelSword, <nuclearcraft:moresmore>], 
# 	[<cookingforblockheads:counter>, <cookingforblockheads:cooking_table>, <cookingforblockheads:counter>], 
# 	[<cookingforblockheads:counter>, <cookingforblockheads:counter>, <cookingforblockheads:counter>]
# ]);
recipes.remove(<culinaryconstruct:sandwich_station>);
mods.extendedcrafting.TableCrafting.addShaped(0, <culinaryconstruct:sandwich_station>, [
	[<nuclearcraft:moresmore>, <ore:dragonsteelIngot>, <nuclearcraft:moresmore>], 
	[<cookingforblockheads:counter>, <cookingforblockheads:cooking_table>, <cookingforblockheads:counter>], 
	[<cookingforblockheads:counter>, <cookingforblockheads:counter>, <cookingforblockheads:counter>]
]);

# Peacock fan
recipes.addShaped(<twilightforest:peacock_fan>, [
	[<ore:peacockFeathers>, <ore:peacockFeathers>, null], 
	[<forestry:oak_stick>, <forestry:oak_stick>, <ore:peacockFeathers>], 
	[<ore:slimecrystalBlue>, <forestry:oak_stick>, <ore:peacockFeathers>]
]);

# Tool Belts
remakeEx(<toolbelt:pouch>, [
	[<ore:string>, <quark:gold_button>, <ore:string>],
	[<harvestcraft:hardenedleatheritem>, <immersiveengineering:wooden_device0>, <harvestcraft:hardenedleatheritem>], 
	[<harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>, <harvestcraft:hardenedleatheritem>]]);
remakeEx(<toolbelt:belt>, [
	[null, <conarm:travel_belt_base>, null],
	[<harvestcraft:hardenedleatheritem>, <quark:iron_button>, <harvestcraft:hardenedleatheritem>], 
	[<harvestcraft:hardenedleatheritem>, null, <harvestcraft:hardenedleatheritem>]
	]);


# Hydrated coal simplifying
mods.inworldcrafting.FluidToItem.transform(<ic2:dust:3>, <fluid:water>, [<ore:dustCoal>]);

# Lesser blaze powder
recipes.remove(<minecraft:blaze_powder> * 2);
recipes.addShapeless("Blaze Powder", <minecraft:blaze_powder>, [<minecraft:blaze_rod>]);

# ######################################################################
#
# Command Listener
#
# ######################################################################

// events.onCommand(function(event as CommandEvent) {
// 	print("Entering [events.onCommand]...");
// 	val command = event.command;
// 	if(isNull(command)) { return; }
	
// 	if (command.name == "secretelexirtest") {
// 		val elexir = <rustic:elixir>.withTag({ElixirEffects:[
// 			{Effect:"minecraft:speed",Duration:1800000,Amplifier:8},
// 			{Effect:"rustic:ironskin",Duration:9600000,Amplifier:8}],
// 			ench:[{id:0,lvl:0}],HideFlags:1});

// 		val sndr = event.commandSender;
// 		val entItem = elexir.createEntityItem(sndr.world,
// 			sndr.position.getX(), sndr.position.getY(), sndr.position.getZ());
// 		val spawnSucces = sndr.world.spawnEntity(entItem);
// 	}
	
// 	return;
// });

# ######################################################################
#
# Bedrock Ore
#
# ######################################################################

recipes.remove(<bedrockores:bedrock_miner>);
recipes.addShaped(<bedrockores:bedrock_miner>, [
	[<ore:dustBedrock>, <immersiveengineering:metal_decoration0:5>, <ore:dustBedrock>],
	[<ore:blockRedstone>, <immersiveengineering:metal_device1:7>, <ore:blockRedstone>],
	[<ore:dustBedrock>, <immersiveengineering:metal_device1:7>, <ore:dustBedrock>]]);