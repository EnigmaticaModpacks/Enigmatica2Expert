import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.jei.JEI.removeAndHide as rh;
import mods.immersivetweaker.Recycling;
import mods.inworldcrafting.FluidToItem.transform as fti;
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
mods.inworldcrafting.FluidToFluid.transform(<liquid:sand>, <liquid:blueslime>, <ore:soulSand>);

# Sandwiches
var anyDragonsteelSword as IIngredient = <tconstruct:large_sword_blade>.withTag({Material: "dragonsteel_fire"}) |
	<tconstruct:large_sword_blade>.withTag({Material: "dragonsteel_ice"});
remakeEx(<culinaryconstruct:sandwich_station>, [
	[<nuclearcraft:moresmore>, anyDragonsteelSword, <nuclearcraft:moresmore>], 
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
mods.inworldcrafting.FluidToItem.transform(<ic2:dust:3>, <fluid:water>, <ore:dustCoal>);

# Lesser blaze powder
recipes.remove(<minecraft:blaze_powder> * 2);
recipes.addShapeless("Blaze Powder", <minecraft:blaze_powder>, [<minecraft:blaze_rod>]);

# Remake plates
// recipes.remove(<minecraft:light_weighted_pressure_plate>);
// recipes.remove(<minecraft:heavy_weighted_pressure_plate>);
// mods.mechanics.addCrushingBlockRecipe(<minecraft:gold_ingot> * 2, [<minecraft:light_weighted_pressure_plate>] as IItemStack[], [1.0] as double[]);
// mods.mechanics.addCrushingBlockRecipe(<minecraft:iron_ingot> * 2, [<minecraft:heavy_weighted_pressure_plate>] as IItemStack[], [1.0] as double[]);


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
<twilightforest:firefly>
<twilightforest:raw_venison>
<twilightforest:cooked_venison>
<randomthings:spectreilluminator>

<opencomputers:robot>
<opencomputers:print>
<bibliocraft:enchantedplate>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 0 as short}]})
<thaumcraft:nugget:10> -- Rare Earth
<randomthings:ingredient:2> -- Ectoplasm
<tombmanygraves:death_list>
<randomthings:rezstone> -- Bloodstone
<liquid:hot_spring_water>
<liquid:liquid_sunshine>
<liquid:blockfluiddirt> -- Liquid Dirt from Animus
<liquid:enrichedlava>
<liquid:liquidchorus>
<liquid:menrilresin>
<liquid:crystal> -- Crystallized obsidian
<liquid:amber> -- Crystallized amber
<advancedrocketry:blocklens> - Lence (required precision assembler)

---------------------
CRAFTS OF INTEREST
---------------------
mods.rt.RandomThingsTweaker.addAnvilRecipe(<cyclicmagic:book_ender>, <draconicevolution:draconium_block>, <draconicevolution:dislocator>, 5);
 */