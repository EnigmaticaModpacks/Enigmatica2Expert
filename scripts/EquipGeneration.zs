import crafttweaker.data.IData;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.event.EntityLivingSpawnEvent;
import crafttweaker.item.IItemDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IWorld;
import mods.ctutils.utils.Math.max;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.random as random;
import mods.zentoolforge.Toolforge;
import modtweaker.tconstruct.ITICMaterial;

#modloaded zentoolforge


/* Patchouli_js()
var statics = {}
match_regex_below(
  /^static\s+(DEFAULT_EQUIP_CHANCE|OVERWORLD_EQUIP_CHANCE|NEXT_EQUIP_CHANCE).*= ([\d.]+)d/gm
).map(m=>[m[1], Math.round(parseFloat(m[2])*100)])
.forEach(m=>statics[m[0]] = m[1])

Patchouli_js('Mobs/Equip Generation', [
  {
    item: `draconicevolution:mob_soul{EntityName:"minecraft:zombie"}`,
    title: "Equip Generation",
    _text: `
      All mobs are generated with:
      $(li)Random TCon armor + weapon
      $(li)Random classic armor set + weapon

      Chance that mob will have at least 1 equipment is 
      $(li)${statics.DEFAULT_EQUIP_CHANCE}% base chance
      $(li)${100 - statics.OVERWORLD_EQUIP_CHANCE}% less in $(l)Overworld/$
      $(li)${statics.NEXT_EQUIP_CHANCE}% added to reroll for each next slot`
  },{
    item: `draconicevolution:mob_soul{EntityName:"minecraft:skeleton"}`,
    title: "Equip Generation",
    _text: `
      Different mobs have different armor types and different TCon materials.
      $(l)Zombies/$ have static chance to spawn with any avaliable material.
      
      Roll used $(l)qubic/$ function, so $(l)Paper/$ would spawn $(l)~20%/$ times and $(l)Infinity Metal/$ $(l)~0.2%/$ times.`
  },{
    item: `draconicevolution:mob_soul{EntityName:"minecraft:wither_skeleton"}`,
    title: "Equip Generation",
    _text: `
      Tinker's armor and tools have chance to get random modifier. If this happen, item 100% would have additional $(l)Creative/$ modifier.
      All equipment generated already damaged, so no exploits with $(l)mob-stripping farm/$!`
  },
])*/

static DEFAULT_EQUIP_CHANCE as double   = 0.8d; // Chance that mob will have at least 1 item
static OVERWORLD_EQUIP_CHANCE as double = 0.7d; // Chance modifier for Overworld
static NEXT_EQUIP_CHANCE as double      = 0.5d; // Reroll addition for next equipment slot

