import crafttweaker.entity.IEntityItem;
import crafttweaker.world.IFacing;
import crafttweaker.block.IBlockState;
import crafttweaker.item.IItemStack;

#loader crafttweaker reloadable
#modloaded bedrockores

recipes.removeByRecipeName("mysticalagriculture:ingotosmium");

# Item and respective block
static customRecipes as IBlockState[IItemStack][string] = {
  'mysticalagriculture:osmium_essence' : { <mekanism:oreblock> : <blockstate:mekanism:oreblock:type=osmium> },
} as IBlockState[IItemStack][string];

for itemId, tuple in customRecipes {
  for block, state in tuple {
    val item = itemUtils.getItem(itemId);
    scripts.category.tooltip_utils.desc.both(
      item,
      "tooltips.lang.infuse_bedrock",
      item.displayName,
      <minecraft:bedrock>.displayName
    );
    scripts.jei.crafting_hints.addInsOutCatl([item], block, <minecraft:bedrock>);
  }
}


events.onPlayerInteractBlock(function(e as crafttweaker.event.PlayerInteractBlockEvent){
  val world = e.world;
  if(isNull(world) || world.remote) return;

  val item = e.item;
  if (isNull(item) || item.amount < 1) return;

  val block = e.block;
  if(block.definition.id != 'minecraft:bedrock') return;

  val tuple = customRecipes[item.definition.id];
  if (isNull(tuple)) return;

  for _, state in tuple {
    world.destroyBlock(e.position, false);
    world.setBlockState(state, e.position);
    server.commandManager.executeCommandSilent(server, "/bedrockores wrap "~item.amount~" "~e.x~" "~e.y~" "~e.z);
    server.commandManager.executeCommandSilent(server, "/particle fireworksSpark "~e.x~" "~(e.y+1.0)~" "~e.z~" 0.1 0 0.1 0.01 10");
    world.playSound("thaumcraft:poof", "ambient", e.position, 0.5f, 1.5f);
    item.mutable().shrink(item.amount);
    return;
  }
});

