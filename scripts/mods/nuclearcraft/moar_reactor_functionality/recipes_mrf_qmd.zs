#norun
/*
Copyright Bob Bartsch, 2023

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#modloaded qmd

mods.nuclearcraft.Centrifuge.removeRecipeWithInput(<fluid:compressed_air> * 10000);
mods.nuclearcraft.Centrifuge.addRecipe(<fluid:compressed_air> * 10000, <fluid:nitrogen> * 7800, <fluid:oxygen> * 2100, <fluid:argon> * 90, <fluid:carbon_dioxide> * 4, <fluid:liquid_air> * 6, null, 0.25, 1.0, 0.0);
mods.nuclearcraft.Centrifuge.addRecipe(<fluid:liquid_air> * 10000, <fluid:neon> * 7240, <fluid:helium> * 2090, <fluid:krypton> * 450, <fluid:hydrogen> * 215, <fluid:xenon> * 5, null, 0.25, 1.0, 0.0);

mods.nuclearcraft.Enricher.addRecipe(<minecraft:netherrack>, <fluid:compressed_air> * 1000, <fluid:nether_air> * 1000);
mods.nuclearcraft.Enricher.addRecipe(<minecraft:end_stone>, <fluid:compressed_air> * 1000, <fluid:end_air> * 1000);

// more airs
if (oreDict in 'QuantumTraverseHowCanYouPossiblyNotBeDoneYetWithTheStrangeNamingSystem') { // MRE compatability
  mods.nuclearcraft.Centrifuge.addRecipe(<fluid:nether_air> * 10000, <fluid:exhaust_steam> * 6500, <fluid:carbon_dioxide> * 2000, <fluid:hydrogen_sulfide> * 1000, <fluid:nitrogen> * 400, <fluid:hydrochloric_acid> * 90, <fluid:hydrofluoric_acid> * 10, 0.25, 1.0, 0.0);
}
else {
  mods.nuclearcraft.Centrifuge.addRecipe(<fluid:nether_air> * 10000, <fluid:exhaust_steam> * 6500, <fluid:carbon_dioxide> * 2000, <fluid:sulfur_dioxide> * 1000, <fluid:nitrogen> * 400, <fluid:hydrochloric_acid> * 90, <fluid:hydrofluoric_acid> * 10, 0.25, 1.0, 0.0);
}

mods.nuclearcraft.Centrifuge.addRecipe(<fluid:end_air> * 16000, <fluid:nitrogen> * 12580, <fluid:oxygen> * 3360, <fluid:ammonia> * 44, <fluid:carbon_dioxide> * 7, <fluid:liquid_air> * 8, <fluid:ender> * 1, 0.25, 1.0, 0.0);