# ######################################################################
#
# Data
#
# ######################################################################
static defaultArmorMats as IData = [
  "paper"                  , # 1
  "chocolate"              , # 2
  "wood"                   , # 4
  "stone"                  , # 5
  "netherrack"             , # 5
  "apatite"                , # 6
  "ma.prosperity"          , # 6
  "void_crystal"           , # 6
  "polyethylene"           , # 7
  "livingwood"             , # 7
  "dreamwood"              , # 8
  "heavy"                  , # 8
  "construction_alloy"     , # 8
  "flint"                  , # 8
  "tin"                    , # 8
  "rubber"                 , # 9
  "palis_crystal"          , # 9
  "aluminium"              , # 10
  "restonia_crystal"       , # 10
  "electrum"               , # 10
  "cactus"                 , # 11
  "constantan"             , # 11
  "aquamarine"             , # 11
  "treatedwood"            , # 11
  "sky_stone"              , # 11
  "copper"                 , # 12
  "essence_metal"          , # 12
  "xu_magical_wood"        , # 12
  "nickel"                 , # 13
  "firewood"               , # 13
  "magnesium"              , # 13
  "litherite"              , # 13
  "certus_quartz"          , # 13
  "bone"                   , # 13
  "iron"                   , # 13
  "livingrock"             , # 13
  "fluix"                  , # 14
  "endstone"               , # 14
  "erodium"                , # 14
  "manasteel"              , # 14
  "black_quartz"           , # 15
  "universal_metal"        , # 15
  "uranium"                , # 15
  "mica"                   , # 15
  "elementium"             , # 16
  "enori_crystal"          , # 16
  "thorium"                , # 17
  "osmium"                 , # 18
  "invar"                  , # 18
  "meat_metal"             , # 18
  "kyronite"               , # 19
  "prismarine"             , # 19
  "energetic_metal"        , # 19
  "void_metal"             , # 19
  "sentient_metal"         , # 19
  "bronze"                 , # 20
  "refined_glowstone"      , # 20
  "draconium"              , # 20
  "lead"                   , # 20
  "pigiron"                , # 20
  "cobalt"                 , # 20
  "electrical_steel"       , # 21
  "blueslime"              , # 21
  "redstone_alloy"         , # 21
  "slime"                  , # 22
  "primal_metal"           , # 23
  "magmaslime"             , # 23
  "boron"                  , # 24
  "knightslime"            , # 24
  "leatherfrosttroll"      , # 24
  "leatherforesttroll"     , # 24
  "leathermountaintroll"   , # 24
  "chitintandeathworm"     , # 25
  "chitinwhitedeathworm"   , # 25
  "chitinbrowndeathworm"   , # 25
  "pladium"                , # 25
  "silver"                 , # 25
  "cheese"                 , # 25
  "conductive_iron"        , # 26
  "fluix_steel"            , # 26
  "ma.base_essence"        , # 26
  "integrationforegoing.plastic", # 26
  "obsidian"               , # 27
  "xu_enchanted_metal"     , # 27
  "ma.soulium"             , # 27
  "carbon_fiber"           , # 27
  "hard_carbon"            , # 27
  "platinum"               , # 28
  "signalum"               , # 28
  "alumite"                , # 28
  "sapphire"               , # 28
  "ruby"                   , # 28
  "peridot"                , # 28
  "lonsdaleite"            , # 28
  "xu_demonic_metal"       , # 29
  "pink_slime"             , # 29
  "refined_obsidian"       , # 29
  "lumium"                 , # 30
  "psimetal"               , # 31
  "psigem"                 , # 31
  "diamantine_crystal"     , # 31
  "fluxed_electrum"        , # 31
  "nagascale"              , # 31
  "emerald_plustic"        , # 31
  "advanced_alloy"         , # 33
  "thaumium"               , # 33
  "manyullyn"              , # 33
  "ardite"                 , # 34
  "iridium"                , # 34
  "malachite_gem"          , # 34
  "tough"                  , # 34
  "ionite"                 , # 35
  "pink_metal"             , # 37
  "topaz"                  , # 37
  "tanzanite"              , # 37
  "pulsating_iron"         , # 38
  "desert_myrmex"          , # 39
  "jungle_myrmex"          , # 39
  "amber"                  , # 39
  "emeraldic_crystal"      , # 39
  "ma.inferium"            , # 39
  "enderium"               , # 39
  "bound_metal"            , # 40
  "vibrant_alloy"          , # 40
  "flux_crystal"           , # 40
  "crystal_matrix"         , # 41
  "steel"                  , # 41
  "steeleaf"               , # 42
  "dragonbone"             , # 42
  "scalebronzedragon"      , # 43
  "scalewhitedragon"       , # 43
  "scalegraydragon"        , # 43
  "scalesapphiredragon"    , # 43
  "scalebluedragon"        , # 43
  "scalegreendragon"       , # 43
  "scalereddragon"         , # 43
  "scalesilverdragon"      , # 43
  "scaleblueseaserpent"    , # 44
  "scalepurpleseaserpent"  , # 44
  "scaletealseaserpent"    , # 44
  "scalebronzeseaserpent"  , # 44
  "scaledeepblueseaserpent", # 44
  "scaleredseaserpent"     , # 44
  "scalegreenseaserpent"   , # 44
  "sponge"                 , # 45
  "plague_metal"           , # 46
  "titanium"               , # 50
  "xu_evil_metal"          , # 51
  "aethium"                , # 52
  "starmetal"              , # 54
  "ma.prudentium"          , # 56
  "mirion"                 , # 58
  "energetic_alloy"        , # 58
  "boron_nitride"          , # 59
  "end_steel"              , # 60
  "terrasteel"             , # 60
  "fierymetal"             , # 61
  "osgloglas"              , # 66
  "osmiridium"             , # 67
  "dark_steel"             , # 69
  "amethyst"               , # 70
  "knightmetal"            , # 79
  "wyvern_metal"           , # 80
  "ma.intermedium"         , # 81
  "weezer"                 , # 84
  "dragonsteel_fire"       , # 88
  "dragonsteel_ice"        , # 88
  "soularium"              , # 106
  "ma.superium"            , # 107
  "ma.supremium"           , # 121
  "draconic_metal"         , # 191
  "neutronium"             , # 330
  "chaotic_metal"          , # 553
  "infinity_metal"         , # 1518
] as IData;


