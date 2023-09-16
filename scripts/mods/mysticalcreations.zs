#modloaded mysticalcreations

# Mystical Creations Recipes
recipes.addShaped(<extendedcrafting:material:33>*3, [[<mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>],[<mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>], [<mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>]]);
mods.astralsorcery.Lightwell.addLiquefaction(<mysticalagriculture:starmetal_essence>, <liquid:starmetal>, 0.5, 0.2, 0x040D67);
recipes.addShaped(Bucket("creosote"), [[null, <mysticalcreations:creosolite_essence>, null],[<mysticalcreations:creosolite_essence>, <minecraft:bucket>.noReturn(), <mysticalcreations:creosolite_essence>], [null, <mysticalcreations:creosolite_essence>, null]]);
scripts.process.melt(<mysticalcreations:creosolite_essence>, <fluid:creosote> * 250);

# Add Mystical Creations processing in Insolator
scripts.process.grow(<mysticalcreations:creosolite_seeds>, <mysticalcreations:creosolite_essence> * 9, "No exceptions", <mysticalcreations:creosolite_seeds>, 1);
scripts.process.grow(<mysticalagriculture:starmetal_seeds>, 		<mysticalagriculture:starmetal_essence> * 9,      "No exceptions", <mysticalagriculture:starmetal_seeds>, 1);
