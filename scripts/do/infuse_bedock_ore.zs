import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockState;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityItem;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import crafttweaker.world.IWorld;

#reloadable
#modloaded bedrockores

recipes.removeByRecipeName("mysticalagriculture:ingotosmium");

# Item and respective block
static customRecipes as IItemStack[string] = {
  'mysticalagriculture:osmium_essence' : <mekanism:oreblock>,
} as IItemStack[string];

for itemId, block in customRecipes {
  val item = itemUtils.getItem(itemId);
  scripts.lib.tooltip.desc.both(
    item,
    "tooltips.lang.infuse_bedrock",
    item.displayName,
    <minecraft:bedrock>.displayName
  );
  scripts.jei.crafting_hints.addInsOutCatl([item], block, <minecraft:bedrock>);
}

events.onPlayerInteractBlock(function(e as crafttweaker.event.PlayerInteractBlockEvent){
  val world = e.world;
  if(isNull(world)) return;

  val item = e.item;
  if (isNull(item) || item.amount < 1) return;

  var isInit = false;
  var isAdd = false;
       if(e.block.definition.id == 'minecraft:bedrock') isInit = true;
  else if(e.block.definition.id == 'bedrockores:bedrock_ore') isAdd = true;
  else return;

  val resultBlock = customRecipes[item.definition.id];
  if (isNull(resultBlock)) return;

  val resultId = resultBlock.asBlock().definition.numericalId;
  if(isAdd && (
    isNull(e.block.data)
    || isNull(e.block.data.oreId)
    || isNull(e.block.data.oreMeta)
    || isNull(e.block.data.amount)
    || resultId != e.block.data.oreId.asInt()
    || resultBlock.damage != e.block.data.oreMeta.asInt()
  )) return;

  if(world.remote) {
    world.playSound("thaumcraft:poof", "ambient", e.position.getOffset(crafttweaker.world.IFacing.up(), 1), 0.5f, 0.2f);
    return;
  }

  val oldData = world.getBlock(e.position).data;
  var totalAmount = isAdd ? e.block.data.amount.asInt() : 0;
  if(isInit) {
    world.destroyBlock(e.position, false);
  }

  val newData = {
    amount : totalAmount + item.amount,
    oreMeta: resultBlock.damage,
    oreId  : resultId,
  } as IData;
  world.setBlockState(<blockstate:bedrockores:bedrock_ore>, isNull(oldData) ? newData : oldData + newData, e.position);
  item.mutable().shrink(item.amount);
  mods.contenttweaker.Commands.call("/particle fireworksSpark "~e.x~" "~(e.y+1.0)~" "~e.z~" 0.1 0 0.1 0.01 10", e.player, world, false, true);
});
