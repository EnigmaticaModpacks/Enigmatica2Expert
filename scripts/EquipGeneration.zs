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
static defaultMats as IData = [
"wood",
"bone",
"stone",
"cactus",
"flint",
"ma.prosperity",
"blueslime",
"soularium",
"netherrack",
"conductive_iron",
"redstone_alloy",
"copper",
"pulsating_iron",
"lead",
"bronze",
"treatedwood",
"integrationforegoing.plastic",
"chocolate",
"sponge",
"slime",
"construction_alloy",
"integrationforegoing.pink_slime",
"endstone",
"xu_magical_wood",
"cheese",
"electrum",
"uranium",
"electrical_steel",
"livingwood_plustic",
"ardite",
"magnesium",
"iridium",
"obsidian",
"bloodbronze",
"silver",
"nickel",
"pigiron",
"knightslime",
"invar",
"iron",
"chitinbrowndeathworm",
"chitintandeathworm",
"chitinwhitedeathworm",
"leatherforesttroll",
"leatherfrosttroll",
"leathermountaintroll",
"scaleblueseaserpent",
"scalebronzeseaserpent",
"scaledeepblueseaserpent",
"scalegreenseaserpent",
"scalepurpleseaserpent",
"scaleredseaserpent",
"scaletealseaserpent",
"cobalt",
"thorium",
"xu_enchanted_metal",
"scalebluedragon",
"scalebronzedragon",
"scalegraydragon",
"scalegreendragon",
"scalereddragon",
"scalesapphiredragon",
"scalesilverdragon",
"scalewhitedragon",
"constantan",
"starmetal",
"steel",
"firewood",
"prismarine",
"magmaslime",
"void_actadd_plustic",
"thaumium",
"ma.base_essence",
"alumite",
"peridot",
"ruby",
"sapphire",
"emerald_plustic",
"manyullyn",
"ma.soulium",
"blackquartz_plustic",
"certusquartz_plustic",
"ma.inferium",
"psigem",
"psimetal",
"end_steel",
"signalum_plustic",
"enori_actadd_plustic",
"energetic_alloy",
"desert_myrmex",
"jungle_myrmex",
"integrationforegoing.",
"boron",
"osmium",
"palis_actadd_plustic",
"amber",
"nagascale",
"hard_carbon",
"titanium",
"platinum_plustic",
"elementium",
"manasteel",
"topaz",
"mica",
"litherite",
"plague_metal",
"dragonbone",
"dark_steel",
"fluixcrystal_plustic",
"malachite_gem",
"restonia_actadd_plustic",
"tough",
"diamatine_actadd_plustic",
"terrasteel",
"lumium_plustic",
"boron_nitride",
"ma.prudentium",
"tanzanite",
"enderium_plustic",
"erodium",
"emeradic_actadd_plustic",
"osmiridium",
"amethyst",
"steeleaf",
"knightmetal",
"fierymetal",
"vibrant_alloy",
"mirion",
"kyronite",
"ma.intermedium",
"refinedglowstone",
"weezer",
"pladium",
"xu_evil_metal",
"aethium",
"ionite",
"ma.superium",
"wyvern_plustic",
"ma.supremium",
"awakened_plustic",
"dragonsteel_fire",
"dragonsteel_ice",
"chaotic_plustic",
"infinity_avaritia_plustic",
"osgloglas",
"refinedobsidian",
"xu_demonic_metal",
] as IData;

static matsOnlyForArmor as IData = [
"leatherfrosttroll",
"chitintandeathworm",
"scalebronzedragon",
"scaleblueseaserpent",
"scalepurpleseaserpent",
"scalewhitedragon",
"chitinwhitedeathworm",
"chitinbrowndeathworm",
"scalegraydragon",
"scalesapphiredragon",
"scaletealseaserpent",
"scalebluedragon",
"leatherforesttroll",
"scalegreendragon",
"leathermountaintroll",
"scalebronzeseaserpent",
"scalereddragon",
"scaledeepblueseaserpent",
"scaleredseaserpent",
"scalegreenseaserpent",
"scalesilverdragon",
] as IData;

