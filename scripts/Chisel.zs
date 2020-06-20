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

# Rats
addVariation("marbledCheese", <rats:marbled_cheese>);
addVariation("marbledCheese", <rats:marbled_cheese_tile>);
addVariation("marbledCheese", <rats:marbled_cheese_chiseled>);
addVariation("marbledCheese", <rats:marbled_cheese_pillar>);
addVariation("marbledCheese", <rats:marbled_cheese_brick>);
addVariation("marbledCheese", <rats:marbled_cheese_brick_chiseled>);
addVariation("marbledCheese", <rats:marbled_cheese_brick_cracked>);

# Harder  Iron chisel
recipes.remove(<chisel:chisel_iron>);
recipes.addShaped(<chisel:chisel_iron>, [
	[null, <tcomplement:chisel_head>.withTag({Material: "iron"}).onlyWithTag({Material: "iron"})],
	[<ore:stickTreatedWood>, null]]);

# Harder diamond chisel
recipes.remove(<chisel:chisel_diamond>);
mods.tconstruct.Casting.addTableRecipe(<chisel:chisel_diamond>, <chisel:chisel_iron>, <liquid:diamond>, 666, true);

# Harder I-Chisel
recipes.remove(<chisel:chisel_hitech>);
recipes.addShapeless(<chisel:chisel_hitech>, 
	[<ore:sheetHDPE>,<ore:sheetHDPE>,<chisel:chisel_diamond>]);
