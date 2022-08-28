#priority 950
#modloaded exnihilocreatio

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;
import scripts.jei.requious.add as addRecipe;

var x = <assembly:scented_hive>;
x.addJEICatalyst(<exnihilocreatio:hive:1>);
x.setJEIDurationSlot(3,0,"duration", scripts.jei.requious.getVisSlots(5,1));
scripts.jei.requious.addInsOuts(x, [[1,1],[1,0],[2,0],[0,0]], [[4,0]]);

val worldItem as IItemStack[int] = {
  0: <biomesoplenty:earth>.withTag({display:{Name:"§6OVERWORLD"}}),
  1: <biomesoplenty:earth>.withTag({display:{Name:"§6THE END"}}),
};

/*Inject_js(
JSON.parse(loadText('config/exnihilocreatio/ScentedHiveRegistry.json'))
.map(l=>`addRecipe(x, {[worldItem[${l.dim}], ${'<exnihilocreatio:hive:1>'}, ${
  Object.keys(l.adjacentBlocks).map(i=>`<${i}>`).join(', ')
}] : [<${l.hive}>]});`)
.join('\n')
)*/
addRecipe(x, {[worldItem[0], <exnihilocreatio:hive:1>, <ore:treeLeaves>, <ore:logWood>] : [<forestry:beehives:0>]});
addRecipe(x, {[worldItem[0], <exnihilocreatio:hive:1>, <ore:flower>] : [<forestry:beehives:1>]});
addRecipe(x, {[worldItem[0], <exnihilocreatio:hive:1>, <ore:sand>] : [<forestry:beehives:2>]});
addRecipe(x, {[worldItem[0], <exnihilocreatio:hive:1>, <minecraft:log:3>, <ore:treeLeaves>] : [<forestry:beehives:3>]});
addRecipe(x, {[worldItem[1], <exnihilocreatio:hive:1>, <minecraft:end_stone:0>] : [<forestry:beehives:4>]});
addRecipe(x, {[worldItem[0], <exnihilocreatio:hive:1>, <minecraft:ice:0>, <minecraft:snow:0>] : [<forestry:beehives:5>]});
addRecipe(x, {[worldItem[0], <exnihilocreatio:hive:1>, <ore:dirt>] : [<forestry:beehives:6>]});
/**/

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:witch_water>;
x.addJEICatalyst(Bucket('witchwater'));
x.addJEICatalyst(<exnihilocreatio:witchwater>);
x.setJEIDurationSlot(1,0,"duration", scripts.jei.requious.getVisGauge(1,8));
scripts.jei.requious.addInsOuts(x, [[0,0]], [[2,0]]);
addRecipe(x, {[Soul('minecraft:skeleton')] : [Soul('minecraft:wither_skeleton')]});
addRecipe(x, {[Soul('minecraft:creeper')]  : [Soul('minecraft:creeper')]});
addRecipe(x, {[Soul('minecraft:slime')]    : [Soul('minecraft:magma_cube')]});
addRecipe(x, {[Soul('minecraft:spider')]   : [Soul('minecraft:cave_spider')]});
addRecipe(x, {[Soul('minecraft:squid')]    : [Soul('minecraft:ghast')]});
addRecipe(x, {[Soul('minecraft:villager')] : [Soul('minecraft:zombie_villager')]});
addRecipe(x, {[Soul('minecraft:pig')]      : [Soul('minecraft:zombie_pigman')]});
addRecipe(x, {[<openblocks:luggage>]       : [<openblocks:luggage>.withTag({size: 54})]});

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:barrel_milking>;
x.addJEICatalyst(<exnihilocreatio:block_barrel0>);
x.addJEICatalyst(<exnihilocreatio:block_barrel1>);
x.setJEIItemSlot(0, 0, 'input0');
x.setJEIFluidSlot(2, 0, 'fluid_out');
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());

function add_barrel_milking(input as IIngredient, output as ILiquidStack, duration as int) as void {
  <assembly:barrel_milking>.addJEIRecipe(AssemblyRecipe.create(function(c) {
      c.addFluidOutput('fluid_out', output);
    })
    .requireItem("input0", input)
    .requireDuration("duration", max(1, duration))
  );
}


/*Inject_js(
loadJson("config/exnihilocreatio/MilkEntityRegistry.json")
.map(o=>[
  `add_barrel_milking(Soul("${o.entityOnTop}")`,
  `, <liquid:${o.result}>`, ` * ${o.amount}`,
  `, ${o.coolDown});`
])
)*/
add_barrel_milking(Soul("minecraft:cow")                 , <liquid:milk>               * 10, 20);
add_barrel_milking(Soul("emberroot:timberwolf")          , <liquid:tree_oil>           * 10, 20);
add_barrel_milking(Soul("emberroot:rainbow_golem")       , <liquid:construction_alloy> * 10, 20);
add_barrel_milking(Soul("excompressum:angry_chicken")    , <liquid:fiery_essence>      * 10, 20);
add_barrel_milking(Soul("emberroot:skeleton_frozen")     , <liquid:ice>                * 10, 20);
add_barrel_milking(Soul("betteranimalsplus:walrus")      , <liquid:lubricant>          * 10, 20);
add_barrel_milking(Soul("mekanism:robit")                , <liquid:electronics>        * 10, 20);
add_barrel_milking(Soul("endreborn:watcher")             , <liquid:obsidian>           * 40, 20);
add_barrel_milking(Soul("betteranimalsplus:hirschgeist") , <liquid:platinum>           * 10, 20);
add_barrel_milking(Soul("industrialforegoing:pink_slime"), <liquid:if.pink_slime>      * 10, 20);
add_barrel_milking(Soul("rats:neo_ratlantean")           , <liquid:crystal_matrix>     * 1 , 20);
add_barrel_milking(Soul("iceandfire:if_cockatrice")      , <liquid:gelatin>            * 10, 20);
/**/
