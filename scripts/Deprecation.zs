import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IItemStack;

// Modular Machinery

recipes.removeByMod("modularmachinery");  

for item in loadedMods["modularmachinery"].items {
    item.addTooltip(format.red("Deprecated, place in crafting grid to receive resources."));
}

 val modmech = [<modularmachinery:blockcontroller>,
<modularmachinery:blockcasing>,
<modularmachinery:blockcasing:1>,
<modularmachinery:blockcasing:2>,
<modularmachinery:blockcasing:3>,
<modularmachinery:blockcasing:4>,
<modularmachinery:blockcasing:5>,
<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:advanced_metallurgic_fabricator"}),
<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:advanced_carpenter"}),
<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:arcane_crafting_engine"}),
<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:advanced_thermionic_fabricator"}),
<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:starlight_crafting_engine"}),
<modularmachinery:blockinputbus>,
<modularmachinery:blockinputbus:1>,
<modularmachinery:blockoutputbus>,
<modularmachinery:blockoutputbus:1>,
<modularmachinery:blockfluidinputhatch>,
<modularmachinery:blockfluidinputhatch:1>,
<modularmachinery:blockfluidoutputhatch>,
<modularmachinery:blockfluidoutputhatch:1>,
<modularmachinery:blockenergyinputhatch>,
<modularmachinery:blockenergyinputhatch:1>,
<modularmachinery:blockenergyoutputhatch>,
<modularmachinery:blockenergyoutputhatch:1>] as IItemStack[];

for i, item in modmech{
    recipes.addHiddenShapeless("mmrefund" ~ i,<mbd:base_casing>,[item]);
}

recipes.addHiddenShapeless("mmingotrefund",<contenttweaker:modularium>,[<modularmachinery:itemmodularium>]);

// Misc
<mekanism:machineblock2:11>.withTag({tier: 4}).addTooltip(format.red("Deprecated, place in crafting grid to receive resources."));
recipes.addHiddenShapeless("tankconvert",<thermalexpansion:tank>.withTag({RSControl: 0 as byte, Creative: 1 as byte, Level: 4 as byte}),[<mekanism:machineblock2:11>.withTag({tier: 4})]);