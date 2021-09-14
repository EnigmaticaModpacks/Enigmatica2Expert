import crafttweaker.block.IBlock;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import mod.mekanism.gas.IGasStack;
import thaumcraft.aspect.CTAspectStack;

#priority 3000


zenClass Serialize {
	zenConstructor() { }

  function     wrap(s as string, wraps as string) as string { return wraps[0]~s~wraps[1]; }
  function     wrap(s as string)   as string { return wrap(s, '""'); }
  function  _string(s as string)   as string { return wrap(s); }
  function string__(s as string[]) as string { return wrap(utils.join(s, ", "), "[]"); }
  function     args(s as string[]) as string { return wrap(utils.join(s, ", "), '()'); }

  function IIngredient(a as IIngredient) as string { return !isNull(a) ? a.commandString : 'null'; }
  function IIngredient(a as crafttweaker.item.IIngredient, style as string[]) as string {
    if(a.itemArray.length == 1) {
      val itemStack = a.itemArray[0];

      if(
        itemStack.isDamageable &&
        !isNull(style) &&
        !(style has "noTransformers")
      ) {
        if(itemStack.amount > 1) return "("~IItemStack(itemStack) ~ ").anyDamage()";
        return IItemStack(itemStack) ~ ".anyDamage()";
      }

      if(style has "noOre") return IItemStack(itemStack);

      val ores = itemStack.ores;
      if(!isNull(ores) && ores.length > 0) {
        val first = itemStack.amount > 1 ? ores[0] * itemStack.amount : ores[0];
        if(ores.length == 1 || style has "firstOre") return IIngredient(first);
        
        var ingr as crafttweaker.item.IIngredient = ores[0];
        for i, ore in ores {
          if(i==0) continue;
          ingr |= ore;
        }
        if(itemStack.amount > 1) ingr *= itemStack.amount;
        return IIngredient(ingr);
      }
      
    }
    return IIngredient(a);
  }

  function IItemStack(a as IItemStack) as string {
    return !isNull(a) ? a.commandString : 'null';
  }

  function IItemStack__(a as crafttweaker.item.IItemStack[]) as string {
    var s = [] as string[];
    for k,v in a { s += IItemStack(v); }
    return string__(s);
  }

  function IIngredient_string_(ingrList as crafttweaker.item.IIngredient[string], style as string[]) as string {
    var s = "";
    if(isNull(ingrList)) return s;

    # Count map
    var ingrsCount = 0;
    for c, ingr in ingrList { ingrsCount += 1; }

    var maxLength = 0;
    val isDense = (style has "dense");
    val ln = (isDense ? "" : "\n");
    val comment_start = isDense ? "/*" : " # ";
    val comment_end   = isDense ? "*/" : "";
    val trailComma = (style has "noTrail") ? "" : ",";
    for q in 0 .. 2 {
      var k = 0;
      for c, ingr in ingrList {
        val s_ingr = IIngredient(ingr, style);
        val isLast = k == ingrsCount - 1;
        val s_comma = isLast ? trailComma : ",";
        val key = c.length > 1 ? c : _string(c);
        val s_line = key ~ ': ' ~ s_ingr ~ s_comma;

        if(q==0) {
          if(s_line.length < 50) maxLength = max(maxLength, s_line.length);
        } else {
          val fancyPad = utils.repeat(isDense ? 0 : maxLength - s_line.length);
          val displayName = ingr.itemArray[0].displayName;
          val comment = (style has "noFancy") ? "" :
            fancyPad ~ comment_start ~ displayName ~ comment_end;
          s +=
            (isDense ? "" : "  ") ~
            s_line ~ comment ~
            (!isLast ? ln : "");
        }
        k += 1;
      }
    }

    return s;
  }

  function IIngredient__(a as crafttweaker.item.IIngredient[]) as string {
    var s = [] as string[];
    for k,v in a { s += IIngredient(v); }
    return string__(s);
  }

  function IIngredient____(a as crafttweaker.item.IIngredient[][]) as string {
    var s = [] as string[];
    for k,v in a { s += IIngredient__(v); }
    return string__(s);
  }

  function ILiquidStack(a as crafttweaker.liquid.ILiquidStack) as string {
    return !isNull(a) ? ("<fluid:"~a.name~">" ~ (a.amount>1 ? " * " ~ a.amount : "")) : 'null';
  }

  function ILiquidStack__(a as crafttweaker.liquid.ILiquidStack[]) as string {
    var s = [] as string[];
    for k,v in a {
      s += ILiquidStack(v);
    }
    return string__(s);
  }

  function ILiquidDefinition(a as ILiquidDefinition) as string {
    return !isNull(a) ? ("<fluid:"~a.name~">") : 'null';
  }

  function IGasStack(a as IGasStack) as string {
    return !isNull(a) ? ("<gas:"~a.NAME~">" ~ (a.amount>1 ? " * " ~ a.amount : "")) : 'null';
  }

  function WeightedItemStack(a as WeightedItemStack) as string {
    return !isNull(a) ? ('('~a.stack.commandString~').weight('~a.percent~')') : 'null';
  }

  function WeightedItemStack__(ss as crafttweaker.item.WeightedItemStack[]) as string {
    var s = [] as string[];
    for k,v in ss {
      s += WeightedItemStack(v);
    }
    return string__(s);
  }

  function IOreDictEntry(a as IOreDictEntry) as string {
    return !isNull(a) ? ("<ore:"~a.name~">") : 'null';
  }

  function IBlock(a as IBlock) as string {
    return !isNull(a) ? (a.definition.defaultState.commandString) : 'null';
  }

  function CTAspectStack(a as CTAspectStack) as string {
    return !isNull(a) ? ("<aspect:"~a.internal.name~">" ~ (a.amount>1 ? " * " ~ a.amount : "")) : 'null';
  }

  function CTAspectStack__(a as thaumcraft.aspect.CTAspectStack[]) as string {
    var s = [] as string[];
    for k,v in a {
      s += CTAspectStack(v);
    }
    return string__(s);
  }
}
global serialize as Serialize = Serialize();