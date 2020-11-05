#Compatibility for Immersive Engineering <liquid:ethanol> and <liquid:plantoil>
import crafttweaker.item.IItemStack;

recipes.removeByRecipeName("harvestcraft:berryvinaigrettesaladitem");

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
