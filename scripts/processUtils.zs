import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;

#priority 52

// ////####################################################################
//
// Helpers
//
// ////####################################################################

// Shortcut for itemUtils.getItem (IItemStack only)
function I(id as string, n as int) as IItemStack { return itemUtils.getItem(id, n); }

// Check if exception string contains lookup string, case NOT sensetive
function isNotException(exceptions as string, machineName as string) as bool  {
  if (isNull(exceptions)) {
    return true;
  }
  else {
    val exc = exceptions.toLowerCase();
    val name = machineName.toLowerCase();

    val isHaveWord    = exc.matches('.*\b' ~ name ~ '\b.*');
    val isAfterStrict = exc.matches('.*strict:.*' ~ name ~ '\b.*');
    val isOnly        = exc.matches('^(only|strict):.*');

    return isAfterStrict || !(isHaveWord ^ isOnly);
  }
}

// Check machineName comes after keyword "strict:"
function isStrict(exceptions as string, machineName as string) as bool  {
  if (isNull(exceptions)) {
    return false;
  }
  else {
    return exceptions.toLowerCase().matches('.*strict:.*' ~ machineName.toLowerCase() ~ '\b.*');
  }
}

// Safe get for item array
function arrN_item(arr as IItemStack[], n as int = 0) as IItemStack {
  return !isNull(arr) ? (arr.length > n ? arr[n] : null) : null;
}

// Safe get for IIngredient array
function arrN_ingr(arr as IIngredient[], n as int = 0) as IIngredient {
  return !isNull(arr) ? (arr.length > n ? arr[n] : null) : null;
}

// Safe get for IIngredient array
function arrN_liq(arr as ILiquidStack[], n as int = 0) as ILiquidStack {
  return !isNull(arr) ? (arr.length > n ? arr[n] : null) : null;
}

// Safe get for float array
function arrN_float(arr as float[], n as int = 0) as float {
  return !isNull(arr) ? (arr.length > n ? arr[n] : 0) : 0;
}

// Get 0 element of Item Array. If null - return default
function defaultItem0(items as IItemStack[], default as IItemStack) as IItemStack  {
  val it = arrN_item(items, 0);
  return !isNull(it) ? it : default;
}

// Get Nth element of float Array. If null or zero - return default
function defaultChanceN(extraChance as float[], n as int, default as float) as float  {
  val v = arrN_float(extraChance, n);
  return v != 0 ? v : default;
}

// Get 0 element of float Array. If null or zero - return default
function defaultChance0(extraChance as float[], default as float) as float  {
  return defaultChanceN(extraChance, 0, default);
}

// Get 0 element of float Array. If null or zero - return default. Return x100 as int
function defaultChance0_int(extraChance as float[], default as int) as int  {
  return (defaultChance0(extraChance, default as float / 100.0f) * 100.0d) as int;
}

// Get input/output amount if we have non-whole output amount
function wholesCalc(inputAmount as int, outputAmount as double) as double[string] {
  val whole = outputAmount as int as double;
  val residue = outputAmount - whole;
  val out1 = outputAmount / inputAmount as double;
  if (residue == 0) return { ins: 1.0d, outs: whole, out1: out1 };
  val ins = 1.0d / residue;
  val outs = outputAmount * ins;
  return { ins: ins, outs: outs, out1: out1 };
}

// Summ of chances should be equal 1
function normalizeChances(combinedChances as float[]) as float[]  {
  var chancesSumm = 0.0f;
  var normalizedChances = [] as float[];
  for ch in combinedChances { chancesSumm += ch; }
  for ch in combinedChances { normalizedChances += ch / chancesSumm; }
  return normalizedChances;
}

// ////####################################################################
//
// Logging functions
//
// ////####################################################################

function warning(machineNameAnyCase as string, inputStr as string, description as string) as string {
  logger.logWarning('process.work: [' ~ machineNameAnyCase ~ '] ' ~ description ~ '  INPUT: ' ~ inputStr);
  return '';
}

function info(machineNameAnyCase as string, inputStr as string, description as string) as string {
  utils.log('process.work: [' ~ machineNameAnyCase ~ '] ' ~ description ~ '  INPUT: ' ~ inputStr);
  return '';
}

// ////####################################################################
//
// Manual recipes
//
// ////####################################################################