static defaultWeaponMats as IData = [
  "paper"                  , # 21
  "chocolate"              , # 33
  "stone"                  , # 40
  "construction_alloy"     , # 41
  "wood"                   , # 42
  "redstone_alloy"         , # 45
  "flint"                  , # 49
  "dreamwood"              , # 53
  "meat_metal"             , # 54
  "xu_magical_wood"        , # 57
  "cactus"                 , # 60
  "ma.prosperity"          , # 61
  "apatite"                , # 63
  "polyethylene"           , # 64
  "netherrack"             , # 66
  "livingrock"             , # 66
  "tin"                    , # 67
  "livingwood"             , # 67
  "rubber"                 , # 67
  "bone"                   , # 70
  "soularium"              , # 71
  "blueslime"              , # 75
  "tanzanite"              , # 75
  "pink_slime"             , # 76
  "endstone"               , # 77
  "cheese"                 , # 78
  "treatedwood"            , # 78
  "void_crystal"           , # 78
  "prismarine"             , # 80
  "sponge"                 , # 81
  "slime"                  , # 81
  "desert_myrmex"          , # 83
  "jungle_myrmex"          , # 83
  "plague_metal"           , # 83
  "palis_crystal"          , # 84
  "energetic_alloy"        , # 85
  "certus_quartz"          , # 85
  "magmaslime"             , # 85
  "aquamarine"             , # 86
  "sky_stone"              , # 87
  "copper"                 , # 88
  "essence_metal"          , # 89
  "firewood"               , # 89
  "malachite_gem"          , # 90
  "dragonbone"             , # 91
  "lead"                   , # 93
  "electrical_steel"       , # 94
  "conductive_iron"        , # 95
  "peridot"                , # 96
  "constantan"             , # 96
  "ma.inferium"            , # 96
  "silver"                 , # 97
  "fluix"                  , # 97
  "litherite"              , # 98
  "xu_demonic_metal"       , # 98
  "obsidian"               , # 99
  "nickel"                 , # 100
  "sentient_metal"         , # 101
  "black_quartz"           , # 102
  "ruby"                   , # 103
  "mica"                   , # 104
  "steeleaf"               , # 104
  "iron"                   , # 106
  "ma.soulium"             , # 107
  "ardite"                 , # 107
  "uranium"                , # 108
  "erodium"                , # 109
  "nagascale"              , # 109
  "heavy"                  , # 110
  "sapphire"               , # 111
  "vibrant_alloy"          , # 112
  "manasteel"              , # 115
  "carbon_fiber"           , # 115
  "kyronite"               , # 116
  "fluix_steel"            , # 117
  "xu_enchanted_metal"     , # 118
  "bronze"                 , # 119
  "pulsating_iron"         , # 119
  "topaz"                  , # 120
  "flux_crystal"           , # 120
  "integrationforegoing.plastic", # 121
  "knightmetal"            , # 122
  "lonsdaleite"            , # 123
  "pigiron"                , # 124
  "advanced_alloy"         , # 124
  "thorium"                , # 124
  "aluminium"              , # 126
  "ma.prudentium"          , # 126
  "knightslime"            , # 127
  "fierymetal"             , # 127
  "pladium"                , # 128
  "void_metal"             , # 128
  "emerald_plustic"        , # 129
  "invar"                  , # 130
  "elementium"             , # 130
  "draconium"              , # 131
  "ma.base_essence"        , # 132
  "energetic_metal"        , # 132
  "thaumium"               , # 134
  "enori_crystal"          , # 136
  "bound_metal"            , # 137
  "fluxed_electrum"        , # 137
  "psimetal"               , # 138
  "psigem"                 , # 138
  "diamantine_crystal"     , # 140
  "osmium"                 , # 140
  "lumium"                 , # 141
  "amethyst"               , # 142
  "ionite"                 , # 142
  "steel"                  , # 143
  "magnesium"              , # 145
  "alumite"                , # 145
  "dark_steel"             , # 147
  "primal_metal"           , # 148
  "weezer"                 , # 149
  "manyullyn"              , # 154
  "emeraldic_crystal"      , # 154
  "boron"                  , # 160
  "refined_glowstone"      , # 160
  "osmiridium"             , # 162
  "electrum"               , # 163
  "starmetal"              , # 175
  "osgloglas"              , # 176
  "platinum"               , # 177
  "aethium"                , # 178
  "signalum"               , # 181
  "refined_obsidian"       , # 184
  "restonia_crystal"       , # 190
  "ma.intermedium"         , # 191
  "mirion"                 , # 198
  "enderium"               , # 200
  "terrasteel"             , # 203
  "cobalt"                 , # 204
  "tough"                  , # 204
  "iridium"                , # 208
  "hard_carbon"            , # 221
  "xu_evil_metal"          , # 222
  "pink_metal"             , # 224
  "universal_metal"        , # 234
  "titanium"               , # 245
  "crystal_matrix"         , # 249
  "boron_nitride"          , # 249
  "end_steel"              , # 266
  "wyvern_metal"           , # 269
  "ma.superium"            , # 332
  "dragonsteel_fire"       , # 357
  "dragonsteel_ice"        , # 357
  "neutronium"             , # 394
  "ma.supremium"           , # 529
  "draconic_metal"         , # 542
  "chaotic_metal"          , # 1016
  "infinity_metal"         , # 19537
] as IData;

