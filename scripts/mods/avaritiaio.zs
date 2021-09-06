#modloaded avaritiaio

import crafttweaker.item.IItemStack;

mods.avaritia.ExtremeCrafting.remove(<avaritiaio:infinitecapacitor>);

# Avaritia Ender IO integration
# Infinity ball from all other balls and infinity catalyst
recipes.remove(<avaritiaio:grindingballinfinity> * 64);
val grindingBalls = [
<enderio:item_alloy_ball>,
<enderio:item_alloy_ball:1>,
<enderio:item_alloy_ball:2>,
<enderio:item_alloy_ball:3>,
<enderio:item_alloy_ball:4>,
<enderio:item_alloy_ball:5>,
<enderio:item_alloy_ball:6>,
<enderio:item_alloy_ball:7>,
<enderio:item_alloy_ball:8>,
<enderio:item_alloy_ball:9>,
<enderio:item_material:57>,
<enderio:item_material:58>,
<enderio:item_material:59>,
<enderio:item_alloy_endergy_ball:1>,
<enderio:item_alloy_endergy_ball:2>,
<enderio:item_alloy_endergy_ball:3>,
<enderio:item_alloy_endergy_ball:4>,
] as IItemStack[];

scripts.wrap.extendedcrafting.CombinationCrafting.addRecipe(<avaritiaio:grindingballinfinity>, 2000000000, 20000000, <avaritiaio:grindingballneutronium>, grindingBalls);
