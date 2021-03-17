#priority 10

import crafttweaker.data.IData;
import mods.zentoolforge.Toolforge;

# ######################################################################
#
# Data
#
# ######################################################################
val defaultArmorMats as IData = [
  "paper"                  , # 18
  "chocolate"              , # 19
  "wood"                   , # 21
  "stone"                  , # 22
  "netherrack"             , # 22
  "apatite"                , # 23
  "ma.prosperity"          , # 23
  "void_crystal"           , # 23
  "polyethylene"           , # 24
  "livingwood"             , # 24
  "dreamwood"              , # 25
  "heavy"                  , # 25
  "construction_alloy"     , # 25
  "flint"                  , # 25
  "tin"                    , # 25
  "rubber"                 , # 26
  "palis_crystal"          , # 26
  "aluminium"              , # 27
  "restonia_crystal"       , # 27
  "electrum"               , # 27
  "cactus"                 , # 28
  "constantan"             , # 28
  "aquamarine"             , # 28
  "treatedwood"            , # 28
  "sky_stone"              , # 28
  "copper"                 , # 29
  "essence_metal"          , # 29
  "xu_magical_wood"        , # 29
  "nickel"                 , # 30
  "firewood"               , # 30
  "magnesium"              , # 30
  "litherite"              , # 30
  "certus_quartz"          , # 30
  "bone"                   , # 30
  "iron"                   , # 30
  "livingrock"             , # 30
  "fluix"                  , # 31
  "endstone"               , # 31
  "erodium"                , # 31
  "manasteel"              , # 31
  "black_quartz"           , # 32
  "universal_metal"        , # 32
  "uranium"                , # 32
  "mica"                   , # 32
  "elementium"             , # 33
  "enori_crystal"          , # 33
  "thorium"                , # 34
  "osmium"                 , # 35
  "invar"                  , # 35
  "meat_metal"             , # 35
  "kyronite"               , # 36
  "prismarine"             , # 36
  "energetic_metal"        , # 36
  "osgloglas"              , # 36
  "void_metal"             , # 36
  "sentient_metal"         , # 36
  "bronze"                 , # 37
  "refined_glowstone"      , # 37
  "draconium"              , # 37
  "lead"                   , # 37
  "pigiron"                , # 37
  "cobalt"                 , # 37
  "electrical_steel"       , # 38
  "blueslime"              , # 38
  "redstone_alloy"         , # 38
  "slime"                  , # 39
  "primal_metal"           , # 40
  "magmaslime"             , # 40
  "boron"                  , # 41
  "knightslime"            , # 41
  "leatherfrosttroll"      , # 41
  "leatherforesttroll"     , # 41
  "leathermountaintroll"   , # 41
  "chitintandeathworm"     , # 42
  "chitinwhitedeathworm"   , # 42
  "chitinbrowndeathworm"   , # 42
  "pladium"                , # 42
  "silver"                 , # 42
  "cheese"                 , # 42
  "conductive_iron"        , # 43
  "fluix_steel"            , # 43
  "ma.base_essence"        , # 43
  "obsidian"               , # 44
  "xu_enchanted_metal"     , # 44
  "ma.soulium"             , # 44
  "carbon_fiber"           , # 44
  "hard_carbon"            , # 44
  "platinum"               , # 45
  "signalum"               , # 45
  "alumite"                , # 45
  "sapphire"               , # 45
  "ruby"                   , # 45
  "peridot"                , # 45
  "lonsdaleite"            , # 45
  "xu_demonic_metal"       , # 46
  "nagascale"              , # 46
  "pink_slime"             , # 46
  "refined_obsidian"       , # 46
  "lumium"                 , # 47
  "psimetal"               , # 48
  "psigem"                 , # 48
  "diamantine_crystal"     , # 48
  "fluxed_electrum"        , # 48
  "emerald_plustic"        , # 48
  "advanced_alloy"         , # 50
  "thaumium"               , # 50
  "manyullyn"              , # 50
  "ardite"                 , # 51
  "iridium"                , # 51
  "malachite_gem"          , # 51
  "tough"                  , # 51
  "ionite"                 , # 52
  "pink_metal"             , # 54
  "topaz"                  , # 54
  "tanzanite"              , # 54
  "steeleaf"               , # 55
  "pulsating_iron"         , # 55
  "desert_myrmex"          , # 56
  "jungle_myrmex"          , # 56
  "amber"                  , # 56
  "emeraldic_crystal"      , # 56
  "ma.inferium"            , # 56
  "enderium"               , # 56
  "bound_metal"            , # 57
  "vibrant_alloy"          , # 57
  "flux_crystal"           , # 57
  "crystal_matrix"         , # 58
  "steel"                  , # 58
  "dragonbone"             , # 59
  "scalebronzedragon"      , # 60
  "scalewhitedragon"       , # 60
  "scalegraydragon"        , # 60
  "scalesapphiredragon"    , # 60
  "scalebluedragon"        , # 60
  "scalegreendragon"       , # 60
  "scalereddragon"         , # 60
  "scalesilverdragon"      , # 60
  "scaleblueseaserpent"    , # 61
  "scalepurpleseaserpent"  , # 61
  "scaletealseaserpent"    , # 61
  "scalebronzeseaserpent"  , # 61
  "scaledeepblueseaserpent", # 61
  "scaleredseaserpent"     , # 61
  "scalegreenseaserpent"   , # 61
  "sponge"                 , # 62
  "plague_metal"           , # 63
  "titanium"               , # 67
  "xu_evil_metal"          , # 68
  "aethium"                , # 69
  "starmetal"              , # 71
  "ma.prudentium"          , # 73
  "mirion"                 , # 75
  "energetic_alloy"        , # 75
  "boron_nitride"          , # 76
  "end_steel"              , # 77
  "terrasteel"             , # 77
  "fierymetal"             , # 78
  "osmiridium"             , # 84
  "dark_steel"             , # 86
  "amethyst"               , # 87
  "knightmetal"            , # 96
  "wyvern_metal"           , # 97
  "ma.intermedium"         , # 98
  "weezer"                 , # 101
  "dragonsteel_fire"       , # 114
  "dragonsteel_ice"        , # 114
  "soularium"              , # 123
  "ma.superium"            , # 124
  "ma.supremium"           , # 138
  "draconic_metal"         , # 208
  "neutronium"             , # 347
  "chaotic_metal"          , # 570
  "infinity_metal"         , # 1535
] as IData;