static armorStaged as IData[string] = scripts.DataTables.armorStaged;

static armorEntitys as IData[] = [
  {
    entityID: [
      "minecraft:zombie",
      "minecraft:zombie_villager",
      "minecraft:husk",
      "emberroot:knight_fallen"
    ],
    groups: [
      {
        # TIC Default
        weight: 20,
        ticMats: defaultWeaponMats,
        ticWeapons: ["broadsword", "longsword", "rapier", "frypan", "battlesign", "cleaver"],
      },
      {
        # Rare
        weight: 3,
        ticMats: ["iron", "pigiron", "knightslime", "slime", "blueslime", "magmaslime", "netherrack", "cobalt", "ardite", "manyullyn", "steel"],
        ticWeapons: ["hammer", "tcomplement:sledge_hammer", "lumberaxe", "scythe", ]
      },
      {
        # Workers
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
        weight: 2,
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
        weight: 2,
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
        weight: 2,
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
        weight: 2,
        ticMats: ["blueslime", "cobalt", "scaletealseaserpent", "scaledeepblueseaserpent", "scalesapphiredragon", "ma.base_essence", "starmetal", "psimetal", "sapphire", "psigem", "platinum_plustic", "manasteel", "palis_actadd_plustic", "diamatine_actadd_plustic", "hard_carbon", "tanzanite", "osmiridium", "pladium", "refined_obsidian", "ionite", "ma.superium"]
      }
    ]
  }
] as IData[];

# -------------------------------
# SLOTS
# -------------------------------
static slots as IEntityEquipmentSlot[] = [
  IEntityEquipmentSlot.head(),
  IEntityEquipmentSlot.chest(),
  IEntityEquipmentSlot.legs(),
  IEntityEquipmentSlot.feet(),
  IEntityEquipmentSlot.mainHand(),
  IEntityEquipmentSlot.offhand()
] as IEntityEquipmentSlot[];

# -------------------------------
# MATERIALS
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


function rnd_qubic()  as double { var a as double = random(); return a*a*a; }
function equipProbability(offset as double) as bool { return random() <= 0.75d * offset; }
function pick_qubic(list as IData) as string { return list[(rnd_qubic() * (list.length as double)) as int].asString(); }


function rndToolPart(mats as IData) as ITICMaterial{
  var matName = pick_qubic(mats);
  var mat = Toolforge.getMaterialFromID(matName);

  # Reroll if material is null
  var roll = 0;
  while (isNull(mat) && roll < 100){
    matName = pick_qubic(mats);
    mat = Toolforge.getMaterialFromID(matName);
    roll = roll + 1;
  }

  return mat;
}

