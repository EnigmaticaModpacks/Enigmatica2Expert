#loader contenttweaker

import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;
import mods.contenttweaker.conarm.ArmorTraitBuilder;
import mods.contenttweaker.conarm.ExtendedMaterialBuilder;
import mods.contenttweaker.tconstruct.TraitBuilder;
import mods.contenttweaker.tconstruct.MaterialBuilder;
import mods.ctutils.utils.Math.max;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.sqrt;
import mods.ctutils.utils.Math.ceil;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlock;
import crafttweaker.data.IData;

import scripts.cot.utils_tcon_cot.getItemMatAmount;
import scripts.cot.utils_tcon_cot.getArmorMatsAmount;

/*
Some taken from: wilderness-minecraft
https://github.com/badmonkey/wilderness-minecraft/blob/f32102d158566de9d346034b35c2f6226d369ff9/forge1.12/wilderness/scripts/content/traits_tcon.zs
*/

//
// blindrage
//
val rage = TraitBuilder.create('blindrage');
rage.color = 0x080808;
rage.localizedName = 'Blind Rage';
rage.localizedDescription = '§oWho said you needed to see your enemies?\n§rDeal double damage when blinded';
rage.calcDamage = function (trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
  if (attacker.isPotionActive(<potion:minecraft:blindness>)) {
    return newDamage * 2.0;
  }
  else {
    return newDamage;
  }
};
rage.register();

//
// darkness
//
val dark = TraitBuilder.create('darkness');
dark.color = 0x332C3B;
dark.localizedName = 'Eternal Darkness';
dark.localizedDescription = '§oJoin the dark side...\n§rYour tool loves the dark so much; it does more damage in the dark.';
dark.calcDamage = function (trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
  var light = attacker.world.getBrightness(attacker.getX(), attacker.getY(), attacker.getZ());
  return newDamage * (2.0f - light as float / 15.0f);
};
dark.register();

//
// dire
//
val dire = TraitBuilder.create('dire');
dire.color = 0x54514A;
dire.localizedName = 'Dire-Hit';
dire.localizedDescription = "§oIt's super effective!\n§rYour tool will always land critical hits so long as you are at full health!";
dire.calcCrit = function (trait, tool, attacker, target) {
  return attacker.health >= attacker.maxHealth;
};
dire.register();

//
// lifecycle
//
val life = TraitBuilder.create('lifecycle');
life.color = 0xFF2010;
life.localizedName = 'Cycle of Life';
life.localizedDescription = '§oFrom one to another.\n§rWhen your tool is damaged, you are healed for the damaged amount.';
life.onToolDamage = function (trait, tool, unmodifiedAmount, newAmount, holder) {
  holder.heal(newAmount);
  return newAmount;
};
life.register();

//
// antimagic
//
val antimagic = ArmorTraitBuilder.create('antimagic');
antimagic.color = 0x000000;
antimagic.localizedName = 'Anti-Magic';
antimagic.localizedDescription = "§oNihilistic!\n§rYour armor doesn't believe in potions, and refuses to be affected by any potion effects; good or bad.";
antimagic.onHurt = function (trait, armor, player, source, damage, newDamage, evt) {
  if (armor.damage < armor.maxDamage && source.isMagicDamage()) {
    evt.cancel();
  }
  return newDamage;
};
antimagic.onArmorTick = function (trait, armor, world, player) {
  if (world.getWorldTime() % 10 == 0) player.clearActivePotions();
};
antimagic.register();

//
// darkside
//
val darkdefense = ArmorTraitBuilder.create('darkside');
darkdefense.color = 0x332C3B;
darkdefense.localizedName = 'The Dark Side';
darkdefense.localizedDescription = '§oUnder the cover of darkness!\n§rYour armor loves the dark so much; you take less damage when in darkness.';
darkdefense.onHurt = function (trait, armor, player, source, damage, newDamage, event) {
  return newDamage * (0.75 + 0.25 * player.world.getBrightness(player.x, player.y, player.z) / 15.0);
};
darkdefense.register();

//
// mentor
//
val mentor = TraitBuilder.create('mentor');
mentor.color = 0x216E2A;
mentor.localizedName = game.localize('e2ee.tconstruct.material.mentor.name');
mentor.localizedDescription = game.localize('e2ee.tconstruct.material.mentor.description');
mentor.calcDamage = function (trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
  if (!attacker instanceof IPlayer) return newDamage;
  val player as IPlayer = attacker;
  val level = getItemMatAmount(tool, 'essence_metal');
  if (level <= 0) return newDamage;
  player.xp = max(0, player.xp - level);
  // player.removeExperience((player.getTotalXP() as float * (0.03f * level as float) + 1.0f) as int);
  return newDamage + sqrt(player.xp * level);
};
mentor.register();

var
  trait_armor = ArmorTraitBuilder.create('apprentice');
trait_armor.color = 0x216E2A;
trait_armor.localizedName = game.localize('e2ee.tconstruct.material.apprentice.name');
trait_armor.localizedDescription = game.localize('e2ee.tconstruct.material.apprentice.description');
trait_armor.onHurt = function (trait, armor, victim, source, damage, newDamage, evt) {
  var level = 1;
  if (victim instanceof IPlayer) {
    val player as IPlayer = victim;
    level = getArmorMatsAmount(player, 'essence_metal');
    player.addExperience((ceil(newDamage as double / 10.0d) * level as double) as int);
  }
  return newDamage + (newDamage as double * (0.1d * level as double)) as int;
};
trait_armor.register();

//
// spectre
//
val spectre = ExtendedMaterialBuilder.create('spectre');
spectre.color = 0x9CC1CE;
spectre.craftable = false;
spectre.castable = true;
spectre.representativeItem = <item:randomthings:ingredient:3>;
spectre.liquid = <liquid:spectre>;
spectre.addItem(<ore:ingotSpectre>);
spectre.localizedName = game.localize('e2ee.tconstruct.material.spectre.name');
spectre.addHeadMaterialStats(400, 4.2, 6.0, 7);
spectre.addHandleMaterialStats(1.4, -50);
spectre.addExtraMaterialStats(64);
spectre.addBowMaterialStats(1.0f / 1.5f, 1.0, 2.5);
spectre.addProjectileMaterialStats();
spectre.addCoreMaterialStats(200, 23.3);
spectre.addPlatesMaterialStats(1.6, 100, 2);
spectre.addTrimMaterialStats(70);
spectre.register();

static spectreUpdateTime as int = 80;
static hasPotioncore as bool = loadedMods.contains('potioncore');

