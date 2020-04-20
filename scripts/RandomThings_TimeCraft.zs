
# Crafttweaker's functions cant see variables outside, so we need to write
#   different function for each craft


# Some replications with time
recipes.addShapeless(
	"Timecraft Pulsating Mesh"         /* Name of recipe */, 
	(<forestry:crafting_material:1>*2) /* Output stack */.withLore(["Consume " ~ 
	"4 Hours"                   	     /* Tooltip text */ ~" from bottle"]), [<randomthings:timeinabottle>.marked("timeinabottle").transformNew(function(item) {return item.updateTag({timeData: {storedTime: item.tag.timeData.storedTime - 
	20*60*60*4 	 	              	     /* Consumed Time (ticks) */}});	}),
	<forestry:crafting_material:1>     /* Input stack list [,] */], function(out, ins, cInfo) {	if(ins.timeinabottle.tag.timeData.storedTime >= 
	20*60*60*4	 	              	     /* Same as above */) { return 
	(<forestry:crafting_material:1>*2) /* Output stack */; }	return null; },	null);

