import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
#modloaded gendustry
print("--- loading Gendustry.zs ---");
	
# *======= Recipes =======*

# Genetics Processor
	recipes.remove(<gendustry:genetics_processor>);
	recipes.addShapedMirrored("Genetics Processor", 
	<gendustry:genetics_processor> * 2, 
	[[<appliedenergistics2:material:17>, <appliedenergistics2:material:11>, <appliedenergistics2:material:17>],
	[<ore:circuitAdvanced>, <ore:materialEnderPearl>, <ore:circuitAdvanced>], 
	[<appliedenergistics2:material:17>, <appliedenergistics2:material:11>, <appliedenergistics2:material:17>]]);
	
# Environmental Processor
	recipes.remove(<gendustry:env_processor>);
	recipes.addShaped("Environmental Processor", 
	<gendustry:env_processor> * 2, 
	[[<appliedenergistics2:material:17>, <ic2:plate:4>, <appliedenergistics2:material:17>],
	[<ore:plateLapis>, <ore:plateDenseGold>, <ore:plateLapis>], 
	[<appliedenergistics2:material:17>, <ic2:plate:4>, <appliedenergistics2:material:17>]]);

# Mutagen Tank
	recipes.remove(<gendustry:mutagen_tank>);
	recipes.addShaped("Mutagen Tank", 
	<gendustry:mutagen_tank>, 
	[[<ore:plateTin>, <ore:blockGlass>, <ore:plateTin>],
	[<ore:plateTin>, <extracells:certustank>, <ore:plateTin>], 
	[<ore:plateTin>, <ore:blockGlass>, <ore:plateTin>]]);

# Upgrade Frame
	recipes.remove(<gendustry:upgrade_frame>);
	recipes.addShaped("Upgrade Frame", 
	<gendustry:upgrade_frame> * 2, 
	[[<ore:plateDenseTin>, <ore:alloyBasic>, <ore:plateDenseTin>],
	[<ore:alloyBasic>, <industrialforegoing:range_addon:*>, <ore:alloyBasic>], 
	[<ore:plateDenseTin>, <ore:alloyBasic>, <ore:plateDenseTin>]]);
	
# Power Module
	recipes.remove(<gendustry:power_module>);
	recipes.addShaped("Power Module", 
	<gendustry:power_module>, 
	[[<ore:gearBronze>, <ore:alloyBasic>, <ore:gearBronze>],
	[<ore:alloyBasic>, <mekanism:energycube>, <ore:alloyBasic>], 
	[<ore:gearBronze>, <ore:alloyBasic>, <ore:gearBronze>]]);

	print("--- Gendustry.zs initialized ---");