function spectreMechanic(world as IWorld, player as IPlayer, level as int) as void {
  if (world.isRemote()) return;
  if (isNull(player)) return;
  val levelMult = hasPotioncore ? 1 : 3;
  val newEffect = hasPotioncore ? <potion:potioncore:reach> : <potion:cyclicmagic:magnet>;
  if (!player.isPotionActive(newEffect)) {
    player.addPotionEffect(newEffect.makePotionEffect(spectreUpdateTime, level * levelMult - 1));
    return;
  }
  val existEffect = player.getActivePotionEffect(newEffect);
  player.addPotionEffect(newEffect.makePotionEffect(spectreUpdateTime, existEffect.amplifier + level * levelMult));
}

val spectre_trait = TraitBuilder.create('spectre');
spectre_trait.color = 0x9CC1CE;
spectre_trait.localizedName = game.localize('e2ee.tconstruct.material.spectre.name');
spectre_trait.localizedDescription = game.localize('e2ee.tconstruct.material.spectre.description');
spectre_trait.onUpdate = function (trait, tool, world, owner, itemSlot, isSelected) {
  if (!isSelected) return;
  if (world.getWorldTime() % spectreUpdateTime != 0) return;
  if (!owner instanceof IPlayer) return;
  val player as IPlayer = owner;
  spectreMechanic(world, player, getItemMatAmount(tool, 'spectre'));
};
spectre_trait.register();

val spectre_armor = ArmorTraitBuilder.create('spectre');
spectre_armor.color = 0x9CC1CE;
spectre_armor.localizedName = game.localize('e2ee.tconstruct.material.spectre.name');
spectre_armor.localizedDescription = game.localize('e2ee.tconstruct.material.spectre.description');
spectre_armor.onAbility = function (trait, level, world, player) {
  if (world.getWorldTime() % spectreUpdateTime != 0) return;
  spectreMechanic(world, player, getArmorMatsAmount(player, 'spectre'));
};
spectre_armor.register();

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
var
  mat = MaterialBuilder.create('spectre_string');
mat.color = 0x90A4AE;
mat.craftable = true;
mat.castable = false;
mat.representativeItem = <item:randomthings:ingredient:12>;
mat.addItem(<item:randomthings:ingredient:12>);
mat.localizedName = game.localize('e2ee.tconstruct.material.spectre_string.name');
mat.addBowStringMaterialStats(2.2);
mat.register();

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
mat = MaterialBuilder.create('alpha_fur');
mat.color = 0x2196F3;
mat.craftable = true;
mat.castable = false;
mat.representativeItem = <item:twilightforest:alpha_fur>;
mat.addItem(<item:twilightforest:alpha_fur>);
mat.localizedName = game.localize('e2ee.tconstruct.material.alpha_fur.name');
mat.addHeadMaterialStats(300, 2.0, 1.0, 1);
mat.addHandleMaterialStats(0.1, 100);
mat.addExtraMaterialStats(80);
mat.addBowMaterialStats(1.0, 0.3, 1.0);
mat.addProjectileMaterialStats();
mat.register();

trait_armor = ArmorTraitBuilder.create('alpha_fur');
trait_armor.color = 0x2196F3;
trait_armor.localizedName = game.localize('e2ee.tconstruct.material.alpha_fur.name');
trait_armor.localizedDescription = game.localize('e2ee.tconstruct.material.alpha_fur.description');
trait_armor.onHurt = function (trait, armor, player, source, damage, newDamage, evt) {
  if (!isNull(source.getTrueSource()) && source.getTrueSource() instanceof IEntityLivingBase) {
    var attacker as IEntityLivingBase = source.getTrueSource();
    attacker.addPotionEffect(<potion:twilightforest:frosted>.makePotionEffect(60, 5));
  }
  return newDamage;
};
trait_armor.register();

var
  trait = TraitBuilder.create('alpha_fur');
trait.color = 0x2196F3;
trait.localizedName = game.localize('e2ee.tconstruct.material.alpha_fur.name');
trait.localizedDescription = game.localize('e2ee.tconstruct.material.alpha_fur.description');
trait.afterHit = function (trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
  target.addPotionEffect(<potion:twilightforest:frosted>.makePotionEffect(60, 4));
};
trait.register();

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
// -------------------------------
// Grinding Tait
// -------------------------------
val grindingTrait = ArmorTraitBuilder.create('grinding');
grindingTrait.color = 0x444450;
grindingTrait.localizedName = game.localize('e2ee.tconstruct.material.grinding.name');
grindingTrait.localizedDescription = game.localize('e2ee.tconstruct.material.grinding.description');
grindingTrait.onFalling = function (trait, armor, player, event) {
  if (event.entityLivingBase.world.isRemote()) return;
  scripts.cot.trait_grinding.onFalling(armor, player);
};
grindingTrait.onAbility = function (trait, level, world, player) {
  if (world.isRemote()) return;
  scripts.cot.trait_grinding.onAbility(trait, level, world, player);
};
grindingTrait.register();

// -------------------------------
// Tic + Conarm Material
// -------------------------------
val heavy = ExtendedMaterialBuilder.create('heavy');

heavy.liquid = <liquid:heavy_metal>;
heavy.castable = true;
heavy.craftable = false;

heavy.color = 0x444450;
heavy.addItem(<item:mechanics:heavy_ingot>);
heavy.representativeItem = <item:mechanics:heavy_ingot>;
heavy.localizedName = game.localize('e2ee.tconstruct.material.heavy.name');
heavy.itemLocalizer = function (thisMaterial, itemName) {
  return game.localize('e2ee.tconstruct.material.heavy.name') + ' ' + itemName;
};
heavy.addHeadMaterialStats(-200, 0.1, 25.0, 5);
heavy.addExtraMaterialStats(-40);
heavy.addHandleMaterialStats(0.5, -10);
heavy.addBowMaterialStats(0.1, 0.1, 25);
heavy.addArrowShaftMaterialStats(0.2, -10);

heavy.addCoreMaterialStats(10, 2.5);
heavy.addPlatesMaterialStats(0.3, 5, 0);
heavy.addTrimMaterialStats(0.4);

heavy.addMaterialTrait('heavy', 'head');
heavy.addMaterialTrait('heavy', 'core');
heavy.addMaterialTrait('heavy', 'plates');
heavy.addMaterialTrait('grinding_armor');
heavy.addProjectileMaterialStats();
heavy.register();

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
// -------------------------------
// Axe Tait
// -------------------------------
var t = TraitBuilder.create('axing');
t.color = 0xA3B391;
t.localizedName = game.localize('e2ee.tconstruct.material.axing.name');
t.localizedDescription = game.localize('e2ee.tconstruct.material.axing.description');
t.register();

