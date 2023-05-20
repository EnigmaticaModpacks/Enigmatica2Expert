#loader crafttweaker reloadable

static entityMap as int[string] = {
  wolf               : 0,
  chicken            : 1,
  cow                : 2,
  creeper            : 3,
  skeleton           : 4,
  zombie_pigman      : 5,
  bat                : 6,
  zombie             : 7,
  witch              : 8,
  villager           : 9,
  ocelot             : 10,
  sheep              : 11,
  blaze              : 12,
  silverfish         : 13,
  spider             : 14,
  cave_spider        : 15,
  slime              : 16,
  ghast              : 17,
  enderman           : 18,
  magma_cube         : 19,
  squid              : 20,
  mooshroom          : 21,
  villager_golem     : 22,
  snowman            : 23,
  pig                : 24,
  endermite          : 25,
  guardian           : 26,
  rabbit             : 27,
  polar_bear         : 28,
  shulker            : 29,
  horse              : 30,
  skeleton_horse     : 31,
  zombie_horse       : 32,
  donkey             : 33,
  mule               : 34,
  llama              : 35,
  elder_guardian     : 36,
  wither_skeleton    : 37,
  stray              : 38,
  husk               : 39,
  zombie_villager    : 40,
  evocation_illager  : 41,
  vex                : 42,
  vindication_illager: 43,
} as int[string];



// This function should be called once
// warding `/ct reload`
function postInit() as void {
  for entity_id, num in entityMap {
    val id = "minecraft:"~entity_id;
    scripts.jei.crafting_hints.addInsOutCatl(
      [Soul(id), null, null, <minecraft:anvil>, <advancedrocketry:basalt>],
      <openblocks:trophy:2>.withTag({entity_id: id})
    );
  }
}

events.onEntityLivingDamage(function (e as crafttweaker.event.EntityLivingDamageEvent) {
  val mob = e.entity;
  if (
    isNull(mob)
    || isNull(mob.world)
    || mob.world.remote
    || isNull(mob.definition)
    || isNull(e.damageSource)
    || isNull(e.damageSource.damageType)
    || e.damageSource.damageType != 'anvil'
    || !mob.definition.id.startsWith('minecraft:')
  ) return;

  val blockUnderPos = mob.position.getOffset(crafttweaker.world.IFacing.down(), 1);
  val blockState = mob.world.getBlockState(blockUnderPos);
  if (isNull(blockState) || blockState != <blockstate:advancedrocketry:basalt>) return;

  val trophyIndex = entityMap[mob.definition.id.substring(10)];
  if (isNull(trophyIndex)) return;

  mob.world.removeEntity(mob);
  mob.world.destroyBlock(blockUnderPos, false);
  mob.world.setBlockState(<blockstate:openblocks:trophy>, {
    entity_id  : mob.definition.id,
    trophyIndex: trophyIndex as int,
  }, blockUnderPos);
});
