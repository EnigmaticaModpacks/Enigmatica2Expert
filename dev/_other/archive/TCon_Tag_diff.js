var _ = require('lodash')

/**
 * Deep diff between two object-likes
 * @param  {Object} fromObject the original object
 * @param  {Object} toObject   the updated object
 * @return {Object}            a new object which represents the diff
 */
function deepDiff(fromObject, toObject) {
  const changes = {}

  const buildPath = (path, obj, key) =>
    _.isUndefined(path) ? key : `${path}.${key}`

  const walk = (fromObject, toObject, path) => {
    // if (Array.isArray(fromObject)) fromObject.sort();
    // if (Array.isArray(toObject)) toObject.sort();

    if (Array.isArray(fromObject) && Array.isArray(toObject)) {
      var duplicates = fromObject.filter((val) =>
        toObject.find((o) => o != val)
      )
      // console.log('duplicates :>> ', duplicates);
      fromObject = fromObject.filter(
        (val) => !duplicates.find((o) => _.isEqual(o, val))
      )
      toObject = toObject.filter(
        (val) => !duplicates.find((o) => _.isEqual(o, val))
      )
      // console.log('fromObject :>> ', fromObject);
      // console.log('toObject :>> ', toObject);
    }

    for (const key of _.keys(fromObject)) {
      const currentPath = buildPath(path, fromObject, key)
      if (!_.has(toObject, key)) {
        changes[currentPath] = { from: _.get(fromObject, key) }
      }
    }

    for (const [key, to] of _.entries(toObject)) {
      const currentPath = buildPath(path, toObject, key)
      if (!_.has(fromObject, key)) {
        changes[currentPath] = { to }
      } else {
        const from = _.get(fromObject, key)
        if (!_.isEqual(from, to)) {
          if (_.isObjectLike(to) && _.isObjectLike(from)) {
            walk(from, to, currentPath)
          } else {
            changes[currentPath] = { from, to }
          }
        }
      }
    }
  }

  walk(fromObject, toObject)

  return changes
}

// mom I'm on lodash
_.mixin({ deepDiff })

