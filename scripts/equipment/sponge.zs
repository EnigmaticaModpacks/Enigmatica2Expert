/*

Remove TCon modifiers and Jetpack Attachments from any armor

*/

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;
import crafttweaker.recipes.IRecipeFunction;

static polishingFnc as IRecipeFunction = function(out, ins, cInfo) {
  if(isNull(ins.m) || isNull(ins.m.tag)) return null;
  var result = ins.m;

  // Strip TCon modifiers except artifact and tool leveling
  if(
    !isNull(result.tag.Modifiers) &&
    !isNull(result.tag.TinkerData) &&
    !isNull(result.tag.TinkerData.Modifiers)
  ) {
    var traitsToRemove = [] as string[];
    var newDataModifiers = [] as IData;
    for i, trait in result.tag.TinkerData.Modifiers.asList() {
      if(
        trait != 'tconevo.artifact' &&
        trait != 'leveling_armor' &&
        trait != 'toolleveling'
      ) {
        traitsToRemove += trait;
      } else {
        newDataModifiers += [trait] as IData;
      }
    }
    var newModifiers = [] as IData;
    var newTraits = [] as IData;
    for i, modif in result.tag.Modifiers.asList() {
      if(isNull(modif.identifier)) continue;
      val id = modif.identifier.asString();
      if(traitsToRemove has id) continue;
      newModifiers += [modif] as IData;
      newTraits += [id] as IData;
    }
    
    result = result.updateTag({
      TinkerData: result.tag.TinkerData - 'Modifiers' + {Modifiers: newDataModifiers} as IData,
      Modifiers: newModifiers,
      Traits: newTraits,
    });
  }

  // Strip TCon modifiers except artifact and tool leveling
  if(
    !isNull(result.tag.hasIC2Jetpack) &&
    result.tag.hasIC2Jetpack.asByte() == 1 as byte
  ) {
    result = result.withTag(result.tag - 'hasIC2Jetpack');
  }

  return result;
} as IRecipeFunction;

recipes.addShapeless("Clear modifiers example",
  scripts.equipment.utils_tcon.constructTool(<tconstruct:pickaxe>,
    'flint', 'apatite', 'amber', 'copper'
  ), [
  scripts.equipment.utils_tcon.constructTool(<tconstruct:pickaxe>,
    'flint', 'apatite', 'amber', 'copper',
    ["diamond", "sharpness", "haste", "emerald"]
  ).marked('m'),
  <minecraft:sponge>,
], polishingFnc, null);

recipes.addShapeless("Clear jetpack example", <minecraft:leather_chestplate>, [
  <minecraft:leather_chestplate>.withTag({charge: 30000.0, hasIC2Jetpack: 1 as byte}).marked('m'),
  <minecraft:sponge>,
], polishingFnc, null);

recipes.addHiddenShapeless("Clear modifiers", <minecraft:sponge>, [
  <*>.only(function(item) { return item.hasTag; }).marked('m'),
  <minecraft:sponge>,
], polishingFnc, null);

/*

Example of an armor

<conarm:chestplate>.withTag({
  StatsOriginal: {
    Toughness: 0.0 as float,
    FreeModifiers: 3,
    Durability: 608,
    Defense: 10.5 as float,
  },
  display: {
    Lore: [
      '',
      '§5§oA brilliant plate of legend with the power to bring its wearer back from the brink of death.',
    ],
    Name: '§e§nGuardian Angel',
  },
  Stats: {
    Toughness: 0.0 as float,
    FreeModifiers: 1,
    Durability: 608,
    Defense: 10.5 as float,
  },
  ConArmEquipmentSlot: 4,
  TinkerData: {
    Materials: ['nickel', 'universal_metal', 'silver'],
    Modifiers: ['leveling_armor', 'tconevo.artifact'],
  },
  Modifiers: [
    { identifier: 'tconevo.bulwark_armor', color: -4213116, level: 1 },
    { identifier: 'tconevo.phoenix_aspect_armor', color: -2662954, level: 1 },
    { identifier: 'blessed_armor', color: -3019530, level: 1 },
    { identifier: 'leveling_armor', color: 16777215, level: 1 },
    { identifier: 'tconevo.artifact', color: 14333039, level: 1 },
  ],
  Traits: [
    'tconevo.bulwark_armor',
    'tconevo.phoenix_aspect_armor',
    'blessed_armor',
    'leveling_armor',
    'tconevo.artifact',
  ],
})

<tconstruct:pickaxe>.withTag({
  StatsOriginal: {
    AttackSpeedMultiplier: 1.0 as float,
    MiningSpeed: 8.25 as float,
    FreeModifiers: 3,
    Durability: 282,
    HarvestLevel: 2,
    Attack: 6.75 as float,
  },
  Stats: {
    AttackSpeedMultiplier: 1.0 as float,
    MiningSpeed: 8.25 as float,
    FreeModifiers: 2,
    Durability: 282,
    HarvestLevel: 2,
    Attack: 6.75 as float,
  },
  Special: { Categories: ['aoe', 'tool', 'harvest'] },
  TinkerData: {
    Materials: ['fusewood', 'fusewood', 'fusewood'],
    Modifiers: ['toolleveling'],
  },
  Modifiers: [
    { identifier: 'ecological', color: -13215679, level: 1 },
    { identifier: 'tconevo.blasting', color: -13215679, level: 1 },
    { identifier: 'toolleveling', color: 16777215, level: 1 },
  ],
  Traits: ['ecological', 'tconevo.blasting', 'toolleveling'],
})

*/