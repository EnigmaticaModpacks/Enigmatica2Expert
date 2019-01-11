import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded integrateddynamics
print("--- loading IntegratedDynamics.zs ---");

# *======= Recipes =======*
	
# User
	recipes.remove(<integratedtunnels:part_player_simulator_item>);
	recipes.addShapeless("IT User", 
	<integratedtunnels:part_player_simulator_item> * 2, 
	[<extrautils2:user>.anyDamage(), <extrautils2:user>.anyDamage()]);

# Menril Logs -> Planks
	recipes.addShapeless("Menril Planks", 
	<integrateddynamics:menril_planks> * 2, 
	[<integrateddynamics:menril_log>]);

# Generator
	recipes.remove(<integrateddynamics:coal_generator>);
	recipes.addShapedMirrored("IntegratedDynamics Generator", 
	<integrateddynamics:coal_generator>, 
	[[<integrateddynamics:crystalized_menril_chunk>, <ic2:te:46>, <integrateddynamics:crystalized_menril_chunk>],
	[<integrateddynamics:crystalized_menril_block>, <integrateddynamics:energy_battery>.anyDamage(), <integrateddynamics:crystalized_menril_block>], 
	[<integrateddynamics:crystalized_menril_chunk>, <ic2:te:46>, <integrateddynamics:crystalized_menril_chunk>]]);

# Mechanical Squeezer
	recipes.remove(<integrateddynamics:mechanical_squeezer>);
	recipes.addShapedMirrored("IntegratedDynamics Mechanical Squeezer", 
	<integrateddynamics:mechanical_squeezer>, 
	[[<ore:dustDiamond>, <integrateddynamics:squeezer>, <ore:dustDiamond>],
	[<integrateddynamics:energy_battery>.anyDamage(), <integrateddynamics:squeezer>, <integrateddynamics:energy_battery>.anyDamage()], 
	[<ore:plateObsidian>, <integrateddynamics:squeezer>, <ore:plateObsidian>]]);

# Mechanical Drying Basin
	recipes.remove(<integrateddynamics:mechanical_drying_basin>);
	recipes.addShapedMirrored("IntegratedDynamics Mechanical Drying Basin", 
	<integrateddynamics:mechanical_drying_basin>, 
	[[<ore:plateObsidian>, <integrateddynamics:drying_basin>, <ore:plateObsidian>],
	[<integrateddynamics:energy_battery>.anyDamage(), <integrateddynamics:drying_basin>, <integrateddynamics:energy_battery>.anyDamage()], 
	[<ore:plateObsidian>, <integrateddynamics:drying_basin>, <ore:plateObsidian>]]);

	
		print("--- IntegratedDynamics.zs initialized ---");