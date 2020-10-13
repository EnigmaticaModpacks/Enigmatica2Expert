import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;

import scripts.processUtils.I;
import scripts.processUtils.isNotException;
import scripts.processUtils.isStrict;
import scripts.processUtils.arrN_item;
import scripts.processUtils.arrN_ingr;
import scripts.processUtils.arrN_liq;
import scripts.processUtils.arrN_float;
import scripts.processUtils.defaultItem0;
import scripts.processUtils.defaultChance0;
import scripts.processUtils.defaultChance0_int;
import scripts.processUtils.warning;
import scripts.processUtils.info;
import scripts.processUtils.avdRockXmlRecipe;

#priority 51

# ######################################################################
#
# All machines works in one function
#
# ######################################################################

# Picks one machine to inject recipe in it
# Function receive all possible combinations of input and outputs of one machine
# Any argument can be null except machine name
# Returns name of machine if recipe was added. If not, returns empty string
function workEx(machineNameAnyCase as string, exceptions as string, 
  inputItems as IIngredient[], inputLiquids as ILiquidStack[],
  outputItems as IItemStack[], outputLiquids as ILiquidStack[],
  extra as IItemStack[], extraChance as float[], options as IData) as string {

  # Prepare machine name
  val machineName = machineNameAnyCase.toLowerCase();
  
  # Machine is exception -> exit function
  if (!isNotException(exceptions, machineName)) { return ""; }

  # Strict indicates that old recipe should be removed first
  val strict as bool = isStrict(exceptions, machineName);

  #------------
  # Inputs
  #------------
  val inputIngr0           = arrN_ingr(inputItems, 0);
  val haveItemInput        = !isNull(inputIngr0);
  val inputIsSingle        = haveItemInput && inputItems.length == 1;

  val inputLiquid0         = arrN_liq(inputLiquids, 0);
  val haveLiquidInput      = !isNull(inputLiquid0);
  val inputLiquidIsSingle  = haveLiquidInput && inputLiquids.length == 1;

  #------------
  # Outputs
  #------------
  val outputItem0          = arrN_item(outputItems, 0);
  val haveItemOutput       = !isNull(outputItem0);
  val outputIsSingle       = haveItemOutput && outputItems.length == 1;

  val outputLiquid0        = arrN_liq(outputLiquids, 0);
  val haveLiquidOutput     = !isNull(outputLiquid0);
  val outputLiquidIsSingle = haveLiquidOutput && outputLiquids.length == 1;

  #------------
  # Extra
  #------------
  val extra0               = arrN_item(extra, 0);
  val haveExtra            = !isNull(extra0);
  val outputItem0orExtra0  = haveItemOutput ? outputItem0 : extra0;

  #------------
  # Relations
  #------------
  val item_to_item = haveItemInput && haveItemOutput;

  #------------
  # List Length
  #------------
  val lenInItem  = haveItemInput    ? inputItems.length    : 0;
  val lenInLiqs  = haveLiquidInput  ? inputLiquids.length  : 0;
  val lenOutItem = haveItemOutput   ? outputItems.length   : 0;
  val lenOutLiqs = haveLiquidOutput ? outputLiquids.length : 0;


  # Machines with one item slot for input and output
  # 📦 → 📦
  if (item_to_item && inputIsSingle && outputIsSingle) {
    
    if (machineName == "blockcutter") {
      # mods.ic2.BlockCutter.addRecipe(IItemStack output, IIngredient input, @Optional int hardness default 0);
      mods.ic2.BlockCutter.addRecipe(outputItem0, inputIngr0);
      return machineName;
    }

    if (machineName == "compressor") {
      mods.ic2.Compressor.addRecipe(outputItem0, inputIngr0);
      return machineName;
    }

    if (machineName == "macerator") {
      mods.ic2.Macerator.addRecipe(outputItem0, inputIngr0);
      return machineName;
    }
    
    if (machineName == "extractor") {
      mods.ic2.Extractor.addRecipe(outputItem0, inputIngr0);
      return machineName;
    }

    if (machineName == "grindstone") {
      # mods.astralsorcery.Grindstone.addRecipe(IItemStack input, IItemStack output, float doubleChance);
      for ii in inputIngr0.itemArray {
        mods.astralsorcery.Grindstone.addRecipe(ii, outputItem0, defaultChance0(extraChance, 0.0f));
      }
      return machineName;
    }

    if (machineName == "compactor") {
      for ii in inputIngr0.itemArray {
        mods.thermalexpansion.Compactor.addPressRecipe(outputItem0, ii, 4000);
      }
      return machineName;
    }

    if (machineName == "pulverizer") {
      # mods.thermalexpansion.Pulverizer.addRecipe(IItemStack output, IItemStack input, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
      for ii in inputIngr0.itemArray {
        if (strict) { mods.thermalexpansion.Pulverizer.removeRecipe(ii); }
        if (haveExtra) {
          mods.thermalexpansion.Pulverizer.addRecipe(outputItem0, ii, 4000, extra[0], defaultChance0_int(extraChance, 100));
        } else {
          mods.thermalexpansion.Pulverizer.addRecipe(outputItem0, ii, 4000);
        }
      }
      return machineName;
    }

    if (machineName == "manufactory") {
      if (strict) { mods.nuclearcraft.manufactory.removeRecipeWithInput([inputIngr0]); }
      mods.nuclearcraft.manufactory.addRecipe(inputIngr0, outputItem0);
      return machineName;
    }

    if (machineName == "pressurizer") {
      mods.nuclearcraft.pressurizer.addRecipe(inputIngr0, outputItem0);
      return machineName;
    }

    if (machineName == "meksawmill") {
      if (strict) { mods.mekanism.sawmill.removeRecipe(inputIngr0); }
      # mods.mekanism.sawmill.addRecipe(IIngredient inputStack, IItemStack outputStack, @Optional IItemStack bonusOutput, @Optional double bonusChance);
      if (haveExtra) {
        mods.mekanism.sawmill.addRecipe(inputIngr0, outputItem0, extra[0], defaultChance0(extraChance, 1.0f) as double);
      } else {
        mods.mekanism.sawmill.addRecipe(inputIngr0, outputItem0);
      }
      return machineName;
    }

    if (machineName == "mekcrusher") {
      # mods.mekanism.crusher.addRecipe(IIngredient inputStack, IItemStack outputStack);
      # mods.mekanism.crusher.removeRecipe(IIngredient outputStack, @Optional IIngredient inputStack);
      if (strict) { mods.mekanism.crusher.removeRecipe(outputItem0); }
      mods.mekanism.crusher.addRecipe(inputIngr0, outputItem0);
      return machineName;
    }

    if (machineName == "tesawmill") {
      # mods.thermalexpansion.Sawmill.addRecipe(IItemStack output, IItemStack input, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
      for ii in inputIngr0.itemArray {
      if (haveExtra) {
        mods.thermalexpansion.Sawmill.addRecipe(outputItem0, ii, 1000, extra[0], defaultChance0_int(extraChance, 100));
      } else {
        mods.thermalexpansion.Sawmill.addRecipe(outputItem0, ii, 1000);
      }
      }
      return machineName;
    }

    if (machineName == "eu2crusher") {
      # mods.extrautils2.Crusher.add(IItemStack output, IItemStack input, @Optional IItemStack secondaryOutput, @Optional float secondaryChance);

      for ii in inputIngr0.itemArray {
        if (haveExtra) {
          mods.extrautils2.Crusher.add(outputItem0, ii, extra[0], extraChance[0]);
        } else {
          mods.extrautils2.Crusher.add(outputItem0, ii);
        }
      }
      return machineName;
    }
    
    if (machineName == "aacrusher") {
      if (strict) { mods.actuallyadditions.Crusher.removeRecipe(outputItem0); }
      # mods.actuallyadditions.Crusher.addRecipe(IItemStack output, IItemStack input, @Optional IItemStack outputSecondary, @Optional int outputSecondaryChance);
          
      for ii in inputIngr0.itemArray {
        if (haveExtra) {
          mods.actuallyadditions.Crusher.addRecipe(outputItem0, ii, extra[0], defaultChance0_int(extraChance, 100));
        } else {
          mods.actuallyadditions.Crusher.addRecipe(outputItem0, ii);
        }
      }
      return machineName;
    }

    if (machineName == "aegrinder") {
      # Grinder.addRecipe(IItemStack output, IItemStack input, int turns, @Optional IItemStack secondary1Output, @Optional float secondary1Chance, @Optional IItemStack secondary2Output, @Optional float secondary2Chance);

      for ii in inputIngr0.itemArray {
        if (haveExtra) {
          if (extra.length == 1) {
            mods.appliedenergistics2.Grinder.addRecipe(outputItem0, ii, 2, extra[0], extraChance[0]);
          }else if (extra.length >= 2) {
            mods.appliedenergistics2.Grinder.addRecipe(outputItem0, ii, 2, extra[0], extraChance[0], extra[1], extraChance[1]);
          }
        } else {
          mods.appliedenergistics2.Grinder.addRecipe(outputItem0, ii, 2);
        }
      }
      return machineName;
    }
  } 

  # Machines with ONE item INPUT
  # 📦 → [📦+]
  if (item_to_item && inputIsSingle) {
  
    if (machineName == "rockcrusher") {
      # mods.nuclearcraft.rock_crusher.addRecipe([itemInput, itemOutput1, itemOutput2, itemOutput3, @Optional double timeMultiplier, @Optional double powerMultiplier, @Optional double processRadiation]);
      mods.nuclearcraft.rock_crusher.addRecipe([inputIngr0, 
        arrN_item(outputItems, 0), defaultChance0_int(extraChance, 80),
        arrN_item(outputItems, 1), defaultChance0_int(extraChance, 30),
        arrN_item(outputItems, 2), defaultChance0_int(extraChance, 10),
        2.0d, 1.5d]);
      return machineName;
    }
  
    if (machineName == "thermalcentrifuge") {
      # mods.ic2.ThermalCentrifuge.addRecipe([IItemStack[] outputs, IIngredient input, @Optional int minHeat);
      mods.ic2.ThermalCentrifuge.addRecipe(outputItems, inputIngr0);
      return machineName;
    }
  }
  
  # Machines with ONE item INPUT and unknown output
  # 📦 → ?
  if (inputIsSingle) {
    
    if (machineName == "squeezer") {
      # Squeezer.addRecipe(IItemStack inputStack, 
      #   @Optional IItemStack outputStack1, @Optional float outputStackChance1,
      #   @Optional IItemStack outputStack2, @Optional float outputStackChance2,
      #   @Optional IItemStack outputStack3, @Optional float outputStackChance3,
      #   @Optional ILiquidStack outputFluid);
      for ii in inputIngr0.itemArray {
        mods.integrateddynamics.Squeezer.addRecipe(ii, 
          arrN_item(outputItems, 0), arrN_float(extraChance, 0), 
          arrN_item(outputItems, 1), arrN_float(extraChance, 1), 
          arrN_item(outputItems, 2), arrN_float(extraChance, 2), 
          outputLiquid0);
      }
      return machineName;
    }

    if (machineName == "mechanicalsqueezer") {
      # MechanicalSqueezer.addRecipe(IItemStack inputStack, 
      #   @Optional IItemStack outputStack1, @Optional float outputStackChance1,
      #   @Optional IItemStack outputStack2, @Optional float outputStackChance2,
      #   @Optional IItemStack outputStack3, @Optional float outputStackChance3,
      #   @Optional ILiquidStack outputFluid, @Optional(10) int duration);
      for ii in inputIngr0.itemArray {
        mods.integrateddynamics.MechanicalSqueezer.addRecipe(ii, 
          arrN_item(outputItems, 0), arrN_float(extraChance, 0), 
          arrN_item(outputItems, 1), arrN_float(extraChance, 1), 
          arrN_item(outputItems, 2), arrN_float(extraChance, 2), 
          outputLiquid0);
      }
      return machineName;
    }

    if (machineName == "tecentrifuge") {
      #mods.thermalexpansion.Centrifuge.addRecipe(WeightedItemStack[] outputs, IItemStack input, ILiquidStack fluid, int energy);
      var combinedOutput = [] as WeightedItemStack[];
      if (haveItemOutput) {
        for i in 0 to outputItems.length {
          combinedOutput = combinedOutput + outputItems[i] % 100;
        }
      }
      if (haveExtra) {
        for i in 0 to extra.length {
          combinedOutput = combinedOutput + extra[i] % ((extraChance[i] * 100) as int);
        }
      }
      if (combinedOutput.length > 0) {
        for ii in inputIngr0.itemArray {
          mods.thermalexpansion.Centrifuge.addRecipe(combinedOutput, ii, outputLiquid0, 2000);
        }
      } else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), "received work, but this machine MUST have item output");
      }
      return machineName;
    }

    if (machineName == "sagmill") {
      var combinedOutput = [] as IItemStack[];
      var combinedChances = [] as float[];
      if (haveItemOutput) {
        for i in 0 to outputItems.length {
          combinedOutput = combinedOutput + outputItems[i];
          combinedChances = combinedChances + 1.0f;
        }
      }
      if (haveExtra) {
        for i in 0 to extra.length {
          combinedOutput = combinedOutput + extra[i];
          combinedChances = combinedChances + (extraChance.length > i ? extraChance[i] : 1.0f);
        }
      }
      if (combinedOutput.length > 0 && combinedChances.length >= combinedOutput.length) {
        mods.enderio.SagMill.addRecipe(combinedOutput, combinedChances, inputIngr0);
      } else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), "received work, but no output or extra was found");
      }
      return machineName;
    }

    if (machineName == "iecrusher") {
      # mods.immersiveengineering.Crusher.addRecipe(IItemStack output, IIngredient input, int energy, @Optional IItemStack secondaryOutput, @Optional double secondaryChance);
      if (haveExtra) {
        mods.immersiveengineering.Crusher.addRecipe(outputItem0, inputIngr0, 2048, extra[0], extraChance[0]);
      } else {
        mods.immersiveengineering.Crusher.addRecipe(outputItem0, inputIngr0, 2048);
      }
      return machineName;
    }

  }

  # Machines with ONE item output
  # [📦+] → 📦
  if (item_to_item && outputIsSingle) {

    if (machineName == "shapeless") {
      if (inputItems.length <= 9) {
        if (strict) {
          if (inputItems.length <= 3) { recipes.removeShaped(<*>, [inputItems]); }
          recipes.removeShapeless(<*>, inputItems);
        }
        recipes.addShapeless("shapeless " ~ getRecipeName(inputIngr0.itemArray[0], outputItem0), outputItem0, inputItems);
      } else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), "received work, but input more than 9");
      }
      return machineName;
    }

    if (machineName == "arcfurnance") {
      # mods.immersiveengineering.ArcFurnace.addRecipe(IItemStack output, IIngredient input, IItemStack slag, int time, int energyPerTick, @Optional IIngredient[] additives, @Optional String specialRecipeType);
      if (inputItems.length > 1) {
        # Reduce all ingredients to additives
        var additives = [] as IIngredient[];
        for i in 1 to inputItems.length {
          additives = additives + inputItems[i];
        }
        mods.immersiveengineering.ArcFurnace.addRecipe(outputItem0, inputIngr0, defaultItem0(extra, I("immersiveengineering:material",7)), 200, 512, additives, "Alloying");
      } else {
        mods.immersiveengineering.ArcFurnace.addRecipe(outputItem0, inputIngr0, defaultItem0(extra, I("immersiveengineering:material",7)), 200, 512);
      }
      return machineName;
    }

    if (machineName == "alloysmelter") {
      # mods.enderio.AlloySmelter.addRecipe(IItemStack output, IIngredient[] input, @Optional int energyCost, @Optional float xp);
      if (strict) { mods.enderio.AlloySmelter.removeRecipe(outputItem0); }
      mods.enderio.AlloySmelter.addRecipe(outputItem0, inputItems, 2000);
      return machineName;
    }

    if (machineName == "alloyfurnace") {
      if (inputItems.length == 2) {
        mods.nuclearcraft.alloy_furnace.addRecipe(inputItems[0], inputItems[1], outputItem0);
      } else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), "received work, but number of inputs != 2");
      }
      return machineName;
    }

    if (machineName == "induction") {
      # mods.thermalexpansion.InductionSmelter.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);

      val additions as IItemStack[] = [
        <minecraft:sand>, I("thermalfoundation:material",864), I("thermalfoundation:material",865), I("thermalfoundation:material",866)
      ] as IItemStack[];

      if (inputItems.length == 1) {
        # Only one input - add automatically scalled output based on catalyst
        for ii in inputIngr0.itemArray {
          mods.thermalexpansion.InductionSmelter.addRecipe(outputItem0, ii, additions[0], 4000, haveExtra ? extra[0] : additions[1], defaultChance0_int(extraChance, 10));
          mods.thermalexpansion.InductionSmelter.addRecipe(outputItem0, ii, additions[2], 6000, haveExtra ? extra[0] : additions[1], defaultChance0_int(extraChance, 10));
          mods.thermalexpansion.InductionSmelter.addRecipe(outputItem0, ii, additions[3], 8000, haveExtra ? extra[0] : additions[2], defaultChance0_int(extraChance, 10));
        }
      } else if (inputItems.length == 2) {
        for ii in inputItems[0].itemArray {
          for jj in inputItems[1].itemArray {
            mods.thermalexpansion.InductionSmelter.addRecipe(outputItem0, ii, jj, 4000, haveExtra ? extra[0] : additions[1], defaultChance0_int(extraChance, 15));
          }
        }
      } else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), "received work, but number of inputs 3 or more");
      }
      return machineName;
    }

    if (machineName == "insolator") {
      #mods.thermalexpansion.Insolator.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);

      val energy = (!isNull(options) && !isNull(options.energy)) ? options.energy as int : 4800;

      if (inputItems.length == 2) {
        for ii in inputItems[0].itemArray {
          for jj in inputItems[1].itemArray {
            mods.thermalexpansion.Insolator.addRecipe(outputItem0, ii, jj, energy, extra0, defaultChance0_int(extraChance, 100));
          }
        }
      } else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), "received work, but number of inputs != 2");
      }
      return machineName;
    }
  }

  # Machines with any item s input and output
  # [📦+] → [📦+]
  if (item_to_item) {

    if (machineName == "advrockarc") {
      # Log recipes to manual add in XML file
      avdRockXmlRecipe("Electric Furnace", inputItems, null, outputItems, null);
      return machineName;
    }

    if (machineName == "advrockcutter") {
      # Log recipes to manual add in XML file
      avdRockXmlRecipe("Block Cutter", inputItems, null, outputItems, null);
      return machineName;
    }
  }

  # ONE item to one liquid
  # 📦 → 💧
  if (inputIsSingle && outputLiquidIsSingle) {

    if (machineName == "crushingtub") {
      # mods.rustic.CrushingTub.addRecipe(output as ILiquidStack, byproduct as IItemStack, input as IItemStack);
      for ii in inputIngr0.itemArray {
        mods.rustic.CrushingTub.addRecipe(outputLiquid0, outputItem0orExtra0, ii);
      }
      return machineName;
    }

    if (machineName == "industrialsqueezer") {
      # mods.immersiveengineering.Squeezer.addRecipe(IItemStack output, ILiquidStack fluid, IIngredient input, int energy);
      mods.immersiveengineering.Squeezer.addRecipe(outputItem0, outputLiquid0, inputIngr0, 2048);
      return machineName;
    }

    if (machineName == "forestrysqueezer") {
      #mods.forestry.Squeezer.addRecipe(ILiquidStack fluidOutput, IItemStack[] ingredients, int timePerItem, @Optional WeightedItemStack itemOutput);
      for ii in inputIngr0.itemArray {
        val wOut as WeightedItemStack = !isNull(outputItem0) ? outputItem0 % defaultChance0_int(extraChance, 20) : null;
        mods.forestry.Squeezer.addRecipe(outputLiquid0, [ii], 20, wOut);
      }
      return machineName;
    }

    if (machineName == "smeltery") {
      # mods.tconstruct.Melting.addRecipe(ILiquidStack output, IIngredient input, @Optional int temp);
      mods.tconstruct.Melting.addRecipe(outputLiquid0, inputIngr0);
      return machineName;
    }

    if (machineName == "melter") {
      mods.nuclearcraft.melter.addRecipe(inputIngr0, outputLiquid0);
      return machineName;
    }

    if (machineName == "fluidextractor") {
      # mods.nuclearcraft.extractor.addRecipe([itemInput, itemOutput, fluidOutput, @Optional double timeMultiplier, @Optional double powerMultiplier, @Optional double processRadiation]);
      mods.nuclearcraft.extractor.addRecipe(inputIngr0, outputItem0, outputLiquid0);
      return machineName;
    }
  }

  # ONE item to one liquid
  # 💧 → 📦
  if (inputLiquidIsSingle && outputIsSingle) {

    if (machineName == "evaporatingbasin") {
      mods.rustic.EvaporatingBasin.addRecipe(outputItem0, inputLiquid0);
      return machineName;
    }

  }

  # ONE item + ONE liquid -> item
  # 📦💧 → 📦
  if (inputIsSingle && inputLiquidIsSingle && outputIsSingle) {

    if (machineName == "casting") { 
      mods.tconstruct.Casting.addTableRecipe(outputItem0, inputIngr0, inputLiquid0, inputLiquid0.amount, true);
      return machineName;
    }

    if (machineName == "ncinfuser") { 
      mods.nuclearcraft.infuser.addRecipe(inputIngr0, inputLiquid0, outputItem0);
      return machineName;
    }

  }

  # ONE item + ONE liquid -> ONE liquid
  # 📦💧 → 💧
  if (inputIsSingle && inputLiquidIsSingle && outputLiquidIsSingle) {

    if (machineName == "canner") {
      # mods.ic2.Canner.addEnrichRecipe(ILiquidStack output, ILiquidStack input, IIngredient additive);
      mods.ic2.Canner.addEnrichRecipe(outputLiquid0, inputLiquid0, inputIngr0);
      return machineName;
    }
    
    if (machineName == "fluidenricher") {
      # mods.nuclearcraft.dissolver.addRecipe([itemInput, fluidInput, fluidOutput, @Optional double timeMultiplier, @Optional double powerMultiplier, @Optional double processRadiation]);
      mods.nuclearcraft.dissolver.addRecipe(inputIngr0, inputLiquid0, outputLiquid0);
      return machineName;
    }

  }

  # ONE liquid -> 1+ liquid
  # 💧 → [💧+]
  if (inputLiquidIsSingle && haveLiquidOutput) {
    
    if (machineName == "ic2electrolyzer") {
      # mods.ic2.Electrolyzer.addRecipe(ILiquidStack[] outputs, ILiquidStack input, int power, @Optional int time);
      # mods.ic2.Electrolyzer.addRecipe(outputLiquids, inputLiquid0, 40);
      return warning(machineNameAnyCase, inputLiquid0.name,
      "process.work: IC2 Tweaker have bug for adding Electrolyzer recipe. Would be fixed if PR would merged");
      return machineName;
    }
    
    if (machineName == "ncelectrolyzer") {
      # mods.nuclearcraft.electrolyser.addRecipe([fluidInput, fluidOutput1, fluidOutput2, fluidOutput3, fluidOutput4, @Optional double timeMultiplier, @Optional double powerMultiplier, @Optional double processRadiation]);
      mods.nuclearcraft.electrolyser.addRecipe(inputLiquid0, arrN_liq(outputLiquids, 0), arrN_liq(outputLiquids, 1), arrN_liq(outputLiquids, 2), arrN_liq(outputLiquids, 3), 40);
      return machineName;
    }
  }

  # 1+ liquid -> 1+ liquid
  # [💧+] → [💧+]
  if (haveLiquidInput && haveLiquidOutput) {

    if (machineName == "advrockelectrolyzer") {
      # Log recipes to manual add in XML file
      avdRockXmlRecipe("Electrolyzer", null, inputLiquids, null, outputLiquids);
      return machineName;
    }
  }

  # ONE liquid + 1+ item -> ONE liquid
  # 💧[📦+] -> 💧
  if (inputLiquidIsSingle && outputLiquidIsSingle && haveItemInput) {

    if (machineName == "vat") {
      if (inputItems.length <= 2) {
      var s = 'process.work EiO Vat recipe. Add in XML file manually\n';
      s = s ~ "<recipe name=\"" ~ outputLiquid0.displayName ~ "\" required=\"true\"><fermenting energy=\"10000\">\n";
      for inIngr in inputItems {
        s = s ~ "  <inputgroup>\n";
        for ii in inIngr.itemArray {
          s = s ~ "    <input name=\"" ~ ii.commandString.replaceAll("[<>]", "") ~ "\" multiplier=\"1.0\" />\n";
        }
        s = s ~ "  </inputgroup>\n";
      }
      s = s ~ "    <inputfluid name=\"" ~ inputLiquid0.name ~ "\" multiplier=\"" ~ (outputLiquid0.amount as float) / 1000 ~ "\" />\n";
      s = s ~ "    <outputfluid name=\"" ~ outputLiquid0.name ~ "\" /></fermenting></recipe>";
      print(s);
      # mods.enderio.Vat.addRecipe(ILiquidStack output, ILiquidStack input, IIngredient[] slot1Solids, float[] slot1Mults, IIngredient[] slot2Solids, float[] slot2Mults, @Optional int energyCost);
      # mods.enderio.Vat.addRecipe(outputLiquid0, inputLiquid0, [arrN_item(inputItems, 0)], [1.0f], [arrN_item(inputItems, 1)], [1.0f], 5000);
      return machineName;
      } else {
        return info(machineNameAnyCase, inputLiquid0.name, "received work, but amount of inputs > 2");
      }
    }
  }

  # Complicated input & output
  # 📦|💧 → [📦+]|💧
  if ((inputIsSingle || inputLiquidIsSingle) && (haveItemOutput || outputLiquidIsSingle)) {

    if (machineName == "dryingbasin") {
      # DryingBasin.addRecipe(@Optional IItemStack inputStack, @Optional ILiquidStack inputFluid, @Optional IItemStack outputStack, @Optional ILiquidStack outputFluid, @Optional(10) int duration);
      if (inputIsSingle) {
        for ii in inputItems[0].itemArray {
          mods.integrateddynamics.DryingBasin.addRecipe(ii, inputLiquid0, outputItem0, outputLiquid0, 80);
        }
      } else {
        mods.integrateddynamics.DryingBasin.addRecipe(null, inputLiquid0, outputItem0, outputLiquid0, 80);
      }
      return machineName;
    }

    if (machineName == "mechanicaldryingbasin") {
      # MechanicalDryingBasin.addRecipe(@Optional IItemStack inputStack, @Optional ILiquidStack inputFluid, @Optional IItemStack outputStack, @Optional ILiquidStack outputFluid, @Optional(10) int duration);
      if (inputIsSingle) {
        for ii in inputItems[0].itemArray {
          mods.integrateddynamics.MechanicalDryingBasin.addRecipe(ii, inputLiquid0, outputItem0, outputLiquid0, 80);
        }
      } else {
        mods.integrateddynamics.MechanicalDryingBasin.addRecipe(null, inputLiquid0, outputItem0, outputLiquid0, 80);
      }
      return machineName;
    }
  }

  # Complicated input
  # [📦+]|[💧+] → [📦+]|💧
  if ((haveItemInput || haveLiquidInput) && (haveItemOutput || outputLiquidIsSingle)) {

    if (machineName == "chemicalreactor") {
      if (lenInItem <= 4 && lenInLiqs <= 2 && lenOutItem <= 4 & lenOutLiqs <= 1) {
        avdRockXmlRecipe("Chemical Reactor", inputItems, inputLiquids, outputItems, outputLiquids);
        return machineName;
      } else {
        return info(machineNameAnyCase, inputLiquid0.name, "received work, but input and output amounts can't fit in machine");
      }
    }
  }

  return warning(machineNameAnyCase,
    !isNull(inputIngr0)   ? getItemName(inputIngr0.itemArray[0]) : (
    !isNull(inputLiquid0) ? ("💧" ~ inputLiquid0.name) : "[unknown input]"),
    "received work, but machine with this name can't be found");
}

function work(machineNameAnyCase as string[], exceptions as string, 
    inputItems as IIngredient[], inputLiquids as ILiquidStack[],
    outputItems as IItemStack[], outputLiquids as ILiquidStack[],
    extra as IItemStack[], extraChance as float[]) as string {

  for machine in machineNameAnyCase {
    workEx(machine, exceptions, inputItems, inputLiquids, outputItems, outputLiquids, extra, extraChance, null);
  }
}