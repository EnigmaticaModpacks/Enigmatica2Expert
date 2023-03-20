import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IItemStack;

// Creative tank
<mekanism:machineblock2:11>.withTag({tier: 4}).addTooltip(format.red("Deprecated, place in crafting grid to receive resources."));
recipes.addHiddenShapeless("tankconvert",<thermalexpansion:tank>.withTag({RSControl: 0 as byte, Creative: 1 as byte, Level: 4 as byte}),[<mekanism:machineblock2:11>.withTag({tier: 4})]);

