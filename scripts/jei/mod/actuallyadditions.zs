#priority 950
#modloaded actuallyadditions

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.requious.SlotVisual;
import scripts.jei.requious.add as addRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:lens_of_the_miner>;
x.addJEICatalyst(<actuallyadditions:item_mining_lens>);
x.addJEICatalyst(<actuallyadditions:block_atomic_reconstructor>);
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
scripts.jei.requious.addInsOuts(x, [[0,0]], [[2,0]]);

function addMiningLensOre(base as IIngredient, oreDictName as string, weight as int) as void {
  val ore = oreDict[oreDictName];
  if(ore.items.length == 0) return;
  val output = ore.firstItem.withLore(["§e§lWeight: " ~ weight]);
  addRecipe(<assembly:lens_of_the_miner>, {[base] as IIngredient[] : [output]});
}

function addMiningLensStoneOre(oreDictName as string, weight as int) {
  addMiningLensOre(<minecraft:stone>, oreDictName, weight);
}
function addMiningLensNetherOre(oreDictName as string, weight as int) {
  addMiningLensOre(<minecraft:netherrack>, oreDictName, weight);
}

// Values taken from:
// https://github.com/Ellpeck/ActuallyAdditions/blob/main/src/main/java/de/ellpeck/actuallyadditions/common/items/lens/LensMining.java
addMiningLensNetherOre("oreNetherDiamond", 50);
addMiningLensNetherOre("oreNetherRedstone", 200);
addMiningLensNetherOre("oreNetherLapis", 250);
addMiningLensNetherOre("oreQuartz", 3000);
addMiningLensNetherOre("oreNetherCoal", 5000);
addMiningLensNetherOre("crushedNetherrack", 6000);

addMiningLensStoneOre("oreMalachite", 40);
addMiningLensStoneOre("orePeridot", 40);
addMiningLensStoneOre("oreRuby", 40);
addMiningLensStoneOre("oreSapphire", 40);
addMiningLensStoneOre("oreApatite", 700);
addMiningLensStoneOre("oreCertusQuartz", 800);
addMiningLensStoneOre("oreQuartzBlack", 3000);
addMiningLensStoneOre("oreCoal", 5000);
addMiningLensStoneOre("gravel", 6000);

