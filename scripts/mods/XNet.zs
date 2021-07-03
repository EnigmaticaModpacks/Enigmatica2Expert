#modloaded xnet

# *======= Recipes =======*

# Blue Network Cable
	recipes.remove(<xnet:netcable>);
	recipes.addShapedMirrored("XNet Network Cable", 
	<xnet:netcable> * 32, 
	[[<ore:plateLapis>, <ore:dustRedstone>, <ore:plateLapis>],
	[<ore:dustRedstone>, <ore:plateGold>, <ore:dustRedstone>], 
	[<ore:plateLapis>, <ore:dustRedstone>, <ore:plateLapis>]]);

# Routing Network Cable
	recipes.remove(<xnet:netcable:4>);
	recipes.addShapedMirrored("XNet Routing Cable", 
	<xnet:netcable:4> * 32, 
	[[<ore:plateLapis>, <ore:blockRedstone>, <ore:plateLapis>],
	[<ore:blockRedstone>, <ore:plateGold>, <ore:blockRedstone>], 
	[<ore:plateLapis>, <ore:blockRedstone>, <ore:plateLapis>]]);
	
# Blue Connector
	recipes.remove(<xnet:connector>);
	recipes.addShapedMirrored("XNet Connector1", 
	<xnet:connector> * 2, 
	[[<ore:plateLapis>, <ore:chest>, <ore:plateLapis>],
	[<ore:dustRedstone>, <ore:plateDenseGold>, <ore:dustRedstone>], 
	[<ore:plateLapis>, <ore:dustRedstone>, <ore:plateLapis>]]);
	
	recipes.addShapedMirrored("XNet Connector2", 
	<xnet:connector> * 2, 
	[[<ore:plateLapis>, <ore:chest>, <ore:plateLapis>],
	[<ore:dustRedstone>, <ore:plateDenseBronze>, <ore:dustRedstone>], 
	[<ore:plateLapis>, <ore:dustRedstone>, <ore:plateLapis>]]);
	
	recipes.addShapedMirrored("XNet Connector3", 
	<xnet:connector>, 
	[[<ore:plateLapis>, <ore:chest>, <ore:plateLapis>],
	[<ore:dustRedstone>, <ore:plateDenseCopper>, <ore:dustRedstone>], 
	[<ore:plateLapis>, <ore:dustRedstone>, <ore:plateLapis>]]);
	
	recipes.addShapedMirrored("XNet Connector4", 
	<xnet:connector>, 
	[[<ore:plateLapis>, <ore:chest>, <ore:plateLapis>],
	[<ore:dustRedstone>, <ore:plateDenseIron>, <ore:dustRedstone>], 
	[<ore:plateLapis>, <ore:dustRedstone>, <ore:plateLapis>]]);
	
	recipes.addShapedMirrored("XNet Connector5", 
	<xnet:connector>, 
	[[<ore:plateLapis>, <ore:chest>, <ore:plateLapis>],
	[<ore:dustRedstone>, <ore:plateDenseTin>, <ore:dustRedstone>], 
	[<ore:plateLapis>, <ore:dustRedstone>, <ore:plateLapis>]]);
	
	recipes.addShapedMirrored("XNet Connector6", 
	<xnet:connector>, 
	[[<ore:plateLapis>, <ore:chest>, <ore:plateLapis>],
	[<ore:dustRedstone>, <ore:plateDenseLead>, <ore:dustRedstone>], 
	[<ore:plateLapis>, <ore:dustRedstone>, <ore:plateLapis>]]);
	
	recipes.addShapedMirrored("XNet Connector7", 
	<xnet:connector> * 3, 
	[[<ore:plateLapis>, <ore:chest>, <ore:plateLapis>],
	[<ore:dustRedstone>, <ore:plateDenseSteel>, <ore:dustRedstone>], 
	[<ore:plateLapis>, <ore:dustRedstone>, <ore:plateLapis>]]);
	
# Colouring blue
	recipes.addShapeless("XNet Blue Connector", <xnet:connector>, [<xnet:connector:*>, <ore:dyeBlue>]);

# Advanced Blue Connector
	recipes.remove(<xnet:advanced_connector>);
	recipes.addShapeless("XNet Advanced Connector", <xnet:advanced_connector>, [<xnet:connector:*>, <ore:blockRedstone>, <ore:dustDiamond>, <ore:enderpearl>]);

# Colouring blue
	recipes.addShapeless("XNet Blue Advanced Connector", <xnet:advanced_connector>, [<xnet:advanced_connector:*>, <ore:dyeBlue>]);

# Connector Upgrade Kit
	recipes.remove(<xnet:connector_upgrade>);
	recipes.addShapeless("XNet Connector Upgrade Kit", <xnet:connector_upgrade>, [<ore:paper>, <ore:blockRedstone>, <ore:dustDiamond>, <ore:enderpearl>]);

# Controller
	recipes.remove(<xnet:controller>);
	recipes.addShaped("XNet Controller", 
	<xnet:controller>, 
	[[<minecraft:repeater>, <ore:plateNickel>, <minecraft:repeater>],
	[<minecraft:comparator>, <ic2:resource:12>, <minecraft:comparator>], 
	[<ore:plateBronze>, <minecraft:comparator>, <ore:plateBronze>]]);

# Router
	recipes.remove(<xnet:router>);
	recipes.addShaped("XNet Router", 
	<xnet:router>, 
	[[<minecraft:repeater>, <ore:enderpearl>, <minecraft:repeater>],
	[<minecraft:comparator>, <ic2:resource:12>, <minecraft:comparator>], 
	[<ore:plateIron>, <ore:blockRedstone>, <ore:plateIron>]]);

# Routing Connector
	recipes.remove(<xnet:connector:4>);
	recipes.addShapedMirrored("XNet Routing Connector", 
	<xnet:connector:4>, 
	[[<ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>],
	[<ore:plateNickel>, <xnet:connector:*>, <ore:plateNickel>], 
	[<ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>]]);
	
	
	