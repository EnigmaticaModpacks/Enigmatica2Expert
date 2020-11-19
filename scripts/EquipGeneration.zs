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
  "pink_slime"             , # 46
  "refined_obsidian"       , # 46
  "lumium"                 , # 47
  "psimetal"               , # 48
  "psigem"                 , # 48
  "diamantine_crystal"     , # 48
  "fluxed_electrum"        , # 48
  "nagascale"              , # 48
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
  "steeleaf"               , # 59
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
  "dragonsteel_fire"       , # 105
  "dragonsteel_ice"        , # 105
  "soularium"              , # 123
  "ma.superium"            , # 124
  "ma.supremium"           , # 138
  "draconic_metal"         , # 208
  "neutronium"             , # 347
  "chaotic_metal"          , # 570
  "infinity_metal"         , # 1535
] as IData;


static defaultWeaponMats as IData = [
  "paper"                  , # 21
  "chocolate"              , # 33
  "stone"                  , # 40
  "construction_alloy"     , # 41
  "wood"                   , # 42
  "flint"                  , # 49
  "xu_magical_wood"        , # 57
  "cactus"                 , # 60
  "ma.prosperity"          , # 61
  "apatite"                , # 63
  "polyethylene"           , # 64
  "netherrack"             , # 66
  "livingrock"             , # 66
  "tin"                    , # 67
  "rubber"                 , # 67
  "redstone_alloy"         , # 70
  "bone"                   , # 70
  "blueslime"              , # 75
  "tanzanite"              , # 75
  "livingwood"             , # 77
  "endstone"               , # 77
  "treatedwood"            , # 78
  "cheese"                 , # 78
  "prismarine"             , # 80
  "sponge"                 , # 81
  "slime"                  , # 81
  "desert_myrmex"          , # 83
  "jungle_myrmex"          , # 83
  "void_crystal"           , # 83
  "plague_metal"           , # 83
  "meat_metal"             , # 84
  "certus_quartz"          , # 85
  "magmaslime"             , # 85
  "aquamarine"             , # 86
  "copper"                 , # 88
  "palis_crystal"          , # 89
  "essence_metal"          , # 89
  "firewood"               , # 89
  "malachite_gem"          , # 90
  "dragonbone"             , # 91
  "lead"                   , # 93
  "osgloglas"              , # 93
  "energetic_alloy"        , # 95
  "peridot"                , # 96
  "soularium"              , # 96
  "silver"                 , # 97
  "fluix"                  , # 97
  "dreamwood"              , # 98
  "xu_demonic_metal"       , # 98
  "obsidian"               , # 100
  "sentient_metal"         , # 101
  "pink_slime"             , # 101
  "black_quartz"           , # 102
  "ruby"                   , # 103
  "mica"                   , # 104
  "iron"                   , # 106
  "sky_stone"              , # 107
  "ardite"                 , # 107
  "nagascale"              , # 109
  "heavy"                  , # 110
  "sapphire"               , # 111
  "vibrant_alloy"          , # 112
  "manasteel"              , # 115
  "carbon_fiber"           , # 115
  "constantan"             , # 116
  "ma.inferium"            , # 116
  "ma.soulium"             , # 117
  "fluix_steel"            , # 117
  "xu_enchanted_metal"     , # 118
  "pigiron"                , # 119
  "bronze"                 , # 119
  "topaz"                  , # 120
  "nickel"                 , # 120
  "flux_crystal"           , # 120
  "litherite"              , # 123
  "lonsdaleite"            , # 123
  "advanced_alloy"         , # 124
  "electrical_steel"       , # 124
  "steeleaf"               , # 124
  "conductive_iron"        , # 125
  "aluminium"              , # 126
  "knightslime"            , # 127
  "fierymetal"             , # 127
  "void_metal"             , # 128
  "emerald_plustic"        , # 129
  "invar"                  , # 130
  "draconium"              , # 131
  "ma.base_essence"        , # 132
  "knightmetal"            , # 132
  "uranium"                , # 133
  "thaumium"               , # 134
  "erodium"                , # 134
  "bound_metal"            , # 137
  "energetic_metal"        , # 137
  "psimetal"               , # 138
  "psigem"                 , # 138
  "pulsating_iron"         , # 139
  "osmium"                 , # 140
  "lumium"                 , # 141
  "enori_crystal"          , # 141
  "steel"                  , # 143
  "diamantine_crystal"     , # 145
  "alumite"                , # 145
  "kyronite"               , # 146
  "ma.prudentium"          , # 146
  "dark_steel"             , # 147
  "weezer"                 , # 149
  "amethyst"               , # 152
  "manyullyn"              , # 154
  "thorium"                , # 154
  "pladium"                , # 158
  "emeraldic_crystal"      , # 159
  "refined_glowstone"      , # 160
  "elementium"             , # 160
  "fluxed_electrum"        , # 162
  "osmiridium"             , # 162
  "electrum"               , # 163
  "boron"                  , # 165
  "ionite"                 , # 172
  "starmetal"              , # 175
  "magnesium"              , # 180
  "signalum"               , # 181
  "primal_metal"           , # 183
  "refined_obsidian"       , # 184
  "aethium"                , # 188
  "platinum"               , # 192
  "restonia_crystal"       , # 195
  "mirion"                 , # 198
  "tough"                  , # 199
  "enderium"               , # 200
  "terrasteel"             , # 203
  "cobalt"                 , # 204
  "iridium"                , # 208
  "ma.intermedium"         , # 211
  "hard_carbon"            , # 216
  "xu_evil_metal"          , # 222
  "pink_metal"             , # 229
  "titanium"               , # 245
  "boron_nitride"          , # 249
  "universal_metal"        , # 264
  "end_steel"              , # 266
  "crystal_matrix"         , # 279
  "wyvern_metal"           , # 284
  "ma.superium"            , # 337
  "dragonsteel_fire"       , # 382
  "dragonsteel_ice"        , # 382
  "neutronium"             , # 394
  "ma.supremium"           , # 519
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