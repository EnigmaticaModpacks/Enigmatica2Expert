#modloaded mysticalcreations

# Mystical Creations Recipes
recipes.addShaped(<extendedcrafting:material:33>*3, [[<mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>],[<mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>], [<mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>]]);
recipes.addShaped(<animania:sheep_cheese_wheel>, [[<mysticalcreations:cheese_essence>, null, <mysticalcreations:cheese_essence>],[null, <mysticalcreations:cheese_essence>, null], [null, null, null]]);
recipes.addShaped(<animania:goat_cheese_wheel>, [[null, <mysticalcreations:cheese_essence>, null],[null, <mysticalcreations:cheese_essence>, null], [null, <mysticalcreations:cheese_essence>, null]]);
recipes.addShaped(<animania:jersey_cheese_wheel>, [[null, null, null],[<mysticalcreations:cheese_essence>, <mysticalcreations:cheese_essence>, <mysticalcreations:cheese_essence>], [null, null, null]]);
recipes.addShaped(<animania:holstein_cheese_wheel>, [[null, null, <mysticalcreations:cheese_essence>],[null, <mysticalcreations:cheese_essence>, null], [<mysticalcreations:cheese_essence>, null, null]]);
recipes.addShaped(<animania:friesian_cheese_wheel>, [[<mysticalcreations:cheese_essence>, null, null],[null, <mysticalcreations:cheese_essence>, null], [null, null, <mysticalcreations:cheese_essence>]]);
recipes.addShaped(Bucket("creosote"), [[null, <mysticalcreations:creosolite_essence>, null],[<mysticalcreations:creosolite_essence>, <minecraft:bucket>.noReturn(), <mysticalcreations:creosolite_essence>], [null, <mysticalcreations:creosolite_essence>, null]]);

# Add Mystical Creations processing in Insolator
scripts.process.grow(<mysticalcreations:creosolite_seeds>, <mysticalcreations:creosolite_essence> * 9, "No exceptions", <mysticalcreations:creosolite_seeds>, 1);
scripts.process.grow(<mysticalcreations:cheese_seeds>, 		<mysticalcreations:cheese_essence> * 9,      "No exceptions", <mysticalcreations:cheese_seeds>, 1);
scripts.process.grow(<mysticalcreations:ultimate_seeds>,   <mysticalcreations:ultimate_essence> * 9,   "only: Hydroponics", <mysticalcreations:ultimate_seeds>, 1);
