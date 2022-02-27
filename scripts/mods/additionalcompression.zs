#modloaded additionalcompression

# [Single Compressed Fish] from [Raw Fish]
recipes.removeByRecipeName("additionalcompression:recipe_compressedmeatfish1");
craft.shapeless(<additionalcompression:meatfish_compressed>, "fffffffff", {
  "f": <ore:listAllfishfresh>, # Raw Fish
});


# Each level of compression multiply this much
val rate = 4;

furnace.setFuel(<additionalcompression:cropsugarcane_compressed:0>, 300   * pow(rate, 1));
furnace.setFuel(<additionalcompression:cropsugarcane_compressed:1>, 300   * pow(rate, 2));
furnace.setFuel(<additionalcompression:cropsugarcane_compressed:2>, 300   * pow(rate, 3));
furnace.setFuel(<additionalcompression:cropsugarcane_compressed:3>, 300   * pow(rate, 4));
furnace.setFuel(<additionalcompression:cropsugarcane_compressed:4>, 300   * pow(rate, 5));
furnace.setFuel(<additionalcompression:rodblaze_compressed:1>,      24000 * pow(rate, 1));
furnace.setFuel(<additionalcompression:rodblaze_compressed:2>,      24000 * pow(rate, 2));
furnace.setFuel(<additionalcompression:dustsugar_compressed:1>,     200   * pow(rate, 1));
furnace.setFuel(<additionalcompression:dustsugar_compressed:2>,     200   * pow(rate, 2));
furnace.setFuel(<additionalcompression:logwood_compressed:0>,       300   * pow(rate, 1));
furnace.setFuel(<additionalcompression:logwood_compressed:1>,       300   * pow(rate, 2));
furnace.setFuel(<additionalcompression:logwood_compressed:2>,       300   * pow(rate, 3));
furnace.setFuel(<additionalcompression:coal_compressed:1>,          16000 * pow(rate, 1));
furnace.setFuel(<additionalcompression:coal_compressed:2>,          16000 * pow(rate, 2));
furnace.setFuel(<additionalcompression:charcoal_compressed:1>,      16000 * pow(rate, 1));
furnace.setFuel(<additionalcompression:charcoal_compressed:2>,      16000 * pow(rate, 2));


scripts.wrap.tconstruct.Melting.addRecipe(<liquid:stone> * (72 * pow(rate, 1)), <extrautils2:compressedcobblestone>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:stone> * (72 * pow(rate, 2)), <extrautils2:compressedcobblestone:1>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:stone> * (72 * pow(rate, 3)), <extrautils2:compressedcobblestone:2>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:stone> * (72 * pow(rate, 4)), <extrautils2:compressedcobblestone:3>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:stone> * (72 * pow(rate, 1)), <additionalcompression:stone_compressed>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:stone> * (72 * pow(rate, 2)), <additionalcompression:stone_compressed:1>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:stone> * (72 * pow(rate, 3)), <additionalcompression:stone_compressed:2>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:stone> * (72 * pow(rate, 4)), <additionalcompression:stone_compressed:3>);

scripts.wrap.tconstruct.Melting.addRecipe(<liquid:glass> * (1000 * pow(rate, 1)), <extrautils2:compressedsand>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:glass> * (1000 * pow(rate, 2)), <extrautils2:compressedsand:1>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:glass> * (1000 * pow(rate, 3)), <additionalcompression:blocksand_compressed:2>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:glass> * (1000 * pow(rate, 4)), <additionalcompression:blocksand_compressed:3>);

scripts.wrap.tconstruct.Melting.addRecipe(<liquid:clay> * (144 * pow(rate, 1)), <additionalcompression:clay_compressed>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:clay> * (144 * pow(rate, 2)), <additionalcompression:clay_compressed:1>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:clay> * (144 * pow(rate, 3)), <additionalcompression:clay_compressed:2>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:clay> * (144 * pow(rate, 4)), <additionalcompression:clay_compressed:3>);

scripts.wrap.tconstruct.Melting.addRecipe(<liquid:dirt> * (144 * pow(rate, 1)), <extrautils2:compresseddirt>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:dirt> * (144 * pow(rate, 2)), <extrautils2:compresseddirt:1>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:dirt> * (144 * pow(rate, 3)), <extrautils2:compresseddirt:2>);
scripts.wrap.tconstruct.Melting.addRecipe(<liquid:dirt> * (144 * pow(rate, 4)), <extrautils2:compresseddirt:3>);