val defaultWeaponMats as IData = [
  "paper"                  , # 21
  "stone"                  , # 30
  "rubber"                 , # 37
  "construction_alloy"     , # 41
  "wood"                   , # 42
  "chocolate"              , # 47
  "flint"                  , # 49
  "xu_magical_wood"        , # 57
  "certus_quartz"          , # 59
  "ma.prosperity"          , # 61
  "cactus"                 , # 62
  "apatite"                , # 63
  "aquamarine"             , # 64
  "polyethylene"           , # 64
  "netherrack"             , # 66
  "livingrock"             , # 66
  "tin"                    , # 67
  "bone"                   , # 71
  "dragonbone"             , # 73
  "blueslime"              , # 75
  "tanzanite"              , # 75
  "endstone"               , # 77
  "prismarine"             , # 80
  "sponge"                 , # 81
  "slime"                  , # 81
  "treatedwood"            , # 82
  "magmaslime"             , # 85
  "livingwood"             , # 86
  "copper"                 , # 88
  "void_crystal"           , # 88
  "cheese"                 , # 88
  "palis_crystal"          , # 89
  "essence_metal"          , # 89
  "firewood"               , # 89
  "malachite_gem"          , # 90
  "plague_metal"           , # 92
  "lead"                   , # 93
  "osgloglas"              , # 93
  "peridot"                , # 96
  "soularium"              , # 96
  "silver"                 , # 97
  "fluix"                  , # 97
  "dreamwood"              , # 98
  "xu_demonic_metal"       , # 98
  "sky_stone"              , # 98
  "obsidian"               , # 100
  "ruby"                   , # 103
  "mica"                   , # 104
  "psimetal"               , # 106
  "psigem"                 , # 106
  "iron"                   , # 106
  "ardite"                 , # 107
  "pink_slime"             , # 108
  "black_quartz"           , # 108
  "heavy"                  , # 110
  "sapphire"               , # 111
  "sentient_metal"         , # 111
  "desert_myrmex"          , # 112
  "jungle_myrmex"          , # 112
  "vibrant_alloy"          , # 112
  "meat_metal"             , # 114
  "manasteel"              , # 115
  "carbon_fiber"           , # 115
  "constantan"             , # 116
  "ma.base_essence"        , # 116
  "ma.soulium"             , # 117
  "fluix_steel"            , # 117
  "xu_enchanted_metal"     , # 118
  "bronze"                 , # 119
  "topaz"                  , # 120
  "nickel"                 , # 120
  "flux_crystal"           , # 120
  "alumite"                , # 120
  "lonsdaleite"            , # 123
  "electrical_steel"       , # 124
  "ma.inferium"            , # 125
  "aluminium"              , # 126
  "knightslime"            , # 127
  "nagascale"              , # 128
  "pigiron"                , # 128
  "void_metal"             , # 128
  "advanced_alloy"         , # 129
  "emerald_plustic"        , # 129
  "invar"                  , # 130
  "draconium"              , # 131
  "steeleaf"               , # 132
  "uranium"                , # 133
  "energetic_alloy"        , # 135
  "osmium"                 , # 140
  "thaumium"               , # 140
  "lumium"                 , # 141
  "enori_crystal"          , # 141
  "steel"                  , # 143
  "fierymetal"             , # 143
  "redstone_alloy"         , # 144
  "bound_metal"            , # 144
  "diamantine_crystal"     , # 145
  "energetic_metal"        , # 147
  "dark_steel"             , # 147
  "weezer"                 , # 149
  "knightmetal"            , # 149
  "amethyst"               , # 152
  "manyullyn"              , # 154
  "thorium"                , # 154
  "emeraldic_crystal"      , # 159
  "refined_glowstone"      , # 160
  "elementium"             , # 160
  "fluxed_electrum"        , # 162
  "osmiridium"             , # 162
  "ma.prudentium"          , # 163
  "electrum"               , # 163
  "boron"                  , # 165
  "starmetal"              , # 170
  "magnesium"              , # 180
  "signalum"               , # 181
  "primal_metal"           , # 183
  "refined_obsidian"       , # 184
  "platinum"               , # 192
  "restonia_crystal"       , # 195
  "tough"                  , # 199
  "enderium"               , # 200
  "terrasteel"             , # 203
  "cobalt"                 , # 204
  "hard_carbon"            , # 204
  "iridium"                , # 208
  "xu_evil_metal"          , # 222
  "pulsating_iron"         , # 225
  "mirion"                 , # 228
  "pink_metal"             , # 233
  "conductive_iron"        , # 237
  "ma.intermedium"         , # 243
  "titanium"               , # 245
  "boron_nitride"          , # 249
  "universal_metal"        , # 264
  "end_steel"              , # 271
  "crystal_matrix"         , # 279
  "wyvern_metal"           , # 284
  "ma.superium"            , # 386
  "neutronium"             , # 394
  "dragonsteel_fire"       , # 398
  "dragonsteel_ice"        , # 398
  "litherite"              , # 403
  "erodium"                , # 453
  "kyronite"               , # 508
  "draconic_metal"         , # 542
  "pladium"                , # 567
  "ma.supremium"           , # 599
  "ionite"                 , # 636
  "aethium"                , # 713
  "chaotic_metal"          , # 1016
  "infinity_metal"         , # 19537
] as IData;