static armorStaged as IData[string] = scripts.DataTables.armorStaged;
static defaultArmGroups as IData = scripts.DataTables.armorSortedKeys as IData;

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
        # Defaults
        weight: 20,
        classicEquips: defaultArmGroups//["armor_hardenedleather", "armor_iron", "armor_golden", "armor_steel", "armor_diamond", "armor_boron", "armor_manyullyn", "armor_myrmex", "armor_tough"]
      },
      {
        # TIC Default
        weight: 20,
        ticMats: defaultMats,
        ticWeapons: ["broadsword", "longsword", "rapier", "frypan", "battlesign", "cleaver"]
      },
      {
        # Rare
        weight: 1,
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
        classicEquips: ["armor_golden", "armor_hazmat", "armor_fiery", "armor_myrmex", "armor_flux", "armor_intermedium", "armor_dragonscale", "armor_dragonsteel"]
      },
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
        classicEquips: ["armor_steel", "armor_nano", "armor_dark_steel", "armor_void"]
      },
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
        classicEquips: ["armor_hardenedleather", "armor_manaweave", "armor_iron", "armor_psimetal", "armor_knightmetal", "armor_deathworm", "armor_yeti", "armor_end_steel", "armor_boron_nitride"]
      },
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
        classicEquips: ["armor_manasteel", "armor_steeleaf", "armor_diamond", "armor_terrasteel", "armor_inferium", "armor_arctic", "armor_prudentium", "armor_tide", "armor_boron_nitride", "armor_superium", ]
      },
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


// function rnd2()  as double { var a as double = random(); return a*a; }
// function rnd2n() as double { return 1.0d - rnd2(); }
//function rnd_qubic_() as double { return 1.0d - rnd_qubic(); }
//function pick_liner(list as IData) as string { return list[(random()    * (list.length as double)) as int].asString(); }
function rnd_qubic()  as double { var a as double = random(); return a*a*a; }
function equipProbability(offset as double) as bool { return random() <= 0.75d * offset; }
function pick_qubic(list as IData) as string { return list[(rnd_qubic() * (list.length as double)) as int].asString(); }

function rndToolPart(mats as IData) as ITICMaterial{
  return Toolforge.getMaterialFromID( pick_qubic(mats) );
}

function getFourRandomTicMats(listTicmats as IData) as ITICMaterial[] {
  return [
    rndToolPart(listTicmats), 
    rndToolPart(listTicmats), 
    rndToolPart(listTicmats), 
    rndToolPart(listTicmats)
  ] as ITICMaterial[];
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
  var fourRandomTicMats as ITICMaterial[] = null;
  var randomClassic as string = null;
  
  # Generate probabilityes for each slot
  var probs = [random()] as double[];
  for i in 1 to 6 { 
    probs += probs[i - 1] * min(random() + 0.5d, 1.0d);
  }
  var equipSequence = [4, 1, 2, 3, 0, 5] as int[];

  # Calculate probabilities
  var tolerance = (world.dimension==0) ? 0.6d : 0.45d;

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
        # We have TicMats
        if (isNull(fourRandomTicMats) && !isNull(currGroup.ticMats)) {
          fourRandomTicMats = getFourRandomTicMats(currGroup.ticMats); 
        }
        if (i!=5) { # If not offhand
          var def as string;
          if (i == 4 && !isNull(currGroup.ticWeapons)){ # If main hand
            def = "tconstruct:" ~ pick_qubic(currGroup.ticWeapons);
          }else{
            def = armDefinitions[i][0];
          }

          equip = buildTiCTool(i, fourRandomTicMats, itemUtils.getItem(def).definition);
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
  # onSpawnEvent(event);
});

events.onCheckSpawn(function(event as EntityLivingSpawnEvent){
  # onSpawnEvent(event);
});