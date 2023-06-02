#reloadable

import crafttweaker.item.IIngredient;

static catalystRequirments as IIngredient[] = [
  <extendedcrafting:material:8>,
  <extendedcrafting:material:9>,
  <extendedcrafting:material:10>,
  <extendedcrafting:material:11>,
  <extendedcrafting:material:12>,
  <extendedcrafting:material:13>,
] as IIngredient[];

# Consuming item mechanic
events.onPlayerInteractBlock(function(e as crafttweaker.event.PlayerInteractBlockEvent){
  val world = e.world;
  if(world.isRemote()) return;
  if(
    e.player.isSneaking 
    || isNull(e.player.currentItem) 
    || !e.player.currentItem.definition.id.startsWith('danknull:dank_null_')
  ) return;
  if(isNull(e.block) || !(e.block.definition.id == "danknull:danknull_dock")) return;

	val dankTier = e.player.currentItem.definition.id.substring('danknull:dank_null_'.length) as int;
  if(dankTier < 0 || dankTier > 5) return;
  
	val offHandItem = e.player.getItemInSlot(crafttweaker.entity.IEntityEquipmentSlot.offhand());
  val requiredItem = catalystRequirments[dankTier];
  if(isNull(offHandItem) || !requiredItem.matches(offHandItem)) {
    e.player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation(
      "e2ee.danknull_dock.must_have",
      requiredItem.items[0].displayName,
      e.player.currentItem.displayName,
      e.block.displayName,
      requiredItem.items[0].displayName
    ));
    return e.cancel();
  }

  offHandItem.mutable().shrink(1);
});