function xmlRecipe(filename as string, recipeContent as string) {
  utils.log('Put this recipe in file [' ~ filename ~ '] manually.\n' ~ recipeContent);
}

// ////####################################################################
// EnderIO
// ////####################################################################

function firstDisplayLiq(arr as ILiquidStack[]) as string {
  val it = arrN_liq(arr);
  return isNull(it) ? '' : it.displayName;
}
function firstDisplayItm(arr as IItemStack[]) as string {
  val it = arrN_item(arr);
  return isNull(it) ? '' : it.displayName;
}

function enderioXmlRecipe(processName as string,
  inputItems as IIngredient[], inputLiquids as ILiquidStack[],
  outputItems as IItemStack[], outputLiquids as ILiquidStack[],
  chances as float[]
) as void {
  if (!utils.DEBUG) return;

  val display = (firstDisplayLiq(outputLiquids) ~ firstDisplayItm(outputItems)).replaceAll('"', '');

  var s = '<recipe name="' ~ display ~ '"><' ~ processName ~ ' energy="10000">\n';

  var fl_multiplier = '';
  var it_multiplier = '';

  if (!isNull(arrN_liq(inputLiquids)) && !isNull(arrN_liq(outputLiquids))) {
    val in_f = (arrN_liq(inputLiquids).amount as float) / 1000;
    val out_f = (outputLiquids[0].amount as float) / 1000;
    if (processName == 'fermenting') {
      fl_multiplier = ' multiplier="' ~ in_f / out_f ~ '"';
      it_multiplier = ' multiplier="' ~ in_f / inputItems.length ~ '"';
    }
  }

  if (!isNull(inputItems)) {
    for inIngr in inputItems {
      if (processName == 'fermenting') s ~= '  <inputgroup>\n';
      val eioName = inIngr.commandString.replaceAll('[<>]', '').replaceAll('^ore:| \\* \\d+$', '');
      val amount = (inIngr.amount > 1) ? 'amount="' ~ inIngr.amount ~ '" ' : '';
      s ~= '    <input name="' ~ eioName ~ '" ' ~ amount ~ it_multiplier ~ ' />\n';
      if (processName == 'fermenting') s ~= '  </inputgroup>\n';
    }
  }

  if (!isNull(outputItems)) {
    for ii in outputItems {
      if (ii.items.length > 0) {
        val out_it = ii.items[0];
        val amount = (ii.amount > 1) ? 'amount="' ~ ii.amount ~ '" ' : '';
        s ~= '  <output name="' ~ out_it.definition.id ~ (out_it.damage != 0 ? (':' ~ out_it.damage) : '') ~ '" ' ~ amount ~ '/>\n';
      }
    }
  }

  if (!isNull(arrN_liq(inputLiquids)) && !isNull(arrN_liq(outputLiquids))) {
    s ~= '  <inputfluid name="' ~ inputLiquids[0].name ~ '"' ~ fl_multiplier ~ ' />\n';
    s ~= '  <outputfluid name="' ~ outputLiquids[0].name ~ '" />';
  }

  s ~= '</' ~ processName ~ '></recipe>';

  xmlRecipe('./config/enderio/recipes/user/user_recipes.xml', s);
}

// ////####################################################################
// Advanced Rocketry
// ////####################################################################
function AR_inputItems(inputItems as IIngredient[]) as string {
  if (isNull(inputItems)) return '';
  var s = '';
  for ii in inputItems {
    if (ii.items.length <= 0) continue;

    var display as string = null;
    var id as string = null;
    var meta as int = 0;
    var type as string = null;
    val oreRegex = '<ore:(.*)>( \\* \\d+)?';
    if (ii.commandString.matches(oreRegex)) {
      type = 'oreDict';
      id = ii.commandString.replaceAll(oreRegex, '$1');
      display = id;
    }
    else {
      type = 'itemStack';
      val in_it = ii.items[0];
      display = in_it.displayName;
      id = in_it.definition.id;
      meta = in_it.damage;
    }
    s = s ~ '    <' ~ type ~ '>' ~ id ~ ' ' ~ ii.amount ~ ((meta != 0) ? ' ' ~ meta : '') ~ '</' ~ type ~ '>\n';
  }
  return s;
}

