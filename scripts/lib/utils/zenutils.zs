// Priority should be lower that utils.zs
#priority 3999

#modloaded zenutils
#reloadable

import crafttweaker.command.ICommandSender;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IWorld;

// ---------------------------------------------------
// ---------------------------------------------------
val executeCommandSilent as function(ICommandSender,string)void =
function(sender as ICommandSender, command as string) as void {
  server.commandManager.executeCommandSilent(sender, command);
};

utils.executeCommandSilent = executeCommandSilent;
// ---------------------------------------------------
// ---------------------------------------------------

# Spawn bunch of items like from gayser
val geyser as function(IWorld,IItemStack,float,float,float,int,double,double,double,int)void = 
function(
  world as IWorld,                    # World where everything happen
  output as IItemStack,               # Item that would be spawned
  x as float, y as float, z as float, # Position where new items spawned
  desiredAmount as int,               # Number of new items spawned
  mx as double, my as double, mz as double, # Motion of spawned items
  delay as int                        # Delay between spawning
) as void {
  val rnd = world.getRandom();
  val f = desiredAmount as float / 8.0f;
  var total = 0;
  var i = 0;
  val pos = crafttweaker.util.Position3f.create(x, y, z);
  while (total < desiredAmount) {
    val count = max(1, (f * (i + 1) + 0.5f) as int - total);
    total += count;
    world.catenation().sleep(i * delay + 1).then(function(world, ctx) {
      val itemEntity = (output * count).createEntityItem(world, x, y, z);
      itemEntity.motionY = my + 0.4d;
      itemEntity.motionX = mx + rnd.nextDouble(-0.1d, 0.1d);
      itemEntity.motionZ = mz + rnd.nextDouble(-0.1d, 0.1d);
      world.spawnEntity(itemEntity);

      // world.playSound("thaumcraft:poof", "ambient", pos, 0.5f, 1.5f);
      executeCommandSilent(itemEntity, "/particle fireworksSpark "~x as float~" "~y as float~" "~z as float~" 0 0.1 0 0.1 5");
    }).start();

    i += 1;
  }
};

utils.geyser = geyser;
