import mods.chisel.Carving.addVariation;
#modloaded chisel

	addVariation("basalt", <quark:basalt:1>);
	addVariation("basalt", <quark:basalt>);
	addVariation("basalt", <ic2:resource>);

	addVariation("limestone", <quark:limestone>);
	addVariation("limestone", <quark:limestone:1>);

# All the Marble chisel unification!
	mods.chisel.Carving.removeGroup("astralsorcery:blockmarble_1");
	mods.chisel.Carving.removeGroup("marble");
	mods.chisel.Carving.removeGroup("sooty_marble");
for i in 0 to 7 {
	addVariation("astralsorcery:blockblackmarble_1", <astralsorcery:blockblackmarble>.definition.makeStack(i));
	}

	mods.chisel.Carving.addGroup("marble_AS_UCW");
for i in 0 to 7 {
	addVariation("marble_AS_UCW", <astralsorcery:blockmarble>.definition.makeStack(i));
}
for i in 0 to 16 {
	addVariation("marble_AS_UCW", <unlimitedchiselworks:chisel_stonebrick_astralsorcery_blockmarble_1>.definition.makeStack(i));
	}
for i in 0 to 10 {
	addVariation("marble_AS_UCW", <unlimitedchiselworks:chisel_stonebrick1_astralsorcery_blockmarble_1>.definition.makeStack(i));
	addVariation("marble_AS_UCW", <unlimitedchiselworks:chisel_stonebrick2_astralsorcery_blockmarble_1>.definition.makeStack(i));
	}

	mods.chisel.Carving.addGroup("marble_Chisel_Quark");
	addVariation("marble_Chisel_Quark", <chisel:marble2:7>);
for i in 0 to 16 {
	addVariation("marble_Chisel_Quark", <chisel:marble>.definition.makeStack(i));
	addVariation("marble_Chisel_Quark", <chisel:marblepillar>.definition.makeStack(i));
}
for i in 0 to 10 {
	addVariation("marble_Chisel_Quark", <chisel:marble1>.definition.makeStack(i));
}
for i in 0 to 7 {
	addVariation("marble_Chisel_Quark", <chisel:marble2>.definition.makeStack(i));
}
	addVariation("marble_Chisel_Quark", <quark:marble>);
	addVariation("marble_Chisel_Quark", <quark:marble:1>);
	addVariation("marble_Chisel_Quark", <quark:world_stone_bricks:4>);
	addVariation("marble_Chisel_Quark", <quark:world_stone_carved:4>);
	addVariation("marble_Chisel_Quark", <quark:world_stone_pavement:4>);

	recipes.addShapeless("Marble AS to Chisel", <chisel:marble2:7>, [<astralsorcery:blockmarble>]);
	recipes.addShapeless("Marble Chisel to AS", <astralsorcery:blockmarble>, [<chisel:marble2:7>]);

# Twilight Forest
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
	addVariation("environmentalmaterials:alabaster_bricks_" ~ i, <environmentalmaterials:alabaster>.definition.makeStack(i));
	addVariation("environmentalmaterials:alabaster_bricks_" ~ i, <environmentalmaterials:alabaster_paver>.definition.makeStack(i));
	addVariation("environmentalmaterials:alabaster_bricks_" ~ i, <environmentalmaterials:alabaster_bricks>.definition.makeStack(i));
	addVariation("environmentalmaterials:alabaster_bricks_" ~ i, <environmentalmaterials:alabaster_tiles>.definition.makeStack(i));
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
