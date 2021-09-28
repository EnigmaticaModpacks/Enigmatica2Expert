import crafttweaker.data.IData;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.event.EntityLivingSpawnEvent;
import crafttweaker.item.IItemDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import mods.ctintegration.scalinghealth.DifficultyManager;
import mods.ctutils.utils.Math.max;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.abs;
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
static OVERWORLD_EQUIP_CHANCE as double = 0.8d; // Chance modifier for Overworld
static NEXT_EQUIP_CHANCE as double      = 0.35d; // Reroll addition for next equipment slot

static SCALLINGHEALTH_MAX_DIFFICULTY as double = 
/*Inject_js(config('scalinghealth/main.cfg').main.difficulty['Max Value']+'.0d;')*/
1000.0d;
/**/

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


function rnd_qubic(w as IWorld)  as double { var a as double = w.random.nextDouble(); return a*a*a; }
function dataOrData(a as IData, b as IData) as IData {return isNull(a) ? b : a;}
function pick_qubic(list as IData, w as IWorld) as string { return list[(rnd_qubic(w) * list.length) as int].asString(); }
function pick_qubic_adv(list as IData, d as double, w as IWorld) as string {
  // val _min = max(0, min(list.length - 4, list.length * pow(d, 2.0d)) - shift);
  // val index = (abs(a*a*a) * (list.length - _min) + _min) as int;
  val a = w.random.nextDouble();
  val b = abs(pow(a, 4.0d * pow(1.1d - d, 2)));
  val index = (min(0.9999d, max(0.0d, b)) * list.length) as int;
  return list[index].asString();
}

function rndToolPart(_mats as IData, d as double, forWeapon as bool, w as IWorld) as ITICMaterial{
  val defaults = forWeapon
    ? scripts.equipment.equipData.normDefs.tool
    : scripts.equipment.equipData.normDefs.armor;
  var i = 0;
  var mats = dataOrData(_mats, defaults);
  var matName = pick_qubic_adv(mats, d, w);
  if (!isNull(_mats)) while (i < 20 && !(defaults has matName)) {
    matName = pick_qubic_adv(mats, d, w);
    i+=1;
  }

  var mat = Toolforge.getMaterialFromID(matName);
  while (i < 100 && isNull(mat)) {
    matName = pick_qubic_adv(mats, d, w);
    mat = Toolforge.getMaterialFromID(matName);
    i += 1;
  }
  return mat;
}

function getFourRandomTicMats(listTicmats as IData, difficulty as double, forWeapon as bool, w as IWorld) as ITICMaterial[] {
  return [
    rndToolPart(listTicmats, difficulty, forWeapon, w),
    rndToolPart(listTicmats, difficulty, forWeapon, w),
    rndToolPart(listTicmats, difficulty, forWeapon, w),
    rndToolPart(listTicmats, difficulty, forWeapon, w)
  ] as ITICMaterial[];
}

# Create random equipment
function buildTiCTool(matList as ITICMaterial[], def as IItemDefinition) as IItemStack{
  if (!isNull(matList[0]) && !isNull(matList[1]) && !isNull(matList[2]) && !isNull(matList[3])){
    return Toolforge.buildTool(def, matList[0], matList[1], matList[2], matList[3] );
  }
  return null;
}

function getWeightedGroup(entry as IData, w as IWorld) as IData {
  if(isNull(entry.groups.asList())) return entry.groups;
  if(entry.groups.length == 1) return entry.groups[0];

  val norm = scripts.equipment.equipData.normalizedWeights[entry];
  val rnd = w.random.nextDouble();
  for i, pos in norm {
    if(rnd < pos) return entry.groups[i];
  }
  return entry.groups[0];
}

function getEquipCount(isOverworld as bool, difficulty as double, w as IWorld) as int {
  # Calculate probabilities
  # bigger number - less chance
  # ~30% more armor in other dimensions than Overworld
  val tolerance = DEFAULT_EQUIP_CHANCE * (isOverworld ? 1.0d : OVERWORLD_EQUIP_CHANCE) / (1.0d + pow(difficulty, 2) * 4.0d);
  var currProb = w.random.nextDouble();
  var maxEquips= 0;
  for i in 0 to 6 {
    if(currProb < tolerance) break;
    currProb *= min(w.random.nextDouble() + NEXT_EQUIP_CHANCE, 1.0d);
    maxEquips += 1;
  }
  return maxEquips;
}

