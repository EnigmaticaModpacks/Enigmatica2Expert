#priority 950
#modloaded thaumicwonders

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.requious.AssemblyRecipe;
import mods.requious.Assembly;
import mods.requious.SlotVisual;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
// <assembly:transmuters_stone>

var
// -----------------------------------------------------------------------
x = <assembly:alchemists_stone>;
x.addJEICatalyst(<thaumicwonders:alchemist_stone>);
x.addJEICatalyst(<thaumicwonders:catalyzation_chamber>);
scripts.jei.requious.addInsOuts(x, [[0,0]], [[2,0]]);
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());

function addAlchemists(input as IIngredient, output as IItemStack) as void {
  scripts.jei.requious.add(<assembly:alchemists_stone>, {[input] as IIngredient[] : [output]});
}
// -----------------------------------------------------------------------
x = <assembly:alienists_stone>;
x.addJEICatalyst(<thaumicwonders:alienist_stone>);
x.addJEICatalyst(<thaumicwonders:catalyzation_chamber>);
scripts.jei.requious.addInsOuts(x, [[0,0]], [[2,0]]);
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());

function addAlienists(input as IIngredient, output as IItemStack) as void {
  scripts.jei.requious.add(<assembly:alienists_stone>, {[input] as IIngredient[] : [output]});
}
// -----------------------------------------------------------------------
x = <assembly:transmuters_stone>;
x.addJEICatalyst(<thaumicwonders:transmuter_stone>);
x.addJEICatalyst(<thaumicwonders:catalyzation_chamber>);
scripts.jei.requious.addInsOuts(x, [[0,0]], [[2,0]]);
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());

function addTransmuters(input as IIngredient, output as IItemStack) as void {
  scripts.jei.requious.add(<assembly:transmuters_stone>, {[input] as IIngredient[] : [output]});
}

// Available prefixes
// "ore", "nugget", "block", "ingot", "gem", "dust"

for i, pair in [
  ["oreIron"           , "oreGold"],
  ["oreTin"            , "oreCopper"],
  ["oreLead"           , "oreSilver"],
  ["oreCobalt"         , "oreArdite"],
  ["oreAstralStarmetal", "oreDraconium"],
  ["orePlatinum"       , "oreIridium"],
  ["oreAluminum"       , "oreTitanium"],
  ["oreUranium"        , "oreThorium"],
  ["oreXorcyte"        , "oreAquamarine"],
  ["oreDiamond"        , "oreSapphire"],
  ["oreEmerald"        , "orePeridot"],
  ["oreRedstone"       , "oreRuby"],
  ["oreCertusQuartz"   , "oreChargedCertusQuartz"],
  ["oreDilithium"      , "oreDimensionalShard"],
  ["gemCoal"           , "bitumen"],
  ["oreCoal"           , "oreClathrateOilShale"],
] as string[][] {
  val one = oreDict[pair[0]].firstItem;
  val two = oreDict[pair[1]].firstItem;
  
  if(isNull(one) || isNull(two)) continue;
  addTransmuters(one, two);
  addTransmuters(two, one);
}
// -----------------------------------------------------------------------