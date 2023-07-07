/**
 * @file Bunch of handy utilities for zenscript
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

#priority 4000

import crafttweaker.command.ICommandSender;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.IRecipeFunction;
import crafttweaker.world.IWorld;

#reloadable

zenClass Utils {
  var DEBUG as bool = false;

	zenConstructor() { }

  val getSomething as function(string,string[],int)IItemStack = 
  function (oreName as string, entryNames as string[], amount as int) as IItemStack {
    return null;
  };

  # Return result of smelting in vanilla furnace
  function smelt(input as IIngredient) as IItemStack {
    for r in furnace.all {
      if (r.input has input || input has r.input) return r.output;
    }
    return null;
  }

  function firstItem(ingr as IIngredient) as IItemStack {
    if(ingr.itemArray.length <= 0 ) { return null; }
    val a = ingr.itemArray[0];
    return a.damage == 32767 ? a.withDamage(0) : a;
  }

  function compact(a as IIngredient, b as IIngredient) as void {
    if(a.itemArray.length <= 0 || b.itemArray.length <= 0) {
      logger.logWarning('Cannot compact '~a.commandString~' into '~b.commandString);
      return;
    }
    recipes.addShapeless(firstItem(b).anyAmount(), [a,a,a,a,a,a,a,a,a]);
    recipes.addShapeless(firstItem(a) * 9, [b]);
  }

  function ingredientFromArrayByRegex(regex as string) as IIngredient {
    var items = itemUtils.getItemsByRegexRegistryName(regex);
    if (!isNull(items) && items.length > 0) {
      if (items.length == 1) return items[0];

      var result = items[0] as IIngredient;
      for i in 1 to items.length {
        result = result | items[i];
      }
      return result;
    }

    return null;
  }

  # ########################
  # Removing item everywhere
  # ########################
  function rh(ingr as IIngredient, removeOredict as bool = true) as void {
    if (isNull(ingr)) return;

    for item in ingr.items {
      if(removeOredict) {
        for ore in item.ores {
          ore.remove(item);
        }
      }

      val actualItem = (item.damage == 0 && item.isDamageable)
        ? item.anyDamage()
        : item;
      // furnace.remove(<*>, actualItem); managed by JS script
      furnace.remove(actualItem);
      recipes.remove(actualItem);

      if (DEBUG) log('purged: ' ~ actualItem.commandString, item.displayName);
    }
  }


  # ########################
  # Conditional Loging
  # ########################
  function log(a as string) as void {log(a,null,null);}
  function log(a as string, b as string) as void {log(a,b,null);}
  function log(a as string, b as string, c as string) as void {
    if (DEBUG) print(
      (!isNull(a) ? a : "") ~
      (!isNull(b) ? " " ~ b : "") ~
      (!isNull(c) ? " " ~ c : ""));
  }
  function log(arr as string[]) as void {
    if (DEBUG) {
      if (isNull(arr) || arr.length <=0) {
        print("");
        return;
      }
      var s = "";
      for str in arr {
        s = s ~ " " ~ str;
      }
      print(s);
    }
  }


  # ########################
  # Graph
  # ########################
  function graph(map as string[], keys as string[][string]) as string[][double[string]] { return graph(map, null, keys); }
  function graph(map as string[], options as IData, keys as string[][string]) as string[][double[string]] {
    if (isNull(map) || map.length <= 0) {
      logger.logWarning("utils.graph() first argument should be non-empty string[].");
      return {};
    }

    # Determine max dimensions
    var height = map.length;
    var width  = 0;
    for line in map {
      width = max(width, line.length);
    }

    if (width <= 0) {
      logger.logWarning("utils.graph() first argument should content at least one non-empty string");
      return {};
    }

    # Compute min-max for each dimension
    val dopt = D(options);
    var minX = dopt.getDouble("x.min" , 0.0d);
    var maxX = dopt.getDouble("x.max" , 1.0d);
    var minY = dopt.getDouble("y.min" , 0.0d);
    var maxY = dopt.getDouble("y.max" , 1.0d);
    var stepX= dopt.get("x.step");
    var stepY= dopt.get("y.step");

    # Determine doulbe steps
    var intervalX = (maxX - minX) / (max(1, width  - 1) as double);
    var intervalY = (maxY - minY) / (max(1, height - 1) as double);

    # Write result
    var result as string[][double[string]] = {};
    var resultLen = 0;
    for y in 0 to map.length {
      for x in 0 to map[y].length {
        var c = map[y][x];
        if (c != " " && !isNull(keys[c])) {
          var X = intervalX * x + minX;
          var Y = maxY - intervalY * y;
          if(!isNull(stepX)) X = ((X / stepX.asDouble()) as int) as double * stepX.asDouble();
          if(!isNull(stepY)) Y = ((Y / stepY.asDouble()) as int) as double * stepY.asDouble();
          result[{x: X, y: Y} as double[string]] = keys[c];
          resultLen += 1;
        }
      }
    }

    if (resultLen <= 0) logger.logWarning("utils.graph() graph cant find any valid key");

    return result;
  }


  static defaultEmount as double[string] = {
    "Amber"               : 2.0d,
    "Amethyst"            : 2.0d,
    "Apatite"             : 10.0d,
    "Aquamarine"          : 4.0d,
    "CertusQuartz"        : 3.0d,
    "ChargedCertusQuartz" : 2.0d,
    "Coal"                : 5.0d,
    "Diamond"             : 2.0d,
    "DimensionalShard"    : 3.0d,
    "Emerald"             : 2.0d,
    "Glowstone"           : 4.0d,
    "Lapis"               : 10.0d,
    "Malachite"           : 2.0d,
    "Peridot"             : 2.0d,
    "Quartz"              : 3.0d,
    "QuartzBlack"         : 2.0d,
    "quicksilver"         : 2.0d,
    "Redstone"            : 10.0d,
    "Ruby"                : 2.0d,
    "Sapphire"            : 2.0d,
    "Tanzanite"           : 2.0d,
    "Topaz"               : 2.0d,
  } as double[string];

  function countOutput(item as IItemStack, oreName as string) as IItemStack {
    val def = defaultEmount[oreName];
    if(isNull(def)) return amountClamp(item);

    val d = def as double;
    if (d != 0.0d) {
      return item * min(64, (((item.amount as double - 1.0d) * (d*0.75d) + d) as int));
    }
    return amountClamp(item);
  }

  function amountClamp(item as IItemStack) as IItemStack {
    if(isNull(item)) return null;
    if(item.amount==1) return item.anyAmount();
    return item * min(64, item.amount);
  }


  # Turn one item into another but keep all tags
  val upgradeFnc as IRecipeFunction = function(out, ins, cInfo) {
    if(ins has "marked" && !isNull(ins.marked) && !isNull(ins.marked.tag)) {
      val tag = ins.marked.tag;
      return out.withTag(tag);
    }
    return out;
  };

  # Smart keeping tags, like enchantments and EnderIO upgrades
  val smartUpgradeFnc as IRecipeFunction = function(out, ins, cInfo) {
    if(isNull(ins)) return out;

    // Find origin item with tag
    var originItem as IItemStack = ins.marked;
    if(isNull(originItem)) {
      for key, ingr in ins {
        if(isNull(ingr) || isNull(ingr.tag)) continue;
        originItem = ingr;
        break;
      }
    }
    if(isNull(originItem) || isNull(originItem.tag) || originItem.tag == {} as IData) return out;

    // Copy whitelisted tags
    var newTag = isNull(out.tag) ? {} as IData : out.tag;
    val oldMod = originItem.definition.id.split(":")[0];
    val newMod = out.definition.id.split(":")[0];
    val sameMod = oldMod == newMod;
    for key, value in originItem.tag.asMap() {
      if(
        (sameMod && (
          key.startsWith('enderio.')
        ))
        || key == 'ench'
        || key == 'infench'
        || key == 'ncRadiationResistance'
        || key == 'enchantmentColor'
        || key == 'hasIC2Jetpack'
        || key == 'spectreAnchor'
        || key == 'display'
      )
        newTag += {[key]: value} as IData;
    }

    return out.withTag(newTag);
  };


  # Try to get item by string. If fail - return second vaiant
  function tryCatch(first as string, meta as int, second as IItemStack) as IItemStack {
    val item = itemUtils.getItem(first, meta);
    return isNull(item) ? second : item;
  }
  function tryCatch(first as string, second as IItemStack) as IItemStack {
    return tryCatch(first, 0, second);
  }
  function tryCatch(first as IItemStack, second as IItemStack) as IItemStack {
    return isNull(first) ? second : first;
  }

  # Safe get item with nbt tag and amount
  function get(id as string                                            ) as IItemStack {return get(id,    0,      1, null);}
  function get(id as string, meta as short                             ) as IItemStack {return get(id, meta,      1, null);}
  function get(id as string, meta as short, amount as int              ) as IItemStack {return get(id, meta, amount, null);}
  function get(id as string, meta as short, amount as int, nbt as IData) as IItemStack {
    val item = itemUtils.getItem(id, meta);
    if(isNull(item)) return null;

    return isNull(nbt)
      ? (amount > 1 ? item * amount : item)
      : (amount > 1 ? item * amount : item).withTag(nbt);
  }

  # Clear Fluid tag on item preserving other tags
  function clearFluid(input as IItemStack) as void  {
    clearFluid(input, "Fluid Clearing " ~ input.definition.id.replaceAll(":", "_") ~ "_" ~ input.damage);
  }
  function clearFluid(input as IItemStack, recipeName as string) as void  {
    recipes.addShapeless(recipeName, 
      input, [input.marked("marked")],
      function(out, ins, cInfo) {
        if(ins has "marked" && !isNull(ins.marked) && ins.marked.hasTag) {
          var tag = ins.marked.tag;
          if (!isNull(tag.Fluid)) {
            # Usual tanks
            tag = tag - "Fluid";
          } else
          if (!isNull(tag.tank)) {
            # Open Blocks
            tag = tag - "tank";
          } else
          if (!isNull(tag.FluidName) && !isNull(tag.Amount)) {
            # Black hole or other
            tag = tag - "FluidName" - "Amount";
          }

          if(tag == {} as IData) return out;
          return out.withTag(tag);
        }
        return out;
    }, null);
  }

  function sortInt(list as int[]) as int[] {
    if(isNull(list)) return null;
    if(list.length == 1) return [0];

    var sorted = [] as int[];
    for i in 0 to list.length {
      var g_v = 0;
      var g_i = i;
      for j in 0 to list.length {
        if(list[j] >= g_v && !(sorted has j)) {
          g_v = list[j];
          g_i = j;
        }
      }
      sorted += g_i;
    }
    return sorted;
  }

  // Spawn particles
  // Overloaded with world instead of CommandSender
  function spawnParticles(
    world as IWorld,
    type as string,
    x as float, y as float, z as float,
    dx as float, dy as float, dz as float,
    vel as float, amount as int
  ) as void {
    val sender as ICommandSender = <minecraft:dirt>.createEntityItem(world, x, y, z);
    return spawnParticles(sender, type, x, y, z, dx, dy, dz, vel, amount);
  }
  function spawnParticles(
    sender as ICommandSender,
    type as string,
    x as float, y as float, z as float,
    dx as float, dy as float, dz as float,
    vel as float, amount as int
  ) as void {
    executeCommandSilent(sender, "/particle "~type~" "~x~" "~y~" "~z~" "~dx~" "~dy~" "~dz~" "~vel~" "~amount);
  }
  val executeCommandSilent as function(ICommandSender,string)void =
  function(sender as ICommandSender, command as string) as void {};

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

        val itemEntity = (output * count).createEntityItem(world, x, y, z);
        itemEntity.motionY = my + 0.4d;
        itemEntity.motionX = mx + rnd.nextDouble(-0.1d, 0.1d);
        itemEntity.motionZ = mz + rnd.nextDouble(-0.1d, 0.1d);
        world.spawnEntity(itemEntity);

      // world.playSound("thaumcraft:poof", "ambient", pos, 0.5f, 1.5f);
      executeCommandSilent(itemEntity, "/particle fireworksSpark "~x as float~" "~y as float~" "~z as float~" 0 0.1 0 0.1 5");

      i += 1;
    }
  };

  # Get Shimmer enchant + Random Things colored shining
  val shimmerTag as IData = <enchantment:enderio:shimmer>.makeEnchantment(1).makeTag();
  function shinigTag(color as int) as IData {
    return { enchantmentColor: color } as IData + shimmerTag;
  }

  function addEnchRecipe(output as IItemStack, ench as crafttweaker.enchantments.IEnchantmentDefinition, inputs as IIngredient[][]) as void {
    recipes.addShaped(output.displayName.replaceAll(":", "_").replaceAll('§.|"', "") ~ '_ench',
      output.withTag({ench:[{lvl: 1 as short, id: ench.id as short}]}),
      inputs, function(out, ins, cInfo) {
        return output.withTag({ench:[{lvl: 1 as short, id: ench.id as short}]});
      }, null
    );
  }
}
global utils as Utils = Utils();
