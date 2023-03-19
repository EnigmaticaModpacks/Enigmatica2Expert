import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import mods.ctutils.utils.Math.max;
import mods.ctutils.utils.Math.min;

#priority 100



static allToolModifiers as IData = [
  // "creative", // Creative is avaliable but added parralel with other modifiers
  "diamond",
  "sharpness",
  "haste",
  "emerald",
  "mending_moss",
  "reinforced",
  "smite",
  "knockback",
  "luck",
  "frost",
  "flame",
  "silktouch",

  "beheading",
  "necrotic",
  "webbed",
  "magicmushroom",
  "shulking",
  "glowing",
  "harvestheight",
  "harvestwidth",
  "soulbound",
] as IData;

static allArmorModifiers as IData = [
  // "creative",
  "diamond_armor",
  "speedy_armor",
  "emerald_armor",
  "fire_resistant_armor",
  "projectile_resistant_armor",
  "blast_resistant_armor",
  "reinforced_armor",
  "shulkerweight_armor",
  "mending_armor",
  "parasitic_armor",
  "resistant_armor",
  "sticky_armor",
  "soulbound_armor",
] as IData;


# -------------------------------
# Utilities
# -------------------------------

function D_indexof(dataList as IData, field as string, value as string) as int {
  if (isNull(dataList) || dataList.length <= 0) return -1 as int;

  for i,d in dataList.asList() {
    val sub = isNull(field) ? d : d.memberGet(field);
    if (!isNull(sub) && sub.asString() == value) {
      return i;
    }
  }
  return -1 as int;
}

function D_find(dataList as IData, field as string, value as string) as IData {
  var index = D_indexof(dataList, field, value);
  if(index== -1) return null;
  return dataList[index];
}

function pushUnique(dataList as IData, value as string) as IData {
  if (!isNull(D_find(dataList, null, value)))
    return null;
  else
    return [value] as IData;
}


function pushTrait(tag as IData, traitName as string) as IData {
  var unique = pushUnique(tag.Traits, traitName);
  if (!isNull(unique)) {
    return tag + {Traits: unique} as IData;
  } else {
    return tag;
  }
}

function D_replace(dataList as IData, replaceIndex as int, value as IData) as IData {
  var newList = [] as IData;
  for k,v in dataList.asList() {
    if (replaceIndex != k)
      newList = newList + [v] as IData;
    else
      newList = newList + [value] as IData;
  }
  return newList;
}

function pushEnch(tag as IData, newEnch as IData) as IData {
  var index = D_indexof(tag.ench, "id", newEnch.id);
  if (index != -1) {
    var found = tag.ench[index];
    found = found + {lvl: found.lvl + newEnch.lvl} as IData;

    return (tag - "ench") + {ench: D_replace(tag.ench, index, found)} as IData;
  }

  return tag + {ench: [newEnch] as IData};
}

function pushModifier(tag as IData, name as string, data as IData) as IData {

  var newData = data;
  var index = D_indexof(tag.Modifiers, "identifier", name);
  if (index != -1) {
    var found = tag.Modifiers[index];
    if(!isNull(found.current)) found = found + {current: (found.current + data.current)} as IData;
    if(!isNull(found.level  )) found = found + {level: (found.level   + data.level)} as IData;

    if (D(found).check("extraInfo"))
      found = found + {extraInfo: ((found.current.asInt() - 1) ~ " / " ~ found.max.asString()) as IData};

    return (tag - "Modifiers") + {Modifiers: D_replace(tag.Modifiers, index, found)} as IData;
  }

  // Add new tag
  return tag + {Modifiers: [newData + {identifier:name} as IData] as IData};
}


