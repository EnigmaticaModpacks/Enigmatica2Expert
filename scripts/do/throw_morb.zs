/*

Prevent some throwable stackable Entity Cells
(like Thermal Expansion Morbs) from working, if
mob not damaged

Authors:
https://github.com/git-confused
https://github.com/Krutoy242

*/

import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.text.ITextComponent.fromTranslation;

#loader crafttweaker reloadableevents

static hpPortionTreshold as double = 0.8;
static ignoredHealth as double = 20.0;

// morb-like items limitation hint
scripts.lib.tooltip.desc.both(<thermalexpansion:morb:*>, "morb_resist", (hpPortionTreshold * 100) as int, (ignoredHealth / 2) as int);
scripts.lib.tooltip.desc.both(<cyclicmagic:magic_net>  , "morb_resist", (hpPortionTreshold * 100) as int, (ignoredHealth / 2) as int);

static uncapturables as IEntityDefinition[] = [
/*Inject_js(
  config('config/cofh/thermalexpansion/morbs.cfg')
  .Blacklist.Blacklist.map(s=>`  <entity:${s}>,`)
)*/
  <entity:iceandfire:cyclops>,
  <entity:iceandfire:deathwormegg>,
  <entity:iceandfire:dragonegg>,
  <entity:iceandfire:dragonskull>,
  <entity:iceandfire:firedragon>,
  <entity:iceandfire:gorgon>,
  <entity:iceandfire:hippogryphegg>,
  <entity:iceandfire:icedragon>,
  <entity:iceandfire:if_cockatriceegg>,
  <entity:iceandfire:if_mob_skull>,
  <entity:iceandfire:myrmex_egg>,
  <entity:iceandfire:myrmex_queen>,
  <entity:iceandfire:stonestatue>,
  <entity:iceandfire:tide_trident>,
  <entity:botania:doppleganger>,
  <entity:draconicevolution:guardiancrystal>,
  <entity:extrabotany:gaiaiii>,
  <entity:extrabotany:voidherrscher>,
  <entity:minecraft:ender_dragon>,
  <entity:minecraft:evocation_illager>,
  <entity:minecraft:vindication_illager>,
  <entity:minecraft:wither>,
  <entity:twilightforest:armored_giant>,
  <entity:twilightforest:armored_giant>,
  <entity:twilightforest:giant_miner>,
  <entity:twilightforest:giant_miner>,
  <entity:twilightforest:hydra>,
  <entity:twilightforest:knight_phantom>,
  <entity:twilightforest:lich>,
  <entity:twilightforest:minoshroom>,
  <entity:twilightforest:naga>,
  <entity:twilightforest:snow_queen>,
  <entity:twilightforest:ur_ghast>,
  <entity:twilightforest:yeti_alpha>,
/**/
] as IEntityDefinition[];

events.onProjectileImpactThrowable(function (e as crafttweaker.event.ProjectileImpactThrowableEvent) {
  if (isNull(e.thrower)
      || !(e.thrower instanceof IPlayer)
      || e.thrower.world.remote
      || isNull(e.rayTrace.entity)
      || !(e.rayTrace.entity instanceof IEntityLivingBase)
      || e.rayTrace.entity instanceof crafttweaker.entity.IEntityAnimal
  ) return;

  val player as IPlayer = e.thrower;
  if (player.creative) return;

  val pokemon as IEntityLivingBase = e.rayTrace.entity;
  if (pokemon.maxHealth == 0) return;
  if (isNull(pokemon.definition) || isNull(pokemon.definition.id)) return; // why does this happen?

  val projectile = e.entity;
  val item = projectile.definition.id == <entity:thermalexpansion:morb>.id && projectile.nbt.EntityData.length == 0
    ? (projectile.nbt.Type == 1 ? <thermalexpansion:morb:1> : <thermalexpansion:morb:0>)
    : projectile.definition.id == <entity:cyclicmagic:magicnetempty>.id
      ? <cyclicmagic:magic_net>
      : null;
  if (isNull(item)) return;

  var capturable = true;
  for ii in uncapturables {
    if (isNull(ii) || isNull(ii.id)) continue;
    if (pokemon.definition.id == ii.id) {
      capturable = false;
      break;
    }
  }

  val hpPortion = pokemon.health / pokemon.maxHealth;
  if (capturable && (hpPortion <= hpPortionTreshold || pokemon.health <= ignoredHealth)) return;

  val x = projectile.position3f.x;
  val y = projectile.position3f.y;
  val z = projectile.position3f.z;

  server.commandManager.executeCommandSilent(pokemon, '/particle angryVillager ' ~ x ~ ' ' ~ y ~ ' ' ~ z ~ ' 0.2 0.1 0.2 0.1 3 ');
  player.sendPlaySoundPacket('mekanism:etc.error', 'ambient', pokemon.position, 2.0f, 1.5f);

  val itemEntity = item.createEntityItem(projectile.world, x, y, z);
  projectile.world.spawnEntity(itemEntity);

  val message = capturable
    ? fromTranslation('e2ee.creature_resisted_morb', item.displayName)
    : fromTranslation('e2ee.creature_uncapturable');

  player.sendRichTextMessage(message);

  e.cancel();
  projectile.setDead();
});
