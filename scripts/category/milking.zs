/*
  Extract seed issue from gender-specific animals
*/

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.entity.IEntityLiving;
import crafttweaker.data.IData;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.max;
import crafttweaker.entity.IEntityAnimal;
import crafttweaker.block.IBlockState;


#loader crafttweaker reloadableevents

mods.tconstruct.Fuel.registerFuel(<liquid:seed> * 10, 500000);

// List of Regex animals that can be milked
static animals as float[string] = {
  ".*buck.*"    : 100.0f,
  ".*bull.*"    : 1000.0f,
  ".*hog.*"     : 2000.0f,
  ".*peacock.*" : 10.0f,
  ".*ram.*"     : 1500.0f,
  ".*rooster.*" : 10.0f,
  ".*stallion.*": 1000.0f,
  ".*firedragon" : 16000.0f,
  ".*icedragon"  : 16000.0f,
} as float[string];

// Excess seed spawn offsets
static spillOffsets as int[][] = [[ 0,-1, 0],
[-1,-1, 0], [ 1,-1, 0],
[ 0,-1,-1], [ 0,-1, 1],
[-1,-1,-1], [-1,-1, 1],
[ 1,-1,-1], [ 1,-1, 1],
] as int[][];

// What items can be used to milking and their maximum amounts
static tanksForMilk as IData[string] = {
  "forge:bucketfilled"                : { tag:{Amount: 1000}, portion: 1000},
  "minecraft:bucket"                  : { tag:{Amount: 1000}, portion: 1000, mutated: "forge:bucketfilled"},
  "rustic:liquid_barrel"              : { tag:{Amount: 16000} },
  "randomthings:reinforcedenderbucket": { tag:{Fluid: {Amount: 10000}} },
  "randomthings:enderbucket"          : { tag:{Fluid: {Amount: 1000}} },
  "cyclicmagic:block_storeempty"      : { tag:{Amount: 32000} },
  "forestry:pipette"                  : { tag:{Fluid: {Amount: 1000}} },
  "mekanism:gaugedropper"             : { tag:{Fluid: {Amount: 1000}} },
} as IData[string];



// Add milking
function milk(e as crafttweaker.event.PlayerInteractEntityEvent) as bool {

  // Check if have at least something
  var itemInHand = e.player.mainHandHeldItem;
  if(isNull(itemInHand)) return false;

  // Find what item player holding
  var holdItem as IItemStack = null;
  var holdData as IData = null;
  for itemName, data in tanksForMilk {
    var item = itemUtils.getItem(itemName);
    if(!isNull(item) && (itemName == itemInHand.definition.id)) {
      holdItem = item;
      holdData = data;
    }
  }
  if(isNull(holdItem)) return false; // Player hold something wrong

  // Check what animal can be milked
  if(isNull(e.target) || isNull(e.target.definition)) return false;
  if (! e.target instanceof IEntityLiving) return false;
  val targetName = e.target.definition.name;

  var milkAmount = 0.0f;
  for animal, amount in animals {
    if (targetName.matches(animal)) {
      milkAmount = amount as float;
      break;
    }
  }
  if(milkAmount == 0.0f) return false; // Animal is not a male


  //Check animal sex (for dragons)
  var entNbt = e.target.getNBT();
  if (!isNull(entNbt.Gender) && entNbt.Gender != 1 as byte) return false; // Dragon is not male

  // Check player position (should be under entity)
  if (e.player.y >= e.target.y - 1) return false;

  // Apply animal size modifier
  var animal as IEntityLiving = e.target;
  milkAmount *= 1.0f / animal.renderSizeModifier;

  // If animal in LOVE x10 output
  var entityAnimal as IEntityAnimal = e.target;
  var entityLivingBase as crafttweaker.entity.IEntityLivingBase = e.target;
  if (
    entityAnimal.isInLove
    || entityLivingBase.isPotionActive(<potion:potioncore:love>)
    || entityLivingBase.isPotionActive(<potion:extrautils2:effect.xu2.love>)
  ) milkAmount *= 10.0;

  // Return if container accept only with bug portions
  val dholdData = D(holdData);
  if(milkAmount < dholdData.getFloat("portion", 1.0f)) return false;

  // Determine maximum tank size
  var maxTankSize = dholdData.getInt("tag.Fluid.Amount", dholdData.getInt("tag.Amount", 1000));

  //Spawn liquid on ground if overwhelming amount
  var spilled = max(0.0f, milkAmount - maxTankSize as float) as int;
  if (spilled > 0) {

    val maxSpilled = pow(spilled as double / 1000.0d, 0.5d) as int;
    var totalSpilled = 0;
    var i = 0;
    while totalSpilled < maxSpilled && i < spillOffsets.length  {

      var tx = (animal.x + spillOffsets[i][0]) as float;
      var ty = (animal.y + spillOffsets[i][1] + 1.0) as float;
      var tz = (animal.z + spillOffsets[i][2]) as float;
      var blockPos = crafttweaker.util.Position3f.create(tx, ty, tz).asBlockPos();

      if (e.target.world.getBlockState(blockPos) == <blockstate:minecraft:air>) {
        e.target.world.setBlockState(<blockstate:contenttweaker:seed:level=7>, blockPos);
        totalSpilled +=1;
      }

      i += 1;
    }
  }

  // Play sound if milking is succes
  animal.playLivingSound();

  // Update fluid amount on tag
  var updatedTag as IData = itemInHand.tag;
  var clippedAmount = min(maxTankSize, max(1, milkAmount as int)) as int;
  if (isNull(holdData.tag.Fluid)) {
    updatedTag += {FluidName: "seed", Amount: clippedAmount};
  } else {
    updatedTag += {Fluid: {FluidName: "seed", Amount: clippedAmount}};
  }

  // Mutate item if needed
  var mutatedContainer = !isNull(holdData.mutated) ? itemUtils.getItem(holdData.mutated) : itemInHand*1;
  mutatedContainer = mutatedContainer.withTag(updatedTag);

  // Replace item in hand if there is only 1
  // Reduce and give another if more
  var handSlot = crafttweaker.entity.IEntityEquipmentSlot.mainHand();
  if (itemInHand.amount == 1) {
    e.player.setItemToSlot(handSlot, mutatedContainer);
  } else {
    e.player.setItemToSlot(handSlot, itemInHand * (itemInHand.amount - 1));
    e.player.give(mutatedContainer);
  }

  return true;
}

// -------------------------------
// Hook on event
// -------------------------------
static playerLastActionTime as long[string] = {} as long[string];

events.onPlayerInteractEntity(function(e as crafttweaker.event.PlayerInteractEntityEvent){
  if(!e.player.world.isRemote()
    && (
      isNull(playerLastActionTime[e.player.name]) ||
      e.player.world.time != playerLastActionTime[e.player.name]
    ) // Double event call safe
  ) {
    if (milk(e)) {
      playerLastActionTime[e.player.name] = e.player.world.time;
      e.canceled = true;
    } else {
      e.canceled = false;
    }
  }
});
