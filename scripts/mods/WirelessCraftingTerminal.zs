import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
#modloaded wct

# Infinity Booster Card
	recipes.remove(<ae2wtlib:infinity_booster_card>);
	recipes.addShaped("Infinity Booster Card", 
	<ae2wtlib:infinity_booster_card>, 
	[[<appliedenergistics2:quantum_link>, <appliedenergistics2:material:47>, <appliedenergistics2:quantum_link>],
	[<bigreactors:mineralanglesite>, <aeadditions:storage.component:1>, <bigreactors:mineralanglesite>], 
	[<appliedenergistics2:quantum_link>, <appliedenergistics2:material:47>, <appliedenergistics2:quantum_link>]]);

val wctIngrs = {
  "C": <appliedenergistics2:part:360>,     # ME Crafting Terminal
  "F": <ore:pearlFluix>,                   # Fluix Pearl
  "W": <appliedenergistics2:wireless_terminal>.withTag({}).anyDamage(), # Wireless Terminal
  "M": <appliedenergistics2:quantum_ring>, # ME Quantum Ring
  "○": <appliedenergistics2:part:520>,     # ME Fluid Terminal
  "E": <appliedenergistics2:part:480>,     # ME Interface Terminal
  "P": <appliedenergistics2:part:340>,     # ME Pattern Terminal
} as IIngredient[string];

# [Wireless Crafting Terminal] from [Wireless Terminal][+3]
craft.remake(<wct:wct>, ["pretty",
  "  C  ",
  "F W F",
  "F M F"], wctIngrs
);

# [Wireless Fluid Terminal] from [Wireless Terminal][+3]
craft.remake(<wft:wft>, ["pretty",
  "  ○  ",
  "F W F",
  "F M F"], wctIngrs
);

# [Wireless Interface Terminal] from [Wireless Terminal][+3]
craft.remake(<wit:wit>, ["pretty",
  "  E  ",
  "F W F",
  "F M F"], wctIngrs
);

# [Wireless Pattern Terminal] from [Wireless Terminal][+3]
craft.remake(<wpt:wpt>, ["pretty",
  "  P  ",
  "F W F",
  "F M F"], wctIngrs
);