t = TraitBuilder.create('axing2');
t.color = 0xC4D6AE;
t.localizedName = game.localize('e2ee.tconstruct.material.axing2.name');
t.localizedDescription = game.localize('e2ee.tconstruct.material.axing2.description');
t.register();

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/*
███╗   ███╗██╗████████╗██╗  ██╗██████╗ ██╗██╗     ██╗     ██╗██╗   ██╗███╗   ███╗
████╗ ████║██║╚══██╔══╝██║  ██║██╔══██╗██║██║     ██║     ██║██║   ██║████╗ ████║
██╔████╔██║██║   ██║   ███████║██████╔╝██║██║     ██║     ██║██║   ██║██╔████╔██║
██║╚██╔╝██║██║   ██║   ██╔══██║██╔══██╗██║██║     ██║     ██║██║   ██║██║╚██╔╝██║
██║ ╚═╝ ██║██║   ██║   ██║  ██║██║  ██║██║███████╗███████╗██║╚██████╔╝██║ ╚═╝ ██║
╚═╝     ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝     ╚═╝
*/
// Vis Siphon (tools)
/*
_  _ _ ____    ____ _ ___  _  _ ____ _  _    ___ ____ ____ _    ____
|  | | [__     [__  | |__] |__| |  | |\ |     |  |  | |  | |    [__
 \/  | ___]    ___] | |    |  | |__| | \|     |  |__| |__| |___ ___]

*/

val visSiphon_Trait = TraitBuilder.create('vis_siphon');
visSiphon_Trait.color = 2852604;
visSiphon_Trait.localizedName = game.localize('e2ee.tconstruct.material.vis_siphon.name');
visSiphon_Trait.localizedDescription = game.localize('e2ee.tconstruct.material.vis_siphon.description');
visSiphon_Trait.maxLevel = 1;
visSiphon_Trait.onUpdate = function (trait, tool, world, owner, itemSlot, isSelected) {
  if (world.isRemote()) return;                    // world is remote
  if (!owner instanceof IPlayer) return;           // no player
  if (tool.damage == 0) return;                    // tool max durability
  if (world.getVis(owner.position) < 1.0f) return; // no vis in aura

  tool.mutable().damageItem(-1, owner);
  world.drainVis(owner.position, 0.3f); // that value is actually x3
};
visSiphon_Trait.register();

/*
_  _ _ ____    ____ _ ___  _  _ ____ _  _    ____ ____ _  _ ____ ____
|  | | [__     [__  | |__] |__| |  | |\ |    |__| |__/ |\/| |  | |__/
 \/  | ___]    ___] | |    |  | |__| | \|    |  | |  \ |  | |__| |  \

*/

val visSiphonArmor_Trait = ArmorTraitBuilder.create('vis_siphon');
visSiphonArmor_Trait.color = 2852604;
visSiphonArmor_Trait.localizedName = game.localize('e2ee.tconstruct.material.vis_siphon.name');
visSiphonArmor_Trait.localizedDescription = game.localize('e2ee.tconstruct.material.vis_siphon.description');
visSiphonArmor_Trait.maxLevel = 1;
visSiphonArmor_Trait.onUpdate = function (trait, tool, world, owner, itemSlot, isSelected) {
  if (world.isRemote()) return;                    // world is remote
  if (!owner instanceof IPlayer) return;           // no player
  if (tool.damage == 0) return;                    // tool max durability
  if (world.getVis(owner.position) < 1.0f) return; // no vis in aura

  tool.mutable().damageItem(-1, owner);
  world.drainVis(owner.position, 0.3f); // that value is actually x3
};
visSiphonArmor_Trait.register();

/*
_  _ _ ____    ____ ____ _  _ _ _    _ ___  ____ _ _  _ _  _    ___ ____ ____ _    ____
|  | | [__     |___ |  | |  | | |    | |__] |__/ | |  | |\/|     |  |  | |  | |    [__
 \/  | ___]    |___ |_\| |__| | |___ | |__] |  \ | |__| |  |     |  |__| |__| |___ ___]

*/

val equilibrium_Trait = TraitBuilder.create('vis_equilibrium');
equilibrium_Trait.color = 2852604;
equilibrium_Trait.localizedName = game.localize('e2ee.tconstruct.material.vis_equilibrium.name');
equilibrium_Trait.localizedDescription = game.localize('e2ee.tconstruct.material.vis_equilibrium.description');

// Bonus mining speed depending on vis in aura
equilibrium_Trait.getMiningSpeed = function (trait, tool, event) {
  if (event.player.world.isRemote()) return; // world is remote
  // val bonus = min(3.0f,event.player.world.getVis(event.position)*0.01f) as float;
  event.newSpeed = event.originalSpeed + (min(3.0f, event.player.world.getVis(event.position) * 0.01f) as float);
};
// Bonus dmg multiplier depending on vis in aura
equilibrium_Trait.calcDamage = function (trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
  if (attacker.world.isRemote()) return newDamage;     // world is not remote
  if (!attacker instanceof IPlayer) return newDamage;  // not player
  // val mult = 1+min(3.0f,attacker.world.getVis(attacker.position)*0.01f) as float;
  return newDamage * ((1 + min(3.0f, attacker.world.getVis(attacker.position) * 0.01f)) as float);
};
// Relese vis on kill
equilibrium_Trait.onHit = function (trait, tool, attacker, target, damage, isCritical) {
  if (attacker.world.isRemote()) return;     // world is remote
  if (!attacker instanceof IPlayer) return;  // not player
  var player as IPlayer = attacker;

  if (target.health - damage < 0) player.world.addVis(player.position, (target.maxHealth / 2.0f) as float); // release vis
};
equilibrium_Trait.register();

/*
_  _ _ ____    ____ ____ _  _ _ _    _ ___  ____ _ _  _ _  _    ____ ____ _  _ ____ ____
|  | | [__     |___ |  | |  | | |    | |__] |__/ | |  | |\/|    |__| |__/ |\/| |  | |__/
 \/  | ___]    |___ |_\| |__| | |___ | |__] |  \ | |__| |  |    |  | |  \ |  | |__| |  \

*/

val equilibriumArmor_Trait = ArmorTraitBuilder.create('vis_equilibrium');
equilibriumArmor_Trait.color = 2852604;
equilibriumArmor_Trait.localizedName = game.localize('e2ee.tconstruct.material.vis_equilibrium.name');
equilibriumArmor_Trait.localizedDescription = game.localize('e2ee.tconstruct.material.vis_equilibrium.description');
equilibriumArmor_Trait.getModifications = function (trait, player, mods, armor, damageSource, damage, index) {
  if (!player.world.isRemote()) {
    mods.effectiveness += max(3.0f, player.world.getVis(player.position) * 0.01f);
  }
  return mods;
};
equilibriumArmor_Trait.register();

/*
_  _ _ ___ _  _ ____ _ _    _    _ _  _ _  _    ___  _  _ _ _    ___
|\/| |  |  |__| |__/ | |    |    | |  | |\/|    |__] |  | | |    |  \
|  | |  |  |  | |  \ | |___ |___ | |__| |  |    |__] |__| | |___ |__/

*/

