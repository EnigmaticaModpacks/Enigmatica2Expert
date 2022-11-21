#priority 950
#modloaded ic2

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;
import scripts.jei.requious.add as addRecipe;


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:liquid_heat_exchanger>;
x.addJEICatalyst(<ic2:te:31>);
x.setJEIFluidSlot(0, 0, 'liquid_input');
x.setJEIItemSlot(1, 0, 'item_in');
x.setJEIDurationSlot(2,0,"duration", scripts.jei.requious.getVisGauge(5,1));
x.setJEIFluidSlot(3, 0, 'liquid_output');

for l_in, l_out in {
  lava: 'ic2pahoehoe_lava',
  ic2hot_coolant: 'ic2coolant',
} as string[string] {
  x.addJEIRecipe(AssemblyRecipe.create(function(container) {
    container.addFluidOutput('liquid_output', game.getLiquid(l_out));
  })
  .requireFluid('liquid_input', game.getLiquid(l_in))
  .requireItem("item_in", <ic2:crafting:7>)
  );
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:ic2_crops>;
x.addJEICatalyst(<ic2:crop_stick>);
x.addJEICatalyst(<ic2:te:58>);
x.addJEICatalyst(<ic2:crop_seed_bag>);
x.setJEIDurationSlot(2,0,"duration", scripts.jei.requious.getVisSlots(11,1));
x.setJEIItemSlot(1, 0, 'input1', scripts.jei.requious.getVisSlots(0,2));
scripts.jei.requious.addInsOuts(x, [[0,0]], [[3,0],[4,0],[5,0],[6,0]]);

static glyphs as IItemStack[] = [
  <openblocks:glyph:48>, <openblocks:glyph:49>, <openblocks:glyph:50>,
  <openblocks:glyph:51>, <openblocks:glyph:52>, <openblocks:glyph:53>,
  <openblocks:glyph:54>, <openblocks:glyph:55>, <openblocks:glyph:56>,
  <openblocks:glyph:57>, <openblocks:glyph:65>, <openblocks:glyph:66>,
  <openblocks:glyph:67>, <openblocks:glyph:68>, <openblocks:glyph:69>,
  <openblocks:glyph:70>,
] as IItemStack[];

function addCrop(id as string, drops as IItemStack[], tier as int, attributes as string, requirments as string = null) as void {
  val seed = <ic2:crop_seed_bag>.withTag({owner: "ic2", scan: 1 as byte, growth: 1 as byte, id: id, resistance: 1 as byte, gain: 1 as byte});
  addRecipe(<assembly:ic2_crops>, {[
    isNull(requirments) ? seed : seed.withLore(["§6§lRequirments: ", requirments]),
    glyphs[tier].withDisplayName("§bTier: "~tier).withLore(["§e§lAttributes: ", "§e" ~ attributes])
  ] : drops});
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:ic2_semifluid>;
x.addJEICatalyst(<ic2:te:7>);
x.setJEIFluidSlot(0, 0, 'fluid_in');
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
x.setJEIEnergySlot(2, 0, 'energy_out', "rf");

function semifluid(input as ILiquidStack, eu_t as double) as void {
  <assembly:ic2_semifluid>.addJEIRecipe(AssemblyRecipe.create(function(c) {
      c.addEnergyOutput('energy_out', eu_t * 4, 0);
    })
    .requireFluid("fluid_in", input)
  );
}

# Defaults
semifluid(<fluid:biomass>    , 8);
semifluid(<fluid:ic2biogas>  , 16);
semifluid(<fluid:bio.ethanol>, 32);
