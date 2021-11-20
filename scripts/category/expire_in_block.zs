import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.world.IWorld;
import crafttweaker.entity.IEntityItem;

#priority 10
// #loader crafttweaker reloadableevents

static list as IItemStack[string][IIngredient] = {} as IItemStack[string][IIngredient];

function setEx(input as IIngredient, blockID_output as IItemStack[string], catalyst as IItemStack) as void {
  list[input] = blockID_output;
  for blockID, output in blockID_output {
    scripts.requiousJei.add_expire_in_block(input, catalyst, output);
  }
}

function set(input as IIngredient, blockID_output as IItemStack[string]) as void {
  list[input] = blockID_output;
  for blockID, output in blockID_output {
    scripts.requiousJei.add_expire_in_block(input, itemUtils.getItem(blockID), output);
  }
}

events.onItemExpire(function(e as crafttweaker.event.ItemExpireEvent){
  // print("~~~ onItemExpire");
  if(e.entity.world.isRemote()) return; # Remote world
  // print(" ~~ not remote");
  if(isNull(e.item) || isNull(e.item.item)) return; # No item
  // print(" ~~ has item");

  val item = e.item.item.anyAmount();
  for ingr, tuple in list {
    // print("  ~ test .");
    if(ingr has item) {
      // print("    item on pos: ["~e.entity.x as int~" "~e.entity.y as int~" "~e.entity.z as int~"] as double:["~e.entity.x~" "~e.entity.y~" "~e.entity.z~"]");
      val block = e.entity.world.getBlock(e.entity.position);
      if(isNull(block)
        || isNull(block.definition)
        || isNull(block.definition.id)
        || block.definition.id == "minecraft:air"
      ) return;
      val blockID = block.definition.id;
      // print("    blockID:"~blockID);
      val output = tuple[blockID];
      // print("    check output");
      if(!isNull(output)) {
        return spawnItems(e.item, output);
      }
    }
  }
});

function spawnItems(inputItEnt as IEntityItem, output as IItemStack) as void {
  val rnd = inputItEnt.world.getRandom();
  val desiredAmount = inputItEnt.item.amount * output.amount;
  val f = desiredAmount as float / 8.0f;
  var total = 0;
  var i = 0;
  // print("    f: "~f);
  val pos = crafttweaker.util.Position3f.create(inputItEnt.x as float, inputItEnt.y as float, inputItEnt.z as float);
  while (total < desiredAmount) {
    // print("      total: "~total);
    val count = max(1, (f * (i + 1) + 0.5f) as int - total);
    total += count;
    mods.zenutils.DelayManager.addDelayWork(function() {
      // print("        Delayed work i: "~i);
      if(isNull(inputItEnt) || isNull(inputItEnt.world)) return;
      val itemEntity = (output * count).createEntityItem(inputItEnt.world, inputItEnt.x as float, inputItEnt.y as float, inputItEnt.z as float);
      itemEntity.motionY = 0.4d;
      itemEntity.motionX = rnd.nextDouble(-0.1d, 0.1d);
      itemEntity.motionZ = rnd.nextDouble(-0.1d, 0.1d);
      inputItEnt.world.spawnEntity(itemEntity);

      inputItEnt.world.playSound("thaumcraft:poof", "ambient", pos, 0.5f, 1.5f);
      // server.commandManager.executeCommand(server, "/particle fireworksSpark "~inputItEnt.x~" "~inputItEnt.y~" "~inputItEnt.z~" 0 0.1 0 0.1 5");
    }, i * 3 + 1);

    i += 1;
  }
}