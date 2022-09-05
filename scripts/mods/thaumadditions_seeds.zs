#loader crafttweaker reloadableevents

static farmland as crafttweaker.block.IBlockPattern =
    <twilightforest:uberous_soil>.asBlock()
  | <farmingforblockheads:fertilized_farmland_rich>.asBlock()
  | <farmingforblockheads:fertilized_farmland_healthy>.asBlock()
  | <farmingforblockheads:fertilized_farmland_rich_stable>.asBlock()
  | <farmingforblockheads:fertilized_farmland_healthy_stable>.asBlock()
  | <farmingforblockheads:fertilized_farmland_stable>.asBlock()
  | <biomesoplenty:farmland_0>.asBlock()
  | <biomesoplenty:farmland_1>.asBlock()
  | <rustic:fertile_soil>.asBlock()
  | <minecraft:farmland>.asBlock()
  | <randomthings:fertilizeddirttilled>.asBlock()
;

events.onPlayerInteractBlock(function(e as crafttweaker.event.PlayerInteractBlockEvent) {
  if(e.world.remote || isNull(e.item)) return;
  if(!e.item.definition.id.startsWith('thaumadditions:vis_seeds') || !(farmland has e.block)) return;
  val dimType = e.world.getDimensionType();
  if(dimType == 'planet' || dimType == 'emptiness') return;

  e.player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation("e2ee.restrict.vis_seeds"));
  e.cancel();
});
