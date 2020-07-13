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
"aethium",
"aluminium",
"alumite",
"amber",
"amethyst",
"amphithere_feather",
"aquamarine",
"ardite",
"awakened_plustic",
"black_quartz",
"blackquartz_plustic",
"blaze",
"bloodbronze",
"blueslime",
"bone",
"boron",
"boron_nitride",
"bound_metal",
"bronze",
"cactus",
"certus_quartz",
"certusquartz_plustic",
"chaotic_metal",
"chaotic_plustic",
"cheese",
"chitinbrowndeathworm",
"chitintandeathworm",
"chitinwhitedeathworm",
"chocolate",
"cobalt",
"conductive_iron",
"constantan",
"construction_alloy",
"copper",
"dark_steel",
"desert_myrmex",
"diamantine_crystal",
"diamatine_actadd_plustic",
"draconic_metal",
"draconium",
"dragonbone",
"dragonsteel_fire",
"dragonsteel_ice",
"dreamwood",
"electrical_steel",
"electrum",
"elementium",
"emeradic_actadd_plustic",
"emerald_plustic",
"emeraldic_crystal",
"end_steel",
"enderium",
"enderium_plustic",
"endrod",
"endstone",
"energetic_alloy",
"energetic_metal",
"enori_actadd_plustic",
"enori_crystal",
"erodium",
"essence_metal",
"feather",
"fierymetal",
"firewood",
"flint",
"fluix",
"fluix_steel",
"fluixcrystal_plustic",
"hard_carbon",
"heavy",
"hemp",
"ice",
"infinity_avaritia_plustic",
"integrationforegoing.plastic",
"invar",
"ionite",
"iridium",
"iron",
"jungle_myrmex",
"knightmetal",
"knightslime",
"kyronite",
"lead",
"leaf",
"leatherforesttroll",
"leatherfrosttroll",
"leathermountaintroll",
"litherite",
"livingrock",
"livingwood",
"livingwood_plustic",
"lonsdaleite",
"lumium",
"lumium_plustic",
"ma.base_essence",
"ma.inferium",
"ma.intermedium",
"ma.prosperity",
"ma.prudentium",
"ma.soulium",
"ma.superium",
"ma.supremium",
"magmaslime",
"magnesium",
"malachite_gem",
"mana_string",
"manasteel",
"manyullyn",
"meat_metal",
"mica",
"mirion",
"nagascale",
"netherrack",
"nickel",
"obsidian",
"osgloglas",
"osmiridium",
"osmium",
"palis_actadd_plustic",
"palis_crystal",
"paper",
"peridot",
"pigiron",
"pink_metal",
"pink_slime",
"pladium",
"plague_metal",
"platinum",
"platinum_plustic",
"polyethylene",
"potato",
"primal_metal",
"prismarine",
"psigem",
"psimetal",
"pulsating_iron",
"raven_feather",
"redstone_alloy",
"reed",
"refined_glowstone",
"refined_obsidian",
"refinedglowstone",
"refinedobsidian",
"restonia_actadd_plustic",
"restonia_crystal",
"rubber",
"ruby",
"sapphire",
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
"sentient_metal",
"signalum",
"signalum_plustic",
"silver",
"sky_stone",
"slime",
"slimeleaf_blue",
"slimeleaf_orange",
"slimeleaf_purple",
"slimevine_blue",
"slimevine_purple",
"soularium",
"sponge",
"starmetal",
"steel",
"steeleaf",
"stone",
"string",
"string_cheese",
"stymph_feather",
"tanzanite",
"terrasteel",
"thaumium",
"thorium",
"tin",
"titanium",
"tnt",
"topaz",
"tough",
"treatedwood",
"universal_metal",
"uranium",
"vibrant_alloy",
"vine",
"void_actadd_plustic",
"void_crystal",
"void_metal",
"weezer",
"wood",
"wyvern_metal",
"wyvern_plustic",
"xu_demonic_metal",
"xu_enchanted_metal",
"xu_evil_metal",
"xu_magical_wood",
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
        # TIC Default
        weight: 20,
        ticMats: defaultMats,
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
          val dmg = min(equip.maxDamage, max(1, (equip.maxDamage as float * rndDamage) as int));
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