import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;

#priority 50

# ######################################################################
#
# Helpers
#
# ######################################################################
function isNotException (exceptions as string, lookup as string) as bool  {
  if (isNull(exceptions)) {
    return true;
  } else {
    val lowerExceptions = exceptions.toLowerCase();
    val isContains = lowerExceptions.matches(".*\b" ~ lookup.toLowerCase() ~ "\b.*");

    return (lowerExceptions.matches("^only:.*")) ? isContains : !isContains;
  }
}

function itemFactor(output as IItemStack, mult as double) as IItemStack  {
  if (isNull(output)) { return null; }
  return output * max(1, min(output.maxStackSize, (output.amount as double * mult) as int));
}
function liquidFactor(output as ILiquidStack, mult as double) as ILiquidStack  {
  if (isNull(output)) { return null; }
  return output * ((output.amount as double * mult) as int);
}

# ######################################################################
#
# Functions
#
# ######################################################################
# TODO: Swap all inputs and outputs with IIngredient

function squeeze(input as IIngredient, fluidOutput as ILiquidStack, exceptions as string, itemOutput as IItemStack) {

  if (isNotException(exceptions, "CrushingTub")) {
    # mods.rustic.CrushingTub.addRecipe(output as ILiquidStack, byproduct as IItemStack, input as IItemStack);
    for ii in input.items {
      mods.rustic.CrushingTub.addRecipe(liquidFactor(fluidOutput, 0.5d), itemFactor(itemOutput, 0.5d), ii);
    }
  }

  val outputSingle as IItemStack = isNull(itemOutput) ? null : itemOutput * 1;

  if (isNotException(exceptions, "Squeezer")) {
    for ii in input.items {
      mods.integrateddynamics.Squeezer.addRecipe(
        ii, itemFactor(itemOutput, 0.5d), 1.0f, outputSingle, 0.25f, liquidFactor(fluidOutput, 0.666666d));
    }
  }

  if (isNotException(exceptions, "MechanicalSqueezer")) {
    for ii in input.items {
      mods.integrateddynamics.MechanicalSqueezer.addRecipe(
        ii, itemFactor(itemOutput, 0.5d), 1.0f, outputSingle, 0.5f, liquidFactor(fluidOutput, 0.75d));
    }
  }

  if (isNotException(exceptions, "IndustrialSqueezer")) {
    // mods.immersiveengineering.Squeezer.addRecipe(IItemStack output, ILiquidStack fluid, IIngredient input, int energy);
    mods.immersiveengineering.Squeezer.addRecipe(itemFactor(itemOutput, 1.25d), liquidFactor(fluidOutput, 1.0d), input, 2048);
  }

  if (isNotException(exceptions, "ForestrySqueezer")) {
    for ii in input.items {
      //mods.forestry.Squeezer.addRecipe(ILiquidStack fluidOutput, IItemStack[] ingredients, int timePerItem, @Optional WeightedItemStack itemOutput);
      val wOut as WeightedItemStack = !isNull(itemOutput) ? itemOutput % 20 : null;
      mods.forestry.Squeezer.addRecipe(liquidFactor(fluidOutput, 0.9d), [ii], 20, wOut);
    }
  }

  if (isNotException(exceptions, "TECentrifuge")) {
    for ii in input.items {
      //mods.thermalexpansion.Centrifuge.addRecipe(WeightedItemStack[] outputs, IItemStack input, ILiquidStack fluid, int energy);
      mods.thermalexpansion.Centrifuge.addRecipe([itemOutput], ii, liquidFactor(fluidOutput, 1.0d), 2000);
    }
  }
}

function grow(input as IItemStack, output as IItemStack, exceptions as string, 
      secondaryOutput as IItemStack, secondaryChance as int) {

  # Phytogenic Insolator
  if (isNotException(exceptions, "Insolator")) {
    //mods.thermalexpansion.Insolator.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
    mods.thermalexpansion.Insolator.addRecipe(output * 3, input, <thermalfoundation:fertilizer:0>, 4800, secondaryOutput, secondaryChance);
    mods.thermalexpansion.Insolator.addRecipe(output * 6, input, <thermalfoundation:fertilizer:1>, 7200, secondaryOutput, secondaryChance);
    mods.thermalexpansion.Insolator.addRecipe(output * 9, input, <thermalfoundation:fertilizer:2>, 9600, secondaryOutput, secondaryChance);
  }
}

