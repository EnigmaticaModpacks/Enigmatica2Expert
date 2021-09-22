#Compatibility for Immersive Engineering <liquid:ethanol> and <liquid:plantoil>
import crafttweaker.item.IItemStack;

oreDict.cropLychee.add(<harvestcraft:lycheeitem>);
oreDict.cropJackfruit.add(<harvestcraft:jackfruititem>);

recipes.addShapeless(<harvestcraft:cracklinsitem>, [<ore:toolPot>, <ore:listAllporkraw>, <ore:foodOliveoil>, <ore:cropSpiceleaf>]);
recipes.addShapeless(<harvestcraft:porkrindsitem>, [<ore:toolPot>, <ore:foodSalt>, <ore:foodOliveoil>, <ore:foodBlackpepper>]);

recipes.addShapeless(<harvestcraft:imitationcrabsticksitem>, [<ore:toolCuttingboard>, <ore:foodFlour>, <ore:listAllfishcooked>, <ore:listAllegg>, <minecraft:dye:1>]);
recipes.addShapeless(<harvestcraft:saucedlambkebabitem>, [<ore:toolMixingbowl>, <ore:foodLambkebab>, <ore:foodPlainyogurt>, <ore:listAllheavycream>, <ore:cropGarlic>, <ore:cropSpiceleaf>, <ore:cropLime>]);
recipes.addShapeless(<harvestcraft:swedishmeatballsitem>, [<ore:toolSaucepan>, <ore:foodGroundbeef>, <ore:foodFlour>, <ore:cropSpiceleaf>, <ore:foodGroundnutmeg>, <ore:listAllheavycream>, <ore:foodBlackpepper>, <ore:listAllheavycream>, <ore:listAllegg>]);
recipes.addShapeless(<harvestcraft:garlicsteakitem>, [<ore:toolSkillet>, <ore:listAllbeefraw>, <ore:cropGarlic>, <ore:foodButter>, <ore:cropSpiceleaf>]);

recipes.removeShapeless(<harvestcraft:quesadillaitem>);
recipes.addShapeless(<harvestcraft:quesadillaitem>, [<ore:toolSkillet>, <ore:foodTortilla>, <ore:foodCheese>]);
recipes.addShapeless(<harvestcraft:schnitzelitem>, [<ore:toolSkillet>, <ore:listAllmuttonraw>, <ore:foodFlour>, <ore:cropLemon>, <ore:foodOliveoil>, <ore:foodBlackpepper>]);
recipes.addShapeless(<harvestcraft:schnitzelitem>, [<ore:toolSkillet>, <ore:listAllporkraw>, <ore:foodFlour>, <ore:cropLemon>, <ore:foodOliveoil>, <ore:foodBlackpepper>]);
recipes.addShapeless(<harvestcraft:bratwurstitem>, [<ore:toolCuttingboard>, <ore:foodPorksausage>, <ore:foodPickles>, <ore:cropOnion>, <minecraft:bread>]);

# Raw Meat -> Ground Meat
scripts.wrap.thermalexpansion.Pulverizer.addRecipe(<harvestcraft:groundduckitem>, <harvestcraft:duckrawitem>, 2000);
scripts.wrap.thermalexpansion.Pulverizer.addRecipe(<harvestcraft:groundmuttonitem>, <minecraft:mutton>, 2000);
scripts.wrap.thermalexpansion.Pulverizer.addRecipe(<harvestcraft:groundturkeyitem>, <harvestcraft:turkeyrawitem>, 2000);
scripts.wrap.thermalexpansion.Pulverizer.addRecipe(<harvestcraft:groundvenisonitem>, <harvestcraft:venisonrawitem>, 2000);


# Seeds/Crops that already have recipe added by IE and oredicted, will be removed and re-added from oredict
for item in [<minecraft:potato>] as IItemStack[] {
    mods.immersiveengineering.Fermenter.removeByInput(item);
}

