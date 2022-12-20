
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.recipes.IRecipeFunction;
import mods.ctutils.utils.Math.sqrt;


# Sadly, i didnt find dynamic solution to convert Potion_Name -> EffectName -> EffectId
/*Inject_js{
  const potionsRegnameTag = getCSV('config/tellme/potions-csv.csv')
.map(l=>[l['Registry name'], l['ID']])

const potions = []
const elixirNameID = new Map()

getCSV('config/tellme/potiontypes-csv.csv')
.filter(o=>o.Effects)
.map(o=>[
  o['Registry name'],
  o.Effects.match(/^.*Potion:\[reg:(.*?),.*$/)[1],
  eval(`({${ o.Effects.replace(/^.*?Potion:\[[^\]]*\],/, '') })`)
])
.forEach(([regName, reg, effect])=>{
  const found = potionsRegnameTag.find(([m])=>m===reg)
  if (!found) return

  // Push potion tags
  const pads = [3, 1, 4]
  potions.push(`  "${(regName+'"').padEnd(40)}: [${
    [found[1], effect.amplifier, effect.duration].map((v,i)=>v.toString().padStart(pads[i])).join(', ')
  }],`)

  // Push Elixir IDs
  elixirNameID.set(...found)
})

const blocks = [
  potions.sort((a,b)=>
    naturalSort(a.substr(44), b.substr(44))
  ).join('\n'),

  [...elixirNameID.entries()]
  .sort(([,a], [,b])=>a-b)
  .map(([name, id])=> `  "${(name+'"').padEnd(40)}: ${id},`)
  .join('\n')
]

return `static potNameTag as IData[string] = {
${blocks[0]}
} as IData[string];

static elixirNameId as int[string] = {
${blocks[1]}
} as int[string];`
}*/
static potNameTag as IData[string] = {
  "minecraft:swiftness"                    : [  1, 0, 3600],
  "minecraft:long_swiftness"               : [  1, 0, 9600],
  "minecraft:strong_swiftness"             : [  1, 1, 1800],
  "cofhcore:swiftness2+"                   : [  1, 1, 3200],
  "cofhcore:swiftness3"                    : [  1, 2,  900],
  "cofhcore:swiftness3+"                   : [  1, 2, 2400],
  "cofhcore:swiftness4"                    : [  1, 3,  720],
  "minecraft:slowness"                     : [  2, 0, 1800],
  "minecraft:long_slowness"                : [  2, 0, 4800],
  "cofhcore:haste"                         : [  3, 0, 3600],
  "cyclicmagic:haste"                      : [  3, 0, 3600],
  "potioncore:haste"                       : [  3, 0, 3600],
  "quark:haste"                            : [  3, 0, 3600],
  "cofhcore:haste+"                        : [  3, 0, 9600],
  "potioncore:long_haste"                  : [  3, 0, 9600],
  "quark:long_haste"                       : [  3, 0, 9600],
  "cofhcore:haste2"                        : [  3, 1, 1800],
  "cyclicmagic:haste2"                     : [  3, 1, 1800],
  "potioncore:strong_haste"                : [  3, 1, 1800],
  "quark:strong_haste"                     : [  3, 1, 1800],
  "cofhcore:haste2+"                       : [  3, 1, 3200],
  "cofhcore:haste3"                        : [  3, 2,  900],
  "cofhcore:haste3+"                       : [  3, 2, 2400],
  "cofhcore:haste4"                        : [  3, 3,  720],
  "potioncore:mining_fatigue"              : [  4, 0, 3600],
  "quark:mining_fatigue"                   : [  4, 0, 3600],
  "potioncore:long_mining_fatigue"         : [  4, 0, 9600],
  "quark:long_mining_fatigue"              : [  4, 0, 9600],
  "potioncore:strong_mining_fatigue"       : [  4, 1, 1800],
  "quark:strong_mining_fatigue"            : [  4, 1, 1800],
  "minecraft:strength"                     : [  5, 0, 3600],
  "minecraft:long_strength"                : [  5, 0, 9600],
  "minecraft:strong_strength"              : [  5, 1, 1800],
  "cofhcore:strength2+"                    : [  5, 1, 3200],
  "cofhcore:strength3"                     : [  5, 2,  900],
  "cofhcore:strength3+"                    : [  5, 2, 2400],
  "cofhcore:strength4"                     : [  5, 3,  720],
  "minecraft:healing"                      : [  6, 0,    1],
  "minecraft:strong_healing"               : [  6, 1,    1],
  "cofhcore:healing3"                      : [  6, 2,    1],
  "cofhcore:healing4"                      : [  6, 3,    1],
  "minecraft:harming"                      : [  7, 0,    1],
  "minecraft:strong_harming"               : [  7, 1,    1],
  "cofhcore:harming3"                      : [  7, 2,    1],
  "cofhcore:harming4"                      : [  7, 3,    1],
  "minecraft:leaping"                      : [  8, 0, 3600],
  "minecraft:long_leaping"                 : [  8, 0, 9600],
  "minecraft:strong_leaping"               : [  8, 1, 1800],
  "cofhcore:leaping2+"                     : [  8, 1, 3200],
  "cofhcore:leaping3"                      : [  8, 2,  900],
  "cofhcore:leaping3+"                     : [  8, 2, 2400],
  "cofhcore:leaping4"                      : [  8, 3,  720],
  "enderio:confusion"                      : [  9, 0,  900],
  "potioncore:nausea"                      : [  9, 0,  900],
  "potioncore:long_nausea"                 : [  9, 0, 1800],
  "enderio:long_confusion"                 : [  9, 0, 2400],
  "minecraft:regeneration"                 : [ 10, 0,  900],
  "minecraft:long_regeneration"            : [ 10, 0, 1800],
  "minecraft:strong_regeneration"          : [ 10, 1,  450],
  "cofhcore:regeneration2+"                : [ 10, 1,  600],
  "cofhcore:regeneration3"                 : [ 10, 2,  225],
  "cofhcore:regeneration3+"                : [ 10, 2,  450],
  "cofhcore:regeneration4"                 : [ 10, 3,  180],
  "cofhcore:resistance"                    : [ 11, 0, 3600],
  "cyclicmagic:resistance"                 : [ 11, 0, 3600],
  "potioncore:resistance"                  : [ 11, 0, 3600],
  "quark:resistance"                       : [ 11, 0, 3600],
  "cofhcore:resistance+"                   : [ 11, 0, 9600],
  "potioncore:long_resistance"             : [ 11, 0, 9600],
  "quark:long_resistance"                  : [ 11, 0, 9600],
  "cofhcore:resistance2"                   : [ 11, 1, 1800],
  "cyclicmagic:resistance2"                : [ 11, 1, 1800],
  "potioncore:strong_resistance"           : [ 11, 1, 1800],
  "quark:strong_resistance"                : [ 11, 1, 1800],
  "cofhcore:resistance2+"                  : [ 11, 1, 3200],
  "cofhcore:resistance3"                   : [ 11, 2,  900],
  "cofhcore:resistance3+"                  : [ 11, 2, 2400],
  "cofhcore:resistance4"                   : [ 11, 3,  720],
  "minecraft:fire_resistance"              : [ 12, 0, 3600],
  "minecraft:long_fire_resistance"         : [ 12, 0, 9600],
  "minecraft:water_breathing"              : [ 13, 0, 3600],
  "minecraft:long_water_breathing"         : [ 13, 0, 9600],
  "minecraft:invisibility"                 : [ 14, 0, 3600],
  "minecraft:long_invisibility"            : [ 14, 0, 9600],
  "potioncore:blindness"                   : [ 15, 0,  900],
  "potioncore:long_blindness"              : [ 15, 0, 1800],
  "cyclicmagic:blindness"                  : [ 15, 0, 3600],
  "potioncore:strong_blindness"            : [ 15, 1,  450],
  "minecraft:night_vision"                 : [ 16, 0, 3600],
  "minecraft:long_night_vision"            : [ 16, 0, 9600],
  "potioncore:hunger"                      : [ 17, 0,  900],
  "potioncore:long_hunger"                 : [ 17, 0, 1800],
  "cyclicmagic:hunger"                     : [ 17, 0, 3600],
  "potioncore:strong_hunger"               : [ 17, 1,  450],
  "minecraft:weakness"                     : [ 18, 0, 1800],
  "minecraft:long_weakness"                : [ 18, 0, 4800],
  "minecraft:poison"                       : [ 19, 0,  900],
  "minecraft:long_poison"                  : [ 19, 0, 1800],
  "minecraft:strong_poison"                : [ 19, 1,  432],
  "cofhcore:poison2+"                      : [ 19, 1,  600],
  "cofhcore:poison3"                       : [ 19, 2,  225],
  "cofhcore:poison3+"                      : [ 19, 2,  450],
  "cofhcore:poison4"                       : [ 19, 3,  180],
  "cofhcore:wither"                        : [ 20, 0,  900],
  "enderio:withering"                      : [ 20, 0,  900],
  "potioncore:wither"                      : [ 20, 0,  900],
  "cofhcore:wither+"                       : [ 20, 0, 1800],
  "potioncore:long_wither"                 : [ 20, 0, 1800],
  "enderio:long_withering"                 : [ 20, 0, 2400],
  "cyclicmagic:wither"                     : [ 20, 0, 3600],
  "cofhcore:wither2"                       : [ 20, 1,  450],
  "potioncore:strong_wither"               : [ 20, 1,  450],
  "cofhcore:wither2+"                      : [ 20, 1,  600],
  "cofhcore:wither3"                       : [ 20, 2,  225],
  "cofhcore:wither3+"                      : [ 20, 2,  450],
  "cofhcore:wither4"                       : [ 20, 3,  180],
  "potioncore:health_boost"                : [ 21, 0, 3600],
  "potioncore:long_health_boost"           : [ 21, 0, 9600],
  "potioncore:strong_health_boost"         : [ 21, 1, 1800],
  "cyclicmagic:healthboost"                : [ 21, 4, 3600],
  "cofhcore:absorption"                    : [ 22, 0, 3600],
  "potioncore:absorption"                  : [ 22, 0, 3600],
  "cofhcore:absorption+"                   : [ 22, 0, 9600],
  "potioncore:long_absorption"             : [ 22, 0, 9600],
  "cofhcore:absorption2"                   : [ 22, 1, 1800],
  "potioncore:strong_absorption"           : [ 22, 1, 1800],
  "cofhcore:absorption2+"                  : [ 22, 1, 3200],
  "cofhcore:absorption3"                   : [ 22, 2,  900],
  "cofhcore:absorption3+"                  : [ 22, 2, 2400],
  "cofhcore:absorption4"                   : [ 22, 3,  720],
  "potioncore:saturation"                  : [ 23, 3,    1],
  "potioncore:strong_saturation"           : [ 23, 7,    1],
  "potioncore:glowing"                     : [ 24, 0, 3600],
  "potioncore:long_glowing"                : [ 24, 0, 9600],
  "enderio:floating"                       : [ 25, 0,  140],
  "enderio:long_floating"                  : [ 25, 0,  560],
  "potioncore:levitation"                  : [ 25, 0,  600],
  "potioncore:long_levitation"             : [ 25, 0, 1200],
  "cofhcore:levitation"                    : [ 25, 0, 3600],
  "cyclicmagic:levitation"                 : [ 25, 0, 3600],
  "cofhcore:levitation+"                   : [ 25, 0, 9600],
  "potioncore:strong_levitation"           : [ 25, 1,  300],
  "enderio:strong_floating"                : [ 25, 2,  140],
  "cofhcore:luck"                          : [ 26, 0, 3600],
  "minecraft:luck"                         : [ 26, 0, 6000],
  "cofhcore:luck+"                         : [ 26, 0, 9600],
  "cofhcore:luck2"                         : [ 26, 1, 1800],
  "cofhcore:luck2+"                        : [ 26, 1, 3200],
  "cofhcore:luck3"                         : [ 26, 2,  900],
  "cofhcore:luck3+"                        : [ 26, 2, 2400],
  "cofhcore:luck4"                         : [ 26, 3,  720],
  "cofhcore:unluck"                        : [ 27, 0, 1800],
  "cofhcore:unluck+"                       : [ 27, 0, 4800],
  "potioncore:unluck"                      : [ 27, 0, 6000],
  "cofhcore:unluck2"                       : [ 27, 1,  900],
  "cofhcore:unluck2+"                      : [ 27, 1, 1600],
  "cofhcore:unluck3"                       : [ 27, 2,  450],
  "cofhcore:unluck3+"                      : [ 27, 2, 1200],
  "cofhcore:unluck4"                       : [ 27, 3,  360],
  "randomthings:collapse"                  : [ 34, 0,  450],
  "randomthings:long_collapse"             : [ 34, 0,  900],
  "randomthings:strong_collapse"           : [ 34, 1,  300],
  "quark:resilience"                       : [101, 0, 3600],
  "quark:long_resilience"                  : [101, 0, 9600],
  "quark:strong_resilience"                : [101, 1, 1800],
  "quark:danger_sight"                     : [103, 0, 3600],
  "quark:long_danger_sight"                : [103, 0, 9600],
  "potioncore:love"                        : [104, 0,    1],
  "potioncore:repair"                      : [105, 0, 3600],
  "potioncore:long_repair"                 : [105, 0, 9600],
  "potioncore:strong_repair"               : [105, 1, 1800],
  "potioncore:flight"                      : [106, 0, 3600],
  "potioncore:long_flight"                 : [106, 0, 9600],
  "potioncore:recoil"                      : [107, 0, 3600],
  "potioncore:long_recoil"                 : [107, 0, 9600],
  "potioncore:strong_recoil"               : [107, 1, 1800],
  "potioncore:broken_magic_shield"         : [108, 0,  900],
  "potioncore:long_broken_magic_shield"    : [108, 0, 1800],
  "potioncore:strong_broken_magic_shield"  : [108, 1,  450],
  "potioncore:iron_skin"                   : [109, 0, 3600],
  "potioncore:long_iron_skin"              : [109, 0, 9600],
  "potioncore:strong_iron_skin"            : [109, 1, 1800],
  "potioncore:purity"                      : [110, 0, 3600],
  "potioncore:long_purity"                 : [110, 0, 9600],
  "potioncore:reach"                       : [111, 0, 3600],
  "potioncore:long_reach"                  : [111, 0, 9600],
  "potioncore:strong_reach"                : [111, 1, 1800],
  "potioncore:diamond_skin"                : [112, 0, 3600],
  "potioncore:long_diamond_skin"           : [112, 0, 9600],
  "potioncore:strong_diamond_skin"         : [112, 1, 1800],
  "potioncore:teleport"                    : [113, 0,    1],
  "potioncore:strong_teleport"             : [113, 1,    1],
  "potioncore:teleport_surface"            : [114, 0,    1],
  "potioncore:magic_focus"                 : [115, 0, 3600],
  "potioncore:long_magic_focus"            : [115, 0, 9600],
  "potioncore:strong_magic_focus"          : [115, 1, 1800],
  "potioncore:cure"                        : [116, 0,    1],
  "potioncore:step_up"                     : [117, 0, 3600],
  "potioncore:long_step_up"                : [117, 0, 9600],
  "potioncore:strong_step_up"              : [117, 1, 1800],
  "potioncore:drown"                       : [118, 0, 3600],
  "potioncore:long_drown"                  : [118, 0, 9600],
  "potioncore:teleport_spawn"              : [119, 0,  600],
  "potioncore:disorganization"             : [120, 0,    1],
  "potioncore:climb"                       : [121, 0, 3600],
  "potioncore:long_climb"                  : [121, 0, 9600],
  "potioncore:perplexity"                  : [122, 0, 3600],
  "potioncore:long_perplexity"             : [122, 0, 9600],
  "potioncore:rust"                        : [123, 0, 3600],
  "potioncore:long_rust"                   : [123, 0, 9600],
  "potioncore:strong_rust"                 : [123, 1, 1800],
  "potioncore:vulnerable"                  : [124, 0, 3600],
  "potioncore:long_vulnerable"             : [124, 0, 9600],
  "potioncore:strong_vulnerable"           : [124, 1, 1800],
  "potioncore:explode"                     : [125, 0,    1],
  "potioncore:strong_explode"              : [125, 1,    1],
  "potioncore:solid_core"                  : [126, 0, 3600],
  "potioncore:long_solid_core"             : [126, 0, 9600],
  "potioncore:fire"                        : [127, 0,    1],
  "potioncore:strong_fire"                 : [127, 1,    1],
  "potioncore:lightning"                   : [128, 0,    1],
  "potioncore:magic_inhibition"            : [129, 0, 3600],
  "potioncore:long_magic_inhibition"       : [129, 0, 9600],
  "potioncore:strong_magic_inhibition"     : [129, 1, 1800],
  "potioncore:chance"                      : [130, 0,    1],
  "potioncore:strong_chance"               : [130, 1,    1],
  "potioncore:invert"                      : [131, 0,    1],
  "potioncore:weight"                      : [132, 0, 3600],
  "potioncore:long_weight"                 : [132, 0, 9600],
  "potioncore:strong_weight"               : [132, 1, 1800],
  "potioncore:launch"                      : [133, 0,    1],
  "potioncore:strong_launch"               : [133, 1,    1],
  "potioncore:dispel"                      : [134, 0,    1],
  "potioncore:revival"                     : [135, 0, 3600],
  "potioncore:long_revival"                : [135, 0, 9600],
  "potioncore:strong_revival"              : [135, 1, 1800],
  "potioncore:klutz"                       : [136, 0, 3600],
  "potioncore:long_klutz"                  : [136, 0, 9600],
  "potioncore:strong_klutz"                : [136, 1, 1800],
  "potioncore:bless"                       : [137, 0,    1],
  "potioncore:strong_bless"                : [137, 1,    1],
  "potioncore:broken_armor"                : [138, 0,  900],
  "potioncore:long_broken_armor"           : [138, 0, 1800],
  "potioncore:strong_broken_armor"         : [138, 1,  450],
  "potioncore:magic_shield"                : [139, 0, 3600],
  "potioncore:long_magic_shield"           : [139, 0, 9600],
  "potioncore:strong_magic_shield"         : [139, 1, 1800],
  "potioncore:slow_fall"                   : [140, 0, 3600],
  "potioncore:long_slow_fall"              : [140, 0, 9600],
  "potioncore:strong_slow_fall"            : [140, 1, 1800],
  "potioncore:antidote"                    : [141, 0, 3600],
  "potioncore:long_antidote"               : [141, 0, 9600],
  "potioncore:spin"                        : [142, 0,  900],
  "potioncore:long_spin"                   : [142, 0, 1800],
  "potioncore:strong_spin"                 : [142, 1,  450],
  "potioncore:curse"                       : [143, 0,    1],
  "potioncore:strong_curse"                : [143, 1,    1],
  "potioncore:burst"                       : [144, 0,    1],
  "potioncore:strong_burst"                : [144, 1,    1],
  "potioncore:archery"                     : [145, 0, 3600],
  "potioncore:long_archery"                : [145, 0, 9600],
  "potioncore:strong_archery"              : [145, 1, 1800],
  "cyclicmagic:magnet"                     : [149, 0, 3600],
  "cyclicmagic:ender"                      : [150, 0, 3600],
  "cyclicmagic:waterwalk"                  : [151, 0, 3600],
  "cyclicmagic:slowfall"                   : [152, 0, 3600],
  "cyclicmagic:snow"                       : [153, 0, 3600],
  "cyclicmagic:swim"                       : [154, 0, 3600],
  "cyclicmagic:swim2"                      : [154, 1, 1800],
  "cyclicmagic:bounce"                     : [155, 0, 3600],
  "cyclicmagic:frostwalker"                : [156, 0, 3600],
  "cyclicmagic:butter"                     : [157, 0, 3600],
  "cyclicmagic:butter2"                    : [157, 1, 1800],
  "cyclicmagic:saturation"                 : [159, 0, 3600],
  "extrautils2:xu2.doom"                   : [176, 0, 1200],
  "extrautils2:xu2.gravity"                : [177, 0, 1200],
  "extrautils2:xu2.gravity.long"           : [177, 0, 9600],
  "extrautils2:xu2.second.chance"          : [178, 0, 2400],
  "extrautils2:xu2.greek.fire"             : [179, 0, 2400],
  "extrautils2:xu2.fizzy.lifting"          : [180, 0,  600],
  "extrautils2:xu2.relapse"                : [181, 0, 9600],
  "extrautils2:xu2.love"                   : [182, 0,  200],
  "extrautils2:xu2.purging"                : [183, 0,    0],
} as IData[string];

