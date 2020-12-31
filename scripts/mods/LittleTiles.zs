
# Storage tiles
recipes.remove(<littletiles:ltstorageblocktile>);
recipes.addShaped(<littletiles:ltstorageblocktile>, [
	[<chisel:factory:6>, <chisel:factory:6>, <chisel:factory:6>], 
	[<chisel:factory:6>, <ore:chest>, <chisel:factory:6>], 
	[<chisel:factory:6>, <chisel:factory:6>, <chisel:factory:6>]]);

# Tools
val rod = <ore:stickTitaniumAluminide>.firstItem;
val core = <ore:ingotSuperium>.firstItem;
remakeEx(<littletiles:recipeadvanced> * 5, [[<littletiles:recipe>, null, <littletiles:recipe>],[<cd4017be_lib:m:401>, <littletiles:recipe>, <cd4017be_lib:m:401>], [<littletiles:recipe>, <mekanism:tierinstaller:1>, <littletiles:recipe>]]);
remakeEx(<littletiles:recipe> * 5, [[<computercraft:printout>, null, <computercraft:printout>],[null, <appliedenergistics2:material:39>, null], [<computercraft:printout>, null, <computercraft:printout>]]);
remakeEx(<littletiles:grabber>, [[null, <ore:itemRubber>, <ore:itemRubber>],[null, core, <ore:itemRubber>], [rod, null, null]]);
remakeEx(<littletiles:colortube>, [[null, <ore:wool>, <ore:wool>],[null, core, <ore:wool>], [rod, null, null]]);
remakeEx(<littletiles:chisel>, [[null, null, <tcomplement:chisel_head>.withTag({Material: "rubber"})],[null, core, null], [rod, null, null]]);
remakeEx(<littletiles:wrench>, [[null, rod, core],[null, rod, rod], [rod, null, null]]);
remakeEx(<littletiles:container>, [[<mekanism:slickplasticblock:12>, <mekanism:slickplasticblock:12>, <mekanism:slickplasticblock:12>],[<mekanism:slickplasticblock:12>, core, <mekanism:slickplasticblock:12>], [<mekanism:slickplasticblock:12>, <mekanism:slickplasticblock:12>, <mekanism:slickplasticblock:12>]]);
remakeEx(<littletiles:saw>, [[null, null, core],[null, rod, <ore:ingotFakeIron>], [rod, <ore:ingotFakeIron>, null]]);
remakeEx(<littletiles:hammer>, [[null, <ore:ingotFakeIron>, core],[null, rod, <ore:ingotFakeIron>], [rod, null, null]]);