/*

Craft.zs helper class.

Recursively looking for appropriate string
using string styles

*/

#priority 5

zenClass Styler {
  zenConstructor() {}

  function get(style as string[], d as crafttweaker.data.IData) as string {
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
}
static styler as Styler = Styler() as Styler;