static elixirNameId as int[string] = {
  "minecraft:speed"                        : 1,
  "minecraft:slowness"                     : 2,
  "minecraft:haste"                        : 3,
  "minecraft:mining_fatigue"               : 4,
  "minecraft:strength"                     : 5,
  "minecraft:instant_health"               : 6,
  "minecraft:instant_damage"               : 7,
  "minecraft:jump_boost"                   : 8,
  "minecraft:nausea"                       : 9,
  "minecraft:regeneration"                 : 10,
  "minecraft:resistance"                   : 11,
  "minecraft:fire_resistance"              : 12,
  "minecraft:water_breathing"              : 13,
  "minecraft:invisibility"                 : 14,
  "minecraft:blindness"                    : 15,
  "minecraft:night_vision"                 : 16,
  "minecraft:hunger"                       : 17,
  "minecraft:weakness"                     : 18,
  "minecraft:poison"                       : 19,
  "minecraft:wither"                       : 20,
  "minecraft:health_boost"                 : 21,
  "minecraft:absorption"                   : 22,
  "minecraft:saturation"                   : 23,
  "minecraft:glowing"                      : 24,
  "minecraft:levitation"                   : 25,
  "minecraft:luck"                         : 26,
  "minecraft:unluck"                       : 27,
  "randomthings:collapse"                  : 34,
  "quark:resilience"                       : 101,
  "quark:danger_sight"                     : 103,
  "potioncore:love"                        : 104,
  "potioncore:repair"                      : 105,
  "potioncore:flight"                      : 106,
  "potioncore:recoil"                      : 107,
  "potioncore:broken_magic_shield"         : 108,
  "potioncore:iron_skin"                   : 109,
  "potioncore:purity"                      : 110,
  "potioncore:reach"                       : 111,
  "potioncore:diamond_skin"                : 112,
  "potioncore:teleport"                    : 113,
  "potioncore:teleport_surface"            : 114,
  "potioncore:magic_focus"                 : 115,
  "potioncore:cure"                        : 116,
  "potioncore:step_up"                     : 117,
  "potioncore:drown"                       : 118,
  "potioncore:teleport_spawn"              : 119,
  "potioncore:disorganization"             : 120,
  "potioncore:climb"                       : 121,
  "potioncore:perplexity"                  : 122,
  "potioncore:rust"                        : 123,
  "potioncore:vulnerable"                  : 124,
  "potioncore:explode"                     : 125,
  "potioncore:solid_core"                  : 126,
  "potioncore:fire"                        : 127,
  "potioncore:lightning"                   : 128,
  "potioncore:magic_inhibition"            : 129,
  "potioncore:chance"                      : 130,
  "potioncore:invert"                      : 131,
  "potioncore:weight"                      : 132,
  "potioncore:launch"                      : 133,
  "potioncore:dispel"                      : 134,
  "potioncore:revival"                     : 135,
  "potioncore:klutz"                       : 136,
  "potioncore:bless"                       : 137,
  "potioncore:broken_armor"                : 138,
  "potioncore:magic_shield"                : 139,
  "potioncore:slow_fall"                   : 140,
  "potioncore:antidote"                    : 141,
  "potioncore:spin"                        : 142,
  "potioncore:curse"                       : 143,
  "potioncore:burst"                       : 144,
  "potioncore:archery"                     : 145,
  "cyclicmagic:potion.magnet"              : 149,
  "cyclicmagic:potion.ender"               : 150,
  "cyclicmagic:potion.waterwalk"           : 151,
  "cyclicmagic:potion.slowfall"            : 152,
  "cyclicmagic:potion.snow"                : 153,
  "cyclicmagic:potion.swimspeed"           : 154,
  "cyclicmagic:potion.bounce"              : 155,
  "cyclicmagic:potion.frostwalker"         : 156,
  "cyclicmagic:potion.butter"              : 157,
  "cyclicmagic:potion.saturation"          : 159,
  "extrautils2:effect.xu2.doom"            : 176,
  "extrautils2:effect.xu2.gravity"         : 177,
  "extrautils2:effect.xu2.second.chance"   : 178,
  "extrautils2:effect.xu2.greek.fire"      : 179,
  "extrautils2:effect.xu2.fizzy.lifting"   : 180,
  "extrautils2:effect.xu2.relapse"         : 181,
  "extrautils2:effect.xu2.love"            : 182,
  "extrautils2:effect.xu2.purging"         : 183,
} as int[string];
/**/