for item in [<minecraft:wheat_seeds>,
    <minecraft:pumpkin_seeds>,
    <minecraft:beetroot_seeds>,
    <minecraft:melon_seeds>
] as IItemStack[] {
    mods.immersiveengineering.Squeezer.removeByInput(item);
}

for item in <ore:listAllveggie>.items {
    scripts.wrap.immersiveengineering.Fermenter.addRecipe(null, <liquid:ethanol> * 80, item, 500);
}

for item in <ore:listAllfruit>.items {
    scripts.wrap.immersiveengineering.Fermenter.addRecipe(null, <liquid:ethanol> * 120, item, 500);
}

for item in <ore:listAllberry>.items {
    scripts.wrap.immersiveengineering.Fermenter.addRecipe(null, <liquid:ethanol> * 100, item, 500);
}

for item in <ore:listAllseed>.items {
    scripts.wrap.immersiveengineering.Squeezer.addRecipe(null, <liquid:plantoil> * 80, item, 500);
}


for i, dye in scripts.category.dye.oreDye {
    if(i==0) continue;
    craft.reshapeless(itemUtils.getItem("harvestcraft:candledeco"~(i+1)) * 4, "AAAAc", {
        A: <harvestcraft:candledeco1>,
        c: dye,
    });
}

# Recipe Conflicts
recipes.removeByRecipeName("harvestcraft:honeyitem_foodhoneydrop");
recipes.removeByRecipeName("harvestcraft:honeyitem_drophoney");


# [Fresh Water]*8 from [Water Clay Bucket]
craft.shapeless(<harvestcraft:freshwateritem> * 8, "~", {
  "~": <claybucket:claybucket:1>.transformReplace(<claybucket:claybucket>), # Water Clay Bucket
});

# [Shipping Bin] from [Magical Apple][+2]
craft.remake(<harvestcraft:shippingbin>, ["pretty",
  "C # C",
  "# M #",
  "C # C"], {
  "C": <tconstruct:soil:4>,      # Consecrated Soil
  "#": <forestry:wood_pile>,     # Wood Pile
  "M": <extrautils2:magicapple>, # Magical Apple
});


# *=======  =======*

# Not Working untill this issue fixed:
# https://github.com/Tfarcenim/HarvestCraftTweaker2/issues/3

// # More meats from traps
// mods.harvestcrafttweaker.HarvestCraftTweaker.addGroundTrap(<ore:foodCheese>, [<rats:raw_rat>, <rats:rat_pelt>]);
// mods.harvestcrafttweaker.HarvestCraftTweaker.addGroundTrap(<animania:block_straw>, [
// 	<twilightforest:raw_venison>,
// 	<betteranimalsplus:venisonraw>,
// 	<betteranimalsplus:pheasantraw>,
// 	<betteranimalsplus:pheasant_egg>,
// 	<betteranimalsplus:turkey_egg>,
// 	<betteranimalsplus:goose_egg>,
// 	<betteranimalsplus:turkey_leg_raw>,
// ]);

// # More traps
// mods.harvestcrafttweaker.HarvestCraftTweaker.addWaterTrap(<thermalfoundation:bait>,   [<betteranimalsplus:crab_meat_raw>, <betteranimalsplus:eel_meat_raw>]);
// mods.harvestcrafttweaker.HarvestCraftTweaker.addWaterTrap(<thermalfoundation:bait:1>, [<iceandfire:shiny_scales>, <betteranimalsplus:blubber>]);
// mods.harvestcrafttweaker.HarvestCraftTweaker.addWaterTrap(<thermalfoundation:bait:2>, [
// 	<iceandfire:sea_serpent_scales_blue>,
// 	<iceandfire:sea_serpent_scales_bronze>,
// 	<iceandfire:sea_serpent_scales_deepblue>,
// 	<iceandfire:sea_serpent_scales_purple>,
// 	<iceandfire:sea_serpent_scales_red>,
// 	<iceandfire:sea_serpent_scales_teal>,
// 	<iceandfire:sea_serpent_scales_green>,
// ]);