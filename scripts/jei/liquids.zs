#priority 950
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import scripts.jei.requious.add as addRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:liquid_interaction>;
x.addJEICatalyst(<minecraft:lava_bucket>);
x.setJEIDurationSlot(1,0,"duration", scripts.jei.requious.getVisGauge(0,6));
scripts.jei.requious.addInsOuts(x, [[0,0],[2,0]], [[1,1]]);

function interact(input1 as IIngredient, input2 as IIngredient, out as IItemStack) {
  addRecipe(<assembly:liquid_interaction>, {[input1, input2] : [out]});
}

interact(Bucket("blood"), Bucket("water"), <biomesoplenty:flesh>);
interact(Bucket("astralsorcery.liquidstarlight"), Bucket("water"), <minecraft:ice>);
interact(Bucket("astralsorcery.liquidstarlight"), Bucket("lava"), <minecraft:sand>);
interact(Bucket("astralsorcery.liquidstarlight"), Bucket("lava"), <astralsorcery:blockcustomsandore>);

interact(Bucket("mana"), <thermalfoundation:storage:2>, <thermalfoundation:storage:8>);
interact(Bucket("mana"), <thermalfoundation:storage:3>, <minecraft:gold_block>);
interact(Bucket("mana"), <thermalfoundation:ore:3>, <minecraft:gold_ore>);
interact(Bucket("mana"), <thermalfoundation:ore:2>, <thermalfoundation:ore:8>);
interact(Bucket("mana"), <minecraft:dirt>, <minecraft:grass>);
interact(Bucket("mana"), <minecraft:dirt:1>, <minecraft:dirt:2>);
interact(Bucket("mana"), <minecraft:farmland>, <minecraft:mycelium>);
interact(Bucket("mana"), <minecraft:glass>, <minecraft:sand>);
interact(Bucket("mana"), <minecraft:lapis_ore>, <minecraft:lapis_block>);

interact(Bucket("pyrotheum") | Bucket("cryotheum"), <minecraft:grass>, <minecraft:dirt>);

interact(Bucket("pyrotheum"), <minecraft:cobblestone:*>, <minecraft:stone>);
interact(Bucket("pyrotheum"), <minecraft:sand:*>, <minecraft:glass>);
interact(Bucket("pyrotheum"), <minecraft:clay:*>, <minecraft:hardened_clay>);
interact(Bucket("pyrotheum"), <minecraft:stone_stairs:*>, <minecraft:stone_brick_stairs>);

interact(Bucket("cryotheum"), <minecraft:water_bucket>, <minecraft:ice>);
interact(Bucket("cryotheum"), <minecraft:water_bucket>, <minecraft:snow>);
interact(Bucket("cryotheum"), <minecraft:lava_bucket>, <minecraft:obsidian>);
interact(Bucket("cryotheum"), <minecraft:lava_bucket>, <minecraft:stone>);
interact(Bucket("cryotheum"), Soul('minecraft:creeper') | Soul('minecraft:zombie'), Soul('minecraft:snowman'));

interact(Bucket("petrotheum"), <minecraft:stone:*>, <minecraft:gravel>);
interact(Bucket("petrotheum"), <minecraft:cobblestone:*>, <minecraft:gravel>);
interact(Bucket("petrotheum"), <minecraft:stonebrick:*>, <minecraft:gravel>);
interact(Bucket("petrotheum"), <minecraft:mossy_cobblestone:*>, <minecraft:gravel>);


/*Inject_js(
_(loadJson("config/exnihilocreatio/WitchWaterWorldRegistry.json"))
.map((t,liquid)=>Object.entries(t).map(([block,weight])=>
  `interact(Bucket("witchwater"), `+
  `Bucket("${liquid}"), <${block.replace(':-1','')}>`+
  `${weight<=1?'':' * '+Math.min(64,parseInt(weight))});`
))
.flatten()
.value()
)*/
interact(Bucket("witchwater"), Bucket("lava"), <minecraft:cobblestone>);
interact(Bucket("witchwater"), Bucket("lava"), <minecraft:stone:5>);
interact(Bucket("witchwater"), Bucket("lava"), <minecraft:stone:1>);
interact(Bucket("witchwater"), Bucket("lava"), <minecraft:stone:3>);
interact(Bucket("witchwater"), Bucket("petrotheum"), <minecraft:dirt>);
interact(Bucket("witchwater"), Bucket("petrotheum"), <minecraft:dirt:2>);
interact(Bucket("witchwater"), Bucket("petrotheum"), <minecraft:dirt:1>);
interact(Bucket("witchwater"), Bucket("water"), <minecraft:dirt:1>);
interact(Bucket("witchwater"), Bucket("water"), <biomesoplenty:dirt:8>);
interact(Bucket("witchwater"), Bucket("water"), <biomesoplenty:dirt:9>);
interact(Bucket("witchwater"), Bucket("water"), <biomesoplenty:dirt:10>);
interact(Bucket("witchwater"), Bucket("fiery_essence"), <exnihilocreatio:block_netherrack_crushed> * 64);
interact(Bucket("witchwater"), Bucket("fiery_essence"), <minecraft:netherrack> * 20);
interact(Bucket("witchwater"), Bucket("fiery_essence"), <netherendingores:block_nether_netherfish>);
interact(Bucket("witchwater"), Bucket("ic2pahoehoe_lava"), <ic2:resource>);
/**/
