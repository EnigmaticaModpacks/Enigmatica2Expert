#modloaded additionalcompression


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