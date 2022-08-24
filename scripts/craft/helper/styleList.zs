#priority 2001

#loader crafttweaker reloadableevents

import crafttweaker.item.IItemStack;
import scripts.craft.grid.Grid;

zenClass LinkedList {
  var next as LinkedList;
  var fnc as function(IItemStack,Grid,string[])string;
	zenConstructor(
     _fnc as function(IItemStack,Grid,string[])string
  ) {
    fnc = _fnc;
  }
}