var rootTag
function withTag(tag) {
  rootTag = rootTag || tag

  var diff = deepDiff(rootTag, tag)

  // console.log('diff :>> ', diff);
  var modifier = ((diff['Modifiers.0'] || {}).to || {}).identifier
  console.log(`if (modifier == "${modifier}") {`)
  for (const [k, v] of _.entries(diff)) {

    var s = ''
    var keys = `tag.${k}`
    if (v.from && v.to) {
      s = `(${keys}.asFloat() + ${v.to - v.from}f)`
    } else if (v.to && k.match(/^(.*?)\.\d+$/)) {
      keys = `tag.${k.match(/^(.*?)\.\d+$/)[1]}`
      s = `${keys} + [${JSON.stringify(v.to)}]`
    } else {
      s = `${JSON.stringify(v.to)}`
    }
    console.log(`  ${keys.padEnd(30)} = ${s} as IData;`)
  }
  console.log('}')
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////

// withTag({StatsOriginal: {Toughness: 0.0, FreeModifiers: 3, Durability: 64, Defense: 3.0}, Stats: {Toughness: 0.0, FreeModifiers: 3, Durability: 64, Defense: 3.0}, TinkerData: {Materials: ["wood", "wood", "wood"], Modifiers: []}, Modifiers: [{identifier: "ecological_armor", color: -7444965, level: 1}], Traits: ["ecological_armor"]})
// withTag({ench: [{lvl: 4, id: 21}, {lvl: 4, id: 35}], StatsOriginal: {AttackSpeedMultiplier: 1.0, MiningSpeed: 2.255, FreeModifiers: 3, Durability: 2, HarvestLevel: 1, Attack: 4.9825}, Stats: {AttackSpeedMultiplier: 1.0, MiningSpeed: 2.255, FreeModifiers: 0, Durability: 1, HarvestLevel: 1, Attack: 16.9825}, Special: {Categories: ["tool", "weapon"]}, TinkerData: {UsedModifiers: 12, Materials: ["stone", "paper", "stone", "stone"], Modifiers: ["beheading_cleaver", "sharpness", "luck", "beheading"]}, Traits: ["cheap", "writable2", "cheapskate", "luck"], Modifiers: [{identifier: "cheap", color: -6710887, level: 1}, {identifier: "writable", color: -1, level: 1, writable2: 1}, {identifier: "cheapskate", color: -6710887, level: 1}, {identifier: "beheading_cleaver", color: 1070923, level: 2}, {identifier: "sharpness", current: 288, color: 16774902, level: 4, max: 72, extraInfo: "287 / 72"}, {identifier: "luck", current: 240, color: 2970082, level: 4, max: 60, modifierUsed: 1, extraInfo: "239 / 60"}, {identifier: "beheading", color: 1070923, level: 4}]})
// withTag({ench: [{lvl: 1, id: 21}, {lvl: 1, id: 35}, {lvl: 1, id: 21}, {lvl: 1, id: 35}, {lvl: 1, id: 21}, {lvl: 1, id: 35}, {lvl: 1, id: 21}, {lvl: 1, id: 35}], StatsOriginal: {AttackSpeedMultiplier: 1.0, MiningSpeed: 3.05, FreeModifiers: 3, Durability: 484, HarvestLevel: 1, Attack: 9.5}, Stats: {AttackSpeedMultiplier: 1.0, MiningSpeed: 3.05, FreeModifiers: 0, Durability: 387, HarvestLevel: 1, Attack: 21.5}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 12, Materials: ["obsidian", "magmaslime", "stone", "stone"], Modifiers: ["beheading_cleaver", "sharpness", "luck", "beheading"]}, Traits: ["duritos", "superheat", "cheapskate", "cheap", "luck"], Modifiers: [{identifier: "duritos", color: -10478396, level: 1}, {identifier: "superheat", color: -27123, level: 1}, {identifier: "cheapskate", color: -6710887, level: 1}, {identifier: "cheap", color: -6710887, level: 1}, {identifier: "beheading_cleaver", color: 1070923, level: 2}, {identifier: "sharpness", current: 288, color: 16774902, level: 4, max: 72, extraInfo: "287 / 72"}, {identifier: "luck", current: 240, color: 2970082, level: 4, max: 60, modifierUsed: 1, extraInfo: "239 / 60"}, {identifier: "beheading", color: 1070923, level: 4}]})
// withTag({ench: [{lvl: 1, id: 21}, {lvl: 1, id: 35}, {lvl: 1, id: 21}, {lvl: 1, id: 35}, {lvl: 1, id: 21}, {lvl: 1, id: 35}, {lvl: 1, id: 21}, {lvl: 1, id: 35}], StatsOriginal: {AttackSpeedMultiplier: 1.0, MiningSpeed: 4.5, FreeModifiers: 3, Durability: 218, HarvestLevel: 1, Attack: 6.835}, Stats: {AttackSpeedMultiplier: 1.0, MiningSpeed: 4.5, FreeModifiers: 0, Durability: 174, HarvestLevel: 1, Attack: 18.835}, Special: {Categories: ["weapon", "tool"]}, TinkerData: {UsedModifiers: 12, Materials: ["slime", "stone", "flint", "stone"], Modifiers: ["beheading_cleaver", "sharpness", "luck", "beheading"]}, Traits: ["slimey_green", "cheapskate", "crude2", "cheap", "luck"], Modifiers: [{identifier: "slimey_green", color: -8206221, level: 1}, {identifier: "cheapskate", color: -6710887, level: 1}, {identifier: "crude", color: -9868951, level: 2, crude2: 1}, {identifier: "cheap", color: -6710887, level: 1}, {identifier: "beheading_cleaver", color: 1070923, level: 2}, {identifier: "sharpness", current: 288, color: 16774902, level: 4, max: 72, extraInfo: "287 / 72"}, {identifier: "luck", current: 240, color: 2970082, level: 4, max: 60, modifierUsed: 1, extraInfo: "239 / 60"}, {identifier: "beheading", color: 1070923, level: 4}]})
// withTag({StatsOriginal: {Toughness: 0.0, FreeModifiers: 3, Durability: 1, Defense: 0.5}, Stats: {Toughness: 0.0, FreeModifiers: 3, Durability: 1, Defense: 0.5}, TinkerData: {UsedModifiers: 2, Materials: ["paper", "stone", "cactus", "paper"], Modifiers: ["creative", "creative", "speedy_armor", "creative", "creative", "speedy_armor", "shulkerweight_armor"]}, Modifiers: [{identifier: "writable", color: -1, level: 1, writable2: 1}, {identifier: "cheap_armor", color: -6710887, level: 1}, {identifier: "spiny_armor", color: -16735985, level: 1}, {identifier: "creative", color: 0, level: 1}, {identifier: "speedy_armor", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}, {identifier: "shulkerweight_armor", current: 20, color: 11193599, level: 1, max: 20, extraInfo: "19 / 20"}], Traits: ["writable2", "cheap_armor", "spiny_armor", "speedy_armor", "shulkerweight_armor"]})
// withTag({StatsOriginal: {Toughness: 0.0, FreeModifiers: 3, Durability: 402, Defense: 5.3}, Stats: {Toughness: 0.0, FreeModifiers: 2, Durability: 402, Defense: 5.3}, TinkerData: {UsedModifiers: 2, Materials: ["netherrack", "cobalt", "netherrack", "slime"], Modifiers: ["creative", "creative", "projectile_resistant_armor", "creative", "creative", "projectile_resistant_armor", "speedy_armor"]}, Modifiers: [{identifier: "aridiculous_armor", color: -4698289, level: 1}, {identifier: "infernal_armor", color: -4698289, level: 1}, {identifier: "lightweight_armor", color: -14122284, level: 1}, {identifier: "creative", color: 0, level: 1}, {identifier: "projectile_resistant_armor", color: 1070923, level: 1, modifierUsed: 1}, {identifier: "speedy_armor", current: 50, color: 9502720, level: 1, max: 50, extraInfo: "49 / 50"}], Traits: ["aridiculous_armor", "infernal_armor", "lightweight_armor", "projectile_resistant_armor", "speedy_armor"]})
// withTag({StatsOriginal: {Toughness: 0.0, FreeModifiers: 3, Durability: 402, Defense: 5.3}, Stats: {Toughness: 0.0, FreeModifiers: 4, Durability: 402, Defense: 5.3}, TinkerData: {UsedModifiers: 3, Materials: ["netherrack", "cobalt", "netherrack", "slime"], Modifiers: ["creative", "creative", "projectile_resistant_armor", "creative", "creative", "projectile_resistant_armor", "speedy_armor"]}, Modifiers: [{identifier: "aridiculous_armor", color: -4698289, level: 1}, {identifier: "infernal_armor", color: -4698289, level: 1}, {identifier: "lightweight_armor", color: -14122284, level: 1}, {identifier: "creative", color: 0, level: 1}, {identifier: "projectile_resistant_armor", color: 1070923, level: 1, modifierUsed: 1}, {identifier: "speedy_armor", current: 64, color: 9502720, level: 2, max: 100, extraInfo: "63 / 100"}], Traits: ["aridiculous_armor", "infernal_armor", "lightweight_armor", "projectile_resistant_armor", "speedy_armor"]})