val mithrillium = ExtendedMaterialBuilder.create('Mithrillium');
mithrillium.color = 2852604;
mithrillium.craftable = false;
mithrillium.liquid = <liquid:mithrillium>;
mithrillium.castable = true;
mithrillium.addItem(<item:thaumadditions:mithrillium_ingot>);
mithrillium.representativeItem = <item:thaumadditions:mithrillium_ingot>;
mithrillium.addHeadMaterialStats(1000, 7.5f, 8.5f, 11);
mithrillium.addHandleMaterialStats(1.5, -100);
mithrillium.addExtraMaterialStats(50);
mithrillium.addBowMaterialStats(1.0f, 3.0f, 1.0f);
mithrillium.addProjectileMaterialStats();

mithrillium.addCoreMaterialStats(9.0, 27.5);
mithrillium.addPlatesMaterialStats(12.3, 12.5, 3.0);
mithrillium.addTrimMaterialStats(5);

mithrillium.itemLocalizer = function (thisMaterial, itemName) {
  return game.localize('e2ee.tconstruct.material.mithrillium.name') + ' ' + itemName;
};
mithrillium.localizedName = game.localize('e2ee.tconstruct.material.mithrillium.name');

mithrillium.addMaterialTrait('vis_siphon');
mithrillium.addMaterialTrait('vis_siphon', 'head');
mithrillium.addMaterialTrait('vis_equilibrium', 'head');

mithrillium.addMaterialTrait('vis_siphon_armor', 'core');
mithrillium.addMaterialTrait('vis_siphon_armor', 'plates');
mithrillium.addMaterialTrait('vis_siphon_armor', 'trim');
mithrillium.addMaterialTrait('vis_equilibrium_armor', 'core');
mithrillium.register();

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/*
 █████╗ ██████╗  █████╗ ███╗   ███╗██╗███╗   ██╗██╗████████╗███████╗
██╔══██╗██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║██║╚══██╔══╝██╔════╝
███████║██║  ██║███████║██╔████╔██║██║██╔██╗ ██║██║   ██║   █████╗
██╔══██║██║  ██║██╔══██║██║╚██╔╝██║██║██║╚██╗██║██║   ██║   ██╔══╝
██║  ██║██████╔╝██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║   ██║   ███████╗
╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   ╚══════╝
*/

/*
____ ____ ____ ___  _ ___  ___  ____ _  _
|___ |  | |__/ |__] | |  \ |  \ |___ |\ |
|    |__| |  \ |__] | |__/ |__/ |___ | \|

*/

// Spin effect on player
function spin(player as IPlayer) as void {
  player.addPotionEffect(<potion:potioncore:spin>.makePotionEffect(7, 1));
  player.sendStatusMessage(game.localize('warp.sword.warning'));
}

// Debuff function
function debuffenemy(target as IEntityLivingBase, warp as int) as void {
  if (target.world.isRemote()) return;
  target.addPotionEffect(<potion:minecraft:glowing>.makePotionEffect(600, 0));
  target.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(600, min(3, (warp - 50) / 200)));
  if (warp >= 100) {
    target.addPotionEffect(<potion:potioncore:broken_armor>.makePotionEffect(600, min(1, (warp - 100) / 500)));
    if (warp >= 300) {
      target.addPotionEffect(<potion:potioncore:vulnerable>.makePotionEffect(600, min(3, (warp - 300) / 300)));
    }
  }
}

// Trait
val forbidden_Trait = TraitBuilder.create('forbidden');
forbidden_Trait.color = 2852604;
forbidden_Trait.localizedName = game.localize('e2ee.tconstruct.material.forbidden.name');
forbidden_Trait.localizedDescription = game.localize('e2ee.tconstruct.material.forbidden.description');

forbidden_Trait.onHit = function (trait, tool, attacker, target, damage, isCritical) {
  if (attacker.world.isRemote()) return;
  if (!attacker instanceof IPlayer) return;
  val player as IPlayer = attacker;
  val warp as int = player.warpNormal + player.warpTemporary + player.warpPermanent;
  if (warp < 50) {
    spin(player);
  }
  else {
    debuffenemy(target, warp);
    if (target.health - damage < 0) speakKill(player, player.world);
  }
};
forbidden_Trait.register();

/*
___  ____ ____ ____ ____ ____ ____ ____ ___
|__] |  | [__  [__  |___ [__  [__  |___ |  \
|    |__| ___] ___] |___ ___] ___] |___ |__/

*/

val possessed_Trait = TraitBuilder.create('possessed');
possessed_Trait.color = 2852604;
possessed_Trait.localizedName = game.localize('e2ee.tconstruct.material.possessed.name');
possessed_Trait.localizedDescription = game.localize('e2ee.tconstruct.material.possessed.description');

function checkIfWeapon(tool as IItemStack) as bool {
  if (
    !isNull(tool.tag)
    && !isNull(tool.tag.Special)
    && !isNull(tool.tag.Special.Categories)
    && !isNull(tool.tag.Special.Categories.asList())
  ) {
    for tag in tool.tag.Special.Categories.asList() {
      if (tag == 'weapon') return true;
    }
  }
  return false;
}

// Speak randomly
function speakRandom(player as IPlayer, world as IWorld) as void {
  val k = 'warp.sword.speak.random.';
  val r = world.random.nextInt(9);
  player.sendStatusMessage(game.localize(k + r));
  player.sendPlaySoundPacket('thaumcraft:brain', 'voice', player.position, 1.0f, 0.5f);
}

possessed_Trait.onUpdate = function (trait, tool, world, owner, itemSlot, isSelected) {
  if (world.isRemote()) return;
  if (!checkIfWeapon(tool)) return;

  if (!owner instanceof IPlayer) return;
  val player as IPlayer = owner;

  if (player.warpNormal + player.warpTemporary + player.warpPermanent >= 100) {
    if (world.random.nextInt(12000) < 1) speakRandom(player, world);
  }
};

// Speak on kill
function speakKill(player as IPlayer, world as IWorld) as void {
  val k = 'warp.sword.speak.kill.';
  val r = world.random.nextInt(8);
  player.sendStatusMessage(game.localize(k + r));
  if (player.isPlayerMP()) player.sendPlaySoundPacket('thaumcraft:brain', 'voice', player.position, 1.0f, 0.5f);
}

possessed_Trait.onHit = function (trait, tool, attacker, target, damage, isCritical) {
  if (attacker.world.isRemote()) return;
  if (!checkIfWeapon(tool)) return;

  if (!attacker instanceof IPlayer) return;
  val player as IPlayer = attacker;
  val warp as int = player.warpNormal + player.warpTemporary + player.warpPermanent;

  if (warp < 50) return;
  if (target.health - damage < 0) speakKill(player, player.world);
};

