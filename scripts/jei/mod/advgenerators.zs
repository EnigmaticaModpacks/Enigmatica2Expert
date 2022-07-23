#priority 950
#modloaded advgenerators

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;


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
  {liquidethene    : 80},
  {"bio.ethanol"   : 90},
  {biofuel         : 90},
  {refined_oil     : 95},
  {rocket_fuel     : 95},
  {syngas          : 100},
  {refined_fuel    : 105},
  {empoweredoil    : 120},
  {fire_water      : 120},
  {rocketfuel      : 410},
  {perfect_fuel    : 32800},
/**/
];

var x = <assembly:turbine>;
x.addJEICatalyst(<advgenerators:turbine_controller>);
x.setJEIDurationSlot(1,0,"duration", scripts.jei.requious.getVisGauge(0,5));
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
x.setJEIDurationSlot(2,0,"duration", scripts.jei.requious.getVisGauge(9,1));
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

/*Inject_js{
const cfg = [...
  loadText('config/AdvGenerators/overrides/exchanger.cfg')
  .matchAll(/^\s*exchanger\s*:\s*(.*)$/gm)
].map(([,m])=>m.trim())
const bl = (id)=>{const s=id.split(':'); return s.length>=2?id.replace(/@(\d+)/,':$1'):'minecraft:'+s[0]}
const B = (block,amount)=>`<${bl(block)}>${parseFloat(amount)>1?' * ' + amount : ''}`
const H = (h)=>Math.round(h)
return _(cfg
.map(g=>g.match(
  /fluid:(\w+) (\d+) mB(?: \+ (\d+) HU)? =>(?: fluid:(\w+) (\d+) ?mB)?(?: [BI]:(\w+(?::\w+)?(?:@\d+)?) (\d+\.\d+))?(?: \+ (\d+) HU)?/
)?.slice(1))
.filter(m=>m))
.sortBy(o=>parseInt(o[7]) * 1000 + parseInt(o[4])).value()
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
}*/
addHeatExch(<fluid:ic2hot_coolant>, 0, <fluid:ic2coolant>, null, 40);
addHeatExch(<fluid:lava>, 0, null, <minecraft:obsidian>, 30);
addHeatExch(<fluid:ic2pahoehoe_lava>, 0, null, <advancedrocketry:basalt>, 40);
addHeatExch(<fluid:pyrotheum>, 0, null, <chisel:basalt2:7>, 60);
addHeatExch(<fluid:fire_water>, 0, null, <botania:blazeblock>, 200);
addHeatExch(<fluid:enrichedlava>, 0, null, <draconicevolution:infused_obsidian>, 500);
addHeatExch(<fluid:water> * 5, 3, <fluid:steam> * 15, null, 0);
addHeatExch(<fluid:distwater>, 20, <fluid:steam> * 300, null, 0);
addHeatExch(<fluid:ic2hot_water>, 12, <fluid:steam> * 300, null, 0);
addHeatExch(<fluid:ic2distilled_water>, 16, <fluid:steam> * 400, null, 0);
/**/


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
    container.addFluidOutput('fluid_out', <fluid:syngas> * (carbon / 50));
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
