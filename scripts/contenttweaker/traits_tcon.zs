#loader contenttweaker

import crafttweaker.block.IBlockState;
import crafttweaker.event.IBlockEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntity;
import mods.contenttweaker.Color;
import mods.contenttweaker.conarm.ArmorTraitBuilder;
import mods.contenttweaker.conarm.ExtendedMaterialBuilder;
import mods.contenttweaker.tconstruct.TraitBuilder;
import mods.contenttweaker.tconstruct.MaterialBuilder;
import mods.ctutils.utils.Math.max;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.sqrt;
import crafttweaker.world.IWorld;

function getDrawSpeed(inversed as float) as float {
    return (1.0 as float / inversed as float) as float;
}

/* 
Some taken from: wilderness-minecraft
https://github.com/badmonkey/wilderness-minecraft/blob/f32102d158566de9d346034b35c2f6226d369ff9/forge1.12/wilderness/scripts/content/traits_tcon.zs
*/

//
// blindrage
//
val rage = TraitBuilder.create("blindrage");
rage.color = 0x080808;
rage.localizedName = "Blind Rage";
rage.localizedDescription = "\u00a7oWho said you needed to see your enemies?\n\u00a7rDeal double damage when blinded";
rage.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical)
{
  if(attacker.isPotionActive(<potion:minecraft:blindness>)){
    return newDamage * 2.0;
  } else {
    return newDamage;
  }
};
rage.register();


//
// darkness
//
val dark = TraitBuilder.create("darkness");
dark.color = 0x332c3b;
dark.localizedName = "Eternal Darkness";
dark.localizedDescription = "\u00a7oJoin the dark side...\n\u00a7rYour tool loves the dark so much; it does more damage in the dark.";
dark.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical)
{
  var light = attacker.world.getBrightness(attacker.getX(), attacker.getY(), attacker.getZ());
  return newDamage * (2.0f - light as float / 15.0f);
};
dark.register();



//
// dire
//
val dire = TraitBuilder.create("dire");
dire.color = 0x54514a;
dire.localizedName = "Dire-Hit";
dire.localizedDescription = "\u00a7oIt's super effective!\n\u00a7rYour tool will always land critical hits so long as you are at full health!";
dire.calcCrit = function(trait, tool, attacker, target)
{
  return attacker.health >= attacker.maxHealth;
};
dire.register();


//
// lifecycle
//
val life = TraitBuilder.create("lifecycle");
life.color = 0xff2010;
life.localizedName = "Cycle of Life";
life.localizedDescription = "\u00a7oFrom one to another.\n\u00a7rWhen your tool is damaged, you are healed for the damaged amount.";
life.onToolDamage = function(trait, tool, unmodifiedAmount, newAmount, holder)
{
  holder.heal(newAmount);
  return newAmount;
};
life.register();


//
// antimagic
//
val antimagic = ArmorTraitBuilder.create("antimagic");
antimagic.color = 0x000000;
antimagic.localizedName = "Anti-Magic";
antimagic.localizedDescription = "\u00a7oNihilistic!\n\u00a7rYour armor doesn't believe in potions, and refuses to be affected by any potion effects; good or bad.";
antimagic.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
  if(armor.damage < armor.maxDamage && source.isMagicDamage()) {
    evt.cancel();
  }
  return newDamage;
};
antimagic.onArmorTick = function(trait, armor, world, player) {
  if (world.getWorldTime() % 10 == 0) player.clearActivePotions();
};
antimagic.register();


//
// darkside
//
val darkdefense = ArmorTraitBuilder.create("darkside");
darkdefense.color = 0x332c3b;
darkdefense.localizedName = "The Dark Side";
darkdefense.localizedDescription = "\u00a7oUnder the cover of darkness!\n\u00a7rYour armor loves the dark so much; you take less damage when in darkness.";
darkdefense.onHurt = function(trait, armor, player, source, damage, newDamage, event)
{
  return newDamage * (0.75 + 0.25 * player.world.getBrightness(player.x, player.y, player.z) / 15.0);
};
darkdefense.register();


//
// mentor
//
val mentor = TraitBuilder.create("mentor");
mentor.color = 0x216e2a;
mentor.localizedName = game.localize("e2ee.tconstruct.material.mentor.name");
mentor.localizedDescription = game.localize("e2ee.tconstruct.material.mentor.description");
mentor.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
  if (! attacker instanceof IPlayer) return newDamage;
  val player as IPlayer = attacker;
  var buff = sqrt(player.xp);
  player.xp = player.xp * 0.99;
  return newDamage + buff;
};
mentor.register();


//
// difficulty
//
val difficulty = TraitBuilder.create("difficulty");
difficulty.color = 0xd1310d;
difficulty.localizedName = "Difficulty";
difficulty.localizedDescription = "\u00a7oScalling Difficulty\n\u00a7rMining and attacking reduce player difficulty";
difficulty.afterBlockBreak = function(trait, tool, world, blockstate, miner, wasEffective, unknown) {
  if(world.isRemote()) return;
  if(! miner instanceof IPlayer) return;
  val player as IPlayer = miner;
  mods.ctintegration.scalinghealth.DifficultyManager.addDifficulty(player, -0.001);
};
difficulty.onHit = function(trait, tool, attacker, target, damage, isCritical) {
  if(! attacker instanceof IPlayer) return;
  val player as IPlayer = attacker;
  if(player.world.isRemote()) return;
  if(damage <= 0) return;
  mods.ctintegration.scalinghealth.DifficultyManager.addDifficulty(player, -0.01 * damage);
};
difficulty.register();

