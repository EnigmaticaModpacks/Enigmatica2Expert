import crafttweaker.item.IItemStack;
import crafttweaker.event.EntityLivingSpawnEvent;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.item.IItemDefinition;
import crafttweaker.entity.IEntityLivingBase;
import mods.zentoolforge.Toolforge;
import crafttweaker.data.IData;
import modtweaker.tconstruct.ITICMaterial;
import mods.ctutils.utils.Math.random as random;
import mods.ctutils.utils.Math.min as min;
import crafttweaker.world.IWorld;




# ######################################################################
#
# Data
#
# ######################################################################
static defaultArmorMats as IData = [
"paper"                        , # 1
"chocolate"                    , # 1
"ma.prosperity"                , # 2
"livingwood"                   , # 3
"wood"                         , # 3
"netherrack"                   , # 3
"stone"                        , # 3
"dreamwood"                    , # 3
"meat_metal"                   , # 3
"livingrock"                   , # 5
"void_crystal"                 , # 5
"flint"                        , # 5
"polyethylene"                 , # 5
"construction_alloy"           , # 5
"signalum"                     , # 6
"heavy"                        , # 6
"apatite"                      , # 6
"tin"                          , # 6
"lumium"                       , # 6
"rubber"                       , # 7
"palis_crystal"                , # 7
"treatedwood"                  , # 8
"aluminium"                    , # 8
"sky_stone"                    , # 8
"restonia_crystal"             , # 9
"mica"                         , # 9
"electrum"                     , # 9
"cactus"                       , # 9
"aquamarine"                   , # 9
"xu_magical_wood"              , # 10
"firewood"                     , # 10
"copper"                       , # 10
"bone"                         , # 10
"essence_metal"                , # 10
"nickel"                       , # 11
"magnesium"                    , # 11
"endstone"                     , # 11
"litherite"                    , # 11
"certus_quartz"                , # 11
"iron"                         , # 11
"fluix"                        , # 12
"black_quartz"                 , # 12
"manasteel"                    , # 12
"erodium"                      , # 13
"uranium"                      , # 13
"elementium"                   , # 13
"livingwood_plustic"           , # 13
"prismarine"                   , # 13
"universal_metal"              , # 14
"blueslime"                    , # 14
"thorium"                      , # 14
"lead"                         , # 14
"enori_crystal"                , # 14
"invar"                        , # 14
"obsidian"                     , # 15
"magmaslime"                   , # 15
"bronze"                       , # 15
"osmium"                       , # 15
"void_metal"                   , # 16
"refined_glowstone"            , # 16
"kyronite"                     , # 16
"primal_metal"                 , # 16
"slime"                        , # 16
"sentient_metal"               , # 16
"draconium"                    , # 16
"pigiron"                      , # 16
"electrical_steel"             , # 17
"energetic_metal"              , # 17
"redstone_alloy"               , # 18
"cobalt"                       , # 18
"chitintandeathworm"           , # 18
"chitinwhitedeathworm"         , # 18
"chitinbrowndeathworm"         , # 18
"fluix_steel"                  , # 18
"ardite"                       , # 19
"pladium"                      , # 19
"silver"                       , # 19
"leatherfrosttroll"            , # 19
"leatherforesttroll"           , # 19
"leathermountaintroll"         , # 19
"pink_slime"                   , # 19
"constantan"                   , # 20
"knightslime"                  , # 21
"cheese"                       , # 22
"alumite"                      , # 22
"sapphire"                     , # 22
"ruby"                         , # 22
"peridot"                      , # 22
"platinum"                     , # 22
"xu_demonic_metal"             , # 22
"conductive_iron"              , # 23
"xu_enchanted_metal"           , # 23
"ionite"                       , # 23
"ma.base_essence"              , # 24
"manyullyn"                    , # 24
"steel"                        , # 24
"diamantine_crystal"           , # 25
"ma.soulium"                   , # 25
"emerald_plustic"              , # 25
"lonsdaleite"                  , # 25
"sponge"                       , # 25
"iridium"                      , # 25
"certusquartz_plustic"         , # 25
"fluxed_electrum"              , # 25
"bound_metal"                  , # 26
"blackquartz_plustic"          , # 26
"flux_crystal"                 , # 26
"boron"                        , # 27
"pink_metal"                   , # 27
"enderium"                     , # 27
"integrationforegoing.plastic" , # 27
"psimetal"                     , # 28
"psigem"                       , # 28
"refined_obsidian"             , # 28
"aethium"                      , # 29
"emeraldic_crystal"            , # 29
"nagascale"                    , # 29
"hard_carbon"                  , # 30
"scaleblueseaserpent"          , # 31
"scalepurpleseaserpent"        , # 31
"scaletealseaserpent"          , # 31
"scalebronzeseaserpent"        , # 31
"scaledeepblueseaserpent"      , # 31
"scaleredseaserpent"           , # 31
"scalegreenseaserpent"         , # 31
"void_actadd_plustic"          , # 32
"enori_actadd_plustic"         , # 32
"signalum_plustic"             , # 32
"scalebronzedragon"            , # 33
"scalewhitedragon"             , # 33
"scalegraydragon"              , # 33
"scalesapphiredragon"          , # 33
"scalebluedragon"              , # 33
"scalegreendragon"             , # 33
"scalereddragon"               , # 33
"scalesilverdragon"            , # 33
"malachite_gem"                , # 33
"terrasteel"                   , # 33
"tough"                        , # 35
"pulsating_iron"               , # 35
"topaz"                        , # 35
"platinum_plustic"             , # 36
"wyvern_metal"                 , # 36
"desert_myrmex"                , # 37
"jungle_myrmex"                , # 37
"tanzanite"                    , # 37
"fluixcrystal_plustic"         , # 37
"amber"                        , # 37
"restonia_actadd_plustic"      , # 38
"palis_actadd_plustic"         , # 38
"lumium_plustic"               , # 39
"integrationforegoing.pink_slime", # 40
"dragonbone"                   , # 41
"enderium_plustic"             , # 41
"vibrant_alloy"                , # 42
"steeleaf"                     , # 42
"plague_metal"                 , # 44
"amethyst"                     , # 51
"diamatine_actadd_plustic"     , # 51
"refinedglowstone"             , # 51
"emeradic_actadd_plustic"      , # 52
"xu_evil_metal"                , # 55
"energetic_alloy"              , # 56
"dark_steel"                   , # 59
"fierymetal"                   , # 63
"mirion"                       , # 64
"boron_nitride"                , # 64
"osmiridium"                   , # 67
"integrationforegoing.reinforced_pink_slime", # 67
"draconic_metal"               , # 67
"ma.inferium"                  , # 75
"osgloglas"                    , # 77
"knightmetal"                  , # 81
"refinedobsidian"              , # 82
"wyvern_plustic"               , # 83
"weezer"                       , # 89
"dragonsteel_fire"             , # 94
"dragonsteel_ice"              , # 94
"awakened_plustic"             , # 104
"end_steel"                    , # 105
"soularium"                    , # 105
"titanium"                     , # 107
"ma.prudentium"                , # 116
"chaotic_metal"                , # 121
"chaotic_plustic"              , # 124
"ma.intermedium"               , # 188
"thaumium"                     , # 242
"starmetal"                    , # 246
"infinity_avaritia_plustic"    , # 253
"ma.superium"                  , # 269
"ma.supremium"                 , # 731
] as IData;


