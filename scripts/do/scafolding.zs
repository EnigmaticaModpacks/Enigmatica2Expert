import crafttweaker.entity.IEntityItem;
import crafttweaker.world.IFacing;
import crafttweaker.block.IBlockState;
import crafttweaker.item.IItemStack;

#loader crafttweaker reloadableevents

static offsetOrder as int[] = [
/*Inject_js{
const arr = []
for (let i = -4; i <= 4; i++) {
  for (let j = -4; j <= 4; j++) {
    arr.push([i,j])
  }
}
const len = ([x,y]) => Math.sqrt(x*x+y*y)
return arr
  .sort((a,b) => len(a) - len(b))
  .flat()
  .join(',')
}*/
0,0,-1,0,0,-1,0,1,1,0,-1,-1,-1,1,1,-1,1,1,-2,0,0,-2,0,2,2,0,-2,-1,-2,1,-1,-2,-1,2,1,-2,1,2,2,-1,2,1,-2,-2,-2,2,2,-2,2,2,-3,0,0,-3,0,3,3,0,-3,-1,-3,1,-1,-3,-1,3,1,-3,1,3,3,-1,3,1,-3,-2,-3,2,-2,-3,-2,3,2,-3,2,3,3,-2,3,2,-4,0,0,-4,0,4,4,0,-4,-1,-4,1,-1,-4,-1,4,1,-4,1,4,4,-1,4,1,-3,-3,-3,3,3,-3,3,3,-4,-2,-4,2,-2,-4,-2,4,2,-4,2,4,4,-2,4,2,-4,-3,-4,3,-3,-4,-3,4,3,-4,3,4,4,-3,4,3,-4,-4,-4,4,4,-4,4,4
/**/
] as int[];

static xp_consumption as int = 1;

events.onPlayerInteractBlock(function(e as crafttweaker.event.PlayerInteractBlockEvent){
  val world = e.world;
  if(isNull(world)) return;

  val item = e.item;
  if (isNull(item) || item.amount < 1) return;
  if(item.definition.id != 'openblocks:scaffolding') return;

  if(e.player.isSneaking) return;

  val x = e.x;
  val y = e.y;
  val z = e.z;

  if(e.player.xp < xp_consumption) {
    server.commandManager.executeCommandSilent(server, "/particle fireworksSpark "~x~" "~(y+0.5)~" "~z~" 0.1 0.1 0.1 0.1 2");
    world.playSound("thaumcraft:poof", "ambient", e.position, 0.2f, 3.0f);
    return;
  }

  world.playSound("thaumcraft:poof", "ambient", e.position, 0.5f, 0.5f);

  val cat = world.catenation().then(function(world, ctx) {ctx.data = 0;});
  var found = false;
  for i in 0 .. offsetOrder.length {
    if(i % 2 != 0)continue;
    val ox = offsetOrder[i];
    val oy = offsetOrder[i + 1];
    val blockPos = crafttweaker.util.Position3f.create(
      x + ox,
      y,
      z + oy
    ).asBlockPos();
    if(!world.getBlockState(blockPos).isReplaceable(world, blockPos)) continue;
    found = true;
    if(world.remote) continue;
    cat.then(function(world, ctx) {
      if(
        ctx.data.asInt() >= 24 ||
        !world.getBlockState(blockPos).isReplaceable(world, blockPos) ||
        isNull(e.player) || e.player.xp < xp_consumption
      ) return;
      world.setBlockState(<blockstate:cyclicmagic:block_fragile_weak>, blockPos);
      server.commandManager.executeCommandSilent(server, "/particle fireworksSpark "~blockPos.x~" "~blockPos.y~" "~blockPos.z~" 0.3 0.3 0.3 0.01 1");
      ctx.data = ctx.data.asInt() + 1;
      e.player.sendPlaySoundPacket("minecraft:block.ladder.place", "ambient", blockPos, 0.2f, 1.0f);
      // e.player.xp = max(0, e.player.xp - xp_consumption);
      // e.player.removeExperience(xp_consumption);
    });
  }
  if(!found) return;
  // e.player.xp = max(0, e.player.xp - xp_consumption);

  e.cancel();
  if(!e.player.creative) item.mutable().shrink(1);
  e.player.removeXP(xp_consumption);

  if(world.remote) return;
  cat.start();
});