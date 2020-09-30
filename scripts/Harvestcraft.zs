#Compatibility for Immersive Engineering <liquid:ethanol> and <liquid:plantoil>
import crafttweaker.item.IItemStack;

recipes.removeByRecipeName("harvestcraft:berryvinaigrettesaladitem");

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
