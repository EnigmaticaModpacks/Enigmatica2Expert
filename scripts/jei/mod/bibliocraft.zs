#priority 950
#modloaded bibliocraft

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.requious.SlotVisual;
import scripts.jei.requious.add as addRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:typewriter>;
x.addJEICatalyst(<bibliocraft:typewriter>);
x.addJEICatalyst(<bibliocraft:desk>);
x.setJEIDurationSlot(4,1,"duration", SlotVisual.arrowRight());
scripts.jei.requious.addInsOuts(x, [[2,0],[0,1],[1,1],[2,1],[1,2],[2,2]], [[6,1]]);

for name, book in scripts._init.variables.bookWrittenBy {
  addRecipe(x, {[
    <minecraft:name_tag:*>,
    <minecraft:paper>,
    <bibliocraft:typewriter:*>,
    Soul(scripts._init.variables.bookWriters[name]),
    <bibliocraft:desk:*>,
    <bibliocraft:seat:*>,
  ] : [book]});
}