function addRandomModifiers(item as IItemStack, isArmor as bool, w as IWorld) as IItemStack {
  var picked = [] as string[];
  var equip = item;
  for i in 0 to ((rnd_qubic(w) * 5.0d + 1.0d) as int) {
    var mod as string = null;
    var antiloop = 0;
    while (picked has mod && antiloop < 100) {
      mod = pick_qubic(isArmor
        ? scripts.equipment.utils_tcon.allArmorModifiers
        : scripts.equipment.utils_tcon.allToolModifiers
      , w);
      antiloop += 1;
    }
    picked += mod;
    equip = scripts.equipment.utils_tcon.addModifier(equip, mod);
  }
  return equip;
}

function getDifficulty(entity as IEntity) as double {
  val area = DifficultyManager.getAreaDifficulty(entity.world, entity.position3f.asBlockPos());
  return area / SCALLINGHEALTH_MAX_DIFFICULTY;
}

# Generate equipmnts
function equipEntity(iGroup as IData, entity as IEntityLivingBase, world as IWorld) as void {
  val difficulty = getDifficulty(entity);

  val maxEquips = getEquipCount(world.dimension==0, difficulty, world);
  if(maxEquips < 1) return;

  # Pick tier
  val currGroup = getWeightedGroup(iGroup, world);
  val randTicMatsWeapn =                   getFourRandomTicMats(currGroup.ticMats, difficulty, true, world);
  val randTicMatsArmor = (maxEquips > 1) ? getFourRandomTicMats(currGroup.ticMats, difficulty, false, world) : null;

  val equipSequence = [4, 1, 2, 3, 0, 5] as int[];
  for j in 0 to maxEquips {
    var i = equipSequence[j]; # Change sequence
    if(i==5) continue; # Skip Offhand

    var isArmor = i <= 3; // True for armor, false for tool

    // Find equipment type
    var equipID as string = null;
    if(isArmor) {
      equipID = scripts.equipment.equipData.armDefinitions[i][0];
    } else {
      if(isNull(currGroup.ticWeapons)) continue;
      var weapon = pick_qubic(currGroup.ticWeapons, world);
      equipID = (!weapon.contains(":") ? "tconstruct:" : "") ~ weapon;
    }
    var equipBase = itemUtils.getItem(equipID);
    if (isNull(equipBase)) {
      // logger.logWarning("equipGeneration.zs: trying to equip non-existent tool <" ~ equipID ~ ">");
      continue;
    }

    # Build tool/armor piece
    var equip = buildTiCTool(
      isArmor ? randTicMatsArmor : randTicMatsWeapn,
      equipBase.definition
    );

    // Equip is invalid, skip
    if(isNull(equip)) continue;

    // Add TconEvo "Artifact" modifier (ask for Unsealing to modify)
    equip = equip.withTag(scripts.equipment.utils_tcon.addSingleModifier(equip.tag, "tconevo.artifact"));

    // Other random mods
    if (world.random.nextDouble() < difficulty + 0.25d) equip = addRandomModifiers(equip, isArmor, world);

    # Damage item
    if(equip.isDamageable) {
      val rndDamage = (0.35d + world.random.nextDouble() / 2.0d) * equip.maxDamage;
      val dmg = min(32766, max(1, rndDamage as int));
      equip = equip.withDamage(dmg);
    }

    entity.setItemToSlot(slots[i], equip);
  }
}

# -------------------------------
# Spawn Event
# -------------------------------

# Search armorEntitys for entity ID
function getGroup(entity as string) as IData {
  for group in scripts.equipment.equipData.armorEntitys.asList() {
    for i in 0 to group.entityID.length{
      if (entity == group.entityID[i].asString()) {
        return group;
      }
    }
  }
  return null;
}

function onSpawnEvent(e as crafttweaker.event.EntityJoinWorldEvent) as void {
  if(e.world.isRemote() || !(e.entity instanceof IEntityLivingBase)) return;
  val entity as IEntityLivingBase = e.entity;

  if(isNull(e.entity.definition) || isNull(e.entity.definition.id)) return;
  val iGroup = getGroup(entity.definition.id);

  if (isNull(iGroup) || isNull(iGroup.groups)) return;
  equipEntity(iGroup, entity, e.world);
}

# -------------------------------
# Hook on events
# -------------------------------
events.onEntityJoinWorld(function(event as crafttweaker.event.EntityJoinWorldEvent){
  onSpawnEvent(event);
});