import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded wct
print("--- loading WirelessCraftingTerminal.zs ---");

# Wireless Crafting Terminal
	recipes.remove(<wct:wct>);
	recipes.addShaped("Wireless Crafting Terminal", 
	<wct:wct>, 
	[[<ore:pearlFluix>, <appliedenergistics2:part:360>, <ore:pearlFluix>],
	[<appliedenergistics2:part:360>, <appliedenergistics2:wireless_terminal>.anyDamage(), <appliedenergistics2:part:360>], 
	[<ore:pearlFluix>, <appliedenergistics2:part:360>, <ore:pearlFluix>]]);

# Infinity Booster Card
	recipes.remove(<ae2wtlib:infinity_booster_card>);
	recipes.addShaped("Infinity Booster Card", 
	<ae2wtlib:infinity_booster_card>, 
	[[<appliedenergistics2:quantum_link>, <appliedenergistics2:material:47>, <appliedenergistics2:quantum_link>],
	[<bigreactors:minerals>, <extracells:storage.component:1>, <bigreactors:minerals>], 
	[<appliedenergistics2:quantum_link>, <appliedenergistics2:material:47>, <appliedenergistics2:quantum_link>]]);

	print("--- WirelessCraftingTerminal.zs initialized ---");