static defaultWeaponMats as IData = [
"stone"                        , # 18
"heavy"                        , # 24
"flint"                        , # 24
"netherrack"                   , # 25
"paper"                        , # 27
"obsidian"                     , # 29
"chocolate"                    , # 35
"construction_alloy"           , # 44
"prismarine"                   , # 44
"ma.prosperity"                , # 46
"wood"                         , # 46
"meat_metal"                   , # 46
"xu_magical_wood"              , # 48
"firewood"                     , # 52
"vibrant_alloy"                , # 52
"dreamwood"                    , # 53
"livingwood_plustic"           , # 56
"magmaslime"                   , # 56
"redstone_alloy"               , # 61
"electrum"                     , # 63
"signalum"                     , # 64
"tin"                          , # 65
"primal_metal"                 , # 69
"livingwood"                   , # 69
"lead"                         , # 70
"livingrock"                   , # 70
"aquamarine"                   , # 70
"constantan"                   , # 72
"malachite_gem"                , # 76
"peridot"                      , # 76
"magnesium"                    , # 79
"cactus"                       , # 80
"certus_quartz"                , # 80
"polyethylene"                 , # 81
"black_quartz"                 , # 81
"lumium"                       , # 82
"blackquartz_plustic"          , # 82
"endstone"                     , # 82
"thorium"                      , # 85
"void_crystal"                 , # 85
"uranium"                      , # 85
"xu_demonic_metal"             , # 85
"aluminium"                    , # 86
"fluix"                        , # 87
"litherite"                    , # 88
"rubber"                       , # 88
"bone"                         , # 89
"restonia_crystal"             , # 91
"psimetal"                     , # 92
"psigem"                       , # 92
"tanzanite"                    , # 93
"universal_metal"              , # 94
"blueslime"                    , # 94
"void_metal"                   , # 95
"sky_stone"                    , # 95
"sentient_metal"               , # 96
"copper"                       , # 97
"essence_metal"                , # 99
"ardite"                       , # 99
"iron"                         , # 99
"erodium"                      , # 99
"certusquartz_plustic"         , # 101
"nickel"                       , # 101
"energetic_alloy"              , # 20
"ruby"                         , # 101
"enori_actadd_plustic"         , # 101
"refined_glowstone"            , # 103
"manasteel"                    , # 103
"refinedglowstone"             , # 104
"steeleaf"                     , # 107
"cheese"                       , # 108
"electrical_steel"             , # 108
"fluixcrystal_plustic"         , # 108
"kyronite"                     , # 109
"void_actadd_plustic"          , # 110
"invar"                        , # 110
"platinum_plustic"             , # 110
"pigiron"                      , # 111
"conductive_iron"              , # 111
"silver"                       , # 111
"signalum_plustic"             , # 112
"plague_metal"                 , # 114
"ma.base_essence"              , # 115
"enderium_plustic"             , # 116
"energetic_metal"              , # 118
"pladium"                      , # 118
"restonia_actadd_plustic"      , # 118
"flux_crystal"                 , # 120
"palis_crystal"                , # 121
"draconium"                    , # 121
"bound_metal"                  , # 122
"fluix_steel"                  , # 123
"bronze"                       , # 123
"palis_actadd_plustic"         , # 125
"ionite"                       , # 127
"pink_slime"                   , # 129
"dragonbone"                   , # 133
"lonsdaleite"                  , # 135
"emerald_plustic"              , # 136
"aethium"                      , # 137
"steel"                        , # 137
"enori_crystal"                , # 137
"topaz"                        , # 138
"lumium_plustic"               , # 139
"diamantine_crystal"           , # 141
"alumite"                      , # 144
"elementium"                   , # 146
"slime"                        , # 146
"treatedwood"                  , # 147
"sapphire"                     , # 148
"desert_myrmex"                , # 148
"jungle_myrmex"                , # 148
"refinedobsidian"              , # 149
"ma.inferium"                  , # 150
"fluxed_electrum"              , # 152
"emeradic_actadd_plustic"      , # 152
"osmium"                       , # 153
"ma.soulium"                   , # 157
"emeraldic_crystal"            , # 158
"manyullyn"                    , # 165
"amethyst"                     , # 169
"dark_steel"                   , # 172
"osgloglas"                    , # 174
"cobalt"                       , # 174
"boron"                        , # 176
"diamatine_actadd_plustic"     , # 176
"sponge"                       , # 181
"refined_obsidian"             , # 183
"end_steel"                    , # 185
"fierymetal"                   , # 186
"platinum"                     , # 186
"pulsating_iron"               , # 188
"knightslime"                  , # 189
"mirion"                       , # 190
"mica"                         , # 193
"ma.prudentium"                , # 199
"terrasteel"                   , # 210
"thaumium"                     , # 213
"enderium"                     , # 213
"tough"                        , # 215
"pink_metal"                   , # 216
"weezer"                       , # 221
"iridium"                      , # 234
"wyvern_plustic"               , # 235
"hard_carbon"                  , # 243
"wyvern_metal"                 , # 245
"integrationforegoing.plastic" , # 261
"ma.intermedium"               , # 270
"dragonsteel_fire"             , # 273
"dragonsteel_ice"              , # 273
"boron_nitride"                , # 282
"titanium"                     , # 286
"starmetal"                    , # 301
"soularium"                    , # 313
"integrationforegoing.pink_slime", # 316
"draconic_metal"               , # 323
"integrationforegoing.reinforced_pink_slime", # 367
"ma.superium"                  , # 370
"awakened_plustic"             , # 383
"osmiridium"                   , # 391
"chaotic_metal"                , # 402
"ma.supremium"                 , # 495
"chaotic_plustic"              , # 510
"infinity_avaritia_plustic"    , # 1309
] as IData;

