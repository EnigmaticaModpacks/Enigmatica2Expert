#loader contenttweaker
#modloaded scalinghealth ctintegration

import crafttweaker.player.IPlayer;

//
// difficulty
//
val difficulty = mods.contenttweaker.tconstruct.TraitBuilder.create('difficulty');
difficulty.color = 0xD1310D;
difficulty.localizedName = 'Difficulty';
difficulty.localizedDescription = '§oScalling Difficulty\n§rMining, attacking and receive damage reduce player difficulty';
difficulty.afterBlockBreak = function (trait, tool, world, blockstate, miner, wasEffective, unknown) {
  if (world.isRemote()) return;
  if (!miner instanceof IPlayer) return;
  val player as IPlayer = miner;
  mods.ctintegration.scalinghealth.DifficultyManager.addDifficulty(player, -0.001);
};
difficulty.onHit = function (trait, tool, attacker, target, damage, isCritical) {
  if (!attacker instanceof IPlayer) return;
  val player as IPlayer = attacker;
  if (player.world.isRemote()) return;
  if (damage <= 0) return;
  mods.ctintegration.scalinghealth.DifficultyManager.addDifficulty(player, -0.001 * damage);
};
difficulty.register();

//
// difficulty_armor
//
val difficulty_armor = mods.contenttweaker.conarm.ArmorTraitBuilder.create('difficulty');
difficulty_armor.color = 0xD1310D;
difficulty_armor.localizedName = 'Difficulty';
difficulty_armor.localizedDescription = '§oScalling Difficulty\n§rMining, attacking and receive damage reduce player difficulty';
difficulty_armor.onDamaged = function (trait, armor, player, source, damage, newDamage, evt) {
  if (player.world.isRemote()) return newDamage;
  if (newDamage <= 0) return newDamage;
  mods.ctintegration.scalinghealth.DifficultyManager.addDifficulty(player, -0.001 * newDamage);
  return newDamage;
};
difficulty_armor.register();