function getFourRandomTicMats(listTicmats as IData) as ITICMaterial[] {
  return [
    rndToolPart(listTicmats),
    rndToolPart(listTicmats),
    rndToolPart(listTicmats),
    rndToolPart(listTicmats)
  ] as ITICMaterial[];
}

function rerollForWeapon(oldRoll as ITICMaterial[], listTicmats as IData) as ITICMaterial[] {
  var new = [] as ITICMaterial[];
  for i in 0 to 4 {
    var roll = 0;
    var mat = oldRoll[i];
    while (roll < 100 && !isNull(mat) && !(defaultWeaponMats has mat.getName)){
      mat = rndToolPart(listTicmats);
      roll = roll + 1;
    }
    if (roll == 100){
      # Material, that REAL and CAN be used in weapon, wasnt found
      return null;
    }
    new = new + mat;
  }
  return new;
}

# Create random equipment
function buildTiCTool(matList as ITICMaterial[], def as IItemDefinition) as IItemStack{
  if (!isNull(matList[0]) && !isNull(matList[1]) && !isNull(matList[2]) && !isNull(matList[3])){
    return Toolforge.buildTool(def, matList[0], matList[1], matList[2], matList[3] );
  }
  return null;
}

# Search armorEntitys for entity ID
function getGroup(entity as IEntityLivingBase) as IData {
  for group in armorEntitys{
    for i in 0 to group.entityID.length{
      if (entity.definition.id == group.entityID[i].asString()) {
        return group;
      }
    }
  }
  return null;
}

# Lookup for item based on probability of each weight
function getWeightedIndex(data as IData) as int {
  var k = 0;
  var wRand as int[] = [] as int[];
  for t in 0 to data.length {
    var weight = isNull(data[t].weight) ? 1 : data[t].weight.asInt();
    for i in 0 to weight {
      wRand += k;
    }
    k += 1;
  }
  return wRand[(random() * wRand.length) as int];
}

# Generate equipmnts
function addEquipment(iGroup as IData, entity as IEntityLivingBase, world as IWorld) {
  if (isNull(iGroup.groups)){ return null; }

  # Pick tier
  var currGroup = iGroup.groups[getWeightedIndex(iGroup.groups)];
  var randTicMatsArmor as ITICMaterial[] = null;
  var randTicMatsWeapn as ITICMaterial[] = null;
  var randomClassic as string = null;

  # Generate probabilityes for each slot
  var probs = [random()] as double[];
  for i in 1 to 6 {
    probs += probs[i - 1] * min(random() + NEXT_EQUIP_CHANCE, 1.0d);
  }
  var equipSequence = [4, 1, 2, 3, 0, 5] as int[];

  # Calculate probabilities
  # bigger number - less chance
  # ~30% more armor in other dimensions than Overworld
  var tolerance = (world.dimension==0)
    ?  DEFAULT_EQUIP_CHANCE 
    : (DEFAULT_EQUIP_CHANCE * OVERWORLD_EQUIP_CHANCE);

  for j in 0 to 6{
    if ( probs[j] > tolerance ) {
    # if (equipProbability(slotsOffset[i])) {
      var i = equipSequence[j]; # Change sequence
      var isArmor = i <= 3; // True for armor, false for tool
      var equip as IItemStack = null;

      if(!isNull(currGroup.classicEquips) && currGroup.classicEquips.length > 0) {
        # We have classic armor set
        if (isNull(randomClassic)) { randomClassic = pick_qubic(currGroup.classicEquips); }

        var stagedArmorGroup as IData = armorStaged[randomClassic];
        if (!isNull(stagedArmorGroup)){
          var grpList as IData = stagedArmorGroup.list;

          var listedItem = grpList[i];
          var itemID = listedItem.id.asString();
          if (itemID.indexOf("tconstruct:") == -1) {
            var itemNoNBT = itemUtils.getItem(itemID);
            if(!isNull(itemNoNBT)) {
              equip = itemNoNBT.withTag( isNull(listedItem.tag) ? {} : listedItem.tag );
            }
          }
        }
      } else {
        # Create Armor ticmats if we dont have any
        if (isNull(randTicMatsArmor)) {
          randTicMatsArmor = getFourRandomTicMats(currGroup.ticMats);
        }
        # Create Weapon ticmats if we dont have any
        if (isNull(randTicMatsWeapn)) {
          randTicMatsWeapn = rerollForWeapon(randTicMatsArmor, currGroup.ticMats);
        }

        # Materials for armor and weapons not the same
        val fourMaterials as ITICMaterial[] = isArmor ? randTicMatsArmor : randTicMatsWeapn;

        if (i!=5) { # If not offhand

          // Roll for item
          var def as IItemStack = null;
          if (!isArmor && !isNull(currGroup.ticWeapons)){ # If main hand
            var antiloop = 0;
            while antiloop<100 && isNull(def) {
              var weapon = pick_qubic(currGroup.ticWeapons);
              if (weapon.contains(":"))
                def = itemUtils.getItem(weapon);
              else
                def = itemUtils.getItem("tconstruct:" ~ weapon);
              antiloop += 1;
            }
          }else{
            def = itemUtils.getItem(armDefinitions[i][0]);
          }

          # Build tool/armor piece
          equip = buildTiCTool(fourMaterials, def.definition);

          # Add random modifiers
          if (random() > 0.5d) {
            var picked = [] as string[];
            for modf_i in 0 to ((rnd_qubic() * 5.0d + 1.0d) as int) {
              var mod as string = null;
              var antiloop = 0;
              while (picked has mod && antiloop < 100) {
                mod = pick_qubic(
                  isArmor
                    ? scripts.utils_tcon.allArmorModifiers 
                    : scripts.utils_tcon.allToolModifiers
                );
                antiloop += 1;
              }
              picked = picked + mod;
              equip = scripts.utils_tcon.addModifier(equip, mod);
            }
          }

          # Damage item
          val rndDamage = (0.35d + random() / 2.0d) as float;
          val dmg = min(min(32766, equip.maxDamage), max(1, (equip.maxDamage as float * rndDamage) as int));
          equip = equip.isDamageable ? (equip.withDamage(dmg)) : equip;
        }
      }

      if (!isNull(equip)) {
        entity.setItemToSlot(slots[i], equip);
      }
    }
  }
}