possessed_Trait.register();

/*
___  ____ ____ ____ _  _ ____
|__] |  | |__/ |  | |  | [__
|    |__| |  \ |__| |__| ___]

*/

val porous_Trait = ArmorTraitBuilder.create('porous');
porous_Trait.color = 2852604;
porous_Trait.localizedName = game.localize('e2ee.tconstruct.material.porous.name');
porous_Trait.localizedDescription = game.localize('e2ee.tconstruct.material.porous.description');

function porous(player as IPlayer) as void {
  var world as IWorld = player.world;
  val x = player.getX() as float;
  val y = player.getY() as float;
  val z = player.getZ() as float;
  val porousStone = <item:thaumcraft:taint_rock>.asBlock();
  if ((y - 2) > 255 || (y - 2) < 3) return;
  val pos = crafttweaker.util.Position3f.create(x - 1, y - 1, z - 1) as IBlockPos;
  val block as IBlock = world.getBlock(pos);
  if (isNull(block)) return;
  if (block.definition.id != 'minecraft:stone') return;
  world.setBlockState(porousStone.definition.defaultState, pos);
  // utils.spawnParticles(world, 'fireworksSpark', x+i, y+j, z+k, 0.1, 0.1, 0.1, 0.1, 2);
  player.sendPlaySoundPacket('thaumcraft:roots', 'ambient', pos.asPosition3f(), 0.5f, 0.8f);

  /*
  OLD FUNCTION HERE, STILL GONNA KEEP IT!

  val rangeXZ = [-5,-4,-3,-2,-1,0,1,2,3] as int[];
  val rangeY = [-3,-2,-1,0,1,2,3] as int[];
  for i in rangeXZ {
    for j in rangeY {
      for k in rangeXZ {
        if((y+j)<255
        && (y+j)>1){
          val pos = crafttweaker.util.Position3f.create(x+i, y+j, z+k) as IBlockPos;
          if (player.world.isAirBlock(pos)) continue;
          val block as IBlock = world.getBlock(pos);
          if(isNull(block)) continue;
          //print(block.definition.id);
          if(block.definition.id != "minecraft:stone") continue;
          world.setBlockState(<blockstate:minecraft:air>, pos);
          world.setBlockState(porousStone.definition.defaultState, pos);
          //utils.spawnParticles(world, 'fireworksSpark', x+i, y+j, z+k, 0.1, 0.1, 0.1, 0.1, 2);
          player.sendPlaySoundPacket("thaumcraft:poof", "ambient", pos.asPosition3f(), 0.5f, 0.5f);
          //print("success!");
        }
      }
    }
  } */
}

porous_Trait.onArmorTick = function (trait, armor, world, player) {
  if (world.isRemote()) return;
  // if(!checkArmorType) return;
  porous(player);
};
porous_Trait.register();

/*
_  _ ____ _ ___     ____ _  _ ____ _    _
|  | |  | | |  \    [__  |__| |___ |    |
 \/  |__| | |__/    ___] |  | |___ |___ |___

*/

val voidShell_trait = ArmorTraitBuilder.create('void_shell');
voidShell_trait.color = 11141165;
voidShell_trait.localizedName = game.localize('e2ee.tconstruct.material.void_shell.name');
voidShell_trait.localizedDescription = game.localize('e2ee.tconstruct.material.void_shell.description');

voidShell_trait.getModifications = function (trait, player, mods, armor, damageSource, damage, index) {
  val warp = player.warpNormal + player.warpTemporary + player.warpPermanent;
  mods.effectiveness += max(3.0f, (warp as float) * 0.0025f);
  return mods;
};
voidShell_trait.register();

/*
____ _    ___  ____ _ ___ ____ _  _     ____ ____ ___ ____ _ ___  _  _ ___ _ ____ _  _
|___ |    |  \ |__/ |  |  |    |__|     |__/ |___  |  |__/ | |__] |  |  |  | |  | |\ |
|___ |___ |__/ |  \ |  |  |___ |  | ___ |  \ |___  |  |  \ | |__] |__|  |  | |__| | \|

*/

val eldritchRetribution_trait = ArmorTraitBuilder.create('eldritch_retribution');
eldritchRetribution_trait.color = 11141165;
eldritchRetribution_trait.localizedName = game.localize('e2ee.tconstruct.material.eldritch_retribution.name');
eldritchRetribution_trait.localizedDescription = game.localize('e2ee.tconstruct.material.eldritch_retribution.description');

eldritchRetribution_trait.onHurt = function (trait, armor, player, source, damage, newDamage, evt) {
  if (source.trueSource instanceof IEntityLivingBase & !player.world.isRemote() & player.warpNormal + player.warpTemporary + player.warpPermanent >= 100) {
    val mobTrue as IEntityLivingBase = source.trueSource;
    val i = player.world.random.nextInt(4);
    if (i == 0) {
      mobTrue.addPotionEffect(<potion:minecraft:levitation>.makePotionEffect(100, 1));
    }
    if (i == 1) {
      mobTrue.addPotionEffect(<potion:minecraft:blindness>.makePotionEffect(100, 0));
    }
    if (i == 2) {
      mobTrue.setInWeb();
    }
    else {
      mobTrue.knockBack(player, 5.0f, player.x - mobTrue.x, player.z - mobTrue.z);
    }
  }
  return newDamage;
};
eldritchRetribution_trait.register();

/*
____ ____ ___  ____
| __ |__|   /  |___
|__] |  |  /__ |___

*/

val gaze_trait = ArmorTraitBuilder.create('gaze');
gaze_trait.color = 11141165;
gaze_trait.localizedName = game.localize('e2ee.tconstruct.material.gaze.name');
gaze_trait.localizedDescription = game.localize('e2ee.tconstruct.material.gaze.description');

static gazeUpdateTime as int = 80;

function gazeMechanic(world as IWorld, player as IPlayer) as void {
  if (world.isRemote()) return;
  if (isNull(player)) return;
  val newEffect = <potion:thaumcraft:deathgaze>;
  if (!player.isPotionActive(newEffect)) {
    player.addPotionEffect(newEffect.makePotionEffect(gazeUpdateTime, 3));
    return;
  }
  val existEffect = player.getActivePotionEffect(newEffect);
  player.addPotionEffect(newEffect.makePotionEffect(gazeUpdateTime, 3));
}

gaze_trait.onUpdate = function (trait, tool, world, owner, itemSlot, isSelected) {
  if (!isSelected) return;
  if (world.getWorldTime() % gazeUpdateTime != 0) return;
  if (!owner instanceof IPlayer) return;
  val player as IPlayer = owner;
  gazeMechanic(world, player);
};
gaze_trait.register();

