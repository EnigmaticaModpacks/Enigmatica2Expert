#modloaded psi


# *======= Recipes =======*
	
# CAD Assembler
	recipes.remove(<psi:cad_assembler>);
	recipes.addShaped("CAD Assembler", 
	<psi:cad_assembler>, 
	[[<ore:ingotBlackIron>, <minecraft:piston>, <ore:ingotBlackIron>],
	[<ore:ingotBlackIron>, <ore:ingotManasteel>, <ore:ingotBlackIron>], 
	[<ore:powderMana>, <ore:ingotBlackIron>, <ore:powderMana>]]);

# Spell Programmer
	recipes.remove(<psi:programmer>);
	recipes.addShaped("Spell Programmer", 
	<psi:programmer>, 
	[[<ore:ingotBlackIron>, <ore:dustPsi>, <ore:ingotBlackIron>],
	[<ore:ingotBlackIron>, null, <ore:ingotBlackIron>], 
	[<ore:ingotBlackIron>, null, <ore:ingotBlackIron>]]);

# Replication of crafting components
	mods.botania.ManaInfusion.addConjuration(<psi:material> * 2, <psi:material>, 2500);
	mods.botania.ManaInfusion.addConjuration(<psi:material:1> * 2, <psi:material:1>, 5000);
	mods.botania.ManaInfusion.addConjuration(<psi:material:2> * 2, <psi:material:2>, 10000);
	mods.botania.ManaInfusion.addConjuration(<psi:material:5> * 2, <psi:material:5>, 2500);
	mods.botania.ManaInfusion.addConjuration(<psi:material:6> * 2, <psi:material:6>, 2500);


	
	
	