function saw(input as IItemStack, output as IItemStack, exceptions as string) {

  # If old recipes should be removed first
  val STRICT = true;

  if (isNotException(exceptions, "shapeless")) {
    recipes.addShapeless("Saw " ~ getRecipeName(input, output), output * 2, [input]);
  }

  if (isNotException(exceptions, "blockCutter")) {
    # mods.ic2.BlockCutter.addRecipe(IItemStack output, IIngredient input, @Optional int hardness default 0);
    mods.ic2.BlockCutter.addRecipe(output * 4, input);
  }

  val is_mekSawmill = isNotException(exceptions, "mekSawmill");
  if (!is_mekSawmill && STRICT) {
    mods.mekanism.sawmill.removeRecipe(input);
  }
  if (is_mekSawmill || STRICT) {
    mods.mekanism.sawmill.addRecipe(input, output * 4, <mekanism:sawdust>, 1.0);
  }

  val is_manufactory = isNotException(exceptions, "manufactory");
  if (!is_manufactory && STRICT) {
    mods.nuclearcraft.manufactory.removeRecipeWithInput([input]);
  }
  if (is_manufactory || STRICT) {
    mods.nuclearcraft.manufactory.addRecipe(input, output * 5);
  }

  if (isNotException(exceptions, "TESawmill")) {
    # mods.thermalexpansion.Sawmill.addRecipe(IItemStack output, IItemStack input, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
    mods.thermalexpansion.Sawmill.addRecipe(output * 6, input, 1000, <thermalfoundation:material:800>, 100);
  }

  # Log all recipes to manual add in XML file
  # Set true/false in zs script manually
  if (false || isNotException(exceptions, "advRockCutter")) {
    val inId = input.definition.id;
    val inMeta = input.damage;
    val outId = output.definition.id;
    val outMeta = output.damage;
    print('== AdvRocketry manual recipe ==');
    print('  <Recipe timeRequired="10" power ="40000">');
    print('    <input><itemStack>' ~ inId ~ " 1 " ~ inMeta ~ '</itemStack></input>');
    print('    <output><itemStack>' ~ outId ~ " 10 " ~ outMeta ~ '</itemStack></output></Recipe>');
  }
}

function compress(input as IItemStack, output as IItemStack, exceptions as string) {

  if (isNotException(exceptions, "pressurizer")) {
    mods.nuclearcraft.pressurizer.addRecipe(input, output);
  }

  if (isNotException(exceptions, "compressor")) {
    mods.ic2.Compressor.addRecipe(output, input);
  }
}

function alloy(input as IIngredient[], output as IItemStack, exceptions as string) {

  if (isNotException(exceptions, "alloyFurnace") && input.length == 2) {
    mods.nuclearcraft.alloy_furnace.addRecipe(input[0], input[1], output);
  }

  if (isNotException(exceptions, "induction") && input.length == 2) {
    for input1 in input[0].items{
      for input2 in input[1].items{
        mods.thermalexpansion.InductionSmelter.addRecipe(
          output, input1, input2, 4000, <thermalfoundation:material:864>, 15);
      }
    }
  }

  if (isNotException(exceptions, "alloySmelter") && input.length >= 2 && input.length <= 3) {
    # mods.enderio.AlloySmelter.addRecipe(IItemStack output, IIngredient[] input, @Optional int energyCost, @Optional float xp);
    mods.enderio.AlloySmelter.addRecipe(output, input, 2000);
  }

  if (isNotException(exceptions, "arcFurnance") && input.length >= 2) {
    var additives = [] as IIngredient[];
    for i in 1 to input.length {
      additives = additives + input[i];
    }
    # mods.immersiveengineering.ArcFurnace.addRecipe(
    #  IItemStack output, IIngredient input, IItemStack slag, int time, int energyPerTick, @Optional IIngredient[] additives, @Optional String specialRecipeType);
    mods.immersiveengineering.ArcFurnace.addRecipe(
      output, input[0], <immersiveengineering:material:7>, 80, 512, additives, "Alloying");
  }
}

