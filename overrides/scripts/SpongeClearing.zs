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