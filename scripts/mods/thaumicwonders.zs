#modloaded thaumicwonders

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.IRecipeFunction;

// Cast quicksilver back to gem
recipes.removeByRecipeName("thaumicwonders:quicksilver_bucket");
recipes.removeByRecipeName("thaumicwonders:quicksilver_bucket_deconstruct");
mods.tconstruct.Casting.addTableRecipe(<thaumcraft:quicksilver>, <tconstruct:cast_custom:2>, <liquid:fluid_quicksilver>, 125, false);
scripts.process.melt(<thaumcraft:quicksilver>, <liquid:fluid_quicksilver> * 125);

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

# [Alienist's Stone] from [Starmetal Ingot][+7]
mods.thaumcraft.Infusion.removeRecipe(<thaumicwonders:alienist_stone>);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(
  "alienist_stone", # Name
  "TWOND_ALIENIST_STONE@1", # Research
  10, # Vis cost
  [<aspect:aer> * 5, <aspect:aqua> * 5],
  <thaumicwonders:alienist_stone>.withDamage(transStoneMaxDamage - 128), # Output
  Grid(["pretty",
  "  ˛  ",
  "ͺ - ‚",
  "  ͵  "], {
  "˛": <ore:nuggetVoid>,      # Void Metal Nugget
  "ͺ": <ore:nuggetMalachite>, # Malachite Nugget
  "-": <ore:ingotAstralStarmetal>,
  "‚": <ore:nuggetTopaz>,     # Topaz Nugget
  "͵": <ore:nuggetDraconium>, # Draconium Nugget
}).shaped());

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
# Unbreakable stones
# ---------------------------------------------------------
# Sadly, but Infusion recipes bugging with this stones.
# This may be caused by huge Damage value


# [Alchemist's Stone] from [Alchemist's Stone][+7]
craft.make(<thaumicwonders:alchemist_stone>.withTag({Unbreakable: 1 as byte} as crafttweaker.data.IData + utils.shinigTag(14602026)), ["pretty",
  "▬ e ▬",
  "□ o □",
  "▬ ▲ ▬"], {
  "o": <thaumicwonders:alchemist_stone>, # Central Item
  "▬": <ore:ingotGlitch>,      # Glitch Infused Ingot
  "e": <thaumcraft:pech_wand>, # Pech Wand
  "□": <ore:plateMithrillium>, # Mithrillium Plate
  "▲": <ore:dustMana>,         # Mana Dust
});

# [Transmuter's Stone] from [Transmuter's Stone][+7]
craft.make(<thaumicwonders:transmuter_stone>.withTag({Unbreakable: 1 as byte} as crafttweaker.data.IData + utils.shinigTag(14602026)), ["pretty",
  "▬ e ▬",
  "□ o □",
  "▬ ▲ ▬"], {
  "o": <thaumicwonders:transmuter_stone>, # Central Item
  "▬": <ore:ingotGlitch>,      # Glitch Infused Ingot
  "e": <thaumcraft:pech_wand>, # Pech Wand
  "□": <ore:plateMithrillium>, # Mithrillium Plate
  "▲": <ore:dustMana>,         # Mana Dust
});

# [Alienist's Stone] from [Alienist's Stone][+7]
craft.make(<thaumicwonders:alienist_stone>.withTag({Unbreakable: 1 as byte} as crafttweaker.data.IData + utils.shinigTag(14602026)), ["pretty",
  "▬ e ▬",
  "□ o □",
  "▬ ▲ ▬"], {
  "o": <thaumicwonders:alienist_stone>, # Central Item
  "▬": <ore:ingotGlitch>,      # Glitch Infused Ingot
  "e": <thaumcraft:pech_wand>, # Pech Wand
  "□": <ore:plateMithrillium>, # Mithrillium Plate
  "▲": <ore:dustMana>,         # Mana Dust
});

# ---------------------------------------------------------

scripts.jei.crafting_hints.addInsOutCatl([
  <thaumcraft:jar_normal>.withTag({Aspects: [{amount: 250, key: "aqua"}]}),
  <thaumcraft:jar_normal>.withTag({Aspects: [{amount: 250, key: "victus"}]}),
  <thaumcraft:jar_normal>.withTag({Aspects: [{amount: 250, key: "alienis"}]}),
], <ore:listAllmeatraw>.firstItem * 500, <thaumicwonders:meaty_orb>);

#[Alkahest vat]
mods.thaumcraft.Crucible.removeRecipe(<thaumicwonders:alkahest_vat>);
mods.thaumcraft.Infusion.registerRecipe(
  "alkahest_vat", # Name
  "TWOND_ALKAHEST", # Research
  <thaumicwonders:alkahest_vat>, # Output
  5, # Instability
  [<aspect:alkimia>*100,<aspect:caeles>*25,<aspect:infernum>*100,<aspect:fluctus>*50,<aspect:auram>*200],
  <thaumcraft:crucible>, # CentralItem
  [
    <thaumicaugmentation:material:5>,
    <thaumadditions:aura_disperser>,
    <thaumicaugmentation:material:5>,
    <thaumadditions:crystal_block>.withTag({Aspect: "visum"}),
    <thaumicaugmentation:material:5>,
    <thaumadditions:aura_disperser>,
    <thaumicaugmentation:material:5>,
    <thaumadditions:aura_charger>,
  ]
);

# [Creative Essentia Jar] from [Black Hole Talisman][+7]
craft.remake(<thaumicwonders:creative_essentia_jar>, ["pretty",
  "B D V D B",
  "S I M I S",
  "S M l M S",
  "S I M I S",
  "B D A D B"], {
  "B": <bloodmagic:decorative_brick:1>,         # Bloodstone Brick
  "D": <bloodmagic:points_upgrade>,             # Draft of Angelus
  "V": <thaumicwonders:void_beacon>,            # Void Beacon
  "S": <thaumicaugmentation:starfield_glass:1>, # Starfield Glass (Dimensional Fracture)
  "I": <thaumicaugmentation:impetus_mirror>,    # Impetus Mirror
  "M": <thaumadditions:jar_mithminite>,         # Mithminite Fortified Jar
  "l": <botania:blackholetalisman>,             # Black Hole Talisman
  "A": <thaumicwonders:alkahest_vat>,           # Alkahest Vat
});