# -------------------------------
# Apply modifier
# -------------------------------
function addSingleModifier(_tag as IData, name as string) as IData {
  var tag = _tag;
  
  // Add modifier name in modifier list
  if(isNull(D_find(tag.TinkerData.Modifiers, null, name)))
    tag = tag + {TinkerData: {Modifiers: [name] as IData}} as IData;
  
  // Special cases for creative
  if (name == "creative") {
    tag = tag + {Stats: {FreeModifiers: (D(tag).getInt("Stats.FreeModifiers", 0) + 1) as IData}} as IData;
    tag = pushModifier(tag, name, {color:0,level:1});
  } else if (name != "soulbound" && name != "tconevo.artifact") {
    // Other except creative and soulbound
    tag = tag + {Stats: {FreeModifiers: max(0, D(tag).getInt("Stats.FreeModifiers", 0) - 1) as IData}} as IData;
    tag = tag + {TinkerData: {UsedModifiers: (D(tag).getInt("TinkerData.UsedModifiers", 0) + 1) as IData}} as IData;
  }

  if (name == "tconevo.artifact") {
    tag = pushModifier(tag, name, {color:14333039,level:1});
    tag = pushTrait(tag, name);
  }
  if (name == "soulbound") {
    tag = pushModifier(tag, name, {color:16120748});
  }
  if (name == "diamond") {
    tag = pushModifier(tag, name, {color:9237730});
    tag = tag + {Stats: {MiningSpeed: (tag.Stats.MiningSpeed.asFloat() + 0.5f) as IData}} as IData;
    tag = tag + {Stats: {Durability: (tag.Stats.Durability.asInt() + 500) as IData}} as IData;
    tag = tag + {Stats: {Attack: (tag.Stats.Attack.asFloat() + 1.0f) as IData}} as IData;
  }
  if (name == "emerald") {
    tag = pushModifier(tag, name, {color:4322180});
    tag = tag + {Stats: {Durability: (tag.Stats.Durability.asInt() + tag.StatsOriginal.Durability.asInt() / 2) as IData}} as IData;
  }
  if (name == "silktouch") {
    tag = pushModifier(tag, name, {color:16507531});
    tag = pushEnch(tag, {lvl:1,id:33});
    tag = tag + {Stats: {MiningSpeed: (tag.Stats.MiningSpeed.asFloat() / 2) as IData}} as IData;
    tag = tag + {Stats: {Attack: (tag.Stats.Attack.asFloat() / 2) as IData}} as IData;
  }
  if (name == "reinforced") {
    tag = pushModifier(tag, name, {color:5254787,level:1});
    tag = pushTrait(tag, name);
  }
  if (name == "beheading") {
    tag = pushModifier(tag, name, {color:1070923,level:1});
  }
  if (name == "haste") {
    tag = pushModifier(tag, name, {current:50,color:9502720,level:1,max:50,extraInfo:"49 / 50"});
    tag = tag + {Stats: {AttackSpeedMultiplier: (tag.Stats.AttackSpeedMultiplier.asFloat() + 0.2f) as IData}} as IData;
    tag = tag + {Stats: {MiningSpeed: (tag.Stats.MiningSpeed.asFloat() + 7.0f) as IData}} as IData;
  }
  if (name == "smite") {
    tag = pushModifier(tag, name, {current:24,color:15258880,level:1,max:24,extraInfo:"23 / 24"});
    tag = pushTrait(tag, name);
  }
  if (name == "necrotic") {
    tag = pushModifier(tag, name, {color:6160384,level:1});
    tag = pushTrait(tag, name);
  }
  if (name == "knockback") {
    tag = pushModifier(tag, name, {current:10,color:10461087,level:1,max:10,extraInfo:"9 / 10"});
    tag = pushTrait(tag, name);
  }
  if (name == "sharpness") {
    tag = pushModifier(tag, name, {current:72,color:16774902,level:1,max:72,extraInfo:"71 / 72"});
    tag = tag + {Stats: {Attack: (tag.Stats.Attack.asFloat() + 3.0f) as IData}} as IData;
  }
  if (name == "webbed") {
    tag = pushModifier(tag, name, {color:16777215,level:1});
    tag = pushTrait(tag, name);
  }
  if (name == "magicmushroom") {
    tag = pushModifier(tag, name, {color:5614830});
    tag = tag + {Stats: {HarvestLevel: (D(tag).getInt("Stats.HarvestLevel", 0) + 1) as IData}} as IData;
  }
  if (name == "mending_moss") {
    tag = pushModifier(tag, name, {color:4434738,level:1});
    tag = pushTrait(tag, name);
  }
  if (name == "shulking") {
    tag = pushModifier(tag, name, {current:50,color:11193599,level:1,max:50,extraInfo:"49 / 50"});
    tag = pushTrait(tag, name);
  }
  if (name == "glowing") {
    tag = pushModifier(tag, name, {color:16777130,level:1});
    tag = pushTrait(tag, name);
  }
  if (name == "harvestheight") {
    tag = pushModifier(tag, name, {color:13301410});
  }
  if (name == "harvestwidth") {
    tag = pushModifier(tag, name, {color:13301410});
  }
  if (name == "flame") {
    tag = pushModifier(tag, name, {current:1,color:11874311,level:1,max:1});
    tag = pushTrait(tag, name);
  }
  if (name == "frost") {
    tag = pushModifier(tag, name, {current:1,color:10743016,level:1,max:1});
    tag = pushTrait(tag, name);
  }
  if (name == "luck") {
    tag = pushModifier(tag, name, {current:60,color:2970082,level:1,max:60,modifierUsed:1,extraInfo:"59 / 60"});
    tag = pushEnch(tag, {lvl:1,id:21});
    tag = pushEnch(tag, {lvl:1,id:35});
    tag = pushTrait(tag, name);
  }

  if (name == "diamond_armor") {
    tag = tag + {Stats: {Toughness: tag.StatsOriginal.Toughness.asInt() + 2}} as IData;
    tag = tag + {Stats: {Durability: (tag.StatsOriginal.Durability.asInt() + 150) as IData}} as IData;
    tag = tag + {Stats: {Defense: (tag.StatsOriginal.Defense.asFloat() + 4.0f) as IData}} as IData;
    tag = pushModifier(tag, name, {color:9237730});
  }
  if (name == "emerald_armor") {
    tag = tag + {Stats: {Toughness: tag.StatsOriginal.Toughness.asInt() + 2}} as IData;
    tag = tag + {Stats: {Durability: (tag.StatsOriginal.Durability.asInt() + 32) as IData}} as IData;
    tag = pushModifier(tag, name, {color:4322180});
  }
  if (name == "reinforced_armor") {
    tag = pushModifier(tag, name, {color:5254787,level:1});
    tag = pushTrait(tag, name);
  }
  if (name == "parasitic_armor") {
    tag = pushModifier(tag, name, {color:6160384,level:1});
    tag = pushTrait(tag, name);
  }
  if (name == "mending_armor") {
    tag = pushModifier(tag, name, {color:4434738,level:1});
    tag = pushTrait(tag, name);
  }
  if (name == "sticky_armor") {
    tag = pushModifier(tag, name, {color:16777215,level:1});
    tag = pushTrait(tag, name);
  }
  if (name == "shulkerweight_armor") {
    tag = pushModifier(tag, name, {current:20,color:11193599,level:1,max:20,extraInfo:"19 / 20"});
    tag = pushTrait(tag, name);
  }
  if (name == "soulbound_armor") {
    tag = pushModifier(tag, name, {color:16120748});
  }
  if (name == "resistant_armor") {
    tag = pushModifier(tag, name, {color:16774902,level:1,modifierUsed:1});
    tag = pushTrait(tag, name);
  }
  if (name == "fire_resistant_armor") {
    tag = pushModifier(tag, name, {color:15375922,level:1,modifierUsed:1});
    tag = pushTrait(tag, name);
  }
  if (name == "projectile_resistant_armor") {
    tag = pushModifier(tag, name, {color:1070923,level:1,modifierUsed:1});
    tag = pushTrait(tag, name);
  }
  if (name == "blast_resistant_armor") {
    tag = pushModifier(tag, name, {color:8793389,level:1,modifierUsed:1});
    tag = pushTrait(tag, name);
  }
  if (name == "speedy_armor") {
    tag = pushModifier(tag, name, {current:50,color:9502720,level:1,max:50,extraInfo:"49 / 50"});
    tag = pushTrait(tag, name);
  }

  return tag;
}

function addModifier(_item as IItemStack, name as string) as IItemStack {
  if (isNull(name) || name == "") return _item;

  // Automatically add creative modifier if this modifier required slot
  var item = _item;
  if(name != "creative" && name != "soulbound") item = addModifier(item, "creative");

  return item.withTag(addSingleModifier(item.tag, name));
}

function constructTool(
  base as IItemStack,
  mat1 as string,
  mat2 as string,
  mat3 as string,
  mat4 as string,
  modifiers as string[] = null
) as IItemStack {
  var tool = mods.zentoolforge.Toolforge.buildTool(base.definition, [
    mods.zentoolforge.Toolforge.getMaterialFromID(mat1),
    mods.zentoolforge.Toolforge.getMaterialFromID(mat2),
    mods.zentoolforge.Toolforge.getMaterialFromID(mat3),
    mods.zentoolforge.Toolforge.getMaterialFromID(mat4),
  ]);
  if(!isNull(modifiers)) {
    for modif in modifiers {
      tool = addModifier(tool, modif);
    }
  }
  return tool;
}