function AR_inputLiquids(inputLiquids as ILiquidStack[]) as string {
  if (isNull(inputLiquids)) return '';
  var s = '';
  for ii in inputLiquids {
    s = s ~ '    <fluidStack>' ~ ii.name ~ ' ' ~ ii.amount ~ '</fluidStack>\n';
  }
  return s;
}

function avdRockXmlRecipeEx(filename as string,
  inputItems as IIngredient[], inputLiquids as ILiquidStack[],
  outputItems as IItemStack[], outputLiquids as ILiquidStack[] = null,
  options as IData = null
) as void {
  if (!utils.DEBUG) return;
  val dOpt = D(options);

  // Dumpt all names for inputs and outputs
  var out_name as string = null;

  var s
      = AR_inputItems(inputItems) ~ AR_inputLiquids(inputLiquids) ~ '    </input><output>\n';

  // Outputs
  if (!isNull(outputItems)) {
    for ii in outputItems {
      if (ii.items.length > 0) {
        val out_it = ii.items[0];
        out_name = (isNull(out_name) ? out_it.displayName : (out_name ~ '+'));
        s = s ~ '    <itemStack>' ~ out_it.definition.id ~ ' ' ~ ii.amount ~ ' ' ~ out_it.damage ~ '</itemStack>\n';
      }
    }
  }
  if (!isNull(outputLiquids)) {
    for ii in outputLiquids {
      out_name = (isNull(out_name) ? ii.displayName : (out_name ~ '+'));
      s = s ~ '    <fluidStack>' ~ ii.name ~ ' ' ~ ii.amount ~ '</fluidStack>\n';
    }
  }
  s = s ~ '    </output></Recipe>';

  // Add prefix
  s = '  <!-- [' ~ out_name ~ '] -->\n' ~ '  <Recipe timeRequired="' ~ dOpt.getInt('timeRequired', 10) ~ '" power="' ~ dOpt.getInt('power', 40000) ~ '"><input>\n' ~ s;

  xmlRecipe('./config/advRocketry/' ~ filename ~ '.xml', s);
}

function avdRockXmlRecipe(filename as string,
  inputItems as IIngredient[], inputLiquids as ILiquidStack[],
  outputItems as IItemStack[], outputLiquids as ILiquidStack[]) as void {
  avdRockXmlRecipeEx(filename, inputItems, inputLiquids, outputItems, outputLiquids, null);
}

function avdRockXmlRecipeFlatten(
  filename as string,
  output as IItemStack,
  ingredients as IIngredient[][],
  fluidInput as ILiquidStack = null,
  box as IItemStack = null,
  altMaxMult as int = 64
) as void {
  # How much we reduce ingredients count
  val devider = 2.0;

  # Flatten ingredients
  var ingrs = [] as IIngredient[];
  var countRaw = [] as int[];

  # Iterate the grid
  for y, row in ingredients {
    for x, ingr in row {
      if(isNull(ingr)) continue;

      # Merge if we already have same ingredient
      var merged = false;
      for i, exist in ingrs {
        if(merged) continue;
        if((exist has ingr) && (ingr has exist)) {
          countRaw[i] = countRaw[i] + ingr.amount;
          merged = true;
        }
      }

      # Push new exist entry
      if(!merged) {
        ingrs += ingr;
        countRaw += ingr.amount;
      }
    }
  }

  if (!isNull(box)) {
    ingrs += box as IIngredient;
    countRaw += box.amount;
  }

  # Compute discount
  var count = [] as int[];
  for i, amount in countRaw {
    count += max(1, (amount as double / devider + 0.5) as int);
  }

  # Max stack size of every stack in inputs / outputs
  var maxAmount = output.amount;
  for i, amount in count {
    maxAmount = max(maxAmount, amount);
  }

  # Get multiplier - how many times we can make recipe
  # with even input and output
  val multiplier = min(altMaxMult, max(1, (64.0 / maxAmount as double) as int));

  # Reassemble ingredients with another amount
  var trueIngrs = [] as IIngredient[];
  for i, ingr in ingrs {
    trueIngrs += ingr * (count[i] * multiplier);
  }

  avdRockXmlRecipeEx(
    filename,
    trueIngrs,
    !isNull(fluidInput) ? [fluidInput * (fluidInput.amount * multiplier)] as ILiquidStack[] : null,
    [output * (output.amount * multiplier)],
    null,
    { power: 20000 * multiplier, timeRequired: 5 * multiplier }
  );
}
