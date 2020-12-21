#priority 2008


zenClass Serialize {
	zenConstructor() { }

  function _string(s as string) as string { return '"'~s~'"'; }

  function IIngredient(a as crafttweaker.item.IIngredient) as string {
    return !isNull(a) ? a.commandString : 'null';
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
    for q in 0 .. 2 {
      var k = 0;
      for c, ingr in ingrList {
        val s_ingr = IIngredient(ingr);
        val isLast = k == ingrsCount - 1;
        val s_comma = isLast ? "" : ",";
        val s_line = _string(c) ~ ': ' ~ s_ingr ~ s_comma;

        if(q==0) {
          if(s_line.length < 50) maxLength = max(maxLength, s_line.length);
        } else {
          val fancyPad = utils.repeat(isDense ? 0 : maxLength - s_line.length);
          val displayName = ingr.itemArray[0].displayName;
          val comment = (style has "fancy")
            ? fancyPad ~ comment_start ~ displayName ~ comment_end
            : "";
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
}
global serialize as Serialize = Serialize();