function crush(input as IItemStack, output as IItemStack, exceptions as string, 
              secondary as IItemStack[], secondaryChance as float[]) {

  if (isNotException(exceptions, "manufactory")) {
    mods.nuclearcraft.manufactory.addRecipe(input, output);
  }

  if (isNotException(exceptions, "Macerator")) {
    mods.ic2.Macerator.addRecipe(output, input);
  }

  val secondary1 = isNull(secondary) ? null : secondary[0];
  val secondaryChance1 = (isNull(secondary) || isNull(secondaryChance)) ? 0.25f : secondaryChance[0];
  
  if (isNotException(exceptions, "eu2Crusher")) {
    if (isNull(secondary1)){
      mods.extrautils2.Crusher.add(output, input);
    } else {
      mods.extrautils2.Crusher.add(output, input, secondary1, secondaryChance1);
    }
  }

  if (isNotException(exceptions, "IECrusher")) {
    if (isNull(secondary1)){
      mods.immersiveengineering.Crusher.addRecipe(output, input, 2048);
    } else {
      mods.immersiveengineering.Crusher.addRecipe(output, input, 2048, secondary1, secondaryChance1);
    }
  }

  if (isNotException(exceptions, "SagMill")) {
    var combinedOutput = [output] as IItemStack[];
    if (!isNull(secondary) && secondary.length > 1) {
      for i in 1 to secondary.length {
        combinedOutput = combinedOutput + secondary[i];
      }
    }
    val sagChances as float[] = (isNull(secondaryChance) ? ([1.0f] as float[]) : secondaryChance);
    mods.enderio.SagMill.addRecipe(combinedOutput, sagChances, input);
  }

  if (isNotException(exceptions, "Grindstone")) {
    mods.astralsorcery.Grindstone.addRecipe(input, output, 0.15f);
  }

  if (isNotException(exceptions, "AEGrinder")) {
    if(!isNull(secondary)){
      if(secondary.length == 1){
        mods.appliedenergistics2.Grinder.addRecipe(output, input, 2,
          secondary[0], secondaryChance[0]);
      }else if (secondary.length >= 2){
        mods.appliedenergistics2.Grinder.addRecipe(output, input, 2,
          secondary[0], secondaryChance[0], secondary[1], secondaryChance[1]);
      }
    } else{
      mods.appliedenergistics2.Grinder.addRecipe(output, input, 2);
    }
  }
}

function crushRock(input as IIngredient, output as IItemStack[], exceptions as string) {

  if (isNotException(exceptions, "rockCrusher")) {
    # mods.nuclearcraft.rock_crusher.addRecipe([itemInput, itemOutput1, itemOutput2, itemOutput3, @Optional double timeMultiplier, @Optional double powerMultiplier, @Optional double processRadiation]);
    # mods.nuclearcraft.ChanceItemIngredient.create(IIngredient ingredient, int chancePercent, {int minStackSize});
    mods.nuclearcraft.rock_crusher.addRecipe([input, 
      output[0], 80,
      output[1], 30,
      output[2], 10,
      4.0d, 2.0d]);
    #mods.nuclearcraft.rock_crusher.addRecipe(input, output[0], output[1], output[2]);
  }
}

function solution(inputItems as IItemStack[], inputLiquids as ILiquidStack[],
                  outputItems as IItemStack[], outputLiquids as ILiquidStack[], exceptions as string) {
  
  if (isNotException(exceptions, "vat") && !isNull(inputItems) && inputItems.length >= 2) {
    mods.enderio.Vat.addRecipe(outputLiquids[0], liquidFactor(inputLiquids[0], 4.0d), [inputItems[0]], [1.0f], [inputItems[1]], [1.0f], 5000);
  }

  if (isNotException(exceptions, "canner")
      && !isNull(inputItems) && inputItems.length == 1
      && !isNull(inputLiquids) && inputLiquids.length == 1
      && (isNull(outputItems) || outputItems.length == 0)
      && !isNull(outputLiquids) && outputLiquids.length == 1
  ) {
    # mods.ic2.Canner.addEnrichRecipe(ILiquidStack output, ILiquidStack input, IIngredient additive);
    mods.ic2.Canner.addEnrichRecipe(outputLiquids[0], inputLiquids[0], inputItems[0]);
  }
}

