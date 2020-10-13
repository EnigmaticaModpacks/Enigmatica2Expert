import mods.chisel.Carving.addVariation;
#modloaded chisel

	addVariation("basalt", <quark:basalt:1>);
	addVariation("basalt", <quark:basalt>);
	addVariation("basalt", <ic2:resource>);

	addVariation("marble", <quark:marble>);

	addVariation("limestone", <quark:limestone>);
	addVariation("limestone", <quark:limestone:1>);

	addVariation("sootymarble", <astralsorcery:blockblackmarble:0>);
	addVariation("sootymarble", <astralsorcery:blockblackmarble:1>);
	addVariation("sootymarble", <astralsorcery:blockblackmarble:2>);
	addVariation("sootymarble", <astralsorcery:blockblackmarble:3>);
	addVariation("sootymarble", <astralsorcery:blockblackmarble:4>);
	addVariation("sootymarble", <astralsorcery:blockblackmarble:5>);
	addVariation("sootymarble", <astralsorcery:blockblackmarble:6>);

	addVariation("castlebrickrune", <twilightforest:castle_rune_brick:0>);
	addVariation("castlebrickrune", <twilightforest:castle_rune_brick:1>);
	addVariation("castlebrickrune", <twilightforest:castle_rune_brick:2>);
	addVariation("castlebrickrune", <twilightforest:castle_rune_brick:3>);

	addVariation("castlebrickdoor", <twilightforest:castle_door:0>);
	addVariation("castlebrickdoor", <twilightforest:castle_door:1>);
	addVariation("castlebrickdoor", <twilightforest:castle_door:2>);
	addVariation("castlebrickdoor", <twilightforest:castle_door:3>);


# Environmental Materials
for i in 0 to 16 {
	addVariation("alabaster " ~ i, <environmentalmaterials:alabaster>.definition.makeStack(i));
	addVariation("alabaster " ~ i, <environmentalmaterials:alabaster_paver>.definition.makeStack(i));
	addVariation("alabaster " ~ i, <environmentalmaterials:alabaster_bricks>.definition.makeStack(i));
	addVariation("alabaster " ~ i, <environmentalmaterials:alabaster_tiles>.definition.makeStack(i));
}

addVariation("hardened_stone", <environmentalmaterials:hardened_stone>);
addVariation("hardened_stone", <environmentalmaterials:hardened_stone_paver>);
addVariation("hardened_stone", <environmentalmaterials:hardened_stone_bricks>);
addVariation("hardened_stone", <environmentalmaterials:hardened_stone_tiles>);

# Sonar Core
val sonarColors as string[] = [
	"normal",	"lightgrey", "plain", "lime", "blue",
  "cyan", "magenta", "pink", "yellow", "purple",
  "lightblue", "green", "orange", "red", "black", "brown"];

for i in 0 to 16 {
	val col = sonarColors[i];
  addVariation("sonar " ~ col, itemUtils.getItem("sonarcore:stablestone_" ~ col));
	addVariation("sonar " ~ col, itemUtils.getItem("sonarcore:stablestonerimmed_" ~ col));
	addVariation("sonar " ~ col, itemUtils.getItem("sonarcore:stablestoneblackrimmed_" ~ col));
}
