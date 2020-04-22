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

<opencomputers:robot>
<opencomputers:print>

---------------------
CRAFTS OF INTEREST
---------------------
mods.rt.RandomThingsTweaker.addAnvilRecipe(<cyclicmagic:book_ender>, <draconicevolution:draconium_block>, <draconicevolution:dislocator>, 5);
 */