function evaporate(inputLiquid as ILiquidStack, output as IItemStack, exceptions as string) {
  
  if (isNotException(exceptions, "EvaporatingBasin")) {
    mods.rustic.EvaporatingBasin.addRecipe(itemFactor(output, 0.5d), inputLiquid);
  }

  if (isNotException(exceptions, "DryingBasin")) {
    mods.integrateddynamics.DryingBasin.addRecipe(
      null, inputLiquid, itemFactor(output, 0.5d), null, 80);
  }

  if (isNotException(exceptions, "MechanicalDryingBasin")) {
    //MechanicalDryingBasin.addRecipe(@Optional IItemStack inputStack, @Optional ILiquidStack inputFluid, @Optional IItemStack outputStack, @Optional ILiquidStack outputFluid, @Optional(10) int duration);
    mods.integrateddynamics.MechanicalDryingBasin.addRecipe(
      null, inputLiquid, output, null, 80);
  }

}

function recycleMetal(input as IItemStack, output as IItemStack, liquid as ILiquidStack, exceptions as string) {

  if (isNotException(exceptions, "arcFurnance") && !isNull(output)) {
    mods.immersiveengineering.ArcFurnace.addRecipe(output, input, <immersiveengineering:material:7>, 800, 512);
  }

  if (isNotException(exceptions, "induction") && !isNull(output)) {
    # mods.thermalexpansion.InductionSmelter.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
    mods.thermalexpansion.InductionSmelter.addRecipe(
      itemFactor(output, 0.5d), input, <minecraft:sand>, 4000, <thermalfoundation:material:864>, 10);
    mods.thermalexpansion.InductionSmelter.addRecipe(
      itemFactor(output, 0.75d), input, <thermalfoundation:material:865>, 6000, <thermalfoundation:material:864>, 10);
    mods.thermalexpansion.InductionSmelter.addRecipe(
      output, input, <thermalfoundation:material:866>, 8000, <thermalfoundation:material:865>, 10);
  }

  if (isNotException(exceptions, "smeltery") && !isNull(liquid)) {
    # mods.tconstruct.Melting.addRecipe(ILiquidStack output, IIngredient input, @Optional int temp);
    mods.tconstruct.Melting.addRecipe(liquidFactor(liquid, 0.5d), input);
  }
}

function melt(input as IIngredient, output as ILiquidStack, exceptions as string) {

  if (isNotException(exceptions, "smeltery")) {
    mods.tconstruct.Melting.addRecipe(output, input);
  }

  if (isNotException(exceptions, "melter")) {
    mods.nuclearcraft.melter.addRecipe(input, output);
  }
}

# item   ⤵
#        item
# liquid ⤴
function fill(itemInput as IIngredient, fluidInput as ILiquidStack, output as IItemStack, exceptions as string) {

  if (isNotException(exceptions, "DryingBasin")) { for ii in itemInput.items {
    val newAmount = min(1000, (fluidInput.amount as double * 1.5d) as int);
    mods.integrateddynamics.DryingBasin.addRecipe(ii, fluidInput * newAmount, output, null, 40);
  }}

  if (isNotException(exceptions, "MechanicalDryingBasin")) { for ii in itemInput.items {
    //MechanicalDryingBasin.addRecipe(@Optional IItemStack inputStack, @Optional ILiquidStack inputFluid, @Optional IItemStack outputStack, @Optional ILiquidStack outputFluid, @Optional(10) int duration);
    mods.integrateddynamics.MechanicalDryingBasin.addRecipe(ii, fluidInput, output, null, 20);
  }}
  
  if (isNotException(exceptions, "Casting")) { for ii in itemInput.items {
    mods.tconstruct.Casting.addTableRecipe(output, itemInput, fluidInput, fluidInput.amount, true);
  }}

  if (isNotException(exceptions, "NCInfuser")) { for ii in itemInput.items {
    mods.nuclearcraft.infuser.addRecipe(itemInput, fluidInput, output);
  }}

}