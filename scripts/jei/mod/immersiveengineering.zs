#priority 950
#modloaded immersiveengineering

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.requious.AssemblyRecipe;
import mods.requious.SlotVisual;
import scripts.jei.requious.add as addRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
var x = <assembly:garden_cloche>;
x.addJEICatalyst(<immersiveengineering:metal_device1:13>);
x.setJEIFluidSlot(0, 0, 'fluid_in');
x.setJEIDurationSlot(1,0,"duration", scripts.jei.requious.getVisGauge(9,1));
scripts.jei.requious.addInsOuts(x, [[1,0]], [[3,0]]);

function addGardenClocheFluid(fluid as ILiquidStack, amount as int) as void {
  <assembly:garden_cloche>.addJEIRecipe(AssemblyRecipe.create(function(c) {
    c.addItemOutput('output0', <minecraft:potato> * amount);
  })
  .requireFluid('fluid_in', fluid * 100)
  .requireItem("input0", <minecraft:potato>)
  );
}

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:excavator>;
x.addJEICatalyst(<immersiveengineering:metal_multiblock:11>);
x.addJEICatalyst(<immersiveengineering:metal_multiblock:12>);
x.addJEICatalyst(<immersivepetroleum:schematic>.withTag({multiblock: "IE:ExcavatorDemo", flip: 1 as byte}));

