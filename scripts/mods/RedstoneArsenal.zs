#modloaded redstonearsenal

	recipes.remove(<redstonearsenal:tool.bow_flux>);
	recipes.addShapeless("Fluxed Box", 
	<redstonearsenal:tool.bow_flux>, 
	[
	<enderio:item_dark_steel_bow>.anyDamage(),
	<extrautils2:compoundbow>.anyDamage(),
	<enderio:item_end_steel_bow>.anyDamage(),
	<mekanism:electricbow>.anyDamage(),
	<ore:blockElectrumFlux>,
	<botania:crystalbow>.anyDamage(),
	<tconstruct:shortbow>.anyDamage(),
	<bloodmagic:sentient_bow>.anyDamage(),
	<tconstruct:crossbow>.anyDamage(),
	]);

	
	