# Convert Rustic's ElixirEffect entry into CustomPotionEffects entry (for Vanilla or BloodMagic potions)
#  by replacing "Effect" tag to "Id"
static convertElixir as function(IData)IData = function (elixirEffect as IData) as IData {

  var newData = elixirEffect as IData;
  var effect = D(newData).getString("Effect");
  if(!isNull(effect) && elixirNameId has effect) {
    newData = newData - "Effect";
    newData = newData + {Id: elixirNameId[effect] as int} as IData;
  }
  return newData;
};


# ######################################################################
#
# Combining function
#
# ######################################################################

static durationFnc as function(int)int = function (x as int) as int {
  val d = x as double;
  return min(2147483646.0d,  d * 10.0d) as int;
};
static amplifierFnc as function(int)int = function (x as int) as int {
  val d = x as double;
  return min(127, max(1, 50.0d / (d + 10.0d)));
};

# This function evaluates for each of 4 types of crafts:
# 1. Combining vanilla potions into one
# 2. Increase duration on Rustic's Elixirs
# 3. Increase potency of Blood Magic's Flasks
# 4. Combining any type of potions into one, taking maximum of durations and potencys
static potionFunction as IRecipeFunction = function(out, ins, cInfo) {

  # DataList with CustomPotionEffects
  var compoundTags = [] as IData;

  # What kind of recipe is this
  val isLong   = !isNull(D(out.tag).get("PotionLong"));
  val isStrong = !isNull(D(out.tag).get("PotionStrong"));
  val isOMega  = !isNull(D(out.tag).get("PotionOMEGA"));

  # Maximums. Used only for OMega potion
  var maxDuration  as int = 1;
  var maxAmplifier as int = 0;

  # Iterate over all marked items to extract potion Effects
  for m, marked in ins {

    # Try to get elixir data
    val mTag = D(marked.tag);
    var eData = mTag.get("ElixirEffects");

    # Try to get Flask or Vanilla combined data
    if (isNull(eData)) eData = mTag.get("CustomPotionEffects");

    # Try to get vanilla-like potion name
    if (isNull(eData)) {
      eData = mTag.get("Potion");

      # Still No data -> continue next marked item
      if (isNull(eData)) break;

      # Get Potion Effect IData 
      var potEffect = potNameTag[eData.asString()];

      # No potion name or no NBT in this potion (for example Mundane)
      if (isNull(potEffect)) break;

      # Rewrite eData to list
      eData = [{Id: potEffect[0] as int, Amplifier: potEffect[1] as int, Duration: potEffect[2] as int}] as IData;
    }

    # Loop over each potion effects in list to amplify it
    # Also calculate maximums for OMega potion
    for i in 0 to eData.length {
      val effect = eData[i];
      var oldDuration  = D(effect).getInt("Duration", 1);
      val oldAmplifier = D(effect).getInt("Amplifier",0);
      var newDuration  = isLong   ? durationFnc(oldDuration)   : oldDuration;
      var newAmplifier = isStrong ? amplifierFnc(oldAmplifier) : oldAmplifier;
      maxDuration  = max(maxDuration,  newDuration);
      maxAmplifier = max(maxAmplifier, newAmplifier);
      compoundTags = compoundTags + [effect + {Duration: newDuration} as IData + {Amplifier: newAmplifier} as IData] as IData;
    }
  } # End of marked iterator

  # We didnt found any actual potions. Craft is futile
  if(compoundTags.length == 0) return null;

  # Merge list to prevent potion effect duplicates
  # Haste II 3:00 + Haste 8:00 => Haste II 8:00
  var mergedList = [] as IData;
  var skipIndexes = [] as int[];
  for i in 0 to compoundTags.length {
    if (!(skipIndexes has i)) {
      var a = compoundTags[i];

      # Swap effect name to effect ID if we convert Elixir to Flask
      if (!isLong) a = convertElixir(a);

      # New effect with all changes
      var newEffect = a;
      
      # Iterate other effects in dataList
      if (i+1 < compoundTags.length) {
        for j in (i+1) to compoundTags.length {
          val b = compoundTags[j];

          # We found effect with same Id
          if (a.Id == b.Id) {
            skipIndexes = skipIndexes + j;
            newEffect = newEffect + {Amplifier: max(a.Amplifier, b.Amplifier)} as IData;
            newEffect = newEffect + { Duration: max(a.Duration , b.Duration )} as IData;
          }
        }
      }

      if(isOMega){
        mergedList = mergedList + [newEffect + {Duration: maxDuration} as IData + {Amplifier: maxAmplifier} as IData] as IData;
      } else {
        mergedList = mergedList + [newEffect] as IData;
      }

    }
  }

  # Clear output lore
  var newTag = out.tag - {display:{Lore:""}} as IData;

  if (out.definition.id == "rustic:elixir") {
    return out.withTag((newTag - "ElixirEffects"      ) + {ElixirEffects: mergedList});
  } else {
    return out.withTag((newTag - "CustomPotionEffects") + {CustomPotionEffects: mergedList});
  }

} as IRecipeFunction;


