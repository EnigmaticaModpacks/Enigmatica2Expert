#priority 950
#modloaded astralsorcery

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.requious.AssemblyRecipe;
import scripts.jei.requious.add as addRecipe;


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:everflow_chalice>;
x.addJEICatalyst(<astralsorcery:blockchalice>);
x.setJEIDurationSlot(1,0,"duration", scripts.jei.requious.getVisGauge(0,6));
scripts.jei.requious.addInsOuts(x, [[0,0],[2,0]], [[1,1], [0,2], [2,2]]);

function add_everflow_chalice(input1 as IIngredient, input2 as IIngredient, out as IItemStack[]) {
  addRecipe(<assembly:everflow_chalice>, {[input1, input2] : out});
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:neromantic_prime>;
x.addJEICatalyst(<astralsorcery:blockbore>);
x.addJEICatalyst(<astralsorcery:blockborehead>);
x.addJEICatalyst(<astralsorcery:blockchalice>);
x.setJEIFluidSlot(0, 0, 'fluid_out');

static neromantic_prime_fluids as ILiquidStack[] = [
/*Inject_js(
config('config/astralsorcery/fluid_rarities.cfg').data.data
.slice(0, 9*5)
.map(l=>l.split(';'))
.map(l=>[
  parseInt(l[3]),
  [`  <fluid:${(l[0]+'>')}`,` * ${l[3]},`]
])
.sort(([a], [b]) => b - a)
.map(([,l])=>l)
)*/
  <fluid:mana>              * 1500,
  <fluid:amber>             * 800,
  <fluid:xpjuice>           * 500,
  <fluid:pyrotheum>         * 200,
  <fluid:cryotheum>         * 200,
  <fluid:hydrofluoric_acid> * 120,
  <fluid:mutagen>           * 100,
  <fluid:vibrant_alloy>     * 40,
  <fluid:ic2uu_matter>      * 1,
/**/
];

for i, output in neromantic_prime_fluids {
  x.addJEIRecipe(AssemblyRecipe.create(function(container) {
    container.addFluidOutput("fluid_out", output);
  }));
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:mineralis>;
x.addJEICatalyst(<astralsorcery:blockritualpedestal>);
x.addJEICatalyst(<astralsorcery:itemtunedcelestialcrystal>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.mineralis", crystalProperties: {collectiveCapability: 100, size: 900, fract: 0, purity: 100, sizeOverride: -1}}}));
x.addJEICatalyst(<astralsorcery:itemtunedrockcrystal>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.mineralis", crystalProperties: {collectiveCapability: 100, size: 400, fract: 0, purity: 100, sizeOverride: -1}}}));

val mineralisList = [
/*Inject_js{
  const list = config('config/astralsorcery/mineralis_ritual.cfg').data.data
  .map(o=>((a,b)=>[a, parseInt(b)])(...o.split(';')))
  .filter(([od])=>isODExist(od))
  .sort(([,a],[,b])=>b-a)
  let max = _.max(list.map(([,a])=>a))
  return list.map(([od,w])=>`  ${$('ore', od, 0, Math.max(1,(w/max*64)|0), null, '.firstItem')},`)
}*/
  <ore:oreCoal>.firstItem * 64,
  <ore:oreIron>.firstItem * 30,
  <ore:oreTin>.firstItem * 18,
  <ore:oreCopper>.firstItem * 13,
  <ore:oreLead>.firstItem * 12,
  <ore:oreOsmium>.firstItem * 11,
  <ore:oreRedstone>.firstItem * 8,
  <ore:oreAluminum>.firstItem * 7,
  <ore:oreBoron>.firstItem * 7,
  <ore:oreLithium>.firstItem * 7,
  <ore:oreMagnesium>.firstItem * 7,
  <ore:oreThorium>.firstItem * 7,
  <ore:oreGold>.firstItem * 6,
  <ore:oreUranium>.firstItem * 6,
  <ore:oreCertusQuartz>.firstItem * 6,
  <ore:oreNickel>.firstItem * 3,
  <ore:oreDiamond>.firstItem * 2,
  <ore:oreSilver>.firstItem * 2,
  <ore:oreLapis>.firstItem,
  <ore:oreEmerald>.firstItem,
  <ore:oreMithril>.firstItem,
  <ore:orePlatinum>.firstItem,
/**/
] as IItemStack[];

var k = 0;
for _y in 0 .. (mineralisList.length / 9 + 1) as int {
  for _x in 0 .. 9 {
    x.setJEIItemSlot(_x, _y, 'output'~k);
    k += 1;
  }
}

addRecipe(x, {[] : mineralisList});