static armorEntitys as IData = [
  {
    entityID: [
      "minecraft:zombie",
      "minecraft:zombie_villager",
      "minecraft:husk",
      "emberroot:knight_fallen"
    ],
    groups: [
      {
        name: "Everyman",
        weight: 20,
        ticWeapons: ["broadsword", "longsword", "rapier", "frypan", "battlesign", "cleaver"],
      },
      {
        name: "Rare",
        weight: 3,
        ticMats: ["iron", "pigiron", "knightslime", "slime", "blueslime", "magmaslime", "netherrack", "cobalt", "ardite", "manyullyn", "steel"],
        ticWeapons: ["hammer", "tcomplement:sledge_hammer", "lumberaxe", "scythe", ]
      },
      {
        name: "Worker",
        weight: 10,
        ticMats: ["stone", "flint", "treatedwood", "xu_magical_wood", "firewood", "chocolate", "livingwood_plustic", "ma.soulium", "integrationforegoing.plastic", "soularium", "leathermountaintroll", "leatherforesttroll", "certusquartz_plustic", "obsidian", "lead", "dragonbone", "pigiron", ],
        ticWeapons: ["pickaxe", "shovel", "hatchet", "mattock", "kama", "exnihilocreatio:crook_tconstruct", "excavator", ]
      }
    ]
  },
  {
    entityID: [
      "minecraft:zombie_pigman"
    ],
    groups: [
      {
        ticMats: ["copper", "bronze", "nickel", "scalebronzedragon", "cheese", "scalebronzeseaserpent", "magmaslime", "energetic_alloy", "electrum", "fierymetal", "amber", "topaz", "lumium_plustic", "xu_evil_metal", "refined_glowstone", "awakened_plustic"],
        ticWeapons: ["frypan", "battlesign"],
      }
    ]
  },
  {
    entityID: [
      "minecraft:wither_skeleton"
    ],
    groups: [
      {
        ticMats: ["construction_alloy", "tough", "thorium", "blackquartz_plustic", "void_actadd_plustic", "plague_metal", "aethium"]
      }
    ]
  },
  {
    entityID: [
      "minecraft:skeleton",
      "minecraft:stray",
      "quarq:ashen"
    ],
    groups: [
      {
        ticMats: ["paper", "bone", "chitinwhitedeathworm", "chitintandeathworm", "iron", "enori_actadd_plustic", "knightmetal", "ma.base_essence", "silver", "scalewhitedragon", "dragonbone", "scalebluedragon", "scalesilverdragon", "invar", "titanium", "iridium", "platinum_plustic", "end_steel", "endstone", "xu_evil_metal"],
      }
    ]
  },
  {
    entityID: [
      "emberroot:hero"
    ],
    groups: [
      {
        ticMats: ["blueslime", "cobalt", "scaletealseaserpent", "scaledeepblueseaserpent", "scalesapphiredragon", "ma.base_essence", "starmetal", "psimetal", "sapphire", "psigem", "platinum_plustic", "manasteel", "palis_actadd_plustic", "diamatine_actadd_plustic", "hard_carbon", "tanzanite", "osmiridium", "pladium", "refined_obsidian", "ionite", "ma.superium"]
      }
    ]
  }
] as IData;

