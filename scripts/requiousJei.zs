#priority 1000
#modloaded requious
#ignoreBracketErrors

import mods.requious.Assembly;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;


function add(ass as Assembly, chunk as IItemStack[][IIngredient[]]) {
  for inputs, outputs in chunk {
    val assRec = AssemblyRecipe.create(function(container) {
      for i, output in outputs {
        if(isNull(output)) continue;
        container.addItemOutput("output" ~ i, output);
      }
    });
    for i, input in inputs {
      if(isNull(input)) continue;
      assRec.requireItem("input"~i, input);
    }
    ass.addJEIRecipe(assRec);
  }
}

function addInsOuts(ass as Assembly, inputs as int[][], outputs as int[][]) {
  for j,way in ['input', 'output'] as string[] {
    for i,pair in (j==0 ? inputs : outputs) {
      ass.setJEIItemSlot(pair[0], pair[1], way ~ i);
    }
  }
}

function getVisGauge(u as int, w as int) as SlotVisual {
  return SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_gauges.png",u,w);
}
function getVisSlots(u as int, w as int) as SlotVisual {
  return SlotVisual.create(1,1).addPart("requious:textures/gui/assembly_slots.png",u,w);
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var 
x = <assembly:infernal_furnace>;
x.addJEICatalyst(<thaumcraft:infernal_furnace>);
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
x.setJEIDurationSlot(2,0,"duration", getVisGauge(1,13));
addInsOuts(x, [[0,0]], [[3,0]]);

function add_infernal_furnace(input as IIngredient, out as WeightedItemStack) {
  add(<assembly:infernal_furnace>, {[input] as IIngredient[]: [out.stack.withLore(["§d§l" ~ out.percent as int ~ "%"])]});
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:liquid_interaction>;
x.addJEICatalyst(<minecraft:lava_bucket>);
x.setJEIDurationSlot(1,0,"duration", getVisGauge(0,6));
addInsOuts(x, [[0,0],[2,0]], [[1,1]]);

function add_liquid_interaction(input1 as IIngredient, input2 as IIngredient, out as IItemStack) {
  add(<assembly:liquid_interaction>, {[input1, input2] : [out]});
}

add_liquid_interaction(Bucket("pyrotheum") | Bucket("cryotheum"), <minecraft:grass>, <minecraft:dirt>);

add_liquid_interaction(Bucket("mana"), <thermalfoundation:storage:2>, <thermalfoundation:storage:8>);
add_liquid_interaction(Bucket("mana"), <thermalfoundation:storage:3>, <minecraft:gold_block>);
add_liquid_interaction(Bucket("mana"), <thermalfoundation:ore:3>, <minecraft:gold_ore>);
add_liquid_interaction(Bucket("mana"), <thermalfoundation:ore:2>, <thermalfoundation:ore:8>);
add_liquid_interaction(Bucket("mana"), <minecraft:dirt>, <minecraft:grass>);
add_liquid_interaction(Bucket("mana"), <minecraft:dirt:1>, <minecraft:dirt:2>);
add_liquid_interaction(Bucket("mana"), <minecraft:farmland>, <minecraft:mycelium>);
add_liquid_interaction(Bucket("mana"), <minecraft:glass>, <minecraft:sand>);
add_liquid_interaction(Bucket("mana"), <minecraft:lapis_ore>, <minecraft:lapis_block>);

add_liquid_interaction(Bucket("pyrotheum"), <minecraft:cobblestone:*>, <minecraft:stone>);
add_liquid_interaction(Bucket("pyrotheum"), <minecraft:sand:*>, <minecraft:glass>);
add_liquid_interaction(Bucket("pyrotheum"), <minecraft:clay:*>, <minecraft:hardened_clay>);
add_liquid_interaction(Bucket("pyrotheum"), <minecraft:stone_stairs:*>, <minecraft:stone_brick_stairs>);

add_liquid_interaction(Bucket("cryotheum"), <minecraft:water_bucket>, <minecraft:ice>);
add_liquid_interaction(Bucket("cryotheum"), <minecraft:water_bucket>, <minecraft:snow>);
add_liquid_interaction(Bucket("cryotheum"), <minecraft:lava_bucket>, <minecraft:obsidian>);
add_liquid_interaction(Bucket("cryotheum"), <minecraft:lava_bucket>, <minecraft:stone>);
add_liquid_interaction(Bucket("cryotheum"), Soul('minecraft:creeper') | Soul('minecraft:zombie'), Soul('minecraft:snowman'));

add_liquid_interaction(Bucket("petrotheum"), <minecraft:stone:*>, <minecraft:gravel>);
add_liquid_interaction(Bucket("petrotheum"), <minecraft:cobblestone:*>, <minecraft:gravel>);
add_liquid_interaction(Bucket("petrotheum"), <minecraft:stonebrick:*>, <minecraft:gravel>);
add_liquid_interaction(Bucket("petrotheum"), <minecraft:mossy_cobblestone:*>, <minecraft:gravel>);

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:everflow_chalice>;
x.addJEICatalyst(<astralsorcery:blockchalice>);
x.setJEIDurationSlot(1,0,"duration", getVisGauge(0,6));
addInsOuts(x, [[0,0],[2,0]], [[1,1], [0,2], [2,2]]);

function add_everflow_chalice(input1 as IIngredient, input2 as IIngredient, out as IItemStack[]) {
  add(<assembly:everflow_chalice>, {[input1, input2] : out});
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:liquid_heat_exchanger>;
x.addJEICatalyst(<ic2:te:31>);
x.setJEIFluidSlot(0, 0, 'liquid_input');
x.setJEIItemSlot(1, 0, 'item_in');
x.setJEIDurationSlot(2,0,"duration", getVisGauge(5,1));
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
x = <assembly:neromantic_prime>;
x.addJEICatalyst(<astralsorcery:blockbore>);
x.addJEICatalyst(<astralsorcery:blockborehead>);
x.addJEICatalyst(<astralsorcery:blockchalice>);

static fluidOutputs as ILiquidStack[] = [
/*Inject_js(
config('astralsorcery/fluid_rarities.cfg').data.data
.slice(0, 9*5)
.map(l=>l.split(';'))
.map(l=>[
  parseInt(l[3]),
  `  <fluid:${(l[0]+'>').padEnd(24)} * ${l[3]},`
])
.sort(([a], [b]) => b - a)
.map(([_,l])=>l)
.join('\n')
)*/
  <fluid:mana>                    * 1500,
  <fluid:amber>                   * 800,
  <fluid:xpjuice>                 * 500,
  <fluid:pyrotheum>               * 200,
  <fluid:cryotheum>               * 200,
  <fluid:hydrofluoric_acid>       * 120,
  <fluid:mutagen>                 * 100,
  <fluid:vibrant_alloy>           * 40,
  <fluid:ic2uu_matter>            * 1,
/**/
];

for i, fluid in fluidOutputs {
  x.setJEIFluidSlot(i % 9, (i / 9) as int, 'f'~i);
}
x.addJEIRecipe(AssemblyRecipe.create(function(container) {
  for i, output in fluidOutputs {
    container.addFluidOutput("f"~i, output);
  }
}));

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:scented_hive>;
x.addJEICatalyst(<exnihilocreatio:hive:1>);
x.setJEIDurationSlot(3,0,"duration", getVisSlots(5,1));
addInsOuts(x, [[1,1],[1,0],[2,0],[0,0]], [[4,0]]);

val worldItem as IItemStack[int] = {
  0: <biomesoplenty:earth>.withTag({display:{Name:"§6OVERWORLD"}}),
  1: <biomesoplenty:earth>.withTag({display:{Name:"§6THE END"}}),
};

/*Inject_js(
JSON.parse(loadText('config/exnihilocreatio/ScentedHiveRegistry.json'))
.map(l=>`add(x, {[worldItem[${l.dim}], ${'<exnihilocreatio:hive:1>'}, ${
  Object.keys(l.adjacentBlocks).map(i=>`<${i}>`).join(', ')
}] : [<${l.hive}>]});`)
.join('\n')
)*/
add(x, {[worldItem[0], <exnihilocreatio:hive:1>, <ore:treeLeaves>, <ore:logWood>] : [<forestry:beehives:0>]});
add(x, {[worldItem[0], <exnihilocreatio:hive:1>, <ore:flower>] : [<forestry:beehives:1>]});
add(x, {[worldItem[0], <exnihilocreatio:hive:1>, <ore:sand>] : [<forestry:beehives:2>]});
add(x, {[worldItem[0], <exnihilocreatio:hive:1>, <minecraft:log:3>, <ore:treeLeaves>] : [<forestry:beehives:3>]});
add(x, {[worldItem[1], <exnihilocreatio:hive:1>, <minecraft:end_stone:0>] : [<forestry:beehives:4>]});
add(x, {[worldItem[0], <exnihilocreatio:hive:1>, <minecraft:ice:0>, <minecraft:snow:0>] : [<forestry:beehives:5>]});
add(x, {[worldItem[0], <exnihilocreatio:hive:1>, <ore:dirt>] : [<forestry:beehives:6>]});
/**/

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:oc_printer3d>;
x.addJEICatalyst(<opencomputers:printer>);
x.setJEIDurationSlot(2,0,"duration", getVisGauge(1,8));
addInsOuts(x, [[0,0],[1,0]], [[3,0]]);
add(x, {[<opencomputers:material:28>, <ore:dye>] : [<opencomputers:print>]});

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:electronics_assembler>;
x.addJEICatalyst(<opencomputers:assembler>);
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
addInsOuts(x, [[0,0]], [[2,0]]);
add(x, {[<opencomputers:case1> | <opencomputers:case2> | <opencomputers:case3>] : [<opencomputers:robot>]});
add(x, {[<opencomputers:material:17> | <opencomputers:material:18>] : [<opencomputers:misc>]});
add(x, {[<opencomputers:material:23> | <opencomputers:material:24>] : [<opencomputers:misc:1>]});

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:cc_printer>;
x.addJEICatalyst(<computercraft:peripheral:3>);
x.setJEIDurationSlot(2,0,"duration", getVisGauge(1,8));
addInsOuts(x, [[0,0],[1,0]], [[3,0]]);
add(x, {[<minecraft:paper>, <ore:dye>] : [<computercraft:printout>]});

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:witch_water>;
x.addJEICatalyst(Bucket('witchwater'));
x.setJEIDurationSlot(1,0,"duration", getVisGauge(1,8));
addInsOuts(x, [[0,0]], [[2,0]]);
add(x, {[Soul('minecraft:skeleton')] : [Soul('minecraft:wither_skeleton')]});
add(x, {[Soul('minecraft:creeper')]  : [Soul('minecraft:creeper')]});
add(x, {[Soul('minecraft:slime')]    : [Soul('minecraft:magma_cube')]});
add(x, {[Soul('minecraft:spider')]   : [Soul('minecraft:cave_spider')]});
add(x, {[Soul('minecraft:squid')]    : [Soul('minecraft:ghast')]});
add(x, {[Soul('minecraft:villager')] : [Soul('minecraft:zombie_villager')]});
add(x, {[Soul('minecraft:pig')]      : [Soul('minecraft:zombie_pigman')]});

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:meteor>;
x.addJEICatalyst(<bloodmagic:ritual_diviner:1>.withTag({current_ritual: "meteor"}));
x.setJEIDurationSlot(1,1,"duration", getVisGauge(1,8));
x.setJEIItemSlot (0, 1, 'f0');
x.setJEIFluidSlot(0, 0, 'f1');

static meteors as string[][] = [
/*Inject_js(
fs.readdirSync('config/bloodmagic/meteors')
.map(filename => JSON.parse(loadText('config/bloodmagic/meteors/' + filename)))
.map(f=>
  [
  `${f.catalystStack.registryName.domain}:${f.catalystStack.registryName.path}`,
  f.catalystStack.meta,
  f.cost,
  ...f.components.map(c=>c.oreName.substring(3))
  ]
 .map(s=>`"${s}"`).join(', ')
).map(s=>`[${s}]`).join(',\n')
)*/
["minecraft:iron_block", "0", "600000", "Iron", "Copper", "Tin", "Silver", "Lead", "Gold", "Lapis", "Redstone", "Aluminum"],
["thermalfoundation:storage", "6", "600000", "Iron", "Copper", "Tin", "Gold", "AstralStarmetal", "Draconium", "Nickel", "Osmium", "Platinum", "Rutile", "Uranium"],
["thermalfoundation:storage", "7", "1000000", "Iron", "Gold", "Lapis", "Emerald", "Redstone", "Diamond", "Iridium", "Mithril"],
["nuclearcraft:ingot_block", "3", "1100000", "Thorium", "Boron", "Lithium", "Magnesium"],
["minecraft:emerald_block", "0", "1400000", "Lapis", "Diamond", "Emerald", "Coal", "Ruby", "Peridot", "Topaz", "Tanzanite", "Malachite", "Sapphire", "Amber", "Apatite", "CertusQuartz", "Cinnabar", "Prosperity", "QuartzBlack"],
["tconstruct:metal", "1", "1700000", "Quartz", "NetherAluminum", "NetherCopper", "NetherLead", "NetherNickel", "NetherRedstone", "NetherLapis", "NetherIron", "NetherGold", "NetherEmerald", "NetherDiamond", "NetherCoal", "NetherPlatinum", "NetherSilver", "NetherTin", "NetherCertusQuartz", "NetherChargedCertusQuartz", "NetherOsmium", "NetherUranium", "Cobalt", "Ardite"]
/**/
];

var k = 0;
var maxRows = 0;
for t in meteors { if(t.length > maxRows) maxRows = t.length; }
for _y in 0 .. ((maxRows - 4) / 7 + 1) as int {
  for _x in 2 .. 9 {
    x.setJEIItemSlot(_x, _y, 'i'~k);
    k += 1;
  }
}

for i, meteor in meteors {
  val meteorAss = AssemblyRecipe.create(function(container) {
    for i, ore in meteor {
      if(i<3) continue;
      container.addItemOutput("i"~(i - 3), oreDict.get('ore' ~ ore).firstItem);
    }
  });
  meteorAss.requireItem('f0', itemUtils.getItem(meteor[0], meteor[1]));
  meteorAss.requireFluid('f1', <fluid:lifeessence> * (meteor[2] as int));
  x.addJEIRecipe(meteorAss);
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
static turbineFuel as int[string][] = [
/*Inject_js(
[...
  loadText('config/AdvGenerators/overrides/turbine.cfg')
  .matchAll(/^\s+turbine-fuel\s*:\s*([^\s]+)\s+([^\s]+)\s+.*$/gm)
].sort((a,b)=>a[2] - b[2])
.map(([_, name, mj_mb])=>`  {${name.padEnd(16)}: ${mj_mb}},`)
.join('\n')
)*/
  {liquidhydrogen  : 4},
  {gasoline        : 5},
  {canolaoil       : 10},
  {refinedcanolaoil: 20},
  {oil             : 25},
  {biomass         : 30},
  {biodiesel       : 40},
  {crystaloil      : 40},
  {ic2biogas       : 50},
  {diesel          : 70},
  {ethene          : 80},
  {biofuel         : 90},
  {refined_oil     : 95},
  {rocket_fuel     : 95},
  {syngas          : 100},
  {refined_fuel    : 105},
  {fire_water      : 120},
  {empoweredoil    : 120},
  {rocketfuel      : 410},
  {perfect_fuel    : 32800},
/**/
];

x = <assembly:turbine>;
x.addJEICatalyst(<advgenerators:turbine_controller>);
x.setJEIDurationSlot(1,0,"duration", getVisGauge(0,5));
x.setJEIFluidSlot(0, 0, 'liquid_input');
x.setJEIEnergySlot(2, 0, 'energy_out', "rf");

for map in turbineFuel {
  for name, mj_mb in map {
    val liq = game.getLiquid(name);
    if(isNull(liq)) {
      logger.logWarning('Liquid ['~name~'] not exist. Remove it from config/AdvGenerators/overrides/turbine.cfg');
      continue;
    }
    x.addJEIRecipe(AssemblyRecipe.create(function(container) {
      container.addEnergyOutput('energy_out', mj_mb, 0);
    }).requireFluid('liquid_input', liq));
  }
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:heat_exchanger>;
x.addJEICatalyst(<advgenerators:exchanger_controller>);
x.setJEIFluidSlot(0, 0, 'fluid_in');
x.setJEIItemSlot(1, 0, 'item_in');
x.setJEIDurationSlot(2,0,"duration", getVisGauge(9,1));
x.setJEIFluidSlot(3, 0, 'fluid_out');
x.setJEIItemSlot(4, 0, 'item_out1');
x.setJEIItemSlot(5, 0, 'item_out2');

function showHeat(heat as int) as IItemStack {
  return <ic2:heat_exchanger>.withTag({advDmg: (2500 - heat), display:{Name:"§e"~heat~" Heat"}});
}

function addHeatExch(fluid_in as ILiquidStack, heat_in as int, fluid_out as ILiquidStack, item_out1 as IItemStack, heat_out as int) {
  val r = AssemblyRecipe.create(function(container) {
    if(!isNull(fluid_out)) container.addFluidOutput('fluid_out', fluid_out);
    if(!isNull(item_out1)) container.addItemOutput('item_out1', item_out1);
    if(heat_out>0) container.addItemOutput('item_out2', showHeat(heat_out));
  })
  .requireFluid('fluid_in', fluid_in);
  if(heat_in>0) r.requireItem('item_in', showHeat(heat_in));
  <assembly:heat_exchanger>.addJEIRecipe(r);
}

/*Inject_js(
(()=>{
const cfg = [...
  loadText('config/AdvGenerators/overrides/exchanger.cfg')
  .matchAll(/^\s*exchanger\s*:\s*(.*)$/gm)
].map(([,m])=>m.trim())
const bl = (id)=>{const s=id.split(':'); return s.length>=2?id.replace(/@(\d+)/,':$1'):'minecraft:'+s[0]}
const B = (block,amount)=>`<${bl(block)}>${parseFloat(amount)>1?' * ' + amount : ''}`
const H = (h)=>Math.round(h)
return cfg
.map(g=>g.match(
  /fluid:(\w+) (\d+) mB(?: \+ (\d+) HU)? =>(?: fluid:(\w+) (\d+) ?mB)?(?: [BI]:(\w+(?::\w+)?(?:@\d+)?) (\d+\.\d+))?(?: \+ (\d+) HU)?/
)?.slice(1))
.filter(m=>m)
.map(([
  fluid_in, fluid_in_amount, heat_in, 
  fluid_out, fluid_out_amount, item_out, item_out_amount, heat_out
])=>
  `addHeatExch(${B('fluid:'+fluid_in, fluid_in_amount)}, ` +
  `${H(heat_in ?? 0)}, ` +
  `${fluid_out ? B('fluid:'+fluid_out, fluid_out_amount) : 'null'}, ` +
  `${item_out ? B(item_out, item_out_amount) : 'null'}, ` +
  `${H(heat_out ?? 0)});`
)
})()
)*/
addHeatExch(<fluid:lava>, 0, null, <minecraft:obsidian>, 30);
addHeatExch(<fluid:ic2pahoehoe_lava>, 0, null, <advancedrocketry:basalt>, 40);
addHeatExch(<fluid:pyrotheum>, 0, null, <chisel:basalt2:7>, 60);
addHeatExch(<fluid:fire_water>, 0, null, <botania:blazeblock>, 200);
addHeatExch(<fluid:enrichedlava>, 0, null, <draconicevolution:infused_obsidian>, 500);
addHeatExch(<fluid:water> * 5, 3, <fluid:steam> * 15, null, 0);
addHeatExch(<fluid:distwater>, 200, <fluid:steam> * 300, null, 0);
addHeatExch(<fluid:ic2hot_water>, 120, <fluid:steam> * 300, null, 0);
addHeatExch(<fluid:ic2distilled_water>, 160, <fluid:steam> * 400, null, 0);
addHeatExch(<fluid:ic2hot_coolant>, 0, <fluid:ic2coolant>, null, 40);
/**/


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:forestry_farm>;
x.setJEIItemSlot(0, 0, 'item_in');
x.setJEIDurationSlot(1,0,"duration", getVisSlots(11,1));
for i in 0 .. 11 {
  x.addJEICatalyst(<forestry:ffarm:3>.withTag({FarmBlock: i}));
}

static fertilizers as IItemStack[] = [
/*Inject_js(
(()=>{
let t = config('forestry/farm.cfg').fertilizers.items
  .map(l=>l.split(';'))
let max =       Math.max(...t.map(l=>l[1]))
let qnt = max / Math.min(...t.map(l=>l[1])) + 1
return t
  .sort((a,b)=>b[1]-a[1])
  .map(([id,value])=>`  <${id}> * ${
    Math.min(64, Math.max(1, qnt * max / value | 0))
  },`)
  .join('\n')
})()
)*/
  <thermalfoundation:fertilizer:2> * 7,
  <mysticalagriculture:mystical_fertilizer> * 8,
  <mysticalagriculture:fertilized_essence> * 13,
  <thermalfoundation:fertilizer:1> * 14,
  <industrialforegoing:fertilizer> * 15,
  <botania:fertilizer> * 17,
  <forestry:fertilizer_compound> * 21,
  <actuallyadditions:item_fertilizer> * 42,
  <ic2:crop_res:2> * 42,
  <thermalfoundation:fertilizer> * 42,
/**/
];

for input in fertilizers {
  x.addJEIRecipe(AssemblyRecipe.create(function(container) {})
    .requireItem("item_in", input)
  );
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
val xp_bottler = itemUtils.getItem("openblocks:xp_bottler");
if(!isNull(xp_bottler)) {
  x = <assembly:xp_bottler>;
  x.addJEICatalyst(xp_bottler);
  x.setJEIFluidSlot(1, 0, 'liquid_input');
  x.setJEIDurationSlot(2,0,"duration", SlotVisual.arrowRight());
  addInsOuts(x, [[0,0]], [[3,0]]);

  for fluid in [
    "essence",
    "xpjuice",
    "experience",
  ] as string[] {
    x.addJEIRecipe(AssemblyRecipe.create(function(container) {
      container.addItemOutput('output0', <minecraft:experience_bottle>);
    })
    .requireFluid('liquid_input', game.getLiquid(fluid) * 160)
    .requireItem("input0", <minecraft:glass_bottle>)
    );
  }
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:nether_portal_spread>;
x.addJEICatalyst(<minecraft:obsidian>);
x.setJEIDurationSlot(5,0,"duration", SlotVisual.arrowRight());
addInsOuts(x, [[4,0],[3,0],[2,0],[1,0],[0,0]], [[6,0],[7,0],[8,0]]);

/*Inject_js(
(()=>{
const fluids = getCSV('config/tellme/fluids-csv.csv')

const toStack=([__, mod, id, amount], isWildcard)=>{
  const def = `${mod||'minecraft'}:${id}`
  const fluid = fluids.find(o=>o.Block === def)
  const count = parseInt(amount)>1?' * '+Math.min(64,amount):''
  return (fluid
    ? `Bucket("${fluid.Name}")`
    : `<${def + (isWildcard===true ? ':*' : '')}>`)
  + count
}

return loadText('config/netherportalspread/spreadsettings.txt')
.split('\n')
.filter(l=>l.match(/\S+/))
.map(l=>l.match(/(?:([^:\s]+):)?([^:\s]+); \[([^\]]+)\],/))
.map(m=>[
  toStack(m, true),
  [...m[3].matchAll(/(?:([^:\s]+):)?([^:\s]+)>(\d+)/g)].map(toStack).join(', '),
]).reduce((acc,[inp, out])=>{
  const arr = acc.find(o=>o[1]===out)?.[0]
  if(arr) arr.push(inp)
  else acc.push([[inp], out])
  return acc
}, [])
.map(([inps, out])=>`add(x, {[${inps.join(', ')}] : [${out}]});`)
.join('\n')
})()
)*/
add(x, {[<additionalcompression:meatfish_compressed:*>, <additionalcompression:meatchicken_compressed:*>, <additionalcompression:meatbeef_compressed:*>, <additionalcompression:meatporkchop_compressed:*>] : [<thaumcraft:flesh_block>]});
add(x, {[<appliedenergistics2:sky_stone_block:*>] : [<minecraft:quartz_block>]});
add(x, {[<biomesoplenty:white_sand:*>] : [<quark:jasper>]});
add(x, {[<chisel:basalt2:*>] : [<tconstruct:seared>]});
add(x, {[<chisel:bricks:*>] : [<minecraft:red_nether_brick>]});
add(x, {[<chisel:limestone:*>, <minecraft:sandstone:*>] : [<mysticalagriculture:soulstone>]});
add(x, {[<chisel:marble2:*>, <astralsorcery:blockmarble:*>] : [<thaumictinkerer:black_quartz_block> * 10, <botania:quartztypedark>]});
add(x, {[<iceandfire:ash:*>] : [<chisel:block_coal_coke>]});
add(x, {[<minecraft:brick_block:*>] : [<minecraft:nether_brick>]});
add(x, {[<minecraft:cobblestone:*>, <quark:slate:*>] : [<quark:biome_cobblestone>]});
add(x, {[<minecraft:diamond_block:*>] : [<minecraft:gold_block>]});
add(x, {[<minecraft:diamond_ore:*>, <minecraft:emerald_ore:*>, <appliedenergistics2:charged_quartz_ore:*>] : [<tconstruct:ore>]});
add(x, {[<minecraft:emerald_block:*>] : [<tconstruct:metal>]});
add(x, {[<minecraft:fence:*>] : [<minecraft:nether_brick_fence>]});
add(x, {[<minecraft:gold_ore:*>, <minecraft:iron_ore:*>, <minecraft:lapis_ore:*>, <appliedenergistics2:quartz_ore:*>, <thaumcraft:ore_cinnabar:*>, <thaumcraft:ore_amber:*>] : [<netherendingores:ore_nether_modded_1>]});
add(x, {[<minecraft:gravel:*>, <minecraft:clay:*>, <minecraft:leaves:*>, <minecraft:leaves2:*>, <advancedrocketry:alienleaves:*>, <exnihilocreatio:block_infesting_leaves:*>, <exnihilocreatio:block_infested_leaves:*>, <extrautils2:ironwood_leaves:*>, <biomesoplenty:leaves_0:*>, <biomesoplenty:leaves_1:*>, <biomesoplenty:leaves_2:*>, <biomesoplenty:leaves_3:*>, <biomesoplenty:leaves_4:*>, <biomesoplenty:leaves_5:*>, <forestry:leaves.decorative.0:*>, <forestry:leaves.decorative.1:*>, <forestry:leaves.decorative.2:*>] : [<biomesoplenty:ash_block>]});
add(x, {[<minecraft:hardened_clay:*>] : [<tcomplement:scorched_block>]});
add(x, {[<minecraft:log:*>, <minecraft:log2:*>] : [<advancedrocketry:charcoallog>]});
add(x, {[<minecraft:melon_block:*>, <minecraft:hay_block:*>] : [<minecraft:nether_wart_block>]});
add(x, {[<minecraft:mossy_cobblestone:*>] : [<minecraft:magma>]});
add(x, {[<minecraft:mycelium:*>] : [<extrautils2:cursedearth>]});
add(x, {[<minecraft:planks:*>] : [<tconstruct:firewood>]});
add(x, {[<minecraft:prismarine:*>] : [<minecraft:glowstone>]});
add(x, {[<minecraft:redstone_block:*>] : [<quark:smoker>]});
add(x, {[<minecraft:redstone_ore:*>, <minecraft:coal_ore:*>, <thermalfoundation:ore:*>] : [<minecraft:quartz_ore>]});
add(x, {[<minecraft:ice:*>] : [<minecraft:obsidian>]});
add(x, {[<minecraft:sand:*>] : [<minecraft:soul_sand>]});
add(x, {[<minecraft:slime:*>] : [<minecraft:bone_block>]});
add(x, {[<minecraft:stone:*>, <minecraft:dirt:*>, <minecraft:grass:*>, <minecraft:grass_path:*>, <minecraft:farmland:*>, <biomesoplenty:grass:*>, <biomesoplenty:dirt:*>] : [<minecraft:netherrack> * 64, <minecraft:quartz_ore> * 4, <netherendingores:block_nether_netherfish>]});
add(x, {[<minecraft:stonebrick:*>] : [<quark:magma_bricks>]});
add(x, {[<thaumcraft:stone_porous:*>] : [<additionalcompression:dustgunpowder_compressed>, <forestry:ash_block_1> * 5]});
add(x, {[<minecraft:yellow_flower:*>, <minecraft:red_flower:*>] : [<minecraft:fire>]});
add(x, {[<biomesoplenty:flower_0:*>, <biomesoplenty:flower_1:*>] : [<biomesoplenty:blue_fire>]});
add(x, {[<botania:flower:*>] : [<cyclicmagic:fire_dark>]});
add(x, {[<minecraft:snow_layer:*>] : [<cyclicmagic:fire_frost>]});
add(x, {[Bucket("water")] : [Bucket("blood")]});
/**/


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:lens_of_the_miner>;
x.addJEICatalyst(<actuallyadditions:item_mining_lens>);
x.addJEICatalyst(<actuallyadditions:block_atomic_reconstructor>);
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
addInsOuts(x, [[0,0]], [[2,0]]);

function addMiningLensOre(base as IIngredient, oreDictName as string, weight as int) as void {
  val ore = oreDict[oreDictName];
  if(ore.items.length == 0) return;
  val output = ore.firstItem.withLore(["§e§lWeight: " ~ weight]);
  add(<assembly:lens_of_the_miner>, {[base] as IIngredient[] : [output]});
}

function addMiningLensStoneOre(oreDictName as string, weight as int) {
  addMiningLensOre(<minecraft:stone>, oreDictName, weight);
}
function addMiningLensNetherOre(oreDictName as string, weight as int) {
  addMiningLensOre(<minecraft:netherrack>, oreDictName, weight);
}

// Values taken from:
// https://github.com/Ellpeck/ActuallyAdditions/blob/main/src/main/java/de/ellpeck/actuallyadditions/common/items/lens/LensMining.java
addMiningLensNetherOre("oreNetherDiamond", 50);
addMiningLensNetherOre("oreNetherRedstone", 200);
addMiningLensNetherOre("oreNetherLapis", 250);
addMiningLensNetherOre("oreQuartz", 3000);
addMiningLensNetherOre("oreNetherCoal", 5000);
addMiningLensNetherOre("crushedNetherrack", 6000);

addMiningLensStoneOre("oreMalachite", 40);
addMiningLensStoneOre("orePeridot", 40);
addMiningLensStoneOre("oreRuby", 40);
addMiningLensStoneOre("oreSapphire", 40);
addMiningLensStoneOre("oreApatite", 700);
addMiningLensStoneOre("oreCertusQuartz", 800);
addMiningLensStoneOre("oreQuartzBlack", 3000);
addMiningLensStoneOre("oreCoal", 5000);
addMiningLensStoneOre("gravel", 6000);


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:petro_petunia>;
x.addJEICatalyst(<botania:specialflower>.withTag({type: "petro_petunia"}));
x.addJEICatalyst(<botania:floatingspecialflower>.withTag({type: "petro_petunia"}));
x.setJEIFluidSlot(0, 0, 'liquid_input');
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
x.setJEIItemSlot(2, 0, 'output0');

for fluid, arr in {
/*Inject_js(
Object.entries(
  config('acronym/floralchemy.cfg').fuelvalues
).map(([fluid, {burnTime, powerPreTick}]) => 
  [fluid, ((20*60) / burnTime * 1000) | 0, powerPreTick * burnTime]
).sort((a, b) => b[2] - a[2])
.map(([fluid, consumption, manaTotal]) =>
  `  ${('"'+fluid+'":').padEnd(16)}[${consumption}, ${manaTotal}],`
))*/
  "perfect_fuel": [12, 768000000],
  "rocketfuel":   [500, 480000],
  "empoweredoil": [1200, 100000],
  "refined_fuel": [1411, 85000],
  "diesel":       [3428, 17500],
  "crystaloil":   [3428, 17500],
  "biodiesel":    [4800, 12500],
  "biomass":      [4800, 12500],
  "canolaoil":    [8000, 7500],
  "oil":          [12000, 5000],
/**/
} as int[][string] {
  val consumption = arr[0];
  val manaTotal = arr[1];
  x.addJEIRecipe(AssemblyRecipe.create(function(container) {
    container.addItemOutput('output0',
      <botania:manatablet>.withTag({mana: min(500000, manaTotal), display:{Name:"§b"~manaTotal~" Mana"}})
      * (manaTotal / 500000 + 1)
    );
  })
  .requireFluid('liquid_input', game.getLiquid(fluid) * consumption)
  );
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:syngas_producer>;
x.addJEICatalyst(<advgenerators:syngas_controller>);
x.setJEIItemSlot(0, 0, 'input0');
x.setJEIDurationSlot(1,0,"duration", SlotVisual.arrowRight());
x.setJEIFluidSlot(2, 0, 'fluid_out');

function getOreDictBurnTime(oreName as string) as int {
  for item in oreDict[oreName].items {
    if (item.burnTime > 0) return item.burnTime;
  }
  return 0;
}

function addSyngas(input as IIngredient, carbon as int) as void {
  if(carbon<=0) return;
  <assembly:syngas_producer>.addJEIRecipe(AssemblyRecipe.create(function(container) {
    container.addFluidOutput('fluid_out', <fluid:coal> * carbon);
  })
  .requireItem("input0", input)
  );
}


/*Inject_js{
const cfg = [...
  loadText('config/AdvGenerators/overrides/syngas.cfg')
  .matchAll(/^\s*carbon-value\s*:\s*(.*)$/gm)
].map(([,m])=>m.trim())

const bl = (id)=>((id.split(':').length===1?'minecraft:':'')+id).replace(/@(\d+)/,':$1')

return cfg
.map(l=>l.match(
  /(B|I|OD):(\w+(?::\w+)?(?:@\d+)?) (?:=> (\d+)|DEFAULT)(?:\s*\/\/.*)?$/
)?.slice(1))
.filter(m=>m)
.sort(([,,a],[,,b])=>naturalSort(b??'',a??''))
.map(([type, _item, val])=>{
  const OD = type==='OD'
  const item = OD ? _item : _item.toLowerCase()
  const it = `<${OD ? 'ore:'+item : bl(item)}>`
  return ((OD ? !isODExist(item) : !isItemExist(bl(item)))?'#':'') +
    `addSyngas(${it}, ${val ?? (OD ? `getOreDictBurnTime("${item}")` : it+'.burnTime')});`
})
}*/
addSyngas(<contenttweaker:saturated_phosphor>, 450000);
addSyngas(<ore:compressedCharcoal3x>, 256000);
addSyngas(<ore:compressedCoal3x>, 256000);
addSyngas(<contenttweaker:empowered_phosphor>, 180000);
addSyngas(<contenttweaker:blasted_coal>, 120000);
addSyngas(<ore:compressedCharcoal2x>, 64000);
addSyngas(<ore:compressedCoal2x>, 64000);
addSyngas(<contenttweaker:conglomerate_of_coal>, 60000);
#addSyngas(<railcraft:cube:0>, 32000);
addSyngas(<ore:blockFuelCoke>, 32000);
addSyngas(<ore:crystalCrudeOil>, 32000);
addSyngas(<ore:blockCharcoal>, 16000);
addSyngas(<ore:blockGraphite>, 16000);
addSyngas(<rats:little_black_squash_balls>, 8000);
addSyngas(<ore:fuelCoke>, 3200);
addSyngas(<mekanism:compressedcarbon>, 3200);
addSyngas(<ore:logWood>, 1600);
addSyngas(<ore:pulpWood>, 1600);
addSyngas(<ore:dustCoal>, 1600);
addSyngas(<ore:dustCharcoal>, 1600);
#addSyngas(<ore:molecule_cellulose>, 1200);
addSyngas(<mekanism:biofuel>, 800);
addSyngas(<ore:plankWood>, 400);
#addSyngas(<ore:element_C>, 200);
addSyngas(<ore:blockCoal>, getOreDictBurnTime("blockCoal"));
addSyngas(<minecraft:coal:0>, <minecraft:coal:0>.burnTime);
addSyngas(<minecraft:coal:1>, <minecraft:coal:1>.burnTime);
#addSyngas(<ore:itemCharcoalSugar>, getOreDictBurnTime("itemCharcoalSugar"));
#addSyngas(<minefactoryreloaded:brick:15>, <minefactoryreloaded:brick:15>.burnTime);
addSyngas(<ore:woodRubber>, getOreDictBurnTime("woodRubber"));
addSyngas(<forestry:bituminous_peat>, <forestry:bituminous_peat>.burnTime);
addSyngas(<forestry:peat>, <forestry:peat>.burnTime);
addSyngas(<extrautils2:ingredients:4>, <extrautils2:ingredients:4>.burnTime);
/**/

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:garden_cloche>;
x.addJEICatalyst(<immersiveengineering:metal_device1:13>);
x.setJEIFluidSlot(0, 0, 'fluid_in');
x.setJEIDurationSlot(1,0,"duration", getVisGauge(9,1));
addInsOuts(x, [[1,0]], [[3,0]]);

function addGardenClocheFluid(fluid as ILiquidStack, amount as int) as void {
  <assembly:garden_cloche>.addJEIRecipe(AssemblyRecipe.create(function(c) {
    c.addItemOutput('output0', <minecraft:potato> * amount);
  })
  .requireFluid('fluid_in', fluid * 100)
  .requireItem("input0", <minecraft:potato>)
  );
}

