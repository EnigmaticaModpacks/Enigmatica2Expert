#Compatibility for Immersive Engineering <liquid:ethanol> and <liquid:plantoil>
import crafttweaker.item.IItemStack;


# Seeds/Vegetables that already have recipe added by IE
val blacklisted_items = [<minecraft:wheat_seeds>,
                         <minecraft:pumpkin_seeds>,
                         <minecraft:melon_seeds>,
                         <minecraft:potato>] as IItemStack[];

for item in <ore:listAllveggie>.items {
    if !(blacklisted_items has item) {
        mods.immersiveengineering.Fermenter.addRecipe(null, <liquid:ethanol> * 80, item, 500);
	}
}

for item in <ore:listAllseed>.items {
    if !(blacklisted_items has item) {
        mods.immersiveengineering.Squeezer.addRecipe(null, <liquid:plantoil> * 80, item, 500);
	}
}
