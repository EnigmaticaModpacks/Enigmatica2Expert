
# Crafttweaker's functions cant see variables outside, so we need to write
#   different function for each craft




# ###################################
# Tier 1
# ###################################

recipes.addShapeless(
	"Timecraft Rabbit Foot"         /* Name of recipe */, 
	(<minecraft:rabbit_foot>*2) /* Output stack */.withLore(["Consume " ~ 
	"1 Minute"                   	     /* Tooltip text */ ~" from bottle"]), [<randomthings:timeinabottle>.marked("timeinabottle").transformNew(function(item) {return item.updateTag({timeData: {storedTime: ((!isNull(item.tag) && !isNull(item.tag.timeData) && !isNull(item.tag.timeData.storedTime)) ? (item.tag.timeData.storedTime - 
	20*60 	 	              	     /* Consumed Time (ticks) */) : 0)}});	}),
	<minecraft:rabbit_foot>     /* Input stack list [,] */], function(out, ins, cInfo) {	if(ins.timeinabottle.tag.timeData.storedTime >= 
	20*60	 	              	     /* Same as above */) { return 
	(<minecraft:rabbit_foot>*2) /* Output stack */; }	return null; },	null);


# ###################################
# Tier 2
# ###################################

recipes.addShapeless(
	"Timecraft Tiny Coin"         /* Name of recipe */, 
	(<rats:tiny_coin>*2) /* Output stack */.withLore(["Consume " ~ 
	"2 Minutes"                   	     /* Tooltip text */ ~" from bottle"]), [<randomthings:timeinabottle>.marked("timeinabottle").transformNew(function(item) {return item.updateTag({timeData: {storedTime: ((!isNull(item.tag) && !isNull(item.tag.timeData) && !isNull(item.tag.timeData.storedTime)) ? (item.tag.timeData.storedTime - 
	20*60*2 	 	              	     /* Consumed Time (ticks) */) : 0)}});	}),
	<rats:tiny_coin>     /* Input stack list [,] */], function(out, ins, cInfo) {	if(ins.timeinabottle.tag.timeData.storedTime >= 
	20*60*2	 	              	     /* Same as above */) { return 
	(<rats:tiny_coin>*2) /* Output stack */; }	return null; },	null);

recipes.addShapeless(
	"Timecraft Token Fragment"         /* Name of recipe */, 
	(<rats:token_fragment>*2) /* Output stack */.withLore(["Consume " ~ 
	"20 Minutes"                   	     /* Tooltip text */ ~" from bottle"]), [<randomthings:timeinabottle>.marked("timeinabottle").transformNew(function(item) {return item.updateTag({timeData: {storedTime: ((!isNull(item.tag) && !isNull(item.tag.timeData) && !isNull(item.tag.timeData.storedTime)) ? (item.tag.timeData.storedTime - 
	20*60*20 	 	              	     /* Consumed Time (ticks) */) : 0)}});	}),
	<rats:token_fragment>     /* Input stack list [,] */], function(out, ins, cInfo) {	if(ins.timeinabottle.tag.timeData.storedTime >= 
	20*60*20	 	              	     /* Same as above */) { return 
	(<rats:token_fragment>*2) /* Output stack */; }	return null; },	null);

recipes.addShapeless(
	"Timecraft Token Piece"         /* Name of recipe */, 
	(<rats:token_piece>*2) /* Output stack */.withLore(["Consume " ~ 
	"3 Hours and 20 Minutes"                   	     /* Tooltip text */ ~" from bottle"]), [<randomthings:timeinabottle>.marked("timeinabottle").transformNew(function(item) {return item.updateTag({timeData: {storedTime: ((!isNull(item.tag) && !isNull(item.tag.timeData) && !isNull(item.tag.timeData.storedTime)) ? (item.tag.timeData.storedTime - 
	20*60*200 	 	              	     /* Consumed Time (ticks) */) : 0)}});	}),
	<rats:token_piece>     /* Input stack list [,] */], function(out, ins, cInfo) {	if(ins.timeinabottle.tag.timeData.storedTime >= 
	20*60*200	 	              	     /* Same as above */) { return 
	(<rats:token_piece>*2) /* Output stack */; }	return null; },	null);


# ###################################
# Tier 3
# ###################################

recipes.addShapeless(
	"Timecraft Pulsating Mesh"         /* Name of recipe */, 
	(<forestry:crafting_material:1>*2) /* Output stack */.withLore(["Consume " ~ 
	"4 Hours"                   	     /* Tooltip text */ ~" from bottle"]), [<randomthings:timeinabottle>.marked("timeinabottle").transformNew(function(item) {return item.updateTag({timeData: {storedTime: ((!isNull(item.tag) && !isNull(item.tag.timeData) && !isNull(item.tag.timeData.storedTime)) ? (item.tag.timeData.storedTime - 
	20*60*60*4 	 	              	     /* Consumed Time (ticks) */) : 0)}});	}),
	<forestry:crafting_material:1>     /* Input stack list [,] */], function(out, ins, cInfo) {	if(ins.timeinabottle.tag.timeData.storedTime >= 
	20*60*60*4	 	              	     /* Same as above */) { return 
	(<forestry:crafting_material:1>*2) /* Output stack */; }	return null; },	null);



# ###################################
# Tier 4
# ###################################

