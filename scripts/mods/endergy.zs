import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

# Remove Weak Conduits and unused alloys
/*
0 - Crude Steel
5 - Energetic Silver
6 - Vivid alloy
*/
for s in [
  "block_alloy_endergy",
  "item_alloy_endergy_nugget",
  "item_alloy_endergy_ingot",
  "item_alloy_endergy_ball"
] as string[] {
  for i in [0, 5] as int[] {
    val it = itemUtils.getItem("enderio:"~s,i);
    if (!isNull(it)) utils.rh(it, false);
  }
}

for fluid in [<liquid:crude_steel>, <liquid:energetic_silver>] as ILiquidStack[] {
  mods.nuclearcraft.IngotFormer.removeRecipeWithInput(fluid * 144);
  for n in [144, 16, 144*9] as int[] {
    mods.nuclearcraft.Melter.removeRecipeWithOutput(fluid * n);
  }
}

# Remove Unused alloy recipes
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:1>);
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:2>);
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:3>*2);
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:5>);
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:6>);

utils.rh(<enderio:item_endergy_conduit>);
utils.rh(<enderio:item_endergy_conduit:1>);
utils.rh(<enderio:item_endergy_conduit:2>);
utils.rh(<enderio:item_endergy_conduit:3>);
utils.rh(<enderio:item_endergy_conduit:4>);
utils.rh(<enderio:item_endergy_conduit:5>);
utils.rh(<enderio:item_endergy_conduit:6>);
utils.rh(<enderio:item_endergy_conduit:7>);
utils.rh(<enderio:item_capacitor_grainy>);
utils.rh(<enderio:item_capacitor_silver>);
utils.rh(<enderio:item_capacitor_energetic_silver>);
utils.rh(<enderio:item_capacitor_vivid>);
recipes.removeByRecipeName("enderio:capacitor_crystalline_alt");

# Remove liquids of removed alloys
mods.tconstruct.Melting.removeRecipe(<liquid:crude_steel>);
mods.tconstruct.Melting.removeRecipe(<liquid:energetic_silver>);

# Add harder stepped alloys
scripts.process.alloy([<ore:itemPulsatingPowder>   , <ore:ingotVibrantAlloy>        , <ore:ingotSentientMetal>], <ore:ingotCrystallineAlloy>.firstItem    , "no exceptions");
scripts.process.alloy([<ore:itemEnderCrystalPowder>, <ore:ingotCrystallineAlloy>    , <industrialforegoing:pink_slime_ingot>], <ore:ingotCrystallinePinkSlime>.firstItem, "no exceptions");
scripts.process.alloy([<ore:itemVibrantPowder>     , <ore:ingotCrystallinePinkSlime>, <ore:ingotUUMatter>     ], <ore:ingotMelodicAlloy>.firstItem        , "no exceptions");
scripts.process.alloy([<ore:itemPrecientPowder>    , <ore:ingotMelodicAlloy>        , <ore:ingotWyvernMetal>  ], <ore:ingotStellarAlloy>.firstItem        , "no exceptions");

# [Stellar Energy Conduit]*8 from [Infinity Reagent][+2]
craft.remake(<enderio:item_endergy_conduit:11> * 8, ["pretty",
  "C I C",
  "‚ ‚ ‚",
  "C I C"], {
  "C": <ore:itemConduitBinder>,  # Conduit Binder
  "I": <ore:itemInfinityGoop>,   # Infinity Reagent
  "‚": <ore:nuggetStellarAlloy>, # Stellar Alloy Nugget
});

# Stepped conduit recipes
# Stellar alloy is exception - it have only 1 ingot in recipe
val BDR = <ore:itemConduitBinder>;
val GP = <ore:itemInfinityGoop>;
val eAlloys = [
  <ore:ingotCrystallineAlloy>, 
  <ore:ingotCrystallinePinkSlime>, 
  <ore:ingotMelodicAlloy>, 
  <ore:nuggetStellarAlloy>,
] as IIngredient[];
val eCndts  = [
  <enderio:item_power_conduit:2>,
  <enderio:item_endergy_conduit:8>,
  <enderio:item_endergy_conduit:9>,
  <enderio:item_endergy_conduit:10>, 
  <enderio:item_endergy_conduit:11>, 
] as IItemStack[];

for i in 0 to eAlloys.length {
  recipes.addShaped("Cheaper " ~ getItemName(eCndts[i+1]), eCndts[i+1] * 8, [[BDR, i==3?GP:BDR, BDR], [eAlloys[i], eCndts[i], eAlloys[i]], [BDR, i==3?GP:BDR, BDR]]);
}

//////////////////////////////////////////////////
//            Ludicrite replacement             //
//////////////////////////////////////////////////
// Liquids recipe
mods.tconstruct.Alloy.addRecipe(<liquid:vivid_alloy> * 144, [
  <fluid:alumite> * 144,
  <fluid:enrichedlava> * 144,
  <fluid:plutonium_242> * 144,
  <fluid:mutagen> * 144,
  <fluid:enderium> * 144,
]);

// Multiblock Machine recipe
scripts.processUtils.avdRockXmlRecipeEx("PrecisionLaserEtcher", [
  <ore:blockEnderium>,                  # Block of Enderium
  <ore:blockAlumite>,                   # Alumite Block
  <draconicevolution:infused_obsidian>, # Draconium Infused Obsidian
  <ore:blockPlutonium242>,              # Plutonium-242 Block
], [<fluid:mutagen> * 1000], [<enderio:block_alloy_endergy:6>], null, {power: 160000, timeRequired: 20});
//////////////////////////////////////////////////