static normalizedWeights as double[][IData] = {};
for entry in armorEntitys.asList() {
  if(isNull(entry.groups.asList()) || entry.groups.length == 1) {
    normalizedWeights[entry] = [1.0];
    continue;
  }

  val list = entry.groups.asList();
  var summ = 0.0d;
  for group in list {
    summ += isNull(group.weight) ? 1.0d : group.weight;
  }

  var result = [] as double[];
  var a = 0.0d;
  for group in list {
    a += (isNull(group.weight) ? 1.0d : group.weight) / summ;
    result += a;
    utils.log("Normalized equip group [" ~ (isNull(group.name) ? "Default" : group.name.asString()) ~ "] with prob. threshold: " ~ a);
  }
  normalizedWeights[entry] = result;
}

static normDefs as IData[string] = {
  armor: [],
  tool: [],
} as IData[string];
function normalizeDefaultList(list as IData, field as string) as void {
  for matName in list.asList() {
    if(!isNull(Toolforge.getMaterialFromID(matName))) normDefs[field] = normDefs[field] + [matName] as IData;
  }
  utils.log("Valid default " ~ field ~ " materials: " ~ normDefs[field].asString());
}
normalizeDefaultList(defaultArmorMats, 'armor');
normalizeDefaultList(defaultWeaponMats, 'tool');


# -------------------------------
# EQUIPMENT IDs
# -------------------------------
static armDefinitions as string[][] = [
  ["conarm:helmet"],
  ["conarm:chestplate"],
  ["conarm:leggings"],
  ["conarm:boots"],
  [
    "tconstruct:broadsword",
    "tconstruct:rapier",
    "tconstruct:frypan",
    "tconstruct:longsword",
    "tconstruct:cleaver",
    "tconstruct:pickaxe",
    "tconstruct:shovel",
    "tconstruct:hatchet",
    "tconstruct:mattock",
    "tconstruct:kama",
    "tconstruct:hammer",
    "tconstruct:excavator",
    "tconstruct:lumberaxe",
    "tconstruct:scythe",
  ],
  ["tconstruct:battlesign"]
] as string[][];