static matsOnlyForArmor as string[] = [
  "chitinbrowndeathworm",
  "chitintandeathworm",
  "chitinwhitedeathworm",
  "leatherforesttroll",
  "leatherfrosttroll",
  "leathermountaintroll",
  "scalebluedragon",
  "scaleblueseaserpent",
  "scalebronzedragon",
  "scalebronzeseaserpent",
  "scaledeepblueseaserpent",
  "scalegraydragon",
  "scalegreendragon",
  "scalegreenseaserpent",
  "scalepurpleseaserpent",
  "scalereddragon",
  "scaleredseaserpent",
  "scalesapphiredragon",
  "scalesilverdragon",
  "scaletealseaserpent",
  "scalewhitedragon",
] as string[];

static armorStaged as IData[string] = scripts.DataTables.armorStaged;

static armorEntitys as IData[] = 
[
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
        ticWeapons: ["broadsword", "longsword", "rapier", "frypan", "battlesign", "cleaver"]
      },
      {
        # Rare
        weight: 2,
        ticMats: ["iron", "pigiron", "knightslime", "slime", "blueslime", "magmaslime", "netherrack", "cobalt", "ardite", "manyullyn", "steel"],
        ticWeapons: ["hammer", "lumberaxe", "scythe", ]
      },
      {
        # Workers
        weight: 6,
        ticMats: ["stone", "flint", "treatedwood", "xu_magical_wood", "firewood", "chocolate", "livingwood_plustic", "ma.soulium", "integrationforegoing.plastic", "soularium", "leathermountaintroll", "leatherforesttroll", "certusquartz_plustic", "obsidian", "lead", "dragonbone", "pigiron", ],
        ticWeapons: ["pickaxe", "shovel", "hatchet", "mattock", "kama", "excavator"]
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
        ticMats: ["copper", "bronze", "nickel", "scalebronzedragon", "cheese", "scalebronzeseaserpent", "magmaslime", "energetic_alloy", "electrum", "fierymetal", "amber", "topaz", "lumium_plustic", "xu_evil_metal", "refinedglowstone", "awakened_plustic"],
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
        ticMats: ["blueslime", "cobalt", "scaletealseaserpent", "scaledeepblueseaserpent", "scalesapphiredragon", "ma.base_essence", "starmetal", "psimetal", "sapphire", "psigem", "platinum_plustic", "manasteel", "palis_actadd_plustic", "diamatine_actadd_plustic", "hard_carbon", "tanzanite", "osmiridium", "pladium", "refinedobsidian", "ionite", "ma.superium"]
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
    while (roll < 100 && !isNull(mat) && (matsOnlyForArmor has mat.definition.name)){
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
function buildTiCTool(slotId as int, matList as ITICMaterial[], def as IItemDefinition) as IItemStack{
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
    probs += probs[i - 1] * min(random() + 0.5d, 1.0d);
  }
  var equipSequence = [4, 1, 2, 3, 0, 5] as int[];

  # Calculate probabilities
  # bigger number - less chance
  # 30% more armor in other dimensions than Overworld
  val armChance = 0.8d;
  var tolerance = (world.dimension==0) ? armChance : (armChance * 0.7d);

  for j in 0 to 6{
    if ( probs[j] > tolerance ) {
    # if (equipProbability(slotsOffset[i])) {
      var i = equipSequence[j]; # Change sequence
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
        val fourMaterials as ITICMaterial[] = (i < 4) ? randTicMatsArmor : randTicMatsWeapn;

        if (i!=5) { # If not offhand
          var def as string;
          if (i == 4 && !isNull(currGroup.ticWeapons)){ # If main hand
            def = "tconstruct:" ~ pick_qubic(currGroup.ticWeapons);
          }else{ 
            def = armDefinitions[i][0];
          }

          equip = buildTiCTool(i, fourMaterials, itemUtils.getItem(def).definition);

          # Damage item
          val rndDamage = (0.35d + random() / 2.0d) as float;
          val dmg = min(min(32766, equip.maxDamage), max(1, (equip.maxDamage as float * rndDamage) as int));
          // print("<<<DAMAGE>>>: " ~ dmg ~ " equip: " ~ equip.displayName);
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
  var entity = e.entityLivingBase;
  var iGroup = getGroup(entity);# Chose IData
  if (!isNull(iGroup)){
    addEquipment(iGroup, entity, e.world);
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