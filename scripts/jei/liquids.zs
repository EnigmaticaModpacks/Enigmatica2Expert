#modloaded requious

#priority 950
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.requious.AssemblyRecipe;
import scripts.jei.requious.add as addRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:liquid_interaction>;
x.addJEICatalyst(<minecraft:lava_bucket>);
x.setJEIDurationSlot(1,0,"duration", scripts.jei.requious.getVisGauge(0,6));
scripts.jei.requious.addInsOuts(x, [[3,0]], [[1,1]]);
x.setJEIFluidSlot(0, 0, 'input');
x.setJEIFluidSlot(2, 0, 'input');

function interact(liquid0 as ILiquidStack, liquid1 as ILiquidStack, input0 as IIngredient, out as IItemStack) {
  val rec = AssemblyRecipe.create(function(c) {
    c.addItemOutput('output0', out);
  }).requireFluid('input', liquid0 * 1000);
  if(!isNull(liquid1)) rec.requireFluid('input', liquid1 * 1000);
  if(!isNull(input0)) rec.requireItem('input0', input0);
  <assembly:liquid_interaction>.addJEIRecipe(rec);
}

interact(<fluid:poison>, <fluid:water>, null, <biomesoplenty:mud>);
interact(<fluid:sand>, <fluid:water>, null, <biomesoplenty:mud>);
interact(<fluid:hot_spring_water>, <fluid:water>, null, <biomesoplenty:mud>);
interact(<fluid:honey>, <fluid:water>, null, <biomesoplenty:honey_block>);
interact(<fluid:blood>, <fluid:water>, null, <biomesoplenty:flesh>);
interact(<fluid:astralsorcery.liquidstarlight>, <fluid:water>, null, <minecraft:ice>);
interact(<fluid:astralsorcery.liquidstarlight>, <fluid:lava>, null, <minecraft:sand>);
interact(<fluid:astralsorcery.liquidstarlight>, <fluid:lava>, null, <astralsorcery:blockcustomsandore>);

interact(<fluid:mana>, null, <thermalfoundation:storage:2>, <thermalfoundation:storage:8>);
interact(<fluid:mana>, null, <thermalfoundation:storage:3>, <minecraft:gold_block>);
interact(<fluid:mana>, null, <thermalfoundation:ore:3>, <minecraft:gold_ore>);
interact(<fluid:mana>, null, <thermalfoundation:ore:2>, <thermalfoundation:ore:8>);
interact(<fluid:mana>, null, <minecraft:dirt>, <minecraft:grass>);
interact(<fluid:mana>, null, <minecraft:dirt:1>, <minecraft:dirt:2>);
interact(<fluid:mana>, null, <minecraft:farmland>, <minecraft:mycelium>);
interact(<fluid:mana>, null, <minecraft:glass>, <minecraft:sand>);
interact(<fluid:mana>, null, <minecraft:lapis_ore>, <minecraft:lapis_block>);

interact(<fluid:pyrotheum>, null, <minecraft:grass>, <minecraft:dirt>);
interact(<fluid:cryotheum>, null, <minecraft:grass>, <minecraft:dirt>);

interact(<fluid:pyrotheum>, null, <minecraft:cobblestone:*>, <minecraft:stone>);
interact(<fluid:pyrotheum>, null, <minecraft:sand:*>, <minecraft:glass>);
interact(<fluid:pyrotheum>, null, <minecraft:clay:*>, <minecraft:hardened_clay>);
interact(<fluid:pyrotheum>, null, <minecraft:stone_stairs:*>, <minecraft:stone_brick_stairs>);

interact(<fluid:cryotheum>, null, <fluid:water>, <minecraft:ice>);
interact(<fluid:cryotheum>, null, <fluid:water>, <minecraft:snow>);
interact(<fluid:cryotheum>, null, <fluid:lava>, <minecraft:obsidian>);
interact(<fluid:cryotheum>, null, <fluid:lava>, <minecraft:stone>);
interact(<fluid:cryotheum>, null, Soul('minecraft:creeper') | Soul('minecraft:zombie'), Soul('minecraft:snowman'));

interact(<fluid:petrotheum>, null, <minecraft:stone:*>, <minecraft:gravel>);
interact(<fluid:petrotheum>, null, <minecraft:cobblestone:*>, <minecraft:gravel>);
interact(<fluid:petrotheum>, null, <minecraft:stonebrick:*>, <minecraft:gravel>);
interact(<fluid:petrotheum>, null, <minecraft:mossy_cobblestone:*>, <minecraft:gravel>);


/*Inject_js(
_(loadJson("config/exnihilocreatio/WitchWaterWorldRegistry.json"))
.map((t,liquid)=>Object.entries(t).map(([block,weight])=>
  `interact(<fluid:witchwater>, `+
  `<fluid:${liquid}>, null, <${block.replace(':-1','')}>`+
  `${weight<=1?'':' * '+Math.min(64,parseInt(weight))});`
))
.flatten()
.value()
)*/
interact(<fluid:witchwater>, <fluid:lava>, null, <minecraft:cobblestone>);
interact(<fluid:witchwater>, <fluid:lava>, null, <minecraft:stone:5>);
interact(<fluid:witchwater>, <fluid:lava>, null, <minecraft:stone:1>);
interact(<fluid:witchwater>, <fluid:lava>, null, <minecraft:stone:3>);
interact(<fluid:witchwater>, <fluid:petrotheum>, null, <minecraft:dirt>);
interact(<fluid:witchwater>, <fluid:petrotheum>, null, <minecraft:dirt:2>);
interact(<fluid:witchwater>, <fluid:petrotheum>, null, <minecraft:dirt:1>);
interact(<fluid:witchwater>, <fluid:water>, null, <minecraft:dirt:1>);
interact(<fluid:witchwater>, <fluid:water>, null, <biomesoplenty:dirt:8>);
interact(<fluid:witchwater>, <fluid:water>, null, <biomesoplenty:dirt:9>);
interact(<fluid:witchwater>, <fluid:water>, null, <biomesoplenty:dirt:10>);
interact(<fluid:witchwater>, <fluid:fiery_essence>, null, <exnihilocreatio:block_netherrack_crushed> * 64);
interact(<fluid:witchwater>, <fluid:fiery_essence>, null, <minecraft:netherrack> * 20);
interact(<fluid:witchwater>, <fluid:fiery_essence>, null, <netherendingores:block_nether_netherfish>);
interact(<fluid:witchwater>, <fluid:ic2pahoehoe_lava>, null, <ic2:resource>);
/**/