function advancedBrew(
    grid as IIngredient[][], # Shaped recipe ingredients
    output as IItemStack     # Output potion (used in JEI recipe, uotput tag is changed)
  ) { 
  
  recipes.addShaped(output, grid, potionFunction);
  mods.jei.JEI.addItem(output);
}

# ######################################################################
#
# Potion combining recipe
#
# ######################################################################

val potCombined = <minecraft:potion>.withTag(
  {
    PotionCombined: 1,
    
    CustomPotionColor:327691,
    display:{Name:"§dCombo Potion"},

    CustomPotionEffects:[
      {
        Id:1,Amplifier:0,Duration:600
      },{
        Id:2,Amplifier:0,Duration:600
      }
    ]
  } as IData + utils.shinigTag(327880)
);
var anyCombined = potCombined | <minecraft:potion:*>;

# [Combo Potion] from [Crucible][+4]
advancedBrew(Grid(["pretty",
    "B ◊ B",
    "M ⱋ M",
    "C r C"], {
    "B": <thaumcraft:bottle_taint>,           # Bottle of Taint
    "r": <thaumcraft:crucible>.reuse(),       # Crucible
    "C": <cyclicmagic:crystallized_obsidian>, # Crystallized Obsidian
    "M": <randomthings:beans:2>,              # Magic Bean
    "◊": anyCombined.marked("m1"),
    "ⱋ": anyCombined.marked("m2"),
  }).shaped(),
  potCombined.withLore(["Combination of 2 potions with same effects and durations"])
);

