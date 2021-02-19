#modloaded cd4017be_lib
import mods.jei.JEI.removeAndHide as rh;

# Telekinetic alloy
recipes.remove(<cd4017be_lib:m:402>);
recipes.addShapeless(<cd4017be_lib:m:402>, [<ore:dustDiamond>, <ore:dustLapis>, <randomthings:ingredient:7>]);

# Telekinetic Actuator
remakeEx(<cd4017be_lib:m:401>, [[<cd4017be_lib:m:402>, <mekanism:ingot:3>, <cd4017be_lib:m:402>],[<rs_ctr:wire_e>, <opencomputers:upgrade:20>, <rs_ctr:wire_e>], [<cd4017be_lib:m:402>, <mekanism:ingot:3>, <cd4017be_lib:m:402>]]);

# Remove simple redstone wire recipe (still left one from IE)
recipes.removeByRecipeName("cd4017be_lib:rs_ctr/wire");

# Remove unused items
rh(<cd4017be_lib:rrwi>);
rh(<cd4017be_lib:m>);