val excavatorList = [
/*Inject_js{

const oreSet = new Map()
const defList = [
  [25, 0.1, ['oreIron'    , 'oreNickel'       , 'oreTin'          , 'denseoreIron'                       ], [0.5, 0.25, 0.20, 0.05]],
  [25, 0.1, ['oreIron'    , 'oreGold'                                                                    ], [0.85, 0.15]],
  [20, 0.1, ['oreIron'    , 'dustSulfur'                                                                 ], [0.5, 0.5]],
  [20, 0.2, ['oreAluminum', 'oreTitanium'     , 'denseoreAluminum'                                       ], [0.90, 0.05, 0.05]],
  [30, 0.2, ['oreCopper'  , 'oreGold'         , 'oreNickel'       , 'denseoreCopper'                     ], [0.65, 0.25, 0.05, 0.05]],
  [15, 0.2, ['oreTin'     , 'denseoreTin'                                                                ], [0.95, 0.05]],
  [20, 0.3, ['oreGold'    , 'oreCopper'       , 'oreNickel'       , 'denseoreGold'                       ], [0.65, 0.25, 0.05, 0.05]],
  [20, 0.3, ['oreNickel'  , 'orePlatinum'     , 'oreIron'         , 'denseoreNickel'                     ], [0.85, 0.05, 0.05, 0.05]],
  [ 5, 0.35,['orePlatinum', 'oreNickel'       , '-oreIridium-'    , 'denseorePlatinum'                   ], [0.40, 0.30, 0.15, 0.1, 0.05]],
  [10, 0.35,['oreUranium' , 'oreLead'         , 'orePlutonium'    , 'denseoreUranium'                    ], [0.55, 0.3, 0.1, 0.05]],
  [ 5, 0.3, ['oreQuartz'  , 'oreCertusQuartz'                                                            ], [0.6, 0.4]],
  [15, 0.2, ['oreLead'    , 'oreSilver'       , 'oreSulfur'       , 'denseoreLead'   , 'denseoreSilver'  ], [0.40, 0.40, 0.1, 0.05, 0.05]],
  [10, 0.15,['oreLead'    , 'oreSilver'       , 'denseoreLead'                                           ], [0.55, 0.4, 0.05]],
  [10, 0.2, ['oreSilver'  , 'oreLead'         , 'denseoreSilver'                                         ], [0.55, 0.4, 0.05]],
  [10, 0.2, ['oreLapis'   , 'oreIron'         , 'dustSulfur'      , 'denseoreLapis'                      ], [0.65, 0.275, 0.025, 0.05]],
  [15, 0.1, ['oreRedstone', 'denseoreRedstone', 'oreRuby'         , 'oreCinnabar'    , 'dustSulfur'      ], [0.75, 0.05, 0.05, 0.1, 0.05]],
  [25, 0.1, ['oreCoal'    , 'denseoreCoal'    , 'oreDiamond'      , 'oreEmerald'                         ], [0.92, 0.1, 0.015, 0.015]],
  [25, 0.05,['blockClay'  , 'sand'            , 'gravel'                                                 ], [0.5, 0.3, 0.2]],
]

glob.sync('scripts/**'+'/*.zs').forEach(filePath => {
  for (const match of loadText(filePath).matchAll(/immersiveengineering\.Excavator\.addMineral\("[^"]+?", (.*)\);/gm)) {
    defList.push(eval(`([${match[1]}])`))
  }
})

const wSumm = _.sum(defList.map(([a])=>a))
defList.forEach(([weight, failChance, ores, probs])=>{
  const sum = _.sum(probs)
  probs = probs.map(p=>p/sum)

  const gain = weight / wSumm * (1-failChance)

  ores.forEach((ore,i)=>{
    oreSet.set(ore, (oreSet.get(ore)??0) + gain * probs[i])
  })
})

const result = [...oreSet]
  .filter(([ore])=>isODExist(ore))
  .sort(([,a],[,b])=>b-a)

return result.map(([ore,weight])=>{
  const tm = getByOredict_first(ore)
  const amount = (weight / result[0][1] * 64 + 1) | 0
  return `  ${tm.commandString}${amount > 1 ? ' * '+amount : ''},`
})

}*/
  <minecraft:iron_ore> * 65,
  <thermalfoundation:ore:1> * 64,
  <minecraft:coal_ore> * 53,
  <thermalfoundation:ore:2> * 31,
  <thermalfoundation:ore:5> * 31,
  <thermalfoundation:ore> * 29,
  <minecraft:gold_ore> * 28,
  <mekanism:oreblock> * 24,
  <thermalfoundation:ore:3> * 23,
  <thermalfoundation:ore:4> * 22,
  <minecraft:clay> * 18,
  <minecraft:redstone_ore> * 16,
  <thermalfoundation:material:771> * 15,
  <minecraft:sand> * 11,
  <minecraft:lapis_ore> * 8,
  <nuclearcraft:ore:3> * 8,
  <nuclearcraft:ore:5> * 8,
  <nuclearcraft:ore:6> * 8,
  <nuclearcraft:ore:7> * 8,
  <actuallyadditions:block_misc:3> * 8,
  <minecraft:gravel> * 8,
  <immersiveengineering:ore:5> * 6,
  <minecraft:quartz_ore> * 4,
  <thermalfoundation:ore:6> * 4,
  <appliedenergistics2:charged_quartz_ore> * 3,
  <thaumcraft:ore_cinnabar> * 3,
  <libvulpes:ore0:8> * 2,
  <biomesoplenty:gem_ore:1> * 2,
  <minecraft:diamond_ore>,
  <minecraft:emerald_ore>,
/**/
] as IItemStack[];

var k = 0;
for _y in 0 .. (excavatorList.length / 9 + 1) as int {
  for _x in 0 .. 9 {
    x.setJEIItemSlot(_x, _y, 'output'~k);
    k += 1;
  }
}

addRecipe(x, {[] : excavatorList});

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
x = <assembly:chemthrower>;
x.addJEICatalyst(<immersiveengineering:chemthrower>);
x.addJEICatalyst(<immersiveengineering:metal_device1:10>);
x.setJEIFluidSlot(0, 0, 'fluid_in');
x.setJEIDurationSlot(2,0,"duration", SlotVisual.arrowRight());
scripts.jei.requious.addInsOuts(x, [[1,0]], [[3,0]]);

function addChemthrower(fluid as ILiquidStack, blockInput as IIngredient, output as IItemStack) as void {
  val rec = AssemblyRecipe.create(function(c) {
    c.addItemOutput('output0', output);
  });
  rec.requireFluid("fluid_in", fluid);
  if(!isNull(blockInput)) rec.requireItem("input0", blockInput);
  
  <assembly:chemthrower>.addJEIRecipe(rec);
}

addChemthrower(<fluid:concrete>, null, <immersiveengineering:stone_decoration:9>);
