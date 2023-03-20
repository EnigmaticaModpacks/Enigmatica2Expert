#modloaded bibliocraft


# *======= Recipes =======*
	
# Bibliocraft Clipboard
	recipes.remove(<bibliocraft:biblioclipboard>);
	
# Creative Bookcase
	recipes.addShaped("Creative Bookcase Main", 
	<bibliocraft:bookcasecreative>, 
	[[<bibliocraft:bigbook>, <bibliocraft:bookcase:*>, <bibliocraft:bigbook>],
	[<bibliocraft:bigbook>, <bibliocraft:printingpress:*>, <bibliocraft:bigbook>], 
	[<bibliocraft:bigbook>, <bibliocraft:bibliodrill>, <bibliocraft:bigbook>]]);

# Switching between plank type
	recipes.addShapeless("Creative Bookcase0", <bibliocraft:bookcasecreative>, [<bibliocraft:bookcasecreative:6>]);
	recipes.addShapeless("Creative Bookcase6", <bibliocraft:bookcasecreative:6>, [<bibliocraft:bookcasecreative:5>]);
	recipes.addShapeless("Creative Bookcase5", <bibliocraft:bookcasecreative:5>, [<bibliocraft:bookcasecreative:4>]);
	recipes.addShapeless("Creative Bookcase4", <bibliocraft:bookcasecreative:4>, [<bibliocraft:bookcasecreative:3>]);
	recipes.addShapeless("Creative Bookcase3", <bibliocraft:bookcasecreative:3>, [<bibliocraft:bookcasecreative:2>]);
	recipes.addShapeless("Creative Bookcase2", <bibliocraft:bookcasecreative:2>, [<bibliocraft:bookcasecreative:1>]);
	recipes.addShapeless("Creative Bookcase1", <bibliocraft:bookcasecreative:1>, [<bibliocraft:bookcasecreative>]);

	
	
	