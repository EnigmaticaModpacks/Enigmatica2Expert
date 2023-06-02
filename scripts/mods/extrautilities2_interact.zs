
#modloaded extrautils2
#reloadable

# Fix Error when you have a full inventory and try to fill buckets
# from the Drum, the buckets just disappear instead of falling to the ground
events.onPlayerInteractBlock(function (e as crafttweaker.event.PlayerInteractBlockEvent) {
  if(isNull(e.item)) return;
  if(e.block.definition.id != 'extrautils2:drum') return;

  for i in 0 .. 36 {
    if(isNull(e.player.getInventoryStack(i))) {
      return;
    }
  }

  e.player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation("e2ee.eu2_drum_error"));
  e.cancel();
});