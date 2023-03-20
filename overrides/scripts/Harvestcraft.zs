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
mods.thermalexpansion.Pulverizer.addRecipe(<harvestcraft:groundduckitem>, <harvestcraft:duckrawitem>, 2000);
mods.thermalexpansion.Pulverizer.addRecipe(<harvestcraft:groundmuttonitem>, <minecraft:mutton>, 2000);
mods.thermalexpansion.Pulverizer.addRecipe(<harvestcraft:groundturkeyitem>, <harvestcraft:turkeyrawitem>, 2000);
mods.thermalexpansion.Pulverizer.addRecipe(<harvestcraft:groundvenisonitem>, <harvestcraft:venisonrawitem>, 2000);


# Seeds/Crops that already have recipe added by IE and oredicted, will be removed and re-added from oredict
                         
val blacklist_fermenter = [<minecraft:potato>] as IItemStack[];

val blacklist_squeezer = [<minecraft:wheat_seeds>,
                         <minecraft:pumpkin_seeds>,
                         <minecraft:beetroot_seeds>,
                         <minecraft:melon_seeds>] as IItemStack[];

for item in blacklist_fermenter {
    mods.immersiveengineering.Fermenter.removeByInput(item);
}

for item in blacklist_squeezer {
    mods.immersiveengineering.Squeezer.removeByInput(item);
}

for item in <ore:listAllveggie>.items {
    mods.immersiveengineering.Fermenter.addRecipe(null, <liquid:ethanol> * 80, item, 500);
}

for item in <ore:listAllfruit>.items {
    mods.immersiveengineering.Fermenter.addRecipe(null, <liquid:ethanol> * 120, item, 500);
}

for item in <ore:listAllberry>.items {
    mods.immersiveengineering.Fermenter.addRecipe(null, <liquid:ethanol> * 100, item, 500);
}

for item in <ore:listAllseed>.items {
    mods.immersiveengineering.Squeezer.addRecipe(null, <liquid:plantoil> * 80, item, 500);
}