# ######################################################################
#
# Long Elixir
#
# ######################################################################

val potLong = <rustic:elixir>.withTag(
  {
    PotionLong: 1,

    display:{Name:"§aLong Elixir"},

    ElixirEffects:[
      {
        Effect: "minecraft:speed", Duration: (20*60*60*24), Amplifier: 0
      }
    ]
  } as IData + utils.shinigTag(2720000)
);
var anyLong = <rustic:elixir:*> | potLong;

# generate all possible brews
var anyBrew as IIngredient = <rustic:fluid_bottle>.withTag({Fluid:{FluidName:"wine",Amount:1000,Tag:{Quality:1.0f}}});

for item in itemUtils.getItemsByRegexRegistryName("rustic:fluid_bottle") {
	if (D(item.tag).check("Fluid.Tag.Quality")) { anyBrew |= item.withTag( item.tag + {Fluid:{Tag:{Quality:1.0f}}} ); }
}

# [Long Elixir] from [Elixir of Instant Health][+5]
advancedBrew(Grid(["pretty",
    "B o B",
    "‚ E ‚",
    "M C M"], {
    "C": <thaumcraft:crucible>.reuse(),  # Crucible
    "‚": <ore:nuggetTerrasteel>,         # Terrasteel Nugget
    "M": <twilightforest:moonworm>,      # Moonworm
    "o": <cookingforblockheads:cow_jar>, # Cow in a Jar
    "E": anyLong.marked("m1"),           # Elixir of Instant Health
    "B": anyBrew, # Bottle of Wine
  }).shaped(),
  potLong.withLore(["Increase duration of potion x10"])
);

