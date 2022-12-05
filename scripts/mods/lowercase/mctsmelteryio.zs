
#modloaded mctsmelteryio

# Recipes to remove 
utils.rh(<mctsmelteryio:powdered_fuel>);

# Ice balls
scripts.process.mash(<biomesoplenty:hard_ice>, <mctsmelteryio:iceball> * 8, "No Exceptions");

# Remake upgrades match Tinkers/IO crafts
remakeEx(<mctsmelteryio:upgrade:0>, [[<minecraft:dye:4>, <minecraft:dye:4>, <minecraft:dye:4>], [<ore:ingotAluminum> | <ore:ingotLead>, <minecraft:paper>, <ore:ingotAluminum> | <ore:ingotLead>], [<minecraft:dye:4>, <minecraft:dye:4>, <minecraft:dye:4>]]);
remakeEx(<mctsmelteryio:upgrade:1>, [[<ore:ingotCopper>, <ore:chest>, <ore:ingotCopper>], [<ore:chest>, <mctsmelteryio:upgrade>, <ore:chest>], [<ore:ingotCopper>, <ore:chest>, <ore:ingotCopper>]]);
remakeEx(<mctsmelteryio:upgrade:2>, [[<ore:ingotAluminum>, <ore:ingotFakeIron>, <ore:ingotAluminum>], [<ore:ingotFakeIron>, <mctsmelteryio:upgrade:1>, <ore:ingotFakeIron>], [<ore:ingotAluminum>, <ore:ingotFakeIron>, <ore:ingotAluminum>]]);
remakeEx(<mctsmelteryio:upgrade:3>, [[<ore:nuggetKnightslime>, <ore:ingotGold>, <ore:nuggetKnightslime>], [<ore:ingotGold>, <mctsmelteryio:upgrade:2>, <ore:ingotGold>], [<ore:nuggetKnightslime>, <ore:ingotGold>, <ore:nuggetKnightslime>]]);
remakeEx(<mctsmelteryio:upgrade:4>, [[<ore:nuggetManyullyn>, <ore:gemDiamondRat>, <ore:nuggetManyullyn>], [<ore:gemDiamondRat>, <mctsmelteryio:upgrade:3>, <ore:gemDiamondRat>], [<ore:nuggetManyullyn>, <ore:gemDiamondRat>, <ore:nuggetManyullyn>]]);

# Speed upgrade
remakeEx(<mctsmelteryio:upgrade:6>, [
	[<ore:gemEmerald>, <ore:listAllsugar>, <ore:gemEmerald>], 
	[<ic2:upgrade>, <mctsmelteryio:upgrade>, <ic2:upgrade>], 
	[<ore:gemEmerald>, <ore:listAllsugar>, <ore:gemEmerald>]
]);

# [Casting_Machine] from [Casting_Table][+3]
craft.remake(<mctsmelteryio:machine:1>, ["pretty",
  "□ S □",
  "i C i",
  "□ i □"], {
  "□": <ore:blockSeared>,        # Seared Stone
  "C": <tconstruct:casting>,     # Casting Table
  "S": <tconstruct:smeltery_io>, # Smeltery Drain
  "i": <ore:ice>                 # Ice
});