#loader contenttweaker

import mods.contenttweaker.tconstruct.TraitBuilder;
import crafttweaker.block.IBlockState;
import crafttweaker.event.IBlockEvent;
import mods.contenttweaker.conarm.ArmorTraitBuilder;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.max;
import crafttweaker.player.IPlayer;


/* 
Taken from: wilderness-minecraft
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
mentor.localizedName = "Mentor";
mentor.localizedDescription = "\u00a7oPower of knowledge\n\u00a7rTool repair itself consuming experience";
mentor.onUpdate = function(trait, tool, world, owner, itemSlot, isSelected) {
  if(world.isRemote()) return;
  if(world.getWorldTime() % 5 != 0) return;
  if(tool.damage >= tool.maxDamage || !tool.isDamageable) return;
  if(! owner instanceof IPlayer) return;
  val player as IPlayer = owner;
  if(player.xp < 2) return;
  player.removeExperience(2);
  // player.xp = player.xp - 2;

  val dmg = max(0, tool.damage - 1);
  // player.setItemToSlot(crafttweaker.entity.IEntityEquipmentSlot(itemSlot), tool.withDamage(dmg));
  tool.damageItem(-1, owner);
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
val difficulty_armor = ArmorTraitBuilder.create("difficulty_armor");
difficulty_armor.color = 0xd1310d;
difficulty_armor.localizedName = "Difficulty";
difficulty_armor.localizedDescription = "\u00a7oScalling Difficulty\n\u00a7rMining and attacking reduce player difficulty";
difficulty_armor.onDamaged = function(trait, armor, player, source, damage, newDamage, evt) {
  if(player.world.isRemote()) return newDamage;
  if(newDamage <= 0) return newDamage;
  mods.ctintegration.scalinghealth.DifficultyManager.addDifficulty(player, -0.01 * newDamage);
  return newDamage;
};
difficulty_armor.register();