# ######################################################################
#
# Strong potion
#
# ######################################################################

val potStrong = <bloodmagic:potion_flask>.withTag(
  {
    PotionStrong: 1,

    CustomPotionColor:27294,
    display:{Name:"§3Strong Potion"},

    CustomPotionEffects: [
      { Id: 1 as byte, Duration: 2400, Amplifier: 5 as byte }
    ]
  } as IData + utils.shinigTag(831714)
);

var anyStrong = potStrong | <bloodmagic:potion_flask>.withTag({CustomPotionEffects:[]}, false);

# generate all possible Botania brewFlasks
var anyBrewFlask as IIngredient = null;
for item in loadedMods["botania"].items {
	val defId = item.definition.id;
	if (defId.startsWith("botania:brewflask")) {
		if (isNull(anyBrewFlask)) {
			anyBrewFlask = item;
		} else {
			anyBrewFlask |= item;
		}
	}
}

# [Strong Potion] from [Potion Flask][+5]
advancedBrew(Grid(["pretty",
    "* F *",
    "P o P",
    "E C E"], {
    "P": <avaritia:resource:2>,             # Pile of Neutrons
    "C": <thaumcraft:crucible>.reuse(),     # Crucible
    "E": <thaumictinkerer:energetic_nitor>, # Energetic Nitor
    "*": <ore:crystalAethium>,              # Aethium Crystal
    "o": anyStrong.marked("m1"),            # Potion Flask
    "F": anyBrewFlask,                      # Flask of Revitalization (6)
  }).shaped(),
  potStrong.withLore(["Combination of all 5 Flask's effects with level X"])
);

# ######################################################################
#
# OMEGA potion
#
# ######################################################################


val potOMEGA = <bloodmagic:potion_flask>.withTag(
  {
    PotionOMEGA: 1,

    display:{Name:"§eOMEGA Potion"},

    CustomPotionEffects: [
      { Id: 1 as byte, Duration: 2400, Amplifier: 5 as byte }
    ]
  } as IData + utils.shinigTag(15326208)
);

advancedBrew(Grid(["pretty",
    "§ n §",
    "ⱋ ◊ ◘",
    "U C U"], {
    "C": <thaumcraft:crucible>.reuse(),  # Crucible
    "U": <avaritia:ultimate_stew>,       # Ultimate Stew
    "§": <deepmoblearning:glitch_heart>, # Corrupted Glitch Heart
    "n": <avaritia:endest_pearl>,        # Endest Pearl
    "◘": anyStrong.marked("potStrong"),
    "◊": anyLong.marked("potLong"),
    "ⱋ": anyCombined.marked("potCombined"),
  }).shaped(),
  potOMEGA.withLore(["Combination of §dAll 3 bottles Effects, §aMaximum duration, §3Maximum potency"])
);
