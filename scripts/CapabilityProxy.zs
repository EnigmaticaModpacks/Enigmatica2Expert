#modloaded capabilityproxy

recipes.remove(<capabilityproxy:capability_proxy>);
recipes.addShaped(<capabilityproxy:capability_proxy>, [
  [<extrautils2:decorativesolid:7>, <cd4017be_lib:m:402>, <extrautils2:decorativesolid:7>],
  [<cd4017be_lib:m:402>, <ore:itemEndSteelMachineChassi>, <cd4017be_lib:m:402>],
  [<extrautils2:decorativesolid:7>, <cd4017be_lib:m:402>, <extrautils2:decorativesolid:7>]]);

recipes.remove(<capabilityproxy:ranged_capability_proxy>);
recipes.addShaped(<capabilityproxy:ranged_capability_proxy>, [
  [<ore:plateEnderium>, <biomesoplenty:jar_filled:1>, <ore:plateEnderium>],
  [<capabilityproxy:capability_proxy>, <capabilityproxy:capability_proxy>, <capabilityproxy:capability_proxy>],
  [<ore:plateEnderium>, <biomesoplenty:jar_filled:1>, <ore:plateEnderium>]]);
