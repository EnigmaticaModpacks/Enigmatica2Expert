import crafttweaker.world.IFacing;
static itemsConsumed as int = 4;

# Remove recipes defined by other methods
recipes.removeByRecipeName("mysticalagriculture:itemcraftingcomponent");
scripts.category.tooltip_utils.desc.both(
  <mysticalagriculture:aquamarine_essence>,
  "tooltips.lang.drop_at_night",
  <mysticalagriculture:aquamarine_essence>.displayName,
  <minecraft:sand>.displayName
);
scripts.jei.crafting_hints.addInsOutCatl([
  <mysticalagriculture:aquamarine_essence> * itemsConsumed, null, null, null, <minecraft:sand>
], <astralsorcery:blockcustomsandore>,
  <minecraft:daylight_detector>.withDisplayName(game.localize("tooltips.lang.must_see_night"))
);

// ---------------------------------------------------------------------
events.onWorldTick(function(e as crafttweaker.event.WorldTickEvent){
  val world = e.world;
  if(world.remote) return;
  if(
    world.dayTime
    || world.raining
    || world.time % 20 != 0
  ) return;

  for entityItem in world.getEntityItems() {
    // Must be aquamarine essence
    if (
      isNull(entityItem) || isNull(entityItem.item)
      || entityItem.item.definition.id != 'mysticalagriculture:aquamarine_essence'
    ) continue;

    // Must have appropriate amount
    val p = entityItem.position;
    if(entityItem.item.amount < itemsConsumed) {
      server.commandManager.executeCommandSilent(server, "/particle fireworksSpark "~p.x~" "~(p.y+1.5)~" "~p.z~" 0.05 0.3 0.05 -0.01 "~entityItem.item.amount);
      continue;
    }

    // Should see sky
    val seeSky = mods.ctutils.world.World.canSeeSky(world, entityItem.position);
    if(!seeSky) continue;

    // Must lay on sand
    val blockPos = entityItem.position.getOffset(IFacing.down(), 1);
    val block = world.getBlock(blockPos);
    if(block.definition.id != 'minecraft:sand') continue;

    // Consume
    entityItem.item.mutable().shrink(itemsConsumed);

    // Replace block
    world.destroyBlock(blockPos, false);
    world.setBlockState(<blockstate:astralsorcery:blockcustomsandore>, blockPos);

    // Spawn particles and sound
    server.commandManager.executeCommandSilent(server, "/particle fireworksSpark "~p.x~" "~(p.y+1.5)~" "~p.z~" 0 1 0 -0.01 20");
    world.playSound("thaumcraft:poof", "ambient", entityItem.position, 0.5f, 1.5f);
  }
});