# -------------------------------
# Spawn Event
# -------------------------------
function onSpawnEvent(e as EntityLivingSpawnEvent){
  if(!e.world.isRemote()) {
    var entity = e.entityLivingBase;
    var iGroup = getGroup(entity);# Chose IData
    if (!isNull(iGroup)){
      addEquipment(iGroup, entity, e.world);
    }
  }

  e.pass();
}

# -------------------------------
# Hook on events
# -------------------------------
events.onSpecialSpawn(function(event as EntityLivingSpawnEvent){
  onSpawnEvent(event);
});

events.onCheckSpawn(function(event as EntityLivingSpawnEvent){
  onSpawnEvent(event);
});


# -------------------------------
# Test generation
# -------------------------------
function generateTestItem() as IItemStack {

  var fourMaterials = getFourRandomTicMats(defaultWeaponMats);
  var equip = buildTiCTool(fourMaterials, itemUtils.getItem("tconstruct:cleaver").definition);
  // var fourMaterials = getFourRandomTicMats(defaultArmorMats);
  // var equip = buildTiCTool(fourMaterials, itemUtils.getItem("conarm:chestplate").definition);

  var modified = equip;
  var picked = [] as string[];
  for i in 0 to 4 {
    // var mod as string = null;
    // while picked has mod {
    //   // mod = pick_qubic(allToolModifiers);
    //   mod = pick_qubic(allArmorModifiers);
    // }
    // picked = picked + mod;
    // modified = addModifier(modified, mod);
  }
  for i in 0 to 4 {
    modified = scripts.utils_tcon.addModifier(modified, "sharpness");
  }
  for i in 0 to 4 {
    modified = scripts.utils_tcon.addModifier(modified, "luck");
  }
  for i in 0 to 4 {
    modified = scripts.utils_tcon.addModifier(modified, "beheading");
  }

  return modified;
}

generateTestItem();

// events.onEntityLivingUseItem(function(e as crafttweaker.event.EntityLivingUseItemEvent.All){
//   if(e.player.world.isRemote()) return;

//   e.player.give(generateTestItem());
// });