/*
____ ___  ____ _  _ _ _  _ _ ___ ____    ___  _  _ _ _    ___
|__| |  \ |__| |\/| | |\ | |  |  |___    |__] |  | | |    |  \
|  | |__/ |  | |  | | | \| |  |  |___    |__] |__| | |___ |__/

*/

val adaminite = ExtendedMaterialBuilder.create('Adaminite');
adaminite.color = 11141165;
adaminite.craftable = false;
adaminite.liquid = <liquid:adaminite>;
adaminite.castable = true;
adaminite.addItem(<item:thaumadditions:adaminite_ingot>);
adaminite.representativeItem = <item:thaumadditions:adaminite_ingot>;
adaminite.addHeadMaterialStats(666, 5.5f, 21.5f, 12);
adaminite.addHandleMaterialStats(0.6, 60);
adaminite.addExtraMaterialStats(666);
adaminite.addBowMaterialStats(1.66f, 1.5f, 6.6f);
adaminite.addProjectileMaterialStats();

adaminite.addCoreMaterialStats(6.0, 36.6);
adaminite.addPlatesMaterialStats(16.6, 6.6, 6.6);
adaminite.addTrimMaterialStats(6);

adaminite.itemLocalizer = function (thisMaterial, itemName) {
  return game.localize('e2ee.tconstruct.material.adaminite.name') + ' ' + itemName;
};
adaminite.localizedName = game.localize('e2ee.tconstruct.material.adaminite.name');

adaminite.addMaterialTrait('forbidden', 'head');
adaminite.addMaterialTrait('forbidden', 'bow');
adaminite.addMaterialTrait('possessed', 'head');
adaminite.addMaterialTrait('possessed');

adaminite.addMaterialTrait('void_shell_armor', 'core');
adaminite.addMaterialTrait('eldritch_retribution_armor', 'core');
adaminite.addMaterialTrait('gaze_armor', 'trim');
adaminite.addMaterialTrait('porous_armor', 'core');
adaminite.addMaterialTrait('porous_armor', 'plates');
adaminite.addMaterialTrait('porous_armor', 'trim');

adaminite.register();

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/*
███╗   ███╗██╗████████╗██╗  ██╗███╗   ███╗██╗███╗   ██╗██╗████████╗███████╗
████╗ ████║██║╚══██╔══╝██║  ██║████╗ ████║██║████╗  ██║██║╚══██╔══╝██╔════╝
██╔████╔██║██║   ██║   ███████║██╔████╔██║██║██╔██╗ ██║██║   ██║   █████╗
██║╚██╔╝██║██║   ██║   ██╔══██║██║╚██╔╝██║██║██║╚██╗██║██║   ██║   ██╔══╝
██║ ╚═╝ ██║██║   ██║   ██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║   ██║   ███████╗
╚═╝     ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   ╚══════╝
*/

/*
____ ____ ____ ____ ____ ____ ____ _  _ ____ ____
|__/ |___ [__  |___ |__| |__/ |    |__| |___ |__/
|  \ |___ ___] |___ |  | |  \ |___ |  | |___ |  \

*/

val researcherTrait = TraitBuilder.create('researcher');
researcherTrait.color = 16744631;
researcherTrait.localizedName = game.localize('e2ee.tconstruct.material.researcher.name');
researcherTrait.localizedDescription = game.localize('e2ee.tconstruct.material.researcher.description');
researcherTrait.calcDamage = function (trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
  if (target.world.isRemote()) return newDamage;

  if (!attacker instanceof IPlayer) return newDamage;
  val player as IPlayer = attacker;
  var dmg as float = originalDamage;

  if (player.thaumcraftKnowledge.isResearchComplete('FLUX_STRIKE')) {
    if (tool.tag.flux > 0) {
      tool.mutable().updateTag({ flux: tool.tag.flux - 1 });
      dmg = dmg * 2.0f;
    }
  }
  if (player.thaumcraftKnowledge.isResearchComplete('PURE_SMITE')) {
    if (target.isUndead) {
      dmg += 20.0f;
    }
  }
  return dmg as float;
};

researcherTrait.onHit = function (trait, tool, attacker, target, damage, isCritical) {
  if (target.world.isRemote()) return;

  if (!attacker instanceof IPlayer) return;
  val player as IPlayer = attacker;

  if (!player.thaumcraftKnowledge.isResearchComplete('GOD_WRAITH')) return;

  target.addPotionEffect(<potion:potioncore:lightning>.makePotionEffect(10, 0));
};

/*
____ _    _  _ _  _    ____ ___ ____ _ _  _ ____    ___ ____ ____    _  _ ___  ___  ____ ___ ____
|___ |    |  |  \/     [__   |  |__/ | |_/  |___     |  |__| | __    |  | |__] |  \ |__|  |  |___
|    |___ |__| _/\_    ___]  |  |  \ | | \_ |___     |  |  | |__]    |__| |    |__/ |  |  |  |___

*/

researcherTrait.onUpdate = function (trait, tool, world, owner, itemSlot, isSelected) {
  if (world.isRemote()) return;
  if (!owner instanceof IPlayer) return;
  tool.mutable();

  if (isNull(tool.tag) || isNull(tool.tag.flux)) tool.updateTag({ flux: 0 } as IData);

  if (tool.tag.flux >= 100) return;
  if (world.getFlux(owner.position) <= 1.0f) return;
  world.drainFlux(owner.position, 1.0f);
  tool.updateTag({ flux: tool.tag.flux + 1 } as IData);
};

/*
____ ____ ____    ___  _  _ ____ _ ____ _ ____ ____
|  | |__/ |___    |__] |  | |__/ | |___ | |___ |__/
|__| |  \ |___    |    |__| |  \ | |    | |___ |  \

*/

