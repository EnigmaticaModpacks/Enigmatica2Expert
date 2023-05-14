import mods.jei.JEI.removeAndHide as rh;
import mods.jei.JEI.addDescription;
import crafttweaker.item.IIngredient;

#modloaded bigreactors

recipes.removeByMod("bigreactors");

var MissingER = [<bigreactors:turbinehousingcores>,<bigreactors:reactorcasingcores>,<bigreactors:dustmetals:*>,<bigreactors:ingotmetals:*>,<bigreactors:minerals:*>,<fluid:yellorium>,<fluid:cyanite>,<fluid:fuelcolumn>] as IIngredient[];
for item in MissingER {
addDescription(item,"Mod set for removal, all recipes and functionalities disabled. Update all your autocrafting and systems to no longer use this mod.");
item.addTooltip(format.red("Mod set for removal, all recipes and functionalities disabled."));
rh(item);
}

for item in loadedMods["bigreactors"].items {
addDescription(item,"Mod set for removal, all recipes and functionalities disabled. Update all your autocrafting and systems to no longer use this mod.");
item.addTooltip(format.red("Mod set for removal, all recipes and functionalities disabled."));
rh(item);
}

# Material conversion
recipes.addShapeless("Anglesite conversion",<contenttweaker:anglesite>,[<bigreactors:minerals:0>]);
recipes.addShapeless("Benitoite conversion",<contenttweaker:benitoite>,[<bigreactors:minerals:1>]);
recipes.addShapeless("Blutonium -> Melodic Ingot conversion",<enderio:item_alloy_endergy_ingot:2>,[<bigreactors:ingotmetals:3>]);
recipes.addShapeless("Ludicrite -> Stellar Ingot conversion",<enderio:item_alloy_endergy_ingot:3>,[<bigreactors:ingotmetals:4>]);
recipes.addShapeless("Blutonium -> Melodic Block conversion",<enderio:block_alloy_endergy:2>,[<bigreactors:blockmetals:3>]);
recipes.addShapeless("Ludicrite -> Stellar Block conversion",<enderio:block_alloy_endergy:3>,[<bigreactors:blockmetals:4>]);
recipes.addShapeless("Blutonium -> Melodic Dust conversion",<enderio:item_alloy_endergy_ingot:2>,[<bigreactors:dustmetals:3>]);
recipes.addShapeless("Ludicrite -> Stellar Dust conversion",<enderio:item_alloy_endergy_ingot:3>,[<bigreactors:dustmetals:4>]);