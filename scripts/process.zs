# ######################################################################
#
# process.zs
#
# Collects all machines's functions in one place
# using:
#   scripts.process.{action}([args]);
#
# Variable "exceptions" tells what machines should be excluded from adding recipes,
#   case unsensetive. Also can be reverted with keyword "only:" from left.
#   See functions body to see machine names.
#   Keyword "strict:" try to remove old recipe before add new (replacing recipe)
#   Warning: only few machines have "strict" functions.
#
#  "exceptions" variable examples:
# "macerator"                - recipe will me added in all machines except Macerator
# "MaceRATor"                - same as above
# "Except: Macerator oh my"  - same as above
# "macerator, SagMill"       - recipe will me added in all machines except Macerator and SagMill
# "only: Macerator"          - recipe will be added to Macerator only
# "only: Macerator SagMill"  - recipe will be added to Macerator and SagMill only
# "strict: manufactory"      - recipe will be added to Manufactory only, but removed old recipe first
# "maceratorSagMill"         - wrong, words should be delimited with word boundrys
# "only: blockCutter strict: shapeless" - added to blockCutter and shapeless,
#    but shapeless would be removed first
#
# ######################################################################


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

# Shortcut for itemUtils.getItem (IItemStack only)
function I(id as string, n as int) as IItemStack { return itemUtils.getItem(id, n); }


# Check if exception string contains lookup string, case NOT sensetive
function isNotException(exceptions as string, machineName as string) as bool  {
  if (isNull(exceptions)) {
    return true;
  } else {
    val exc = exceptions.toLowerCase();
    val name = machineName.toLowerCase();

    val isHaveWord    = exc.matches(".*\b" ~ name ~ "\b.*");
    val isAfterStrict = exc.matches(".*strict:.*" ~ name ~ "\b.*");
    val isOnly        = exc.matches("^only:.*");

    return isAfterStrict || !(isHaveWord ^ isOnly);
  }
}

# Check machineName comes after keyword "strict:"
function isStrict(exceptions as string, machineName as string) as bool  {
  if (isNull(exceptions)) {
    return false;
  } else {
    return exceptions.toLowerCase().matches(".*strict:.*" ~ machineName.toLowerCase() ~ "\b.*");
  }
}

# Multiply item amount on double value
function itemFactor(output as IItemStack, mult as double) as IItemStack  {
  if (isNull(output)) { return null; }
  return output * max(1, min(output.maxStackSize, (output.amount as double * mult) as int));
}

# Multiply liquid amount on double value
function liquidFactor(output as ILiquidStack, mult as double) as ILiquidStack  {
  if (isNull(output)) { return null; }
  return output * ((output.amount as double * mult) as int);
}

# Safe get for item array
function arrN_item(arr as IItemStack[], n as int) as IItemStack {
  return !isNull(arr) ? (arr.length > n ? arr[n] : null) : null;
}

# Safe get for IIngredient array
function arrN_ingr(arr as IIngredient[], n as int) as IIngredient {
  return !isNull(arr) ? (arr.length > n ? arr[n] : null) : null;
}

# Safe get for IIngredient array
function arrN_liq(arr as ILiquidStack[], n as int) as ILiquidStack {
  return !isNull(arr) ? (arr.length > n ? arr[n] : null) : null;
}

# Safe get for float array
function arrN_float(arr as float[], n as int) as float {
  return !isNull(arr) ? (arr.length > n ? arr[n] : 0) : 0;
}

# Get 0 element of Item Array. If null - return default
function defaultItem0(items as IItemStack[], default as IItemStack) as IItemStack  {
  val it = arrN_item(items, 0);
  return !isNull(it) ? it : default;
}

# Get 0 element of float Array. If null or zero - return default
function defaultChance0(extraChance as float[], default as float) as float  {
  val v = arrN_float(extraChance, default);
  return v != 0 ? v : default;
}

# Get 0 element of float Array. If null or zero - return default. Return x100 as int
function defaultChance0_int(extraChance as float[], default as int) as int  {
  return (defaultChance0(extraChance, default as float / 100.0f) * 100.0d) as int;
}

# ######################################################################
#
# Logging functions
#
# ######################################################################

