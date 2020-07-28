import mods.jei.JEI.removeAndHide as rh;
import mods.astralsorcery.Utils;
import crafttweaker.liquid.ILiquidDefinition;
import mods.nuclearcraft.melter;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

# Remove Weak Conduits and unused alloys
rh(<enderio:block_alloy_endergy>);
rh(<enderio:block_alloy_endergy:5>);
rh(<enderio:block_alloy_endergy:6>);
rh(<enderio:item_alloy_endergy_nugget>);
rh(<enderio:item_alloy_endergy_nugget:5>);
rh(<enderio:item_alloy_endergy_nugget:6>);
rh(<enderio:item_endergy_conduit>);
rh(<enderio:item_endergy_conduit:1>);
rh(<enderio:item_endergy_conduit:2>);
rh(<enderio:item_endergy_conduit:3>);
rh(<enderio:item_endergy_conduit:4>);
rh(<enderio:item_endergy_conduit:5>);
rh(<enderio:item_endergy_conduit:6>);
rh(<enderio:item_endergy_conduit:7>);
rh(<enderio:item_alloy_endergy_ingot>);
rh(<enderio:item_alloy_endergy_ingot:5>);
rh(<enderio:item_alloy_endergy_ingot:6>);
rh(<enderio:item_alloy_endergy_ball>);
rh(<enderio:item_alloy_endergy_ball:5>);
rh(<enderio:item_alloy_endergy_ball:6>);
rh(<enderio:item_capacitor_grainy>);
rh(<enderio:item_capacitor_silver>);
rh(<enderio:item_capacitor_energetic_silver>);
rh(<enderio:item_capacitor_vivid>);
recipes.removeByRecipeName("enderio:capacitor_crystalline_alt");

# Remove liquids of removed alloys
mods.tconstruct.Melting.removeRecipe(<liquid:crude_steel>);
mods.tconstruct.Melting.removeRecipe(<liquid:energetic_silver>);
mods.tconstruct.Melting.removeRecipe(<liquid:vivid_alloy>);

# Remove alloys with changed recipe
mods.enderio.AlloySmelter.removeRecipe(<ore:ingotCrystallineAlloy>.firstItem);
mods.enderio.AlloySmelter.removeRecipe(<ore:ingotCrystallinePinkSlime>.firstItem);
mods.enderio.AlloySmelter.removeRecipe(<ore:ingotMelodicAlloy>.firstItem);
mods.enderio.AlloySmelter.removeRecipe(<ore:ingotStellarAlloy>.firstItem * 2);

# Add harder stepped alloys
scripts.process.alloy([<ore:itemPulsatingPowder>   , <ore:ingotVibrantAlloy>        , <ore:ingotSentientMetal>], <ore:ingotCrystallineAlloy>.firstItem    , "no exceptions");
scripts.process.alloy([<ore:itemEnderCrystalPowder>, <ore:ingotCrystallineAlloy>    , <ore:ingotPinkMetal>    ], <ore:ingotCrystallinePinkSlime>.firstItem, "no exceptions");
scripts.process.alloy([<ore:itemVibrantPowder>     , <ore:ingotCrystallinePinkSlime>, <ore:ingotUUMatter>     ], <ore:ingotMelodicAlloy>.firstItem        , "no exceptions");
scripts.process.alloy([<ore:itemPrecientPowder>    , <ore:ingotMelodicAlloy>        , <ore:ingotWyvernMetal>  ], <ore:ingotStellarAlloy>.firstItem        , "no exceptions");

# Stepped conduit recipes
# Stellar alloy is exception - it have only 1 ingot in recipe
val BDR = <ore:itemConduitBinder>;
val eAlloys = [<ore:ingotCrystallineAlloy>, <ore:ingotCrystallinePinkSlime>, <ore:ingotMelodicAlloy>/* , <ore:ingotStellarAlloy> */] as IIngredient[];
val eCndts  = [
  <enderio:item_power_conduit:2>,
  <enderio:item_endergy_conduit:8>,
  <enderio:item_endergy_conduit:9>,
  <enderio:item_endergy_conduit:10>, 
  // <enderio:item_endergy_conduit:11>, 
] as IItemStack[];

for i in 0 to eAlloys.length {
  recipes.addShaped("Cheaper " ~ getItemName(eCndts[i+1]), eCndts[i+1] * 8, [[BDR, BDR, BDR], [eAlloys[i], eCndts[i], eAlloys[i]], [BDR, BDR, BDR]]);
}
