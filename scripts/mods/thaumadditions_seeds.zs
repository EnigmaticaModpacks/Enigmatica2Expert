#loader crafttweaker reloadableevents

import crafttweaker.world.IFacing;

static farmland as string[] = [
  'minecraft:farmland',
  'rustic:fertile_soil',
  'randomthings:fertilizeddirttilled',
  'farmingforblockheads:fertilized_farmland_rich',
  'farmingforblockheads:fertilized_farmland_healthy',
  'farmingforblockheads:fertilized_farmland_rich_stable',
  'farmingforblockheads:fertilized_farmland_healthy_stable',
  'farmingforblockheads:fertilized_farmland_stable',
  'biomesoplenty:farmland_0',
  'biomesoplenty:farmland_1',
  'twilightforest:uberous_soil',
] as string[];

events.onBlockPlace(function(e as crafttweaker.event.BlockPlaceEvent) {
  if(e.world.remote || isNull(e.current)) return;
  if(!e.current.block.definition.id.startsWith('thaumadditions:vis_crop')
    || !(farmland has e.placedAgainst.block.definition.id)) return;

  val dimType = e.world.getDimensionType();
  if(dimType == 'planet' || dimType == 'emptiness') return;

  e.player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation("e2ee.restrict.vis_seeds"));
  // e.cancel();
});

events.onBlockNeighborNotify(function(e as crafttweaker.event.BlockNeighborNotifyEvent) {
  if (!e.block.definition.id.startsWith('thaumadditions:vis_crop')) return;
  if (!(farmland has e.world.getBlock(e.position.getOffset(IFacing.down(), 1)).definition.id)) return;

  val dimType = e.world.getDimensionType();
  if(dimType == 'planet' || dimType == 'emptiness') return;

  e.cancel();
  e.world.destroyBlock(e.position, true);
});