function warning(machineNameAnyCase as string, inputStr as string, description as string) as string {
  logger.logWarning("process.work: [" ~ machineNameAnyCase ~ "] " ~ description ~ "  INPUT: " ~ inputStr);
  return "";
}

function info(machineNameAnyCase as string, inputStr as string, description as string) as string {
  print("process.work: [" ~ machineNameAnyCase ~ "] " ~ description ~ "  INPUT: " ~ inputStr);
  return "";
}

# ######################################################################
#
# All machines works in one function
#
# ######################################################################

# Picks one machine to inject recipe in it
# Function receive all possible combinations of input and outputs of one machine
# Any argument can be null except machine name
# Returns name of machine if recipe was added. If not, returns empty string
function work(machineNameAnyCase as string, exceptions as string, 
  inputItems as IIngredient[], inputLiquids as ILiquidStack[],
  outputItems as IItemStack[], outputLiquids as ILiquidStack[],
  extra as IItemStack[], extraChance as float[]) as string {

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

    if (machineName == "grindstone") {
      # mods.astralsorcery.Grindstone.addRecipe(IItemStack input, IItemStack output, float doubleChance);
      print("  getItemName(outputItem0):");
      print(getItemName(outputItem0));
      for ii in inputIngr0.items {
        print("  getItemName(ii):");
        print(getItemName(ii));
        mods.astralsorcery.Grindstone.addRecipe(ii, outputItem0, defaultChance0(extraChance, 0.15f));
      }
      return machineName;
    }

    if (machineName == "compactor") {
      for ii in inputIngr0.items {
        mods.thermalexpansion.Compactor.addPressRecipe(outputItem0, ii, 4000);
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
      mods.mekanism.sawmill.addRecipe(inputIngr0, outputItem0, defaultItem0(extra, I("mekanism:sawdust",0)), defaultChance0(extraChance, 1.0f) as double);
      return machineName;
    }

    if (machineName == "tesawmill") {
      # mods.thermalexpansion.Sawmill.addRecipe(IItemStack output, IItemStack input, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
      for ii in inputIngr0.items {
        mods.thermalexpansion.Sawmill.addRecipe(outputItem0, ii, 1000, defaultItem0(extra, I("thermalfoundation:material",800)), defaultChance0_int(extraChance, 100));
      }
      return machineName;
    }

    if (machineName == "eu2crusher") {
      # mods.extrautils2.Crusher.add(IItemStack output, IItemStack input, @Optional IItemStack secondaryOutput, @Optional float secondaryChance);
          
      for ii in inputIngr0.items {
        if (haveExtra) {
          mods.extrautils2.Crusher.add(outputItem0, ii, extra[0], extraChance[0]);
        } else {
          mods.extrautils2.Crusher.add(outputItem0, ii);
        }
      }
      return machineName;
    }

    if (machineName == "aegrinder") {
      # Grinder.addRecipe(IItemStack output, IItemStack input, int turns, @Optional IItemStack secondary1Output, @Optional float secondary1Chance, @Optional IItemStack secondary2Output, @Optional float secondary2Chance);

      for ii in inputIngr0.items {
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

    if (machineName == "advrockcutter") {
      # Log recipes to manual add in XML file
      for ii in inputIngr0.items {
        print('process.work AdvRocketry recipe. Add in XML file manually');
        print('  <Recipe timeRequired="10" power ="40000">');
        print('    <input><itemStack>' ~ ii.definition.id ~ " 1 " ~ ii.damage ~ '</itemStack></input>');
        print('    <output><itemStack>' ~ outputItem0.definition.id ~ " " ~ outputItem0.amount ~ " " ~ outputItem0.damage ~ '</itemStack></output></Recipe>');
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
      for ii in inputIngr0.items {
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
      for ii in inputIngr0.items {
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
        for ii in inputIngr0.items {
          mods.thermalexpansion.Centrifuge.addRecipe(combinedOutput, ii, outputLiquid0, 2000);
        }
      } else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), "received work, but couldn't find item output");
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
        for ii in inputIngr0.items {
          mods.thermalexpansion.InductionSmelter.addRecipe(outputItem0, ii, additions[0], 4000, haveExtra ? extra[0] : additions[1], defaultChance0_int(extraChance, 10));
          mods.thermalexpansion.InductionSmelter.addRecipe(outputItem0, ii, additions[2], 6000, haveExtra ? extra[0] : additions[1], defaultChance0_int(extraChance, 10));
          mods.thermalexpansion.InductionSmelter.addRecipe(outputItem0, ii, additions[3], 8000, haveExtra ? extra[0] : additions[2], defaultChance0_int(extraChance, 10));
        }
      } else if (inputItems.length == 2) {
        for ii in inputItems[0].items {
          for jj in inputItems[1].items {
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

      val additions as IItemStack[] = [
        I("thermalfoundation:fertilizer",0), I("thermalfoundation:fertilizer",1), I("thermalfoundation:fertilizer",2)
      ] as IItemStack[];

      if (inputItems.length == 1) {
        # Only one input - add automatically scalled output based on catalyst
        for ii in inputIngr0.items {
          mods.thermalexpansion.Insolator.addRecipe(itemFactor(outputItem0, 0.33333f), ii, additions[0], 4800, extra0, defaultChance0_int(extraChance, 100));
          mods.thermalexpansion.Insolator.addRecipe(itemFactor(outputItem0, 0.66666f), ii, additions[1], 7200, extra0, defaultChance0_int(extraChance, 100));
          mods.thermalexpansion.Insolator.addRecipe(outputItem0, ii, additions[2], 9600, extra0, defaultChance0_int(extraChance, 100));
        }
      } else if (inputItems.length == 2) {
        for ii in inputItems[0].items {
          for jj in inputItems[1].items {
            mods.thermalexpansion.Insolator.addRecipe(outputItem0, ii, jj, 4800, extra0, defaultChance0_int(extraChance, 100));
          }
        }
      } else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), "received work, but number of inputs 3 or more");
      }
      return machineName;
    }
  }

  # ONE item to one liquid
  # 📦 → 💧
  if (inputIsSingle && outputLiquidIsSingle) {

    if (machineName == "crushingtub") {
      # mods.rustic.CrushingTub.addRecipe(output as ILiquidStack, byproduct as IItemStack, input as IItemStack);
      for ii in inputIngr0.items {
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
      for ii in inputIngr0.items {
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

    if (machineName == "vat") {

      var s = 'process.work EiO Vat recipe. Add in XML file manually\n';
      s = s ~
      "<recipe name=\"" ~ outputLiquid0.name ~ "\" required=\"true\"><fermenting energy=\"10000\">\n" ~ 
      "    <inputgroup><input name=" ~ arrN_item(inputItems, 0).commandString.replaceAll("[<>]", "") ~ " multiplier=\"1.0\" /></inputgroup>\n";
      if (inputItems.length >= 2) {
        s = s ~ "    <inputgroup><input name=\"" ~ arrN_item(inputItems, 1).commandString.replaceAll("[<>]", "") ~ "\" multiplier=\"1.0\" /></inputgroup>";
      }
      s = s ~ "    <inputfluid name=\"" ~ inputLiquid0.name ~ "\" multiplier=\"" ~ (outputLiquid0.amount as float) / 1000 ~ "\" />";
      s = s ~ "    <outputfluid name=\"" ~ outputLiquid0.name ~ "\" /></fermenting></recipe>";
      print(s);
      # mods.enderio.Vat.addRecipe(ILiquidStack output, ILiquidStack input, IIngredient[] slot1Solids, float[] slot1Mults, IIngredient[] slot2Solids, float[] slot2Mults, @Optional int energyCost);
      # mods.enderio.Vat.addRecipe(outputLiquid0, inputLiquid0, [arrN_item(inputItems, 0)], [1.0f], [arrN_item(inputItems, 1)], [1.0f], 5000);
      return machineName;
    }

  }

  # Any input & output
  # 📦|💧 → 📦|💧
  if ((inputIsSingle || inputLiquidIsSingle) && (outputLiquidIsSingle || outputIsSingle)) {
    if (machineName == "dryingbasin") {
      # DryingBasin.addRecipe(@Optional IItemStack inputStack, @Optional ILiquidStack inputFluid, @Optional IItemStack outputStack, @Optional ILiquidStack outputFluid, @Optional(10) int duration);
      if (inputIsSingle) {
        for ii in inputItems[0].items {
          mods.integrateddynamics.DryingBasin.addRecipe(ii, inputLiquid0, outputItem0, outputLiquid0, 80);
        }
      } else {
        mods.integrateddynamics.DryingBasin.addRecipe(null, inputLiquid0, outputItem0, outputLiquid0, 80);
      }
      return machineName;
    }

    # Any input & output
    if (machineName == "mechanicaldryingbasin") {
      # MechanicalDryingBasin.addRecipe(@Optional IItemStack inputStack, @Optional ILiquidStack inputFluid, @Optional IItemStack outputStack, @Optional ILiquidStack outputFluid, @Optional(10) int duration);
      if (inputIsSingle) {
        for ii in inputItems[0].items {
          mods.integrateddynamics.MechanicalDryingBasin.addRecipe(ii, inputLiquid0, outputItem0, outputLiquid0, 80);
        }
      } else {
        mods.integrateddynamics.MechanicalDryingBasin.addRecipe(null, inputLiquid0, outputItem0, outputLiquid0, 80);
      }
      return machineName;
    }
  }

  return warning(machineNameAnyCase,
    !isNull(inputIngr0)   ? getItemName(inputIngr0.itemArray[0]) : (
    !isNull(inputLiquid0) ? ("💧" ~ inputLiquid0.name) : "[unknown input]"),
    "received work, but machine with this name can't be found");
}

# ######################################################################
#
# Aliases functions
#
# ######################################################################

# Takes wood material and saw it
# Item amount recalculated automatically
# 📦 → 📦
function saw(input as IIngredient, output as IItemStack, exceptions as string) {
  
  work("shapeless",    exceptions, [input], null, [output * 2], null, null, null);
  work("BlockCutter",  exceptions, [input], null, [output * 4], null, null, null);
  work("mekSawmill",   exceptions, [input], null, [output * 4], null, null, null);
  work("manufactory",  exceptions, [input], null, [output * 5], null, null, null);
  work("TESawmill",    exceptions, [input], null, [output * 6], null, null, null);
  work("AdvRockCutter",exceptions, [input], null, [output *10], null, null, null);
}

# Crush (grind) item to get it dusts and byproducts
# 📦 → 📦 + [📦]?
function crush(input as IIngredient, output as IItemStack, exceptions as string, 
              extra as IItemStack[], extraChance as float[]) {
  
  work("manufactory",  exceptions, [input], null, [output], null, extra, extraChance);
  work("Macerator",    exceptions, [input], null, [output], null, extra, extraChance);
  work("eu2Crusher",   exceptions, [input], null, [output], null, extra, extraChance);
  work("IECrusher",    exceptions, [input], null, [output], null, extra, extraChance);
  work("SagMill",      exceptions, [input], null, [output], null, extra, extraChance);
  work("Grindstone",   exceptions, [input], null, [output], null, extra, extraChance);
  work("AEGrinder",    exceptions, [input], null, [output], null, extra, extraChance);
}

# Compress item to another
# 📦 → 📦
function compress(input as IIngredient, output as IItemStack, exceptions as string) {
  
  work("pressurizer",  exceptions, [input], null, [output], null, null, null);
  work("Compressor",   exceptions, [input], null, [output], null, null, null);
  work("Compactor",    exceptions, [input], null, [output], null, null, null);
}

# Alloy two or more metals into one
# [📦+] → 📦
function alloy(input as IIngredient[], output as IItemStack, exceptions as string) {
  
  work("alloyFurnace",  exceptions, input, null, [output], null, null, null);
  work("induction",     exceptions, input, null, [output], null, null, null);
  work("alloySmelter",  exceptions, input, null, [output], null, null, null);
  work("arcFurnance",   exceptions, input, null, [output], null, null, null);
}

# Takes plant or seed and grow it
# 📦 → 📦 + 📦?
function grow(input as IIngredient, output as IItemStack, exceptions as string, 
      secondaryOutput as IItemStack, secondaryChance as int) {
  
  work("Insolator", exceptions, [input], null, [output], null, [secondaryOutput], [secondaryChance as float / 100.0f]);
}

# Crushing rocks (like granite, andesite, etc..) to obtain dusts
# 📦 → [📦📦📦]
function crushRock(input as IIngredient, output as IItemStack[], exceptions as string) {
  
  work("rockCrusher", exceptions, [input], null, output, null, null, null);
}

# Takes soft or moist item, squeeze it to get liquid or another item
# 📦 → 💧? + 📦?
function squeeze(input as IIngredient, fluidOutput as ILiquidStack, exceptions as string, itemOutput as IItemStack) {
  
  work("CrushingTub",         exceptions, [input], null, [itemFactor(itemOutput, 0.5d)],  [liquidFactor(fluidOutput, 0.5d)], null, null);
  work("Squeezer",            exceptions, [input], null, [itemFactor(itemOutput, 0.5d)],  [liquidFactor(fluidOutput, 0.666666d)], null, null);
  work("MechanicalSqueezer",  exceptions, [input], null, [itemFactor(itemOutput, 0.5d)],  [liquidFactor(fluidOutput, 0.75d)], null, null);
  work("ForestrySqueezer",    exceptions, [input], null, [itemFactor(itemOutput, 0.5d)],  [liquidFactor(fluidOutput, 0.9d)], null, null);
  work("TECentrifuge",        exceptions, [input], null, [itemFactor(itemOutput, 0.75d)], [fluidOutput], null, null);
  work("IndustrialSqueezer",  exceptions, [input], null, [itemFactor(itemOutput, 1.0d)],  [fluidOutput], null, null);
}

# Solute or mix 1+ items in 1+ liquids to get new 1+ liquids
# [📦+] ⤵
#         [💧+]
# [💧+]  ⤴
function solution(inputItems as IIngredient[], inputLiquids as ILiquidStack[], outputLiquids as ILiquidStack[], exceptions as string) {
    
  work("vat",    exceptions, inputItems, inputLiquids, null, outputLiquids, null, null);
  work("canner", exceptions, inputItems, inputLiquids, null, outputLiquids, null, null);
}

# Evaporate (dry) liquid to leave precipitate
# 💧 → 📦
function evaporate(inputLiquid as ILiquidStack, output as IItemStack, exceptions as string) {
    
  work("EvaporatingBasin",      exceptions, null, [inputLiquid], [itemFactor(output, 0.5d)],  null, null, null);
  work("DryingBasin",           exceptions, null, [inputLiquid], [itemFactor(output, 0.75d)], null, null, null);
  work("MechanicalDryingBasin", exceptions, null, [inputLiquid], [itemFactor(output, 1.0d)],  null, null, null);
}

# Perform recycling on item made from metal
# Output can be liquid or item form, based on machine
# 📦 → 📦|💧
function recycleMetal(input as IIngredient, output as IItemStack, liquid as ILiquidStack, exceptions as string) {
  
  work("arcFurnance", exceptions, [input], null, [output], null, null, null);
  work("induction",   exceptions, [input, <minecraft:sand>], null, [output], null, [itemUtils.getItem("thermalfoundation:material",864)], [0.1f]);
  work("smeltery",    exceptions, [input], null, [output], [liquidFactor(liquid, 0.75d)], null, null);
}

# Melts item in liquid form
# 📦 → 💧
function melt(input as IIngredient, output as ILiquidStack, exceptions as string) {
  
  work("smeltery", exceptions, [input], null, null, [output], null, null);
  work("melter",   exceptions, [input], null, null, [output], null, null);
}

# Fill an item with liquid
# 📦 ⤵
#     📦
# 💧  ⤴
function fill(itemInput as IIngredient, fluidInput as ILiquidStack, output as IItemStack, exceptions as string) {
  
  val newAmount1 = min(1000, (fluidInput.amount as double * 1.6d) as int);
  val newAmount2 = min(1000, (fluidInput.amount as double * 1.4d) as int);
  work("Casting",                exceptions, [itemInput], [liquidFactor(fluidInput, 1.8d)], [output], null, null, null);
  work("DryingBasin",            exceptions, [itemInput], [fluidInput * newAmount1], [output], null, null, null);
  work("MechanicalDryingBasin",  exceptions, [itemInput], [fluidInput * newAmount2], [output], null, null, null);
  work("NCInfuser",              exceptions, [itemInput], [liquidFactor(fluidInput, 1.2d)], [output], null, null, null);
}