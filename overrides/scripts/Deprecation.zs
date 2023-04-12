import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IItemStack;
#modloaded bigreactors

// Creative tank
<mekanism:machineblock2:11>.withTag({tier: 4}).addTooltip(format.red("Deprecated, place in crafting grid to receive resources."));
recipes.addHiddenShapeless("tankconvert",<thermalexpansion:tank>.withTag({RSControl: 0 as byte, Creative: 1 as byte, Level: 4 as byte}),[<mekanism:machineblock2:11>.withTag({tier: 4})]);

recipes.addShapeless("ER1", <contenttweaker:anglesite>, [<bigreactors:minerals>], null);
recipes.addShapeless("ER2", <contenttweaker:benitoite>, [<bigreactors:minerals:1>], null);
recipes.addShapeless("ER3", <enderio:block_alloy_endergy:3>, [<bigreactors:blockmetals:4>], null);
recipes.addShapeless("ER4", <enderio:item_alloy_endergy_ingot:3>, [<bigreactors:ingotmetals:4>], null);