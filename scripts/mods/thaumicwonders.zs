#modloaded thaumicwonders

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.IRecipeFunction;

# [Flux Capacitor] from [Vis Battery][+4]
mods.thaumcraft.Infusion.removeRecipe(<thaumicwonders:flux_capacitor>);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(
  "flux_capacitor", # Name
  "TWOND_FLUX_CAPACITOR", # Research
  200, # Vis cost
  [<aspect:terra>, <aspect:ignis>],
  <thaumicwonders:flux_capacitor>, # Output
  Grid(["pretty",
  "  *  ",
  "F V F",
  "  *  "], {
  "*": <ore:oreCrystalTaint>,          # Flux Crystal
  "F": <thaumcraft:condenser_lattice>, # Flux Condenser Lattice
  "V": <thaumcraft:vis_battery>,       # Vis Battery
}).shaped());

# [Flux Distiller] from [Flux Condenser][+8]
mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumicwonders:flux_distiller>);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(
  "flux_distiller", # Name
  "TWOND_FLUX_DISTILLER", # Research
  750, # Vis cost
  [<aspect:aer> * 8, <aspect:aqua> * 8, <aspect:ordo> * 8],
  <thaumicwonders:flux_distiller>, # Output
  Grid(["pretty",
  "□ F □",
  "C l C",
  "□ c □"], {
  "□": <ore:plateVoid>,                # Void Metal Plate
  "F": <thaumcraft:condenser_lattice>, # Flux Condenser Lattice
  "C": <thaumcraft:mechanism_complex>, # Complex Arcane Mechanism
  "l": <thaumcraft:condenser>,         # Flux Condenser
  "c": <thaumcraft:metal_alchemical>,  # Alchemical Construct
}).shaped());

# ---------------------------------------------------------
# Trans Stones rework
# ---------------------------------------------------------
static transStoneMaxDamage as int = 65534 as int;

val transStones = [
  <thaumicwonders:alchemist_stone>,
  <thaumicwonders:transmuter_stone>,
  <thaumicwonders:alienist_stone>,
] as IItemStack[];

static getBonused as function(int,int)int = function (durA as int, durB as int) as int {
  val minDur = min(durA, durB);
  val durBonus = (minDur as double * 0.1d + 0.5d) as int;
  return durA + durB + durBonus;
};

static getOutDurab as function(IItemStack,IItemStack)int = function (a as IItemStack, b as IItemStack) as int {
  if(a.damage == 0 && b.damage == 0) return -1 as int;
  val durA = a.maxDamage - a.damage;
  val durB = b.maxDamage - b.damage;
  return max(0, a.maxDamage - getBonused(durA, durB));
};

static stoneCombiningRecipeFunc as IRecipeFunction = function(out, ins, cInfo) {
  if(isNull(ins.a) || isNull(ins.b)) return null;
  val newDur = getOutDurab(ins.a, ins.b);
  return newDur < 0 ? null : out.withDamage(newDur);
} as IRecipeFunction;

for i, stone in transStones {
  # Buff Trans-Stones to add advanced recipes
  stone.maxDamage = transStoneMaxDamage;

  # JEI recipe
  val maxDmg = stone.maxDamage;
  val quartStone = stone.withDamage(maxDmg as double * 0.75d);
  recipes.addShapeless('stone jei '~i,
    stone.withDamage(
      maxDmg - getBonused(maxDmg / 4, maxDmg / 4)
    ),
    [quartStone, quartStone]
  );

  # Actual combining recipe
  recipes.addHiddenShapeless('stone combining '~i,
    stone, [stone.anyDamage().marked('a'), stone.anyDamage().marked('b')],
    stoneCombiningRecipeFunc, null
  );
}

# [Alienist's Stone] from [Starmetal Ingot][+8]
mods.thaumcraft.Infusion.removeRecipe(<thaumicwonders:alienist_stone>);
mods.thaumcraft.Infusion.registerRecipe(
  "alienist_stone", # Name
  "TWOND_ALIENIST_STONE@1", # Research
  <thaumicwonders:alienist_stone>.withDamage(transStoneMaxDamage - 128), # Output
  13, # Instability
  [<aspect:metallum> * 50, <aspect:vitium> * 50, <aspect:alkimia> * 50],
  <astralsorcery:itemcraftingcomponent:1>, # Central Item
  Grid(["pretty",
  "  r  ",
  "♦   ◊",
  "  θ  "], {
  "r": <thaumcraft:primordial_pearl>.anyDamage(), # Primordial Pearl
  "♦": <ore:dirtyGemMalachite>,                   # Dirty Malachite
  "◊": <ore:dirtyGemTopaz>,                       # Dirty Topaz
  "θ": <ore:dirtyGemDraconium>,                   # Dirty Draconium
}).spiral(1));

# [Alchemist's Stone] from [Phial of Ordo Essentia]*5[+2]
mods.thaumcraft.Crucible.removeRecipe(<thaumicwonders:alchemist_stone>);
mods.thaumcraft.Crucible.registerRecipe(
  "alchemist_stone", # Name
  "TWOND_CATALYZATION_CHAMBER@2", # Research
  <thaumicwonders:alchemist_stone>.withDamage(transStoneMaxDamage - 128), # Output
  <ore:ingotSilver>, # Input
  [<aspect:ordo> * 20, <aspect:alkimia> * 10]
);

# [Transmuter's Stone] from [Phial of Permutatio Essentia]*5[+2]
mods.thaumcraft.Crucible.removeRecipe(<thaumicwonders:transmuter_stone>);
mods.thaumcraft.Crucible.registerRecipe(
  "transmuter_stone", # Name
  "TWOND_TRANSMUTER_STONE@1", # Research
  <thaumicwonders:transmuter_stone>.withDamage(transStoneMaxDamage - 128), # Output
  <ore:ingotElectrum>, # Input
  [<aspect:permutatio> * 20, <aspect:alkimia> * 20]
);

events.onPlayerPickupItem(function(e as crafttweaker.event.PlayerPickupItemEvent){
  if(e.player.world.remote) return;
  if(isNull(e.item) || isNull(e.item.item)) return;
  
  val id = e.item.item.definition.id;
  if(
    id != 'thaumicwonders:alienist_stone' &&
    id != 'thaumicwonders:alchemist_stone' &&
    id != 'thaumicwonders:transmuter_stone'
  ) return;

  // e.player.sendMessage('Picked up');
  for i in 0 .. e.player.inventorySize {
    val item = e.player.getInventoryStack(i);
    if(isNull(item) || item.definition.id != id) continue;
    val newDur = getOutDurab(item, e.item.item);
    if(newDur < 0) continue;
    e.item.item.mutable().shrink(1);
    item.mutable().withDamage(newDur);
    e.cancel();
    return;
  }
});

# ---------------------------------------------------------

scripts.jei.crafting_hints.addInsOutCatl([
  <thaumcraft:jar_normal>.withTag({Aspects: [{amount: 250, key: "aqua"}]}),
  <thaumcraft:jar_normal>.withTag({Aspects: [{amount: 250, key: "victus"}]}),
  <thaumcraft:jar_normal>.withTag({Aspects: [{amount: 250, key: "alienis"}]}),
], <ore:listAllmeatraw>.firstItem * 500, <thaumicwonders:meaty_orb>);