recipes.addShapeless(
	"Timecraft Avatar of Ratlantis"         /* Name of recipe */, 
	(<rats:idol_of_ratlantis>*2) /* Output stack */.withLore(["Consume " ~ 
	"20 Hours"                   	     /* Tooltip text */ ~" from bottle"]), [<randomthings:timeinabottle>.marked("timeinabottle").transformNew(function(item) {return item.updateTag({timeData: {storedTime: ((!isNull(item.tag) && !isNull(item.tag.timeData) && !isNull(item.tag.timeData.storedTime)) ? (item.tag.timeData.storedTime - 
	20*60*60*20 	 	              	     /* Consumed Time (ticks) */) : 0)}});	}),
	<rats:idol_of_ratlantis>     /* Input stack list [,] */], function(out, ins, cInfo) {	if(ins.timeinabottle.tag.timeData.storedTime >= 
	20*60*60*20	 	              	     /* Same as above */) { return 
	(<rats:idol_of_ratlantis>*2) /* Output stack */; }	return null; },	null);


# ###################################
# Tier 5
# ###################################

recipes.addShapeless(
	"Timecraft wyvern_helm"         /* Name of recipe */, 
	(<draconicevolution:wyvern_helm>) /* Output stack */.withLore(["Consume " ~ 
	"2 Days"                   	     /* Tooltip text */ ~" from bottle"]), [<randomthings:timeinabottle>.marked("timeinabottle").transformNew(function(item) {return item.updateTag({timeData: {storedTime: ((!isNull(item.tag) && !isNull(item.tag.timeData) && !isNull(item.tag.timeData.storedTime)) ? (item.tag.timeData.storedTime - 
	20*60*60*24*2 	 	              	     /* Consumed Time (ticks) */) : 0)}});	}),
	<draconicevolution:draconium_capacitor:1>, <ic2:quantum_helmet:26>     /* Input stack list [,] */], function(out, ins, cInfo) {	if(ins.timeinabottle.tag.timeData.storedTime >= 
	20*60*60*24*2	 	              	     /* Same as above */) { return 
	(<draconicevolution:wyvern_helm>) /* Output stack */; }	return null; },	null);

recipes.addShapeless(
	"Timecraft wyvern_chest"         /* Name of recipe */, 
	(<draconicevolution:wyvern_chest>) /* Output stack */.withLore(["Consume " ~ 
	"2 Days"                   	     /* Tooltip text */ ~" from bottle"]), [<randomthings:timeinabottle>.marked("timeinabottle").transformNew(function(item) {return item.updateTag({timeData: {storedTime: ((!isNull(item.tag) && !isNull(item.tag.timeData) && !isNull(item.tag.timeData.storedTime)) ? (item.tag.timeData.storedTime - 
	20*60*60*24*2 	 	              	     /* Consumed Time (ticks) */) : 0)}});	}),
	<draconicevolution:draconium_capacitor:1>, <ic2:quantum_chestplate:26>     /* Input stack list [,] */], function(out, ins, cInfo) {	if(ins.timeinabottle.tag.timeData.storedTime >= 
	20*60*60*24*2	 	              	     /* Same as above */) { return 
	(<draconicevolution:wyvern_chest>) /* Output stack */; }	return null; },	null);

recipes.addShapeless(
	"Timecraft wyvern_legs"         /* Name of recipe */, 
	(<draconicevolution:wyvern_legs>) /* Output stack */.withLore(["Consume " ~ 
	"2 Days"                   	     /* Tooltip text */ ~" from bottle"]), [<randomthings:timeinabottle>.marked("timeinabottle").transformNew(function(item) {return item.updateTag({timeData: {storedTime: ((!isNull(item.tag) && !isNull(item.tag.timeData) && !isNull(item.tag.timeData.storedTime)) ? (item.tag.timeData.storedTime - 
	20*60*60*24*2 	 	              	     /* Consumed Time (ticks) */) : 0)}});	}),
	<draconicevolution:draconium_capacitor:1>, <ic2:quantum_leggings:26>     /* Input stack list [,] */], function(out, ins, cInfo) {	if(ins.timeinabottle.tag.timeData.storedTime >= 
	20*60*60*24*2	 	              	     /* Same as above */) { return 
	(<draconicevolution:wyvern_legs>) /* Output stack */; }	return null; },	null);

recipes.addShapeless(
	"Timecraft wyvern_boots"         /* Name of recipe */, 
	(<draconicevolution:wyvern_boots>) /* Output stack */.withLore(["Consume " ~ 
	"2 Days"                   	     /* Tooltip text */ ~" from bottle"]), [<randomthings:timeinabottle>.marked("timeinabottle").transformNew(function(item) {return item.updateTag({timeData: {storedTime: ((!isNull(item.tag) && !isNull(item.tag.timeData) && !isNull(item.tag.timeData.storedTime)) ? (item.tag.timeData.storedTime - 
	20*60*60*24*2 	 	              	     /* Consumed Time (ticks) */) : 0)}});	}),
	<draconicevolution:draconium_capacitor:1>, <ic2:quantum_boots:26>     /* Input stack list [,] */], function(out, ins, cInfo) {	if(ins.timeinabottle.tag.timeData.storedTime >= 
	20*60*60*24*2	 	              	     /* Same as above */) { return 
	(<draconicevolution:wyvern_boots>) /* Output stack */; }	return null; },	null);