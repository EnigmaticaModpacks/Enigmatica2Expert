/*

Wrapper for Carpenter's recipes that will allow to hook
on those recipes to add their copies in another machines

*/

#modloaded forestry
#priority 10

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

function addAltRecipe(
  output as IItemStack,
  ingredients as IIngredient[][],
  packagingTime as int,
  fluidInput as ILiquidStack = null,
  box as IItemStack = null,
  altMaxMult as int = 64
) as void {
  scripts.processUtils.avdRockXmlRecipeFlatten("PrecisionAssembler", output, ingredients, fluidInput, box, altMaxMult);
}

function addRecipe(
  output as IItemStack,
  ingredients as IIngredient[][],
  packagingTime as int,
  fluidInput as ILiquidStack = null,
  box as IItemStack = null,
  altMaxMult as int = 64
) as void {
  mods.forestry.Carpenter.addRecipe(output, ingredients, packagingTime, fluidInput, box);
  if (!utils.DEBUG) return;
  addAltRecipe(output, ingredients, packagingTime, fluidInput, box, altMaxMult);
}

/*Inject_js{
if(cmd.block) return cmd.block
return loadJson('exports/recipes/forestry__carpenter.json').recipes
  .map(r => [
    'addAltRecipe(',
`<${r.output.items[0].stacks[0].name}>${r.output.items[0].amount <= 1 ? '' : ` * ${r.output.items[0].amount}`}`,
', ',
`[${
  Object.values(_.groupBy(r.input.items.filter(i => i.x % 18 === 0 && (i.y - 3) % 18 === 0), 'y'))
  .map(row => `[${
    row.map(i => i.stacks.length ? `<${i.stacks[0].name}>` : 'null').join(', ')}]`)
    .join(', ')
  }], 100${
(() => {
  const f = r.input.items.find(i => i.stacks[0]?.type === 'fluid')
  if (!f) return ''
  return `, <fluid:${f.stacks[0].name}> * ${f.amount}`
})()});`,
  ]).map(a => a.map(b => b.replace(/:0>/g, '>').replace(/:32767>/g, ':*>')))
}*/
// addAltRecipe(<actuallyadditions:block_misc:6> * 4 , [[<forestry:crafting_material:1>, <forestry:crafting_material:1>, null], [<forestry:crafting_material:1>, <forestry:crafting_material:1>, null], [null, null, null]], 100);
// addAltRecipe(<animania:entity_egg_random>         , [[null, <cyclicmagic:sprout_seed>, null], [<minecraft:egg>, <minecraft:egg>, <minecraft:egg>], [null, <cyclicmagic:sprout_seed>, null]], 100, <fluid:liquiddna> * 250);
// addAltRecipe(<animania:entity_egg_random>         , [[null, <cyclicmagic:sprout_seed>, null], [<minecraft:egg>, <minecraft:egg>, <minecraft:egg>], [null, <cyclicmagic:sprout_seed>, null]], 100, <fluid:meat> * 500);
// addAltRecipe(<draconicevolution:draconic_energy_core>, [[<draconicevolution:draconic_ingot>, <draconicevolution:wyvern_energy_core>, <draconicevolution:draconic_ingot>], [<draconicevolution:wyvern_energy_core>, <draconicevolution:wyvern_core>, <draconicevolution:wyvern_energy_core>], [<draconicevolution:draconic_ingot>, <draconicevolution:wyvern_energy_core>, <draconicevolution:draconic_ingot>]], 100, <fluid:ic2hot_coolant> * 2000);
// addAltRecipe(<draconicevolution:wyvern_core>      , [[<minecraft:shulker_shell>, <draconicevolution:draconic_core>, <minecraft:shulker_shell>], [<draconicevolution:draconic_core>, <minecraft:sponge>, <draconicevolution:draconic_core>], [<enderio:item_alloy_endergy_ingot:6>, <environmentaltech:pladium>, <enderio:item_alloy_endergy_ingot:6>]], 100, <fluid:ic2hot_coolant> * 2000);
// addAltRecipe(<extendedcrafting:crafting_core>     , [[<extendedcrafting:material:18>, <extendedcrafting:material:18>, <extendedcrafting:material:18>], [<plustic:osmiridiumingot>, <extendedcrafting:pedestal>, <plustic:osmiridiumingot>], [<extendedcrafting:pedestal>, <extendedcrafting:pedestal>, <extendedcrafting:pedestal>]], 100, <fluid:coal> * 5000);
// addAltRecipe(<forestry:chipsets:3:d69ef61c>       , [[<ore:gemAmber>, <forestry:chipsets:0:d69eead9>, <ore:gemAmber>], [<ore:gemAmber>, <forestry:chipsets:1:d69eee9a>, <ore:gemAmber>], [<ore:gemAmber>, <forestry:chipsets:2:d69ef25b>, <ore:gemAmber>]], 100, <fluid:water> * 1000);
// addAltRecipe(<forestry:hardened_machine>          , [[<ore:gemDiamondRat>, null, <ore:gemDiamondRat>], [null, <forestry:sturdy_machine>, null], [<ore:gemDiamondRat>, null, <ore:gemDiamondRat>]], 100, <fluid:water> * 5000);
// addAltRecipe(<forestry:oak_stick> * 2             , [[<ore:logWood>, null, null], [<ore:logWood>, null, null], [null, null, null]], 100, <fluid:oliveoil> * 100);
// addAltRecipe(<forestry:soldering_iron>            , [[null, <minecraft:iron_ingot>, null], [<minecraft:iron_ingot>, null, <minecraft:iron_ingot>], [null, null, <ore:ingotBronze>]], 100, <fluid:water> * 1000);
// addAltRecipe(<ic2:upgrade> * 2                    , [[<ore:plateTin>, <ore:plateTin>, <ore:plateTin>], [<ic2:cable:0:f62>, <ore:circuitBasic>, <ic2:cable:0:f62>], [<ore:plateTin>, <ore:plateTin>, <ore:plateTin>]], 100, <fluid:ic2coolant> * 3000);
// addAltRecipe(<mysticalagradditions:insanium:1>    , [[<actuallyadditions:item_misc:24>, <mysticalagradditions:insanium>, <actuallyadditions:item_misc:24>], [<mysticalagradditions:insanium>, <mysticalagriculture:crafting:21>, <mysticalagradditions:insanium>], [<actuallyadditions:item_misc:24>, <mysticalagradditions:insanium>, <actuallyadditions:item_misc:24>]], 100, <fluid:sewage> * 1000);
addAltRecipe(<extendedcrafting:pedestal>             , [[null, <extendedcrafting:material:2>, null], [null, <extendedcrafting:material>, null], [<extendedcrafting:material>, <extendedcrafting:storage>, <extendedcrafting:material>]], 100, <fluid:coal> * 1000);
addAltRecipe(<forestry:bog_earth> * 8                , [[<ore:dirt>, <ore:sand>, <ore:dirt>], [<ore:sand>, <forestry:mulch>, <ore:sand>], [<ore:dirt>, <ore:sand>, <ore:dirt>]], 100, <fluid:water> * 1000);
addAltRecipe(<forestry:candle> * 6                   , [[<forestry:beeswax>, <forestry:crafting_material:2>, <forestry:beeswax>], [null, null, null], [null, null, null]], 100, <fluid:water> * 200);
addAltRecipe(<forestry:candle> * 24                  , [[null, <minecraft:string>, null], [<forestry:beeswax>, <forestry:beeswax>, <forestry:beeswax>], [<forestry:beeswax>, <forestry:beeswax>, <forestry:beeswax>]], 100, <fluid:water> * 600);
addAltRecipe(<forestry:carton> * 2                   , [[null, <thermalfoundation:material:800>, null], [<thermalfoundation:material:800>, null, <thermalfoundation:material:800>], [null, <thermalfoundation:material:800>, null]], 100, <fluid:water> * 1000);
addAltRecipe(<forestry:chipsets:0>.withTag({T:0 as short}, false)   , [[<minecraft:redstone>, null, <minecraft:redstone>], [<minecraft:redstone>, <ore:ingotTin>, <minecraft:redstone>], [<minecraft:redstone>, null, <minecraft:redstone>]], 100, <fluid:water> * 1000);
addAltRecipe(<forestry:chipsets:1>.withTag({T:1 as short}, false), [[<minecraft:redstone>, <ore:ingotBronze>, <minecraft:redstone>], [<minecraft:redstone>, <ore:ingotBronze>, <minecraft:redstone>], [<minecraft:redstone>, <ore:ingotBronze>, <minecraft:redstone>]], 100, <fluid:water> * 1000);
addAltRecipe(<forestry:chipsets:2>.withTag({T:2 as short}, false), [[<minecraft:redstone>, <minecraft:iron_ingot>, <minecraft:redstone>], [<minecraft:redstone>, <minecraft:iron_ingot>, <minecraft:redstone>], [<minecraft:redstone>, <minecraft:iron_ingot>, <minecraft:redstone>]], 100, <fluid:water> * 1000);
addAltRecipe(<forestry:crafting_material:3>          , [[<forestry:crafting_material:2>, <forestry:crafting_material:2>, <forestry:crafting_material:2>], [<forestry:crafting_material:2>, <forestry:crafting_material:2>, <forestry:crafting_material:2>], [<forestry:crafting_material:2>, <forestry:crafting_material:2>, <forestry:crafting_material:2>]], 100, <fluid:water> * 500);
addAltRecipe(<forestry:crafting_material:4>          , [[<forestry:honeydew>, <forestry:royal_jelly>, <forestry:honeydew>], [<forestry:royal_jelly>, <forestry:can>, <forestry:royal_jelly>], [<minecraft:gunpowder>, <forestry:royal_jelly>, <minecraft:gunpowder>]], 100, <fluid:water> * 1000);
addAltRecipe(<forestry:crafting_material:6>          , [[null, <forestry:honeydew>, null], [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], [<forestry:beeswax>, null, <forestry:beeswax>]], 100, <fluid:for.honey> * 500);
addAltRecipe(<forestry:crafting_material:6>          , [[null, <forestry:honeydew>, null], [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], [<forestry:beeswax>, null, <forestry:beeswax>]], 100, <fluid:honey> * 500);
addAltRecipe(<forestry:escritoire>                   , [[<ore:plankWood>, null, null], [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], [<ore:plankWood>, null, <ore:plankWood>]], 100, <fluid:oliveoil> * 500);
addAltRecipe(<forestry:escritoire>                   , [[<ore:plankWood>, null, null], [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], [<ore:plankWood>, null, <ore:plankWood>]], 100, <fluid:seed.oil> * 500);
addAltRecipe(<forestry:habitat_screen>               , [[<ore:ingotBronze>, <minecraft:glass_pane>, <ore:ingotBronze>], [<ore:ingotBronze>, <minecraft:glass_pane>, <ore:ingotBronze>], [<thermalfoundation:material:291>, <minecraft:diamond>, <thermalfoundation:material:291>]], 100, <fluid:water> * 2000);
addAltRecipe(<forestry:humus> * 9                    , [[<ore:dirt>, <ore:dirt>, <ore:dirt>], [<ore:dirt>, <forestry:mulch>, <ore:dirt>], [<ore:dirt>, <ore:dirt>, <ore:dirt>]], 100, <fluid:water> * 1000);
addAltRecipe(<forestry:impregnated_casing>           , [[<ore:logWood>, <ore:logWood>, <ore:logWood>], [<ore:logWood>, null, <ore:logWood>], [<ore:logWood>, <ore:logWood>, <ore:logWood>]], 100, <fluid:oliveoil> * 250);
addAltRecipe(<forestry:impregnated_casing>           , [[<ore:logWood>, <ore:logWood>, <ore:logWood>], [<ore:logWood>, null, <ore:logWood>], [<ore:logWood>, <ore:logWood>, <ore:logWood>]], 100, <fluid:seed.oil> * 250);
addAltRecipe(<forestry:iodine_capsule>               , [[<forestry:honey_drop>, <forestry:pollen>, <forestry:honey_drop>], [<forestry:pollen>, <forestry:can>, <forestry:pollen>], [<minecraft:gunpowder>, <forestry:pollen>, <minecraft:gunpowder>]], 100, <fluid:water> * 1000);
addAltRecipe(<forestry:kit_pickaxe>                  , [[<ore:ingotBronze>, <ore:ingotBronze>, <ore:ingotBronze>], [null, <ore:stick>, null], [null, <ore:stick>, null]], 100);
addAltRecipe(<forestry:kit_shovel>                   , [[null, <ore:ingotBronze>, null], [null, <ore:stick>, null], [null, <ore:stick>, null]], 100);
addAltRecipe(<forestry:letters>                      , [[<thermalfoundation:material:800>, <thermalfoundation:material:800>, <thermalfoundation:material:800>], [<thermalfoundation:material:800>, <thermalfoundation:material:800>, <thermalfoundation:material:800>], [null, null, null]], 100, <fluid:water> * 250);
addAltRecipe(<forestry:oak_stick> * 2                , [[<ore:logWood>, null, null], [<ore:logWood>, null, null], [null, null, null]], 100, <fluid:seed.oil> * 100);
addAltRecipe(<forestry:stamps:1> * 9                 , [[<ore:ingotCopper>, <ore:ingotCopper>, <ore:ingotCopper>], [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>], [null, null, null]], 100, <fluid:oliveoil> * 300);
addAltRecipe(<forestry:stamps:1> * 9                 , [[<ore:ingotCopper>, <ore:ingotCopper>, <ore:ingotCopper>], [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>], [null, null, null]], 100, <fluid:seed.oil> * 300);
addAltRecipe(<forestry:stamps:2> * 9                 , [[<ore:ingotTin>, <ore:ingotTin>, <ore:ingotTin>], [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>], [null, null, null]], 100, <fluid:oliveoil> * 300);
addAltRecipe(<forestry:stamps:2> * 9                 , [[<ore:ingotTin>, <ore:ingotTin>, <ore:ingotTin>], [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>], [null, null, null]], 100, <fluid:seed.oil> * 300);
addAltRecipe(<forestry:stamps:3> * 9                 , [[<minecraft:gold_ingot>, <minecraft:gold_ingot>, <minecraft:gold_ingot>], [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>], [null, null, null]], 100, <fluid:oliveoil> * 300);
addAltRecipe(<forestry:stamps:3> * 9                 , [[<minecraft:gold_ingot>, <minecraft:gold_ingot>, <minecraft:gold_ingot>], [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>], [null, null, null]], 100, <fluid:seed.oil> * 300);
addAltRecipe(<forestry:stamps> * 9                   , [[<forestry:apatite>, <forestry:apatite>, <forestry:apatite>], [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>], [null, null, null]], 100, <fluid:oliveoil> * 300);
addAltRecipe(<forestry:stamps> * 9                   , [[<forestry:apatite>, <forestry:apatite>, <forestry:apatite>], [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>], [null, null, null]], 100, <fluid:seed.oil> * 300);
addAltRecipe(<minecraft:paper>                       , [[<thermalfoundation:material:800>, null, null], [<thermalfoundation:material:800>, null, null], [null, null, null]], 100, <fluid:water> * 250);
addAltRecipe(<thermalfoundation:material:163>        , [[null, null, null], [null, <forestry:broken_bronze_shovel>, null], [null, null, null]], 100);
addAltRecipe(<thermalfoundation:material:163> * 2    , [[null, null, null], [null, <forestry:broken_bronze_pickaxe>, null], [null, null, null]], 100);
addAltRecipe(<thermalfoundation:material:800>        , [[<ore:logWood>, null, null], [null, null, null], [null, null, null]], 100, <fluid:water> * 250);
/**/