//
// difficulty_armor
//
val difficulty_armor = ArmorTraitBuilder.create("difficulty");
difficulty_armor.color = 0xd1310d;
difficulty_armor.localizedName = "Difficulty";
difficulty_armor.localizedDescription = "\u00a7oScalling Difficulty\n\u00a7rMining and attacking reduce player difficulty";
difficulty_armor.onDamaged = function(trait, armor, player, source, damage, newDamage, evt) {
  if(player.world.isRemote()) return newDamage;
  if(newDamage <= 0) return newDamage;
  mods.ctintegration.scalinghealth.DifficultyManager.addDifficulty(player, -0.001 * newDamage);
  return newDamage;
};
difficulty_armor.register();


//
// spectre
//
val spectre = ExtendedMaterialBuilder.create("spectre");
spectre.color = 0x9CC1CE;
spectre.craftable = false;
spectre.castable = true;
spectre.representativeItem = <item:randomthings:ingredient:3>;
spectre.liquid = <liquid:spectre>;
spectre.addItem(<ore:ingotSpectre>);
spectre.localizedName = game.localize("e2ee.tconstruct.material.spectre.name");
spectre.addHeadMaterialStats(400, 4.2, 6.0, 7);
spectre.addHandleMaterialStats(1.4, -50);
spectre.addExtraMaterialStats(64);
spectre.addBowMaterialStats(getDrawSpeed(1.5), 1.0, 2.5);
spectre.addProjectileMaterialStats();
spectre.addCoreMaterialStats(200, 23.3);
spectre.addPlatesMaterialStats(1.6, 100, 2);
spectre.addTrimMaterialStats(70);
spectre.register();

function spectreMechanic(world as IWorld, player as IPlayer) as void {
  if (world.isRemote()) return;
  if (isNull(player)) return;
  if (!player.isPotionActive(<potion:potioncore:reach>)) {
    player.addPotionEffect(<potion:potioncore:reach>.makePotionEffect(40, 1));
  }
  val effect = player.getActivePotionEffect(<potion:potioncore:reach>);
  player.addPotionEffect(<potion:potioncore:reach>.makePotionEffect(60, effect.amplifier + 1));
}

val spectre_armor = ArmorTraitBuilder.create("spectre");
spectre_armor.color = 0x9CC1CE;
spectre_armor.localizedName = game.localize("e2ee.tconstruct.material.spectre.name");
spectre_armor.localizedDescription = game.localize("e2ee.tconstruct.material.spectre.description");
spectre_armor.onAbility = function(trait, level, world, player) {
  if (world.getWorldTime() % 40 != 0) return;
  spectreMechanic(world, player);
};
spectre_armor.register();

val spectre_trait = TraitBuilder.create("spectre");
spectre_trait.color = 0x9CC1CE;
spectre_trait.localizedName = game.localize("e2ee.tconstruct.material.spectre.name");
spectre_trait.localizedDescription = game.localize("e2ee.tconstruct.material.spectre.description");
spectre_trait.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
  if (!isSelected) return;
  if (world.getWorldTime() % 40 != 0) return;
  if (! owner instanceof IPlayer) return;
  val player as IPlayer = owner;
  spectreMechanic(world, player);
};
spectre_trait.register();

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
var 
mat = MaterialBuilder.create("spectre_string");
mat.color = 0x90a4ae; 
mat.craftable = true;
mat.castable = false;
mat.representativeItem = <item:randomthings:ingredient:12>;
mat.addItem(<item:randomthings:ingredient:12>);
mat.localizedName = game.localize("e2ee.tconstruct.material.spectre_string.name");
mat.addBowStringMaterialStats(2.2);
mat.register();


/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
mat = MaterialBuilder.create("alpha_fur");
mat.color = 0x2196f3; 
mat.craftable = true;
mat.castable = false;
mat.representativeItem = <item:twilightforest:alpha_fur>;
mat.addItem(<item:twilightforest:alpha_fur>);
mat.localizedName = game.localize("e2ee.tconstruct.material.alpha_fur.name");
mat.addHeadMaterialStats(300, 2.0, 1.0, 1);
mat.addHandleMaterialStats(0.1, 100);
mat.addExtraMaterialStats(80);
mat.addBowMaterialStats(1.0, 0.3, 1.0);
mat.addProjectileMaterialStats();
mat.register();


var
trait_armor = ArmorTraitBuilder.create("alpha_fur");
trait_armor.color = 0x2196f3;
trait_armor.localizedName = game.localize("e2ee.tconstruct.material.alpha_fur.name");
trait_armor.localizedDescription = game.localize("e2ee.tconstruct.material.alpha_fur.description");
trait_armor.onHurt = function(trait, armor, player, source, damage, newDamage, evt) {
  if (!isNull(source.getTrueSource()) && source.getTrueSource() instanceof IEntityLivingBase) {
    var attacker as IEntityLivingBase = source.getTrueSource();
    attacker.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(60, 5));
  }
  return newDamage;
};
trait_armor.register();

var
trait = TraitBuilder.create("alpha_fur");
trait.color = 0x2196f3;
trait.localizedName = game.localize("e2ee.tconstruct.material.alpha_fur.name");
trait.localizedDescription = game.localize("e2ee.tconstruct.material.alpha_fur.description");
trait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
  target.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(60, 4));
};
trait.register();