static clusterList as IItemStack[string] = {
  'actuallyadditions:block_misc:3'          : <item:jaopca:item_clusterquartzblack>,
  'astralsorcery:blockcustomore:1'          : <item:jaopca:item_clusterastralstarmetal>,
  'astralsorcery:blockcustomsandore:0'      : <item:jaopca:item_clusteraquamarine>,
  'appliedenergistics2:charged_quartz_ore:0': <item:jaopca:item_clusterchargedcertusquartz>,
  'appliedenergistics2:quartz_ore:0'        : <item:jaopca:item_clustercertusquartz>,
  'biomesoplenty:gem_ore:3'                 : <item:jaopca:item_clustertopaz>,
  'biomesoplenty:gem_ore:4'                 : <item:jaopca:item_clustertanzanite>,
  'biomesoplenty:gem_ore:6'                 : <item:jaopca:item_clustersapphire>,
  'biomesoplenty:gem_ore:1'                 : <item:jaopca:item_clusterruby>,
  'biomesoplenty:gem_ore:5'                 : <item:jaopca:item_clustermalachite>,
  'biomesoplenty:gem_ore:0'                 : <item:jaopca:item_clusteramethyst>,
  'biomesoplenty:gem_ore:2'                 : <item:jaopca:item_clusterperidot>,
  'draconicevolution:draconium_ore:0'       : <item:jaopca:item_clusterdraconium>,
  'forestry:resources:0'                    : <item:jaopca:item_clusterapatite>,
  'endreborn:block_wolframium_ore:0'        : <item:jaopca:item_clustertungsten>,
  'immersiveengineering:ore:5'              : <item:jaopca:item_clusteruranium>,
  'libvulpes:ore0:0'                        : <item:jaopca:item_clusterdilithium>,
  'libvulpes:ore0:8'                        : <item:jaopca:item_clustertitanium>,
  'nuclearcraft:ore:7'                      : <item:jaopca:item_clustermagnesium>,
  'nuclearcraft:ore:5'                      : <item:jaopca:item_clusterboron>,
  'nuclearcraft:ore:6'                      : <item:jaopca:item_clusterlithium>,
  'nuclearcraft:ore:3'                      : <item:jaopca:item_clusterthorium>,
  'mekanism:oreblock:0'                     : <item:jaopca:item_clusterosmium>,
  'minecraft:iron_ore:0'                    : <item:thaumcraft:cluster>,
  'minecraft:gold_ore:0'                    : <item:thaumcraft:cluster:1>,
  'minecraft:lapis_ore:0'                   : <item:jaopca:item_clusterlapis>,
  'minecraft:emerald_ore:0'                 : <item:jaopca:item_clusteremerald>,
  'minecraft:diamond_ore:0'                 : <item:jaopca:item_clusterdiamond>,
  'minecraft:coal_ore:0'                    : <item:jaopca:item_clustercoal>,
  'minecraft:redstone_ore:0'                : <item:jaopca:item_clusterredstone>,
  'minecraft:quartz_ore:0'                  : <item:thaumcraft:cluster:7>,
  'rftools:dimensional_shard_ore:0'         : <item:jaopca:item_clusterdimensionalshard>,
  'tconstruct:ore:0'                        : <item:jaopca:item_clustercobalt>,
  'tconstruct:ore:1'                        : <item:jaopca:item_clusterardite>,
  'thaumcraft:ore_amber:0'                  : <item:jaopca:item_clusteramber>,
  'thermalfoundation:ore:0'                 : <item:thaumcraft:cluster:2>,
  'thermalfoundation:ore:3'                 : <item:thaumcraft:cluster:5>,
  'thermalfoundation:ore:7'                 : <item:jaopca:item_clusteriridium>,
  'thermalfoundation:ore:4'                 : <item:jaopca:item_clusteraluminium>,
  'thermalfoundation:ore:2'                 : <item:thaumcraft:cluster:4>,
  'thermalfoundation:ore:6'                 : <item:jaopca:item_clusterplatinum>,
  'thermalfoundation:ore:5'                 : <item:jaopca:item_clusternickel>,
  'thermalfoundation:ore:8'                 : <item:jaopca:item_clustermithril>,
  'thermalfoundation:ore:1'                 : <item:thaumcraft:cluster:3>,
  'trinity:trinitite:0'                     : <item:jaopca:item_clustertrinitite>,
} as IItemStack[string];

static shardList as IItemStack[string] = {
  'actuallyadditions:block_misc:3'          : <item:jaopca:item_crystalshardquartzblack>,
  'astralsorcery:blockcustomore:1'          : <item:jaopca:item_crystalshardastralstarmetal>,
  'astralsorcery:blockcustomsandore:0'      : <item:jaopca:item_crystalshardaquamarine>,
  'appliedenergistics2:charged_quartz_ore:0': <item:jaopca:item_crystalshardchargedcertusquartz>,
  'appliedenergistics2:quartz_ore:0'        : <item:jaopca:item_crystalshardcertusquartz>,
  'biomesoplenty:gem_ore:3'                 : <item:jaopca:item_crystalshardtopaz>,
  'biomesoplenty:gem_ore:4'                 : <item:jaopca:item_crystalshardtanzanite>,
  'biomesoplenty:gem_ore:6'                 : <item:jaopca:item_crystalshardsapphire>,
  'biomesoplenty:gem_ore:1'                 : <item:jaopca:item_crystalshardruby>,
  'biomesoplenty:gem_ore:5'                 : <item:jaopca:item_crystalshardmalachite>,
  'biomesoplenty:gem_ore:0'                 : <item:jaopca:item_crystalshardamethyst>,
  'biomesoplenty:gem_ore:2'                 : <item:jaopca:item_crystalshardperidot>,
  'draconicevolution:draconium_ore:0'       : <item:jaopca:item_crystalsharddraconium>,
  'forestry:resources:0'                    : <item:jaopca:item_crystalshardapatite>,
  'endreborn:block_wolframium_ore:0'        : <item:jaopca:item_crystalshardtungsten>,
  'immersiveengineering:ore:5'              : <item:jaopca:item_crystalsharduranium>,
  'libvulpes:ore0:0'                        : <item:jaopca:item_crystalsharddilithium>,
  'libvulpes:ore0:8'                        : <item:jaopca:item_crystalshardtitanium>,
  'nuclearcraft:ore:7'                      : <item:jaopca:item_crystalshardmagnesium>,
  'nuclearcraft:ore:5'                      : <item:jaopca:item_crystalshardboron>,
  'nuclearcraft:ore:6'                      : <item:jaopca:item_crystalshardlithium>,
  'nuclearcraft:ore:3'                      : <item:jaopca:item_crystalshardthorium>,
  'mekanism:oreblock:0'                     : <item:jaopca:item_crystalshardosmium>,
  'minecraft:iron_ore:0'                    : <item:jaopca:item_crystalshardiron>,
  'minecraft:gold_ore:0'                    : <item:jaopca:item_crystalshardgold>,
  'minecraft:lapis_ore:0'                   : <item:jaopca:item_crystalshardlapis>,
  'minecraft:emerald_ore:0'                 : <item:jaopca:item_crystalshardemerald>,
  'minecraft:diamond_ore:0'                 : <item:jaopca:item_crystalsharddiamond>,
  'minecraft:coal_ore:0'                    : <item:jaopca:item_crystalshardcoal>,
  'minecraft:redstone_ore:0'                : <item:jaopca:item_crystalshardredstone>,
  'minecraft:quartz_ore:0'                  : <item:jaopca:item_crystalshardquartz>,
  'rftools:dimensional_shard_ore:0'         : <item:jaopca:item_crystalsharddimensionalshard>,
  'tconstruct:ore:0'                        : <item:jaopca:item_crystalshardcobalt>,
  'tconstruct:ore:1'                        : <item:jaopca:item_crystalshardardite>,
  'thaumcraft:ore_amber:0'                  : <item:jaopca:item_crystalshardamber>,
  'thermalfoundation:ore:0'                 : <item:jaopca:item_crystalshardcopper>,
  'thermalfoundation:ore:3'                 : <item:jaopca:item_crystalshardlead>,
  'thermalfoundation:ore:7'                 : <item:jaopca:item_crystalshardiridium>,
  'thermalfoundation:ore:4'                 : <item:jaopca:item_crystalshardaluminium>,
  'thermalfoundation:ore:2'                 : <item:jaopca:item_crystalshardsilver>,
  'thermalfoundation:ore:6'                 : <item:jaopca:item_crystalshardplatinum>,
  'thermalfoundation:ore:5'                 : <item:jaopca:item_crystalshardnickel>,
  'thermalfoundation:ore:8'                 : <item:jaopca:item_crystalshardmithril>,
  'thermalfoundation:ore:1'                 : <item:jaopca:item_crystalshardtin>,
  'trinity:trinitite:0'                     : <item:jaopca:item_crystalshardtrinitite>,
} as IItemStack[string];

