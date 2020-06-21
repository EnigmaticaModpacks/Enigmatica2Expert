import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.jei.JEI.removeAndHide as rh;
import mods.immersivetweaker.Recycling;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;


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

# Upgrade for laser (laser is deprecated)
rh(<tmemes:electric_upgrade:1>);

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
# Bedrock Ore
#
# ######################################################################

recipes.remove(<bedrockores:bedrock_miner>);
recipes.addShaped(<bedrockores:bedrock_miner>, [
	[<ore:dustBedrock>, <immersiveengineering:metal_decoration0:5>, <ore:dustBedrock>],
	[<ore:blockRedstone>, <immersiveengineering:metal_device1:7>, <ore:blockRedstone>],
	[<ore:dustBedrock>, <immersiveengineering:metal_device1:7>, <ore:dustBedrock>]]);


/* 
---------------------
ITEMS OF INTEREST
---------------------
<twilightforest:firefly>
<twilightforest:raw_venison>
<twilightforest:cooked_venison>
<randomthings:spectreilluminator>

<bibliocraft:enchantedplate>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 0 as short}]})
<thaumcraft:nugget:10> -- Rare Earth
<randomthings:ingredient:2> -- Ectoplasm
<tombmanygraves:death_list>
<randomthings:rezstone> -- Bloodstone
<advancedrocketry:blocklens> - Lence (required precision assembler)
<enderio:block_holy_fog> -- Nano-particles
randomthings:strong_collapse -- Turnd upsidedown potion

<liquid:hot_spring_water>
<liquid:liquid_sunshine>
<liquid:blockfluiddirt> -- Liquid Dirt from Animus
<liquid:enrichedlava>
<liquid:liquidchorus>
<liquid:menrilresin>
<liquid:crystal> -- Crystallized obsidian
<liquid:amber> -- Crystallized amber

---------------------
CRAFTS OF INTEREST
---------------------
mods.rt.RandomThingsTweaker.addAnvilRecipe(<cyclicmagic:book_ender>, <draconicevolution:draconium_block>, <draconicevolution:dislocator>, 5);
 */