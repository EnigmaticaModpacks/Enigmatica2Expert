import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.entity.IEntityLiving;
import crafttweaker.data.IData;
import mods.ctutils.utils.Math.min;
import mods.ctutils.utils.Math.max;

#norun


# List of Regex animals that can be milked
static animals as float[string] = {
".*buck.*"    : 100,
".*bull.*"    : 1000,
".*hog.*"     : 2000,
".*peacock.*" : 10,
".*ram.*"     : 200,
".*rooster.*" : 10,
".*stallion.*": 10,
".*peacock.*" : 10,
".*firedragon" : 16000,
".*icedragon"  : 16000,
} as float[string];

static spillOffsets as int[][] = [[ 0,-1, 0],
[-1,-1, 0], [ 1,-1, 0],
[ 0,-1,-1], [ 0,-1, 1],
[-1,-1,-1], [-1,-1, 1],
[ 1,-1,-1], [ 1,-1, 1],
] as int[][];

# What items can be used to milking and their maximum amounts
static tanksForMilk as IData[IItemStack] = {
  <rustic:liquid_barrel>              : {FluidName: "milk", Amount: 16000},
  <randomthings:reinforcedenderbucket>: {Fluid: {FluidName: "milk", Amount: 10000}},
  <randomthings:enderbucket>          : {Fluid: {FluidName: "milk", Amount: 1000}},
  <forge:bucketfilled>                : {FluidName: "milk", Amount: 1000},
  <forestry:pipette>                  : {Fluid: {FluidName: "milk", Amount: 1000}},
  <mekanism:gaugedropper>             : {Fluid: {FluidName: "milk", Amount: 1000}},
} as IData[IItemStack];



# Add milking
function milk(input as IItemStack) {

  mods.alfinivia.Milking.add(input as IIngredient, 
  
    # Check what animal can be milked
    (function(e){
      val name = e.definition.name;
      print("Checking entity is anable to be milked: " ~ name);
      if (! e instanceof IEntityLiving) { print(" Animal not a living being.."); return false; }
      for animal in animals {
        print("   / " ~ animal ~ " /");
        if (name.matches(animal)) {
          print("       Match! /");
          return true;
        }
      }
      
      return false;
    })/*  as mods.alfinivia.IEntityFunction */, 
    
    # Generate liquid reserviour based on entity and bucket
    function(entity, itemstack, player){
      print("Animal trying to be milked: " ~ entity.definition.name);

      #TODO: Explicitly check animal sex (for dragons)

      # Check player position (should be under entity)
      print("  Ys of player and entity: [" ~ player.y ~"] ["~ entity.y ~ "]");
      if (player.y > entity.y) return itemstack;

      # Find appropriate animal to determine it produce
      var milkAmount as float = 0;
      for animal, amount in animals {
        if (entity.definition.name.matches(animal)) {
          milkAmount = amount;
          break;
        }
      }

      print("  Calculated amount: " ~ milkAmount);

      # Apply animal size modifier
      print("  renderSizeModifier: " ~ entity.renderSizeModifier);
      milkAmount *= 1.0f / entity.renderSizeModifier;

      # If animal NOT love x0.1 output
      print("  entity.isInLove: " ~ entity.isInLove);
      if (!entity.isInLove) milkAmount *= 0.1;

      # Determine maximum tank size
      var tag = tanksForMilk[itemstack];
      var maxTankSize = !isNull(tag.Amount) ? tag.Amount.asInt() : tag.Fluid.Amount.asInt();

      #Spawn liquid on ground if overwhelming amount
      var spilled = max(0, milkAmount - maxTankSize) as int;
      print("  spilled: " ~ spilled);
      if (spilled > 0 && !entity.world.remote) {
        
        val maxSpilled = pow(spilled as double / 1000.0d, 0.5d) as int;
        print("  maxSpilled: " ~ maxSpilled);
        var totalSpilled = 0;
        var i = 0;
        print("  trying to iterate blocks:");
        while totalSpilled < maxSpilled && i < spillOffsets.length {
          print("    i: "~i~" totalSpilled: "~totalSpilled);
          
          var tx = (entity.x + spillOffsets[i][0]) as int;
          var ty = (entity.y + spillOffsets[i][1]) as int;
          var tz = (entity.z + spillOffsets[i][2]) as int;
          var blockPos = IBlockPos(tx, ty, tz);

          if (entity.world.getBlock(blockPos).definition.defaultState == <block:minecraft:air>) {
            print("     Air found! replacing..");
            player.world.setBlockState(<block:minecraft:water>, blockPos);
            totalSpilled +=1;
          }

          i += 1;
        }
      }

      # Play sound if milking is succes
      entity.playLivingSound();

      # Update fluid amount on tag
      var updatedTag as IData = tag;
      var clippedAmount = min(maxTankSize, max(1, milkAmount)) as int;
      print("  clippedAmount: " ~ clippedAmount);
      if (!isNull(tag.Amount)) {
        updatedTag += {Amount: clippedAmount};
      } else {
        updatedTag += {Fluid: {Amount: clippedAmount}};
      }

      return itemstack.withTag(updatedTag);
    },
    
    false
  );
  
  return null;
}

for tank, tag in tanksForMilk { milk(tank); }