function checkRefineEnchant(tool as IItemStack) as int {
  if (
    !isNull(tool.tag)
    && !isNull(tool.tag.infench)
    && !isNull(tool.tag.infench.asList())
  ) {
    for tag in tool.tag.infench.asList() {
      if ((tag.id as int) == 4) return (tag.lvl as int);
    }
  }
  return 0;
}

researcherTrait.onBlockHarvestDrops = function (trait, tool, event) {
  // DROP BONUS crystalized chunks
  if (event.player.world.isRemote()) return; // world is remote

  if (!event.isPlayer) return; // no player
  // if(event.silkTouch) return; // silk touch

  val lvl = checkRefineEnchant(tool);

  if (isNull(event.block)) return;
  val block as IBlock = event.block;
  val result = shardList[block.definition.id + ':' + block.meta] as IItemStack;
  if (isNull(result)) return; // block doesn't match

  if (lvl == 0) {
    if (event.player.world.getRandom().nextInt(2) == 0) return;

    event.drops = [clusterList[block.definition.id + ':' + block.meta].weight(1.0f)] as WeightedItemStack[];
    return;
  }
  if (lvl == 1) {
    if (event.player.world.getRandom().nextInt(2) == 1) {
      event.drops = [result.weight(1.0f)] as WeightedItemStack[];
      return;
    }
    else {
      event.drops = [clusterList[block.definition.id + ':' + block.meta].weight(1.0f)] as WeightedItemStack[];
      return;
    }
  }
  if (lvl > 1) event.drops = [result.weight(1.0f)] as WeightedItemStack[];
  if (lvl == 3) event.addItem(result.weight(0.5f));
  if (lvl == 4) event.addItem(result.weight(0.75f));
};
researcherTrait.register();

/*
____ _ ____ ____ ___    ____ ___ ____ _  _ ___
|___ | |__/ [__   |     [__   |  |__| |\ | |  \
|    | |  \ ___]  |     ___]  |  |  | | \| |__/

*/

val firstStand_trait = ArmorTraitBuilder.create('first_stand');
firstStand_trait.color = 11141165;
firstStand_trait.localizedName = game.localize('e2ee.tconstruct.material.first_stand.name');
firstStand_trait.localizedDescription = game.localize('e2ee.tconstruct.material.first_stand.description');

function calcLevel(exp as int) as int {
  if (exp >= 1508) {
    return (81.0 / 10.0 + sqrt(2.0 / 5.0 * (exp - 7839.0 / 40.0))) as int;
  }
  if (exp >= 353) {
    return (325.0 / 18.0 + sqrt(2.0 / 9.0 * (exp - 54215.0 / 72.0))) as int;
  }
  return (sqrt(exp + 9.0) - 3.0) as int;
}

function calcExpTotalForLevel(level as int) as int {
  if (level >= 32) {
    return ((9 * level * level + 325 * level + 4440) / 2) as int;
  }
  if (level >= 17) {
    return ((5 * level * level + 81 * level + 720) / 2);
  }
  else {
    return level * (level + 6);
  }
}

function calculateExpDrain(player as IPlayer, damage as float) as bool {
  var exp as int = player.getTotalXP();
  val expRemove as int = (damage * 2.0f) as int;
  if (exp < expRemove) return false; // if player have enought exp

  // if in range of the level: (doesn't makes sound)
  if (calcExpTotalForLevel(player.xp) < exp) {
    player.removeExperience(expRemove);
  }
  // if out of the range of the level (makes sound)
  player.removeExperience(exp);
  player.xp = 0;
  player.addExperience(exp - expRemove);
  return true;
}

firstStand_trait.onHurt = function (trait, armor, player, source, damage, newDamage, evt) {
  if (newDamage <= 0.0f) return newDamage;
  if (player.thaumcraftKnowledge.isResearchComplete('FIRST_STAND') && calculateExpDrain(player, newDamage)) {
    evt.cancel();
    return -0.1f;
  }
  return newDamage;
};
firstStand_trait.register();

/*
_  _ _ ___ _  _ _  _ _ _  _ _ ___ ____    ___  _  _ _ _    ___
|\/| |  |  |__| |\/| | |\ | |  |  |___    |__] |  | | |    |  \
|  | |  |  |  | |  | | | \| |  |  |___    |__] |__| | |___ |__/

*/

val mithminite = ExtendedMaterialBuilder.create('Mithminite');
mithminite.color = 16744631;
mithminite.craftable = false;
mithminite.liquid = <liquid:mithminite>;
mithminite.castable = true;
mithminite.addItem(<item:thaumadditions:mithminite_ingot>);
mithminite.representativeItem = <item:thaumadditions:mithminite_ingot>;
mithminite.addHeadMaterialStats(1420, 9.5f, 12.5f, 12);
mithminite.addHandleMaterialStats(2.1, 0);
mithminite.addExtraMaterialStats(420);
mithminite.addBowMaterialStats(2.40f, 3.0f, 4.2f);
mithminite.addProjectileMaterialStats();

mithminite.addCoreMaterialStats(14.0, 42.0);
mithminite.addPlatesMaterialStats(24.0, 42.0, 0.0);
mithminite.addTrimMaterialStats(42);

mithminite.itemLocalizer = function (thisMaterial, itemName) {
  return game.localize('e2ee.tconstruct.material.mithminite.name') + ' ' + itemName;
};
mithminite.localizedName = game.localize('e2ee.tconstruct.material.mithminite.name');

mithminite.addMaterialTrait('researcher', 'head');

mithminite.addMaterialTrait('first_stand_armor', 'core');

mithminite.register();
