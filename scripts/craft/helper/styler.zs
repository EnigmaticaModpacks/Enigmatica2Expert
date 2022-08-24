/*

Craft.zs helper class.

Recursively looking for appropriate string
using string styles

*/

#priority 6

#loader crafttweaker reloadableevents

import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import scripts.craft.grid.Grid;
import scripts.craft.helper.styleList.LinkedList;

zenClass Styler {
  // val builders as function(IItemStack,Grid,string[])string[string] = {};

  var firstTemplate as LinkedList;
  var lastTemplate as LinkedList;

  # This items in catalyst slot would add this styles
  val catalysts as string[string] = {};

  zenConstructor() {}

  function get(style as string[], d as IData) as string {
    if(isNull(d)) return "";
    val asMap = d.asMap();
    if(isNull(asMap)) return d.asString();

    # Weird stuff.
    # When iterating "stuff".asMap()
    # [key, value] would be ["stuff", "stuff"]
    # So i forced to check serialized data
    val asStr = d.asString();
    if(!asStr.startsWith("{")) return asStr;

    for k,v in asMap {
      if(k == "_") continue;
      if(style has k) return get(style, v);
    }

    return get(style, d.memberGet("_"));
  }

  function catalyst(itemId as string, styleKey as string = null) as void {
    catalysts[itemId] = !isNull(styleKey) ? styleKey : itemId;
  }

  function template(fnc as function(IItemStack,Grid,string[])string) as void {
    val l = LinkedList(fnc);
    if (isNull(firstTemplate)) {
      firstTemplate = l;
      lastTemplate = l;
    }
    else {
      lastTemplate.next = l;
      lastTemplate = l;
    }
  }

  # Iterate over all templates
  function pickTemplate(output as IItemStack, grid as Grid, style as string[]) as string {
    var tplt = firstTemplate;
    while(!isNull(tplt)) {
      val result = tplt.fnc(output, grid, style);
      if(!isNull(result)) return result;
      tplt = tplt.next;
    }
    return '<Template iteration Error>';
  }
}
static styler as Styler = Styler() as Styler;
